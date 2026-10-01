package app.ahmedyarub.patches.x.timeline

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import app.morphe.util.registersUsed
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private class ModelToStringFingerprint(prefix: String) : Fingerprint(
    name = "toString",
    strings = listOf(prefix),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/x/models/") },
)

/** The field toString reads right after printing [label]. */
context(_: BytecodePatchContext)
private fun Fingerprint.fieldPrintedAs(label: String): FieldReference {
    val instructions = method.instructions
    val printed = instructions.indexOfFirst { it.getReference<StringReference>()?.string == label }
    if (printed < 0) throw PatchException("toString does not print $label")

    return instructions.drop(printed).firstNotNullOfOrNull { instruction ->
        instruction.getReference<FieldReference>()?.takeIf {
            instruction.opcode == Opcode.IGET_OBJECT || instruction.opcode == Opcode.IGET_BOOLEAN
        }
    } ?: throw PatchException("toString prints $label but reads no field after it")
}

/**
 * The boolean field toString prints after [label] when it hands two labels and two values to one
 * helper, (label, nextLabel, builder, previousValue, value): the label's value is the last argument.
 */
context(_: BytecodePatchContext)
private fun Fingerprint.printedByHelper(label: String): FieldReference {
    val instructions = method.instructions.toList()
    val printed = instructions.indexOfFirst { it.getReference<StringReference>()?.string == label }
    val labelRegister = (instructions.getOrNull(printed) as? OneRegisterInstruction)?.registerA
        ?: throw PatchException("toString does not print $label")

    val helperIndex = instructions.indexOfFirst { instruction ->
        instructions.indexOf(instruction) > printed && instruction.opcode == Opcode.INVOKE_STATIC &&
            (instruction as? com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction)?.registerC == labelRegister
    }
    val helper = instructions.getOrNull(helperIndex) as? com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        ?: throw PatchException("toString prints $label without a helper")
    val valueRegister = listOf(helper.registerC, helper.registerD, helper.registerE, helper.registerF, helper.registerG)[helper.registerCount - 1]

    return instructions.take(helperIndex).last { instruction ->
        instruction.opcode == Opcode.IGET_BOOLEAN && (instruction as TwoRegisterInstruction).registerA == valueRegister
    }.getReference<FieldReference>()!!
}

/**
 * Stores [value] in [field] in every constructor of [classDef] that sets it, in place of what the
 * constructor was given. The given value's register must not be read again after the store.
 */
context(context: BytecodePatchContext)
private fun forceFieldInConstructors(classDef: ClassDef, field: FieldReference, value: Int): Int {
    var patched = 0

    context.mutableClassDefBy(classDef).methods.filter { it.name == "<init>" }.forEach { constructor ->
        constructor.instructions
            .filter { it.opcode.name.startsWith("iput") && it.getReference<FieldReference>() == field }
            .map { it.location.index }
            .sortedDescending()
            .forEach { index -> constructor.forceStoredValue(index, value); patched++ }
    }

    if (patched == 0) throw PatchException("No constructor of ${classDef.type} sets ${field.name}")
    return patched
}

private fun MutableMethod.forceStoredValue(storeIndex: Int, value: Int) {
    val register = (instructions[storeIndex] as TwoRegisterInstruction).registerA
    if (instructions.drop(storeIndex + 1).any { register in it.registersUsed }) {
        throw PatchException("$definingClass-><init> reads v$register again after storing it")
    }
    addInstructions(storeIndex, "const/16 v$register, $value")
}

// region Show sensitive media

@Suppress("unused")
val showSensitiveMediaPatch = bytecodePatch(
    name = "Show sensitive media",
    description = "Shows media marked sensitive without blurring it behind a warning.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        // Every blurred media presenter asks the post for its media visibility results and draws
        // the media normally without them.
        val post = ModelToStringFingerprint("ContextualPost(canonicalPost=")
        forceFieldInConstructors(post.classDef, post.fieldPrintedAs(", mediaVisibilityResults="), 0)
    }
}

// endregion

// region Show poll results

private object PollCardStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("PollCardState(eventSink="),
)

@Suppress("unused")
val showPollResultsPatch = bytecodePatch(
    name = "Show poll results",
    description = "Shows the results of polls without voting. Polls cannot be voted on while this is applied.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        // A poll shows its results when it has ended, when you voted, or when it is yours. Every
        // poll is made to count as yours: the flag is the state's last constructor parameter.
        val state = PollCardStateToStringFingerprint.classDef
        val constructor = mutableClassDefBy(state).methods.single { method ->
            method.name == "<init>" && method.parameterTypes.lastOrNull() == "Z" &&
                method.parameterTypes.firstOrNull() == "Lkotlin/jvm/functions/Function1;"
        }
        val isAuthor = "p${constructor.parameterTypes.size}"

        constructor.addInstructions(0, "const/16 $isAuthor, 0x1")
    }
}

// endregion

// region Enable force HD videos

private object AdaptiveTrackSelectionFingerprint : Fingerprint(
    strings = listOf("Adjusting minDurationToRetainAfterDiscardMs to be at least minDurationForQualityIncreaseMs"),
)

@Suppress("unused")
val forceHdVideosPatch = bytecodePatch(
    name = "Enable force HD videos",
    description = "Always plays videos at the highest quality the device supports, whatever the connection.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        // Media3's adaptive track selection picks the best track whose bitrate fits the bandwidth
        // estimate. With an unlimited estimate the best track always fits; tracks that failed to
        // play are still skipped.
        val selection = AdaptiveTrackSelectionFingerprint.classDef
        mutableClassDefBy(selection).methods.single { method ->
            method.returnType == "I" && method.parameterTypes.map { it.toString() } == listOf("J") &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.INVOKE_INTERFACE &&
                        instruction.getReference<MethodReference>()?.let { it.returnType == "J" && it.parameterTypes.isEmpty() } == true
                } == true
        }.apply {
            val estimate = instructions.first { instruction ->
                instruction.opcode == Opcode.INVOKE_INTERFACE &&
                    instruction.getReference<MethodReference>()?.let { it.returnType == "J" && it.parameterTypes.isEmpty() } == true
            }.location.index
            val result = instructions[estimate + 1]
            if (result.opcode != Opcode.MOVE_RESULT_WIDE) throw PatchException("The bandwidth estimate is not kept")

            addInstructions(
                estimate + 2,
                "const-wide v${(result as OneRegisterInstruction).registerA}, 0x7fffffffffffffffL",
            )
        }
    }
}

// endregion

// region Force enable translate

@Suppress("unused")
val forceTranslatePatch = bytecodePatch(
    name = "Force enable translate",
    description = "Offers to translate every post, not only those the server marks translatable.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        // Both the translate link and Grok's translation ask the post whether it is
        // translatable. Posts and reposts answer through short getters reading the canonical
        // post's flag, which all return true instead.
        val translatable = ModelToStringFingerprint("CanonicalPost(id=").printedByHelper(", isTranslatable=")
        var getters = 0

        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lcom/x/models/")) return@classDefForEach

            classDef.methods.filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.toList()?.let { instructions ->
                        instructions.size <= 4 && instructions.any {
                            it.opcode == Opcode.IGET_BOOLEAN && it.getReference<FieldReference>() == translatable
                        }
                    } == true
            }.forEach { getter ->
                mutableClassDefBy(classDef).methods.first { it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
                    .returnEarly(true)
                getters++
            }
        }

        if (getters == 0) throw PatchException("Nothing answers whether a post is translatable")
    }
}

// endregion
