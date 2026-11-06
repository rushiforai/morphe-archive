package app.charlesattend.patches.beeper.inboxorder

import app.charlesattend.patches.shared.Constants.COMPATIBILITY_BEEPER
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/charlesattend/extension/beeper/InboxOrderPatch;"
private const val MENU_ITEM_CLASS = "Lapp/charlesattend/extension/beeper/InboxOrderMenuItem;"

private const val BOOLEAN_TYPE = "Ljava/lang/Boolean;"

/** toString() of the main Inbox space. Must be the same as MAIN_INBOX_SPACE in InboxOrderPatch.java. */
private const val MAIN_INBOX_SPACE = "Inbox"

/** Name of the helper method that the patch adds to each inbox query lambda. */
private const val QUERY_HELPER_NAME = "morphe_isMainInboxQuery"

@Suppress("unused")
val inboxOrderOptionPatch = bytecodePatch(
    name = "Inbox order option",
    description = "Adds an \"Oldest first\" item to the menu of the inbox title. " +
            "When it is on, the main inbox shows the oldest chats first. " +
            "Pinned chats and the other spaces keep their order.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BEEPER)

    extendWith("extensions/extension.mpe")

    execute {
        // region Give the extension a Context.

        BooperApplicationOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->setContext(Landroid/content/Context;)V",
        )

        // endregion

        // region Let the extension choose the ORDER BY clause of the inbox queries.

        listOf(InboxQueryFingerprint, InboxPagingQueryFingerprint).forEach { fingerprint ->
            val lambdaClass = fingerprint.classDef
            val lambdaType = lambdaClass.type

            // The lambda holds an Inbox4SpaceQuery and the pinned filter.
            val queryField = lambdaClass.fieldByName("\$query")
            val pinnedField = lambdaClass.fieldByName("\$effectiveFilterIsPinned", BOOLEAN_TYPE)

            // The field names of Inbox4SpaceQuery are obfuscated, so read them from its toString().
            val queryClass = classDefBy(queryField.type)
            val forMainInboxField = queryClass.fieldFromToString("Inbox4SpaceQuery(filterForMainInbox=", "Z")
            val archivedField = queryClass.fieldFromToString(", filterArchived=", BOOLEAN_TYPE)
            val lowPriorityField = queryClass.fieldFromToString(", filterLowPriority=", BOOLEAN_TYPE)
            val requestsField = queryClass.fieldFromToString(", filterMessageRequests=", BOOLEAN_TYPE)

            // The fields of the lambda are package-private, so the helper must be in the lambda class.
            // Registers: v0 to v4, and p0 (the lambda) is v5.
            val helperMethod = ImmutableMethod(
                lambdaType,
                QUERY_HELPER_NAME,
                listOf(ImmutableMethodParameter(lambdaType, null, null)),
                "Z",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                ImmutableMethodImplementation(6, emptyList(), null, null),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        iget-object v0, p0, ${queryField.toSmali()}
                        if-eqz v0, :morphe_not_main_inbox
                        iget-boolean v1, v0, ${forMainInboxField.toSmali()}
                        iget-object v2, v0, ${archivedField.toSmali()}
                        iget-object v3, v0, ${lowPriorityField.toSmali()}
                        iget-object v4, v0, ${requestsField.toSmali()}
                        iget-object v0, p0, ${pinnedField.toSmali()}
                        invoke-static { v1, v0, v2, v3, v4 }, $EXTENSION_CLASS->isMainInboxQuery(Z$BOOLEAN_TYPE$BOOLEAN_TYPE$BOOLEAN_TYPE$BOOLEAN_TYPE)Z
                        move-result v0
                        return v0
                        :morphe_not_main_inbox
                        const/4 v0, 0x0
                        return v0
                    """,
                )
            }
            lambdaClass.methods.add(helperMethod)

            val orderByMatch = fingerprint.instructionMatches.first()
            val index = orderByMatch.index
            val register = orderByMatch.getInstruction<OneRegisterInstruction>().registerA
            val originalOrderBy =
                (orderByMatch.getInstruction<ReferenceInstruction>().reference as StringReference).string

            fingerprint.method.apply {
                // p0 is the query lambda. It is never written in this method.
                replaceInstruction(index, "move-object/from16 v$register, p0")
                addInstructionsWithLabels(
                    index + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $lambdaType->$QUERY_HELPER_NAME($lambdaType)Z
                        move-result v$register
                        invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->orderBy(Z)Ljava/lang/String;
                        move-result-object v$register
                        if-nez v$register, :morphe_custom_order
                        const-string v$register, "${originalOrderBy.toSmaliString()}"
                    """,
                    ExternalLabel("morphe_custom_order", getInstruction(index + 1)),
                )
            }
        }

        // endregion

        // region Keep the inbox paging sources, so that the extension can load the list again.

        val pagingSourceSuperclass = InboxPagingSourceConstructorFingerprint.classDef.superclass
            ?: throw PatchException("The inbox paging source has no superclass")

        InboxPagingSourceConstructorFingerprint.method.apply {
            // This constructor writes p0 later, so register "this" right after the superclass constructor.
            val superConstructorIndex = instructions.indexOfFirst { instruction ->
                if (instruction.opcode != Opcode.INVOKE_DIRECT) return@indexOfFirst false
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                reference.name == "<init>" && reference.definingClass == pagingSourceSuperclass
            }
            if (superConstructorIndex < 0) {
                throw PatchException("Could not find the superclass constructor call of the inbox paging source")
            }

            addInstructions(
                superConstructorIndex + 1,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->registerPagingSource(Ljava/lang/Object;)V",
            )
        }

        val invalidateMethod = InboxPagingInvalidationFingerprint.instructionMatches.last()
            .getInstruction<ReferenceInstruction>().reference as MethodReference
        if (invalidateMethod.definingClass != pagingSourceSuperclass) {
            throw PatchException("Unexpected PagingSource.invalidate() method: ${invalidateMethod.toSmali()}")
        }

        // endregion

        // region Read the types and methods of the inbox title menu.

        val menuFooterMethod = InboxMenuFooterFingerprint.method
        val painterResourceMethod = InboxMenuFooterFingerprint.instructionMatches[3]
            .getInstruction<ReferenceInstruction>().reference as MethodReference
        val menuRowCall = InboxMenuFooterFingerprint.instructionMatches.last()
        val menuRowMethod = menuRowCall.getInstruction<ReferenceInstruction>().reference as MethodReference
        val menuRowParameters = menuRowMethod.parameterTypes.map { it.toString() }

        // MenuRow(label, icon, color, modifier, trailingIcon, onClick, composer, changed, defaults)
        if (menuRowParameters.size != 9 ||
            menuRowParameters[0] != "Ljava/lang/String;" ||
            menuRowParameters[2] != "J" ||
            menuRowParameters[1] != menuRowParameters[4] ||
            menuRowParameters[7] != "I" ||
            menuRowParameters[8] != "I"
        ) {
            throw PatchException("Unexpected menu row method: ${menuRowMethod.toSmali()}")
        }
        val painterType = menuRowParameters[1]
        val function0Type = menuRowParameters[5]
        val composerType = menuRowParameters[6]

        // The footer is footer(columnScope, dismissMenu: Function0, navigator, composer, changed).
        val footerParameters = menuFooterMethod.parameterTypes.map { it.toString() }
        if (footerParameters.getOrNull(1) != function0Type || footerParameters.getOrNull(3) != composerType) {
            throw PatchException("Unexpected menu footer method: ${menuFooterMethod.toSmali()}")
        }

        val function0Class = classDefBy(function0Type)
        if (function0Class.methods.none { it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;" }) {
            throw PatchException("$function0Type has no invoke() method")
        }

        // The footer's own restart lambda also calls the footer. Its type is the last new-instance in the footer.
        val footerRestartLambdaType = menuFooterMethod.instructions
            .last { it.opcode == Opcode.NEW_INSTANCE }
            .let { ((it as ReferenceInstruction).reference as TypeReference).type }

        // endregion

        // region Fill the placeholders of the extension.

        mutableClassDefBy(EXTENSION_CLASS).methods.apply {
            first { it.name == "invalidatePagingSource" }.replaceBody(
                """
                    check-cast p0, $pagingSourceSuperclass
                    invoke-virtual { p0 }, ${invalidateMethod.toSmali()}
                    return-void
                """,
            )
            first { it.name == "invokeFunction0" }.replaceBody(
                """
                    check-cast p0, $function0Type
                    invoke-interface { p0 }, $function0Type->invoke()Ljava/lang/Object;
                    move-result-object p0
                    return-object p0
                """,
            )
        }

        // The menu item is the onClick action of the new row.
        mutableClassDefBy(MENU_ITEM_CLASS).interfaces.add(function0Type)

        // endregion

        // region Tell the extension which space the title menu is for.

        val footerReference = menuFooterMethod.toSmali()
        val menuCallers = Fingerprint(filters = listOf(methodCall(reference = menuFooterMethod)))
            .matchAll()
            // originalClassDef does not make the class mutable.
            .filter { it.originalClassDef.type != footerRestartLambdaType }
        if (menuCallers.size != 1) {
            throw PatchException("Expected one caller of $footerReference, found ${menuCallers.size}")
        }

        // The extension compares the space with the toString() of the main Inbox space.
        val inboxSpaceClass = InboxSpaceFingerprint.match().originalClassDef
        val inboxSpaceToString = inboxSpaceClass.methods.firstOrNull {
            it.name == "toString" && it.parameterTypes.isEmpty()
        }?.instructionsOrNull?.any {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == MAIN_INBOX_SPACE
        } ?: false
        if (!inboxSpaceToString) {
            throw PatchException("${inboxSpaceClass.type}.toString() does not return \"$MAIN_INBOX_SPACE\"")
        }
        val spaceTypes = supertypesOf(inboxSpaceClass.type) - "Ljava/lang/Object;"

        menuCallers.single().method.apply {
            val callIndex = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).toSmali() == footerReference
            }

            // The menu dispatch casts the space to a space type and then calls the footer for some
            // spaces. The app reuses the space register before the call, so send the space to the
            // extension right after the cast. Every path to the call must go through that cast.
            val spaceCastIndex = (callIndex - 1 downTo 0).firstOrNull { index ->
                val instruction = getInstruction(index)
                instruction.opcode == Opcode.CHECK_CAST &&
                    ((instruction as ReferenceInstruction).reference as TypeReference).type in spaceTypes &&
                    isOnEveryPath(index, callIndex)
            } ?: throw PatchException("Could not find the space cast before the menu footer call")
            val spaceRegister = getInstruction<OneRegisterInstruction>(spaceCastIndex).registerA

            addInstructions(
                spaceCastIndex + 1,
                "invoke-static/range { v$spaceRegister .. v$spaceRegister }, $EXTENSION_CLASS->setMenuSpace(Ljava/lang/Object;)V",
            )
        }

        // endregion

        // region Add the "Oldest first" row after the "Settings" row.

        val rowCall = menuRowCall.getInstruction<RegisterRangeInstruction>()
        // label, icon, color (2 registers), modifier, trailingIcon, onClick, composer, changed, defaults
        if (rowCall.registerCount != 10) {
            throw PatchException("Unexpected register count of the menu row call: ${rowCall.registerCount}")
        }
        // After the "Settings" row, the row registers are free. The composer register is kept.
        val r = rowCall.startRegister
        val composerRegister = r + 7
        val insertIndex = menuRowCall.index + 1
        val orderIcon = resourceId(ResourceType.DRAWABLE, "arrow_down_24px")
        val checkIcon = resourceId(ResourceType.DRAWABLE, "done_24px")

        menuFooterMethod.addInstructionsWithLabels(
            insertIndex,
            """
                invoke-static { }, $EXTENSION_CLASS->shouldShowMenuItem()Z
                move-result v$r
                if-eqz v$r, :morphe_skip_inbox_order
                invoke-static { }, $EXTENSION_CLASS->getMenuLabel()Ljava/lang/String;
                move-result-object v$r
                const v${r + 1}, ${orderIcon.toSmaliInt()}
                const/16 v${r + 2}, 0x0
                invoke-static { v${r + 1}, v$composerRegister, v${r + 2} }, ${painterResourceMethod.toSmali()}
                move-result-object v${r + 1}
                const v${r + 4}, ${checkIcon.toSmaliInt()}
                invoke-static { v${r + 4}, v$composerRegister, v${r + 2} }, ${painterResourceMethod.toSmali()}
                move-result-object v${r + 4}
                invoke-static { v${r + 4} }, $EXTENSION_CLASS->getMenuTrailingIcon(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v${r + 5}
                check-cast v${r + 5}, $painterType
                move-object/from16 v${r + 4}, p1
                new-instance v${r + 6}, $MENU_ITEM_CLASS
                invoke-direct { v${r + 6}, v${r + 4} }, $MENU_ITEM_CLASS-><init>(Ljava/lang/Object;)V
                const-wide/16 v${r + 2}, 0x0
                const/16 v${r + 4}, 0x0
                const/16 v${r + 8}, 0x0
                const/16 v${r + 9}, 0xc
                invoke-static/range { v$r .. v${r + 9} }, ${menuRowMethod.toSmali()}
            """,
            ExternalLabel("morphe_skip_inbox_order", menuFooterMethod.getInstruction(insertIndex)),
        )

        // endregion
    }
}

