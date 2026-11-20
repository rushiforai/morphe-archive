package id.ikuradachi.patches.crunchyroll.player.upnext

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object UpNextBannerViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L", "L", "L", "L", "L"),
    filters = listOf(
        string("nextEpisodeMetadata"),
        string("isAutoPlayEnabled"),
        string("contentAvailabilityProvider"),
        opcode(Opcode.NEW_INSTANCE),
        methodCall(
            name = "<init>",
            parameters = listOf("L"),
            location = InstructionLocation.MatchAfterImmediately(),
        ),
        literal(5, location = InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.NEW_ARRAY, InstructionLocation.MatchAfterImmediately()),
    ),
)

fun createUpNextVisibilityWindowFingerprint(upNextVisibilityClass: String) = Fingerprint(
    definingClass = upNextVisibilityClass,
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(10000L),
        opcode(Opcode.CMP_LONG, InstructionLocation.MatchAfterImmediately()),
    ),
)

object UpNextCountdownProgressFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "up_next_in"),
        literal(10000.0f),
    ),
)
