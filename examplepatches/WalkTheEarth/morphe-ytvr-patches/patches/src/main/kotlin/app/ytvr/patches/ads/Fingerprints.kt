package app.ytvr.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches the method that turns the ad placements of a player response
 * into a list of ad breaks to schedule. Returning an empty list here
 * prevents preroll, midroll, postroll and pause ads from ever being scheduled.
 *
 * The class and method names are obfuscated and expected to change between
 * app versions, so only the signature and a distinguishing call are matched.
 */
object AdBreakRendererFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("Lmoq;"),
    filters = listOf(
        // Reads the ad placements out of the player response.
        methodCall(
            definingClass = "Lmoq;",
            name = "G",
            returnType = "Ljava/util/List;",
        ),

        // Schedules the breaks with a priority queue.
        opcode(Opcode.NEW_INSTANCE, MatchAfterWithin(16)),
    )
)

/**
 * Matches the method that performs the network request for an ad break
 * ("player/ad_break"). Returning null here prevents ad break responses
 * from ever being fetched.
 *
 * The class and method names are obfuscated and expected to change between
 * app versions, so only the signature and a distinguishing string are matched.
 */
object AdBreakRequestFingerprint : Fingerprint(
    returnType = "Lmly;",
    parameters = listOf(
        "Ljava/lang/String;",
        "[B",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J",
        "J",
        "I",
        "J",
        "Lgbe;",
        "Z",
    ),
    strings = listOf("Exception when trying to request AdBreakResponseModel: "),
)

/**
 * Matches the method that loads the ads stored for offline playback.
 * Returning an empty map here prevents offline ads from ever being loaded.
 *
 * The class and method names are obfuscated and expected to change between
 * app versions, so only the signature and a distinguishing string are matched.
 */
object OfflineAdsFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    strings = listOf(" FROM ads LEFT JOIN ad_videos ON "),
)
