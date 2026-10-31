/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;

import java.util.concurrent.Executor;

import org.robolectric.RuntimeEnvironment;

/** Lets tests outside this package ask the UnifiedPush gate. */
public final class UnifiedPushForTests {
    private UnifiedPushForTests() {}

    private static final UnifiedPush.Telegram TELEGRAM = UnifiedPush.telegram;
    private static final Executor WORK = UnifiedPush.work;
    private static final Runnable APPLY = OwnConnection.apply;

    /**
     * ntfy installed and signed up with an address in hand, through the real messages, with Telegram's
     * side and the background work replaced so nothing leaves the test. Call {@link #reset} after.
     */
    public static void signedUpWithNtfy() {
        Context context = RuntimeEnvironment.getApplication();
        UnifiedPush.telegram = new UnifiedPush.Telegram() {
            @Override public void register(String endpoint) {}
            @Override public void wake(Runnable done) { done.run(); }
            @Override public void release(String endpoint) {}
        };
        UnifiedPush.work = Runnable::run;
        OwnConnection.apply = () -> {};
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = UnifiedPush.NTFY;
        info.activityInfo.name = UnifiedPush.NTFY + ".Distributor";
        shadowOf(context.getPackageManager()).addResolveInfoForIntent(new Intent(UnifiedPush.REGISTER), info);
        UnifiedPush.sync(context, true);
        UnifiedPush.receive(context, new Intent(UnifiedPush.NEW_ENDPOINT).putExtra("token", token(context))
                .putExtra("endpoint", "https://ntfy.sh/upRow?up=1"), () -> {});
    }

    /** ntfy ends the sign-up, as removing Telegram's subscription in ntfy does. */
    public static void endedByNtfy() {
        Context context = RuntimeEnvironment.getApplication();
        UnifiedPush.receive(context, new Intent(UnifiedPush.UNREGISTERED).putExtra("token", token(context)), () -> {});
    }

    public static void reset() {
        Context context = RuntimeEnvironment.getApplication();
        UnifiedPush.telegram = TELEGRAM;
        UnifiedPush.work = WORK;
        OwnConnection.apply = APPLY;
        shadowOf(context.getPackageManager()).removeResolveInfosForIntent(new Intent(UnifiedPush.REGISTER), UnifiedPush.NTFY);
        UnifiedPush.prefs(context).edit().clear().commit();
        OwnConnection.telegramStore.apply(context).edit().clear().commit();
        OwnConnection.store.apply(context).edit().clear().commit();
    }

    private static String token(Context context) {
        return UnifiedPush.prefs(context).getString(UnifiedPush.TOKEN, null);
    }

    /** With an address saved, whether a Firebase sign-up would go out as the UnifiedPush address. */
    public static boolean swapsFirebase() {
        UnifiedPush.prefs(RuntimeEnvironment.getApplication()).edit()
                .putString(UnifiedPush.ENDPOINT, "https://ntfy.sh/upProbe?up=1").commit();
        String token = UnifiedPush.token(2, "firebase-token");
        int type = UnifiedPush.type(2);
        return !"firebase-token".equals(token) || type != 2;
    }
}
