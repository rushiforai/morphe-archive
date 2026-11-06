package app.bookspiko.patches.books.reader.copy

import app.bookspiko.patches.books.misc.extension.sharedExtensionPatch
import app.bookspiko.patches.books.shared.Constants.COMPATIBILITY_PLAY_BOOKS
import app.bookspiko.patches.books.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val HOOK = "$EXTENSION_PACKAGE/copy/AttributedCopy;"
private const val METADATA = "$EXTENSION_PACKAGE/copy/BookMetadata;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"
private const val MARKER = "booksPikoAttributedCopy"
private const val ID_GETTER = "booksPikoVolumeId"

context(context: BytecodePatchContext)
private fun Fingerprint.unique(): Match = matchAll().singleOrNull()
    ?: throw PatchException("Expected exactly one match for $this")

/** Resolve fields by the arguments assigned to them, never by obfuscated names. */
private fun Method.parameterField(index: Int, expectedType: String): FieldReference {
    val types = parameterTypes.map { it.toString() }
    if (types.getOrNull(index) != expectedType) throw PatchException("Unexpected constructor: $this")
    val widths = types.map { if (it == "J" || it == "D") 2 else 1 }
    val receiver = implementation!!.registerCount - widths.sum() - 1
    val argument = receiver + 1 + widths.take(index).sum()
    return instructions.filter { instruction ->
        instruction.opcode in setOf(Opcode.IPUT_OBJECT, Opcode.IPUT, Opcode.IPUT_WIDE) &&
            (instruction as TwoRegisterInstruction).registerA == argument &&
            instruction.registerB == receiver
    }.map { (it as ReferenceInstruction).reference as FieldReference }
        .filter { it.type == expectedType }.singleOrNull()
        ?: throw PatchException("Cannot resolve argument $index in $this")
}

private fun nibble(vararg registers: Int) {
    if (registers.any { it !in 0..15 }) throw PatchException("Unsupported copy register layout")
}