private fun MethodReference.toSmali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun FieldReference.toSmali() = "$definingClass->$name:$type"

private fun ClassDef.fieldByName(name: String, expectedType: String? = null): FieldReference {
    val field = fields.firstOrNull { it.name == name }
        ?: throw PatchException("$type has no field $name")
    if (expectedType != null && field.type != expectedType) {
        throw PatchException("Unexpected type of $type->$name: ${field.type}")
    }
    return field
}

private val INSTANCE_GET_OPCODES = setOf(
    Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT,
)

/**
 * Finds a field from the generated toString() of a data class:
 * `"Name(field1=" + this.a + ", field2=" + this.b + ...`.
 * The field is the only field read between [label] and the next string constant.
 */
private fun ClassDef.fieldFromToString(label: String, expectedType: String): FieldReference {
    val toStringMethod = methods.firstOrNull {
        it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw PatchException("$type has no toString()")
    val instructions = toStringMethod.instructionsOrNull?.toList()
        ?: throw PatchException("$type.toString() has no code")

    fun Instruction.isString() = opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO

    val labelIndex = instructions.indexOfFirst {
        it.isString() && ((it as ReferenceInstruction).reference as StringReference).string == label
    }
    if (labelIndex < 0) throw PatchException("$type.toString() has no \"$label\"")

    val fieldReads = instructions.drop(labelIndex + 1)
        .takeWhile { !it.isString() }
        .filter { it.opcode in INSTANCE_GET_OPCODES }
        .map { (it as ReferenceInstruction).reference as FieldReference }
        .filter { it.definingClass == type }
    val field = fieldReads.singleOrNull()
        ?: throw PatchException("Expected one field after \"$label\" in $type.toString(), found ${fieldReads.size}")
    if (field.type != expectedType) {
        throw PatchException("Unexpected type of the field after \"$label\": ${field.type}")
    }
    return field
}

private fun String.toSmaliString() = buildString {
    for (char in this@toSmaliString) {
        when (char) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            else -> append(char)
        }
    }
}

