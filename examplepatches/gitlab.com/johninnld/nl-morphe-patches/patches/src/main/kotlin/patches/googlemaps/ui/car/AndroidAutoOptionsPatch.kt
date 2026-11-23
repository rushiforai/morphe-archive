package org.ungoogled.patches.maps.ui.car

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.ungoogled.patches.maps.ui.SHAPES
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

/**
 * Car-side features that Google ships switched off, exposed as an "Android Auto" page in the
 * extension's Customization screen and read **at runtime**.
 *
 * Every switch is a `Shapes` boolean that `Shapes.wrap` refreshes from preferences at each Activity
 * attach, the same rail `HIDE_ADS` uses. The patch installs a read where the value is consumed:
 *
 * - satellite switches: Maps' own settings getter is `settings.V(bace.<flag>, false)`. Replacing the
 *   literal `false` with `sget-boolean vX, Shapes->CAR_SATELLITE:Z` keeps it a fallback, so a value
 *   the user set in Maps still wins, and no restart is needed to change it.
 * - navatar: the controller's private guard decides whether a car screen may see the avatar. A runtime
 *   test in front of it keeps Google's behaviour when the switch is off.
 *
 * These are convenience switches, not new capabilities: satellite imagery still needs the server
 * tiles the app already requests, navatars still need the model assets Maps fetched for the account,
 * and none of this touches Maps' entitlement checks.
 */
@Suppress("unused")
val androidAutoOptionsPatch = bytecodePatch(
    name = "Android Auto options",
    description = "Adds an Android Auto page to the Customization screen: satellite view in the car, " +
        "restoring satellite view on startup, and keeping your navatar on car screens. All three are read " +
        "live, so changing one takes effect without repatching, and Maps' own settings stay the fallback. " +
        "Nothing here changes Maps' entitlements or downloads extra content.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // The switches live in the extension and are read from its Shapes class.
    dependsOn(sharedExtensionPatch)

    execute {
        markPatched("carOptionsPatched")

        /**
         * Replace the literal `false` of `settings.V(bace.<field>, false)` with a read of the Shapes
         * switch, at every site. Returns how many sites changed.
         */
        fun readSwitchAtDefaultSites(field: String, shapesField: String): Int {
            var changed = 0
            classDefForEach { classDef ->
                if (classDef.type.startsWith("Lorg/ungoogled/")) return@classDefForEach
                for (method in classDef.methods) {
                    val code = method.implementation?.instructions?.toList() ?: continue
                    val sites = mutableListOf<Int>()
                    for (i in 1 until code.size - 1) {
                        val read = code[i - 1] as? ReferenceInstruction ?: continue
                        if (read.opcode != Opcode.SGET_OBJECT) continue
                        val flag = read.reference as? FieldReference ?: continue
                        if (flag.definingClass != "Lbace;" || flag.name != field) continue
                        val literal = code[i]
                        if (literal.opcode != Opcode.CONST_4) continue
                        if ((literal as NarrowLiteralInstruction).narrowLiteral != 0) continue
                        val call = code[i + 1] as? ReferenceInstruction ?: continue
                        if (call.opcode != Opcode.INVOKE_INTERFACE) continue
                        val getter = call.reference as? MethodReference ?: continue
                        if (getter.definingClass != "Lbabo;" || getter.name != "V") continue
                        if (getter.parameterTypes.map(CharSequence::toString) != listOf("Lbabv;", "Z")) continue
                        sites += i
                    }
                    if (sites.isEmpty()) continue
                    val mutable = mutableClassDefBy(classDef.type).methods.single {
                        it.name == method.name && it.returnType == method.returnType &&
                            it.parameterTypes.map(CharSequence::toString) ==
                            method.parameterTypes.map(CharSequence::toString)
                    }
                    for (index in sites.asReversed()) {
                        val register = (code[index] as OneRegisterInstruction).registerA
                        mutable.replaceInstruction(index, "sget-boolean v$register, $SHAPES->$shapesField:Z")
                        changed++
                    }
                }
            }
            return changed
        }

        val satellite = readSwitchAtDefaultSites("fW", "CAR_SATELLITE") // car_satellite
        if (satellite == 0) throw PatchException("car satellite setting has no read site any more")
        val startup = readSwitchAtDefaultSites("N", "SATELLITE_STARTUP") // satellite_on_at_startup
        if (startup == 0) throw PatchException("satellite-on-startup setting has no read site any more")
        println("Android Auto options: runtime switches at $satellite car-satellite and $startup startup sites")

        // The navatar controller's private guard, 26.47 Lvot; / 26.44 Lvok;. The guard takes the mode,
        // so it always has a local register for the switch.
        val guard = listOf("Lvot;" to "Lckmg;", "Lvok;" to "Lckbl;").firstNotNullOfOrNull { (owner, mode) ->
            runCatching {
                mutableClassDefBy(owner).methods.single {
                    it.name == "u" && it.parameterTypes.map(CharSequence::toString) == listOf(mode) &&
                        it.returnType == "Z"
                }
            }.getOrNull()?.let { owner to it }
        } ?: throw PatchException("the Android Auto navatar guard has no known read site")
        val method = guard.second
        if (method.implementation!!.registerCount - method.parameterTypes.size - 1 < 1) {
            throw PatchException("${guard.first} navatar guard has no local register")
        }
        val original = method.getInstruction(0)
        method.addInstructionsWithLabels(
            0,
            """
                sget-boolean v0, $SHAPES->NAVATAR_KEEP:Z
                if-eqz v0, :keep_native
                const/4 v0, 0x0
                return v0
            """,
            ExternalLabel("keep_native", original),
        )
        println("Android Auto options: navatar switch at ${guard.first}")
    }
}
