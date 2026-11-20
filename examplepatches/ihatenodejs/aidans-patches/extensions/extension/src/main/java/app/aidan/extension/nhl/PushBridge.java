package app.aidan.extension.nhl;

import java.lang.reflect.Method;

/**
 * Runtime extension bridge for NHL push notification infrastructure and Live Activities.
 * Provides the official release certificate SHA-1 digest for Firebase Installations (FIS)
 * authentication and smart consent routing for push SDKs.
 */
public final class PushBridge {
    /**
     * Official NHL release signing certificate SHA-1 digest:
     * 9D:1B:1A:C8:28:E0:47:72:A7:34:91:D8:39:D9:85:2B:80:C4:66:92
     */
    private static final byte[] OFFICIAL_RELEASE_CERT_SHA1 = new byte[] {
        -99, 27, 26, -56, 40, -32, 71, 114, -89, 52, -111, -40, 57, -39, -123, 43, -128, -60, 102, -110
    };

    private PushBridge() {
    }

    /**
     * Returns the 20-byte SHA-1 hash of the official release signing certificate.
     * Spoofed in AndroidUtilsLight to allow re-signed APKs to obtain valid FCM tokens
     * via Firebase Installations API.
     */
    public static byte[] getCertificateHashBytes() {
        return OFFICIAL_RELEASE_CERT_SHA1.clone();
    }

    /**
     * Determines whether the given OneTrust tracking SDK enum instance corresponds
     * to a push notification or live activity delivery SDK rather than advertising or telemetry.
     *
     * @param qojEnum the Lqoj; enum instance evaluated by OneTrust consent checks
     * @return true if the SDK is required for push notification or live updates, false otherwise
     */
    public static boolean isPushConsented(final Object qojEnum) {
        if (qojEnum == null) {
            return false;
        }

        String name = null;
        if (qojEnum instanceof Enum<?>) {
            name = ((Enum<?>) qojEnum).name();
        } else {
            try {
                final Method nameMethod = qojEnum.getClass().getMethod("name");
                final Object result = nameMethod.invoke(qojEnum);
                if (result != null) {
                    name = result.toString();
                }
            } catch (final Throwable ignored) {
                name = qojEnum.toString();
            }
        }

        if (name == null) {
            return false;
        }

        return "UrbanAirshipCore".equals(name)
            || "UrbanAirshipFcm".equals(name)
            || "BlazePushSdk".equals(name);
    }
}
