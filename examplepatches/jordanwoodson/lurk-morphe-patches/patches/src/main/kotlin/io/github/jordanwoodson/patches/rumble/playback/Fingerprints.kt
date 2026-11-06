package io.github.jordanwoodson.patches.rumble.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.jordanwoodson.patches.shared.compose.constStrings

// Rumble's UserPreferenceManager. Its constructor creates the DataStore keys by name.
internal object UserPreferencesFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("autoplayOnKey", "playbackInFeedKey", "videoQualityKey"),
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

// Picks the source (one URL per quality) a video starts with:
// (sources, preferred height, preferred bitrate, default height, isLive, lowQuality, liveUsesAuto).
internal object VideoSourceSelectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("Ljava/util/List;", "Ljava/lang/Integer;", "Ljava/lang/Integer;", "I", "Z", "Z", "Z"),
    filters = listOf(string("sourceList")),
)

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
