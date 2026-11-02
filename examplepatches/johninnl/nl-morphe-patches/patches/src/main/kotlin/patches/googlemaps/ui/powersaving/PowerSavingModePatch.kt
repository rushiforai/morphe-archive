package org.ungoogled.patches.maps.ui.powersaving

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.ungoogled.patches.maps.ui.activityContextHookPatch
import org.ungoogled.patches.maps.ui.customization.customizationScreenPatch
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.navzoom.navigationCameraHookPatch
import org.ungoogled.patches.maps.ui.refreshrate.frameRateHookPatch
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

/** org.ungoogled.ui.PowerSaving, the extension half: stands in for Pixel's SystemUI. */
private const val POWER_SAVING = "Lorg/ungoogled/ui/PowerSaving;"

/** The account sheet row's listener: opens Power Saving Options with the sheet left open behind it. */
private const val OPEN_POWER = "Lorg/ungoogled/ui/CustomizationActivity\$OpenPower;"
/** Builds the row's icon from [BATTERY_ICON]. */
private const val POWER_ROW_ICON = "Lorg/ungoogled/ui/CustomizationActivity;->powerRowIcon(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;"
/** drawable/gs_battery_full_fill1_vd_theme_24 in this build: Maps' solid battery, the row's icon is cut from it. */
private const val BATTERY_ICON = 0x7f0804f6

/** Maps' own power saving screen. Its name is not obfuscated. */
private const val MIN_MODE_ACTIVITY = "Lcom/google/android/apps/gmm/features/minmode/MinModeActivity;"

/**
 * Pixel's device check: whether com.android.systemui ships
 * config_minmode_enabled. False on every other phone. The resource name occurs once.
 */
private object MinModeDeviceCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("config_minmode_enabled")),
)

/**
 * Where Maps arms or disarms min mode: writes "minModeOn" to SystemUI's
 * min-mode provider and, when arming, hands it a binder ("minmode_binder" via
 * "setBinder"). Called when navigation starts with Power saving mode on, and
 * again when it ends, the setting goes off or the window shrinks.
 */
private object MinModeArmFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(string("minModeOn"), string("minmode_binder"), string("setBinder")),
)

/**
 * The speedometer's dump (SpeedLimitManager), which prints the speed limit it holds
 * right after reading it: "speedLimit: " + state.limit.
 */
private object SpeedLimitDumpFingerprint : Fingerprint(
    filters = listOf(string("speedLimit: "), string("currentAverageSpeed: ")),
)

