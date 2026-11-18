package io.github.jordanwoodson.patches.rumble.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import io.github.jordanwoodson.patches.shared.compose.calls
import io.github.jordanwoodson.patches.shared.compose.constStrings

// Rumble's UserPreferenceManager. Its constructor creates the DataStore keys by name.
internal object UserPreferencesFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("autoplayOnKey", "playbackInFeedKey", "backgroundPlayKey"),
)

// Builds the player for Home's featured video: (video, screen, playEvenIfFeedPlaybackIsOff, ...). Its class
// gets the "Playback in feeds" check injected, like the builder for ordinary feed cards, which takes more
// parameters.
internal object FeaturedVideoPlayerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "Ljava/lang/String;", "Z", "Lkotlin/jvm/functions/Function2;", "L"),
    custom = { _, classDef ->
        classDef.methods.any { it.name == "<init>" && "playbackInFeedsEnabledUseCase" in it.constStrings() }
    },
)

// Picks the source (one URL per quality) a video starts with: (sources, height, allowAuto, lowQuality). Auto
// when it is allowed and there is one, else the source nearest the height; the lowest with data saver.
internal object VideoSourceSelectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("Ljava/util/List;", "I", "Z", "Z"),
    filters = listOf(string("sourceList")),
)

// The player's quality switch, P4(videoSource): plays the source, re-prepares and seeks to the current
// position. Its catch logs with the "RumblePlayer" tag.
internal object QualitySwitchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("videoSource", "RumblePlayer"),
)

/**
 * The player's video load, F4(video): its one-parameter method returning a source that asks the start-source
 * [chooser]. Both of its callers set the player's current video to the same video first.
 */
internal fun MutableClass.videoLoad(chooser: Method): MutableMethod {
    val chooserCall = "${chooser.definingClass}->${chooser.name}(${chooser.parameterTypes.joinToString("")})" +
        chooser.returnType
    return methods.singleOrNull {
        it.parameterTypes.size == 1 && it.returnType == chooser.returnType && it.calls(chooserCall)
    } ?: throw PatchException("Rumble: no video load method in the player")
}

// DefineCurrentWatchPositionUseCase(video, resume, continuation): where a video starts. It reads the position
// kept on the phone, then uses the server's position signed in and 0 signed out.
internal object WatchPositionFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "Z", "L"),
    custom = { method, classDef ->
        method.name != "<init>" && classDef.methods.any { constructor ->
            constructor.name == "<init>" &&
                constructor.constStrings().containsAll(listOf("getLastPositionUseCase", "sessionManager"))
        }
    },
)
