/*
 * The navigation bar fingerprints are adapted from Morphe patches
 * (https://github.com/MorpheApp/morphe-patches), GPLv3. See NOTICE.
 */
package app.orangetree.ytmaitag.patches.youtube.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** Field number of pivotBarItemRenderer in the navigation bar item proto. */
private const val PIVOT_BAR_ITEM_RENDERER = 117501096L

/**
 * Stores the navigation bar items made from the guide response.
 * The list is set to a field of the class, which is where the items are swapped.
 */
internal object PivotBarRendererListFingerprint : Fingerprint(
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "L"
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            parameters = listOf("L"),
            returnType = "L"
        ),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "this",
            type = "L"
        ),
        literal(45633821L),
    )
)

/**
 * Converts the navigation bar item proto to the item used by the navigation bar.
 */
internal object PivotBarRendererFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("L"),
    returnType = "Lj$/util/Optional;",
    filters = listOf(
        literal(PIVOT_BAR_ITEM_RENDERER),
        opcode(Opcode.IF_NE),
        opcode(Opcode.CHECK_CAST),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            definingClass = "this",
            name = "<init>",
            returnType = "V"
        ),
        opcode(Opcode.RETURN_OBJECT)
    )
)

/**
 * Makes a navigation bar item proto from a browse id, a label and an icon.
 * Used for the navigation bar shown before the guide response is loaded.
 * Newer app versions add a boolean parameter at the end.
 */
internal object PivotBarItemProtoFactoryFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    filters = listOf(
        literal(PIVOT_BAR_ITEM_RENDERER)
    ),
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
        (parameters.size == 3 || (parameters.size == 4 && parameters[3] == "Z")) &&
            parameters[0] == "Ljava/lang/String;" &&
            parameters[1] == "Ljava/lang/String;" &&
            parameters[2].startsWith("L")
    }
)