private fun Long.toSmaliInt(): String {
    if (this !in 0..Int.MAX_VALUE) throw PatchException("Unexpected resource id: $this")
    return "0x" + toString(16)
}

/** The type, its superclasses and all its interfaces, as far as the app contains them. */
private fun BytecodePatchContext.supertypesOf(type: String): Set<String> {
    val result = mutableSetOf<String>()
    val pending = ArrayDeque(listOf(type))
    while (pending.isNotEmpty()) {
        val current = pending.removeFirst()
        if (!result.add(current)) continue
        val classDef = classDefByOrNull(current) ?: continue
        classDef.superclass?.let { pending.add(it) }
        pending.addAll(classDef.interfaces)
    }
    return result
}

/**
 * True if every path from the start of the method to [targetIndex] goes through [nodeIndex].
 * Methods with try blocks are not supported, so this returns false for them.
 */
private fun MutableMethod.isOnEveryPath(nodeIndex: Int, targetIndex: Int): Boolean {
    val implementation = implementation ?: return false
    if (implementation.tryBlocks.isNotEmpty()) return false
    val instructions = implementation.instructions
    if (nodeIndex == 0) return true

    // Search the paths from the start that do not go through nodeIndex.
    val visited = BooleanArray(instructions.size)
    val pending = ArrayDeque<Int>()
    fun visit(index: Int) {
        if (index in instructions.indices && index != nodeIndex && !visited[index]) {
            visited[index] = true
            pending.add(index)
        }
    }
    visit(0)
    while (pending.isNotEmpty()) {
        val index = pending.removeLast()
        if (index == targetIndex) return false
        val instruction = instructions[index]
        if (instruction.opcode.canContinue()) visit(index + 1)
        if (instruction is BuilderOffsetInstruction) {
            val target = instructions[instruction.target.location.index]
            if (target is BuilderSwitchPayload) {
                target.switchElements.forEach { visit(it.target.location.index) }
            } else {
                visit(instruction.target.location.index)
            }
        }
    }
    return true
}

private fun MutableMethod.replaceBody(smali: String) {
    removeInstructions(0, instructions.size)
    addInstructions(0, smali)
}