context(context: BytecodePatchContext)
private fun bridge(
    name: String, parameters: List<String>, result: String, registers: Int, code: String,
    ownerType: String = HOOK, static: Boolean = true,
) {
    val owner = context.mutableClassDefBy(ownerType)
    if (owner.methods.any { it.name == name }) throw PatchException("Duplicate copy bridge: $name")
    val method = MutableMethod(ImmutableMethod(
        ownerType, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value or
            (if (static) AccessFlags.STATIC.value else 0), emptySet(), emptySet(),
        ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructions(0, code)
    owner.methods.add(method)
}

context(context: BytecodePatchContext)
private fun captureMetadata(volume: Match, information: Match, hookName: String) {
    val entity = volume.classDef
    val info = information.classDef
    val constructor = entity.methods.singleOrNull { it.name == "<init>" &&
        it.parameterTypes.take(2).map { type -> type.toString() } == listOf(STRING, info.type) }
        ?: throw PatchException("Book metadata constructor changed: ${entity.type}")
    val infoConstructor = info.methods.singleOrNull { it.name == "<init>" &&
        it.parameterTypes.take(3).map { type -> type.toString() } == listOf(STRING, LIST, STRING) }
        ?: throw PatchException("Bibliographic metadata constructor changed: ${info.type}")
    val id = constructor.parameterField(0, STRING)
    val details = constructor.parameterField(1, info.type)
    val title = infoConstructor.parameterField(0, STRING)
    val authors = infoConstructor.parameterField(1, LIST)
    listOf(id, details, title, authors).forEach { field ->
        if (context.classDefBy(field.definingClass).fields.none { it.name == field.name &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
            throw PatchException("Book metadata field is no longer public: $field")
        }
    }
    bridge(hookName, listOf(OBJECT), "V", 5, """
        check-cast p0, ${entity.type}
        iget-object v0, p0, $id
        iget-object v1, p0, $details
        iget-object v2, v1, $title
        iget-object v3, v1, $authors
        invoke-static { v0, v2, v3 }, $HOOK->remember($STRING$STRING$LIST)V
        return-void
    """)
    val returnIndex = constructor.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (returnIndex < 0) throw PatchException("Book metadata constructor has no return")
    constructor.addInstructions(returnIndex, "invoke-static/range { p0 .. p0 }, $HOOK->$hookName($OBJECT)V")
}

@Suppress("unused")
val attributedCopyPatch = bytecodePatch(
    name = "Attributed copy fallback",
    description = "Keeps permitted copies unchanged. When copying is blocked, enables copying " +
        "with the book title, authors and a Play Books link appended.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PLAY_BOOKS)
    dependsOn(sharedExtensionPatch)

    execute {
        // Do not silently query a different schema if the local BooksProvider contract changes.
        LegacyVolumeColumnsFingerprint.unique()
        LegacyVolumeRouteFingerprint.unique()
        LegacyVolumeAuthorityFingerprint.unique()
        LegacyVolumeQueryFingerprint.unique()

        val quota = CopyQuotaInfoFingerprint.unique().classDef
        val quotaConstructor = quota.methods.singleOrNull { it.name == "<init>" &&
            it.parameterTypes.map { type -> type.toString() } == listOf(STRING, "J", "J", "I") }
            ?: throw PatchException("Copy quota constructor changed")
        val quotaId = quotaConstructor.parameterField(0, STRING)
        val quotaRemaining = quotaConstructor.parameterField(1, "J")
        val quotaAllowed = quotaConstructor.parameterField(2, "J")
        val quotaLimit = quotaConstructor.parameterField(3, "I")

        val action = ReaderCopyActionFingerprint.unique()
        val code = action.method.instructions.toList()
        val limitIndex = code.indices.singleOrNull { index ->
            code[index].opcode == Opcode.IGET &&
                (code[index] as ReferenceInstruction).reference == quotaLimit
        } ?: throw PatchException("Copy action no longer checks the quota limit type")
        // In this reader, limit type 2 takes the successful-copy path without quota accounting.
        val comparison = code.getOrNull(limitIndex + 2) as? TwoRegisterInstruction
        val limitRegister = (code[limitIndex] as OneRegisterInstruction).registerA
        val constant = code.getOrNull(limitIndex + 1)
        if ((constant as? NarrowLiteralInstruction)?.narrowLiteral != 2 ||
            comparison?.opcode != Opcode.IF_NE || comparison.registerA != limitRegister ||
            comparison.registerB != (constant as? OneRegisterInstruction)?.registerA
        ) throw PatchException("Unlimited-copy branch changed")

        val menu = ReaderCopyMenuFingerprint.unique()
        val menuCode = menu.method.instructions.toList()
        val callbackConstructor = menuCode.singleOrNull { it.opcode == Opcode.INVOKE_DIRECT &&
            ((it as ReferenceInstruction).reference as MethodReference).let { reference ->
                reference.definingClass == action.method.definingClass && reference.name == "<init>" &&
                    reference.parameterTypes.size == 3 && reference.parameterTypes[1].toString() == quota.type
            }
        } ?: throw PatchException("Reader copy callback constructor changed")
        val modelType = ((callbackConstructor as ReferenceInstruction).reference as MethodReference)
            .parameterTypes.last().toString()
        val modelRegister = (callbackConstructor as FiveRegisterInstruction).registerF
        val model = mutableClassDefBy(modelType)
        val modelConstructor = model.methods.singleOrNull { it.name == "<init>" &&
            it.parameterTypes.map { type -> type.toString() }.count { type -> type == STRING } == 1 }
            ?: throw PatchException("Reader copy model constructor changed")
        val modelId = modelConstructor.parameterField(
            modelConstructor.parameterTypes.indexOfFirst { it.toString() == STRING }, STRING)
        // Read the private ID inside its declaring class instead of reflecting on obfuscated names.
        bridge(ID_GETTER, emptyList(), STRING, 2, """
            iget-object v0, p0, $modelId
            return-object v0
        """, ownerType = modelType, static = false)
        val quotaIndex = menuCode.indices.singleOrNull { index ->
            menuCode[index].opcode == Opcode.CHECK_CAST &&
                ((menuCode[index] as ReferenceInstruction).reference as TypeReference).type == quota.type
        } ?: throw PatchException("Reader copy menu quota value changed")
        val quotaRegister = (menuCode[quotaIndex] as OneRegisterInstruction).registerA
        nibble(quotaRegister, modelRegister)
        if (quotaRegister == modelRegister || menuCode.take(quotaIndex).none {
                it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerB == modelRegister &&
                    ((it as ReferenceInstruction).reference as FieldReference).definingClass == modelType
            }) throw PatchException("Reader copy model is not live at the quota check")

        if (quota.fields.any { it.name == MARKER }) throw PatchException("Duplicate attribution marker")
        quota.fields.add(MutableField(ImmutableField(quota.type, MARKER, "Z",
            AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value, null, emptySet(), emptySet())))
        // Preserve permitted native quota objects, including their normal accounting. Only a blocked
        // or unavailable quota becomes a marked, transient unlimited object for this menu.
        // Impossible counter values also keep Kotlin equality / Compose's callback cache from
        // confusing a fallback object with a later, genuinely unlimited native quota object.
        bridge("selectQuota", listOf(OBJECT, OBJECT), OBJECT, 10, """
            if-eqz p1, :attributed
            check-cast p1, ${quota.type}
            iget-wide v0, p1, $quotaRemaining
            iget-wide v2, p1, $quotaAllowed
            iget v4, p1, $quotaLimit
            invoke-static { v0, v1, v2, v3, v4 }, $HOOK->shouldAttribute(JJI)Z
            move-result v0
            if-nez v0, :attributed
            return-object p1
            :attributed
            new-instance v0, ${quota.type}
            check-cast p0, $modelType
            invoke-virtual { p0 }, $modelType->$ID_GETTER()$STRING
            move-result-object v1
            const-wide v2, -0x8000000000000000
            const-wide v4, -0x8000000000000000
            const/4 v6, 0x2
            invoke-direct/range { v0 .. v6 }, ${quota.type}-><init>(${STRING}JJI)V
            const/4 v1, 0x1
            iput-boolean v1, v0, ${quota.type}->$MARKER:Z
            return-object v0
        """)
        menu.method.addInstructions(quotaIndex + 1, """
            invoke-static { v$modelRegister, v$quotaRegister }, $HOOK->selectQuota($OBJECT$OBJECT)$OBJECT
            move-result-object v$quotaRegister
            check-cast v$quotaRegister, ${quota.type}
        """)

        captureMetadata(InnerVolumeEntityFingerprint.unique(), VolumeInfoEntityFingerprint.unique(), "rememberVolumeEntity")
        captureMetadata(VolumeFingerprint.unique(), VolumeInfoFingerprint.unique(), "rememberVolume")

        val clipIndex = action.instructionMatches[0].index
        val clip = code[clipIndex] as FiveRegisterInstruction
        val result = code.getOrNull(clipIndex + 1)
        if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Clipboard result changed")
        val quotaRead = code.singleOrNull { it.opcode == Opcode.IGET_OBJECT &&
            ((it as ReferenceInstruction).reference as FieldReference).type == quota.type }
            ?: throw PatchException("Copy action quota capture changed")
        val quotaValue = (quotaRead as OneRegisterInstruction).registerA
        val text = clip.registerD
        val contextCall = code.singleOrNull { it.opcode == Opcode.INVOKE_VIRTUAL &&
            ((it as ReferenceInstruction).reference as MethodReference).let { reference ->
                reference.returnType == CONTEXT && reference.parameterTypes.isEmpty()
            }
        } ?: throw PatchException("Copy action's fragment context getter changed")
        val contextGetter = (contextCall as ReferenceInstruction).reference as MethodReference
        val fragment = (contextCall as FiveRegisterInstruction).registerC
        if (classDefBy(contextGetter.definingClass).methods.none { it.name == contextGetter.name &&
                it.returnType == CONTEXT && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
            throw PatchException("Copy action's context getter is no longer public")
        }
        nibble(quotaValue, text, fragment)
        bridge("formatSelection", listOf(STRING, OBJECT, OBJECT), STRING, 6, """
            check-cast p1, ${quota.type}
            iget-object v0, p1, $quotaId
            iget-boolean v1, p1, ${quota.type}->$MARKER:Z
            check-cast p2, ${contextGetter.definingClass}
            invoke-virtual { p2 }, $contextGetter
            move-result-object v2
            invoke-static { v2, p0, v0, v1 }, $METADATA->copyText($CONTEXT$STRING${STRING}Z)$STRING
            move-result-object v0
            return-object v0
        """)
        action.method.addInstructions(clipIndex, """
            invoke-static { v$text, v$quotaValue, v$fragment }, $HOOK->formatSelection($STRING$OBJECT$OBJECT)$STRING
            move-result-object v$text
        """)
    }
}
