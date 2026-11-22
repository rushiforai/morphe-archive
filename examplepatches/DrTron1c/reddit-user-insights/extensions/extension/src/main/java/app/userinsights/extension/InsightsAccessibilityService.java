package app.userinsights.extension;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Toast;

import java.lang.reflect.Method;

/**
 * Reads the Reddit app's own screens to find usernames and hidden-profile messages.
 * It runs inside the Reddit app and only receives events from it.
 *
 * Kept light so scrolling stays smooth: text-only changes (timers, vote counts) are ignored,
 * scans are spaced out by how long they take, and while the user scrolls the pills are moved
 * by {@link ScrollTracker} instead of scanning.
 */
public class InsightsAccessibilityService extends AccessibilityService {
    private static InsightsAccessibilityService instance;

    /** Scans faster than this can also run while scrolling without stutter. */
    private static final long CHEAP_SCAN_MS = 6;

    private static long lastScanDurationMs = 5;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Runnable scanRunnable = this::scanNow;
    private boolean scanPending;
    private long lastScanAt;
    private String lastPrefetchedUser;

    private static Method rootWithPrefetch;
    private static int prefetchFlags;
    private static boolean prefetchLookedUp;

    /** Asks the running service (if any) to scan the screen soon. */
    static void requestScan(long delayMs) {
        InsightsAccessibilityService service = instance;
        if (service != null) {
            service.scheduleScan(delayMs, true);
        }
    }

