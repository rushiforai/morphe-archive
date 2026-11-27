package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel
import app.xposed.patches.twitter.Constants.BRIDGE_CLASS
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import app.xposed.patches.twitter.util.argumentRegisters
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.parameterRegister
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.requireLocals
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.stringRef
import app.xposed.patches.twitter.util.typeRef
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * X's notice for posts it can't show: a bordered row with a message and an optional tappable
 * call to action, (message, cta, onLink, modifier, onClick, composer, changed). It is the only
 * static composable of this shape whose message and call to action share a type (RichText).
 */
private object NoticeFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("L", "L", FUNCTION1, MODIFIER, FUNCTION0, COMPOSER, "I"),
    custom = { method, _ -> method.parameterTypes[0] == method.parameterTypes[1] },
)

private object UnavailablePostToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UnavailablePost(postId="),
)

/**
 * In Hide mode a quoted post by a filtered account becomes X's own notice, naming the filters,
 * with "Show quoted post", as X-Posed collapses it. The hook goes in the quote item, which
 * already draws that notice for unavailable quotes, so the notice replaces the whole card.
 * The notice also stands in for hidden related posts, padded like the timeline rows
 * [rowLayouts]. [post] is the AvailablePost toString match, [author] its author field.
 */
internal fun BytecodePatchContext.hookQuotePlaceholder(
    post: Match,
    author: FieldReference,
    emptyModifier: FieldReference,
    rowLayouts: List<Method>,
) {
    val availablePost = post.originalClassDef
    val unavailable = UnavailablePostToStringFingerprint.matchSingle().originalClassDef
    val itemType = availablePost.interfaces.filter { it in unavailable.interfaces }.single("timeline post item interface")
    val notice = NoticeFingerprint.matchSingle().originalMethod

    // The quote item: (item, flag, modifier, composer, changed). Its caller has the same shape
    // but only forwards to it.
    val quoteItem = Fingerprint(
        isStatic = true,
        returnType = "V",
        parameters = listOf(itemType, "Z", MODIFIER, COMPOSER, "I"),
        custom = { method, _ ->
            val instructions = method.instructionList
            instructions.any { it.opcode == Opcode.INSTANCE_OF && it.typeRef == unavailable.type } &&
                instructions.any { it.methodRef?.descriptor == notice.descriptor }
        },
    ).matchSingle()

    val fillMaxWidth = modifierFactoriesFeeding(quoteItem.originalMethod, notice) { types -> types == listOf(MODIFIER, "F") }
        .single("Modifier.fillMaxWidth before the notice in ${quoteItem.originalMethod.descriptor}")
    writeNoticeBridge(notice, fillMaxWidth, emptyModifier)
    writePadding(notice, rowLayouts)

    quoteItem.method.apply {
        requireLocals(4)
        addInstructionsWithLabels(
            0,
            """
            move-object/16 v1, ${parameterRegister(0)}
            instance-of v0, v1, ${availablePost.type}
            if-eqz v0, :xposed_original
            check-cast v1, ${availablePost.type}
            iget-object v0, v1, ${author.descriptor}
            if-eqz v0, :xposed_original
            move-object/16 v2, ${parameterRegister(2)}
            move-object/16 v3, ${parameterRegister(3)}
            invoke-static { v0, v1, v2, v3 }, $HOOKS_CLASS->onQuote(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :xposed_original
            return-void
            """,
            ExternalLabel("xposed_original", getInstruction(0)),
        )
    }
}

/**
 * The Compose layout modifiers that X passes as [notice]'s modifier argument in [method], whose
 * parameter types pass [accept]. Followed back through register moves from each notice call to
 * the call that produced the modifier.
 */
private fun BytecodePatchContext.modifierFactoriesFeeding(
    method: Method,
    notice: Method,
    accept: (List<String>) -> Boolean,
): List<MethodReference> {
    val instructions = method.instructionList
    val found = mutableListOf<MethodReference>()
    instructions.indices.filter { instructions[it].methodRef?.descriptor == notice.descriptor }.forEach { call ->
        var register = instructions[call].argumentRegisters()[3]
        for (i in call - 1 downTo 1) {
            val instruction = instructions[i]
            if (!instruction.writes(register)) continue
            if (instruction.opcode in MOVE_OBJECT) {
                register = (instruction as TwoRegisterInstruction).registerB
                continue
            }
            val factory = instructions[i - 1].methodRef
            if (instruction.opcode == Opcode.MOVE_RESULT_OBJECT && factory != null &&
                instructions[i - 1].opcode in INVOKE_STATIC && factory.returnType == MODIFIER &&
                factory.definingClass.startsWith(LAYOUT_PACKAGE) && accept(factory.parameterTypes.map(CharSequence::toString))
            ) {
                found += factory
            }
            break
        }
    }
    requirePublic(*found.toTypedArray())
    return found.distinctBy { it.descriptor }
}

