package app.charlesattend.patches.beeper.inboxorder

import app.charlesattend.patches.shared.Constants.COMPATIBILITY_BEEPER
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS = "Lapp/charlesattend/extension/beeper/InboxOrderPatch;"
private const val MENU_ITEM_CLASS = "Lapp/charlesattend/extension/beeper/InboxOrderMenuItem;"

/** Must be the same as QUERY_FIELD_NAMES in InboxOrderPatch.java. */
private val QUERY_FIELD_NAMES = listOf(
    "\$space",
    "\$effectiveFilterIsPinned",
    "\$filterArchived",
    "\$filterLowPriority",
    "\$filterMessageRequests",
)

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
            // The extension reads these fields with reflection.
            val fieldNames = fingerprint.classDef.fields.map { it.name }.toSet()
            val missingFields = QUERY_FIELD_NAMES.filterNot { it in fieldNames }
            if (missingFields.isNotEmpty()) {
                throw PatchException("${fingerprint.classDef.type} has no fields $missingFields")
            }

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
                        invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->orderBy(Ljava/lang/Object;)Ljava/lang/String;
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

        menuCallers.single().method.apply {
            val callIndex = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).toSmali() == footerReference
            }
            // The menu dispatch checks the space with instance-of just before it calls the footer.
            val instanceOfIndex = (callIndex - 1 downTo maxOf(0, callIndex - 30)).firstOrNull {
                getInstruction(it).opcode == Opcode.INSTANCE_OF
            } ?: throw PatchException("Could not find the space check before the menu footer call")
            val spaceRegister = getInstruction<TwoRegisterInstruction>(instanceOfIndex).registerB

            if ((instanceOfIndex + 1 until callIndex).any { getInstruction(it).writesRegister(spaceRegister) }) {
                throw PatchException("The space register v$spaceRegister changes before the menu footer call")
            }
            if (getInstruction(callIndex).location.labels.isNotEmpty()) {
                throw PatchException("The menu footer call is a branch target")
            }

            addInstructions(
                callIndex,
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

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val registerA = (this as? OneRegisterInstruction)?.registerA ?: return false
    return registerA == register || (opcode.setsWideRegister() && registerA + 1 == register)
}

private fun MutableMethod.replaceBody(smali: String) {
    removeInstructions(0, instructions.size)
    addInstructions(0, smali)
}
