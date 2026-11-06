package suchi.morphe.patches.duchinese

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val FRAGMENT = "Lorg/sinamon/duchinese/ui/views/marquee/MarqueeActivityFragment;"
private const val BUILDER = "Landroidx/appcompat/app/b\$a;"
private const val DIAGNOSTICS = "Lsuchi/morphe/extension/duchinese/DownloadDiagnostics;"
private const val LESSON = "Lorg/sinamon/duchinese/models/json/ListDocument;"
private const val SETTINGS = "Lorg/sinamon/duchinese/models/DocumentOpenSettings;"

private val readingErrorFingerprint = Fingerprint(
    definingClass = FRAGMENT.dropLast(1) + "\$d;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lf5/u;"),
)

private val downloadDialogFingerprint = Fingerprint(
    definingClass = FRAGMENT,
    name = "d4",
    returnType = "V",
    parameters = listOf("Z"),
)

private val lessonInputFingerprint = Fingerprint(
    definingClass = "Lec/J;",
    name = "v",
    returnType = "V",
    parameters = listOf(LESSON, SETTINGS),
)

private val readerBindingFingerprint = Fingerprint(
    definingClass = "Lec/H\$a;",
    name = "A",
    returnType = "LQ8/N;",
    parameters = listOf("Lh0/L0;", "Lh0/L0;", "Lec/J;", "Lec/H\$e;", "Lh0/u2;", FRAGMENT),
)

private val acceptedBindingFingerprint = Fingerprint(
    definingClass = FRAGMENT,
    name = "S3",
    returnType = "V",
    parameters = List(7) { "Ljava/lang/String;" },
)