private val MOVE_OBJECT = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val INVOKE_STATIC = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

/**
 * ComposeBridge.padding: `Modifier.padding(PaddingValues)`, as X pads its own notice in place
 * of an unavailable timeline row. [rowLayouts] take the row's PaddingValues.
 */
private fun BytecodePatchContext.writePadding(notice: Method, rowLayouts: List<Method>) {
    val paddingTypes = rowLayouts.map { layout -> layout.parameterTypes.map(CharSequence::toString).firstOrNull { it.startsWith(LAYOUT_PACKAGE) } }
    val paddingValues = paddingTypes.distinct().singleOrNull()
        ?: throw PatchException("Post layouts take different layout parameters: $paddingTypes")
    val accepted = classDefBy(paddingValues).interfaces + paddingValues
    val factories = mutableListOf<MethodReference>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val calls = method.implementation?.instructions?.any { it.methodRef?.descriptor == notice.descriptor } == true
            if (calls) factories += modifierFactoriesFeeding(method, notice) { types -> types.size == 2 && types[0] == MODIFIER && types[1] in accepted }
        }
    }
    val padding = factories.distinctBy { it.descriptor }.single("Modifier.padding(PaddingValues) before the notice")
    replaceStub(
        BRIDGE_CLASS, "padding", 0,
        """
        check-cast p0, $MODIFIER
        check-cast p1, ${padding.parameterTypes[1]}
        invoke-static { p0, p1 }, ${padding.descriptor}
        move-result-object p0
        return-object p0
        """,
    )
}

private fun Instruction.writes(register: Int) =
    (opcode.setsRegister() || opcode.setsWideRegister()) && (this as? OneRegisterInstruction)?.registerA == register

/** ComposeBridge.richText, notice and fillMaxWidth. */
private fun BytecodePatchContext.writeNoticeBridge(notice: Method, fillMaxWidth: MethodReference, emptyModifier: FieldReference) {
    val richText = notice.parameterTypes[0].toString()
    val richTextClass = classDefBy(richText)
    val toString = richTextClass.methods.firstOrNull { it.name == "toString" }
    if (toString?.instructionList?.any { it.stringRef?.startsWith("RichText(text=") == true } != true) {
        throw PatchException("$richText isn't RichText")
    }
    // RichText(text, rtl, alignment, entities)
    val constructor = richTextClass.methods.filter { method ->
        val types = method.parameterTypes.map(CharSequence::toString)
        method.name == "<init>" && types.size == 4 && types[0] == STRING && types[1] == "Z" && types[3] == "Ljava/util/List;"
    }.single("RichText(text, rtl, alignment, entities)")
    val natural = enumConstants(constructor.parameterTypes[2].toString(), "Natural").getValue("Natural")
    requirePublic(notice, richText, constructor, natural)

    replaceStub(
        BRIDGE_CLASS, "richText", 4,
        """
        new-instance v0, $richText
        const/4 v1, 0x0
        sget-object v2, ${natural.descriptor}
        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object v3
        invoke-direct { v0, p0, v1, v2, v3 }, ${constructor.descriptor}
        return-object v0
        """,
    )
    // $changed 0: every argument is compared with the last composition.
    replaceStub(
        BRIDGE_CLASS, "notice", 7,
        """
        move-object v0, p0
        check-cast v0, $richText
        move-object v1, p1
        check-cast v1, $richText
        move-object v2, p2
        move-object v3, p3
        check-cast v3, $MODIFIER
        move-object v4, p4
        move-object v5, p5
        check-cast v5, $COMPOSER
        const/4 v6, 0x0
        invoke-static/range { v0 .. v6 }, ${notice.descriptor}
        return-void
        """,
    )
    replaceStub(
        BRIDGE_CLASS, "fillMaxWidth", 1,
        """
        if-nez p0, :modifier
        sget-object p0, ${emptyModifier.descriptor}
        :modifier
        check-cast p0, $MODIFIER
        const/high16 v0, 0x3f800000
        invoke-static { p0, v0 }, ${fillMaxWidth.descriptor}
        move-result-object v0
        return-object v0
        """,
    )
}
