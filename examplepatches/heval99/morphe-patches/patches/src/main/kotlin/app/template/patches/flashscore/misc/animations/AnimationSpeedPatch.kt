package app.template.patches.flashscore.misc.animations

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.template.patches.flashscore.controls.FLASHSCORE_EXTENSION
import app.template.patches.flashscore.controls.FlashscoreControlsCategory
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val FLASHSCORE_ANIMATION_SPEED = "Lapp/template/extension/flashscore/AnimationSpeed;"

/** The manifest Application class (not R8-renamed). */
private const val APP_CLASS = "Leu/livesport/LiveSport_cz/App;"

/** The extension's class prefix, never redirected into itself. */
private const val EXTENSION_PACKAGE = "Lapp/template/extension/"

/**
 * The two "Animation speed" switches. The Patch settings registry only has on/off switches, so the
 * three-way choice (stock / faster / off) is two switches, and "Turn off animations" wins when both
 * are on. Both start off (stock) and are read once per process.
 */
internal val ANIMATION_FEATURES: List<HevalFeature> = listOf(
    HevalFeature(
        id = "flashscore.animations_off",
        name = "Turn off animations",
        description = "Turns off animations and screen transitions. Wins over Faster animations.",
        category = FlashscoreControlsCategory.DISPLAY,
        default = false,
        restartRequired = true,
        icon = "play",
        choice = "Animation speed",
    ),
    HevalFeature(
        id = "flashscore.animations_fast",
        name = "Faster animations",
        description = "Plays animations twice as fast.",
        category = FlashscoreControlsCategory.DISPLAY,
        default = false,
        restartRequired = true,
        icon = "play",
        choice = "Animation speed",
    ),
)

/** `invoke-static ValueAnimator.getDurationScale()F`, the read Compose's motion scale uses. */
private fun ReferenceInstruction.isDurationScaleRead(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC) return false
    val call = reference as? MethodReference ?: return false
    return call.definingClass == "Landroid/animation/ValueAnimator;" && call.name == "getDurationScale" &&
        call.returnType == "F" && call.parameterTypes.isEmpty()
}

// Several Heval Controls features in one patch, registered once every site is patched.
@Suppress("unused")
val animationSpeedPatch = bytecodePatch(
    name = "Animation speed",
    description = "Adds switches to turn off or speed up animations.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    dependsOn(flashscoreControls.patch)

    extendWith(FLASHSCORE_EXTENSION)

    execute {
        // The host's entry patch merges extensions/flashscore.mpe; fail loudly if the class is missing.
        classDefBy(FLASHSCORE_ANIMATION_SPEED)

        // 1. Application.onCreate starts the hooks right after super.onCreate: it reads the
        // switches and, while one is on, scales ValueAnimator's duration scale and registers the
        // transitions hook.
        val app = mutableClassDefBy(APP_CLASS)
        val onCreate = app.methods.singleOrNull {
            it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("$APP_CLASS.onCreate()V not found")
        val superCall = onCreate.implementation?.instructions?.toList()
            ?.withIndex()
            ?.singleOrNull { (_, insn) ->
                (insn.opcode == Opcode.INVOKE_SUPER || insn.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                    ((insn as ReferenceInstruction).reference as? MethodReference)?.name == "onCreate"
            }
            ?: throw PatchException("$APP_CLASS.onCreate()V: no single super.onCreate()")
        onCreate.requireNoBranchTargetAt(superCall.index + 1, "Animation speed init")
        onCreate.addInstructionsChecked(
            superCall.index + 1,
            "invoke-static/range {p0 .. p0}, $FLASHSCORE_ANIMATION_SPEED->init(Landroid/app/Application;)V",
        )

        // 2. Every app read of ValueAnimator.getDurationScale() goes through the extension, which
        // returns the system value times the switch factor. Found by the framework reference, so
        // R8 renames do not matter.
        val owners = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
            val reads = classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    insn is ReferenceInstruction && insn.isDurationScaleRead()
                } == true
            }
            if (reads) owners += classDef
        }
        if (owners.isEmpty()) throw PatchException("Animation speed: no ValueAnimator.getDurationScale() read found")

        var redirected = 0
        owners.forEach { owner ->
            mutableClassDefBy(owner).methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                implementation.instructions.toList().forEachIndexed { index, insn ->
                    if (insn !is ReferenceInstruction || !insn.isDurationScaleRead()) return@forEachIndexed
                    if (insn.opcode != Opcode.INVOKE_STATIC) {
                        throw PatchException(
                            "Animation speed: unexpected ${insn.opcode} to getDurationScale in " +
                                "${method.definingClass}->${method.name}",
                        )
                    }
                    method.replaceInstruction(
                        index,
                        "invoke-static {}, $FLASHSCORE_ANIMATION_SPEED->durationScale()F",
                    )
                    redirected++
                }
            }
        }
        if (redirected == 0) throw PatchException("Animation speed: no getDurationScale read was redirected")

        ANIMATION_FEATURES.forEach { flashscoreControls.register(it) }
    }
}
