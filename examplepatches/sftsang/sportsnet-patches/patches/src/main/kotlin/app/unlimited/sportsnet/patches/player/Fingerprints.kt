package app.unlimited.sportsnet.patches.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/** Shows the player's skip buttons and labels them with the server's skip interval in seconds. */
internal object SetSeekTimeFingerprint : Fingerprint(
    definingClass = "Lcom/deltatre/divamobilelib/ui/ControlActionView;",
    name = "setSeekTime",
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/String;", name = "valueOf"),
        methodCall(definingClass = "Ljava/lang/String;", name = "valueOf"),
    ),
)

/** The bitrate preferences the Sportsnet+ player applies to its track selector. */
internal object DivaBitratePreferencesFingerprint : Fingerprint(
    definingClass = "Lcom/deltatre/divamobilelib/models/DivaConfiguration;",
    name = "getBitratePreferences",
    returnType = "Lcom/deltatre/divacorelib/domain/shared/BitratePreferences;",
)

/** Sportsnet+ passes this as the player's HDR mode, which also shows the HDR setting. */
internal object SettingsButtonEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/feature/snplus/ui/player/SNPlusDivaPlayerViewModel\$Payload;",
    name = "isSettingsButtonEnabled",
    returnType = "Z",
)

/** Whether a player event should save the watch position to your account. */
internal object ShouldSetBookmarkFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/feature/snplus/ui/player/SNPlusDivaPlayerViewModel;",
    name = "getShouldSetBookmark",
    returnType = "Z",
    parameters = listOf("Lcom/deltatre/divacorelib/data/analytics/AnalyticsEvent;"),
)
