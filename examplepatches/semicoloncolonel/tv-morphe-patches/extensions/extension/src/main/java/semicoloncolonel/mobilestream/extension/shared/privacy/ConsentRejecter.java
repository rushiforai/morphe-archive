package semicoloncolonel.mobilestream.extension.shared.privacy;

import android.util.Log;

import java.lang.reflect.Method;

/**
 * Answers OneTrust's tracking consent prompt with Reject All.
 *
 * The Reject tracking consent patch passes every result of OneTrust's
 * OTPublishersHeadlessSDK.shouldShowBanner() through {@link #reject}. When
 * OneTrust wants to show its prompt, this saves the same consent the prompt's
 * Reject All button saves, and reports that there is no prompt to show. The SDK
 * is reached by reflection, because its classes are not on this module's
 * classpath.
 */
@SuppressWarnings("unused")
public final class ConsentRejecter {
    private static final String TAG = "ConsentRejecter";
    // OneTrust's OTConsentInteractionType.BANNER_REJECT_ALL.
    private static final String BANNER_REJECT_ALL = "Banner - Reject All";
    private static final ThreadLocal<Boolean> SAVING = new ThreadLocal<>();

    private ConsentRejecter() {
    }

    /** Called with shouldShowBanner()'s result. Always returns false. */
    public static boolean reject(Object sdk, boolean show) {
        if (!show || sdk == null || Boolean.TRUE.equals(SAVING.get())) return false;
        SAVING.set(Boolean.TRUE);
        try {
            Method saveConsent = sdk.getClass().getMethod("saveConsent", String.class);
            saveConsent.invoke(sdk, BANNER_REJECT_ALL);
            Log.i(TAG, "Saved Reject All for the tracking consent prompt");
        } catch (Throwable t) {
            Log.w(TAG, "Could not save Reject All", t);
        } finally {
            SAVING.set(Boolean.FALSE);
        }
        return false;
    }
}
