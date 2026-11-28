package semicoloncolonel.mobilestream.extension.nytimes.misc;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * "Library pass reminder" for The New York Times (opt-in, off by default).
 *
 * The patron reads the NYT through a library pass that attaches to their NYT
 * account and lasts a set time (e.g. 72 hours), so it must be re-redeemed at
 * the library's EZproxy link. This shows a short dialog whose button opens
 * that redeem link in a browser, so the patron re-runs the proper redeem flow
 * in one tap instead of hunting for the URL.
 *
 * Primary trigger (status-based): the patch records the account's
 * {@code SubscriptionLevel} from NYT's own user-state getter, and on each
 * foreground ({@code BaseAppCompatActivity.onStart}) this checks it. It prompts
 * only when the level is {@code REGISTERED} — signed in, but with no active
 * subscription or entitlement, i.e. the pass has lapsed (or was never active).
 * It stays silent for {@code ANONYMOUS} (not signed in) and for any subscribed
 * level. This reads the app's real entitlement state, so it makes no assumption
 * about how long a given library's pass lasts.
 *
 * Fallback trigger (gateway): if the status read is unavailable, the patch also
 * calls {@link #onGatewayShown} from the paywall/meter card, which prompts when
 * the gateway appears (the app's own "no active entitlement" verdict).
 *
 * This does NOT remove, suppress, or weaken the paywall, and never submits or
 * stores a code: it only opens the patron's saved link in a browser, and does
 * nothing when that link is blank.
 */
@SuppressWarnings("unused")
public final class LibraryPassReminder {
    private static final String TAG = "MSP-NYT-LIBPASS";
    private static final String PREFS = "msp_nyt_library_pass";
    private static final String KEY_LAST_SHOWN = "last_shown";
    // At most one reminder every six hours.
    private static final long COOLDOWN_MS = 6L * 60L * 60L * 1000L;
    // Signed in, no active subscription or entitlement. See SubscriptionLevel:
    // ANONYMOUS / ANONYMOUSLY_SUBSCRIBED / REGISTERED /
    // REGISTERED_SUBSCRIBED_UNLINKED / REGISTERED_SUBSCRIBED_LINKED.
    private static final String REGISTERED = "REGISTERED";

    // The most recent SubscriptionLevel name, recorded by the patch from NYT's
    // user-state getter. Null until the app reads its level at least once.
    private static volatile String sLevel;

    private LibraryPassReminder() {
    }

    /**
     * The library redeem URL. Overwritten by the patch with the value from the
     * "Library auth URL" option. Blank (the default) leaves the feature inert.
     */
    public static String renewUrl() {
        return "";
    }

    /** Injection point: NYT's user-state getter that returns SubscriptionLevel. */
    public static void recordLevel(Object level) {
        try {
            if (level != null) {
                sLevel = ((Enum<?>) level).name();
            }
        } catch (Throwable ignored) {
            // A different build could return a non-enum; leave the last value.
        }
    }

    /** Injection point: BaseAppCompatActivity.onStart. Status-based trigger. */
    public static void maybeRemind(Activity activity) {
        // Only when the account is signed in but has no active entitlement.
        if (!REGISTERED.equals(sLevel)) {
            return;
        }
        prompt(activity);
    }

    /** Injection point: GatewayFragmentCard.onActivityCreated. Fallback trigger. */
    public static void onGatewayShown(Object fragment) {
        // The gateway is the app's own "no active entitlement" verdict, so it
        // is enough on its own; but if the status read is working, keep to the
        // same REGISTERED rule so a subscribed user never sees it.
        if (sLevel != null && !REGISTERED.equals(sLevel)) {
            return;
        }
        prompt(activityOf(fragment));
    }

    private static void prompt(Activity activity) {
        try {
            final String url = renewUrl();
            if (url == null || url.trim().isEmpty()) {
                return;
            }
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            if (!isOnline(activity)) {
                return;
            }

            final SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            final long now = System.currentTimeMillis();
            if (now - prefs.getLong(KEY_LAST_SHOWN, 0L) < COOLDOWN_MS) {
                return;
            }
            prefs.edit().putLong(KEY_LAST_SHOWN, now).apply();

            final String target = url.trim();
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                if (activity.isFinishing() || activity.isDestroyed()) {
                    return;
                }
                new AlertDialog.Builder(activity)
                        .setTitle("Library pass")
                        .setMessage("Your library pass may have lapsed. Renew it to keep reading.")
                        .setPositiveButton("Renew", (dialog, which) -> open(activity, target))
                        .setNegativeButton("Not now", null)
                        .setCancelable(true)
                        .show();
            }, 1500L);
        } catch (Throwable t) {
            Log.i(TAG, "Library pass reminder skipped", t);
        }
    }

    private static Activity activityOf(Object fragment) {
        if (fragment == null) {
            return null;
        }
        try {
            Method getActivity = fragment.getClass().getMethod("getActivity");
            Object activity = getActivity.invoke(fragment);
            return (activity instanceof Activity) ? (Activity) activity : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean isOnline(Context context) {
        try {
            ConnectivityManager cm =
                    (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (cm == null) {
                return true;
            }
            NetworkCapabilities capabilities = cm.getNetworkCapabilities(cm.getActiveNetwork());
            return capabilities != null
                    && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
        } catch (Throwable t) {
            return true;
        }
    }

    private static void open(Activity activity, String url) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(intent);
        } catch (Throwable t) {
            Log.i(TAG, "Could not open the renew URL", t);
        }
    }
}
