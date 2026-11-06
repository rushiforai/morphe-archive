package app.onlynazril.extension.tiktok.captcha;

import android.app.Activity;
import android.content.Intent;

import org.json.JSONObject;

import java.util.Locale;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.settings.CaptchaSettings;

/**
 * The captcha patch's decision: may this risk-control puzzle be hidden?
 *
 * The patch guards every entry point that asks TikTok to show a puzzle and asks here first. The
 * answer is false, so the puzzle shows, in three cases: the switch is off; the host is an account
 * screen or the risk info names a verification scene; or there is no activity to judge. Everything
 * else is hidden.
 *
 * The account test is deliberately broad. Login, SMS and two-factor flows run inside
 * `com.ss.android.ugc.aweme.account.*` activities or carry `login`/`passport`/`sms`/`twice_verify`
 * in their route or risk info, and hiding one of those would strand the account, so they are always
 * shown even while the switch is on.
 *
 * A puzzle the server raised over a like, a follow or a comment is hidden like any other, which is
 * the feature and its one cost: that single action does not complete. Every branch is reported, so a
 * puzzle that still appears says which rule kept it.
 */
public final class CaptchaBridge {
    private static final int LOG_CAP = 12;
    private static final String ACCOUNT_ACTIVITY_PREFIX = "com.ss.android.ugc.aweme.account.";

    private static int logged;

    private CaptchaBridge() {}

    /** The sec entry point and the LIVE host's copy of it. */
    public static boolean shouldHideCaptchaPopup(Activity activity, String riskInfo) {
        return decide("risk " + shortOf(riskInfo), activity, riskInfo);
    }

    /** The older entry point, which carries only the server's error code. */
    public static boolean shouldHideLegacyCaptchaPopup(Activity activity, int errorCode) {
        return decide("error " + errorCode, activity, null);
    }

    /**
     * The Turing (oecverify) dialog. The three entry points above do not carry it: a hybrid page
     * or a live room is shown it by the SDK's own services, and nothing about it reaches the app
     * classes those hooks sit on. May it be hidden?
     *
     * When it may, the callback is told the SDK's own "the dialog was closed" answer (code 3), so
     * the caller's flow learns the verification did not complete instead of waiting for a dialog
     * that will never be shown.
     */
    public static boolean shouldHideTuringPopup(Activity activity, Object callback) {
        if (activity == null) {
            report("showing turing: no activity");
            return false;
        }
        if (!decide("turing at " + activity.getClass().getName(), activity, turingRiskInfo())) {
            return false;
        }
        dismissTuring(callback);
        return true;
    }

    /** Tells the SDK's callback the dialog was closed. The method name is kept on every build. */
    private static void dismissTuring(Object callback) {
        if (callback == null) return;
        try {
            callback.getClass().getMethod("onFail", int.class, JSONObject.class)
                    .invoke(callback, 3, null);
        } catch (Throwable t) {
            report("turing: dismissing failed (" + t + ")");
        }
    }

    /**
     * The SDK's own risk info, read without a compile-time dependency on it, so its scene markers
     * judge too. The class and the getters are real-named; when it cannot be read the activity
     * alone decides.
     */
    private static String turingRiskInfo() {
        try {
            Class<?> turing = Class.forName("com.tts.oecverify.BdTuring");
            Object instance = turing.getMethod("getInstance").invoke(null);
            Object config = instance.getClass().getMethod("getConfig").invoke(instance);
            Object risk = config.getClass().getMethod("getRiskInfo").invoke(config);
            return risk instanceof String ? (String) risk : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean decide(String checkId, Activity activity, String detail) {
        if (!CaptchaSettings.isEnabled()) {
            report("showing " + checkId + ": the switch is off");
            return false;
        }
        if (isAccountVerification(activity, detail)) {
            report("showing " + checkId + ": account verification");
            return false;
        }
        report("hiding " + checkId);
        return true;
    }

    private static boolean isAccountVerification(Activity activity, String detail) {
        if (activity != null && activity.getClass().getName().startsWith(ACCOUNT_ACTIVITY_PREFIX)) {
            return true;
        }
        Intent intent = activity == null ? null : activity.getIntent();
        String route = intent == null ? null : intent.getDataString();
        return isAccountRoute(route) || isAccountRoute(detail);
    }

    /** The markers a login, passport, SMS or two-factor flow carries in a route or a risk info. */
    private static boolean isAccountRoute(String value) {
        if (value == null) return false;
        String normalized = value.toLowerCase(Locale.ROOT);
        return normalized.equals("login")
                || normalized.equals("passport")
                || normalized.equals("sms")
                || normalized.equals("twice_verify")
                || normalized.contains("/passport/")
                || normalized.contains("/login/")
                || normalized.contains("\"passport\"")
                || normalized.contains("\"login\"");
    }

    /** A short, loggable name for a risk info blob, which can be long JSON. */
    private static String shortOf(String riskInfo) {
        if (riskInfo == null || riskInfo.isEmpty()) return "unknown";
        String single = riskInfo.replace('\n', ' ').replace('\r', ' ').trim();
        return single.length() > 60 ? single.substring(0, 60) : single;
    }

    private static void report(String message) {
        if (logged++ < LOG_CAP) Debug.print("captcha: " + message);
    }
}
