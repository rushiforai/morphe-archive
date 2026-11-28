package semicoloncolonel.mobilestream.patches.netflix.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Netflix phone, Compose player (9.9x). The Skip button is a Jetpack Compose
// button rendered by one obfuscated class method. That method builds the
// button's onClick lambda as `new <lambda>(dispatcher, state, flag)` and hands
// it to the Hawkins button; the lambda, when invoked, dispatches the skip to
// the player. Pressing Skip is therefore just invoking that lambda.
//
// This patch calls the extension at the moment the lambda is built, passing
// the live lambda. The extension reads the state the lambda carries and, if it
// is an intro or a recap the user chose, invokes the lambda on the main thread
// — the same thing a tap does. No seek method is reconstructed; the app's own
// onClick is replayed.
//
// Anchors, all resolved per build so obfuscated names need no hand-editing:
//   - the method, by the stable string "skipCreditsButtonTestTag";
//   - the lambda, by its constructor shape (_, Ljava/lang/Object;, B);
//   - the intro and recap state classes, by the singleton loaded right before
//     each label resource (SKIP INTRO 0x7f140902, SKIP RECAP 0x7f140903);
//   - the lambda's state field, as its only Object field.
private const val SKIPPER =
    "Lsemicoloncolonel/mobilestream/extension/netflix/misc/NetflixAutoSkipper;"

private const val SKIP_INTRO_LABEL = 0x7f140902L
private const val SKIP_RECAP_LABEL = 0x7f140903L

internal object SkipButtonFingerprint : Fingerprint(
    strings = listOf("skipCreditsButtonTestTag"),
)

private fun stub(name: String, returnType: String) =
    Fingerprint(definingClass = SKIPPER, name = name, returnType = returnType)

@Suppress("unused")
val autoSkipPatch = bytecodePatch(
    name = "Auto-skip (experimental)",
    description = "Automatically presses Skip Intro and Skip Recap for you, so a binge does " +
        "not stop to wait. Each can be turned off on its own. Experimental: the hook is in " +
        "place and correct, but the skip has not yet been confirmed on a device, because " +
        "Netflix's protected player hides its own screen from automated checks.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val intros by booleanOption(
        key = "skipIntros",
        default = true,
        title = "Skip intros",
        description = "Automatically presses Skip Intro.",
        required = true,
    )
    val recaps by booleanOption(
        key = "skipRecaps",
        default = true,
        title = "Skip recaps",
        description = "Automatically presses Skip Recap.",
        required = true,
    )

    execute {
        val method = SkipButtonFingerprint.methodOrNull
            ?: throw PatchException("Netflix skip button method not found")
        val instructions = method.implementation!!.instructions.toList()

        // The onClick lambda: new-instance + <init>(interface, Object, byte).
        val initIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                ((instruction as ReferenceInstruction).reference as? MethodReference)?.let { reference ->
                    reference.name == "<init>" &&
                        reference.parameterTypes.map { it.toString() }.let { parameters ->
                            parameters.size == 3 &&
                                parameters[1] == "Ljava/lang/Object;" &&
                                parameters[2] == "B"
                        }
                } == true
        }
        if (initIndex < 0) throw PatchException("Netflix skip onClick lambda not found")
        val init = instructions[initIndex] as FiveRegisterInstruction
        val onClickRegister = init.registerC
        val lambdaType = ((instructions[initIndex] as ReferenceInstruction).reference as MethodReference)
            .definingClass

        // Hand the live onClick lambda to the extension, right after it is built.
        method.addInstruction(
            initIndex + 1,
            "invoke-static/range { v$onClickRegister .. v$onClickRegister }, " +
                "$SKIPPER->onSkipCta(Ljava/lang/Object;)V",
        )

        // The intro/recap state classes: the ->INSTANCE singleton loaded right
        // before each skip label. Converted to a dotted runtime class name.
        fun stateClassFor(label: Long): String {
            val labelIndex = instructions.indexOfFirst {
                it is WideLiteralInstruction && it.wideLiteral == label
            }
            if (labelIndex < 0) throw PatchException("Netflix skip label ${label.toString(16)} not found")
            for (i in labelIndex downTo 0) {
                val instruction = instructions[i]
                if (instruction.opcode == Opcode.SGET_OBJECT) {
                    val field = (instruction as ReferenceInstruction).reference as FieldReference
                    if (field.name == "INSTANCE") {
                        return field.definingClass.removePrefix("L").removeSuffix(";").replace('/', '.')
                    }
                }
            }
            throw PatchException("Netflix skip state class for ${label.toString(16)} not found")
        }

        // The lambda's state field: its only Object-typed field.
        val stateFieldName = classDefBy(lambdaType).fields
            .singleOrNull { it.type == "Ljava/lang/Object;" }
            ?.name
            ?: throw PatchException("Netflix skip lambda state field not found")

        fun bool(name: String, on: Boolean?) =
            stub(name, "Z").method.returnEarly(
                "const/4 v0, ${if (on == true) "0x1" else "0x0"}\nreturn v0",
            )
        fun text(name: String, value: String) =
            stub(name, "Ljava/lang/String;").method.returnEarly(
                "const-string v0, \"$value\"\nreturn-object v0",
            )

        bool("skipIntros", intros)
        bool("skipRecaps", recaps)
        text("introClass", stateClassFor(SKIP_INTRO_LABEL))
        text("recapClass", stateClassFor(SKIP_RECAP_LABEL))
        text("stateField", stateFieldName)
    }
}
