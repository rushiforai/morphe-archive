package app.morphe.extension.mapsautomotive.patches;

import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.Canvas;
import android.graphics.Insets;
import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Icon;
import android.hardware.display.DisplayManager;
import android.icu.number.NumberFormatter;
import android.icu.text.NumberFormat;
import android.icu.util.MeasureUnit;
import android.icu.util.ULocale;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.net.NetworkSpecifier;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import android.os.UserHandle;
import android.os.ext.SdkExtensions;
import android.util.CloseGuard;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Android 10 fallbacks for API 30 framework members.
 * <p>
 * R8 compiled Maps Automotive for minSdk 30 and removed the SDK_INT checks in front of these
 * calls. The patch redirects R8's API outline methods here: each method has the framework
 * member's parameters (receiver first) and return type, calls the member itself on API 30+,
 * and below that uses an Android 10 equivalent, a documented no-op or an empty result.
 * Members whose types do not exist on API 29 are handled at their call sites instead.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class ApiCompat {
    private static final String TAG = "MorpheApiCompat";

    // WindowInsets.Type values of API 30, also used by androidx WindowInsetsCompat.Type.
    private static final int STATUS_BARS = 1;
    private static final int NAVIGATION_BARS = 1 << 1;
    private static final int CAPTION_BAR = 1 << 2;
    private static final int IME = 1 << 3;
    private static final int SYSTEM_GESTURES = 1 << 4;
    private static final int MANDATORY_SYSTEM_GESTURES = 1 << 5;
    private static final int TAPPABLE_ELEMENT = 1 << 6;
    private static final int DISPLAY_CUTOUT = 1 << 7;

    private static WindowInsets consumedWindowInsets;

    private static volatile Boolean carApi;
    private static final Set<String> loggedCarCallers = new HashSet<>();

    private ApiCompat() {
    }

    private static boolean atLeastR() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.R;
    }

    // Context

    /** No attribution tags before API 30; null is the default tag. */
    public static String getAttributionTag(Context context) {
        if (atLeastR()) return context.getAttributionTag();
        return null;
    }

    /** As androidx ContextCompat.getDisplayOrDefault below API 30. */
    public static Display getDisplay(Context context) {
        if (atLeastR()) return context.getDisplay();
        WindowManager windows = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        if (windows != null) return windows.getDefaultDisplay();
        DisplayManager displays = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
        return displays.getDisplay(Display.DEFAULT_DISPLAY);
    }

    /** Same-user binds use bindService. Another user needs INTERACT_ACROSS_USERS: report a failed bind. */
    public static boolean bindServiceAsUser(Context context, Intent service, ServiceConnection connection,
                                            int flags, UserHandle user) {
        if (atLeastR()) return context.bindServiceAsUser(service, connection, flags, user);
        if (Process.myUserHandle().equals(user)) return context.bindService(service, connection, flags);
        ReportLog.w(TAG, "bindServiceAsUser for another user is not supported below API 30");
        return false;
    }

    /**
     * PackageManager.getInstallSourceInfo(packageName).getInstallingPackageName() in one call; the patch
     * replaces that pair at its call sites, because InstallSourceInfo does not exist before API 30.
     * Below API 30 getInstallerPackageName reports an unknown package with IllegalArgumentException.
     */
    public static String getInstallingPackageName(PackageManager packageManager, String packageName)
            throws PackageManager.NameNotFoundException {
        if (atLeastR()) return packageManager.getInstallSourceInfo(packageName).getInstallingPackageName();
        try {
            return packageManager.getInstallerPackageName(packageName);
        } catch (IllegalArgumentException exception) {
            throw new PackageManager.NameNotFoundException(packageName);
        }
    }

    // android.car exists on Android Automotive OS only; DiLink 3 is Android 10 without it.

    /**
     * Whether Car.createCar can run. The patch sends Maps' Car.createCar calls through ApiCompat.createCar
     * methods that it generates with the same parameters. They call this first and, without android.car,
     * return null, which Car.createCar also returns when no car service is reachable, instead of throwing
     * NoClassDefFoundError. Each calling Maps method is logged once.
     */
    public static boolean canCreateCar() {
        Boolean available = carApi;
        if (available == null) {
            try {
                Class.forName("android.car.Car", false, ApiCompat.class.getClassLoader());
                available = true;
            } catch (ClassNotFoundException | LinkageError error) {
                available = false;
            }
            carApi = available;
        }
        if (!available) logCarCaller();
        return available;
    }

    private static void logCarCaller() {
        // logCarCaller, canCreateCar, the generated ApiCompat.createCar, then the Maps caller.
        StackTraceElement[] stack = new Throwable().getStackTrace();
        String caller = stack.length > 3 ? stack[3].toString() : "unknown";
        synchronized (loggedCarCallers) {
            if (loggedCarCallers.size() >= 50 || !loggedCarCallers.add(caller)) return;
        }
        ReportLog.w(TAG, "android.car is not available: Car.createCar returns null for " + caller);
    }

    // SDK extensions do not exist before API 30.

    public static int getExtensionVersion(int sdk) {
        if (atLeastR()) return SdkExtensions.getExtensionVersion(sdk);
        return 0;
    }

    // ActivityManager: no process exit history before API 30.

    public static List<ApplicationExitInfo> getHistoricalProcessExitReasons(ActivityManager activityManager,
                                                                           String packageName, int pid, int maxNum) {
        if (atLeastR()) return activityManager.getHistoricalProcessExitReasons(packageName, pid, maxNum);
        return new ArrayList<>(0);
    }

    public static void setProcessStateSummary(ActivityManager activityManager, byte[] state) {
        if (atLeastR()) activityManager.setProcessStateSummary(state);
    }

    public static boolean isLowMemoryKillReportSupported() {
        if (atLeastR()) return ActivityManager.isLowMemoryKillReportSupported();
        return false;
    }

    // WindowInsets.Type

    public static int statusBars() {
        if (atLeastR()) return WindowInsets.Type.statusBars();
        return STATUS_BARS;
    }

    public static int navigationBars() {
        if (atLeastR()) return WindowInsets.Type.navigationBars();
        return NAVIGATION_BARS;
    }

    public static int captionBar() {
        if (atLeastR()) return WindowInsets.Type.captionBar();
        return CAPTION_BAR;
    }

    public static int ime() {
        if (atLeastR()) return WindowInsets.Type.ime();
        return IME;
    }

    public static int systemGestures() {
        if (atLeastR()) return WindowInsets.Type.systemGestures();
        return SYSTEM_GESTURES;
    }

    public static int mandatorySystemGestures() {
        if (atLeastR()) return WindowInsets.Type.mandatorySystemGestures();
        return MANDATORY_SYSTEM_GESTURES;
    }

    public static int tappableElement() {
        if (atLeastR()) return WindowInsets.Type.tappableElement();
        return TAPPABLE_ELEMENT;
    }

    public static int displayCutout() {
        if (atLeastR()) return WindowInsets.Type.displayCutout();
        return DISPLAY_CUTOUT;
    }

    public static int systemBars() {
        if (atLeastR()) return WindowInsets.Type.systemBars();
        return STATUS_BARS | NAVIGATION_BARS | CAPTION_BAR;
    }

    // WindowInsets, from the API 29 getters as androidx WindowInsetsCompat.Impl20 does.

    public static Insets getInsets(WindowInsets insets, int typeMask) {
        if (atLeastR()) return insets.getInsets(typeMask);
        return insetsForTypes(insets, typeMask, false);
    }

    public static Insets getInsetsIgnoringVisibility(WindowInsets insets, int typeMask) {
        if (atLeastR()) return insets.getInsetsIgnoringVisibility(typeMask);
        if ((typeMask & IME) != 0) {
            throw new IllegalArgumentException("Unable to query the maximum insets for IME");
        }
        return insetsForTypes(insets, typeMask, true);
    }

    public static boolean isVisible(WindowInsets insets, int typeMask) {
        if (atLeastR()) return insets.isVisible(typeMask);
        for (int type = STATUS_BARS; type <= DISPLAY_CUTOUT; type <<= 1) {
            if ((typeMask & type) == 0) continue;
            // Gesture and tappable areas count as always visible, as in WindowInsetsCompat.
            if (type == SYSTEM_GESTURES || type == MANDATORY_SYSTEM_GESTURES || type == TAPPABLE_ELEMENT) continue;
            if (insetsForType(insets, type, false).equals(Insets.NONE)) return false;
        }
        return true;
    }

    private static Insets insetsForTypes(WindowInsets insets, int typeMask, boolean ignoreVisibility) {
        Insets result = Insets.NONE;
        for (int type = STATUS_BARS; type <= DISPLAY_CUTOUT; type <<= 1) {
            if ((typeMask & type) != 0) result = Insets.max(result, insetsForType(insets, type, ignoreVisibility));
        }
        return result;
    }

    // WindowInsetsCompat.Impl20 compares with the root view's stable insets. The backport only has
    // this WindowInsets: insets that androidx or AppCompat rebuild can lack stable insets, so they
    // count only when present (a missing stable bottom gave navigation bars 0 and IME 90).
    private static Insets insetsForType(WindowInsets insets, int type, boolean ignoreVisibility) {
        Insets system = insets.getSystemWindowInsets();
        Insets stable = insets.hasStableInsets() ? insets.getStableInsets() : null;
        switch (type) {
            case STATUS_BARS: {
                int top = ignoreVisibility && stable != null ? Math.max(stable.top, system.top) : system.top;
                return Insets.of(0, top, 0, 0);
            }
            case NAVIGATION_BARS: {
                if (stable == null) return Insets.of(system.left, 0, system.right, system.bottom);
                if (ignoreVisibility) return Insets.of(stable.left, 0, stable.right, stable.bottom);
                return Insets.of(system.left, 0, system.right, Math.min(system.bottom, stable.bottom));
            }
            case IME: {
                // Without a stable bottom, keyboard and navigation bar cannot be told apart.
                if (stable == null) return Insets.NONE;
                int bottom = system.bottom - stable.bottom;
                return bottom > 0 ? Insets.of(0, 0, 0, bottom) : Insets.NONE;
            }
            case SYSTEM_GESTURES:
                return insets.getSystemGestureInsets();
            case MANDATORY_SYSTEM_GESTURES:
                return insets.getMandatorySystemGestureInsets();
            case TAPPABLE_ELEMENT:
                return insets.getTappableElementInsets();
            case DISPLAY_CUTOUT: {
                DisplayCutout cutout = insets.getDisplayCutout();
                if (cutout == null) return Insets.NONE;
                return Insets.of(cutout.getSafeInsetLeft(), cutout.getSafeInsetTop(),
                        cutout.getSafeInsetRight(), cutout.getSafeInsetBottom());
            }
            default: // CAPTION_BAR: no caption bar insets before API 30.
                return Insets.NONE;
        }
    }

    /** As androidx WindowInsetsCompat.CONSUMED below API 30. */
    public static WindowInsets getConsumedWindowInsets() {
        if (atLeastR()) return WindowInsets.CONSUMED;
        if (consumedWindowInsets == null) {
            consumedWindowInsets = new WindowInsets.Builder().build()
                    .consumeDisplayCutout().consumeStableInsets().consumeSystemWindowInsets();
        }
        return consumedWindowInsets;
    }

    /** No waterfall cutouts before API 30. */
    public static Insets getWaterfallInsets(DisplayCutout cutout) {
        if (atLeastR()) return cutout.getWaterfallInsets();
        return Insets.NONE;
    }

    /**
     * WindowManager.getCurrentWindowMetrics().getBounds() in one call; the patch replaces that
     * pair at its call sites, because WindowMetrics does not exist before API 30.
     * <p>
     * Below API 30 the bounds span the display height, as API 30 window bounds do. The width is
     * the display width, or less in split screen: an activity's window manager returns a display
     * whose getRectSize() is the width of that activity's window (its configuration app bounds).
     * The origin is 0,0; the window's position is not public before API 30.
     */
    public static Rect getCurrentWindowBounds(WindowManager windowManager) {
        if (atLeastR()) return windowManager.getCurrentWindowMetrics().getBounds();
        Display display = windowManager.getDefaultDisplay();
        Point real = new Point();
        display.getRealSize(real);
        Rect app = new Rect();
        display.getRectSize(app);
        int width = app.width() > 0 && app.width() < real.x ? app.width() : real.x;
        // The size Maps last measured, for WindowRefreshPatch's check.
        lastWindowBoundsWidth = width;
        lastWindowBoundsHeight = real.y;
        return new Rect(0, 0, width, real.y);
    }

    /** The last bounds below API 30, for WindowRefreshPatch; 0 before the first call. */
    static volatile int lastWindowBoundsWidth, lastWindowBoundsHeight;

    /**
     * Window insets animation callbacks exist from API 30. R8 removed WindowInsetsAnimationCompat's
     * API 29 emulation, so below that the callback setter returns without registering anything:
     * insets still arrive through OnApplyWindowInsetsListener, without animation callbacks.
     */
    public static boolean hasWindowInsetsAnimations() {
        return atLeastR();
    }

    /** As androidx WindowCompat.setDecorFitsSystemWindows below API 30. */
    public static void setDecorFitsSystemWindows(Window window, boolean decorFitsSystemWindows) {
        if (atLeastR()) {
            window.setDecorFitsSystemWindows(decorFitsSystemWindows);
            return;
        }
        int flags = View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN;
        View decorView = window.getDecorView();
        int visibility = decorView.getSystemUiVisibility();
        decorView.setSystemUiVisibility(decorFitsSystemWindows ? visibility & ~flags : visibility | flags);
    }

    // View and accessibility. State descriptions and content capture flags do not exist before API 30.

    public static boolean isShowingLayoutBounds(View view) {
        if (atLeastR()) return view.isShowingLayoutBounds();
        return false;
    }

    public static void setImportantForContentCapture(View view, int mode) {
        if (atLeastR()) view.setImportantForContentCapture(mode);
    }

    public static CharSequence getStateDescription(View view) {
        if (atLeastR()) return view.getStateDescription();
        return null;
    }

    public static void setStateDescription(View view, CharSequence stateDescription) {
        if (atLeastR()) view.setStateDescription(stateDescription);
    }

    public static CharSequence getStateDescription(AccessibilityNodeInfo info) {
        if (atLeastR()) return info.getStateDescription();
        return null;
    }

    public static void setStateDescription(AccessibilityNodeInfo info, CharSequence stateDescription) {
        if (atLeastR()) info.setStateDescription(stateDescription);
    }

    /** As androidx AccessibilityActionCompat below API 30: an action with the same id. */
    public static AccessibilityAction getActionPressAndHold() {
        if (atLeastR()) return AccessibilityAction.ACTION_PRESS_AND_HOLD;
        return new AccessibilityAction(android.R.id.accessibilityActionPressAndHold, null);
    }

    public static AccessibilityAction getActionImeEnter() {
        if (atLeastR()) return AccessibilityAction.ACTION_IME_ENTER;
        return new AccessibilityAction(android.R.id.accessibilityActionImeEnter, null);
    }

    // Graphics

    /** API 29 ignores the edge type; AA never rejects more than the API 30 call. */
    public static boolean quickReject(Canvas canvas, float left, float top, float right, float bottom) {
        if (atLeastR()) return canvas.quickReject(left, top, right, bottom);
        return canvas.quickReject(left, top, right, bottom, Canvas.EdgeType.AA);
    }

    public static boolean quickReject(Canvas canvas, Path path) {
        if (atLeastR()) return canvas.quickReject(path);
        return canvas.quickReject(path, Canvas.EdgeType.AA);
    }

    public static boolean quickReject(Canvas canvas, RectF rect) {
        if (atLeastR()) return canvas.quickReject(rect);
        return canvas.quickReject(rect, Canvas.EdgeType.AA);
    }

    /** Since API 29, setConvexPath accepts any path. */
    public static void setPath(Outline outline, Path path) {
        if (atLeastR()) {
            outline.setPath(path);
            return;
        }
        outline.setConvexPath(path);
    }

    /** Non-adaptive content URI icon below API 30. */
    public static Icon createWithAdaptiveBitmapContentUri(Uri uri) {
        if (atLeastR()) return Icon.createWithAdaptiveBitmapContentUri(uri);
        return Icon.createWithContentUri(uri);
    }

    // Number formatting

    /**
     * NumberFormatter.withLocale(locale).unit(MeasureUnit.PERCENT).format(value).toString() in one call; the
     * patch replaces that chain at its call sites, because NumberFormatter and MeasureUnit.PERCENT do not exist
     * before API 30. The value is already a percentage (50 gives "50%"). NumberFormat's percent instance
     * multiplies by 100, so it gets value / 100, with NumberFormatter's default of up to 6 fraction digits.
     */
    public static String formatPercent(ULocale locale, double value) {
        if (atLeastR()) return NumberFormatter.withLocale(locale).unit(MeasureUnit.PERCENT).format(value).toString();
        NumberFormat format = NumberFormat.getPercentInstance(locale);
        format.setMaximumFractionDigits(6);
        return format.format(value / 100);
    }

    // Shortcuts and networking

    /** As addDynamicShortcuts; a full or locked shortcut list is skipped. */
    public static void pushDynamicShortcut(ShortcutManager shortcutManager, ShortcutInfo shortcut) {
        if (atLeastR()) {
            shortcutManager.pushDynamicShortcut(shortcut);
            return;
        }
        try {
            shortcutManager.addDynamicShortcuts(Collections.singletonList(shortcut));
        } catch (IllegalArgumentException | IllegalStateException exception) {
            ReportLog.w(TAG, "Could not add dynamic shortcut", exception);
        }
    }

    /**
     * OkHttp's call start on its Android 10 platform: an open CloseGuard on API 30+. Below that,
     * android.util.CloseGuard does not exist, so this keeps a Throwable with the same message, as OkHttp's
     * generic platform does. Never null: the connection pool reads it without a null check.
     */
    public static Object openCloseGuard(String closer) {
        if (atLeastR()) {
            CloseGuard closeGuard = new CloseGuard();
            closeGuard.open(closer);
            return closeGuard;
        }
        return new Throwable(closer);
    }

    /** OkHttp's connection pool found a leaked call: warn with what openCloseGuard recorded. */
    public static void warnIfOpen(Object stackTrace) {
        if (atLeastR() && stackTrace instanceof CloseGuard) {
            ((CloseGuard) stackTrace).warnIfOpen();
            return;
        }
        ReportLog.w(TAG, "A connection was leaked. Did you forget to close a response body?",
                stackTrace instanceof Throwable ? (Throwable) stackTrace : null);
    }

    /** The request specifier is not public before API 30. */
    public static NetworkSpecifier getNetworkSpecifier(NetworkRequest request) {
        if (atLeastR()) return request.getNetworkSpecifier();
        return null;
    }

    /** Requested capabilities must be present and one requested transport, if any, must match. */
    public static boolean canBeSatisfiedBy(NetworkRequest request, NetworkCapabilities capabilities) {
        if (atLeastR()) return request.canBeSatisfiedBy(capabilities);
        if (capabilities == null) return false;
        for (int capability = 0; capability < 64; capability++) {
            if (request.hasCapability(capability) && !capabilities.hasCapability(capability)) return false;
        }
        boolean requestsTransport = false;
        for (int transport = 0; transport < 32; transport++) {
            if (!request.hasTransport(transport)) continue;
            if (capabilities.hasTransport(transport)) return true;
            requestsTransport = true;
        }
        return !requestsTransport;
    }
}
