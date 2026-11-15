package app.drbushytop.extension.relay;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Base64;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Answers Relay's ad consent request with "reject all", instead of showing Google's consent form.
 *
 * <p>Google's form (the User Messaging Platform) is an IAB TCF consent tool: it stores the answer
 * in the app's default SharedPreferences under the standard {@code IABTCF_*} keys, where Relay's ad
 * networks (AdMob, AppLovin, InMobi, Amazon, Nimbus) read it. This stores the answer the form's
 * "Reject all" gives: no consent and no legitimate interest for any purpose, special feature or
 * vendor, so nothing beyond what strictly needs no consent. Any answer stored before is removed.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class RejectAdConsent {
    private static final String TAG = "RelayAdConsent";

    /** Google's consent tool, the one the answer is stored for. */
    private static final int CMP_ID = 300;
    private static final int CMP_VERSION = 1;
    /** TCF policy version 5 (TCF 2.3) and the Global Vendor List version current at writing. */
    private static final int TCF_POLICY_VERSION = 5;
    private static final int VENDOR_LIST_VERSION = 185;
    /** Purposes 1 to 11 and special features 1 and 2, none allowed. */
    private static final String NO_PURPOSES = "00000000000";
    private static final String NO_SPECIAL_FEATURES = "00";
    /**
     * No vendor allowed. Relay reads "0" (and a missing value) as no consent, but an empty string
     * as consent, so this is never left empty.
     */
    private static final String NO_VENDORS = "0";

    private static volatile boolean answered;

    private RejectAdConsent() {
    }

    /**
     * Hook: stands in for "consent was obtained". True once this run's answer is stored, which
     * makes Relay pass it on to each ad network as an explicit no. False before that, so Relay
     * goes through the form step (and {@link #rejectAll}) on every start, replacing any answer
     * given before.
     */
    public static boolean answered() {
        return answered;
    }

    /** Hook: replaces loading and showing Google's consent form. */
    public static void rejectAll(Context context) {
        try {
            if (context == null) return;
            // Where Google's form and Relay's ad networks keep and read it.
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
            SharedPreferences.Editor editor = prefs.edit();
            // Drop every earlier answer, including ones this patch does not write itself
            // (publisher restrictions, the GPP strings).
            for (String key : prefs.getAll().keySet()) {
                if (key.startsWith("IABTCF_") || key.startsWith("IABGPP_")) editor.remove(key);
            }
            editor.putInt("IABTCF_CmpSdkID", CMP_ID)
                    .putInt("IABTCF_CmpSdkVersion", CMP_VERSION)
                    .putInt("IABTCF_PolicyVersion", TCF_POLICY_VERSION)
                    .putInt("IABTCF_gdprApplies", 1)
                    .putString("IABTCF_PublisherCC", "AA")
                    .putInt("IABTCF_PurposeOneTreatment", 0)
                    .putInt("IABTCF_UseNonStandardTexts", 0)
                    .putString("IABTCF_TCString", tcString())
                    .putString("IABTCF_VendorConsents", NO_VENDORS)
                    .putString("IABTCF_VendorLegitimateInterests", NO_VENDORS)
                    .putString("IABTCF_PurposeConsents", NO_PURPOSES)
                    .putString("IABTCF_PurposeLegitimateInterests", NO_PURPOSES)
                    .putString("IABTCF_SpecialFeaturesOptIns", NO_SPECIAL_FEATURES)
                    .putString("IABTCF_PublisherConsent", NO_PURPOSES)
                    .putString("IABTCF_PublisherLegitimateInterests", NO_PURPOSES)
                    .putString("IABTCF_PublisherCustomPurposesConsents", "0")
                    .putString("IABTCF_PublisherCustomPurposesLegitimateInterests", "0")
                    // Google's Additional Consent: no consent for, and no disclosure of, any
                    // provider outside the IAB list.
                    .putString("IABTCF_AddtlConsent", "2~~dv.")
                    .apply();
            answered = true;
            if (Log.isLoggable(TAG, Log.DEBUG)) Log.d(TAG, "rejected all: " + tcString());
        } catch (Throwable t) {
            Log.e(TAG, "rejectAll", t);
        }
    }

    /** A TC string whose core segment allows nothing, with an empty disclosed vendors segment. */
    static String tcString() {
        // TCF asks for the creation time rounded to the day.
        long day = TimeUnit.DAYS.toMillis(TimeUnit.MILLISECONDS.toDays(System.currentTimeMillis()));
        long deciseconds = day / 100;

        Bits core = new Bits();
        core.add(2, 6);                    // Version
        core.add(deciseconds, 36);         // Created
        core.add(deciseconds, 36);         // LastUpdated
        core.add(CMP_ID, 12);
        core.add(CMP_VERSION, 12);
        core.add(1, 6);                    // ConsentScreen
        core.letters("EN");                // ConsentLanguage
        core.add(VENDOR_LIST_VERSION, 12);
        core.add(TCF_POLICY_VERSION, 6);
        core.add(1, 1);                    // IsServiceSpecific
        core.add(0, 1);                    // UseNonStandardTexts
        core.add(0, 12);                   // SpecialFeatureOptIns
        core.add(0, 24);                   // PurposesConsent
        core.add(0, 24);                   // PurposesLITransparency
        core.add(0, 1);                    // PurposeOneTreatment
        core.letters("AA");                // PublisherCC
        core.add(0, 16);                   // Vendor consents: MaxVendorId 0,
        core.add(0, 1);                    //   bit field (empty)
        core.add(0, 16);                   // Vendor legitimate interests: MaxVendorId 0,
        core.add(0, 1);                    //   bit field (empty)
        core.add(0, 12);                   // NumPubRestrictions

        Bits disclosed = new Bits();
        disclosed.add(1, 3);               // SegmentType: disclosed vendors
        disclosed.add(0, 16);              // MaxVendorId 0
        disclosed.add(0, 1);               // bit field (empty)

        return core.base64() + "." + disclosed.base64();
    }

    private static final class Bits {
        private final List<Boolean> bits = new ArrayList<>();

        void add(long value, int width) {
            for (int i = width - 1; i >= 0; i--) bits.add(((value >>> i) & 1) == 1);
        }

        /** Two letters, 6 bits each, A = 0. */
        void letters(String code) {
            add(code.charAt(0) - 'A', 6);
            add(code.charAt(1) - 'A', 6);
        }

        String base64() {
            byte[] bytes = new byte[(bits.size() + 7) / 8];
            for (int i = 0; i < bits.size(); i++) {
                if (bits.get(i)) bytes[i / 8] |= (byte) (0x80 >>> (i % 8));
            }
            return Base64.encodeToString(bytes, Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
        }
    }
}
