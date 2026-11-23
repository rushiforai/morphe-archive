package biz.kushan.ltkey;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;

/**
 * Single entry point the patch calls. Keeping ALL logic here means the injected smali is one
 * static call — nothing about app internals is baked into the bytecode beyond the call site.
 *
 * Work is deferred to the main looper so it runs AFTER onCreate returns (the view tree exists by
 * then, regardless of where the call was injected). The row renders immediately from stored data
 * if present, and a background harvest (key unwrap + store decrypt — never on the UI thread)
 * re-renders so it appears after the first pairing. Nothing here can throw into the host.
 */
public final class DtEntry {

    /** Injected at EditDeviceActivity.onCreate: {@code invoke-static {p0} DtEntry.onEditDevice}. */
    public static void onEditDevice(final Activity activity) {
        try {
            final String cloudId = safeDeviceId(activity);
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override public void run() {
                    try {
                        DtEditRow.add(activity, cloudId);        // fast path: already-harvested key
                        startHarvest(activity, cloudId);         // refresh / first-run populate
                    } catch (Throwable t) { DtLog.w("onEditDevice ui", t); }
                }
            });
        } catch (Throwable t) {
            DtLog.w("onEditDevice failed", t);
        }
    }

    /** The SmartThings cloud device id EditDeviceActivity was launched with (public API only). */
    private static String safeDeviceId(Activity a) {
        try { return a.getIntent() == null ? null : a.getIntent().getStringExtra("deviceId"); }
        catch (Throwable t) { return null; }
    }

    private static void startHarvest(final Activity activity, final String cloudId) {
        new Thread(new Runnable() {
            @Override public void run() {
                try {
                    Object cm = DtDi.cryptoManager(activity);
                    DtHarvest.run(activity, cm);
                    activity.runOnUiThread(new Runnable() {
                        @Override public void run() { DtEditRow.add(activity, cloudId); }
                    });
                } catch (Throwable t) {
                    DtLog.w("harvest bg failed", t);
                }
            }
        }, "lt-harvest").start();
    }

    private DtEntry() {}
}