@Suppress("unused")
val downloadDiagnosticsPatch = bytecodePatch(
    name = "Show reading download errors",
    description = "Adds the Volley error class, HTTP status, cause locations, lesson and request URL presence, and safe response metadata to " +
        "Du Chinese's reading download dialog. Does not change requests or account entitlement.",
    default = false,
) {
    compatibleWith(duChineseCompatibility)
    extendWith("extensions/duchinese.mpe")

    execute {
        val fields = mutableMapOf<String, Map<String, String>>()
        classDefForEach { classDef ->
            if (classDef.type == "Lf5/u;" || classDef.type == "Lf5/k;") {
                fields[classDef.type] = classDef.fields.associate { it.name to it.type }
            }
        }
        if (fields["Lf5/u;"]?.get("x") != "Lf5/k;" ||
            fields["Lf5/k;"]?.get("a") != "I" ||
            fields["Lf5/k;"]?.get("b") != "[B" ||
            fields["Lf5/k;"]?.get("c") != "Ljava/util/Map;"
        ) {
            throw PatchException("Du Chinese's reading response metadata has changed.")
        }

        val callback = readingErrorFingerprint.method
        val callbackInstructions = callback.implementation!!.instructions.toList()
        val returnIndex = callbackInstructions.withIndex()
            .singleOrNull { it.value.opcode == Opcode.RETURN_VOID }?.index
            ?: throw PatchException("Du Chinese's reading callback return has changed.")
        if (callback.accessFlags != 1 || callback.implementation!!.registerCount != 2 ||
            callbackInstructions.firstOrNull()?.opcode != Opcode.IGET_OBJECT ||
            returnIndex != callbackInstructions.lastIndex
        ) {
            throw PatchException("Du Chinese's reading error callback has changed.")
        }
        val callbackDialog = callbackInstructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == FRAGMENT && reference.name == "p3" &&
                reference.parameterTypes == listOf(FRAGMENT) && reference.returnType == "V"
        } ?: throw PatchException("Du Chinese's reading callback dialog has changed.")
        val callbackDialogRegisters = callbackDialog.value as? FiveRegisterInstruction
        val fragmentCast = callbackInstructions.getOrNull(callbackDialog.index - 1)
        if (callbackDialog.value.opcode != Opcode.INVOKE_STATIC ||
            callbackDialogRegisters?.registerCount != 1 || callbackDialogRegisters.registerC != 1 ||
            fragmentCast?.opcode != Opcode.CHECK_CAST ||
            (fragmentCast as? OneRegisterInstruction)?.registerA != 1 ||
            (fragmentCast as? ReferenceInstruction)?.reference.toString() != FRAGMENT
        ) {
            throw PatchException("Du Chinese's reading callback fragment has changed.")
        }

        val lessonInput = lessonInputFingerprint.method
        val lessonInstructions = lessonInput.implementation!!.instructions.toList()
        val urlGetter = lessonInstructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == LESSON && reference.name == "getCrdUrl" &&
                reference.parameterTypes.isEmpty() && reference.returnType == "Ljava/lang/String;"
        } ?: throw PatchException("Du Chinese's lesson URL getter has changed.")
        val getterRegisters = urlGetter.value as? RegisterRangeInstruction
        val urlResult = lessonInstructions.getOrNull(urlGetter.index + 1)
        val emptyValue = lessonInstructions.getOrNull(urlGetter.index + 2)
        val modelMove = lessonInstructions.firstOrNull() as? TwoRegisterInstruction
        if (lessonInput.accessFlags != 18 || lessonInput.implementation!!.registerCount != 19 ||
            lessonInstructions.firstOrNull()?.opcode != Opcode.MOVE_OBJECT_FROM16 ||
            modelMove?.registerA != 0 || modelMove.registerB != 16 ||
            urlGetter.value.opcode != Opcode.INVOKE_VIRTUAL_RANGE ||
            getterRegisters?.registerCount != 1 || getterRegisters.startRegister != 17 ||
            urlResult?.opcode != Opcode.MOVE_RESULT_OBJECT ||
            (urlResult as? OneRegisterInstruction)?.registerA != 7 ||
            emptyValue?.opcode != Opcode.CONST_STRING ||
            (emptyValue as? OneRegisterInstruction)?.registerA != 8 ||
            ((emptyValue as? ReferenceInstruction)?.reference as? StringReference)?.string != ""
        ) {
            throw PatchException("Du Chinese's lesson URL input layout has changed.")
        }

        val readerBinding = readerBindingFingerprint.method
        val bindingInstructions = readerBinding.implementation!!.instructions.toList()
        val bindingCall = bindingInstructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == FRAGMENT && reference.name == "S3" &&
                reference.parameterTypes == List(7) { "Ljava/lang/String;" } && reference.returnType == "V"
        } ?: throw PatchException("Du Chinese's reader binding has changed.")
        val bindingRegisters = bindingCall.value as? RegisterRangeInstruction
        val readerMove = bindingInstructions.getOrNull(bindingCall.index - 1) as? TwoRegisterInstruction
        if (readerBinding.accessFlags != 26 || readerBinding.implementation!!.registerCount != 14 ||
            bindingCall.value.opcode != Opcode.INVOKE_VIRTUAL_RANGE ||
            bindingRegisters?.registerCount != 8 || bindingRegisters.startRegister != 0 ||
            bindingInstructions.getOrNull(bindingCall.index - 1)?.opcode != Opcode.MOVE_OBJECT ||
            readerMove?.registerA != 0 || readerMove.registerB != 13
        ) {
            throw PatchException("Du Chinese's reader binding layout has changed.")
        }

        val acceptedBinding = acceptedBindingFingerprint.method
        val acceptedInstructions = acceptedBinding.implementation!!.instructions.toList()
        val urlStore = acceptedInstructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            reference?.definingClass == FRAGMENT && reference.name == "W0" &&
                reference.type == "Ljava/lang/String;" && instruction.opcode == Opcode.IPUT_OBJECT
        } ?: throw PatchException("Du Chinese's accepted URL store has changed.")
        val storeRegisters = urlStore.value as? TwoRegisterInstruction
        if (acceptedBinding.accessFlags != 1 || acceptedBinding.implementation!!.registerCount != 9 ||
            storeRegisters?.registerA != 5 || storeRegisters.registerB != 1
        ) {
            throw PatchException("Du Chinese's accepted URL registers have changed.")
        }

        val dialog = downloadDialogFingerprint.method
        val instructions = dialog.implementation!!.instructions.toList()
        fun MethodReference.matches(name: String, parameters: List<String>, returnType: String) =
            definingClass == BUILDER && this.name == name &&
                parameterTypes == parameters && this.returnType == returnType

        val messageCall = instructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.matches("g", listOf("I"), BUILDER) == true
        } ?: throw PatchException("Du Chinese's download message call has changed.")
        val message = messageCall.value as? FiveRegisterInstruction
            ?: throw PatchException("Du Chinese's download message registers have changed.")
        val constructor = instructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.matches("<init>", listOf("Landroid/content/Context;", "I"), "V") == true
        } ?: throw PatchException("Du Chinese's download dialog constructor has changed.")
        val context = constructor.value as? FiveRegisterInstruction
            ?: throw PatchException("Du Chinese's download context registers have changed.")
        val titleCall = instructions.getOrNull(constructor.index + 1)
        val title = titleCall as? FiveRegisterInstruction
        val titleReference = (titleCall as? ReferenceInstruction)?.reference as? MethodReference
        val titleResult = instructions.getOrNull(constructor.index + 2)
        val messageResult = instructions.getOrNull(messageCall.index + 1)
        if (messageCall.value.opcode != Opcode.INVOKE_VIRTUAL ||
            constructor.value.opcode != Opcode.INVOKE_DIRECT ||
            message.registerCount != 2 || context.registerCount != 3 ||
            context.registerD != 2 || context.registerE != 3 ||
            message.registerC != 0 || message.registerD != 5 ||
            titleCall?.opcode != Opcode.INVOKE_VIRTUAL ||
            titleReference?.matches("s", listOf("I"), BUILDER) != true ||
            title?.registerCount != 2 || title.registerC != context.registerC ||
            titleResult?.opcode != Opcode.MOVE_RESULT_OBJECT ||
            (titleResult as? OneRegisterInstruction)?.registerA != message.registerC ||
            constructor.index + 3 != messageCall.index ||
            messageResult?.opcode != Opcode.MOVE_RESULT_OBJECT ||
            (messageResult as? OneRegisterInstruction)?.registerA != message.registerD
        ) {
            throw PatchException("Du Chinese's download dialog layout has changed.")
        }

        val messageRegister = message.registerD
        dialog.replaceInstruction(
            messageCall.index,
            "move v${context.registerE}, v$messageRegister",
        )
        dialog.addInstructions(
            messageCall.index + 1,
            """
                invoke-virtual { v${context.registerD}, v$messageRegister }, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;
                move-result-object v$messageRegister
                invoke-static { v$messageRegister, v${context.registerE} }, $DIAGNOSTICS->appendToMessage(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
                move-result-object v$messageRegister
                invoke-virtual { v${message.registerC}, v$messageRegister }, $BUILDER->h(Ljava/lang/CharSequence;)$BUILDER
            """.trimIndent(),
        )
        callback.replaceInstruction(returnIndex, "invoke-static { }, $DIAGNOSTICS->clear()V")
        callback.addInstruction(returnIndex + 1, "return-void")
        callback.addInstruction(
            callbackDialog.index,
            "invoke-static { v1 }, $DIAGNOSTICS->appendLessonState(Ljava/lang/Object;)V",
        )
        callback.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $DIAGNOSTICS->capture(Ljava/lang/Object;)V",
        )
        lessonInput.addInstruction(
            urlGetter.index + 2,
            "invoke-static { v0, v7 }, $DIAGNOSTICS->recordLesson(Ljava/lang/Object;Ljava/lang/String;)V",
        )
        readerBinding.addInstruction(
            bindingCall.index,
            "invoke-static { p2, p5 }, $DIAGNOSTICS->recordCandidate(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        acceptedBinding.addInstruction(
            urlStore.index + 1,
            "invoke-static { p0, p4 }, $DIAGNOSTICS->acceptCandidate(Ljava/lang/Object;Ljava/lang/String;)V",
        )
    }
}
