package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val EXTENSION_CLASS = "Lapp/pomee4/extension/commentswipe/PostSwipe;"
private const val OPEN_POST_EVENT = "Lcom/reddit/feeds/ui/events/OnClickLink;"

private fun Instruction.isNewOpenPostEvent() =
    opcode == Opcode.NEW_INSTANCE && (this as ReferenceInstruction).reference.toString() == OPEN_POST_EVENT

/**
 * onGloballyPositioned(Modifier, Function1), the default Modifier and the Modifier type.
 */
internal class PositionModifier(
    val onGloballyPositioned: MethodReference,
    val defaultModifier: FieldReference,
    val modifierType: String,
)

/**
 * Finds onGloballyPositioned as the feed post card uses it, and implements the extension method that adds
 * a position callback to a modifier.
 *
 * @param cardInvoke The content lambda of feed post cards.
 */
internal fun BytecodePatchContext.positionModifier(cardInvoke: Method): PositionModifier {
    // onGloballyPositioned(Modifier, Function1) and the default Modifier, as the feed post card uses them:
    // sget-object vX, <default Modifier>; invoke-static { vX, vY }, <onGloballyPositioned>.
    val cardInstructions = cardInvoke.implementation!!.instructions.toList()
    val positionedIndex = cardInstructions.indices.firstOrNull { index ->
        val instruction = cardInstructions[index]
        if (index == 0 || instruction.opcode != Opcode.INVOKE_STATIC) return@firstOrNull false
        val method = (instruction as ReferenceInstruction).reference as MethodReference
        val parameters = method.parameterTypes.map { it.toString() }
        parameters.size == 2 && parameters[1] == "Lkotlin/jvm/functions/Function1;" &&
            method.returnType == parameters[0] && cardInstructions[index - 1].opcode == Opcode.SGET_OBJECT
    } ?: throw PatchException("No onGloballyPositioned call in the post card")
    val onGloballyPositioned = (cardInstructions[positionedIndex] as ReferenceInstruction).reference as MethodReference
    val defaultModifier = (cardInstructions[positionedIndex - 1] as ReferenceInstruction).reference as FieldReference
    val modifierType = onGloballyPositioned.parameterTypes[0].toString()

    implementStub(
        "withPositionCallback", "Ljava/lang/Object;",
        """
            if-nez p0, :modifier
            sget-object p0, $defaultModifier
            :modifier
            check-cast p0, $modifierType
            check-cast p1, Lkotlin/jvm/functions/Function1;
            invoke-static { p0, p1 }, $onGloballyPositioned
            move-result-object p0
            return-object p0
        """
    )
    return PositionModifier(onGloballyPositioned, defaultModifier, modifierType)
}

/**
 * Conversation posts: text posts that the feeds show with their top comments. They have their own
 * section, so they get their own hooks: the modifier of their content gets a position callback, and their
 * post ids come from the fields their own Open post event uses.
 *
 * @param contextType The feed context, which takes the feed events.
 */
internal fun BytecodePatchContext.conversationPosts(positionModifier: PositionModifier, contextType: String) {
    val modifierType = positionModifier.modifierType
    val section = ConversationPostSectionToStringFingerprint.originalClassDef
    val elementField = constructorFields(section)[0]
        ?: throw PatchException("No element field in ${section.type}")

    // The lambda that opens the post sends OnClickLink(linkId, uniqueId, ..., PostId(postId), ...).
    fun Method.opensPost() = implementation?.instructions?.any { it.isNewOpenPostEvent() } == true
    val openLambda = classDefByOrNull { classDef ->
        classDef.methods.any { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() }.containsAll(listOf(section.type, contextType))
        } && classDef.methods.any { it.opensPost() }
    } ?: throw PatchException("No Open post lambda of ${section.type}")
    val openInstructions = openLambda.methods.first { it.opensPost() }.implementation!!.instructions.toList()
    val afterEvent = openInstructions.drop(openInstructions.indexOfFirst { it.isNewOpenPostEvent() } + 1)
    val idFields = afterEvent
        .filter { it.opcode == Opcode.IGET_OBJECT }
        .take(3)
        .map { (it as ReferenceInstruction).reference as FieldReference }
    if (idFields.size != 3 || idFields.any { it.type != "Ljava/lang/String;" }) {
        throw PatchException("Unexpected Open post event fields: $idFields")
    }
    val (linkIdField, uniqueIdField, postIdField) = idFields
    val postIdType = (afterEvent.first { it.opcode == Opcode.NEW_INSTANCE } as ReferenceInstruction).reference.toString()

    fun elementString(name: String, field: FieldReference) = implementStub(
        name, "Ljava/lang/String;",
        """
            check-cast p0, ${section.type}
            iget-object p0, p0, $elementField
            iget-object p0, p0, $field
            return-object p0
        """
    )
    elementString("conversationLinkKindWithId", linkIdField)
    elementString("conversationUniqueId", uniqueIdField)
    implementStub(
        "conversationIdentifier", "Ljava/lang/Object;",
        """
            check-cast p0, ${section.type}
            iget-object p0, p0, $elementField
            iget-object p0, p0, $postIdField
            new-instance p1, $postIdType
            invoke-direct { p1, p0 }, $postIdType-><init>(Ljava/lang/String;)V
            return-object p1
        """
    )

    // The content of the post is laid out by a call that takes the modifier.
    val composable = mutableClassDefBy(section.type).methods.first { method ->
        method.returnType == "V" && method.parameterTypes.size == 3 &&
            method.parameterTypes[0].toString() == contextType
    }
    val instructions = composable.implementation!!.instructions.toList()
    val callIndex = instructions.indexOfLast { instruction ->
        instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((instruction as ReferenceInstruction).reference as MethodReference).parameterTypes
                .any { it.toString() == modifierType }
    }
    if (callIndex < 0) throw PatchException("No content call with a modifier in ${section.type}")
    val call = composable.getInstruction<RegisterRangeInstruction>(callIndex)
    var modifierRegister = call.startRegister
    val callMethod = (instructions[callIndex] as ReferenceInstruction).reference as MethodReference
    for (type in callMethod.parameterTypes.map { it.toString() }) {
        if (type == modifierType) break
        modifierRegister += if (type == "J" || type == "D") 2 else 1
    }
    val thisRegister = composable.implementation!!.registerCount - MethodUtil.getParameterRegisterCount(composable)
    if (modifierRegister > 15 || thisRegister + 1 > 15) {
        throw PatchException("Registers too high for the conversation post hook in ${section.type}")
    }
    composable.addInstructions(
        callIndex,
        """
            invoke-static { v$modifierRegister, p0, p1 }, $EXTENSION_CLASS->onConversationPost(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$modifierRegister
            check-cast v$modifierRegister, $modifierType
        """
    )
}