    static boolean isScanCheap() {
        return lastScanDurationMs <= CHEAP_SCAN_MS;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        UserInsights.init(this);
    }

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        instance = this;
        try {
            AccessibilityServiceInfo info = getServiceInfo();
            if (info != null) {
                info.packageNames = new String[]{getPackageName()};
                info.eventTypes = AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED
                        | AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
                        | AccessibilityEvent.TYPE_VIEW_SCROLLED;
                info.notificationTimeout = 50;
                setServiceInfo(info);
            }
        } catch (Throwable t) {
            Log.w(UserInsights.TAG, "setServiceInfo failed", t);
        }
        ArcticShift.setOnDataChanged(() -> scheduleScan(16, false));
        Activity activity = UserInsights.currentActivity();
        if (activity != null && !UserInsights.isOwnScreen(activity)) {
            ScrollTracker.install(activity);
        }
        scheduleScan(0, true);
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
        if (event == null || event.getPackageName() == null
                || !getPackageName().contentEquals(event.getPackageName())) {
            return;
        }
        switch (event.getEventType()) {
            case AccessibilityEvent.TYPE_VIEW_SCROLLED:
                if (ScrollTracker.isTracking()) {
                    // The pills already follow the finger; the tracker scans when scrolling ends.
                    ScrollTracker.onContentScrolled();
                    return;
                }
                // Scrolled by something else (a button, the keyboard): hide until it settles.
                OverlayManager.hideAllTemporarily();
                scheduleScan(120, true);
                break;

            case AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED:
                // New screen: scan at once, and again when its content has loaded.
                scheduleScan(0, true);
                handler.postDelayed(() -> scheduleScan(0, false), 450);
                break;

            default:
                if (isTextOnlyChange(event) || ScrollTracker.isTracking()) {
                    return;
                }
                // Space scans out by how long they take, so they never add up to stutter.
                long gap = Math.max(150, lastScanDurationMs * 15);
                long wait = Math.max(16, lastScanAt + gap - SystemClock.uptimeMillis());
                scheduleScan(wait, false);
                break;
        }
    }

    /** Timers, vote counts and similar: the layout did not change, so there is nothing to rescan. */
    private static boolean isTextOnlyChange(AccessibilityEvent event) {
        int types = event.getContentChangeTypes();
        if (types == AccessibilityEvent.CONTENT_CHANGE_TYPE_UNDEFINED) {
            return false;
        }
        int layoutTypes = AccessibilityEvent.CONTENT_CHANGE_TYPE_SUBTREE
                | AccessibilityEvent.CONTENT_CHANGE_TYPE_PANE_APPEARED
                | AccessibilityEvent.CONTENT_CHANGE_TYPE_PANE_DISAPPEARED
                | AccessibilityEvent.CONTENT_CHANGE_TYPE_PANE_TITLE;
        return (types & layoutTypes) == 0;
    }

    private void scheduleScan(long delayMs, boolean restart) {
        if (scanPending && !restart) {
            return;
        }
        handler.removeCallbacks(scanRunnable);
        if (delayMs <= 0) {
            handler.post(scanRunnable);
        } else {
            handler.postDelayed(scanRunnable, delayMs);
        }
        scanPending = true;
    }

    private void scanNow() {
        scanPending = false;
        Activity activity = UserInsights.currentActivity();
        if (activity == null || UserInsights.isOwnScreen(activity)) {
            return;
        }
        if (!Prefs.badgesEnabled() && !Prefs.hiddenButtonEnabled()) {
            OverlayManager.clearAll();
            return;
        }
        long start = SystemClock.uptimeMillis();
        try {
            AccessibilityNodeInfo root = root();
            if (root == null || root.getPackageName() == null
                    || !getPackageName().contentEquals(root.getPackageName())) {
                return;
            }
            boolean dump = Prefs.consumeDebugDump();
            ScreenScanner.Result result = ScreenScanner.scan(root, dump, getResources().getDisplayMetrics());
            if (dump && result.dump != null) {
                copyDump(result);
            }
            // Draw in the window the content is in: the activity, or a dialog or sheet above it.
            android.view.ViewGroup host = WindowFinder.targetHost(activity);
            if (host == null) {
                return;
            }
            ScrollTracker.install(activity, WindowFinder.windowOf(activity, host), host);
            OverlayManager.render(activity, host, result);
            if (result.profileUser != null && result.hiddenUser == null && Prefs.hiddenButtonEnabled()
                    && !result.profileUser.equalsIgnoreCase(lastPrefetchedUser)) {
                // So "Full history" opens instantly.
                lastPrefetchedUser = result.profileUser;
                ArcticShift.prefetchArchive(result.profileUser);
            }
        } catch (Throwable t) {
            Log.e(UserInsights.TAG, "Scan failed", t);
        } finally {
            lastScanAt = SystemClock.uptimeMillis();
            // Smoothed, so one slow scan does not change the pacing much.
            lastScanDurationMs = (lastScanDurationMs * 2 + (lastScanAt - start)) / 3;
        }
    }

    /**
     * The root of the active window. On Android 13+ the whole tree is fetched in batches,
     * which is much faster than one node at a time.
     */
    private AccessibilityNodeInfo root() {
        if (Build.VERSION.SDK_INT >= 33) {
            try {
                if (!prefetchLookedUp) {
                    prefetchLookedUp = true;
                    prefetchFlags = AccessibilityNodeInfo.class.getField("FLAG_PREFETCH_DESCENDANTS_DEPTH_FIRST").getInt(null);
                    rootWithPrefetch = AccessibilityService.class.getMethod("getRootInActiveWindow", int.class);
                }
                if (rootWithPrefetch != null) {
                    return (AccessibilityNodeInfo) rootWithPrefetch.invoke(this, prefetchFlags);
                }
            } catch (Throwable t) {
                rootWithPrefetch = null;
            }
        }
        return getRootInActiveWindow();
    }

    private void copyDump(ScreenScanner.Result result) {
        try {
            StringBuilder text = new StringBuilder(result.dump);
            text.append("\nDetected users: ");
            for (ScreenScanner.Hit hit : result.hits) {
                text.append(hit.user).append(hit.merged ? "(merged) " : " ");
            }
            text.append("\nProfile: ").append(result.profileUser)
                    .append("\nHidden profile: ").append(result.hiddenUser)
                    .append("\nScan time: ").append(lastScanDurationMs).append(" ms");
            ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText("User Insights screen dump", text.toString()));
            Toast.makeText(this, "User Insights: screen layout copied", Toast.LENGTH_LONG).show();
        } catch (Throwable t) {
            Log.e(UserInsights.TAG, "Could not copy dump", t);
        }
    }

    @Override
    public void onInterrupt() {
    }

    @Override
    public void onDestroy() {
        handler.removeCallbacksAndMessages(null);
        if (instance == this) {
            instance = null;
        }
        ArcticShift.setOnDataChanged(null);
        OverlayManager.clearAll();
        super.onDestroy();
    }
}
