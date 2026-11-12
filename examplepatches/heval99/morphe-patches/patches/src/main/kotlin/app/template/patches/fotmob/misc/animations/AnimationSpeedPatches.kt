package app.template.patches.fotmob.misc.animations

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.fotmob.controls.FOTMOB_EXTENSION
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobActivityHooksPatch
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_PACKAGE = "Lapp/template/extension/"
internal const val ANIMATION_SPEED_CLASS = "Lapp/template/extension/fotmob/AnimationSpeed;"
internal const val SETTINGS_GLOBAL = "Landroid/provider/Settings\$Global;"
private val GET_FLOAT_PARAMETERS = listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;", "F")
private const val EXTENSION_GET_FLOAT =
    "$ANIMATION_SPEED_CLASS->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F"

internal val DISABLE_ANIMATIONS = HevalFeature(
    id = "fotmob.disable_animations",
    name = "Turn off animations",
    description = "Turns off animations in the app.",
    category = FotMobControlsCategory.DISPLAY,
    restartRequired = true,
    icon = "play",
    choice = "Animation speed",
)

internal val FASTER_ANIMATIONS = HevalFeature(
    id = "fotmob.faster_animations",
    name = "Faster animations",
    description = "Plays animations at twice the speed.",
    category = FotMobControlsCategory.DISPLAY,
    restartRequired = true,
    icon = "play",
    choice = "Animation speed",
)

internal fun Instruction.isSettingsGlobalGetFloat(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val ref = (this as ReferenceInstruction).reference as MethodReference
    return ref.definingClass == SETTINGS_GLOBAL && ref.name == "getFloat" && ref.returnType == "F" &&
        ref.parameterTypes.map(CharSequence::toString) == GET_FLOAT_PARAMETERS
}

/** Redirects every app-dex Settings.Global.getFloat(ContentResolver, String, float); returns the count. */
private fun BytecodePatchContext.redirectSettingsGetFloat(): Int {
    val targets = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        // Never an extension class: AnimationSpeed's own call-through would recurse.
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        if (classDef.methods.any { m -> m.implementation?.instructions?.any { it.isSettingsGlobalGetFloat() } == true }) {
            targets += classDef
        }
    }
    var count = 0
    for (classDef in targets) {
        for (method in mutableClassDefBy(classDef).methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            instructions.forEachIndexed { index, instruction ->
                if (!instruction.isSettingsGlobalGetFloat()) return@forEachIndexed
                // Same arguments in the same registers: only the target changes, so no index shifts.
                val smali = when (instruction) {
                    is RegisterRangeInstruction -> {
                        val last = instruction.startRegister + instruction.registerCount - 1
                        "invoke-static/range { v${instruction.startRegister} .. v$last }, $EXTENSION_GET_FLOAT"
                    }
                    is FiveRegisterInstruction ->
                        "invoke-static { v${instruction.registerC}, v${instruction.registerD}, v${instruction.registerE} }, $EXTENSION_GET_FLOAT"
                    else -> throw PatchException("Unexpected invoke format ${instruction.opcode}")
                }
                method.replaceInstruction(index, smali)
                count++
            }
        }
    }
    return count
}

/**
 * The shared part of both animation switches: every Settings.Global.getFloat call in the app
 * (Compose's motion duration scale, Lottie, LottieDrawable, the Material progress indicators and
 * the onboarding screen; 11 methods in 240) goes through AnimationSpeed.getFloat, which changes
 * only "animator_duration_scale" and only while a switch is on; the activity hooks set the
 * ValueAnimator duration scale (and, for Turn off animations, the activity transitions).
 */
private val animationSpeedHookPatch = bytecodePatch(
    description = "Routes the animation scale reads through the extension.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    dependsOn(fotMobActivityHooksPatch)
    extendWith(FOTMOB_EXTENSION)

    execute {
        classDefBy(ANIMATION_SPEED_CLASS)
        val redirected = redirectSettingsGetFloat()
        if (redirected == 0) throw PatchException("FotMob animations: no Settings.Global.getFloat(ContentResolver, String, float) call found")
    }
}

// Both are Patch settings features (2026-11-03), opt-in in Manager and on in Patch settings once
// selected. With both selected, Turn off animations wins. Restart required: Compose reads the
// scale when a screen's recomposer starts.
@Suppress("unused")
val turnOffAnimationsPatch = fotMobControls.featurePatch(
    DISABLE_ANIMATIONS,
    default = false,
    dependencies = setOf(animationSpeedHookPatch),
) {}

@Suppress("unused")
val fasterAnimationsPatch = fotMobControls.featurePatch(
    FASTER_ANIMATIONS,
    default = false,
    dependencies = setOf(animationSpeedHookPatch),
) {}
