package app.morphe.extension.youtube.patches.spoof;

import static app.morphe.extension.shared.spoof.SpoofVideoStreamsPatch.setClientsToUse;
import static app.morphe.extension.shared.spoof.SpoofVideoStreamsPatch.setForceAVC;

import java.util.List;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.spoof.ClientType;
import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public class SpoofVideoStreamsPatch {

    /** Default YouTube fallback order shared by playback spoofing and VOT audio downloads. */
    public static final List<ClientType> AVAILABLE_CLIENTS = List.of(
            ClientType.TV_SIMPLY,
            // The visionOS client is removed from the automatic fallback (Morphe 1438ba62).
            ClientType.ANDROID_CREATOR
            // If not signed in to Android VR, there may be playback issues.
            // Only use it if the user has selected it.
            // ClientType.ANDROID_VR_DASH
    );

    public static final class SpoofClientAv1Availability implements Setting.Availability {
        @Override
        public boolean isAvailable() {
            ClientType client = Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.get();
            return Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.isAvailable()
                    && (client == ClientType.ANDROID_VR_DASH || client == ClientType.ANDROID_VR_SABR
                    || client == ClientType.ANDROID_VR_EXPERIMENTAL
                    || client == ClientType.VISIONOS_1_02 || client == ClientType.VISIONOS_1_06);
        }

        @Override
        public List<Setting<?>> getParentSettings() {
            return List.of(Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE);
        }
    }

    /**
     * Injection point.
     */
    public static void setClientOrderToUse() {
        ClientType client = Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.get();

        // Keep the selected version; only substitute its AV1-capable device if Force AVC is off.
        if (Settings.SPOOF_VIDEO_STREAMS_AV1.get() && !Settings.FORCE_AVC_CODEC.get()) {
            client = switch (client) {
                case ANDROID_VR_DASH -> ClientType.ANDROID_XR_DASH;
                case ANDROID_VR_SABR -> ClientType.ANDROID_XR_SABR;
                case ANDROID_VR_EXPERIMENTAL -> ClientType.ANDROID_XR_EXPERIMENTAL;
                case VISIONOS_1_02 -> ClientType.VISIONOS_1_03;
                case VISIONOS_1_06 -> ClientType.VISIONOS_1_06_AV1;
                default -> client;
            };
        }

        // Pass Force AVC so VP9 formats are stripped (Morphe bb3e3ff0).
        setForceAVC(Settings.FORCE_AVC_CODEC.get());
        setClientsToUse(AVAILABLE_CLIENTS, client);
    }
}
