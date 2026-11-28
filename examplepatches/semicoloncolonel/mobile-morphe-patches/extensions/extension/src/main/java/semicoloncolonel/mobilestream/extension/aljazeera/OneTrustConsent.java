package semicoloncolonel.mobilestream.extension.aljazeera;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Locale;

/**
 * Answers Al Jazeera's OneTrust cookie banner before it is shown.
 *
 * When the banner is due, the consent is saved instead, as "Reject all", and the
 * Functional category is then switched back on: the app needs it for embedded
 * posts, such as those from X, which otherwise show a notice in their place.
 * The category is found by its name in the SDK's own group list when the SDK
 * serves one, and by OneTrust's standard ID for it, C0003, otherwise. The SDK is
 * called by reflection, so no OneTrust classes are needed to build this.
 */
@SuppressWarnings("unused")
public final class OneTrustConsent {
    private static final String TAG = "MSP-AlJazeera";
    private static final String FUNCTIONAL = "C0003";

    private OneTrustConsent() {
    }

    /**
     * Replaces OneTrust.shouldShowBanner(promise), the React Native method,
     * which has no spare registers for a check of its own. The promise gets
     * false when the consent was saved here, and the SDK's answer otherwise.
     */
    public static void shouldShowBanner(Object module, Object promise) {
        Object answer = Boolean.FALSE;
        try {
            Object sdk = sdkOf(module);
            if (!answerBanner(sdk) && sdk != null) {
                answer = sdk.getClass().getMethod("shouldShowBanner").invoke(sdk);
            }
        } catch (Throwable t) {
            Log.w(TAG, "shouldShowBanner failed: " + t);
        }
        try {
            promise.getClass().getMethod("resolve", Object.class).invoke(promise, answer);
        } catch (Throwable t) {
            Log.w(TAG, "could not resolve shouldShowBanner: " + t);
        }
    }

    private static Object sdkOf(Object module) throws Exception {
        java.lang.reflect.Field field = module.getClass().getDeclaredField("ot");
        field.setAccessible(true);
        return field.get(module);
    }

    /**
     * Saves the consent if the banner is due. True when it did, so the app is
     * told not to show the banner. False leaves the app's own check to run.
     */
    public static boolean answerBanner(Object sdk) {
        if (sdk == null) return false;
        try {
            Class<?> type = sdk.getClass();
            if (!(Boolean) type.getMethod("shouldShowBanner").invoke(sdk)) return false;

            type.getMethod("saveConsent", String.class).invoke(sdk, "Banner - Reject All");

            JSONObject data = (JSONObject) type.getMethod("getDomainGroupData").invoke(sdk);
            JSONArray groups = data == null ? null : data.optJSONArray("Groups");
            int allowed = 0;
            if (groups != null) {
                for (int i = 0; i < groups.length(); i++) {
                    JSONObject group = groups.optJSONObject(i);
                    if (group == null) continue;
                    String name = group.optString("GroupName").toLowerCase(Locale.ROOT);
                    String id = group.optString("CustomGroupId");
                    if (name.contains("functional") && !id.isEmpty()) {
                        type.getMethod("updatePurposeConsent", String.class, boolean.class).invoke(sdk, id, true);
                        allowed++;
                    }
                }
            }
            // In OneTrust's newer consent mode the group list is not served
            // here. C0003 is OneTrust's standard ID for Functional cookies,
            // and it is used when the SDK knows it (-1 means it does not).
            if (allowed == 0 && (Integer) type.getMethod("getConsentStatusForGroupId", String.class)
                    .invoke(sdk, FUNCTIONAL) >= 0) {
                type.getMethod("updatePurposeConsent", String.class, boolean.class).invoke(sdk, FUNCTIONAL, true);
                allowed++;
            }
            if (allowed > 0) {
                type.getMethod("saveConsent", String.class).invoke(sdk, "Preference Center - Confirm");
            }
            Log.i(TAG, "cookie banner answered: rejected all, functional groups allowed: " + allowed);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "could not answer the cookie banner: " + t);
            return false;
        }
    }
}
