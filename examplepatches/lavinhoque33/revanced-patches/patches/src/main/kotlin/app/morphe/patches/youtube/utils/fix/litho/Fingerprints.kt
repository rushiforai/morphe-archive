package app.morphe.patches.youtube.utils.fix.litho

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.checkCast
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.fingerprint.legacyFingerprint
import app.morphe.util.or
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// The null-bundle branch joins the final return instead of returning immediately on 21.45+.
internal val scrollPositionFingerprint = legacyFingerprint(
    name = "scrollPositionFingerprint",
    returnType = "V",
    accessFlags = AccessFlags.PROTECTED or AccessFlags.FINAL,
    parameters = listOf("Landroid/os/Bundle;"),
    opcodes = listOf(
        Opcode.IF_NEZ,
        Opcode.INVOKE_DIRECT
    ),
    strings = listOf("scroll_position")
)

internal val scrollTopFingerprint = legacyFingerprint(
    name = "scrollTopFingerprint",
    returnType = "V",
    accessFlags = AccessFlags.PUBLIC or AccessFlags.FINAL,
    parameters = emptyList(),
    opcodes = listOf(
        Opcode.CHECK_CAST,
        Opcode.CONST_4,
        Opcode.INVOKE_VIRTUAL,
        Opcode.GOTO,
        Opcode.IGET_OBJECT,
        Opcode.INVOKE_INTERFACE
    )
)

internal val scrollTopFingerprint2016 = legacyFingerprint(
    name = "scrollTopFingerprint2016",
    returnType = "V",
    accessFlags = AccessFlags.PUBLIC or AccessFlags.FINAL,
    parameters = emptyList(),
    opcodes = listOf(
        Opcode.CHECK_CAST,
        Opcode.CONST_4,
        Opcode.INVOKE_VIRTUAL,
        Opcode.GOTO,
        Opcode.IGET_OBJECT,
        Opcode.IF_EQZ,
        Opcode.INVOKE_INTERFACE
    )
)

internal object SwipeRefreshLayoutFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        methodCall(smali = "Landroid/view/View;->canScrollVertically(I)Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
    ),
    custom = { method, _ -> method.definingClass.endsWith("/SwipeRefreshLayout;") }
)

internal object RecyclerViewTopScrollingCallingMethodFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            returnType = "V",
            parameters = listOf()
        ),
        literal(45359224L, location = MatchAfterWithin(5)),
        literal(45414493L)
    )
)

context(_: BytecodePatchContext)
internal fun recyclerViewTopScrollingFingerprint() = object : Fingerprint(
    name = RecyclerViewTopScrollingCallingMethodFingerprint.instructionMatches.first().getMethodCalled().name,
    interfaces = listOf(
        RecyclerViewTopScrollingCallingMethodFingerprint.instructionMatches.first().getMethodCalled().definingClass
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(smali = "Ljava/util/Iterator;->next()Ljava/lang/Object;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        checkCast("Landroid/support/v7/widget/RecyclerView;", MatchAfterImmediately()),
        literal(0, location = MatchAfterImmediately()),
        methodCall(definingClass = "Landroid/support/v7/widget/RecyclerView;", location = MatchAfterImmediately()),
        opcode(Opcode.GOTO, MatchAfterImmediately())
    )
) {}

internal object backToRefreshFeatureFlagFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        literal(45359221L)
    )
)

private object PaneBackStackFingerprint : Fingerprint(
    returnType = "Landroid/os/Bundle;",
    filters = listOf(string("tabBackStack"))
)

// 21.45+ removed the feature flag; skip the scrolling call itself, not its result.
internal object BackToRefreshFingerprint : Fingerprint(
    classFingerprint = PaneBackStackFingerprint,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(smali = "Lj\$/util/OptionalInt;->getAsInt()I"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Z", parameters = listOf()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately())
    )
)

/** YouTube 21.33+ scrolls to related videos when playback ends. */
internal object ScrollToRelatedItemsOnVideoEndFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        literal(45825801L),
        literal(45825802L),
        string("related-items")
    )
)
