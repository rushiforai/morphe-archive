package app.belkart.extension.wallet;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Runtime bridge from Wallet's MainActivity launch to Belkart's existing NavController flow.
 *
 * The app goes through splash / PIN screens before it reaches the home screen. Navigating to the
 * payment screen too early gets overridden by the app's own start-up navigation, so we wait until
 * the NavController actually sits on the home destination and only then open the payment screen.
 */
@SuppressWarnings("unused")
public final class BelkartWalletPaymentHook {
    private static final String TAG = "BelkartWallet";
    private static final long FIRST_DELAY_MS = 250L;
    private static final long RETRY_DELAY_MS = 200L;
    /** User may need time to enter the PIN / biometrics before home is reached. */
    private static final long GIVE_UP_AFTER_MS = 120_000L;

    private BelkartWalletPaymentHook() { }

    public static void onMainActivityCreate(Activity activity) {
        try {
            Intent intent = activity.getIntent();
            if (intent == null || !intent.getBooleanExtra(BelkartQuickAccessWalletService.EXTRA_WALLET_PAYMENT, false)) return;
            String cardId = intent.getStringExtra(BelkartQuickAccessWalletService.EXTRA_CARD_ID);
            intent.removeExtra(BelkartQuickAccessWalletService.EXTRA_WALLET_PAYMENT);
            intent.removeExtra(BelkartQuickAccessWalletService.EXTRA_CARD_ID);
            Log.i(TAG, "Wallet launch detected, waiting for home destination");

            Handler handler = new Handler(Looper.getMainLooper());
            long deadline = SystemClock.uptimeMillis() + GIVE_UP_AFTER_MS;
            Runnable[] retry = new Runnable[1];
            retry[0] = () -> {
                if (activity.isFinishing() || activity.isDestroyed()) return;
                if (openPayment(activity, cardId)) return;
                if (SystemClock.uptimeMillis() > deadline) { Log.w(TAG, "Gave up waiting for home destination"); return; }
                handler.postDelayed(retry[0], RETRY_DELAY_MS);
            };
            handler.postDelayed(retry[0], FIRST_DELAY_MS);
        } catch (Throwable t) { Log.e(TAG, "Wallet payment handoff failed", t); }
    }

    private static boolean openPayment(Activity activity, String cardId) {
        try {
            Object nav = navController(activity);
            if (nav == null) return false;

            int homeId = id(activity, "homeFragment");
            int paymentId = id(activity, "paymentFragment");
            Integer current = currentDestinationId(nav);

            if (current != null) {
                if (paymentId != 0 && current == paymentId) return true; // already there
                if (homeId != 0 && current != homeId) return false;      // still on splash / PIN
            }

            Bundle args = new Bundle();
            if (!TextUtils.isEmpty(cardId)) args.putString("cardId", cardId);
            args.putString("paymentAction", "CARD_PAY");
            args.putString("preLocation", "WALLET");

            Method navigate = nav.getClass().getMethod("navigate", int.class, Bundle.class);
            int action = id(activity, "action_homeFragment_to_paymentFragment");
            if (action != 0) {
                try { navigate.invoke(nav, action, args); Log.i(TAG, "Opened payment via action"); return true; }
                catch (Throwable t) { Log.w(TAG, "Action navigation failed, trying destination", t); }
            }
            if (paymentId != 0) {
                navigate.invoke(nav, paymentId, args);
                Log.i(TAG, "Opened payment via destination");
                return true;
            }
            Log.w(TAG, "No payment action/destination ids found");
        } catch (Throwable t) { Log.w(TAG, "Payment destination is not ready", t); }
        return false;
    }

    private static Object navController(Activity activity) throws Exception {
        Object manager = activity.getClass().getMethod("getSupportFragmentManager").invoke(activity);
        int hostId = id(activity, "nav_host_fragment");
        if (hostId == 0) hostId = id(activity, "nav_host_fragment_container");
        if (hostId == 0) return null;
        Object host = manager.getClass().getMethod("findFragmentById", int.class).invoke(manager, hostId);
        if (host == null) return null;
        try {
            return host.getClass().getMethod("getNavController").invoke(host);
        } catch (Throwable ignored) { }
        Class<?> fragment = Class.forName("androidx.fragment.app.Fragment");
        Method find = Class.forName("androidx.navigation.fragment.NavHostFragment").getMethod("findNavController", fragment);
        return find.invoke(null, host);
    }

    /** Returns null when the current destination can't be resolved (e.g. obfuscated), so callers fall back to navigating directly. */
    private static Integer currentDestinationId(Object nav) {
        try {
            Object dest = nav.getClass().getMethod("getCurrentDestination").invoke(nav);
            if (dest == null) return null;
            return (Integer) dest.getClass().getMethod("getId").invoke(dest);
        } catch (Throwable t) { return null; }
    }

    private static int id(Activity activity, String name) {
        return activity.getResources().getIdentifier(name, "id", activity.getPackageName());
    }
}
