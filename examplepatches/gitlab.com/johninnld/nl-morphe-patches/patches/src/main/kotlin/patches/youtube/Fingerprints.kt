package patches.youtube

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Ported from Morphe Patches (GPLv3): layout/formfactor, misc/contexthook and misc/navigation.

internal const val MAIN_ACTIVITY = "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;"
internal const val CLIENT_INFO_CLASS = "Lcom/google/protos/youtube/api/innertube/InnertubeContext\$ClientInfo;"

internal val mainActivityOnCreateFingerprint = Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** Sets up the container of the navigation bar of the main activity. */
internal val initializeBottomBarContainerFingerprint = Fingerprint(
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "bottom_bar_container"),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "addOnLayoutChangeListener",
            parameters = listOf("Landroid/view/View\$OnLayoutChangeListener;"),
            returnType = "V",
        ),
    ),
)

internal val formFactorEnumConstructorFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("UNKNOWN_FORM_FACTOR", "SMALL_FORM_FACTOR", "LARGE_FORM_FACTOR", "AUTOMOTIVE_FORM_FACTOR"),
)

internal fun innerTubeClientConfigFingerprint(formFactorEnum: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = "Landroid/os/Build;", name = "MODEL", type = "Ljava/lang/String;"),
        fieldAccess(definingClass = formFactorEnum, type = "I", location = MatchAfterWithin(50)),
    ),
)

internal val repeatedItemSectionRendererFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf("Number of sectionList models must be equal to the number of section states"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Ljava/util/List;"),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            definingClass = "Ljava/util/List;",
            name = "get",
            parameters = listOf("I"),
            returnType = "Ljava/lang/Object;",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, location = MatchAfterImmediately()),
        opcode(Opcode.INVOKE_VIRTUAL, location = MatchAfterImmediately()),
        opcode(Opcode.INSTANCE_OF, location = MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, location = MatchAfterImmediately()),
        opcode(Opcode.IGET_OBJECT, location = MatchAfterImmediately()),
    ),
)

// region Client context of the requests.

internal val buildDummyClientContextBodyFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, name = "instance"),
        string("10.29", location = MatchAfterWithin(10)),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = CLIENT_INFO_CLASS,
            type = "Ljava/lang/String;",
            location = MatchAfterImmediately(),
        ),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = CLIENT_INFO_CLASS),
    ),
)

/** 21.33 and later. */
internal val authenticationChangeListenerFingerprint = Fingerprint(
    classFingerprint = Fingerprint(
        returnType = "Ljava/util/List;",
        parameters = listOf("Ljava/util/concurrent/Executor;", "Lcom/google/protobuf/MessageLite;", "L"),
        filters = listOf(string("processFutAsync")),
    ),
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "L", parameters = emptyList())),
)

/** 21.32 and earlier. */
internal val authenticationChangeListenerLegacyFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf("Authentication changed while request was being made"),
    filters = listOf(methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = emptyList(), returnType = "L")),
)

internal val clientFormFactorEnumOrdinalFingerprint = Fingerprint(
    classFingerprint = Fingerprint(
        accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
        strings = listOf(
            "UNKNOWN_FORM_FACTOR", "SMALL_FORM_FACTOR", "LARGE_FORM_FACTOR",
            "AUTOMOTIVE_FORM_FACTOR", "WEARABLE_FORM_FACTOR",
        ),
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    parameters = listOf("I"),
)

internal val browseEndpointParentFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("browseId"),
)

internal val getWatchEndpointConstructorFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("get_watch"),
)

internal val guideEndpointConstructorFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("guide"),
)

internal val nextEndpointParentFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("watchNextType"),
)

internal val reelItemWatchEndpointConstructorFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("reel/reel_item_watch"),
)

internal val reelWatchSequenceEndpointConstructorFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("reel/reel_watch_sequence"),
)

// endregion
