package patches.gboard.features.lanftp

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardLanFtpFeatureMarkerPatch = resourcePatch(
    description = "Mark the LAN FTP Server feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(LAN_FTP_FEATURE_MARKER)
    }
}

internal const val LAN_FTP_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.lan_ftp_server"