@Suppress("unused")
val powerSavingModePatch = bytecodePatch(
    name = "Power saving mode",
    description = "Brings the Pixel-only power saving mode to every phone: while driving with navigation, " +
        "press the power button and Maps shows only key information such as the next turn on a black " +
        "screen. Turn it on or off in Settings > Navigation > Power saving mode. Pixels that have it " +
        "built in keep Google's own version unless Power saving mode is turned on in Power Saving Options, a " +
        "row on the account sheet under Customization, which also has: a navigation button that opens the power saving " +
        "screen without locking the phone, switching to it by itself when idle, a speedometer on it, a " +
        "lower frame rate, and its black map in navigation or all over Maps.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // The options' switches are refreshed at every Activity attach; the navigation button,
    // idle switch and frame rate run on the shared navigation and frame rate hooks.
    // Power Saving Options is a page of the Customization screen.
    dependsOn(sharedExtensionPatch, activityContextHookPatch, navigationCameraHookPatch, frameRateHookPatch, customizationScreenPatch)

    execute {
        markPatched("powerSavingPatched")

        // 1. Availability. In 26.43.05 the old static boolean check has been inlined
        // into Dagger's boxed provider (nji.a, case 1300). Return TRUE only inside
        // that case, before its server-flag test and before its synchronized device
        // cache. A method-wide override would corrupt every other Dagger provider.
        val check = MinModeDeviceCheckFingerprint.method
        val callers = mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lorg/ungoogled/")) return@classDefForEach
            for (method in classDef.methods) {
                val calls = method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref != null && ref.definingClass == check.definingClass && ref.name == check.name &&
                        ref.returnType == "Z" && ref.parameterTypes.isEmpty()
                } ?: false
                if (calls) callers += method
            }
        }
        val availability = callers.singleOrNull()
            ?: throw PatchException("expected one caller of the min-mode device check, found ${callers.size}")
        if (availability.returnType != "Ljava/lang/Object;" || availability.parameterTypes.isNotEmpty() ||
            AccessFlags.STATIC.isSet(availability.accessFlags)) {
            throw PatchException("min-mode availability is no longer a boxed Dagger provider")
        }
        mutableClassDefBy(availability.definingClass).methods
            .single { it.name == availability.name && it.returnType == availability.returnType && it.parameterTypes.isEmpty() }
            .apply {
                val instructions = implementation!!.instructions.toList()
                val call = instructions.indexOfFirst { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref != null && ref.definingClass == check.definingClass && ref.name == check.name && ref.returnType == "Z" && ref.parameterTypes.isEmpty()
                }
                val gate = (call - 1 downTo maxOf(0, call - 40)).singleOrNull { i ->
                    instructions[i].opcode == Opcode.IGET_BOOLEAN &&
                        ((instructions[i] as ReferenceInstruction).reference as FieldReference).let { it.definingClass == "Lcfqb;" && it.name == "bm" && it.type == "Z" }
                } ?: throw PatchException("min-mode provider no longer gates the device check with cfqb.bm")
                // The following zero initialization makes this local dead at the gate.
                // Use it as scratch so the original flag's receiver/register is preserved.
                val zero = instructions.getOrNull(gate + 1)
                    ?: throw PatchException("min-mode provider has no scratch initialization")
                if (zero.opcode != Opcode.CONST_4 || (zero as NarrowLiteralInstruction).narrowLiteral != 0 ||
                    instructions[gate].location.labels.isNotEmpty()) {
                    throw PatchException("min-mode provider's server gate changed shape")
                }
                val scratch = (zero as OneRegisterInstruction).registerA
                if (scratch == (instructions[gate] as TwoRegisterInstruction).registerB || scratch > 15) {
                    throw PatchException("min-mode provider's scratch register is not free")
                }
                addInstructionsWithLabels(
                    gate,
                    """
                        invoke-static {}, $POWER_SAVING->forceAvailable()Z
                        move-result v$scratch
                        if-eqz v$scratch, :google_check
                        sget-object v$scratch, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                        return-object v$scratch
                    """,
                    ExternalLabel("google_check", implementation!!.instructions[gate]),
                )
            }

        // 2. Arming. Let the extension know, so it can take SystemUI's part: open the
        //    power saving screen when the power button turns the screen off.
        MinModeArmFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $POWER_SAVING->armed(Z)V",
        )

        // 3. The power saving screen wakes the display over the lock screen and keeps it
        //    on, which Pixel's SystemUI would otherwise arrange. Right after super.onCreate.
        mutableClassDefBy(MIN_MODE_ACTIVITY).methods
            .single { it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;") }
            .apply {
                // invoke-super/range here: `this` is v18, beyond the short form's reach.
                val superCall = implementation!!.instructions.indexOfFirst { insn ->
                    (insn.opcode == Opcode.INVOKE_SUPER || insn.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                        ((insn as ReferenceInstruction).reference as MethodReference).name == "onCreate"
                }
                if (superCall < 0) throw PatchException("MinModeActivity.onCreate no longer calls super.onCreate")
                addInstructions(
                    superCall + 1,
                    "invoke-static/range { p0 .. p0 }, $POWER_SAVING->onMinModeCreate(Landroid/app/Activity;)V",
                )
            }

        // 4. Speedometer: the speed limit Maps' own speedometer is showing. Its dump reads
        //    the limit field just before printing "speedLimit: "; the one method that
        //    stores into that field takes (limit, units) -- the speedometer's setter, run
        //    for every location update while navigating. The extension gets both first.
        val limitField = SpeedLimitDumpFingerprint.let { fp ->
            val instructions = fp.method.implementation!!.instructions.toList()
            val label = fp.instructionMatches.first().index
            (label - 1 downTo 0).map { instructions[it] }.firstOrNull { insn ->
                insn.opcode == Opcode.IGET && ((insn as ReferenceInstruction).reference as FieldReference).type == "I"
            }?.let { (it as ReferenceInstruction).reference as FieldReference }
                ?: throw PatchException("speedometer dump no longer reads the speed limit before printing it")
        }
        val limitSetters = mutableListOf<Pair<String, com.android.tools.smali.dexlib2.iface.Method>>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lorg/ungoogled/")) return@classDefForEach
            for (method in classDef.methods) {
                if (method.returnType != "V" || method.parameterTypes.size != 2 || method.parameterTypes[0].toString() != "I") continue
                if (AccessFlags.STATIC.isSet(method.accessFlags)) continue
                val stores = method.implementation?.instructions?.any { insn ->
                    insn.opcode == Opcode.IPUT && ((insn as ReferenceInstruction).reference as FieldReference).let { f ->
                        f.definingClass == limitField.definingClass && f.name == limitField.name && f.type == "I"
                    }
                } ?: false
                if (stores) limitSetters += classDef.type to method
            }
        }
        val (setterType, setter) = limitSetters.singleOrNull()
            ?: throw PatchException("expected one speed limit setter, found ${limitSetters.size}")
        mutableClassDefBy(setterType).methods
            .single { it.name == setter.name && it.returnType == "V" &&
                it.parameterTypes.map { t -> t.toString() } == setter.parameterTypes.map { t -> t.toString() } }
            .addInstructions(0, "invoke-static/range { p1 .. p2 }, $POWER_SAVING->speedLimit(ILjava/lang/Object;)V")

        // 5. Power saving theme everywhere: the power saving screen's black map is one of
        //    Maps' base styles (NAVIGATION_MIN_MODE, and _AUTO while driving), picked by the
        //    map's style chooser when its "min mode" flag is set -- which MinModeActivity
        //    does while it shows. The flag goes through the extension on its way into that
        //    decision. Found from the style enum's own constant names: the chooser is the one
        //    method returning that enum which reads both min-mode constants.
        val styles = mutableListOf<Triple<String, String, String>>()   // enum, NAVIGATION_MIN_MODE, _AUTO
        classDefForEach { classDef ->
            val clinit = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: return@classDefForEach
            val instructions = clinit.implementation?.instructions?.toList() ?: return@classDefForEach
            fun constantAfter(name: String): String? {
                val at = instructions.indexOfFirst { insn ->
                    (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
                        ((insn as ReferenceInstruction).reference as StringReference).string == name
                }
                if (at < 0) return null
                val store = instructions.drop(at).firstOrNull { insn ->
                    insn.opcode == Opcode.SPUT_OBJECT && ((insn as ReferenceInstruction).reference as FieldReference).let { f ->
                        f.definingClass == classDef.type && f.type == classDef.type
                    }
                } ?: return null
                return ((store as ReferenceInstruction).reference as FieldReference).name
            }
            val minMode = constantAfter("NAVIGATION_MIN_MODE") ?: return@classDefForEach
            val minModeAuto = constantAfter("NAVIGATION_MIN_MODE_AUTO") ?: return@classDefForEach
            styles += Triple(classDef.type, minMode, minModeAuto)
        }
        val choosers = mutableListOf<Pair<Triple<String, String, String>, com.android.tools.smali.dexlib2.iface.Method>>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (method.parameterTypes.isNotEmpty()) continue
                val style = styles.firstOrNull { it.first == method.returnType } ?: continue
                val reads = method.implementation?.instructions?.mapNotNull { insn ->
                    if (insn.opcode != Opcode.SGET_OBJECT) null
                    else ((insn as ReferenceInstruction).reference as FieldReference).takeIf { it.definingClass == style.first }?.name
                }.orEmpty()
                if (style.second in reads && style.third in reads) choosers += style to method
            }
        }
        val (style, chooserMethod) = choosers.singleOrNull()
            ?: throw PatchException("expected one map style chooser, found ${choosers.size}")
        mutableClassDefBy(chooserMethod.definingClass).methods
            .single { it.name == chooserMethod.name && it.parameterTypes.isEmpty() && it.returnType == style.first }
            .apply {
                // `if (minMode) return driving ? NAVIGATION_MIN_MODE_AUTO : NAVIGATION_MIN_MODE`:
                // the two tests right before the _AUTO constant are driving, then min mode,
                // and both flags are read from fields just before the first test.
                val instructions = implementation!!.instructions.toList()
                val auto = instructions.indexOfFirst { insn ->
                    insn.opcode == Opcode.SGET_OBJECT && ((insn as ReferenceInstruction).reference as FieldReference).let { f ->
                        f.definingClass == style.first && f.name == style.third
                    }
                }
                val tests = (auto - 1 downTo 0).filter { instructions[it].opcode == Opcode.IF_EQZ }.take(2)
                if (tests.size < 2) throw PatchException("map style chooser no longer tests min mode before its style")
                val driving = (instructions[tests[0]] as OneRegisterInstruction).registerA
                val minMode = (instructions[tests[1]] as OneRegisterInstruction).registerA
                fun readOf(register: Int) = (tests[1] - 1 downTo 0).firstOrNull { i ->
                    instructions[i].opcode == Opcode.IGET_BOOLEAN && (instructions[i] as TwoRegisterInstruction).registerA == register
                } ?: throw PatchException("map style chooser's flag in v$register is no longer a field read")
                if (driving == minMode) throw PatchException("map style chooser changed")
                readOf(driving)
                readOf(minMode)
                if (driving > 15 || minMode > 15) throw PatchException("map style chooser's flags are out of reach")
                // A branch landing on the test would skip whatever goes in front of it.
                if (implementation!!.instructions[tests[1]].location.labels.isNotEmpty()) {
                    throw PatchException("map style chooser's min mode test is a branch target")
                }
                // At the min mode test itself: both flags are read by then.
                addInstructions(
                    tests[1],
                    """
                        invoke-static { v$minMode, v$driving }, $POWER_SAVING->minModeStyle(ZZ)Z
                        move-result v$minMode
                    """,
                )
            }
    }

    // A "Power Saving Options" row on the account sheet, right under Customization and so above
    // Local saved. In finalize, after every patch has run, so the sheet's other rows of ours are
    // in place whichever order the patches ran in.
    finalize {
        val rowHolder = mutableClassDefBy("Lolm;")
        val template = rowHolder.methods.single { it.name == "a" && it.returnType == "Lbqxa;" && it.parameterTypes.isEmpty() }
        val templateRefs = template.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        listOf(
            "Lolm;->a:Lnwm;", "Lgej;->aF(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;",
            "Lbqxa;->a()Lbqwy;", "Lbqwy;->c(I)V", "Lbqwy;->d(Ljava/lang/String;)V", "Lbqwy;->f(I)V",
            "Lbqwy;->e(Landroid/view/View\$OnClickListener;)V", "Lbqwx;->d:Lbqwx;", "Lbqwy;->a()Lbqxa;",
        ).forEach { if (it !in templateRefs) throw PatchException("account sheet row builder no longer uses $it") }
        // Built like the Customization row; its action id must be unique on the sheet too.
        rowHolder.methods.add(
            ImmutableMethod(
                rowHolder.type, "uaPowerRow", emptyList(), "Lbqxa;",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(6),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        iget-object v0, p0, Lolm;->a:Lnwm;
                        const v1, $BATTERY_ICON
                        invoke-static { v0, v1 }, Lgej;->aF(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
                        move-result-object v1
                        invoke-static { v1 }, $POWER_ROW_ICON
                        move-result-object v1
                        invoke-static { }, Lbqxa;->a()Lbqwy;
                        move-result-object v3
                        invoke-static { }, Landroid/view/View;->generateViewId()I
                        move-result v4
                        invoke-virtual { v3, v4 }, Lbqwy;->c(I)V
                        iput-object v1, v3, Lbqwy;->a:Landroid/graphics/drawable/Drawable;
                        const-string v4, "Power Saving Options"
                        invoke-virtual { v3, v4 }, Lbqwy;->d(Ljava/lang/String;)V
                        const v4, 0x161a8
                        invoke-virtual { v3, v4 }, Lbqwy;->f(I)V
                        new-instance v2, $OPEN_POWER
                        invoke-direct { v2, v0 }, $OPEN_POWER-><init>(Landroid/content/Context;)V
                        invoke-virtual { v3, v2 }, Lbqwy;->e(Landroid/view/View${'$'}OnClickListener;)V
                        sget-object v4, Lbqwx;->d:Lbqwx;
                        iput-object v4, v3, Lbqwy;->d:Lbqwx;
                        invoke-virtual { v3 }, Lbqwy;->a()Lbqxa;
                        move-result-object v0
                        return-object v0
                    """,
                )
            },
        )

        // Both sheet builders: right after the Customization row's add.
        fun addUnderCustomization(returnType: String, parameters: List<String>) {
            fun callsCustomizationRow(insn: com.android.tools.smali.dexlib2.iface.instruction.Instruction) =
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                    r.definingClass == "Lolm;" && r.name == "uaCustomizationRow"
                } == true
            val found = mutableListOf<Pair<String, String>>()
            classDefForEach { c ->
                for (m in c.methods) {
                    if (m.returnType != returnType || m.parameterTypes.map { it.toString() } != parameters) continue
                    if (m.implementation?.instructions?.any(::callsCustomizationRow) == true) found += c.type to m.name
                }
            }
            val (owner, name) = found.singleOrNull()
                ?: throw PatchException("account sheet builder $returnType(${parameters.joinToString()}) with the Customization row: found ${found.size}")
            val method = mutableClassDefBy(owner).methods.single {
                it.name == name && it.returnType == returnType && it.parameterTypes.map { t -> t.toString() } == parameters
            }
            val ins = method.implementation!!.instructions
            val call = ins.indexOfFirst(::callsCustomizationRow)
            val result = ins[call + 1]
            val add = ins[call + 2]
            if (result.opcode != Opcode.MOVE_RESULT_OBJECT || add.opcode != Opcode.INVOKE_VIRTUAL ||
                ((add as ReferenceInstruction).reference as MethodReference).let { it.definingClass != "Lbwix;" || it.name != "i" }
            ) throw PatchException("Customization row add changed shape")
            // The row's result register is dead after its add, so it carries ours.
            val scratch = (result as OneRegisterInstruction).registerA
            val list = (add as Instruction35c).registerC
            val holder = (ins[call] as Instruction35c).registerC
            // Modern builder: the holder is cast from a wider register just before; do the same.
            val cast = ins.getOrNull(call - 1)?.takeIf {
                it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == "Lolm;"
            }
            val source = cast?.let { (ins[call - 2] as TwoRegisterInstruction).registerB }
            method.addInstructions(
                call + 3,
                if (source != null) """
                    move-object v$scratch, v$source
                    check-cast v$scratch, Lolm;
                    invoke-virtual { v$scratch }, Lolm;->uaPowerRow()Lbqxa;
                    move-result-object v$scratch
                    invoke-virtual { v$list, v$scratch }, Lbwix;->i(Ljava/lang/Object;)V
                """ else """
                    invoke-virtual { v$holder }, Lolm;->uaPowerRow()Lbqxa;
                    move-result-object v$scratch
                    invoke-virtual { v$list, v$scratch }, Lbwix;->i(Ljava/lang/Object;)V
                """,
            )
        }
        addUnderCustomization("Lbqrr;", listOf("Lafyh;"))
        addUnderCustomization("Lbqpl;", listOf("Z"))
    }
}
