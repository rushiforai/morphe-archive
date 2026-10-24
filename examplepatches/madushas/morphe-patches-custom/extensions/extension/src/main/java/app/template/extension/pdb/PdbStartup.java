package app.template.extension.pdb;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * Applies the "Morphe Extras" rows to Pdb's own preference store.
 *
 * <p>Called as early as possible (from {@link PdbInitProvider}, which Android
 * instantiates before {@code Application.onCreate()}, and from a hook in
 * {@code pdb.app.App.attachBaseContext(Context)}), so the values are in place
 * before the app reads them.
 *
 * <p>The patch-time unlocks (premium, ads) are written unconditionally on every
 * start — they have no switch. Every other switch writes the mapped app preference
 * to an explicit {@code true} or {@code false} and every text row either writes its
 * value or removes the app key, so turning a row off actually reverts the app
 * setting instead of silently leaving the previous run's value behind.
 */
public final class PdbStartup {

    private static final String TAG = "PdbExtras";
    private static volatile boolean applied = false;

    private PdbStartup() {}

    /** Hooked from {@code pdb.app.App.attachBaseContext(Context)}. */
    public static void onAppCreate(Context context) {
        applyDefaults(context);
    }

    public static synchronized void applyDefaults(Context context) {
        if (applied || context == null) return;
        applied = true;

        try {
            PdbMmkv.init(context);
            SharedPreferences sp = PdbSettings.prefs(context);

            if (PdbSettings.getBool(sp, PdbSettings.GLOBAL_PAUSE, false)) {
                Log.i(TAG, "global pause set \u2014 leaving app preferences untouched");
                return;
            }

            SharedPreferences.Editor e = sp.edit();

            /* Patch-time always-on unlocks. No switch on purpose: premium and ad
               removal are baked in by the bytecode patches, and these two writes
               drive the app's own backdoor prefs so every code path agrees. */
            e.putBoolean(PdbSettings.PDB_MOCK_PRO, true);
            e.putBoolean(PdbSettings.PDB_AD_OFF, true);

            boolean receipts = PdbSettings.getBool(sp, PdbSettings.PRIVACY_RECEIPTS, true);
            boolean seeMore  = PdbSettings.getBool(sp, PdbSettings.PRIVACY_SEE_MORE, true);
            boolean remember = PdbSettings.getBool(sp, PdbSettings.REMEMBER_AUTH, true);
            boolean offer    = PdbSettings.getBool(sp, PdbSettings.FORCE_OFFER, false);
            boolean staging  = PdbSettings.getBool(sp, PdbSettings.API_STAGING, false);
            boolean fullErr  = PdbSettings.getBool(sp, PdbSettings.SHOW_FULL_ERROR, false);
            boolean imToast  = PdbSettings.getBool(sp, PdbSettings.IM_CONNECT_TOAST, false);
            boolean english  = PdbSettings.getBool(sp, PdbSettings.FORCE_ENGLISH, false);
            boolean verbose  = PdbSettings.getBool(sp, PdbSettings.ADVANCED_LOGGING, false);
            boolean ids      = PdbSettings.getBool(sp, PdbSettings.IDS_EVERYWHERE, false);
            boolean noVisLim = PdbSettings.getBool(sp, PdbSettings.NO_VISITOR_LIMIT, false);

            // "IDs everywhere": the bytecode patch (IdsEverywherePatch) reroutes the
            // profile model's name() getter through PdbUi.decorateName(); this static
            // flag is what it reads, so it must be set before any UI renders.
            PdbUi.IDS_EVERYWHERE = ids;

            // Limit extension: read by the patched Lnjf->invoke() comparison.
            PdbLimits.NO_VISITOR_LIMIT = noVisLim;

            // Privacy.
            e.putBoolean(PdbSettings.PDB_NO_READ, receipts);
            e.putBoolean(PdbSettings.PDB_IGNORE_SEE, seeMore);

            // Session + diagnostics.
            e.putBoolean(PdbSettings.PDB_REMEMBER_AUTH, remember);
            e.putBoolean(PdbSettings.PDB_SHOW_ERROR, fullErr);
            e.putBoolean(PdbSettings.PDB_IM_TOAST, imToast);

            // Hidden dev switches the stock UI never exposes.
            e.putBoolean(PdbSettings.PDB_FORCE_OFFER, offer);
            e.putBoolean(PdbSettings.PDB_API_STAGING, staging);
            e.putBoolean(PdbSettings.PDB_FORCE_EN, english);

            // Verbose logging: "4" is the app's own "info" level; removing the key
            // restores the app default when the switch is off.
            if (verbose) {
                e.putString(PdbSettings.PDB_LOG_LEVEL, "4");
            } else {
                e.remove(PdbSettings.PDB_LOG_LEVEL);
            }

            // Text overrides: an empty row clears the app key again.
            String country = applyText(e, sp, PdbSettings.GEO_COUNTRY, PdbSettings.PDB_GEO_COUNTRY);
            String host    = applyText(e, sp, PdbSettings.WHITELIST_HOST, PdbSettings.PDB_WHITELIST);
            String bubble  = applyText(e, sp, PdbSettings.BUBBLE_URL, PdbSettings.PDB_BUBBLE_URL);
            String latLng  = applyText(e, sp, PdbSettings.MOCK_LATLNG, PdbSettings.PDB_MOCK_LATLNG);
            String instant = applyText(e, sp, PdbSettings.INSTANT_CHAT_USER, PdbSettings.PDB_IM_CHAT_USER);

            e.apply();

            Log.i(
                TAG,
                "extras applied: mockPro=true adOff=true"
                    + " receipts=" + receipts
                    + " seeMore=" + seeMore
                    + " rememberAuth=" + remember
                    + " forceOffer=" + offer
                    + " staging=" + staging
                    + " fullError=" + fullErr
                    + " imToast=" + imToast
                    + " english=" + english
                    + " verbose=" + verbose
                    + " idsEverywhere=" + ids
                    + " country=" + quoted(country)
                    + " whitelistHost=" + quoted(host)
                    + " bubbleUrl=" + quoted(bubble)
                    + " mockLatLng=" + quoted(latLng)
                    + " instantChatUser=" + quoted(instant)
            );
        } catch (Throwable t) {
            Log.w(TAG, "applyDefaults failed", t);
        }
    }

    /**
     * Copies one text row onto the app's own key.
     *
     * @return the value that was written, or {@code null} when the row is empty and
     *     the app key was removed.
     */
    private static String applyText(
        SharedPreferences.Editor e,
        SharedPreferences sp,
        String morpheKey,
        String appKey
    ) {
        String value = PdbSettings.getString(sp, morpheKey, "");
        if (value == null) value = "";
        value = value.trim();
        if (value.isEmpty()) {
            e.remove(appKey);
            return null;
        }
        e.putString(appKey, value);
        return value;
    }

    private static String quoted(String value) {
        return value == null ? "-" : "'" + value + "'";
    }
}
