package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.findFreeRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/pomee4/extension/commentswipe/PostSwipe;"
private const val OVERFLOW_EVENT = "Lcom/reddit/feeds/ui/events/OnOverflowMenuOpened;"

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference

/**
 * Post previews: text posts that the feeds show with a header, a title and a preview of their text. They
 * have their own section, so they get their own hooks: the modifier of their content gets a position
 * callback, and their post ids are read the way their own long press reads them.
 *
 * @param contextType The feed context, which takes the feed events.
 */
internal fun BytecodePatchContext.previewPosts(positionModifier: PositionModifier, contextType: String) {
    val modifierType = positionModifier.modifierType
    val section = PostPreviewSectionToStringFingerprint.originalClassDef
    val elementField = constructorFields(section)[0]
        ?: throw PatchException("No element field in ${section.type}")

    // The long press of the post: it reads the element and sends OnOverflowMenuOpened(linkId, uniqueId,
    // promoted, menu type (recommended or not), trigger, identifier, subreddit member).
    fun Method.isLongPress(): Boolean {
        val instructions = implementation?.instructions ?: return false
        return instructions.any { it.opcode == Opcode.IGET_OBJECT && it.reference() == elementField } &&
            instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.reference().toString() == OVERFLOW_EVENT }
    }
    val longPress = classDefByOrNull { classDef -> classDef.methods.any { it.isLongPress() } }
        ?.methods?.first { it.isLongPress() }
        ?: throw PatchException("No long press of ${section.type}")
    val instructions = longPress.implementation!!.instructions.toList()
    val start = instructions.indexOfFirst {
        it.opcode == Opcode.IGET_OBJECT && it.reference() == elementField
    }
    val constructorIndex = instructions.withIndex().indexOfFirst { (index, instruction) ->
        index > start && instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
            (instruction.reference() as? MethodReference)?.definingClass == OVERFLOW_EVENT
    }
    if (start < 0 || constructorIndex < 0) throw PatchException("Unexpected long press of ${section.type}")

    // The element method whose result is in each register when the event is created.
    val resultOf = mutableMapOf<Int, MethodReference>()
    for (index in start until constructorIndex) {
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.INVOKE_INTERFACE) continue
        val method = instruction.reference() as MethodReference
        val next = instructions[index + 1]
        if (next.opcode == Opcode.MOVE_RESULT_OBJECT || next.opcode == Opcode.MOVE_RESULT) {
            resultOf[(next as OneRegisterInstruction).registerA] = method
        }
    }
    val constructor = instructions[constructorIndex] as RegisterRangeInstruction
    fun argument(parameter: Int) = resultOf[constructor.startRegister + 1 + parameter]
        ?: throw PatchException("No element value for OnOverflowMenuOpened parameter $parameter")
    val linkId = argument(0)
    val uniqueId = argument(1)
    val promoted = argument(2)
    val identifier = argument(5)
    val subredditMember = argument(6)
    // The menu type is "recommended" when the recommendation context of the element is set.
    val recommendation = resultOf.values.firstOrNull { method ->
        method !in listOf(linkId, uniqueId, promoted, identifier, subredditMember) &&
            method.returnType.startsWith("L") && method.returnType != "Ljava/lang/String;"
    } ?: throw PatchException("No recommendation context in the long press of ${section.type}")

    fun elementCall(name: String, method: MethodReference) {
        val (move, ret) = if (method.returnType == "Z") "move-result p1" to "return p1"
        else "move-result-object p1" to "return-object p1"
        implementStub(
            name, if (method.returnType == "Z") "Z" else if (method.returnType == "Ljava/lang/String;") "Ljava/lang/String;" else "Ljava/lang/Object;",
            """
                check-cast p0, ${section.type}
                iget-object p0, p0, $elementField
                invoke-interface { p0 }, $method
                $move
                $ret
            """
        )
    }
    elementCall("previewLinkKindWithId", linkId)
    elementCall("previewUniqueId", uniqueId)
    elementCall("previewIdentifier", identifier)
    elementCall("previewPromoted", promoted)
    elementCall("previewSubredditMember", subredditMember)
    implementStub(
        "previewRecommended", "Z",
        """
            check-cast p0, ${section.type}
            iget-object p0, p0, $elementField
            invoke-interface { p0 }, $recommendation
            move-result-object p0
            if-eqz p0, :not_recommended
            const/4 p1, 0x1
            return p1
            :not_recommended
            const/4 p1, 0x0
            return p1
        """
    )

    // The content of the post: (context, ..., modifier, composer, changed). It does not lay out its
    // modifier parameter. Its container starts with its own onGloballyPositioned on the default modifier:
    // sget-object vM, <default Modifier>; invoke-static { vM, vCallback }, <onGloballyPositioned>.
    // The position callback is added to that default modifier.
    val content = mutableClassDefBy(section.type).methods.firstOrNull { method ->
        val parameters = method.parameterTypes.map { it.toString() }
        method.implementation != null && parameters.firstOrNull() == contextType && modifierType in parameters
    } ?: throw PatchException("No content composable with a modifier in ${section.type}")
    val contentInstructions = content.implementation!!.instructions.toList()
    val positionedIndex = contentInstructions.indices.firstOrNull { index ->
        index > 0 && contentInstructions[index].opcode == Opcode.INVOKE_STATIC &&
            contentInstructions[index].reference() == positionModifier.onGloballyPositioned &&
            contentInstructions[index - 1].opcode == Opcode.SGET_OBJECT
    } ?: throw PatchException("No onGloballyPositioned on the container of ${section.type}")
    val positionedCall = contentInstructions[positionedIndex] as FiveRegisterInstruction
    val modifierRegister = positionedCall.registerC
    val first = content.findFreeRegister(positionedIndex, modifierRegister, positionedCall.registerD)
    val second = content.findFreeRegister(positionedIndex, modifierRegister, positionedCall.registerD, first)
    if (modifierRegister > 15 || first > 15 || second > 15) {
        throw PatchException("Registers too high for the post preview hook in ${section.type}")
    }
    content.addInstructions(
        positionedIndex,
        """
            move-object/from16 v$first, p0
            move-object/from16 v$second, p1
            invoke-static { v$modifierRegister, v$first, v$second }, $EXTENSION_CLASS->onPreviewPost(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$modifierRegister
            check-cast v$modifierRegister, $modifierType
        """
    )
}
