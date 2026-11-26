package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS = "Lapp/pomee4/extension/commentswipe/PostSwipe;"

/**
 * A test tag of the feed list, to find Modifier.testTag(tag): the call right after the tag.
 */
private const val FEED_LIST_TAG = "feed_lazy_column"

/**
 * Bars drawn over lists (app bars, the bottom navigation, feed bars) have test tags. Modifier.testTag
 * gets a hook, so the bars keep their layout coordinates and swipes are not drawn over them.
 */
internal fun BytecodePatchContext.barHook(positionModifier: PositionModifier) {
    val modifierType = positionModifier.modifierType
    val testTag = classDefByStrings(FEED_LIST_TAG, app.morphe.patcher.StringComparisonType.EQUALS)
        .asSequence()
        .flatMap { it.methods.asSequence() }
        .mapNotNull { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@mapNotNull null
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == FEED_LIST_TAG
            }
            if (index < 0) return@mapNotNull null
            instructions.drop(index + 1).take(3).firstNotNullOfOrNull { instruction ->
                if (instruction.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
                val call = (instruction as ReferenceInstruction).reference as MethodReference
                call.takeIf {
                    it.returnType == modifierType &&
                        it.parameterTypes.map { type -> type.toString() } == listOf(modifierType, "Ljava/lang/String;")
                }
            }
        }
        .firstOrNull() ?: throw PatchException("Modifier.testTag not found")

    val method = mutableClassDefBy(testTag.definingClass).methods.first {
        it.name == testTag.name && it.parameterTypes.map { type -> type.toString() } ==
            testTag.parameterTypes.map { type -> type.toString() } && it.returnType == testTag.returnType
    }
    method.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->onTestTag(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
            move-result-object p0
            check-cast p0, $modifierType
        """
    )
}
