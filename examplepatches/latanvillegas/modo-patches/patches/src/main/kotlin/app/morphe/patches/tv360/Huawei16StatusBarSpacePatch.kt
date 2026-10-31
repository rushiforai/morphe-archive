package app.morphe.patches.tv360

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val HUAWEI16_STATUS_OWNER = "Lcom/viettel/tv360/ui/home/HomeBoxActivity;"
private const val HUAWEI16_STATUS_VISIBILITY_SETTER = "Landroid/view/View;->setSystemUiVisibility(I)V"
private const val HUAWEI16_STATUS_LAYOUT_HELPER =
    "$HUAWEI16_STATUS_OWNER->morpheHuawei16KeepTopLayout(Landroid/view/View;I)V"
private const val HUAWEI16_STATUS_VISIBILITY_LISTENER =
    "Lcom/viettel/tv360/ui/home/HomeBoxActivity\$d0;"
private const val HUAWEI16_STATUS_VISIBILITY_RESET =
    "Lcom/viettel/tv360/ui/home/HomeBoxActivity\$h0\$a;"

/**
 * Optional companion to Hide Status Bar for the Huawei-distributed 1.6 APK.
 *
 * FLAG_FULLSCREEN removes the Android status bar, but a legacy decor may
 * continue requesting its reserved top area. Add only LAYOUT_FULLSCREEN
 * (0x400) and LAYOUT_STABLE (0x100) to existing decor UI flags. Preserve
 * these flags at two locally observed 1.6 UI reset callsites: the d0
 * visibility listener and h0.a delayed player-state reset.
 *
 * Intentionally does NOT set LAYOUT_HIDE_NAVIGATION or
 * Window.setDecorFitsSystemWindows(false), which could push app buttons
 * behind the bottom system navigation area. App-owned spacer views or
 * hard-coded margins require a separate, evidence-based resource audit.
 */
@Suppress("unused")
val tv360Huawei16ExpandStatusBarSpacePatch = bytecodePatch(
    name = "TV360 Bitel 1.6 - Expand Behind Status Bar",
    description = "Preserves top-edge layout across two TV360 UI resets; does not move content behind bottom navigation.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))
    dependsOn(tv360Huawei16HideStatusBarPatch)

    execute {
        val home = mutableClassDefBy(HUAWEI16_STATUS_OWNER)
        val helper = home.methods.singleOrNull {
            it.name == "morpheHuawei16HideStatusBar" &&
                it.parameterTypes == listOf("Landroid/app/Activity;")
        } ?: throw PatchException("Huawei 1.6 insets: expected hide-status-bar helper")
        val code = helper.implementation?.instructions?.toList()
            ?: throw PatchException("Huawei 1.6 insets: helper lacks code")
        val ends = code.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (ends.size != 1 || helper.implementation!!.registerCount != 3) {
            throw PatchException("Huawei 1.6 insets: unexpected helper shape")
        }
        helper.addInstructions(
            ends.single(),
            """
            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v0
            invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
            move-result-object v0
            invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I
            move-result v1
            or-int/lit16 v1, v1, 0x500
            invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V
            """.trimIndent(),
        )
        // These are the two HomeBoxActivity nested classes observed in the
        // read-only Huawei 1.6 APK audit. Keep the app's chosen flags and only
        // OR the top layout bits; no bottom navigation/insets modifications.
        if (home.methods.any { it.name == "morpheHuawei16KeepTopLayout" }) {
            throw PatchException("Huawei 1.6 insets: layout helper already defined")
        }
        val keepTopLayout = ImmutableMethod(
            HUAWEI16_STATUS_OWNER,
            "morpheHuawei16KeepTopLayout",
            listOf(
                ImmutableMethodParameter("Landroid/view/View;", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        keepTopLayout.addInstructions(
            0,
            """
            or-int/lit16 p1, p1, 0x500
            invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V
            return-void
            """.trimIndent(),
        )
        home.methods.add(keepTopLayout)

        // Replace exactly one virtual setter in each audited method.
        // Same number of argument words and same instruction width (35c/3rc).
        // Fail closed if another APK variant changes either site.
        for ((owner, methodName, parameters) in listOf(
            Triple(HUAWEI16_STATUS_VISIBILITY_LISTENER, "onSystemUiVisibilityChange", listOf("I")),
            Triple(HUAWEI16_STATUS_VISIBILITY_RESET, "run", emptyList<String>()),
        )) {
            val method = Fingerprint(
                definingClass = owner,
                name = methodName,
                returnType = "V",
                parameters = parameters,
            ).method
            val code = method.implementation?.instructions?.toList()
                ?: throw PatchException("Huawei 1.6 insets: $owner->$methodName has no code")
            val sites = code.withIndex().filter { (_, instruction) ->
                instruction.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                        HUAWEI16_STATUS_VISIBILITY_SETTER
            }
            if (sites.size != 1) {
                throw PatchException(
                    "Huawei 1.6 insets: expected one visibility reset in $owner->$methodName, found ${sites.size}"
                )
            }
            val (index, instruction) = sites.single()
            val replacement = when (instruction.opcode) {
                Opcode.INVOKE_VIRTUAL -> {
                    val args = instruction as? FiveRegisterInstruction
                        ?: throw PatchException("Huawei 1.6 insets: invalid 35c in $owner")
                    if (args.registerCount != 2) {
                        throw PatchException("Huawei 1.6 insets: expected View+int in $owner")
                    }
                    "invoke-static {v${args.registerC}, v${args.registerD}}, $HUAWEI16_STATUS_LAYOUT_HELPER"
                }
                Opcode.INVOKE_VIRTUAL_RANGE -> {
                    val args = instruction as? RegisterRangeInstruction
                        ?: throw PatchException("Huawei 1.6 insets: invalid 3rc in $owner")
                    if (args.registerCount != 2) {
                        throw PatchException("Huawei 1.6 insets: expected two words in $owner")
                    }
                    "invoke-static/range {v${args.startRegister} .. v${args.startRegister + 1}}, $HUAWEI16_STATUS_LAYOUT_HELPER"
                }
                else -> throw PatchException("Huawei 1.6 insets: unsupported invoke in $owner")
            }
            method.replaceInstruction(index, replacement)
        }
    }
}
