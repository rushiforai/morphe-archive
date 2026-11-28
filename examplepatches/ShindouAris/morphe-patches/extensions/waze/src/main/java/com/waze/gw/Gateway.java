package com.waze.gw;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.os.SystemClock;
import android.util.Log;

/**
 * Waze mod gateway.
 * Hooks:
 *   LocationSensorListener.updateSpeedometer(speed, units, limit, acc)  -> onSpeedo
 *   AlerterNativeManager.updateAlertersRepository(repo)                  -> onAlerts
 *
 * - (1) announce current speed limit (stable-filtered), (2) over-speed alert,
 *   (3) look-ahead speed-limit decrease (value from icon).
 * - Exposes a live snapshot (hud*) consumed by HudActivity.
 */
public final class Gateway {

    private static final String TAG = "WazeGW";
    // Must match the settings UI default. A fresh install has no persisted over_margin yet;
    // using 2 here made "+0 km/h" behave like +2 and only fire at limit + 3.
    private static final int OVER_MARGIN = 0;
    private static final long OVER_REPEAT_MS = 12000;

    // alert type values (proto)
    private static final int TYPE_POLICE = 1, TYPE_ACCIDENT = 2, TYPE_HAZARD = 5, TYPE_CAMERA = 10,
            TYPE_PERM_HAZARD = 21, TYPE_SPEED_DROP = 23;
    private static final int LOOKAHEAD_M = 500;

    private static Context ctx;

    /** Adds nearby WME data pins to a Waze MapContentRequest without taking ownership of it. */
    public static Object injectPointMapMarkers(Object controller, Object mapContent) {
        try {
            return PointNoticeMapBridge.attach(controller, mapContent);
        } catch (Throwable error) {
            Log.w(TAG, "Point map marker hook failed", error);
            return mapContent;
        }
    }
    private static volatile java.lang.ref.WeakReference<android.view.View> navBarBackgroundRef;
    private static volatile java.lang.ref.WeakReference<android.view.View> navBarContentRef;
    private static volatile java.lang.ref.WeakReference<android.view.View> navLaneBackgroundRef;
    private static volatile java.lang.ref.WeakReference<android.view.View> navThenBackgroundRef;
    private static final VoiceQueue voiceQueue = new VoiceQueue();
    /** Serializes extraction of compressed voice assets installed from Store/AAB builds. */
    private static final Object assetAudioCacheLock = new Object();
    /** Android Auto's current map renderer. Published when the projected map screen is created. */
    private static volatile Context aaCarContext;
    /** Android Auto's street-name pill renderer and the street last drawn into it (see onWazeLocationForAA). */
    private static volatile Object aaStreetRenderer;
    private static volatile String aaRenderedStreet = "";
    private static java.lang.reflect.Method aaLocationMatcherMethod;
    private static java.lang.reflect.Method aaMatcherStreetMethod;
    /** Set only by Waze's explicit "Close Waze" action. It remains true until this process exits. */
    private static volatile boolean explicitShutdownRequested = false;
    private static final Object taskRemovalShutdownLock = new Object();
    private static boolean taskRemovalShutdownStarted;

    private static volatile int announcedLimit = -1;
    private static final StableSpeedLimit stableSpeedLimit = new StableSpeedLimit();
    private static final Object overspeedStateLock = new Object();
    private static boolean wasOver = false;
    private static long lastOverMs = 0;
    private static int overWarningCount = 0;
    /** Start of the current over-speed episode and the user's "mute until it ends" choice. */
    private static long overSinceMs = 0L;
    private static boolean overspeedMuted = false;
    /** Over-speed must last this long before the map shows the mute button. */
    private static final long OVER_MUTE_BUTTON_DELAY_MS = 10000L;
    private static volatile boolean overspeedMuteButtonWanted = false;
    private static volatile java.lang.ref.WeakReference<android.widget.ImageButton> overspeedMuteButton =
            new java.lang.ref.WeakReference<android.widget.ImageButton>(null);
    private static int lastGpsLogRaw = Integer.MIN_VALUE;
    private static int lastGpsLogCorrected = Integer.MIN_VALUE;
    private static int lastGpsLogOffset = Integer.MIN_VALUE;
    private static int lastGpsLogPct = Integer.MIN_VALUE;
    private static long lastGpsLogMs;
    private static volatile int lastLandscapeViewportLogKey;
    private static volatile int lastLandscapeAnchorLogKey;
    /** Last fix delivered by Waze's own location/speed pipeline, using the monotonic clock. */
    private static volatile long lastWazeLocationElapsed;
    private static final long GPS_FIX_STALE_MS = 8000L;
    private static volatile double gpsAccuracyRaw = -1.0;
    private static volatile double gpsAccuracySmoothed = -1.0;
    private static volatile long gpsFixElapsed;
    private static volatile String gpsFixSource = "";
    private static volatile int gpsStableLevel;
    private static int gpsPendingLevel = -1;
    private static int gpsPendingCount;
    private static final java.util.HashSet<String> announcedAlert = new java.util.HashSet<>();
    private static final java.util.HashMap<String, Long> speedDropRetryAt =
            new java.util.HashMap<String, Long>();
    private static final long SPEED_DROP_RETRY_MS = 1000L;
    private static volatile boolean speedDropNativeConfigured = false;
    // Waze removes a speed-drop descriptor when it enters the active-warning range (~600 m).
    // Keep that nearest descriptor alive for our HUD/bubble until the vehicle reaches the new limit.
    private static final int SPEED_DROP_HOLD_MAX_M = 1000;
    private static volatile String heldSpeedDropKey = "";
    private static volatile int heldSpeedDropValue = -1, heldSpeedDropMeters = -1, heldSpeedDropFromLimit = -1;
    private static volatile long heldSpeedDropAtMs = 0;
    private static volatile String speedDropRouteUuid = "";

    // ---- live snapshot for the HUD ----
    public static volatile int hudSpeed = -1;
    /**
     * Immutable speed frame sourced from the phone-side Waze speedometer callback.
     *
     * Android Auto has its own projected location/render path and can visibly lag behind the
     * phone.  AaSpeedo consumes this publication instead of modifying ProviderPosition or
     * registering a second LocationManager listener.  One volatile reference also prevents the
     * GL thread from observing a speed from one frame and a limit/unit from another.
     */
    static final class AaSpeedSnapshot {
        final int speed;
        final int limit;
        final String units;
        final long elapsedRealtimeMs;

        AaSpeedSnapshot(int speed, int limit, String units, long elapsedRealtimeMs) {
            this.speed = speed;
            this.limit = limit;
            this.units = units == null ? "" : units;
            this.elapsedRealtimeMs = elapsedRealtimeMs;
        }
    }

    private static volatile AaSpeedSnapshot aaPhoneSpeed =
            new AaSpeedSnapshot(-1, -1, "", 0L);
    private static volatile AaSpeedSnapshot followingSpeed = aaPhoneSpeed;

    static int followingDistanceMetres() {
        AaSpeedSnapshot gps = followingSpeed;
        long age = gps.elapsedRealtimeMs <= 0 ? Long.MAX_VALUE
                : SystemClock.elapsedRealtime() - gps.elapsedRealtimeMs;
        return FollowingDistancePolicy.resolve(modEnabled()
                && pref("expressway_following_distance", false), onFreeway(),
                gps.speed, gps.units, age);
    }

    public static void onFollowingDistanceSettingChanged(boolean enabled) {
        FloatSpeedo.refreshFollowingDistance();
    }

    /** Gap measured by xADAS (opt-in), or -1; also keeps the AIDL link bound or unbound. */
    static int measuredGapMetres() {
        boolean on = modEnabled() && pref("xadas_link", false);
        XadasLink.refresh(ctx(), on);
        if (!on) XadasAlerts.stop();
        return on ? XadasLink.metres() : -1;
    }

    /** Measured gap when xADAS has one, otherwise the advisory distance (0 = nothing to show). */
    static int gapMetres() {
        int measured = measuredGapMetres();
        return measured > 0 ? measured : followingDistanceMetres();
    }

    static boolean gapMeasured() {
        return XadasLink.metres() > 0;
    }

    static boolean gapTooClose() {
        return XadasLink.tooClose();
    }

    public static void onXadasSettingChanged(boolean enabled) {
        XadasLink.refresh(ctx(), enabled && modEnabled());
        FloatSpeedo.refreshFollowingDistance();
        if (enabled && modEnabled()) XadasAlerts.ensureRunning(); else XadasAlerts.stop();
    }

    /** Own speed in km/h from the GPS snapshot, or -1 when unknown or stale. */
    static int followingSpeedKmh() {
        AaSpeedSnapshot gps = followingSpeed;
        long age = gps.elapsedRealtimeMs <= 0 ? Long.MAX_VALUE
                : SystemClock.elapsedRealtime() - gps.elapsedRealtimeMs;
        if (gps.speed < 0 || age >= 5000L || gps.units == null) return -1;
        if ("km/h".equalsIgnoreCase(gps.units) || "kph".equalsIgnoreCase(gps.units)) return gps.speed;
        if ("mph".equalsIgnoreCase(gps.units)) return (int) Math.round(gps.speed * 1.609344);
        return -1;
    }

    /** What the xADAS distance widget should show right now; also keeps the link and alerts alive. */
    static XadasGapPolicy.State xadasGapState() {
        int metres = measuredGapMetres();
        if (metres < 0) return XadasGapPolicy.State.HIDDEN;
        XadasAlerts.ensureRunning();
        return XadasGapPolicy.compute(metres, XadasLink.tooClose(), followingSpeedKmh(), onFreeway(),
                prefInt("xadas_gap_mode", XadasGapPolicy.MODE_FREEWAY));
    }

    /** Per-surface switch from Settings > xADAS; {@code key == null} means always allowed. */
    static boolean xadasSurfaceEnabled(String key) {
        return key == null || pref(key, true);
    }

    static AaSpeedSnapshot aaPhoneSpeedSnapshot() {
        return aaPhoneSpeed;
    }

    private static void publishAaPhoneSpeed(int speed, String units, int limit) {
        aaPhoneSpeed = new AaSpeedSnapshot(speed, limit, units,
                SystemClock.elapsedRealtime());

    }

    private static volatile int lastNotifiedSlowSpeed = -1;
    private static volatile long lastSlowMs = 0;
    private static final long SLOW_DEBOUNCE_MS = 4000;
    public static volatile int hudLimit = -1;
    public static volatile String hudUnits = "";
    public static volatile java.util.List<String> hudAlerts = new java.util.ArrayList<>();
    private static volatile java.util.List<String> nativeHudAlerts = new java.util.ArrayList<>();
    private static volatile java.util.List<String> pointHudAlerts = new java.util.ArrayList<>();
    private static volatile java.util.List<String> roadPointHudAlerts = new java.util.ArrayList<>();
    private static volatile java.util.List<String> trafficLightHudAlerts = new java.util.ArrayList<>();
    private static volatile java.util.List<String> trafficJamHudAlerts = new java.util.ArrayList<>();
    private static volatile java.util.List<String> schoolZoneHudAlerts = new java.util.ArrayList<>();
    public static volatile android.view.View nativeSpeedo;   // Waze's own gauge (hidden when the float speedo is on)
    // turn-by-turn navigation (each field arrives via a separate JNI callback)
    public static volatile int hudTurn = -1;        // current (immediate) maneuver = Instruction$Type ordinal
    public static volatile boolean hudNavigating = false;
    private static volatile int googleMapsDestinationLatE6 = Integer.MIN_VALUE;
    private static volatile int googleMapsDestinationLonE6 = Integer.MIN_VALUE;
    private static volatile java.lang.ref.WeakReference<android.widget.ImageButton>
            googleMapsButton = new java.lang.ref.WeakReference<android.widget.ImageButton>(null);
    public static volatile int hudTurnNext = -1;    // the maneuver after that ("then")
    public static volatile int hudExit = -1;        // roundabout exit number (which exit to take)
    public static volatile int hudTurnDist = -1;    // meters to the immediate maneuver
    public static volatile String hudStreet = "";    // next street name (the road you turn ONTO)
    public static volatile String hudCurStreet = ""; // CURRENT street (road you're on now), from the map matcher
    /** Immutable lane-guidance frame published by Waze's navigation callback. */
    public static volatile LaneSnapshot hudLanes = LaneSnapshot.EMPTY;
    /** Current Waze server/WME segment id in both free drive and navigation. Unlike hudSegmentId,
     *  this is not a synthetic from/to-node pair; the ARM64 bridge reads Waze's matched map line. */
    public static volatile long hudRoadSegmentId = -1L;
    public static volatile int hudRouteSegmentIdx = -1;
    public static volatile int hudSegmentTileId = -1;
    public static volatile int hudSegmentClientId = -1;
    // ETA (whole route)
    public static volatile String hudEtaClock = ""; // arrival time-of-day string
    public static volatile int hudEtaMin = -1;      // remaining minutes
    public static volatile String hudEtaTimeStr = "";// remaining time, preformatted
    public static volatile int hudEtaDistM = -1;    // remaining distance to destination, meters
    // average-speed ("no-passing"/cấm vượt) zone — live while INSIDE the zone, cleared on exit
    public static volatile boolean avgZone = false;   // true = currently inside an average-speed zone
    public static volatile int avgLeftM = -1;         // meters left until the zone ends
    public static volatile int avgRecSpeed = -1;      // recommended average speed (km/h), -1 = unknown
    public static volatile int avgPercent = -1;       // current average as % of the limit
    private static volatile boolean avgZoneFromNavigation;
    private static volatile boolean avgZoneFromAlerts;
    private static volatile int avgAlertLeftM = -1;

    /**
     * One atomic lane-guidance frame. Arrays are built privately and never mutated after publish,
     * so Bubble/HUD can safely read a single volatile reference from their UI threads.
     */
    public static final class LaneSnapshot {
        public static final LaneSnapshot EMPTY =
                new LaneSnapshot(new int[0][], new boolean[0][], "");

        private final int[][] angles;
        private final boolean[][] selected;
        private final String signature;

        private LaneSnapshot(int[][] angles, boolean[][] selected, String signature) {
            this.angles = angles;
            this.selected = selected;
            this.signature = signature;
        }

        public int size() {
            return angles.length;
        }

        public int angleCount(int lane) {
            return lane >= 0 && lane < angles.length ? angles[lane].length : 0;
        }

        public int angleAt(int lane, int angle) {
            return angles[lane][angle];
        }

        public boolean isSelected(int lane, int angle) {
            return selected[lane][angle];
        }

        public String signature() {
            return signature;
        }
    }

    private static final class LaneRow {
        final int index;
        final int[] angles;
        final boolean[] selected;

        LaneRow(int index, int[] angles, boolean[] selected) {
            this.index = index;
            this.angles = angles;
            this.selected = selected;
        }
    }

    // --- parking/stopping restriction (from external server) ---
    public static volatile int parkingRestriction = 0;   // 0=none, 1=no_parking, 2=no_stopping_and_parking
    /** Resolved minimum legal speed, km/h; backend value first, automatic motorway rule otherwise. */
    public static volatile int minimumSpeedLimit = -1;
    /** Stable Waze road classification keyed by real server/WME segment id. */
    private static final java.util.concurrent.ConcurrentHashMap<Long, Boolean> freewayBySegment =
            new java.util.concurrent.ConcurrentHashMap<Long, Boolean>();
    private static volatile String classifiedStreetName = "";
    private static volatile boolean classifiedStreetIsFreeway = false;
    private static android.widget.ImageView parkingSign;
    private static android.os.Handler parkingTick;
    private static volatile java.lang.ref.WeakReference<Vignette> mapOverspeedVignette =
            new java.lang.ref.WeakReference<Vignette>(null);

    static Context ctx() {
        if (ctx == null) {
            try {
                ctx = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke((Object) null);
            } catch (Throwable t) { /* ignore */ }
        }
        return ctx;
    }

    private static volatile String resourcePackage;

    /**
     * The package name Waze's resource table is registered under. The Dual build changes the application id
     * (Context.getPackageName()) but not the arsc package ("com.waze"), so stock code that looks resources up by
     * name with getPackageName() (e.g. the upcoming-alerts list icons) finds nothing there. Anything that is not
     * this app's own package name is returned unchanged.
     */
    public static String resPackage(String packageName) {
        try {
            String cached = resourcePackage;
            Context c = ctx();
            if (c == null || packageName == null || !packageName.equals(c.getPackageName())) return packageName;
            if (cached == null) {
                int icon = c.getApplicationInfo().icon;
                cached = icon != 0 ? c.getResources().getResourcePackageName(icon) : packageName;
                resourcePackage = cached;
            }
            return cached;
        } catch (Throwable t) {
            return packageName;
        }
    }

    /**
     * Compatibility gate for ordinary Mod features.
     *
     * Do not perform signature verification from hot callbacks (location, speedometer,
     * navigation, drawing, Bubble/HUD and TTS). Signature enforcement belongs only at
     * selected sensitive entry points below.
     */
    static boolean modEnabled() {
        return true;
    }

    static boolean modEnabled(Context context) {
        return true;
    }

    /** Signature gate used only by operations with external or persistent side effects. */
    static boolean trustedBuild() {
        return RuntimeState.a(ctx());
    }

    static boolean trustedBuild(Context context) {
        return RuntimeState.a(context != null ? context : ctx());
    }

    /** Records a text share while allowing Waze's original search flow to continue unchanged. */
    public static void onSharedSearchText(String text) {
        try {
            GoogleMapsShareFallback.onSharedText(text);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to prepare shared-map fallback", t);
        }
    }

    /** Called only when Search V2 has received a final, genuinely empty result list. */
    public static void onSharedSearchResultsEmpty() {
        try {
            GoogleMapsShareFallback.onSearchResultsEmpty();
        } catch (Throwable t) {
            Log.w(TAG, "Unable to open shared-map fallback", t);
        }
    }

    /**
     * Marks a user-requested shutdown before Waze enters NativeManager.shutDown().
     *
     * Auto-background shutdown must be suppressed while GPS keep-alive is active, but the notification
     * action "Close Waze" must always win. Keeping this state in-process avoids persisting a stale
     * shutdown request across the next launch.
     */
    public static void requestExplicitShutdown() {
        explicitShutdownRequested = true;
        voiceQueue.clear();
        Log.i(TAG, "Explicit Waze shutdown requested; keep-alive bypassed");
        try {
            Context c = ctx();
            Bubble.hide();
            if (c != null) {
                c.stopService(new android.content.Intent(c, BubbleKeepAliveService.class));
                HudLinkService.stop(c);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to stop bubble keep-alive during explicit shutdown", t);
        }
    }

    /**
     * The flag above lives as long as the process. If the process survived the shutdown request,
     * a deliberate user action in Mod Settings (HUD Connect) is proof Waze is alive, so drop it.
     */
    static void clearExplicitShutdownForUserAction() {
        if (explicitShutdownRequested) {
            explicitShutdownRequested = false;
            Log.i(TAG, "Explicit shutdown flag cleared by a user action in Mod Settings");
        }
    }

    /** Prevent hot callbacks from resurrecting a sticky Mod service while Waze is closing. */
    static boolean isExplicitShutdownRequested() {
        return explicitShutdownRequested;
    }

    /**
     * Removing the task from Recents is an explicit user shutdown. Both Mod foreground services
     * receive the callback when enabled, so serialize the native shutdown and final process exit.
     */
    public static void onTaskRemoved() {
        requestExplicitShutdown();
        synchronized (taskRemovalShutdownLock) {
            if (taskRemovalShutdownStarted) return;
            taskRemovalShutdownStarted = true;
        }

        final int pid = android.os.Process.myPid();
        try {
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override public void run() {
                    Log.i(TAG, "Completing task-removal shutdown; terminating process");
                    android.os.Process.killProcess(pid);
                }
            }, 1000L);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to schedule final task-removal process exit", t);
        }

        try {
            Class<?> type = Class.forName("com.waze.NativeManager");
            Object manager = type.getMethod("getInstance").invoke(null);
            type.getMethod("shutDown").invoke(manager);
        } catch (Throwable t) {
            Log.e(TAG, "Native shutdown after task removal failed", t);
            android.os.Process.killProcess(pid);
        }
    }

    /** Keep native location alive under the same permission/trust gate as the GPS service. */
    public static boolean shouldPreventShutdown() {
        try {
            if (explicitShutdownRequested) {
                Log.i(TAG, "Shutdown gate open for explicit user shutdown");
                return false;
            }
            // Waze only asks to shut down after an Android Auto disconnect when AA launched it.
            if (AaSpeedo.surfaceEndedWithin(60_000L)) {
                if (pref("aa_close_on_disconnect", true)) {
                    // Honour that like an explicit exit instead of keeping the bubble alive.
                    Log.i(TAG, "Shutdown gate open: Android Auto disconnected");
                    requestExplicitShutdown();
                    return false;
                }
                // "Close the app when Android Auto disconnects" is off: Waze keeps running on the phone.
                Log.i(TAG, "Shutdown gate closed: Android Auto disconnected, keeping Waze open");
                return true;
            }
            Context c = ctx();
            boolean prevent = BubbleKeepAliveService.requested(c);
            Log.i(TAG, "Shutdown gate: prevent=" + prevent);
            return prevent;
        } catch (Throwable t) {
            Log.w(TAG, "Shutdown gate failed open", t);
            return false;
        }
    }

    // ---- mod settings (shared with ModSettingsActivity / HudActivity) ----
    private static android.content.SharedPreferences prefs() {
        try {
            Context c = ctx();
            return c == null ? null : c.getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Applies the native navigation-banner appearance. Background alpha stays independent from
     * content opacity, while scale affects the complete banner (arrows, shield and text). Called
     * again whenever Waze swaps its rounded drawable. */
    public static void applyNavBarOpacity(android.view.View view) {
        if (view == null) return;
        applyNavBarAppearance(view, view);
    }

    /** Waze 5.23 switches the visible background between navbar.f and navBarTop depending on
     * navigation state. Some states leave both drawables installed, so select exactly one visible
     * surface; otherwise two translucent layers compose into a dark full-size rectangle. */
    public static void applyNavBarAppearance(android.view.View backgroundView,
                                             android.view.View contentView) {
        if (backgroundView == null || contentView == null) return;
        navBarBackgroundRef = new java.lang.ref.WeakReference<android.view.View>(backgroundView);
        navBarContentRef = new java.lang.ref.WeakReference<android.view.View>(contentView);
        applyConfiguredNavAppearance(backgroundView, contentView);
    }

    /** Lane guidance owns a background but remains inside navbar.f. Apply opacity only: scaling it
     * here would compound the root transform in states where the root owns the visible surface. */
    public static void applyNavLaneAppearance(android.view.View view) {
        if (view == null) return;
        navLaneBackgroundRef = new java.lang.ref.WeakReference<android.view.View>(view);
        applyConfiguredNavChildBackground(view);
    }

    /** The secondary-manoeuvre strip is another background-owning child of navbar.f. */
    public static void applyNavThenAppearance(android.view.View view) {
        if (view == null) return;
        navThenBackgroundRef = new java.lang.ref.WeakReference<android.view.View>(view);
        applyConfiguredNavChildBackground(view);
    }

    private static void applyConfiguredNavAppearance(android.view.View backgroundView,
                                                      android.view.View contentView) {
        int opacityPercent = 78;
        int sizePercent = 100;
        try {
            android.content.SharedPreferences p = prefs();
            if (p != null) {
                if (p.contains("nav_banner_opacity")) {
                    opacityPercent = p.getInt("nav_banner_opacity", 78);
                } else if (!p.getBoolean("transparent_nav_banner", true)) {
                    // Preserve the old switch choice on the first slider-enabled build.
                    opacityPercent = 100;
                }
                sizePercent = p.getInt("nav_banner_size", 100);
            }
            opacityPercent = Math.max(40, Math.min(100, opacityPercent));
            sizePercent = Math.max(50, Math.min(100, sizePercent));
            int backgroundAlpha = Math.round(255f * opacityPercent / 100f);
            float scale = sizePercent / 100f;
            boolean contentOwnsBackground = contentView != backgroundView
                    && contentView.getBackground() != null;
            if (contentOwnsBackground) {
                // q() may leave the root drawable installed behind navBarTop. Hiding it prevents
                // a second translucent plate behind the primary banner.
                applyBackgroundAlpha(backgroundView, 0);
                applyBackgroundAlpha(contentView, backgroundAlpha);
            } else {
                applyBackgroundAlpha(backgroundView, backgroundAlpha);
            }
            // Primary, lane guidance and "then" are siblings/descendants of navbar.f. Scaling the
            // common root keeps their native spacing intact; scaling each child produced V11's
            // three detached UI fragments and left the unscaled root surface visible.
            setTopStartScale(contentView, 1f);
            setTopStartScale(backgroundView, scale);
            applyNavigationAmbientColor(contentView);
            applyNavStreetTextScale(contentView);
            contentView.invalidate();
        } catch (Throwable ignored) { }
    }

    private static void applyConfiguredNavChildBackground(android.view.View view) {
        try {
            android.content.SharedPreferences p = prefs();
            int opacityPercent = p == null ? 78 : p.getInt("nav_banner_opacity", 78);
            opacityPercent = Math.max(40, Math.min(100, opacityPercent));
            applyBackgroundAlpha(view, Math.round(255f * opacityPercent / 100f));
            setTopStartScale(view, 1f);
            applyNavStreetTextScale(view);   // the "then" strip's text lives under this view
        } catch (Throwable ignored) { }
    }

    private static final String[] NAV_STREET_TEXT_IDS = {
            "navBarStreetLine", "navBarTowardStreetLine", "navBarThenText"};
    private static final java.util.WeakHashMap<android.widget.TextView, Float> navTextBasePx =
            new java.util.WeakHashMap<android.widget.TextView, Float>();

    /**
     * Street-name text of the navigation banner on its own scale (nav_street_text_size, 100..150%).
     * The banner root may also be shrunk by nav_banner_size; the two multiply. The original size is
     * remembered per view so repeated calls never compound.
     */
    private static void applyNavStreetTextScale(android.view.View anchor) {
        if (anchor == null) return;
        try {
            int percent = Math.max(100, Math.min(150, prefInt("nav_street_text_size", 100)));
            android.view.View searchRoot = anchor;
            for (int i = 0; i < 4 && searchRoot.getParent() instanceof android.view.View; i++) {
                searchRoot = (android.view.View) searchRoot.getParent();
            }
            Context context = anchor.getContext();
            for (String name : NAV_STREET_TEXT_IDS) {
                int id = context.getResources().getIdentifier(name, "id", context.getPackageName());
                if (id == 0) id = context.getResources().getIdentifier(name, "id", "com.waze");
                android.view.View found = id == 0 ? null : searchRoot.findViewById(id);
                if (!(found instanceof android.widget.TextView)) continue;
                android.widget.TextView text = (android.widget.TextView) found;
                Float base = navTextBasePx.get(text);
                if (base == null) {
                    base = Float.valueOf(text.getTextSize());
                    navTextBasePx.put(text, base);
                }
                float target = base.floatValue() * percent / 100f;
                if (Math.abs(text.getTextSize() - target) > 0.5f) {
                    text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, target);
                }
            }
        } catch (Throwable ignored) { }
    }

    private static void setTopStartScale(android.view.View view, float scale) {
        if (view == null) return;
        view.setPivotX(0f);
        view.setPivotY(0f);
        view.setScaleX(scale);
        view.setScaleY(scale);
        view.invalidate();
    }

    private static void applyBackgroundAlpha(android.view.View view, int alpha) {
        if (view == null) return;
        android.graphics.drawable.Drawable background = view.getBackground();
        if (background == null) return;
        background.mutate().setAlpha(Math.max(0, Math.min(255, alpha)));
        view.invalidate();
    }

    /** Applies only to the navigation label. Route purple and all warning colours stay semantic. */
    private static void applyNavigationAmbientColor(android.view.View anchor) {
        if (anchor == null) return;
        try {
            android.view.View searchRoot = anchor;
            // Depending on the Waze build, the hook receives navBarTop itself or its background
            // child. Walk up a few levels so navBarStreetLine can be found in both layouts.
            for (int i = 0; i < 4 && searchRoot.getParent() instanceof android.view.View; i++) {
                android.view.View parent = (android.view.View) searchRoot.getParent();
                if (parent == null) break;
                searchRoot = parent;
            }
            Context context = anchor.getContext();
            int id = context.getResources().getIdentifier(
                    "navBarStreetLine", "id", context.getPackageName());
            if (id == 0) id = context.getResources().getIdentifier(
                    "navBarStreetLine", "id", "com.waze");
            android.view.View label = id == 0 ? null : searchRoot.findViewById(id);
            if (label instanceof android.widget.TextView) {
                ((android.widget.TextView) label).setTextColor(AmbientTheme.color(context));
            }
        } catch (Throwable ignored) { }
    }

    /** Re-applies the user's choice immediately after it changes in Mod Settings. */
    public static void refreshNavBarOpacity() {
        refreshNavBarAppearance();
    }

    public static void refreshNavBarAppearance() {
        java.lang.ref.WeakReference<android.view.View> barRef = navBarBackgroundRef;
        final android.view.View bar = barRef == null ? null : barRef.get();
        java.lang.ref.WeakReference<android.view.View> contentRef = navBarContentRef;
        final android.view.View content = contentRef == null ? null : contentRef.get();
        if (bar != null) {
            (content != null ? content : bar).post(new Runnable() {
                @Override public void run() {
                    applyNavBarAppearance(bar, content != null ? content : bar);
                }
            });
        }
        java.lang.ref.WeakReference<android.view.View> laneRef = navLaneBackgroundRef;
        final android.view.View lane = laneRef == null ? null : laneRef.get();
        if (lane != null) {
            lane.post(new Runnable() {
                @Override public void run() { applyNavLaneAppearance(lane); }
            });
        }
        java.lang.ref.WeakReference<android.view.View> thenRef = navThenBackgroundRef;
        final android.view.View then = thenRef == null ? null : thenRef.get();
        if (then != null) {
            then.post(new Runnable() {
                @Override public void run() { applyNavThenAppearance(then); }
            });
        }
    }

    /** Repaints live MOD/native navigation surfaces after the ambient colour changes. */
    public static void refreshAmbientTheme() {
        refreshNavBarAppearance();
        refreshNativeSpeedoTextColor();
    }

    static boolean pref(String key, boolean def) {
        try {
            android.content.SharedPreferences p = prefs();
            return p == null ? def : p.getBoolean(key, def);
        } catch (Throwable ignored) {
            // A key may have changed type between beta builds. Never let that escape into Waze.
            return def;
        }
    }

    public static int phoneAlertBannerSize() {
        return Math.max(60, Math.min(100, prefInt("phone_alert_banner_size", 100)));
    }

    static int prefInt(String key, int def) {
        try {
            android.content.SharedPreferences p = prefs();
            return p == null ? def : p.getInt(key, def);
        } catch (Throwable ignored) {
            return def;
        }
    }

    /** Called from the AA map-widget constructor hook. Remembers the car context (AA-active detection) and
     *  the street-name pill renderer. Object parameters keep gw_src independent of Waze's obfuscated classes. */
    public static void cacheAaStreetRenderer(Object carContext, Object renderer) {
        aaCarContext = carContext instanceof Context ? (Context) carContext : null;
        aaStreetRenderer = renderer;
        aaRenderedStreet = "";   // a reconnect builds a new renderer even when the road name is unchanged
    }

    /**
     * "Always show the street name" (aa_force_current_street, default off). Waze's own flow can leave the
     * Android Auto street pill empty until navigation starts; the map-matched location already carries the
     * street, so while not navigating it is drawn into the pill. De-duplicated so a GPS tick does not build a
     * bitmap every second. Hook: LocationNativeManager.d(ProviderPosition), after the location is published.
     */
    public static void onWazeLocationForAA(Object wazeLocation) {
        try {
            if (!modEnabled() || !pref("aa_force_current_street", false) || wazeLocation == null) return;
            if (hudNavigating) return;   // never overwrite Waze's own navigation UI

            java.lang.reflect.Method matcherMethod = aaLocationMatcherMethod;
            if (matcherMethod == null || matcherMethod.getDeclaringClass() != wazeLocation.getClass()) {
                matcherMethod = wazeLocation.getClass().getMethod("g");
                matcherMethod.setAccessible(true);
                aaLocationMatcherMethod = matcherMethod;
            }
            Object matcher = matcherMethod.invoke(wazeLocation);
            if (matcher == null) return;

            java.lang.reflect.Method streetMethod = aaMatcherStreetMethod;
            if (streetMethod == null || streetMethod.getDeclaringClass() != matcher.getClass()) {
                streetMethod = matcher.getClass().getMethod("d");
                streetMethod.setAccessible(true);
                aaMatcherStreetMethod = streetMethod;
            }
            Object rawStreet = streetMethod.invoke(matcher);
            String street = rawStreet == null ? "" : rawStreet.toString().trim();
            if (street.length() == 0 || street.equals(aaRenderedStreet)) return;

            Context carContext = aaCarContext;
            Object renderer = aaStreetRenderer;
            if (carContext == null || renderer == null) return;
            // The Waze bitmap builder has no declared Java constructor; a small typed smali bridge mirrors
            // Waze's own new-instance/Object.<init> sequence and pushes the bitmap to the widget renderer.
            Object result = Class.forName("com.waze.gw.AaStreetRendererBridge")
                    .getMethod("render", Context.class, Object.class, String.class)
                    .invoke(null, carContext, renderer, street);
            if (Boolean.TRUE.equals(result)) aaRenderedStreet = street;
        } catch (Throwable t) {
            Log.w(TAG, "AA current street update failed", t);
        }
    }

    private static volatile String lastPhoneRoute = "";

    /**
     * Route hook (MainActivityExt ev.q(), patch_phone_main_projected.sh). true = phone shows the
     * full map ("MainMobile"), false = Waze's "running on the car screen" page ("MainProjected").
     * site 1: car is projecting. Stock: projected page; the "phone_map_while_projected" setting
     *         (default on, as V13 always did) keeps the map instead. It only picks a screen; the
     *         location pipeline is unaffected. The AA "No GPS" popup traced back to Waze putting its
     *         coordinate display (GPS_SHOW_COORDINATES) in the GPS warning slot.
     * site 2: a projection happened before, the car no longer reports Projection and the Waze map
     *         is not primary. Stock stays on the projected page, so the phone never returned to the
     *         map after unplugging. The setting keeps the map; otherwise return to the map once the
     *         Android Auto surface is gone.
     * site 3: everything else; always the map, as in stock. Called only for the log line.
     */
    public static boolean phoneRouteUsesMap(int site) {
        boolean map;
        boolean surface = false;
        try {
            surface = AaSpeedo.isSurfaceActive();
            boolean keep = modEnabled() && pref("phone_map_while_projected", true);
            if (site == 1) map = keep;
            else if (site == 2) map = keep || !surface;
            else map = true;
        } catch (Throwable t) {
            map = site == 3;
        }
        String line = "site=" + site + " aaSurface=" + surface + " -> " + (map ? "map" : "projected");
        if (!line.equals(lastPhoneRoute)) {
            lastPhoneRoute = line;
            Log.i(TAG, "phone route " + line);
        }
        return map;
    }

    /** Preference bridge used by the small hand-written Android Auto smali hooks. */
    public static int getAaSuggestWidgetMode() {
        try {
            int mode = prefInt("aa_suggest_widget_mode", 1);
            return mode >= 0 && mode <= 3 ? mode : 1;
        } catch (Throwable t) {
            return 1;
        }
    }

    /**
     * Expand Waze's landscape viewport horizontally back to the phone map bounds while preserving
     * its vertical safe area. Waze normally centers the map in only the space beside the maneuver
     * panel, which pushes the route and vehicle into the right half of a wide display.
     */
    public static android.graphics.Rect centerLandscapeMapViewport(
            android.graphics.Rect mapBounds, android.graphics.Rect viewport) {
        try {
            Context c = ctx();
            if (mapBounds == null || viewport == null || c == null
                    || !pref("center_landscape_map", true)
                    || c.getResources().getConfiguration().orientation
                    != android.content.res.Configuration.ORIENTATION_LANDSCAPE
                    || AaSpeedo.isSurfaceActive()
                    || mapBounds.width() <= 0 || mapBounds.height() <= 0
                    || viewport.width() <= 0 || viewport.height() <= 0) {
                return viewport;
            }

            android.graphics.Rect centered = new android.graphics.Rect(viewport);
            centered.left = mapBounds.left;
            centered.right = mapBounds.right;
            if (centered.top < mapBounds.top) centered.top = mapBounds.top;
            if (centered.bottom > mapBounds.bottom) centered.bottom = mapBounds.bottom;
            if (centered.width() <= 0 || centered.height() <= 0) return viewport;

            int logKey = mapBounds.left * 31 + mapBounds.right;
            logKey = logKey * 31 + viewport.left;
            logKey = logKey * 31 + viewport.right;
            if (lastLandscapeViewportLogKey != logKey) {
                lastLandscapeViewportLogKey = logKey;
                Log.i(TAG, "Landscape map centered: map=" + mapBounds
                        + " viewport=" + viewport + " -> " + centered);
            }
            return centered;
        } catch (Throwable t) {
            Log.w(TAG, "Landscape viewport adjustment failed safely", t);
            return viewport;
        }
    }

    /** Keep the tracked vehicle clear of Waze's bottom search/ETA sheet on wide phone screens. */
    public static float raiseLandscapeMapAnchor(float originalY) {
        try {
            Context c = ctx();
            if (c == null || !pref("center_landscape_map", true)
                    || c.getResources().getConfiguration().orientation
                    != android.content.res.Configuration.ORIENTATION_LANDSCAPE
                    || AaSpeedo.isSurfaceActive()) {
                return originalY;
            }
            float adjusted = Math.min(originalY, 0.72f);
            int logKey = Float.floatToIntBits(originalY) * 31
                    + Float.floatToIntBits(adjusted);
            if (lastLandscapeAnchorLogKey != logKey) {
                lastLandscapeAnchorLogKey = logKey;
                Log.i(TAG, "Landscape map anchor Y: " + originalY + " -> " + adjusted);
            }
            return adjusted;
        } catch (Throwable t) {
            Log.w(TAG, "Landscape anchor adjustment failed safely", t);
            return originalY;
        }
    }

    /** Selected warning voice preset folder. */
    private static String voiceDir() {
        int p = prefInt("voice_preset", 2);
        if (p == 2) return "voice_waze/";    // Waze (Mẫn nhi)
        if (p == 3) return "voice_short/";   // Ngắn hơn (bản voice_waze cũ)
        // VML presets 1/4 were removed. Old users safely fall back to Waze voice.
        return "voice_waze/";
    }

    /** GPS speed correction applied to the RAW speed before Waze uses it (updateSpeedometer hook).
     *  Only applies while actually moving (>= 3 km/h) so a stopped vehicle never shows phantom speed. */
    public static int adjustSpeed(int speed) {
        if (!modEnabled()) return speed;
        if (speed < 3) return speed;                       // standstill / creeping -> no adjust
        int pct = prefInt("gps_pct", 0);                   // additive % mode (0 = off, 5 = +5%); mutually exclusive with offset
        if (pct != 0) return Math.max(0, Math.round(speed * (100 + pct) / 100f));
        int off = prefInt("gps_offset", 0);                // fixed km/h offset
        if (off != 0) return Math.max(0, speed + off);
        return speed;
    }

    /**
     * Legacy compatibility target for beta builds that patched ProviderPosition.
     *
     * Mutating this second native stream caused Android Auto stability/class-loading failures and
     * could apply the GPS correction twice.  The AA overlay now reads aaPhoneSpeed instead, so an
     * old caller must receive its original value unchanged.
     */
    public static int adjustLocationSpeedMmPerSecond(int speedMmPerSecond) {
        return speedMmPerSecond;
    }

    /**
     * Atomic 5.x hook: publish the corrected value to the Mod and return that exact value to
     * Waze's speedometer state. Keeping both operations in one callback prevents a future build
     * from retaining onSpeedo() while accidentally dropping the separate adjustSpeed() call.
     */
    public static int onSpeedoAndAdjust(int speed, String units, int limit, double acc) {
        try {
            lastWazeLocationElapsed = SystemClock.elapsedRealtime();
            int corrected = adjustSpeed(speed);
            logGpsCorrection(speed, corrected);
            publishAaPhoneSpeed(corrected, units, limit);
            followingSpeed = new AaSpeedSnapshot(speed > 0 ? corrected : -1, limit,
                    units, lastWazeLocationElapsed);
            onSpeedo(corrected, units, limit, acc);
            return corrected;
        } catch (Throwable ignored) {
            try {
                publishAaPhoneSpeed(speed, units, limit);
                followingSpeed = new AaSpeedSnapshot(-1, limit, units, 0L);
                onSpeedo(speed, units, limit, acc);
            } catch (Throwable ignoredAgain) { }
            return speed;
        }
    }

    /** Atomic compatibility hook for Waze 4.x (the last parameter is integer accuracy). */
    public static int onSpeedoAndAdjust(int speed, String units, int limit, int acc) {
        try {
            lastWazeLocationElapsed = SystemClock.elapsedRealtime();
            int corrected = adjustSpeed(speed);
            logGpsCorrection(speed, corrected);
            publishAaPhoneSpeed(corrected, units, limit);
            followingSpeed = new AaSpeedSnapshot(speed > 0 ? corrected : -1, limit,
                    units, lastWazeLocationElapsed);
            onSpeedo(corrected, units, limit, (double) acc);
            return corrected;
        } catch (Throwable ignored) {
            try {
                publishAaPhoneSpeed(speed, units, limit);
                followingSpeed = new AaSpeedSnapshot(-1, limit, units, 0L);
                onSpeedo(speed, units, limit, (double) acc);
            } catch (Throwable ignoredAgain) { }
            return speed;
        }
    }

    private static void logGpsCorrection(int raw, int corrected) {
        int pct = prefInt("gps_pct", 0);
        int offset = prefInt("gps_offset", 0);
        if (pct == 0 && offset == 0) return;
        long now = android.os.SystemClock.elapsedRealtime();
        if (raw == lastGpsLogRaw && corrected == lastGpsLogCorrected
                && offset == lastGpsLogOffset && pct == lastGpsLogPct
                && now - lastGpsLogMs < 15000L) return;
        lastGpsLogRaw = raw;
        lastGpsLogCorrected = corrected;
        lastGpsLogOffset = offset;
        lastGpsLogPct = pct;
        lastGpsLogMs = now;
        Log.i(TAG, "GPS correction raw=" + raw + " corrected=" + corrected
                + " offset=" + offset + " pct=" + pct
                + " enabled=" + modEnabled());
    }

    /** Age of Waze's native location pipeline. Used only by the bubble foreground-service watchdog. */
    static long wazeLocationAgeMs() {
        long last = lastWazeLocationElapsed;
        return last <= 0L ? Long.MAX_VALUE : Math.max(0L, SystemClock.elapsedRealtime() - last);
    }

    /** Begin a clean foreground recovery probe after the fallback listener is removed. */
    static void resetWazeLocationWatchdog() {
        lastWazeLocationElapsed = SystemClock.elapsedRealtime();
    }

    /**
     * Fallback fix from BubbleKeepAliveService after Waze has stopped its own subscription.
     * This keeps Mod speed/point notices alive even if a Waze-internal consumer is no longer
     * collecting the shared location flow. It deliberately does not claim to be map-matched.
     */
    static void onKeepAliveLocation(android.location.Location location) {
        if (location == null || !modEnabled()) return;
        try {
            int speed = location.hasSpeed()
                    ? Math.max(0, Math.round(location.getSpeed() * 3.6f))
                    : Math.max(0, hudSpeed);
            int corrected = adjustSpeed(speed);
            String units = hudUnits == null || hudUnits.isEmpty() ? "km/h" : hudUnits;
            publishAaPhoneSpeed(corrected, units, hudLimit);
            Region.onPosition(location.getLatitude(), location.getLongitude());
            // Fallback Location.speed is always m/s, independent of Waze's displayed units.
            followingSpeed = new AaSpeedSnapshot(location.hasSpeed() && location.getSpeed() > 0 ? corrected : -1,
                    hudLimit, "km/h", location.getElapsedRealtimeNanos() / 1000000L);
            onSpeedo(corrected, units, hudLimit);
            publishGpsFix(location.hasAccuracy() ? location.getAccuracy() : -1.0,
                    I18n.tr("core.backup_gps"));
            Context context = ctx();
            if (context != null) {
                int bearing = location.hasBearing() ? Math.round(location.getBearing()) : -1;
                PointNoticeRepository.PositionSnapshot snapshot =
                        new PointNoticeRepository.PositionSnapshot(
                                location.getLatitude(), location.getLongitude(), corrected,
                                bearing, location.hasAccuracy() ? location.getAccuracy() : -1.0,
                                false, SystemClock.elapsedRealtime());
                TripBlackBox.onPosition(context,
                        location.getLatitude(), location.getLongitude(), corrected, hudLimit,
                        bearing, location.hasAccuracy() ? location.getAccuracy() : -1.0,
                        false, hudRoadSegmentId, hudCurStreet);
                PointNoticeRepository.onPosition(context, snapshot);
                RoadPointNoticeRepository.onPosition(context, snapshot);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Fallback location update rejected safely", t);
        }
    }

    /** First thing in MetricsReporterNativeManagerBase.reportMetricJNI: true drops the analytics metric. */
    public static boolean blockTelemetry() {
        return modEnabled() && pref("block_telemetry", false);
    }

    /** Title of the "Mod settings" row injected into Waze's main menu, in the language Waze shows. */
    public static String modMenuTitle() {
        return I18n.tr("core.mod_settings");
    }

    /** Drawable id of the xADAS logo (icon of the xADAS entry in the Mod settings), or 0 when it is missing. */
    public static int xadasLogoRes() {
        return modResourceId(ctx(), "mod_xadas_logo", "drawable");
    }

    /** Called from the injected "Mod settings" row in Waze's menu. */
    public static void openModSettings(Context c) {
        try {
            if (c == null) c = ctx();
            if (!modEnabled(c)) return;
            android.content.Intent it = new android.content.Intent(c, ModSettingsActivity.class);
            it.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
            c.startActivity(it);
        } catch (Throwable t) { /* ignore */ }
    }

    /**
     * Resolves resources injected into the original APK. Clone builds change the manifest
     * package to com.chisadin.wazemod, while apktool keeps the resource-table package com.waze.
     * Looking up only by Context.getPackageName() therefore returns zero on every dual build.
     */
    static int modResourceId(Context c, String name, String type) {
        if (c == null || name == null || type == null) return 0;
        int id = c.getResources().getIdentifier(name, type, c.getPackageName());
        if (id == 0 && !"com.waze".equals(c.getPackageName())) {
            id = c.getResources().getIdentifier(name, type, "com.waze");
        }
        if (id != 0 && name.startsWith("mod_report_")) {
            try {
                String actual = c.getResources().getResourceEntryName(id);
                if (!name.equals(actual)) {
                    Log.w(TAG, "Reject mismatched Mod resource " + name + " -> 0x"
                            + Integer.toHexString(id) + " (" + actual + ")");
                    return 0;
                }
            } catch (Throwable error) {
                Log.w(TAG, "Reject unreadable Mod resource " + name + " -> 0x"
                        + Integer.toHexString(id), error);
                return 0;
            }
        }
        return id;
    }

    /**
     * Adds the Mod reporting entry points to Waze's own reports-v2 Compose grid.
     *
     * The reports UI classes are intentionally referenced only by name.  This keeps Gateway
     * buildable with the small Android-only javac classpath and, more importantly, makes a class
     * mismatch fail closed: Waze's original state is returned unchanged instead of crashing the
     * report menu.
     */

    public static Object patchNativeReportMenuState(Object state) {
        if (state == null || !trustedBuild() || !pref("mod_reports_enabled", true)) return state;
        try {
            if (!"com.waze.ui.v.b.ba".equals(state.getClass().getName())) return state; // Loaded

            Object menu = reflectNoArg(state, "a");
            if (menu == null || !"com.waze.ui.v.b.ao".equals(menu.getClass().getName())) {
                return state; // only patch MainMenu, never a Waze submenu
            }

            Object rawItems = reflectNoArg(menu, "j");
            if (!(rawItems instanceof java.util.List)) return state;
            java.util.List<?> original = (java.util.List<?>) rawItems;
            Context c = ctx();
            if (c == null) return state;
            int wrongSpeedLabel = modResourceId(c, "mod_report_wrong_speed", "string");
            int turnLabel = modResourceId(c, "mod_report_turn", "string");
            int turnRemovedLabel = modResourceId(c, "mod_report_turn_removed", "string");
            int cameraLabel = modResourceId(c, "mod_report_camera", "string");
            for (Object item : original) {
                Object key = reflectNoArg(item, "i");
                if (key instanceof String && ((String) key).startsWith("gw_mod:")) return state;
                Object label = reflectNoArg(item, "b");
                if (label instanceof Number) {
                    int labelId = ((Number) label).intValue();
                    if ((wrongSpeedLabel != 0 && labelId == wrongSpeedLabel)
                            || (turnLabel != 0 && labelId == turnLabel)
                            || (turnRemovedLabel != 0 && labelId == turnRemovedLabel)
                            || (cameraLabel != 0 && labelId == cameraLabel)) {
                        return state;
                    }
                }
            }

            ClassLoader loader = state.getClass().getClassLoader();
            Class<?> subtypeClass = Class.forName("com.waze.ui.v.b.bj", true, loader);
            @SuppressWarnings({"rawtypes", "unchecked"})
            Object placeholderType = java.lang.Enum.valueOf((Class) subtypeClass, "TRAFFIC_DEFAULT");
            Class<?> itemClass = Class.forName("com.waze.ui.v.b.au", true, loader);
            java.lang.reflect.Constructor<?> itemCtor = itemClass.getConstructor(
                    subtypeClass, Integer.TYPE, Integer.TYPE, Object.class, Boolean.TYPE);
            Class<?> categoryTypeClass = Class.forName("com.waze.ui.v.b.bh", true, loader);
            Class<?> categoryItemClass = Class.forName("com.waze.ui.v.b.as", true, loader);
            java.lang.reflect.Constructor<?> categoryCtor = categoryItemClass.getConstructor(
                    categoryTypeClass, Integer.TYPE, Integer.TYPE, Integer.TYPE, java.util.List.class,
                    Boolean.TYPE);

            java.util.ArrayList<Object> speedChildren = new java.util.ArrayList<Object>(9);
            boolean mph = Units.imperial();
            int[] speeds = mph ? ModReport.PRESETS_MPH : new int[]{30, 40, 50, 60, 70, 80, 90, 100, 120};
            for (int speed : speeds) {
                String label = (mph ? "mod_report_speed_mph_" : "mod_report_speed_") + speed;
                Object child = nativeReportLeaf(c, itemCtor, placeholderType,
                        "gw_mod:speed:" + speed, label, mph ? mphReportIcon(speed) : label);
                if (child != null) speedChildren.add(child);
            }

            String[][] turnChildrenSpec = {
                    {"gw_mod:turn:left", "mod_report_turn_left"},
                    {"gw_mod:turn:right", "mod_report_turn_right"},
                    {"gw_mod:turn:u", "mod_report_turn_u"},
                    {"gw_mod:turn:left_u", "mod_report_turn_left_u"},
                    {"gw_mod:turn:right_u", "mod_report_turn_right_u"},
                    {"gw_mod:turn:straight", "mod_report_turn_straight"}
            };
            java.util.ArrayList<Object> turnChildren = nativeReportLeaves(
                    c, itemCtor, placeholderType, turnChildrenSpec);

            String[][] turnRemovedChildrenSpec = {
                    {"gw_mod:turn_removed:left", "mod_report_turn_removed_left"},
                    {"gw_mod:turn_removed:right", "mod_report_turn_removed_right"},
                    {"gw_mod:turn_removed:u", "mod_report_turn_removed_u"},
                    {"gw_mod:turn_removed:left_u", "mod_report_turn_removed_left_u"},
                    {"gw_mod:turn_removed:right_u", "mod_report_turn_removed_right_u"},
                    {"gw_mod:turn_removed:straight", "mod_report_turn_removed_straight"}
            };
            java.util.ArrayList<Object> turnRemovedChildren = nativeReportLeaves(
                    c, itemCtor, placeholderType, turnRemovedChildrenSpec);

            String[][] cameraChildrenSpec = {
                    {"gw_mod:camera:combined", "mod_report_camera_combined"},
                    {"gw_mod:camera:speed", "mod_report_camera_speed"},
                    {"gw_mod:camera:red_light", "mod_report_camera_red_light"},
                    {"gw_mod:no_camera_here", "mod_report_no_camera_here", "mod_report_icon_no_camera_here"}
            };
            java.util.ArrayList<Object> cameraChildren = nativeReportLeaves(
                    c, itemCtor, placeholderType, cameraChildrenSpec);
            java.util.ArrayList<Object> residentialChildren = nativeReportLeaves(
                    c, itemCtor, placeholderType, new String[][]{
                            {"gw_mod:residential_start", "mod_report_residential_start", "mod_report_icon_residential_area_start"},
                            {"gw_mod:residential_end", "mod_report_residential_end", "mod_report_icon_residential_area_end"}});
            java.util.ArrayList<Object> noPassingChildren = nativeReportLeaves(
                    c, itemCtor, placeholderType, new String[][]{
                            {"gw_mod:no_passing", "mod_report_no_passing", "mod_report_icon_no_passing"},
                            {"gw_mod:end_no_passing", "mod_report_end_no_passing", "mod_report_icon_end_no_passing"}});
            java.util.ArrayList<Object> otherChildren = nativeReportLeaves(
                    c, itemCtor, placeholderType, new String[][]{
                            {"gw_mod:traffic_light", "mod_report_traffic_light", "mod_report_icon_traffic_light"},
                            {"gw_mod:end_prohibitions", "mod_report_end_prohibitions", "mod_report_icon_end_prohibitions"}});

            @SuppressWarnings({"rawtypes", "unchecked"})
            Object hazardCategory = java.lang.Enum.valueOf((Class) categoryTypeClass, "HAZARD");
            @SuppressWarnings({"rawtypes", "unchecked"})
            Object mapIssueCategory = java.lang.Enum.valueOf((Class) categoryTypeClass, "MAP_ISSUE");
            @SuppressWarnings({"rawtypes", "unchecked"})
            Object policeCategory = java.lang.Enum.valueOf((Class) categoryTypeClass, "POLICE");

            java.util.ArrayList<Object> modItems = new java.util.ArrayList<Object>(11);
            Object speedCategory = nativeReportCategory(c, categoryCtor, mapIssueCategory,
                    "mod_report_wrong_speed", "mod_report_icon_wrong_speed", speedChildren);
            Object turnCategory = nativeReportCategory(c, categoryCtor, mapIssueCategory,
                    "mod_report_turn", "mod_report_icon_turn", turnChildren);
            // The group reuses the grey "restriction removed" sign that the old single item had.
            Object turnRemovedCategory = nativeReportCategory(c, categoryCtor, mapIssueCategory,
                    "mod_report_turn_removed", "mod_report_icon_turn_significant_change",
                    turnRemovedChildren);
            Object cameraCategory = nativeReportCategory(c, categoryCtor, policeCategory,
                    "mod_report_camera_group", "mod_report_icon_camera", cameraChildren);
            // Residential-area and no-passing reports are Vietnamese road signs: only offered in Vietnam.
            boolean vietnamSigns = Region.inVietnam();
            Object residentialCategory = !vietnamSigns ? null : nativeReportCategory(c, categoryCtor,
                    mapIssueCategory, "mod_report_residential", "mod_report_icon_residential_area_start",
                    residentialChildren);
            Object noPassingCategory = !vietnamSigns ? null : nativeReportCategory(c, categoryCtor,
                    mapIssueCategory, "mod_report_no_passing", "mod_report_icon_no_passing", noPassingChildren);
            Object otherCategory = nativeReportCategory(c, categoryCtor, hazardCategory,
                    "mod_report_other", "mod_report_icon_end_prohibitions", otherChildren);
            for (Object category : new Object[]{speedCategory, turnCategory, turnRemovedCategory,
                    cameraCategory, residentialCategory, noPassingCategory, otherCategory}) {
                if (category != null) modItems.add(category);
            }

            if (modItems.isEmpty()) {
                Log.w(TAG, "No Mod report resources resolved for package " + c.getPackageName());
            } else {
                Log.i(TAG, "Resolved " + modItems.size() + " Mod report entries for package "
                        + c.getPackageName());
            }

            java.util.ArrayList<Object> merged = new java.util.ArrayList<Object>(original.size() + 10);
            merged.addAll(modItems);
            merged.addAll((java.util.Collection<?>) original);
            if (merged.size() == original.size()) return state;

            boolean disclaimer = Boolean.TRUE.equals(reflectNoArg(menu, "k"));
            Class<?> menuBaseClass = Class.forName("com.waze.ui.f.w", true, loader);
            Class<?> mainMenuClass = Class.forName("com.waze.ui.v.b.ao", true, loader);
            Object patchedMenu = mainMenuClass.getConstructor(java.util.List.class, Boolean.TYPE)
                    .newInstance(merged, disclaimer);

            Object conversationalMode = reflectNoArg(state, "b");
            Class<?> conversationalClass = Class.forName("com.waze.ui.i.h", true, loader);
            Class<?> loadedClass = Class.forName("com.waze.ui.v.b.ba", true, loader);
            return loadedClass.getConstructor(menuBaseClass, conversationalClass)
                    .newInstance(patchedMenu, conversationalMode);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to extend native report menu", t);
            return state;
        }
    }

    /** Fragment lifecycle hook: prevent FloatSpeedo from covering Waze's native report surface. */
    public static void onNativeReportMenuVisibility(boolean visible) {
        try {
            FloatSpeedo.setNativeReportVisible(visible);
        } catch (Throwable ignored) { /* never crash host */ }
    }

    // Android Auto has a separate car_lib report pipeline.  Keep its synthetic model objects in
    // an identity map: reports_v2 data classes compare by value, while multiple Mod categories use
    // the same harmless native placeholder enum solely to let Waze open its subtype screen.
    private static final java.util.Map<Object, AaModReportCategory> AA_MOD_REPORT_CATEGORIES =
            java.util.Collections.synchronizedMap(
                    new java.util.IdentityHashMap<Object, AaModReportCategory>());
    private static final Object AA_REPORT_TIMEOUT_LOCK = new Object();
    private static final long AA_REPORT_TIMEOUT_MS = 10_000L;
    private static long aaReportTimeoutGeneration;
    private static java.lang.ref.WeakReference<Object> aaReportCoordinator =
            new java.lang.ref.WeakReference<Object>(null);

    /** Start the inactivity watchdog when Waze constructs its Android Auto report screen. */
    public static void onAaReportScreenOpened(Object coordinator) {
        if (coordinator == null) return;
        scheduleAaReportTimeout(coordinator);
    }

    /** Any category/menu interaction grants another complete ten-second window. */
    public static void onAaReportInteraction(Object coordinator) {
        if (coordinator == null) return;
        scheduleAaReportTimeout(coordinator);
    }

    /** Invalidate queued watchdog callbacks when the report screen leaves its lifecycle. */
    public static void onAaReportScreenClosed() {
        synchronized (AA_REPORT_TIMEOUT_LOCK) {
            aaReportTimeoutGeneration++;
            aaReportCoordinator.clear();
        }
    }

    private static void scheduleAaReportTimeout(final Object coordinator) {
        final long generation;
        synchronized (AA_REPORT_TIMEOUT_LOCK) {
            aaReportCoordinator = new java.lang.ref.WeakReference<Object>(coordinator);
            generation = ++aaReportTimeoutGeneration;
        }
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override public void run() {
                synchronized (AA_REPORT_TIMEOUT_LOCK) {
                    if (generation != aaReportTimeoutGeneration
                            || aaReportCoordinator.get() != coordinator) return;
                    aaReportTimeoutGeneration++;
                    aaReportCoordinator.clear();
                }
                try {
                    // gq.b() emits Waze's own gt.a close event; no synthetic Back navigation.
                    coordinator.getClass().getMethod("b").invoke(coordinator);
                    Log.i(TAG, "Android Auto report screen closed after 10s inactivity");
                } catch (Throwable error) {
                    Log.w(TAG, "Unable to close inactive Android Auto report screen", error);
                }
            }
        }, AA_REPORT_TIMEOUT_MS);
    }

    private static final class AaModReportLeaf {
        final String key;
        final String label;
        final String icon;

        AaModReportLeaf(String key, String label, String icon) {
            this.key = key;
            this.label = label;
            this.icon = icon;
        }
    }

    private static final class AaModReportCategory {
        final String id;
        final String label;
        final String icon;
        final AaModReportLeaf[] leaves;

        AaModReportCategory(String id, String label, String icon, AaModReportLeaf[] leaves) {
            this.id = id;
            this.label = label;
            this.icon = icon;
            this.leaves = leaves;
        }
    }

    private static AaModReportLeaf aaLeaf(String key, String resource) {
        return new AaModReportLeaf(key, resource, resource);
    }

    private static final AaModReportCategory[] AA_MOD_REPORT_SPECS = {
            new AaModReportCategory("gw_mod:category:speed", "mod_report_wrong_speed",
                    "mod_report_icon_wrong_speed", new AaModReportLeaf[]{
                    aaLeaf("gw_mod:speed:30", "mod_report_speed_30"),
                    aaLeaf("gw_mod:speed:40", "mod_report_speed_40"),
                    aaLeaf("gw_mod:speed:50", "mod_report_speed_50"),
                    aaLeaf("gw_mod:speed:60", "mod_report_speed_60"),
                    aaLeaf("gw_mod:speed:70", "mod_report_speed_70"),
                    aaLeaf("gw_mod:speed:80", "mod_report_speed_80"),
                    aaLeaf("gw_mod:speed:90", "mod_report_speed_90"),
                    aaLeaf("gw_mod:speed:100", "mod_report_speed_100"),
                    aaLeaf("gw_mod:speed:120", "mod_report_speed_120")}),
            new AaModReportCategory("gw_mod:category:turn", "mod_report_turn",
                    "mod_report_icon_turn", new AaModReportLeaf[]{
                    aaLeaf("gw_mod:turn:left", "mod_report_turn_left"),
                    aaLeaf("gw_mod:turn:right", "mod_report_turn_right"),
                    aaLeaf("gw_mod:turn:u", "mod_report_turn_u"),
                    aaLeaf("gw_mod:turn:left_u", "mod_report_turn_left_u"),
                    aaLeaf("gw_mod:turn:right_u", "mod_report_turn_right_u"),
                    aaLeaf("gw_mod:turn:straight", "mod_report_turn_straight")}),
            new AaModReportCategory("gw_mod:category:camera", "mod_report_camera",
                    "mod_report_icon_camera", new AaModReportLeaf[]{
                    aaLeaf("gw_mod:camera:combined", "mod_report_camera_combined"),
                    aaLeaf("gw_mod:camera:speed", "mod_report_camera_speed"),
                    aaLeaf("gw_mod:camera:red_light", "mod_report_camera_red_light")}),
            new AaModReportCategory("gw_mod:category:no_camera_here",
                    "mod_report_no_camera_here", "mod_report_icon_no_camera_here",
                    new AaModReportLeaf[]{new AaModReportLeaf("gw_mod:no_camera_here",
                            "mod_report_no_camera_here", "mod_report_icon_no_camera_here")}),
            new AaModReportCategory("gw_mod:category:no_passing", "mod_report_no_passing",
                    "mod_report_icon_no_passing", new AaModReportLeaf[]{
                    new AaModReportLeaf("gw_mod:no_passing", "mod_report_no_passing",
                            "mod_report_icon_no_passing")}),
            new AaModReportCategory("gw_mod:category:end_no_passing",
                    "mod_report_end_no_passing", "mod_report_icon_end_no_passing",
                    new AaModReportLeaf[]{new AaModReportLeaf("gw_mod:end_no_passing",
                            "mod_report_end_no_passing", "mod_report_icon_end_no_passing")}),
            new AaModReportCategory("gw_mod:category:end_prohibitions",
                    "mod_report_end_prohibitions", "mod_report_icon_end_prohibitions",
                    new AaModReportLeaf[]{new AaModReportLeaf("gw_mod:end_prohibitions",
                            "mod_report_end_prohibitions", "mod_report_icon_end_prohibitions")}),
            new AaModReportCategory("gw_mod:category:residential_start",
                    "mod_report_residential_start", "mod_report_icon_residential_area_start",
                    new AaModReportLeaf[]{new AaModReportLeaf("gw_mod:residential_start",
                            "mod_report_residential_start", "mod_report_icon_residential_area_start")}),
            new AaModReportCategory("gw_mod:category:residential_end",
                    "mod_report_residential_end", "mod_report_icon_residential_area_end",
                    new AaModReportLeaf[]{new AaModReportLeaf("gw_mod:residential_end",
                            "mod_report_residential_end", "mod_report_icon_residential_area_end")}),
            new AaModReportCategory("gw_mod:category:traffic_light",
                    "mod_report_traffic_light", "mod_report_icon_traffic_light",
                    new AaModReportLeaf[]{new AaModReportLeaf("gw_mod:traffic_light",
                            "mod_report_traffic_light", "mod_report_icon_traffic_light")}),
            new AaModReportCategory("gw_mod:category:turn_removed", "mod_report_turn_removed",
                    "mod_report_icon_turn_significant_change", new AaModReportLeaf[]{
                    aaLeaf("gw_mod:turn_removed:left", "mod_report_turn_removed_left"),
                    aaLeaf("gw_mod:turn_removed:right", "mod_report_turn_removed_right"),
                    aaLeaf("gw_mod:turn_removed:u", "mod_report_turn_removed_u"),
                    aaLeaf("gw_mod:turn_removed:left_u", "mod_report_turn_removed_left_u"),
                    aaLeaf("gw_mod:turn_removed:right_u", "mod_report_turn_removed_right_u"),
                    aaLeaf("gw_mod:turn_removed:straight", "mod_report_turn_removed_straight")})
    };

    /** No-passing and residential-area reports are Vietnamese road signs: only offered in Vietnam. */
    private static boolean aaReportHidden(AaModReportCategory category) {
        String id = category.id;
        boolean vietnamSign = id.endsWith(":no_passing") || id.endsWith(":end_no_passing")
                || id.endsWith(":residential_start") || id.endsWith(":residential_end");
        return vietnamSign && !Region.inVietnam();
    }

    private static AaModReportCategory aaModReportRoot() {
        java.util.ArrayList<AaModReportLeaf> groups = new java.util.ArrayList<AaModReportLeaf>();
        for (AaModReportCategory category : AA_MOD_REPORT_SPECS) {
            if (!aaReportHidden(category)) groups.add(new AaModReportLeaf(category.id, category.label, category.icon));
        }
        return new AaModReportCategory("gw_mod:category:root", "literal:Waze Mod",
                "mod_report_icon_wrong_speed", groups.toArray(new AaModReportLeaf[0]));
    }

    /** Add Mod categories to car_lib.q.db, shared by the V2 and legacy Android Auto screens. */
    public static Object patchAaReportMenuState(Object state) {
        if (state == null || !trustedBuild() || !pref("mod_reports_enabled", true)
                || !"com.waze.car_lib.a.dl".equals(state.getClass().getName())) return state;
        try {
            Object raw = reflectNoArg(state, "d");
            if (!(raw instanceof java.util.List)) return state;
            java.util.List<?> nativeItems = (java.util.List<?>) raw;
            for (Object item : nativeItems) {
                Object id = reflectNoArg(item, "b");
                if (id instanceof String && ((String) id).startsWith("gw_mod:")) return state;
            }
            Context context = ctx();
            if (context == null) return state;
            ClassLoader loader = state.getClass().getClassLoader();
            java.util.ArrayList<Object> merged = new java.util.ArrayList<Object>(
                    nativeItems.size() + 1);
            AaModReportCategory root = aaModReportRoot();
            Object rootItem = newAaReportUiItem(loader, context, root.id, root.label, root.icon);
            if (rootItem != null) merged.add(rootItem);
            merged.addAll((java.util.Collection<?>) nativeItems);
            return copyAaReportState(state, merged, null, null, null);
        } catch (Throwable error) {
            Log.w(TAG, "Unable to extend Android Auto report menu", error);
            return state;
        }
    }

    /** Called before car_lib parses a root item id through reports_v2.b.p.valueOf(). */
    public static boolean openAaModReportCategory(Object coordinator, String id) {
        if (coordinator == null || id == null) return false;
        if (id.startsWith("gw_mod:") && !pref("mod_reports_enabled", true)) return true;
        if (!trustedBuild()) return false;
        AaModReportCategory category = aaModReportCategory(id);
        if (category == null) return false;
        onAaReportInteraction(coordinator);
        try {
            ClassLoader loader = coordinator.getClass().getClassLoader();
            Class<?> groupClass = Class.forName("com.waze.reports_v2.b.o", true, loader);
            Class<?> subtypeClass = Class.forName("com.waze.reports_v2.b.au", true, loader);
            Class<?> categoryClass = Class.forName("com.waze.reports_v2.b.ad", true, loader);
            @SuppressWarnings({"rawtypes", "unchecked"})
            Object placeholderGroup = java.lang.Enum.valueOf((Class) groupClass, "TRAFFIC");
            @SuppressWarnings({"rawtypes", "unchecked"})
            Object placeholderSubtype = java.lang.Enum.valueOf((Class) subtypeClass,
                    "TRAFFIC_DEFAULT");
            java.util.ArrayList<Object> placeholders = new java.util.ArrayList<Object>(
                    category.leaves.length);
            for (int i = 0; i < category.leaves.length; i++) placeholders.add(placeholderSubtype);
            Object nativeCategory = categoryClass.getConstructor(groupClass, java.util.List.class)
                    .newInstance(placeholderGroup, placeholders);
            AA_MOD_REPORT_CATEGORIES.put(nativeCategory, category);
            coordinator.getClass().getMethod("d", categoryClass).invoke(coordinator, nativeCategory);
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "Unable to open Android Auto Mod report category " + id, error);
            return true; // consume the synthetic id; never let Waze enum.valueOf() see it
        }
    }

    /** Replace the placeholder subtype state with the real Mod leaf labels/icons/ids. */
    public static Object patchAaSubReportState(Object nativeCategory, Object state) {
        if (nativeCategory == null || state == null || !trustedBuild()
                || !pref("mod_reports_enabled", true)) return state;
        AaModReportCategory category = AA_MOD_REPORT_CATEGORIES.get(nativeCategory);
        if (category == null) return state;
        try {
            Context context = ctx();
            if (context == null) return state;
            ClassLoader loader = state.getClass().getClassLoader();
            java.util.ArrayList<Object> leaves = new java.util.ArrayList<Object>(category.leaves.length);
            for (AaModReportLeaf leaf : category.leaves) {
                Object item = newAaReportUiItem(loader, context, leaf.key, leaf.label, leaf.icon);
                if (item != null) leaves.add(item);
            }
            String title = resourceText(context, category.label);
            return copyAaReportState(state, leaves, title, Boolean.TRUE, null);
        } catch (Throwable error) {
            Log.w(TAG, "Unable to build Android Auto Mod report submenu", error);
            return state;
        }
    }

    /** Called before car_lib parses a subtype id through reports_v2.b.aw.valueOf(). */
    public static boolean handleAaModReportLeaf(Object coordinator, String key) {
        if (key == null || !key.startsWith("gw_mod:")) return false;
        if (!pref("mod_reports_enabled", true)) return true;
        onAaReportInteraction(coordinator);
        if (key.startsWith("gw_mod:category:"))
            return openAaModReportCategory(coordinator, key);
        if (!trustedBuild()) return true;
        try {
            if (!ModReport.submitNativeItem(key)) {
                Log.w(TAG, "Unknown Android Auto Mod report key " + key);
                return true;
            }
            // Match Waze's native successful-send navigation: close the report coordinator after
            // the explicit leaf tap.  The report itself remains on ModReport's existing async path.
            if (coordinator != null) {
                ClassLoader loader = coordinator.getClass().getClassLoader();
                Class<?> eventClass = Class.forName("com.waze.car_lib.a.cz", true, loader);
                Object event = eventClass.getField("a").get(null);
                java.lang.reflect.Method emit = coordinator.getClass().getMethod("J", Object.class);
                emit.invoke(coordinator, event);
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to submit Android Auto Mod report " + key, error);
        }
        return true;
    }

    /** Name of the drawable with the mph sign for {@code speed}: square (US) or round, as Waze draws its signs. */
    private static String mphReportIcon(int speed) {
        return (LimitSign.square() ? "mod_report_speed_us_" : "mod_report_speed_mph_") + speed;
    }

    /** The wrong-speed category with mph values (its km/h twin is the first entry of AA_MOD_REPORT_SPECS). */
    private static AaModReportCategory aaMphSpeedCategory() {
        AaModReportLeaf[] leaves = new AaModReportLeaf[ModReport.PRESETS_MPH.length];
        for (int i = 0; i < leaves.length; i++) {
            int speed = ModReport.PRESETS_MPH[i];
            leaves[i] = new AaModReportLeaf("gw_mod:speed:" + speed, "mod_report_speed_mph_" + speed,
                    mphReportIcon(speed));
        }
        return new AaModReportCategory("gw_mod:category:speed", "mod_report_wrong_speed",
                "mod_report_icon_wrong_speed", leaves);
    }

    private static AaModReportCategory aaModReportCategory(String id) {
        if ("gw_mod:category:root".equals(id)) return aaModReportRoot();
        if ("gw_mod:category:speed".equals(id) && Units.imperial()) return aaMphSpeedCategory();
        for (AaModReportCategory category : AA_MOD_REPORT_SPECS) {
            if (category.id.equals(id)) return aaReportHidden(category) ? null : category;
        }
        return null;
    }

    private static Object newAaReportUiItem(ClassLoader loader, Context context, String id,
                                            String labelResource, String iconResource)
            throws Exception {
        int icon = modResourceId(context, iconResource, "drawable");
        String label = resourceText(context, labelResource);
        if (icon == 0 || label.length() == 0) return null;
        Class<?> itemClass = Class.forName("com.waze.car_lib.a.a.b", true, loader);
        return itemClass.getConstructor(String.class, String.class, String.class, Integer.TYPE, Boolean.TYPE)
                .newInstance(id, label, null, icon, Boolean.FALSE);
    }

    /**
     * Android Auto report labels, by the name of the Vietnamese resource they used to come from. The text is
     * translated (the resource is a single Vietnamese string); the phone's native report grid still takes its
     * label from the resource id and is not translated.
     */
    private static final String[][] AA_LABEL_IDS = {
            {"mod_report_wrong_speed", "report.wrong_speed"},
            {"mod_report_turn", "report.no_turn_u_turn"},
            {"mod_report_camera", "report.missing_camera"},
            {"mod_report_no_passing", "point.no_overtaking"},
            {"mod_report_end_prohibitions", "point.end_of_all_restrictions"},
            {"mod_report_turn_left", "point.no_left_turn"},
            {"mod_report_turn_right", "point.no_right_turn"},
            {"mod_report_turn_u", "point.no_u_turn"},
            {"mod_report_turn_left_u", "report.no_left_turn_u_turn"},
            {"mod_report_turn_right_u", "report.no_right_turn_u_turn"},
            {"mod_report_turn_straight", "point.no_straight_ahead"},
            {"mod_report_camera_combined", "report.automatic_ticketing_camera"},
            {"mod_report_camera_speed", "report.speed_camera"},
            {"mod_report_camera_red_light", "report.red_light_camera"},
            {"mod_report_no_camera_here", "report.no_such_camera_here"},
            {"mod_report_residential_start", "report.residential_area_start"},
            {"mod_report_residential_end", "report.residential_area_end"},
            {"mod_report_end_no_passing", "point.end_of_no_overtaking"},
            {"mod_report_traffic_light", "report.there_is_a_traffic_light"},
            {"mod_report_turn_removed", "report.end_of_turn_ban"},
            {"mod_report_turn_removed_left", "report.end_of_no_left_turn"},
            {"mod_report_turn_removed_right", "report.end_of_no_right_turn"},
            {"mod_report_turn_removed_u", "report.end_of_no_u_turn"},
            {"mod_report_turn_removed_left_u", "report.end_of_no_left_turn_u"},
            {"mod_report_turn_removed_right_u", "report.end_of_no_right_turn_u"},
            {"mod_report_turn_removed_straight", "report.end_of_no_straight_ahead"},
            {"mod_report_turn_significant_change", "report.turn_rule_change"},
            {"mod_report_camera_group", "report.camera"},
            {"mod_report_residential", "report.residential_area"},
            {"mod_report_other", "report.other_issue"},
    };

    /** Translated text of an Android Auto report label, or null when {@code name} is not one of them. */
    private static String aaLabel(String name) {
        if (name == null) return null;
        if (name.startsWith("mod_report_speed_mph_")) {
            try {
                return I18n.f("report.0_mph", Integer.parseInt(name.substring("mod_report_speed_mph_".length())));
            } catch (NumberFormatException notASpeed) {
                return null;
            }
        }
        if (name.startsWith("mod_report_speed_")) {
            try {
                return I18n.f("report.0_km_h", Integer.parseInt(name.substring("mod_report_speed_".length())));
            } catch (NumberFormatException notASpeed) {
                return null;
            }
        }
        for (String[] pair : AA_LABEL_IDS) {
            if (pair[0].equals(name)) return I18n.tr(pair[1]);
        }
        return null;
    }

    private static String resourceText(Context context, String name) {
        if (name != null && name.startsWith("literal:"))
            return name.substring("literal:".length()).trim();
        String translated = aaLabel(name);
        if (translated != null) return translated;
        int id = modResourceId(context, name, "string");
        if (id == 0) return "";
        try { return context.getString(id); }
        catch (Throwable ignored) { return ""; }
    }

    /** Preserve every state field except those explicitly replaced. */
    private static Object copyAaReportState(Object state, java.util.List<Object> items,
                                            String title, Boolean closeButton, Object ignored)
            throws Exception {
        ClassLoader loader = state.getClass().getClassLoader();
        Class<?> stateClass = Class.forName("com.waze.car_lib.a.dl", true, loader);
        Class<?> agentClass = Class.forName("com.waze.car_lib.a.cg", true, loader);
        Class<?> conversationClass = Class.forName("com.waze.ads.c.a.d", true, loader);
        Class<?> modeClass = Class.forName("com.waze.reports_v2.d", true, loader);
        String resolvedTitle = title == null ? String.valueOf(reflectNoArg(state, "c")) : title;
        boolean resolvedClose = closeButton == null
                ? Boolean.TRUE.equals(reflectNoArg(state, "e")) : closeButton.booleanValue();
        Object agent = reflectNoArg(state, "a");
        Object conversation = reflectNoArg(state, "f");
        Object mode = reflectNoArg(state, "b");
        return stateClass.getConstructor(String.class, java.util.List.class, Boolean.TYPE,
                        agentClass, conversationClass, modeClass)
                .newInstance(resolvedTitle, items, resolvedClose, agent, conversation, mode);
    }

    private static Object nativeReportLeaf(Context c, java.lang.reflect.Constructor<?> itemCtor,
                                           Object placeholderType, String key,
                                           String labelResource, String iconResource) throws Exception {
        int labelId = modResourceId(c, labelResource, "string");
        int iconId = modResourceId(c, iconResource, "drawable");
        if (labelId == 0 || iconId == 0) return null;
        return itemCtor.newInstance(placeholderType, iconId, labelId, key, Boolean.FALSE);
    }

    private static java.util.ArrayList<Object> nativeReportLeaves(
            Context c, java.lang.reflect.Constructor<?> itemCtor, Object placeholderType,
            String[][] specs) throws Exception {
        java.util.ArrayList<Object> result = new java.util.ArrayList<Object>(specs.length);
        for (String[] spec : specs) {
            // Optional third column: icon resource when it differs from the label name.
            Object item = nativeReportLeaf(c, itemCtor, placeholderType, spec[0], spec[1],
                    spec.length > 2 ? spec[2] : spec[1]);
            if (item != null) result.add(item);
        }
        return result;
    }

    private static Object nativeReportCategory(Context c,
                                               java.lang.reflect.Constructor<?> categoryCtor,
                                               Object categoryType, String labelResource,
                                               String iconResource, java.util.List<Object> children)
            throws Exception {
        if (children == null || children.isEmpty()) return null;
        int labelId = modResourceId(c, labelResource, "string");
        int iconId = modResourceId(c, iconResource, "drawable");
        if (labelId == 0 || iconId == 0) return null;
        Object category = categoryCtor.newInstance(categoryType, iconId, labelId, labelId, children,
                Boolean.FALSE);
        // Waze normally uses the category enum itself as the LazyGrid key. Our synthetic
        // HAZARD/POLICE/MAP_ISSUE categories coexist with the originals, so give the inherited
        // UI key a unique value while keeping as.d() unchanged for submenu rendering.
        java.lang.reflect.Field uiKey = category.getClass().getSuperclass().getDeclaredField("a");
        uiKey.setAccessible(true);
        uiKey.set(category, "gw_mod:category:" + labelResource);
        return category;
    }

    /**
     * Consumes clicks belonging to the synthetic report-grid items. All native Waze actions are
     * returned untouched. Mod categories are rendered as Waze submenus; even a report without
     * subtypes is represented by a single-choice submenu so Waze's native countdown and Cancel
     * affordance remain available.
     */
    public static boolean handleNativeReportMenuAction(final Object fragment, Object action) {
        if (fragment == null || action == null || !trustedBuild()) return false;
        try {
            String actionClass = action.getClass().getName();

            // Waze's native bottom "Report" button. Submit the currently selected Mod leaf
            // instead of letting the host send our placeholder native report type.
            if ("com.waze.ui.v.b.c".equals(actionClass)) {
                String selectedKey = selectedNativeModReportKey(fragment);
                if (selectedKey == null) return false;
                if (!pref("mod_reports_enabled", true)) return true;
                return closeAndSubmitNativeModReport(fragment, selectedKey);
            }

            if (!"com.waze.ui.v.b.h".equals(actionClass)) return false; // ItemClicked
            Object item = reflectNoArg(action, "b");
            if (isNativeModReportCategory(item)) {
                if (!pref("mod_reports_enabled", true)) return true;
                return openNativeModReportSubmenu(fragment, item);
            }
            Object rawKey = reflectNoArg(item, "i");
            if (!(rawKey instanceof String)) return false;
            final String key = (String) rawKey;
            if (!key.startsWith("gw_mod:")) return false;
            if (!pref("mod_reports_enabled", true)) return true;

            // Inside a native submenu, let Waze update the selected/checkmarked child. Actual
            // submission is intercepted above when the user presses the native Report button.
            Object menu = currentNativeReportMenu(fragment);
            if (menu != null && "com.waze.ui.v.b.ap".equals(menu.getClass().getName())) {
                return false;
            }

            // A leaf on the main grid has no subtype choice, so submit it immediately.
            return closeAndSubmitNativeModReport(fragment, key);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to handle Mod report item", t);
            return false;
        }
    }

    private static Object nativeReportViewModel(Object fragment) {
        if (fragment == null) return null;
        try {
            java.lang.reflect.Method method = fragment.getClass().getDeclaredMethod("u");
            method.setAccessible(true);
            return method.invoke(fragment);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object currentNativeReportMenu(Object fragment) {
        Object viewModel = nativeReportViewModel(fragment);
        Object stateFlow = reflectNoArg(viewModel, "p");
        Object loadedState = reflectNoArg(stateFlow, "d");
        return reflectNoArg(loadedState, "a");
    }

    private static String selectedNativeModReportKey(Object fragment) {
        Object menu = currentNativeReportMenu(fragment);
        if (menu == null || !"com.waze.ui.v.b.ap".equals(menu.getClass().getName())) return null;
        Object selected = reflectNoArg(menu, "n");
        Object rawKey = reflectNoArg(selected, "i");
        if (!(rawKey instanceof String)) return null;
        String key = (String) rawKey;
        return key.startsWith("gw_mod:") ? key : null;
    }

    private static boolean closeAndSubmitNativeModReport(final Object fragment, final String key) {
        Object rawActivity = reflectNoArg(fragment, "requireActivity");
        if (!(rawActivity instanceof android.app.Activity)) {
            rawActivity = reflectNoArg(fragment, "getActivity");
        }
        if (!(rawActivity instanceof android.app.Activity)) return true;
        final android.app.Activity activity = (android.app.Activity) rawActivity;

        // 5.27: the stock close button runs the fragment's private x() (stop sound/speech, then dispatch the
        // Closed action). Stop the send countdown first so the auto-send cannot fire after we close.
        if (!closeNativeReportViewModel(nativeReportViewModel(fragment))) {
            // 5.24's ReportMenuFragment.m() no longer closes the sheet; the 5.27 fragment close x() is the last resort.
            if (!closeNativeReportFragment(fragment)) activity.onBackPressed();
        }

        activity.getWindow().getDecorView().postDelayed(new Runnable() {
            @Override public void run() {
                try {
                    if (!ModReport.submitNativeItem(key)) {
                        Log.w(TAG, "Unknown Mod report key " + key);
                    }
                } catch (Throwable ignored) { /* never crash host */ }
            }
        }, 80L);
        return true;
    }

    /**
     * Hooked at the top of the report view model's send (cv.u), reached by both the Confirm button
     * and the countdown expiry. A selected Mod leaf is submitted by WazeMod instead of Waze.
     */
    public static boolean onNativeReportSend(Object viewModel) {
        if (viewModel == null || !trustedBuild()) return false;
        try {
            java.lang.reflect.Method current = viewModel.getClass().getDeclaredMethod("A");
            current.setAccessible(true);
            Object menu = current.invoke(viewModel);
            if (menu == null || !"com.waze.ui.v.b.ap".equals(menu.getClass().getName())) return false;
            Object rawKey = reflectNoArg(reflectNoArg(menu, "n"), "i");
            if (!(rawKey instanceof String) || !((String) rawKey).startsWith("gw_mod:")) return false;
            final String key = (String) rawKey;
            closeNativeReportViewModel(viewModel);
            if (pref("mod_reports_enabled", true)) {
                new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                    @Override public void run() {
                        try {
                            if (!ModReport.submitNativeItem(key)) Log.w(TAG, "Unknown Mod report key " + key);
                        } catch (Throwable ignored) { /* never crash host */ }
                    }
                }, 80L);
            }
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Unable to intercept native report send", t);
            return false;
        }
    }

    /** 5.27: cancel the countdown job, then run the fragment's own close routine x(). */
    private static boolean closeNativeReportFragment(Object fragment) {
        try {
            Object viewModel = nativeReportViewModel(fragment);
            if (viewModel == null) return false;
            java.lang.reflect.Field job = viewModel.getClass().getDeclaredField("n");
            job.setAccessible(true);
            Object running = job.get(viewModel);
            if (running != null) {
                running.getClass().getMethod("s", java.util.concurrent.CancellationException.class)
                        .invoke(running, (Object) null);
            }
            java.lang.reflect.Method close = fragment.getClass().getDeclaredMethod("x");
            close.setAccessible(true);
            close.invoke(fragment);
            Log.i(TAG, "native report closed through fragment.x()");
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "fragment close unavailable: " + error.getClass().getSimpleName());
            return false;
        }
    }

    /** Mirror cv.E()'s teardown without sending: stop the countdown job, then cv.C() closes. */
    private static boolean closeNativeReportViewModel(Object viewModel) {
        if (viewModel == null) return false;
        try {
            Class<?> type = viewModel.getClass();
            java.lang.reflect.Field job = type.getDeclaredField("n");
            job.setAccessible(true);
            Object running = job.get(viewModel);
            if (running != null) {
                running.getClass().getMethod("s", java.util.concurrent.CancellationException.class)
                        .invoke(running, (Object) null);
            }
            // 5.27: the stock "send" teardown is D(boolean, reports_v2.b.o, reports_v2.b.au): it clears the report
            // menu flag (cn.a(), which NativeManager.reportMenuShown() reads), cancels the countdown, clears the
            // map bridge, closes the presenter and launches the coroutine that tells the host to dismiss. With no
            // group/subtype it submits nothing, so it is exactly "close like Waze does after a send".
            try {
                ClassLoader loader = type.getClassLoader();
                java.lang.reflect.Method stockSend = type.getDeclaredMethod("D", boolean.class,
                        Class.forName("com.waze.reports_v2.b.o", true, loader),
                        Class.forName("com.waze.reports_v2.b.au", true, loader));
                stockSend.setAccessible(true);
                stockSend.invoke(viewModel, Boolean.FALSE, null, null);
                Log.i(TAG, "native report closed through stock send teardown D(false, null, null)");
                return true;
            } catch (ClassNotFoundException | NoSuchMethodException older) {
                // not 5.27: continue with the other strategies
            }
            // 5.27: B() = presenter.c(Closed) + presenter.close(), and close() cancels the presenter scope before
            // the event is consumed, so the sheet stays. The stock X button instead dispatches the action
            // ui.v.b.e(ui.v.b.m) through the view model, which delivers the event only. Clear the map bridge
            // (C()) and do the same.
            try {
                Class<?> closed = Class.forName("com.waze.ui.v.b.m", true, type.getClassLoader());
                Class<?> eventBase = Class.forName("com.waze.ui.c.s", true, type.getClassLoader());
                Class<?> eventAction = Class.forName("com.waze.ui.v.b.e", true, type.getClassLoader());
                Class<?> actionBase = Class.forName("com.waze.ui.v.a.b", true, type.getClassLoader());
                java.lang.reflect.Method clear = type.getDeclaredMethod("C");
                clear.setAccessible(true);
                clear.invoke(viewModel);
                Object action = eventAction.getConstructor(eventBase).newInstance(closed.getField("a").get(null));
                type.getMethod("w", actionBase).invoke(viewModel, action);
                Log.i(TAG, "native report closed through ui.v.b.e(Closed)");
                return true;
            } catch (ClassNotFoundException | NoSuchMethodException | NoSuchFieldException older) {
                // 5.24: D() clears the bridge, C() closes
            }
            for (String name : new String[]{"D", "C"}) {
                java.lang.reflect.Method m = type.getDeclaredMethod(name);
                m.setAccessible(true);
                m.invoke(viewModel);
            }
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Unable to close native report sheet", t);
            return false;
        }
    }

    private static boolean isNativeModReportCategory(Object item) {
        if (item == null || !"com.waze.ui.v.b.as".equals(item.getClass().getName())) return false;
        Object key = reflectNoArg(item, "i");
        return key instanceof String && ((String) key).startsWith("gw_mod:category:");
    }

    /** Publish Waze's real SubMenu state, bypassing its one-tap category shortcut. */
    private static boolean openNativeModReportSubmenu(Object fragment, Object categoryItem) {
        try {
            Object childrenObject = reflectNoArg(categoryItem, "e");
            Object categoryType = reflectNoArg(categoryItem, "d");
            Object titleObject = reflectNoArg(categoryItem, "c");
            if (!(childrenObject instanceof java.util.List) || categoryType == null
                    || !(titleObject instanceof Number)) return true;
            java.util.List<?> children = (java.util.List<?>) childrenObject;
            if (children.isEmpty()) return true;

            Object viewModel = nativeReportViewModel(fragment);
            if (viewModel == null) return true;
            ClassLoader loader = viewModel.getClass().getClassLoader();

            // 5.27: let Waze open its own submenu for our synthetic category. da.E(as) publishes the submenu state
            // and, unlike a state we build by hand, also starts the countdown job (cz) that sends/closes when it
            // runs out.
            try {
                java.lang.reflect.Method open = viewModel.getClass().getDeclaredMethod("E",
                        Class.forName("com.waze.ui.v.b.as", true, loader));
                open.setAccessible(true);
                open.invoke(viewModel, categoryItem);
                Log.i(TAG, "native report submenu opened through stock E(category) with countdown");
                return true;
            } catch (ClassNotFoundException | NoSuchMethodException older) {
                // 5.24: build the submenu by hand below
            }

            long durationMs = 10000L;
            try {
                Class<?> configClass = Class.forName(
                        "com.waze.reports_v2.presentation.dc", true, loader);
                int seconds = ((Number) configClass.getMethod("c").invoke(null)).intValue();
                durationMs = java.util.concurrent.TimeUnit.SECONDS.toMillis(seconds);
            } catch (Throwable ignored) { /* keep the safe fallback */ }

            Class<?> categoryTypeClass = Class.forName("com.waze.ui.v.b.bh", true, loader);
            Class<?> subtypeItemClass = Class.forName("com.waze.ui.v.b.au", true, loader);
            Class<?> submenuClass = Class.forName("com.waze.ui.v.b.ap", true, loader);
            Object selected = children.get(0);
            Object submenu = submenuClass.getConstructor(Integer.TYPE, categoryTypeClass,
                    java.util.List.class, Long.TYPE, Long.TYPE, subtypeItemClass)
                    .newInstance(((Number) titleObject).intValue(), categoryType, children,
                            System.currentTimeMillis(), durationMs, selected);

            Object currentState = reflectNoArg(reflectNoArg(viewModel, "p"), "d");
            Object conversationalMode = reflectNoArg(currentState, "b");
            if (conversationalMode == null) {
                Class<?> offClass = Class.forName("com.waze.ui.v.b.ax", true, loader);
                java.lang.reflect.Field singleton = offClass.getField("a");
                conversationalMode = singleton.get(null);
            }

            Class<?> menuBaseClass = Class.forName("com.waze.ui.f.w", true, loader);
            Class<?> conversationalClass = Class.forName("com.waze.ui.i.h", true, loader);
            Class<?> loadedClass = Class.forName("com.waze.ui.v.b.ba", true, loader);
            Object loaded = loadedClass.getConstructor(menuBaseClass, conversationalClass)
                    .newInstance(submenu, conversationalMode);

            java.lang.reflect.Field mutableState = viewModel.getClass().getDeclaredField("t");
            mutableState.setAccessible(true);
            Object flow = mutableState.get(viewModel);
            java.lang.reflect.Method publish = null;
            for (java.lang.reflect.Method method : flow.getClass().getMethods()) {
                if ("e".equals(method.getName()) && method.getParameterTypes().length == 1) {
                    publish = method;
                    break;
                }
            }
            if (publish == null) throw new NoSuchMethodException("MutableStateFlow.e(Object)");
            publish.invoke(flow, loaded);
            return true;
        } catch (Throwable t) {
            // Consume the synthetic category even on a version mismatch: falling through would
            // let Waze submit the placeholder native report type.
            Log.w(TAG, "Unable to open native Mod report submenu", t);
            return true;
        }
    }

    private static Object reflectNoArg(Object target, String method) {
        if (target == null) return null;
        try {
            java.lang.reflect.Method m = target.getClass().getMethod(method);
            m.setAccessible(true);
            return m.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Binary-compatibility shim for Beta builds that injected the retired PCM-gain hook into
     * Media3. Current smali no longer calls it, but keeping the exact signature prevents a stale
     * split or partially updated installation from crashing the ExoPlayer playback thread.
     */
    public static void finishPcmGain(java.nio.ByteBuffer buffer, int writtenBytes,
                                     int originalRemaining) {
        // Intentionally empty. PCM amplification was removed.
    }

    /** Hook (5.x): updateSpeedometer(speed, units, limit, double acc). */
    public static void onSpeedo(int speed, String units, int limit, double acc) {
        publishGpsFix(acc, "Waze");
        onSpeedo(speed, units, limit);
    }

    private static synchronized void publishGpsFix(double accuracyMeters, String source) {
        if (!(accuracyMeters > 0.0) || Double.isInfinite(accuracyMeters)
                || Double.isNaN(accuracyMeters)) {
            // Some Waze speedometer frames carry 0 while the position proto still has a valid
            // accuracy. Never let that empty frame erase the real fix published a moment later.
            return;
        }

        gpsFixElapsed = SystemClock.elapsedRealtime();
        gpsFixSource = source != null ? source : "";
        gpsAccuracyRaw = accuracyMeters;
        gpsAccuracySmoothed = gpsAccuracySmoothed > 0.0
                ? gpsAccuracySmoothed * 0.72 + accuracyMeters * 0.28 : accuracyMeters;
        int measured = gpsLevelForAccuracy(gpsAccuracySmoothed);
        if (measured >= gpsStableLevel) {
            gpsStableLevel = measured;
            gpsPendingLevel = -1;
            gpsPendingCount = 0;
        } else if (gpsPendingLevel == measured) {
            if (++gpsPendingCount >= 2) {
                gpsStableLevel = measured;
                gpsPendingLevel = -1;
                gpsPendingCount = 0;
            }
        } else {
            gpsPendingLevel = measured;
            gpsPendingCount = 1;
        }
    }

    private static int gpsLevelForAccuracy(double accuracyMeters) {
        if (accuracyMeters <= 5.0) return 4;
        if (accuracyMeters <= 10.0) return 3;
        if (accuracyMeters <= 20.0) return 2;
        if (accuracyMeters <= 50.0) return 1;
        return 0;
    }

    public static int gpsSignalLevel() {
        return gpsFixAgeMs() > GPS_FIX_STALE_MS ? 0 : gpsStableLevel;
    }

    /** Unsmoothened quality for the live diagnostics page; driving UI should use gpsSignalLevel(). */
    public static int gpsInstantSignalLevel() {
        if (gpsFixAgeMs() > GPS_FIX_STALE_MS) return 0;
        double accuracy = gpsAccuracyRaw;
        return accuracy > 0.0 ? gpsLevelForAccuracy(accuracy) : 0;
    }

    public static double gpsAccuracyMeters() {
        return gpsFixAgeMs() > GPS_FIX_STALE_MS ? -1.0 : gpsAccuracyRaw;
    }

    public static double gpsSmoothedAccuracyMeters() {
        return gpsFixAgeMs() > GPS_FIX_STALE_MS ? -1.0 : gpsAccuracySmoothed;
    }

    public static long gpsFixAgeMs() {
        long fix = gpsFixElapsed;
        return fix <= 0L ? Long.MAX_VALUE
                : Math.max(0L, SystemClock.elapsedRealtime() - fix);
    }

    public static String gpsFixSource() {
        return gpsFixSource;
    }

    /** Hook (4.x): updateSpeedometer(speed, units, limit, int acc) — and the shared core. */
    public static void onSpeedo(int speed, String units, int limit) {
        if (!modEnabled()) return;
        // State first. HUD Link and the Data API read these fields, so no housekeeping step below may
        // leave them stale: an exception in one of those steps used to abort this callback before
        // the assignments, freezing every HUD value while the app itself kept working.
        // The speed is already GPS-offset-corrected by adjustSpeed() in the smali hook, and the limit
        // already capped for motorcycles by capLimit(), so nothing to adjust here.
        hudSpeed = speed;
        hudUnits = units != null ? units : "";
        Units.setSpeedUnits(units);
        hudLimit = limit;
        hudSpeedAtElapsed = SystemClock.elapsedRealtime();
        try {
            // Each step is isolated: one failing feature must not stop the others (or the logic below).
            try { configureSpeedDropNativeOnce(); } catch (Throwable t) { speedoStepFailed("speed-drop", t); }
            try { CustomNativeAlerts.evaluateHeadlightReminder(ctx()); } catch (Throwable t) { speedoStepFailed("headlight", t); }
            // Restore HUD Link after Android recreates Waze's process/service. The facade is
            // rate-limited and returns immediately while the service is alive.
            try { HudLink.ensureStarted(ctx()); } catch (Throwable t) { speedoStepFailed("hud-link", t); }
            // re-apply optional force-on flags; self-throttled to every 30 s
            try { WazeFeatureOverrides.tick(); } catch (Throwable t) { speedoStepFailed("feature-overrides", t); }
            try { DrivingBreakReminder.onSpeed(ctx(), speed, units); } catch (Throwable t) { speedoStepFailed("break-reminder", t); }
            try { onSlowSpeed(); } catch (Throwable t) { speedoStepFailed("slow-speed", t); }
            // Native and fallback callbacks share this state. UI stays live; speech waits 1.5 s.
            synchronized (stableSpeedLimit) {
                hudLimit = limit;
                if (stableSpeedLimit.update(limit, SystemClock.elapsedRealtime())) {
                    announcedLimit = limit;
                    Log.i(TAG, "limit stable for 1500ms -> " + limit);
                    if (stableSpeedLimit.isQuickReturn()) {
                        Log.i(TAG, "limit " + limit + " restored after a short segment; not repeated");
                    } else if (limit >= 10 && limit <= 120 && pref("say_limit", true)
                            && voiceSpeedEnabled("say_limit_speed_", limit)) {
                        stableSpeedLimit.markSpoken(limit);
                        playModVoice("current_" + limit,
                                voiceDir() + "current_speed_" + limit + ".mp3");
                    }
                }
            }
            updateMapOverspeedEffect(speed, limit);

            // This callback is hot: resolving is cache-only and never performs network I/O. Segment
            // changes are dispatched at their actual navigation/map-matcher sources, not from here.
            long roadSegmentId = hudRoadSegmentId;
            // The minimum-speed sign is a Vietnamese road rule: only in Vietnam.
            int nextMinimum = pref("minimum_speed", false) && Region.inVietnam() && isMetricSpeedUnits(hudUnits)
                    ? MinimumSpeedPolicy.resolve(limit, roadSegmentId, onFreeway(),
                            nativeRoadTypeKnown())
                    : MinimumSpeedPolicy.NONE;
            if (nextMinimum != minimumSpeedLimit) {
                minimumSpeedLimit = nextMinimum;
                Log.i(TAG, "minimum limit -> " + nextMinimum + " (maximum=" + limit
                        + ", segment=" + roadSegmentId + ")");
            }

            int eff = announcedLimit;
            boolean limitSettled = hudLimit == eff
                    && stableSpeedLimit.isCurrent(eff, SystemClock.elapsedRealtime());
            long warningAt = 0L;
            int warningOrdinal = 0;
            boolean muteButtonVisible = false;
            synchronized (overspeedStateLock) {
                if (eff >= 10 && speed > eff + prefInt("over_margin", OVER_MARGIN)) {
                    long now = SystemClock.elapsedRealtime();
                    int repeatMode = prefInt("over_repeat_mode", 1);
                    int maxWarnings = OverspeedReminderPolicy.maxWarnings(repeatMode);
                    if (!wasOver) {
                        wasOver = true;
                        overWarningCount = 0;
                        lastOverMs = 0L;
                        overSinceMs = now;
                        overspeedMuted = false;
                    }
                    boolean due = OverspeedReminderPolicy.isDue(
                            overWarningCount, lastOverMs, now, OVER_REPEAT_MS);
                    if (limitSettled && !overspeedMuted && overWarningCount < maxWarnings && due) {
                        // Reserve the edge before audio setup. Native and fallback location can
                        // arrive on different loopers; reserving here prevents duplicate players.
                        warningOrdinal = ++overWarningCount;
                        lastOverMs = now;
                        warningAt = now;
                    }
                    // Only offer the button while there is still a warning it could silence.
                    muteButtonVisible = !overspeedMuted
                            && now - overSinceMs >= OVER_MUTE_BUTTON_DELAY_MS
                            && overWarningCount < maxWarnings
                            && pref("say_over", true)
                            && pref("overspeed_mute_button", true);
                } else if (speed <= eff) {
                    wasOver = false;
                    overWarningCount = 0;
                    lastOverMs = 0L;
                    overSinceMs = 0L;
                    overspeedMuted = false;
                }
            }
            setOverspeedMuteButtonWanted(muteButtonVisible);
            if (warningAt != 0L) {
                boolean enabled = pref("say_over", true);
                boolean started = !enabled || playOverspeedAlert();
                if (started) {
                    Log.i(TAG, "overspeed warning " + (enabled ? "queued" : "disabled")
                            + " count=" + warningOrdinal + " speed=" + speed + " limit=" + eff
                            + " androidAuto=" + isAndroidAutoActive());
                } else {
                    // Release only our own reservation so a later speed frame can retry.
                    synchronized (overspeedStateLock) {
                        if (lastOverMs == warningAt && overWarningCount == warningOrdinal) {
                            overWarningCount--;
                            lastOverMs = 0L;
                        }
                    }
                    Log.w(TAG, "overspeed warning deferred; audio output not ready"
                            + " speed=" + speed + " limit=" + eff
                            + " androidAuto=" + isAndroidAutoActive());
                }
            }
        } catch (Throwable t) { /* never crash host */ }
    }

    private static volatile long hudSpeedAtElapsed;
    private static long lastSpeedoFailureLogAt;

    /** Milliseconds since the last speed callback reached {@link #onSpeedo}; MAX_VALUE if none yet. */
    static long hudSpeedAgeMs() {
        long at = hudSpeedAtElapsed;
        return at <= 0L ? Long.MAX_VALUE : Math.max(0L, SystemClock.elapsedRealtime() - at);
    }

    /** A housekeeping step failed; say so (at most once a minute) instead of swallowing it silently. */
    private static void speedoStepFailed(String step, Throwable error) {
        long now = SystemClock.elapsedRealtime();
        if (now - lastSpeedoFailureLogAt < 60_000L) return;
        lastSpeedoFailureLogAt = now;
        Log.w(TAG, "onSpeedo step '" + step + "' failed: " + error.getClass().getSimpleName()
                + (error.getMessage() == null ? "" : ": " + error.getMessage()));
    }

    /** Minimum-speed policy values are km/h; avoid showing them beside a maximum expressed in mph. */
    private static boolean isMetricSpeedUnits(String units) {
        if (units == null || units.isEmpty()) return true; // Waze often omits units after initialisation
        String normalized = units.toLowerCase(java.util.Locale.US);
        if (normalized.contains("mph") || normalized.contains("mi/h")) return false;
        return true;
    }

    /** Apply the settings toggle immediately; enabling is refreshed by the next hot speed callback. */
    public static void onMinimumSpeedSettingChanged(boolean enabled) {
        if (!enabled) minimumSpeedLimit = MinimumSpeedPolicy.NONE;
    }

    private static long roadTypeProbeMs;
    private static volatile int nativeRoadType = -1;
    private static volatile long nativeRoadTypeMs;

    /** Samples the native road type of the matched line on Waze's position thread. */
    private static void probeRoadType() {
        long now = SystemClock.elapsedRealtime();
        if (now - roadTypeProbeMs < 2_000L) return;
        roadTypeProbeMs = now;
        long[] r = SegmentNative.currentRoadType();
        nativeRoadType = r == null ? -1 : (int) r[0];
        nativeRoadTypeMs = now;
    }

    /**
     * Native tile road type wins when fresh: 1 = freeway; ramps (4) and every other known type are
     * not. The street name lags behind on ramps, so it is only a fallback for unknown (0) / -1.
     */
    static boolean onFreeway() {
        if (nativeRoadTypeKnown()) return nativeRoadType == 1;
        return isCurrentRoadFreeway(hudRoadSegmentId);
    }

    private static boolean nativeRoadTypeKnown() {
        int type = nativeRoadType;
        return type >= 1 && type <= 20
                && SystemClock.elapsedRealtime() - nativeRoadTypeMs < 5_000L;
    }

    /** A Vietnamese CT name is stronger evidence than Waze's occasionally broad HIGHWAY type. */
    private static boolean isCurrentRoadFreeway(long roadSegmentId) {
        String streetName = hudCurStreet != null ? hudCurStreet : "";
        if (!streetName.equals(classifiedStreetName)) {
            classifiedStreetIsFreeway = RoadTypeClassifier.isFreewayStreetName(streetName);
            classifiedStreetName = streetName;
            Log.i(TAG, "road name=[" + streetName + "] freewayByName=" + classifiedStreetIsFreeway);
        }
        if (classifiedStreetIsFreeway) return true;
        return Boolean.TRUE.equals(freewayBySegment.get(Long.valueOf(roadSegmentId)));
    }

    /**
     * Hooked from AlternativeRoutesResponse polyline conversion. Each Waze polyline carries one
     * RoadType plus the real server segment ids it covers. FREEWAY means controlled-access
     * motorway; HIGHWAY is deliberately stored as false because it also includes national roads.
     */
    public static void onRoadTypePolylines(Object response) {
        if (!modEnabled()) return;
        try {
            if (response == null) return;
            Object polylines = response.getClass().getMethod("getPolylinesList").invoke(response);
            if (!(polylines instanceof Iterable)) return;
            int total = 0, freeways = 0;
            for (Object polyline : (Iterable<?>) polylines) {
                if (polyline == null) continue;
                Object roadType = polyline.getClass().getMethod("getRoadType").invoke(polyline);
                String roadTypeName = roadType instanceof Enum
                        ? ((Enum<?>) roadType).name() : String.valueOf(roadType);
                boolean freeway = "FREEWAY".equalsIgnoreCase(roadTypeName)
                        || "ROAD_TYPE_FREEWAY".equalsIgnoreCase(roadTypeName);
                Object ids = polyline.getClass().getMethod("getServerSegmentIdList").invoke(polyline);
                if (!(ids instanceof Iterable)) continue;
                for (Object idValue : (Iterable<?>) ids) {
                    if (!(idValue instanceof Number)) continue;
                    long segmentId = ((Number) idValue).longValue();
                    if (segmentId < 0) segmentId &= 0xFFFFFFFFL; // protobuf uint32 accessor
                    if (segmentId <= 0) continue;
                    freewayBySegment.put(Long.valueOf(segmentId), Boolean.valueOf(freeway));
                    total++;
                    if (freeway) freeways++;
                }
            }
            if (total > 0) Log.i(TAG, "road types cached=" + total + " freeway=" + freeways);
        } catch (Throwable t) {
            Log.w(TAG, "road type metadata unavailable: " + t.getClass().getSimpleName());
        }
    }

    private static long lastFromNode = -1;
    private static long lastToNode = -1;
    
    private static void onSlowSpeed() {
        if (hudSpeed >= 5 || hudSpeed < 0) {
            lastNotifiedSlowSpeed = -1;
            return;
        }
    
        if (hudSpeed == lastNotifiedSlowSpeed) return;
    
        long now = SystemClock.elapsedRealtime();
        if (now - lastSlowMs < SLOW_DEBOUNCE_MS) return;
    
        lastNotifiedSlowSpeed = hudSpeed;
        lastSlowMs = now;
    
        lastFromNode = hudSegmentId >> 32;
        lastToNode = hudSegmentId & 0xFFFFFFFFL;
    
        if (pref("parking_test", false)) checkParkingRestriction();
    }

    /** Hook: updateAlertersRepository(repo). Builds HUD alert list + announces speed-drops. */
    public static void onAlerts(Object repo) {
        if (!modEnabled()) return;
        try {
            if (repo == null) return;
            Class<?> rc = repo.getClass();
            Object countValue = rc.getMethod("getDescriptorsCount").invoke(repo);
            if (!(countValue instanceof Number)) return;
            int n = ((Number) countValue).intValue();
            java.util.HashSet<String> live = new java.util.HashSet<String>();
            java.util.ArrayList<String> hud = new java.util.ArrayList<String>();   // "%07d|label" for sorting
            String nearestSpeedKey = "";
            int nearestSpeedValue = -1, nearestSpeedMeters = Integer.MAX_VALUE;
            boolean heldSpeedStillLive = false;
            boolean activeAverageZoneAlert = false;
            int activeAverageZoneLeftM = Integer.MAX_VALUE;

            for (int i = 0; i < n; i++) {
                Object d = rc.getMethod("getDescriptors", int.class).invoke(repo, i);
                if (d == null) continue;
                if (CustomNativeAlerts.isCustomDescriptor(d)) continue;
                Object info = d.getClass().getMethod("getInfo").invoke(d);
                if (info == null) continue;
                Object typeValue = info.getClass().getMethod("getTypeValue").invoke(info);
                if (!(typeValue instanceof Number)) continue;
                int type = ((Number) typeValue).intValue();
                String icon = (String) info.getClass().getMethod("getIconName").invoke(info);
                String title = (String) info.getClass().getMethod("getTitle").invoke(info);
                String twd = (String) info.getClass().getMethod("getTitleWithDistance").invoke(info);
                int distM = parseDistM(twd);
                if (isActiveAverageZoneAlert(icon, title, twd)) {
                    activeAverageZoneAlert = true;
                    if (distM >= 0 && distM < activeAverageZoneLeftM) {
                        activeAverageZoneLeftM = distM;
                    }
                }
                String key = String.valueOf(d.getClass().getMethod("getAlertId").invoke(d)).replaceAll("\\s+", "");
                live.add(key);
                maybeReadMissingSignNote(key, icon, distM);

                // HUD list: report-type alerts shown with Waze's own icon (iconName) + name
                String label = null, ic = "";
                if (icon != null && !icon.isEmpty()) {   // any alert that carries an icon (cameras, tolls, hazards…)
                    label = safe(title);
                    ic = resolveIcon(type, icon);    // map alerter names -> available report/skin icons
                }
                if (label != null && distM >= 0 && type != TYPE_SPEED_DROP) {
                    // strip sortkey -> "resolvedIcon\tname\tdistText\tmeters\trawIcon"; HUD uses resolved, bubble uses raw
                    hud.add(String.format(java.util.Locale.US, "%07d\t%s\t%s\t%s\t%d\t%s",
                            distM, ic, label, fmtDist(distM), distM, icon));
                }

                // upcoming speed-limit change: show in the list (as a speed sign) + announce it
                if (type == TYPE_SPEED_DROP) {
                    int v = trailingInt(icon);
                    if (distM >= 0 && v >= 10 && v <= 120) {
                        hud.add(String.format(java.util.Locale.US, "%07d\tspeeddrop_%d\t%d\t%s\t%d\tspeeddrop_%d",
                                distM, v, v, fmtDist(distM), distM, v));
                        if (distM < nearestSpeedMeters) {
                            nearestSpeedKey = key;
                            nearestSpeedValue = v;
                            nearestSpeedMeters = distM;
                        }
                        if (key.equals(heldSpeedDropKey)) heldSpeedStillLive = true;
                    }
                    long retryNow = SystemClock.elapsedRealtime();
                    Long retryAt = speedDropRetryAt.get(key);
                    if (hudNavigating && pref("say_next", true)
                            && voiceSpeedEnabled("say_next_speed_", v)
                            && !announcedAlert.contains(key)
                            && (retryAt == null || retryNow >= retryAt.longValue())
                            && distM >= 0 && distM <= LOOKAHEAD_M) {
                        boolean played = v >= 10 && v <= 120
                                ? playModVoice("next_" + v,
                                        voiceDir() + "next_speed_" + v + ".mp3")
                                : playModVoice("next_any", voiceDir() + "next_speed.mp3");
                        if (played) {
                            announcedAlert.add(key);
                            speedDropRetryAt.remove(key);
                            Log.i(TAG, "next-speed queued key=" + key + " value=" + v
                                    + " distance=" + distM);
                        } else {
                            speedDropRetryAt.put(key, retryNow + SPEED_DROP_RETRY_MS);
                            Log.w(TAG, "next-speed play failed; retry key=" + key
                                    + " value=" + v + " distance=" + distM);
                        }
                    }
                }
            }

            long now = SystemClock.elapsedRealtime();
            boolean holdingMissingSpeed = false;
            if (!heldSpeedDropKey.isEmpty() && !heldSpeedStillLive) {
                int remaining = heldSpeedDropRemaining(now);
                boolean reachedNewLimit = heldSpeedDropFromLimit != heldSpeedDropValue
                        && hudLimit == heldSpeedDropValue;
                if (!reachedNewLimit && heldSpeedDropMeters <= SPEED_DROP_HOLD_MAX_M && remaining > 0) {
                    hud.add(String.format(java.util.Locale.US, "%07d\tspeeddrop_%d\t%d\t%s\t%d\tspeeddrop_%d",
                            remaining, heldSpeedDropValue, heldSpeedDropValue, fmtDist(remaining),
                            remaining, heldSpeedDropValue));
                    holdingMissingSpeed = true;
                } else {
                    clearHeldSpeedDrop();
                }
            }
            // Follow the nearest live speed-drop normally. Do not replace an active held warning with
            // the next descriptor several kilometres farther down the route.
            if (!holdingMissingSpeed) {
                if (nearestSpeedValue >= 10) {
                    heldSpeedDropKey = nearestSpeedKey;
                    heldSpeedDropValue = nearestSpeedValue;
                    heldSpeedDropMeters = nearestSpeedMeters;
                    heldSpeedDropFromLimit = hudLimit;
                    heldSpeedDropAtMs = now;
                } else {
                    clearHeldSpeedDrop();
                }
            }
            java.util.Collections.sort(hud);
            java.util.ArrayList<String> out = new java.util.ArrayList<String>();
            for (String s : hud) {
                int p = s.indexOf('\t');                 // drop the "%07d" distance sort key
                out.add(p >= 0 ? s.substring(p + 1) : s); // -> "iconName\tlabel  dist"
            }
            setNativeAlerts(out);
            setAverageZoneFromAlerts(activeAverageZoneAlert,
                    activeAverageZoneLeftM == Integer.MAX_VALUE ? -1 : activeAverageZoneLeftM);
            announcedAlert.retainAll(live);
            speedDropRetryAt.keySet().retainAll(live);
        } catch (Throwable t) { /* ignore */ }
    }

    private static final java.util.HashMap<String, Long> noteFetchAt = new java.util.HashMap<String, Long>();
    private static final long NOTE_FETCH_RETRY_MS = 4000L;

    /**
     * A "missing sign" alert (icon icon_report_hazard_missingsign) carries the map editor's note (e.g. "Tốc độ tối đa 70
     * | Tối thiểu 50") only in the on-route RtAlertItem, never in AlerterInfo.getDescription(). When the alert is within
     * {@link #LOOKAHEAD_M}, ask Waze for the on-route list and read the note once. It is read as written, so with a
     * Vietnamese note in Vietnam only a Vietnamese voice reads it.
     */
    private static void maybeReadMissingSignNote(String key, String icon, int distM) {
        try {
            if (icon == null || !icon.toLowerCase(java.util.Locale.US).contains("missingsign")) return;
            if (distM < 0 || distM > LOOKAHEAD_M || announcedAlert.contains(key)) return;
            if (!pref("missing_sign_note_tts", true)) return;
            long now = android.os.SystemClock.elapsedRealtime();
            synchronized (noteFetchAt) {
                Long next = noteFetchAt.get(key);
                if (next != null && now < next) return;
                if (noteFetchAt.size() > 100) noteFetchAt.clear();
                noteFetchAt.put(key, now + NOTE_FETCH_RETRY_MS);
            }
            fetchOnRouteNote(key, icon, distM);
        } catch (Throwable t) {
            Log.w(TAG, "missing-sign note failed", t);
        }
    }

    /** Asks Waze's on-route alert manager (the same call the alert rail uses) for its RtAlertItem list. */
    private static void fetchOnRouteNote(final String key, final String icon, final int distM) throws Throwable {
        Object manager = WazeKoin.get(Class.forName("com.waze.rtalerts.RtAlertsOnRouteNativeManager"));
        if (manager == null) return;
        Class<?> callbackType = Class.forName("g.h.a.l");
        java.lang.reflect.Method query = manager.getClass().getMethod("b", callbackType);
        Object callback = java.lang.reflect.Proxy.newProxyInstance(callbackType.getClassLoader(),
                new Class<?>[]{callbackType}, new java.lang.reflect.InvocationHandler() {
                    @Override public Object invoke(Object proxy, java.lang.reflect.Method method, Object[] args) {
                        if ("invoke".equals(method.getName()) && args != null && args.length == 1) {
                            onOnRouteAlerts(key, icon, distM, args[0]);
                        }
                        return null;
                    }
                });
        query.invoke(manager, callback);
    }

    private static void onOnRouteAlerts(String key, String icon, int distM, Object list) {
        try {
            if (list == null || announcedAlert.contains(key)) return;
            java.util.List<?> items = (java.util.List<?>) list.getClass().getMethod("getRtAlertItemList").invoke(list);
            Object best = null;
            int bestGap = Integer.MAX_VALUE;
            for (Object item : items) {
                String itemIcon = stringResult(item.getClass().getMethod("getIcon").invoke(item));
                int itemDist = ((Number) item.getClass().getMethod("getDistance").invoke(item)).intValue();
                String itemNote = stringResult(item.getClass().getMethod("getDescription").invoke(item));
                Log.i(TAG, "on-route alert icon=" + itemIcon + " distance=" + itemDist + " noteLen=" + itemNote.length());
                if (!itemIcon.equals(icon) && !itemIcon.toLowerCase(java.util.Locale.US).contains("missingsign")) continue;
                int gap = Math.abs(itemDist - distM);
                if (gap < bestGap) { best = item; bestGap = gap; }
            }
            if (best == null) return;
            String note = stringResult(best.getClass().getMethod("getDescription").invoke(best));
            note = note.replace('|', ',').replaceAll("\\s+", " ").trim();
            if (note.length() == 0) { announcedAlert.add(key); return; }   // nothing to read, do not ask again
            if (note.length() > 300) note = note.substring(0, 300);
            if (Region.inVietnam()) {
                String voice = I18n.voiceTag();
                if (voice != null && !"vi".equals(voice)) return;
            }
            if (WazeTtsBridge.speakNote(note)) {
                announcedAlert.add(key);
                Log.i(TAG, "missing-sign note read key=" + key + " distance=" + distM + " note=" + note);
            }
        } catch (Throwable t) {
            Log.w(TAG, "missing-sign note failed", t);
        }
    }

    /** Intercept Waze's repository immediately before it is emitted to the native alert UI. */
    public static Object patchNativeAlertRepository(Object repository) {
        try {
            return CustomNativeAlerts.patchRepository(ctx(), repository);
        } catch (Throwable error) {
            Log.w(TAG, "custom native alert patch failed", error);
            return repository;
        }
    }

    /** Swallow lifecycle callbacks belonging to synthetic WazeMod descriptors. */
    public static boolean consumeCustomNativeAlertCallback(Object alertId) {
        try {
            return CustomNativeAlerts.consumeCallback(alertId);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** The break reminder switch or duration changed: re-evaluate from the next speed frame. */
    public static void onBreakReminderSettingChanged(Context context) {
        try {
            DrivingBreakReminder.onSettingChanged(context);
        } catch (Throwable ignored) { }
    }

    /** Apply the headlight reminder setting immediately when toggled. */
    public static void onHeadlightReminderSettingChanged(Context context) {
        try {
            CustomNativeAlerts.onHeadlightSettingChanged(context);
        } catch (Throwable ignored) { }
    }

    /**
     * Show one short-lived descriptor in Waze's native alert panel. Only one WazeMod descriptor
     * is active at a time; callers should use a stable feature key and handle a false return.
     */
    public static boolean showCustomNativeAlert(String key, String title, String description,
                                                String icon, int type, int subType,
                                                int timeoutSeconds) {
        try {
            return CustomNativeAlerts.show(ctx(), key, title, description, icon,
                    type, subType, timeoutSeconds);
        } catch (Throwable error) {
            Log.w(TAG, "custom native alert show failed", error);
            return false;
        }
    }

    public static boolean dismissCustomNativeAlert(String key) {
        try {
            return CustomNativeAlerts.dismiss(key);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Apply the process-start native policy. A settings change intentionally takes effect next run. */
    private static void configureSpeedDropNativeOnce() {
        if (speedDropNativeConfigured) return;
        int mode = prefInt("speed_drop_read_mode", 1);   // 1 = always show (Waze default only when speed >= the new limit)
        int result = SegmentNative.configureSpeedDropFilter(mode == 1);
        if (result != 0) {
            speedDropNativeConfigured = true;
            Log.i(TAG, "speed-drop native mode=" + mode + " result=" + result);
        }
    }

    static void setPointAlerts(java.util.List<String> alerts) {
        synchronized (Gateway.class) {
            java.util.ArrayList<String> pointOnly = new java.util.ArrayList<String>();
            if (alerts != null) {
                for (String row : alerts) {
                    // PointNoticeRepository owns this list, so filtering here can never remove a
                    // Waze-native route descriptor which happens to use the same speeddrop icon.
                    if (hudNavigating && row != null && row.startsWith("speeddrop_")) continue;
                    pointOnly.add(row);
                }
            }
            pointHudAlerts = pointOnly;
            mergeHudAlertsLocked();
        }
    }

    /** GPS-anchored records share road_notices.pb but own a separate asynchronous snapshot. */
    static void setRoadPointAlerts(java.util.List<String> alerts) {
        synchronized (Gateway.class) {
            roadPointHudAlerts = alerts == null
                    ? new java.util.ArrayList<String>()
                    : new java.util.ArrayList<String>(alerts);
            mergeHudAlertsLocked();
        }
    }

    /** "Traffic light ahead" rows from TrafficLightAlerts (Waze native insights). */
    static void setTrafficLightAlerts(java.util.List<String> alerts) {
        synchronized (Gateway.class) {
            trafficLightHudAlerts = alerts == null
                    ? new java.util.ArrayList<String>()
                    : new java.util.ArrayList<String>(alerts);
            mergeHudAlertsLocked();
        }
    }

    private static void setNativeAlerts(java.util.List<String> alerts) {
        synchronized (Gateway.class) {
            nativeHudAlerts = alerts == null
                    ? new java.util.ArrayList<String>()
                    : new java.util.ArrayList<String>(alerts);
            mergeHudAlertsLocked();
        }
    }

    /** Publish one immutable snapshot so Waze callbacks cannot erase asynchronous point notices. */
    private static void mergeHudAlertsLocked() {
        java.util.ArrayList<String> combined = new java.util.ArrayList<String>(
                nativeHudAlerts.size() + pointHudAlerts.size() + roadPointHudAlerts.size()
                        + trafficLightHudAlerts.size() + trafficJamHudAlerts.size()
                        + schoolZoneHudAlerts.size());
        combined.addAll(nativeHudAlerts);
        combined.addAll(pointHudAlerts);
        combined.addAll(roadPointHudAlerts);
        combined.addAll(trafficLightHudAlerts);
        combined.addAll(trafficJamHudAlerts);
        combined.addAll(schoolZoneHudAlerts);
        java.util.HashMap<String, String> nearestSpeed =
                new java.util.HashMap<String, String>();
        java.util.ArrayList<String> others = new java.util.ArrayList<String>();
        for (String row : combined) {
            String[] parts = row == null ? new String[0] : row.split("\\t", -1);
            if (parts.length < 5) continue;
            String raw = parts[4] == null ? "" : parts[4].toLowerCase(java.util.Locale.US);
            if (raw.startsWith("speeddrop_")) {
                String previous = nearestSpeed.get(raw);
                if (previous == null || alertMeters(row) < alertMeters(previous)) {
                    nearestSpeed.put(raw, row);
                }
            } else {
                others.add(row);
            }
        }
        others.addAll(nearestSpeed.values());
        java.util.Collections.sort(others, new java.util.Comparator<String>() {
            @Override public int compare(String left, String right) {
                int a = alertMeters(left), b = alertMeters(right);
                if (a != b) return a < b ? -1 : 1;
                return left.compareTo(right);
            }
        });
        hudAlerts = others;
    }

    private static int alertMeters(String row) {
        try {
            String[] parts = row.split("\\t", -1);
            return parts.length >= 4 ? Integer.parseInt(parts[3]) : Integer.MAX_VALUE;
        } catch (Throwable ignored) {
            return Integer.MAX_VALUE;
        }
    }

    /** Compatibility hook for Waze 4.x, which publishes one AlerterInfo at a time instead of
     *  NativeAlertRepositoryUpdate. Keep the data format identical to onAlerts() so Bubble/HUD
     *  do not need a version-specific renderer. */
    public static void onLegacyAlert(Object info) {
        if (!modEnabled()) return;
        try {
            if (info == null) return;
            Class<?> c = info.getClass();
            int type = -1;
            try {
                Object value = c.getMethod("getTypeValue").invoke(info);
                if (value instanceof Number) type = ((Number) value).intValue();
            } catch (Throwable ignored) {
                Object value = c.getMethod("getType").invoke(info);
                if (value != null) {
                    Object number = value.getClass().getMethod("getNumber").invoke(value);
                    if (number instanceof Number) type = ((Number) number).intValue();
                }
            }
            String icon = stringResult(c.getMethod("getIconName").invoke(info));
            String title = stringResult(c.getMethod("getTitle").invoke(info));
            String distance = stringResult(c.getMethod("getDistanceString").invoke(info));
            int meters = parseDistM(distance);
            if (icon.isEmpty() || meters < 0) return;

            String resolved = resolveIcon(type, icon);
            java.util.ArrayList<String> out = new java.util.ArrayList<String>(1);
            out.add(resolved + "\t" + title + "\t" + fmtDist(meters) + "\t" + meters + "\t" + icon);
            setNativeAlerts(out);

            final String key = type + ":" + icon + ":" + title;
            final int timeout;
            try {
                Object value = c.getMethod("getTimeoutSeconds").invoke(info);
                timeout = value instanceof Number ? Math.max(3, ((Number) value).intValue()) : 15;
            } catch (Throwable ignored) {
                clearLegacyAlertLater(key, 15);
                return;
            }
            clearLegacyAlertLater(key, timeout);
        } catch (Throwable t) { /* old builds differ; fail closed */ }
    }

    private static volatile String legacyAlertKey = "";

    private static void clearLegacyAlertLater(final String key, int timeoutSeconds) {
        legacyAlertKey = key;
        try {
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override public void run() {
                    if (key.equals(legacyAlertKey)) {
                        setNativeAlerts(new java.util.ArrayList<String>());
                        legacyAlertKey = "";
                    }
                }
            }, Math.min(60, Math.max(3, timeoutSeconds)) * 1000L);
        } catch (Throwable t) { }
    }

    /** Hook: onCurrentInstructionChanged(int) — the immediate maneuver (Instruction$Type ordinal; see TurnView). */
    public static void onNavTurn(int type) {
        if (!modEnabled()) return;
        hudTurn = type;
        warnIfSpeedStale();
    }

    private static long lastStaleSpeedLogAt;

    /**
     * Navigation hooks still fire but the speedometer hook has gone quiet: HUD Link and the Data API
     * would show a frozen speed and limit. Leave one line in the log (at most a minute apart) so a
     * field report can tell this apart from a dead HUD connection.
     */
    private static void warnIfSpeedStale() {
        if (!hudNavigating) return;
        long age = hudSpeedAgeMs();
        if (age < 15_000L) return;
        long now = SystemClock.elapsedRealtime();
        if (now - lastStaleSpeedLogAt < 60_000L) return;
        lastStaleSpeedLogAt = now;
        Log.w(TAG, "navigating but no speed callback for "
                + (age == Long.MAX_VALUE ? "ever" : (age / 1000L) + " s")
                + " (hudSpeed=" + hudSpeed + ", limit=" + hudLimit + ")");
    }

    /** Hook: onNextInstructionChanged(int) — the maneuver after the immediate one. */
    public static void onNavTurnNext(int type) { if (modEnabled()) hudTurnNext = type; }

    /** Hook: onExitNumberChanged(int) — roundabout exit number for the current maneuver. */
    public static void onExitNumber(int n) { if (modEnabled()) hudExit = n; }

    /**
     * Hook: NavigationInfoNativeManager.onLanesGuidanceChanged().
     *
     * The protobuf classes differ between Waze generations, so this intentionally reflects only
     * the stable public accessors instead of linking Gateway against a Waze dex class. Lane index
     * ordering matches Waze's own LaneGuidanceView conversion.
     */
    public static void onLanes(Object laneList) {
        if (!modEnabled()) return;
        if (laneList == null) {
            clearLanes();
            return;
        }
        try {
            Object raw = reflectNoArg(laneList, "getNavigationLaneList");
            if (!(raw instanceof java.util.List)) {
                clearLanes();
                return;
            }
            java.util.ArrayList<LaneRow> rows = new java.util.ArrayList<LaneRow>();
            for (Object lane : (java.util.List<?>) raw) {
                if (lane == null || rows.size() >= 12) break;
                Object indexValue = reflectNoArg(lane, "getIndex");
                Object rawAngles = reflectNoArg(lane, "getAngleList");
                if (!(indexValue instanceof Number) || !(rawAngles instanceof java.util.List)) continue;

                java.util.List<?> sourceAngles = (java.util.List<?>) rawAngles;
                int count = Math.min(4, sourceAngles.size());
                int[] angles = new int[count];
                boolean[] selected = new boolean[count];
                int used = 0;
                for (int i = 0; i < sourceAngles.size() && used < count; i++) {
                    Object angle = sourceAngles.get(i);
                    Object degrees = reflectNoArg(angle, "getAngle");
                    if (!(degrees instanceof Number)) continue;
                    int value = ((Number) degrees).intValue();
                    while (value > 180) value -= 360;
                    while (value < -180) value += 360;
                    angles[used] = value;
                    selected[used] = Boolean.TRUE.equals(reflectNoArg(angle, "getIsSelected"));
                    used++;
                }
                if (used == 0) continue;
                if (used != count) {
                    angles = java.util.Arrays.copyOf(angles, used);
                    selected = java.util.Arrays.copyOf(selected, used);
                }
                rows.add(new LaneRow(((Number) indexValue).intValue(), angles, selected));
            }
            if (rows.isEmpty()) {
                clearLanes();
                return;
            }
            java.util.Collections.sort(rows, new java.util.Comparator<LaneRow>() {
                @Override public int compare(LaneRow a, LaneRow b) {
                    return Integer.compare(a.index, b.index);
                }
            });

            int[][] angles = new int[rows.size()][];
            boolean[][] selected = new boolean[rows.size()][];
            StringBuilder sig = new StringBuilder();
            for (int i = 0; i < rows.size(); i++) {
                LaneRow row = rows.get(i);
                angles[i] = row.angles;
                selected[i] = row.selected;
                if (i > 0) sig.append('|');
                sig.append(row.index).append(':');
                for (int j = 0; j < row.angles.length; j++) {
                    if (j > 0) sig.append(',');
                    sig.append(row.angles[j]).append(row.selected[j] ? '*' : '-');
                }
            }
            LaneSnapshot next = new LaneSnapshot(angles, selected, sig.toString());
            String previous = hudLanes.signature();
            hudLanes = next;
            if (!next.signature().equals(previous)) {
                Log.i(TAG, "lane guidance " + next.signature());
            }
        } catch (Throwable t) {
            clearLanes();
            Log.w(TAG, "Unable to decode lane guidance", t);
        }
    }

    private static void clearLanes() {
        if (hudLanes.size() != 0) Log.i(TAG, "lane guidance cleared");
        hudLanes = LaneSnapshot.EMPTY;
    }

    private static volatile String vehType = "";
    private static long vehCheckedMs = -100000;
    private static volatile boolean motorcycleArrowAssetsReady;

    /** Cap the speed limit at the VN motorcycle max (70). Called from the speedometer smali hook BEFORE Waze's
     *  own code runs, so both the mod display AND Waze's native speed-limit sign show the capped value. */
     public static int capLimit(int limit) {
         try {
             if (!modEnabled()) return limit;
             // The 70 km/h motorcycle cap is Vietnamese law: off outside Vietnam.
             if (!Region.inVietnam() || !pref("moto_cap", true) || !isMotorcycle())
                 return limit;

             if (limit > 80)
                 return 70;

             if (limit > 70 && limit <= 80)
                 return 60;

             return limit;
         } catch (Throwable ignored) {
             return limit;
         }
     }

    /** True if Waze's selected vehicle type is MOTORCYCLE. Cached; re-read every ~5s so a live switch is picked up. */
    static boolean isMotorcycle() {
        long now = SystemClock.elapsedRealtime();
        if (now - vehCheckedMs > 5000) {
            vehCheckedMs = now;
            String resolved = cfgString("CONFIG_VALUE_ROUTING_VEHICLE_TYPE_CHOICE");
            if (resolved == null || resolved.trim().isEmpty()) {
                resolved = cfgString("CONFIG_VALUE_TRIP_OVERVIEW_LAST_NAVIGATED_VEHICLE_TYPE");
            }
            if (resolved == null || resolved.trim().isEmpty()) {
                // Waze <= 5.20 compatibility.
                resolved = cfgString("CONFIG_VALUE_CAR_TYPE_PERMANENT_CAR_TYPE");
            }
            resolved = resolved == null ? "" : resolved.trim();
            if (!resolved.equals(vehType)) {
                vehType = resolved;
                Log.i(TAG, "vehicle type -> [" + vehType + "]");
            }
        }
        String normalized = vehType == null ? ""
                : vehType.trim().toUpperCase(java.util.Locale.US);
        return "MOTORCYCLE".equals(normalized)
                || "VEHICLE_TYPE_MOTORCYCLE".equals(normalized)
                || normalized.endsWith("_MOTORCYCLE");
    }

    /**
     * Waze extracts built-in map-car resources into its private data directory and can keep that cache
     * across APK upgrades. Refresh the motorcycle pair before the car repository loads so motorcycle
     * routing keeps working while the on-map model becomes Waze's normal Arrow.
     */
    public static void ensureMotorcycleArrowAssets() {
        if (motorcycleArrowAssetsReady) return;
        synchronized (Gateway.class) {
            if (motorcycleArrowAssetsReady) return;
            Context c = ctx();
            if (c == null) return;
            try {
                java.io.File dataRoot = c.getFilesDir().getParentFile();
                if (dataRoot == null) return;
                java.io.File cars = new java.io.File(dataRoot, "waze/skins/default/cars");
                if (!cars.isDirectory() && !cars.mkdirs()) return;
                // The MOTORCYCLE renderer makes the full-size Arrow visually oversized. Package a
                // 45% Arrow as motorbike_model.obj and refresh that exact asset into Waze's cache.
                // The regular car Arrow remains untouched at its original scale.
                copyAssetAtomically(c, "res/skins/default/cars/motorbike_model.obj",
                        new java.io.File(cars, "motorbike_model.obj"));
                // Red Arrow texture so the motorcycle is distinguishable from the car Arrow.
                copyAssetAtomically(c, "res/skins/default/cars/motorbike_texture_red.png",
                        new java.io.File(cars, "motorbike_texture.png"));
                motorcycleArrowAssetsReady = true;
                Log.i(TAG, "Motorcycle map-car assets set to scaled Arrow");
            } catch (Throwable t) {
                Log.w(TAG, "Unable to refresh motorcycle map-car assets", t);
            }
        }
    }

    private static void copyAssetAtomically(Context c, String assetPath, java.io.File destination)
            throws java.io.IOException {
        java.io.File temporary = new java.io.File(destination.getPath() + ".wzmod.tmp");
        try (java.io.InputStream in = c.getAssets().open(assetPath);
             java.io.FileOutputStream out = new java.io.FileOutputStream(temporary, false)) {
            byte[] buffer = new byte[16384];
            int read;
            while ((read = in.read(buffer)) >= 0) {
                if (read > 0) out.write(buffer, 0, read);
            }
            out.flush();
        }
        if (destination.exists() && !destination.delete()) {
            temporary.delete();
            throw new java.io.IOException("Cannot replace " + destination);
        }
        if (!temporary.renameTo(destination)) {
            temporary.delete();
            throw new java.io.IOException("Cannot install " + destination);
        }
    }

    /** Read a Waze string config by its ConfigValues field name (reflection; version-agnostic, no-op on failure). */
    static String cfgString(String fieldName) {
        try {
            Object cm = Class.forName("com.waze.ConfigManager").getMethod("getInstance").invoke(null);
            Object key = Class.forName("com.waze.config.ConfigValues").getField(fieldName).get(null);
            if (cm == null || key == null) return "";
            for (java.lang.reflect.Method m : cm.getClass().getMethods()) {
                if (m.getName().equals("getConfigValueString") && m.getParameterTypes().length == 1) {
                    Object r = m.invoke(cm, key);
                    return r != null ? r.toString() : "";
                }
            }
        } catch (Throwable t) { }
        return "";
    }

    // ---- Floating map (smali hooks in MainActivity and the map view call these) ----
    public static void floatOnPause(android.app.Activity a) { try { FloatMap.onPause(a); } catch (Throwable ignored) { } }
    public static void floatOnStop(android.app.Activity a) { try { FloatMap.onStop(a); } catch (Throwable ignored) { } }
    public static void floatOnResume(android.app.Activity a) { try { FloatMap.onResume(a); } catch (Throwable ignored) { } }
    public static void floatOnDestroy(android.app.Activity a) { try { FloatMap.onDestroy(a); } catch (Throwable ignored) { } }
    /** True while the live map view lives in the floating window: the map must not pause itself then. */
    public static boolean floatMapHolding() { try { return FloatMap.holding(); } catch (Throwable t) { return false; } }

    /** Hook: onNavigationStateChanged(isNavigating,...) — when navigation STOPS, clear all nav display
     *  fields so the HUD stops showing a stale next-turn arrow / ETA after you exit guidance. */
    public static void onNavState(boolean navigating) {
        if (!modEnabled()) return;
        boolean started = navigating && !hudNavigating;
        boolean stopped = !navigating && hudNavigating;
        hudNavigating = navigating;
        if (navigating) {
            // A HUD Link paused for being idle gets another chance when a drive starts.
            if (started) HudLink.resume(ctx());
            cancelArrivalClose();   // a new drive: Waze stays open
            refreshGoogleMapsButton();
            return;                 // starting/updating -> the callbacks refill the fields
        }
        if (stopped) scheduleArrivalClose(hudEtaDistM);   // before the ETA fields are cleared below
        clearGoogleMapsDestination();
        refreshGoogleMapsButton();
        // A speed warning seen during the previous trip must be eligible again when guidance starts.
        announcedAlert.clear();
        speedDropRetryAt.clear();
        hudTurn = -1;
        hudTurnNext = -1;
        hudExit = -1;
        hudTurnDist = -1;
        hudStreet = "";
        clearLanes();
        hudEtaMin = -1;
        hudEtaClock = "";
        hudEtaTimeStr = "";
        hudEtaDistM = -1;
        clearRoadSegmentState();
        speedDropRouteUuid = "";
        clearSpeedDropRouteState();
        onAvgSpeedZoneClear();                   // also drop any "cấm vượt" zone state
    }

    // ---- Close Waze after arriving ("close_after_arrival") ----

    /**
     * Guidance that ends with at most this much route left counts as "arrived". Waze was seen ending guidance with
     * 90 m left in the last distance update, so this leaves margin above that.
     */
    private static final int ARRIVAL_RADIUS_M = 150;
    private static final android.os.Handler arrivalCloseHandler =
            new android.os.Handler(android.os.Looper.getMainLooper());
    private static final Runnable arrivalCloseTask = new Runnable() {
        @Override public void run() { closeAfterArrival(); }
    };

    /** Guidance just ended with {@code remainingM} of route left (-1 = unknown): arrived, so close Waze after the delay. */
    private static void scheduleArrivalClose(int remainingM) {
        try {
            if (!pref("close_after_arrival", false)) return;
            if (remainingM < 0 || remainingM > ARRIVAL_RADIUS_M) {
                Log.i(TAG, "Guidance ended " + remainingM + " m from the destination (last maneuver " + hudTurn
                        + "): not an arrival, Waze stays open");
                return;
            }
            int seconds = Math.max(5, prefInt("close_after_arrival_seconds", 30));
            arrivalCloseHandler.removeCallbacks(arrivalCloseTask);
            arrivalCloseHandler.postDelayed(arrivalCloseTask, seconds * 1000L);
            Log.i(TAG, "Arrived (" + remainingM + " m left): closing Waze in " + seconds + " s");
        } catch (Throwable t) {
            Log.w(TAG, "scheduleArrivalClose failed", t);
        }
    }

    private static void cancelArrivalClose() {
        arrivalCloseHandler.removeCallbacks(arrivalCloseTask);
    }

    /** The delay is over: close Waze the way the menu's "Shut down" does, unless something changed meanwhile. */
    private static void closeAfterArrival() {
        try {
            if (!modEnabled() || !pref("close_after_arrival", false) || hudNavigating) return;
            if (AaSpeedo.isSurfaceActive()) {   // Android Auto still shows Waze: leave the car screen alone
                Log.i(TAG, "Arrival close skipped: Android Auto is showing Waze");
                return;
            }
            Log.i(TAG, "Closing Waze after arrival");
            requestExplicitShutdown();
            final int pid = android.os.Process.myPid();
            arrivalCloseHandler.postDelayed(new Runnable() {
                @Override public void run() { android.os.Process.killProcess(pid); }
            }, 3000L);   // shutDown() ends the native side; make sure the process goes too
            Class<?> type = Class.forName("com.waze.NativeManager");
            type.getMethod("shutDown").invoke(type.getMethod("getInstance").invoke(null));
        } catch (Throwable t) {
            Log.e(TAG, "Closing Waze after arrival failed", t);
        }
    }

    /** Hook: onNavigationRouteChanged(route). A held speed-drop belongs to the route which produced it;
     *  never carry that warning into a reroute. The UUID comparison avoids clearing on duplicate updates
     *  for the same route. If this Waze build supplies no UUID, clearing is the safe fallback. */
    public static void onNavRoute(Object route) {
        if (!modEnabled()) return;
        captureGoogleMapsDestination(route);
        refreshGoogleMapsButton();
        try {
            String next = "";
            if (route != null) {
                Object value = route.getClass().getMethod("getRouteUUID").invoke(route);
                if (value != null) next = value.toString();
            }
            String previous = speedDropRouteUuid;
            speedDropRouteUuid = next;
            activateRawRoute(route);
            if (next.isEmpty() || previous.isEmpty() || !next.equals(previous)) {
                // On a real reroute, wait for the new maneuver callback instead of publishing
                // stale st2. Do not clear the first route here: its one-shot street callback can
                // legitimately arrive just before the route callback on some Waze builds.
                if (next.isEmpty() || (!previous.isEmpty() && !next.equals(previous)))
                    hudStreet = "";
                clearSpeedDropRouteState();
                RoadRulesRepository.onTripReset();
                PointNoticeRepository.onTripReset();
                Log.i(TAG, "speed-drop route reset " + previous + " -> " + next);
            }
        } catch (Throwable t) {
            speedDropRouteUuid = "";
            hudStreet = "";
            clearSpeedDropRouteState();
        }
    }

    /** Keep only the final route waypoint; intermediate stops must not become the Maps destination. */
    private static void captureGoogleMapsDestination(Object route) {
        if (route == null) {
            clearGoogleMapsDestination();
            return;
        }
        try {
            Object coordinate = null;
            String source = "waypoint";
            Object countValue = route.getClass().getMethod("getWaypointsCount").invoke(route);
            if (!(countValue instanceof Number)) throw new IllegalStateException("waypoint count");
            int count = ((Number) countValue).intValue();
            if (count > 0) {
                Object waypoint = route.getClass().getMethod("getWaypoints", int.class)
                        .invoke(route, count - 1);
                coordinate = waypoint == null ? null
                        : waypoint.getClass().getMethod("getCoordinate").invoke(waypoint);
            }
            // Online NavigationRoute commonly omits waypoints entirely. Its rendered route
            // geometry still ends at the exact destination, so use the final polyline point.
            if (coordinate == null) {
                source = "geometry";
                Object geometry = route.getClass().getMethod("getGeometry").invoke(route);
                Object positionCount = geometry == null ? null
                        : geometry.getClass().getMethod("getPositionCount").invoke(geometry);
                int positions = positionCount instanceof Number
                        ? ((Number) positionCount).intValue() : 0;
                if (positions > 0) coordinate = geometry.getClass()
                        .getMethod("getPosition", int.class).invoke(geometry, positions - 1);
            }
            if (coordinate == null) throw new IllegalStateException("no destination coordinate");
            Object latValue = coordinate.getClass().getMethod("getLatitude").invoke(coordinate);
            Object lonValue = coordinate.getClass().getMethod("getLongitude").invoke(coordinate);
            if (!(latValue instanceof Number) || !(lonValue instanceof Number))
                throw new IllegalStateException("invalid destination coordinate");
            int lat = ((Number) latValue).intValue();
            int lon = ((Number) lonValue).intValue();
            if (lat < -90000000 || lat > 90000000 || lon < -180000000 || lon > 180000000
                    || (lat == 0 && lon == 0)) throw new IllegalStateException("destination out of range");
            googleMapsDestinationLatE6 = lat;
            googleMapsDestinationLonE6 = lon;
            Log.i(TAG, "Google Maps destination captured source=" + source
                    + " latE6=" + lat + " lonE6=" + lon);
        } catch (Throwable error) {
            clearGoogleMapsDestination();
            // Routes being cancelled/recalculated briefly carry no destination; not an error.
            Log.i(TAG, "Google Maps destination unavailable: " + error.getMessage());
        }
    }

    private static void clearGoogleMapsDestination() {
        googleMapsDestinationLatE6 = Integer.MIN_VALUE;
        googleMapsDestinationLonE6 = Integer.MIN_VALUE;
    }

    /** Older Waze builds expose only RouteGeometry, not NavigationRoute/routeUUID. Its protobuf hash is
     *  content-based, so it is a stable fallback fingerprint and changes when a reroute replaces geometry. */
    public static void onNavRouteGeometry(Object geometry) {
        if (!modEnabled()) return;
        String next = geometry == null ? "" : geometry.getClass().getName() + ":" + geometry.hashCode();
        String previous = speedDropRouteUuid;
        speedDropRouteUuid = next;
        if (next.isEmpty() || previous.isEmpty() || !next.equals(previous)) {
            if (next.isEmpty() || (!previous.isEmpty() && !next.equals(previous)))
                hudStreet = "";
            clearSpeedDropRouteState();
            RoadRulesRepository.onTripReset();
            PointNoticeRepository.onTripReset();
            Log.i(TAG, "speed-drop geometry reset " + previous + " -> " + next);
        }
    }

    /** Hook: onRoutingDestinationClear(). */
    public static void onNavRouteCleared() {
        if (!modEnabled()) return;
        hudNavigating = false;
        clearGoogleMapsDestination();
        refreshGoogleMapsButton();
        announcedAlert.clear();
        speedDropRetryAt.clear();
        speedDropRouteUuid = "";
        hudStreet = "";
        clearSpeedDropRouteState();
        RoadRulesRepository.onTripReset();
        PointNoticeRepository.onTripReset();
        clearLanes();
        clearRoadSegmentState();
    }

    /** Raw routing itinerary data retained by Waze before it is converted to NavigationRoute.
     *  Its RouteSegment entries contain the server segment id which the public route omits. */
    private static final class RawRouteSegments {
        final long[] serverIds;
        final long[] fromNodeIds;
        final int[] tileIds;
        final int[] clientIds;

        RawRouteSegments(int count) {
            serverIds = new long[count];
            fromNodeIds = new long[count];
            tileIds = new int[count];
            clientIds = new int[count];
            java.util.Arrays.fill(serverIds, -1L);
            java.util.Arrays.fill(fromNodeIds, -1L);
            java.util.Arrays.fill(tileIds, -1);
            java.util.Arrays.fill(clientIds, -1);
        }
    }

    private static final java.util.LinkedHashMap<String, RawRouteSegments> rawRoutes =
            new java.util.LinkedHashMap<String, RawRouteSegments>(8, 0.75f, true) {
                @Override protected boolean removeEldestEntry(
                        java.util.Map.Entry<String, RawRouteSegments> eldest) {
                    return size() > 12;
                }
            };
    private static volatile RawRouteSegments activeRawRoute;
    private static volatile String activeRawRouteKey = "";

    /** Hook: com.waze.modules.c.eb.h(rawRoute,...). Cache server ids for every route alternative. */
    public static void onRawRoute(Object route) {
        if (!modEnabled()) return;
        try {
            if (route == null) return;
            Class<?> rc = route.getClass();
            String uuid = stringResult(rc.getMethod("getAlternativeRouteUuid").invoke(route));
            long altId = numberResult(rc.getMethod("getAltId").invoke(route), -1L);
            int count = (int) numberResult(rc.getMethod("getRouteSegmentCount").invoke(route), 0L);
            if (count <= 0) return;

            java.lang.reflect.Method getSegment = rc.getMethod("getRouteSegment", int.class);
            RawRouteSegments table = new RawRouteSegments(count);
            for (int i = 0; i < count; i++) {
                Object segment = getSegment.invoke(route, i);
                if (segment == null) continue;
                Class<?> sc = segment.getClass();
                long serverId = numberResult(sc.getMethod("getServerSegmentId").invoke(segment), -1L);
                // The protobuf field is uint32 even though its Java accessor returns int.
                if (serverId < 0) serverId &= 0xFFFFFFFFL;
                long fromNode = numberResult(sc.getMethod("getFromNode").invoke(segment), -1L);
                if (fromNode < 0) fromNode &= 0xFFFFFFFFL;
                table.serverIds[i] = serverId > 0 ? serverId : -1L;
                table.fromNodeIds[i] = fromNode > 0 ? fromNode : -1L;
                table.tileIds[i] = (int) numberResult(sc.getMethod("getTileId").invoke(segment), -1L);
                table.clientIds[i] = (int) numberResult(sc.getMethod("getClientId").invoke(segment), -1L);
            }

            int nodeMatchedIdx = findRouteIndexByNodePair(table, hudSegmentId);
            boolean activated = false;
            synchronized (rawRoutes) {
                if (!uuid.isEmpty()) rawRoutes.put("uuid:" + uuid, table);
                if (altId >= 0) rawRoutes.put("alt:" + altId, table);
                if ((!uuid.isEmpty() && activeRawRouteKey.equals("uuid:" + uuid))
                        || (altId >= 0 && activeRawRouteKey.equals("alt:" + altId))
                        || nodeMatchedIdx >= 0) {
                    activeRawRoute = table;
                    if (nodeMatchedIdx >= 0) {
                        activeRawRouteKey = !uuid.isEmpty() ? "uuid:" + uuid : "alt:" + altId;
                    }
                    activated = true;
                }
            }
            Log.i(TAG, "raw route segments=" + count + " uuid=" + uuid + " alt=" + altId);
            // Raw itinerary and NavigationRoute callbacks can arrive in either order.
            // Re-apply the last known segment index as soon as the matching table appears.
            if (activated) {
                int idx = nodeMatchedIdx >= 0 ? nodeMatchedIdx : hudRouteSegmentIdx;
                if (nodeMatchedIdx >= 0) {
                    Log.i(TAG, "raw route node-pair match idx=" + nodeMatchedIdx);
                }
                updateRoadSegmentFromTable(table, idx);
            }
        } catch (Throwable t) {
            Log.w(TAG, "raw route segment ids unavailable: " + t.getClass().getSimpleName());
        }
    }

    private static void activateRawRoute(Object route) {
        RawRouteSegments selected = null;
        String selectedKey = "";
        try {
            Class<?> rc = route == null ? null : route.getClass();
            if (rc != null) {
                String uuid = stringResult(rc.getMethod("getRouteUUID").invoke(route));
                long altId = numberResult(rc.getMethod("getAltId").invoke(route), -1L);
                synchronized (rawRoutes) {
                    if (!uuid.isEmpty()) {
                        selectedKey = "uuid:" + uuid;
                        selected = rawRoutes.get(selectedKey);
                    }
                    if (selected == null && altId >= 0) {
                        String altKey = "alt:" + altId;
                        selected = rawRoutes.get(altKey);
                        // Preserve the UUID key while waiting for a late raw-route callback.
                        // Use the alternative key only when it actually matched, or no UUID exists.
                        if (selected != null || selectedKey.isEmpty()) selectedKey = altKey;
                    }
                }
            }
        } catch (Throwable t) { /* route versions differ; leave unmatched */ }
        activeRawRouteKey = selectedKey;
        activeRawRoute = selected;
        setRoadSegmentState(-1L, -1, -1, -1, "route-activate");
        Log.i(TAG, "active raw route " + selectedKey + " matched=" + (selected != null));
    }

    /** Hook: onStreetNameChanged(CurrentStreetNameUpdate). segmentIdx indexes the raw itinerary. */
    public static void onCurrentStreetUpdate(Object update) {
        // Despite the proto name, this is the street attached to Waze's CURRENT maneuver -- the
        // pink road label shown under the immediate turn arrow. It drives hudStreet/st2 only;
        // hudCurStreet/st is owned exclusively by the map matcher. NextStreetNameUpdate belongs
        // to the secondary "then" maneuver and must not drive hudStreet.
        onNavStreet(update);
        if (!modEnabled()) return;
        try {
            if (update == null) return;
            Class<?> uc = update.getClass();
            int idx = (int) numberResult(uc.getMethod("getSegmentIdx").invoke(update), -1L);
            updateRoadSegmentFromTable(activeRawRoute, idx);
        } catch (Throwable t) {
            setRoadSegmentState(-1L, -1, -1, -1, "street-update-error");
        }
    }

    private static void updateRoadSegmentFromTable(RawRouteSegments table, int idx) {
        long nextId = -1L;
        int tileId = -1, clientId = -1;
        if (table != null && idx >= 0 && idx < table.serverIds.length) {
            nextId = table.serverIds[idx];
            tileId = table.tileIds[idx];
            clientId = table.clientIds[idx];
        }
        setRoadSegmentState(nextId, idx, tileId, clientId, "route");
    }

    /**
     * Centrally publishes the current road identity and emits the road-rules callback exactly once
     * when the real server/WME segment id changes. The callback itself is non-blocking; disk and
     * future network work are owned by RoadRulesRepository's worker.
     */
    private static void setRoadSegmentState(long nextId, int routeIndex, int tileId,
                                            int clientId, String source) {
        long previous = hudRoadSegmentId;
        hudRouteSegmentIdx = routeIndex;
        hudRoadSegmentId = nextId;
        hudSegmentTileId = tileId;
        hudSegmentClientId = clientId;
        if (nextId == previous) return;

        Log.i(TAG, "road segment " + previous + " -> " + nextId + " source=" + source
                + " idx=" + routeIndex + " tile=" + tileId + " client=" + clientId);
        if (nextId > 0) {
            RoadRulesRepository.onSegmentChanged(ctx(),
                    new RoadRulesRepository.SegmentSnapshot(nextId, hudSegmentId,
                            routeIndex, tileId, clientId, hudCurStreet, source));
        } else if (previous > 0) {
            RoadRulesRepository.onSegmentCleared(previous);
        }
    }

    /** Find the current map-matched edge inside a raw route. Each entry stores its from-node;
     *  the following entry's from-node is the current entry's to-node in traversal order. */
    private static int findRouteIndexByNodePair(RawRouteSegments table, long nodePair) {
        if (table == null || nodePair == -1L || table.fromNodeIds.length < 2) return -1;
        long from = nodePair >>> 32;
        long to = nodePair & 0xFFFFFFFFL;
        for (int i = 0; i + 1 < table.fromNodeIds.length; i++) {
            if (table.fromNodeIds[i] == from && table.fromNodeIds[i + 1] == to) return i;
        }
        return -1;
    }

    private static void clearRoadSegmentState() {
        activeRawRoute = null;
        activeRawRouteKey = "";
        setRoadSegmentState(-1L, -1, -1, -1, "clear");
    }

    private static String stringResult(Object value) {
        return value == null ? "" : value.toString();
    }

    private static long numberResult(Object value, long fallback) {
        return value instanceof Number ? ((Number) value).longValue() : fallback;
    }

    /** Hook: onAverageSpeedCamZoneUpdate — fired repeatedly while INSIDE an average-speed ("cấm vượt") zone. */
    public static synchronized void onAvgSpeedZone(int leftM, int recSpeed, int percent) {
        // The zone is shown as the Vietnamese no-passing sign, so it is only tracked in Vietnam.
        if (!modEnabled() || !Region.inVietnam()) return;
        avgZoneFromNavigation = true;
        avgZone = true;
        avgLeftM = leftM;
        avgRecSpeed = recSpeed;
        avgPercent = percent;
    }

    /** Hook: onAverageSpeedCamZoneClear — fired the moment you leave the zone (hết cấm vượt). */
    public static synchronized void onAvgSpeedZoneClear() {
        if (!modEnabled()) return;
        avgZoneFromNavigation = false;
        avgZone = avgZoneFromAlerts;
        avgLeftM = avgZoneFromAlerts ? avgAlertLeftM : -1;
        avgRecSpeed = -1;
        avgPercent = -1;
    }

    /** Mirrors Waze's active average-camera alert in free-drive, where the navigation callback is absent. */
    private static synchronized void setAverageZoneFromAlerts(boolean active, int leftM) {
        if (!Region.inVietnam()) active = false;   // see onAvgSpeedZone
        avgZoneFromAlerts = active;
        avgAlertLeftM = active ? leftM : -1;
        if (!avgZoneFromNavigation) {
            avgZone = active;
            avgLeftM = active ? leftM : -1;
            avgRecSpeed = -1;
            avgPercent = -1;
        }
    }

    /** Hook: onEtaMinutesChanged(value, unit, minutes) — remaining travel time. */
    public static void onEtaTime(String value, String unit, int minutes) {
        if (!modEnabled()) return;
        hudEtaTimeStr = value != null ? value : "";
        hudEtaMin = minutes;
    }

    /** Hook: onTimeStringChanged(String) — arrival time-of-day (e.g. "ETA 1:32"). */
    public static void onEtaClock(String s) {
        if (!modEnabled()) return;
        hudEtaClock = s != null ? s : "";
    }

    /** Hook: onEtaDistanceChanged(DistanceUpdate) — remaining distance to destination. */
    public static void onEtaDist(Object d) {
        if (!modEnabled()) return;
        try {
            if (d == null) return;
            Object meters = d.getClass().getMethod("getRawMeters").invoke(d);
            if (meters instanceof Number) hudEtaDistM = ((Number) meters).intValue();
        } catch (Throwable t) { /* ignore */ }
    }

    /** Hook: onCurrentInstructionDistanceChanged(DistanceUpdate) — meters to the next maneuver. */
    public static void onNavDist(Object dist) {
        if (!modEnabled()) return;
        try {
            if (dist == null) return;
            Object m = dist.getClass().getMethod("getRawMeters").invoke(dist);
            if (m instanceof Number) hudTurnDist = ((Number) m).intValue();
        } catch (Throwable t) { /* ignore */ }
    }

    /** Extract the street/road-sign label attached to a navigation maneuver update. */
    public static void onNavStreet(Object upd) {
        if (upd == null) { onNavStreetStr(""); return; }
        String street = navPayloadText(upd, "getStreetName");
        String signText = "";
        String primary = "";
        String secondary = "";
        try {
            Object roadSign = null;
            Object has = upd.getClass().getMethod("hasRoadSign").invoke(upd);
            if (Boolean.TRUE.equals(has)) {
                roadSign = upd.getClass().getMethod("getRoadSign").invoke(upd);
            }
            if (roadSign != null) {
                signText = navPayloadText(roadSign, "getTextRepresentation");
                primary = navPayloadText(roadSign, "getPrimaryMarkup");
                secondary = navPayloadText(roadSign, "getSecondaryMarkup");
            }
        } catch (Throwable ignored) { }

        // The visible banner is sometimes carried by NavigationRoadSign instead of streetName,
        // especially around road shields and motorway transitions.
        // Some localized payloads use streetName only as connective copy (for example
        // Vietnamese "sau đó") while the actual visible destination is carried by
        // NavigationRoadSign. Never let that connective replace the road label.
        String resolved = isNavConnector(street)
                ? firstNavLabel(signText, secondary, primary)
                : firstNavLabel(street, signText, secondary, primary);
        if (street.length() > 0 || signText.length() > 0
                || primary.length() > 0 || secondary.length() > 0) {
            Log.i(TAG, "maneuver street payload street=[" + street + "] sign=[" + signText
                    + "] primary=[" + primary + "] secondary=[" + secondary
                    + "] resolved=[" + resolved + "]");
        }
        onNavStreetStr(resolved);
    }

    private static volatile long navStreetRefreshAt;
    private static java.lang.reflect.Field navManagerCurrentStreet;

    /** Recover the cached current-maneuver label when HUD opens after the one-shot callback. */
    public static void refreshNavStreetFromManager() {
        if (hudStreet != null && hudStreet.trim().length() > 0) return;
        long now = android.os.SystemClock.elapsedRealtime();
        if (now - navStreetRefreshAt < 1000L) return;
        navStreetRefreshAt = now;
        try {
            // 5.24 cached the update in NavigationInfoNativeManager.currentStreetNameUpdate; 5.27 moved turn
            // guidance to NavigationTurnGuidanceNativeManager (a DI singleton) and renamed the field.
            java.lang.reflect.Field field = navManagerCurrentStreet;
            if (field == null) {
                for (String name : new String[]{"com.waze.navigate.NavigationTurnGuidanceNativeManager",
                        "com.waze.navigate.NavigationInfoNativeManager"}) {
                    Class<?> managerClass = Class.forName(name);
                    for (java.lang.reflect.Field candidate : managerClass.getDeclaredFields()) {
                        if (candidate.getType().getName()
                                .equals("com.waze.jni.protos.navigate.CurrentStreetNameUpdate")) {
                            field = candidate;
                            break;
                        }
                    }
                    if (field != null) break;
                }
                if (field == null) return;
                field.setAccessible(true);
                navManagerCurrentStreet = field;
            }
            Object manager = WazeKoin.singleton(field.getDeclaringClass().getName());
            if (manager == null) return;
            Object update = field.get(manager);
            if (update != null) onNavStreet(update);
        } catch (Throwable ignored) { }
    }

    private static String navPayloadText(Object target, String method) {
        if (target == null) return "";
        try {
            Object value = target.getClass().getMethod(method).invoke(target);
            return value == null ? "" : value.toString().trim();
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String firstNavLabel(String... values) {
        if (values == null) return "";
        for (String value : values) {
            if (value == null) continue;
            String cleaned = value.replaceAll("<[^>]*>", " ")
                    .replace("&amp;", "&")
                    .replace("&lt;", "<")
                    .replace("&gt;", ">")
                    .replaceAll("\\s+", " ").trim();
            if (cleaned.length() > 0) return cleaned;
        }
        return "";
    }

    private static boolean isNavConnector(String value) {
        if (value == null) return true;
        String normalized = value.trim().toLowerCase(java.util.Locale.ROOT)
                .replaceAll("[\\p{Punct}\\s]+", " ").trim();
        return normalized.length() == 0
                || I18n.tr("core.then").equals(normalized)
                || "sau do".equals(normalized)
                || I18n.tr("core.next").equals(normalized)
                || "then".equals(normalized)
                || "next".equals(normalized);
    }

    /** Hook (4.x): onNextNameChanged(String name, boolean, int) — name passed directly. */
    public static void onNavStreetStr(String name) {
        // This callback can arrive once during Waze bootstrap, before RuntimeState
        // enables the mod. Cache it unconditionally so HUD does not lose the name.
        String next = name != null ? name.trim() : "";
        if (!next.equals(hudStreet)) Log.i(TAG, "next street=[" + next + "]");
        hudStreet = next;
    }

    // cached reflection for the map-matched current-street path (onPosition fires often -> avoid re-lookup)
    private static java.lang.reflect.Method mMatcher, mHasStreet, mGetStreet, mGetFromNode, mGetToNode;
    private static java.lang.reflect.Method mProviderPosition, mProviderSteering, mProviderAccuracy;
    private static java.lang.reflect.Method mMatchedPosition, mMatchedAccuracy, mIntLatitude, mIntLongitude;
    /** Latest map-matched node-pair key (fromNodeDbId << 32 | toNodeDbId), or -1 if unmatched. */
    public static volatile long hudSegmentId = -1L;

    /** Hook (5.x): LocationNativeManager.onPosition(ProviderPosition) — extract map-matched info:
     *  street name + segment (fromNode / toNode). Keeps last known when unmatched. */
    public static void onMatchedPos(Object pos) {
        if (!modEnabled()) {
            TunnelThemeController.reset();
            return;
        }
        try {
            if (pos == null) return;
            lastWazeLocationElapsed = SystemClock.elapsedRealtime();
            // The native navigation core maintains a current map-matched segment even without an
            // active route. Read its real server/WME id before consuming the public matcher proto,
            // which exposes only the endpoint node ids.
            long nativeRoadId = SegmentNative.currentServerSegmentId();
            TunnelThemeController.onSample(SegmentNative.currentTunnelState());
            if (mMatcher == null) mMatcher = pos.getClass().getMethod("getMatcherInfo");
            Object m = mMatcher.invoke(pos);
            if (m == null) {
                publishPointPosition(pos, null);
                if (nativeRoadId > 0 && nativeRoadId != hudRoadSegmentId)
                    setRoadSegmentState(nativeRoadId, -1, -1, -1, "map-matcher");
                return;
            }
            if (mHasStreet == null) {
                mHasStreet = m.getClass().getMethod("hasStreetName");
                mGetStreet = m.getClass().getMethod("getStreetName");
                mGetFromNode = m.getClass().getMethod("getFromNodeDbId");
                mGetToNode = m.getClass().getMethod("getToNodeDbId");
            }
            if (Boolean.TRUE.equals(mHasStreet.invoke(m))) {
                Object s = mGetStreet.invoke(m);
                hudCurStreet = s != null ? s.toString() : "";
            }
            Object fromValue = mGetFromNode.invoke(m);
            Object toValue = mGetToNode.invoke(m);
            if (!(fromValue instanceof Number) || !(toValue instanceof Number)) {
                hudSegmentId = -1L;
                publishPointPosition(pos, m);
                if (nativeRoadId > 0 && nativeRoadId != hudRoadSegmentId)
                    setRoadSegmentState(nativeRoadId, -1, -1, -1, "map-matcher");
                return;
            }
            long from = ((Number) fromValue).longValue();
            long to = ((Number) toValue).longValue();
            long prev = hudSegmentId;
            hudSegmentId = from > 0 && to > 0 ? (from << 32) | (to & 0xFFFFFFFFL) : -1L;
            if (hudSegmentId != prev) Log.i(TAG, "segment " + from + "->" + to);
            // Publish after street/node extraction so the immutable backend snapshot cannot carry
            // metadata left over from the previous matched road.
            if (nativeRoadId > 0 && nativeRoadId != hudRoadSegmentId)
                setRoadSegmentState(nativeRoadId, -1, -1, -1, "map-matcher");
            publishPointPosition(pos, m);
        } catch (Throwable t) {
            // A lookup can fail after only some methods were cached. Reset the whole set so the
            // next position callback retries from a consistent state instead of repeatedly NPE-ing.
            mMatcher = mHasStreet = mGetStreet = mGetFromNode = mGetToNode = null;
            mProviderPosition = mProviderSteering = mProviderAccuracy = null;
            mMatchedPosition = mMatchedAccuracy = mIntLatitude = mIntLongitude = null;
        }
    }

    /** Copy location data once; spatial lookup never runs on Waze's hot native callback. */
    private static void publishPointPosition(Object provider, Object matched) {
        try {
            if (provider == null) return;
            Object coordinate;
            double accuracy;
            if (matched != null) {
                if (mMatchedPosition == null) {
                    mMatchedPosition = matched.getClass().getMethod("getPosition");
                    mMatchedAccuracy = matched.getClass().getMethod("getAccuracyMeters");
                }
                coordinate = mMatchedPosition.invoke(matched);
                Object value = mMatchedAccuracy.invoke(matched);
                accuracy = value instanceof Number ? ((Number) value).doubleValue() : -1.0;
            } else {
                if (mProviderPosition == null) {
                    mProviderPosition = provider.getClass().getMethod("getPosition");
                    mProviderSteering = provider.getClass().getMethod("getSteering");
                    mProviderAccuracy = provider.getClass().getMethod("getAccuracy");
                }
                coordinate = mProviderPosition.invoke(provider);
                Object value = mProviderAccuracy.invoke(provider);
                accuracy = value instanceof Number ? ((Number) value).doubleValue() : -1.0;
            }
            if (coordinate == null) return;
            if (mIntLatitude == null) {
                mIntLatitude = coordinate.getClass().getMethod("getLatitude");
                mIntLongitude = coordinate.getClass().getMethod("getLongitude");
            }
            Object latitudeValue = mIntLatitude.invoke(coordinate);
            Object longitudeValue = mIntLongitude.invoke(coordinate);
            if (!(latitudeValue instanceof Number) || !(longitudeValue instanceof Number)) return;
            if (mProviderSteering == null) {
                mProviderSteering = provider.getClass().getMethod("getSteering");
            }
            Object steeringValue = mProviderSteering.invoke(provider);
            int steering = steeringValue instanceof Number
                    ? ((Number) steeringValue).intValue() : -1;
            // Waze's native position-callback thread: also the thread the native query needs.
            TrafficLightAlerts.onPosition(ctx(), ((Number) latitudeValue).intValue(),
                    ((Number) longitudeValue).intValue(), hudSpeed, steering);
            probeRoadType();
            double latitude = ((Number) latitudeValue).intValue() / 1000000.0;
            double longitude = ((Number) longitudeValue).intValue() / 1000000.0;
            Region.onPosition(latitude, longitude);
            publishGpsFix(accuracy, matched != null ? I18n.tr("core.waze_map_matching") : "Waze");
            Context context = ctx();
            if (context != null) {
                PointNoticeRepository.PositionSnapshot snapshot =
                        new PointNoticeRepository.PositionSnapshot(
                                latitude, longitude, hudSpeed, steering, accuracy,
                                matched != null,
                                SystemClock.elapsedRealtime());
                TripBlackBox.onPosition(context, latitude, longitude, hudSpeed, hudLimit,
                        steering, accuracy, matched != null, hudRoadSegmentId,
                        hudCurStreet);
                PointNoticeRepository.onPosition(context, snapshot);
                RoadPointNoticeRepository.onPosition(context, snapshot);
            }
        } catch (Throwable ignored) {
            // Position proto shape differs across Waze versions; fail silent and retry reflection.
            mProviderPosition = mProviderSteering = mProviderAccuracy = null;
            mMatchedPosition = mMatchedAccuracy = mIntLatitude = mIntLongitude = null;
        }
    }

    /** @return real server segment id when available, otherwise the map-matched node pair. */
    public static String currentSegmentId() {
        if (!modEnabled()) return "N/A";
        long roadId = hudRoadSegmentId;
        if (roadId > 0) return "segment " + roadId;
        long sid = hudSegmentId;
        if (sid < 0) return "N/A";
        return "segment " + (sid >> 32) + "->" + (sid & 0xFFFFFFFFL);
    }

    /** Hook: called from the speedometer container's constructor. Long-press -> HUD; also drops a floating mod button. */
    public static void attachHud(final android.view.View v) {
        try {
            if (v == null) return;
            if (!modEnabled(v.getContext())) return;
            nativeSpeedo = v;    // remember Waze's gauge so the float speedo can hide it
            applyNativeSpeedoSize(v);
            applyNativeSpeedoTextColor(v);
            v.addOnLayoutChangeListener(new android.view.View.OnLayoutChangeListener() {
                @Override
                public void onLayoutChange(android.view.View view, int left, int top,
                                           int right, int bottom, int oldLeft, int oldTop,
                                           int oldRight, int oldBottom) {
                    // Waze recreates/resizes this container during rotation and split-screen.
                    // Keep its bottom-left map anchor stable while the visual scale changes.
                    applyNativeSpeedoSize(view);
                    applyNativeSpeedoVisibility(view);
                    applyNativeSpeedoTextColor(view);
                }
            });
            WazeDialogs.showAuthenticityNoticeOnce(v);
            warmMapProblems();   // pre-fetch map-issue types so "báo sai tốc độ" can pick the right one
            Bubble.installAutoHide(v.getContext());   // bubble shows only while Waze is backgrounded
            // Foreground entry point: restore an enabled HUD Link immediately even when there is
            // no fresh GPS/speed callback yet (common indoors or just after an APK update).
            HudLink.resume(v.getContext());
            v.setOnLongClickListener(new android.view.View.OnLongClickListener() {
                @Override
                public boolean onLongClick(android.view.View view) {
                    try {
                        Context c = view.getContext();
                        android.content.Intent it = HudActivity.createIntent(c);
                        it.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                        c.startActivity(it);
                    } catch (Throwable t) { /* ignore */ }
                    return true;
                }
            });
            applyNativeSpeedoVisibility(v);
            // main-screen overlays: mod button + HUD speedo + parking restriction sign
            v.addOnAttachStateChangeListener(new android.view.View.OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(android.view.View view) { addModReport(view); addFloatSpeedo(view); addUpcomingAlertRail(view); addParkingSign(view); addMapOverspeedEffect(view); addMapGapEffect(view); addOverspeedMuteButton(view); addGoogleMapsButton(view); WazeFeatureOverrides.refresh(); }
                @Override public void onViewDetachedFromWindow(android.view.View view) { }
            });
            if (v.isAttachedToWindow()) { addModReport(v); addFloatSpeedo(v); addUpcomingAlertRail(v); addParkingSign(v); addMapOverspeedEffect(v); addMapGapEffect(v); addOverspeedMuteButton(v); addGoogleMapsButton(v); WazeFeatureOverrides.refresh(); }
        } catch (Throwable t) { /* ignore */ }
    }

    /** Scale Waze's original map speedometer without changing the space reserved by its layout. */
    private static void applyNativeSpeedoSize(final android.view.View view) {
        if (view == null) return;
        final int percent = Math.max(100, Math.min(200,
                prefInt("native_speedo_size", 100)));
        final float scale = percent / 100f;
        view.post(new Runnable() {
            @Override public void run() {
                try {
                    // The native gauge lives near the lower-left corner. Growing upward/rightward
                    // prevents the enlarged view from being pushed outside the display.
                    view.setPivotX(0f);
                    view.setPivotY(view.getHeight());
                    view.setScaleX(scale);
                    view.setScaleY(scale);
                    view.invalidate();
                } catch (Throwable ignored) { }
            }
        });
    }

    /** Re-apply the native speedometer size immediately after the settings slider changes. */
    public static void refreshNativeSpeedoSize() {
        final android.view.View view = nativeSpeedo;
        if (view != null) applyNativeSpeedoSize(view);
    }

    private static final int TAG_SPEEDO_ROLES = 0x7f000003;   // Boolean: roles currently swapped
    private static final int TAG_SPEEDO_LIMIT_LP = 0x7f000004; // int[]: stock gravity / top / right margin of the limit badge
    private static final float SPEEDO_BIG_LIMIT_SCALE = 1.9f;   // 40dp badge -> ~76dp sign
    private static final float SPEEDO_SMALL_SPEED_SCALE = 0.6f;

    private static android.view.View nativeSpeedoView(android.view.View root, String name) {
        try {
            Context context = root.getContext();
            int id = context.getResources().getIdentifier(name, "id", context.getPackageName());
            if (id == 0) id = context.getResources().getIdentifier(name, "id", "com.waze");
            return id == 0 ? null : root.findViewById(id);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Optional role swap for Waze's own gauge: the speed-limit sign becomes the big element in the middle and the
     * current speed a small badge in the top-right corner (stock is the opposite). Only while a limit is shown;
     * without a limit the gauge keeps its stock layout so the speed never ends up as a lone corner badge.
     * Idempotent and cheap: the layout is only touched when the wanted state changes. Called after every frame.
     */
    static void applyNativeSpeedoRoles(final android.view.View root) {
        if (root == null) return;
        try {
            android.view.View limitBox = nativeSpeedoView(root, "speedLimitWarnLayout");
            android.view.View ring = nativeSpeedoView(root, "speedometerBackground");
            android.widget.TextView speed = nativeSpeedoText(root, "speedText");
            if (limitBox == null || ring == null || speed == null
                    || !(speed.getParent() instanceof android.view.View)
                    || !(((android.view.View) speed.getParent()).getParent() instanceof android.view.View)) return;
            android.view.View dial = (android.view.View) ((android.view.View) speed.getParent()).getParent();
            if (!(limitBox.getLayoutParams() instanceof android.widget.FrameLayout.LayoutParams)
                    || !(ring.getLayoutParams() instanceof android.widget.FrameLayout.LayoutParams)
                    || !(dial.getLayoutParams() instanceof android.widget.FrameLayout.LayoutParams)) return;

            boolean want = pref("native_speedo_swap", false)
                    && limitBox.getVisibility() == android.view.View.VISIBLE;
            boolean now = Boolean.TRUE.equals(root.getTag(TAG_SPEEDO_ROLES));
            if (want == now) {
                if (want) pivotSmallSpeedo(ring, dial);   // sizes only settle after layout
                return;
            }
            android.widget.FrameLayout.LayoutParams limitLp =
                    (android.widget.FrameLayout.LayoutParams) limitBox.getLayoutParams();
            int[] stock = (int[]) root.getTag(TAG_SPEEDO_LIMIT_LP);
            if (stock == null) {
                stock = new int[]{limitLp.gravity, limitLp.topMargin, limitLp.rightMargin};
                root.setTag(TAG_SPEEDO_LIMIT_LP, stock);
            }
            android.widget.FrameLayout.LayoutParams ringLp =
                    (android.widget.FrameLayout.LayoutParams) ring.getLayoutParams();
            android.widget.FrameLayout.LayoutParams dialLp =
                    (android.widget.FrameLayout.LayoutParams) dial.getLayoutParams();
            if (want) {
                limitLp.gravity = android.view.Gravity.CENTER;
                limitLp.topMargin = 0;
                limitLp.rightMargin = 0;
                ringLp.gravity = android.view.Gravity.TOP | android.view.Gravity.RIGHT;
                dialLp.gravity = android.view.Gravity.TOP | android.view.Gravity.RIGHT;
                limitBox.setScaleX(SPEEDO_BIG_LIMIT_SCALE);
                limitBox.setScaleY(SPEEDO_BIG_LIMIT_SCALE);
                ring.setScaleX(SPEEDO_SMALL_SPEED_SCALE);
                ring.setScaleY(SPEEDO_SMALL_SPEED_SCALE);
                dial.setScaleX(SPEEDO_SMALL_SPEED_SCALE);
                dial.setScaleY(SPEEDO_SMALL_SPEED_SCALE);
                pivotSmallSpeedo(ring, dial);
                ring.bringToFront();       // the small speed badge sits over the corner of the big sign
                dial.bringToFront();
            } else {
                limitLp.gravity = stock[0];
                limitLp.topMargin = stock[1];
                limitLp.rightMargin = stock[2];
                ringLp.gravity = android.view.Gravity.CENTER;
                dialLp.gravity = android.view.Gravity.CENTER;
                limitBox.setScaleX(1f);
                limitBox.setScaleY(1f);
                for (android.view.View v : new android.view.View[]{ring, dial}) {
                    v.setScaleX(1f);
                    v.setScaleY(1f);
                    v.setPivotX(v.getWidth() / 2f);
                    v.setPivotY(v.getHeight() / 2f);
                }
                limitBox.bringToFront();   // stock z-order: the limit badge over the dial
            }
            limitBox.setLayoutParams(limitLp);
            ring.setLayoutParams(ringLp);
            dial.setLayoutParams(dialLp);
            root.setTag(TAG_SPEEDO_ROLES, Boolean.valueOf(want));
        } catch (Throwable ignored) { }
    }

    /** Shrink the speed badge toward the top-right corner of its own box. */
    private static void pivotSmallSpeedo(android.view.View ring, android.view.View dial) {
        ring.setPivotX(ring.getWidth());
        ring.setPivotY(0f);
        dial.setPivotX(dial.getWidth());
        dial.setPivotY(0f);
    }

    /** Re-apply right after the settings switch changes while Waze remains open. */
    public static void refreshNativeSpeedoRoles() {
        final android.view.View view = nativeSpeedo;
        if (view == null) return;
        view.post(new Runnable() {
            @Override public void run() { applyNativeSpeedoRoles(view); }
        });
    }

    /**
     * Apply the selected ambient colour to Waze's own current-speed number and unit. This is
     * intentionally limited to speedText/speedUnits; the maximum/minimum speed signs retain
     * their semantic colours. Waze rewrites speedText's colour on every speedometer frame, so
     * the native renderer calls this method again after binding each frame.
     */
    public static void applyNativeSpeedoTextColor(final android.view.View view) {
        applyNativeSpeedoRoles(view);
        if (view == null || !pref("float_speed_current_ambient", false)) return;
        try {
            android.widget.TextView speed = nativeSpeedoText(view, "speedText");
            android.widget.TextView units = nativeSpeedoText(view, "speedUnits");
            Context context = view.getContext();
            int red = 0xFFFF5252;
            int redId = context.getResources().getIdentifier(
                    "RedSweet", "color", context.getPackageName());
            if (redId != 0) red = context.getResources().getColor(redId);
            // Waze normally colours only the number red. With ambient text enabled, keep the
            // number and its unit visually unified while preserving the overspeed warning.
            boolean overspeed = hudLimit >= 10 && hudSpeed > hudLimit;
            if (!overspeed && speed != null && hudSpeed < 0) {
                // Startup fallback before Gateway receives its first speed frame.
                overspeed = speed.getCurrentTextColor() == red;
            }
            int color = overspeed ? red : AmbientTheme.color(context);
            if (speed != null) speed.setTextColor(color);
            if (units != null) units.setTextColor(color);
        } catch (Throwable ignored) { }
    }

    private static android.widget.TextView nativeSpeedoText(android.view.View root, String name) {
        try {
            Context context = root.getContext();
            int id = context.getResources().getIdentifier(name, "id", context.getPackageName());
            if (id == 0) id = context.getResources().getIdentifier(name, "id", "com.waze");
            android.view.View child = id == 0 ? null : root.findViewById(id);
            return child instanceof android.widget.TextView
                    ? (android.widget.TextView) child : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Repaint immediately when the setting or ambient preset changes. */
    public static void refreshNativeSpeedoTextColor() {
        final android.view.View view = nativeSpeedo;
        if (view == null) return;
        if (pref("float_speed_current_ambient", false)) {
            applyNativeSpeedoTextColor(view);
            return;
        }
        view.post(new Runnable() {
            @Override public void run() {
                try {
                    Context context = view.getContext();
                    int white = 0xFFFFFFFF;
                    int red = 0xFFFF5252;
                    int whiteId = context.getResources().getIdentifier(
                            "White", "color", context.getPackageName());
                    int redId = context.getResources().getIdentifier(
                            "RedSweet", "color", context.getPackageName());
                    if (whiteId != 0) white = context.getResources().getColor(whiteId);
                    if (redId != 0) red = context.getResources().getColor(redId);
                    android.widget.TextView speed = nativeSpeedoText(view, "speedText");
                    android.widget.TextView units = nativeSpeedoText(view, "speedUnits");
                    if (speed != null) speed.setTextColor(
                            hudLimit >= 10 && hudSpeed > hudLimit ? red : white);
                    if (units != null) units.setTextColor(white);
                } catch (Throwable ignored) { }
            }
        });
    }

    /** Hide without using GONE so Waze keeps the same map/control layout and does not jump. */
    private static void applyNativeSpeedoVisibility(final android.view.View view) {
        if (view == null) return;
        final boolean show = pref("native_speedo_visible", true);
        view.post(new Runnable() {
            @Override public void run() {
                try {
                    view.setAlpha(show ? 1f : 0f);
                    view.setEnabled(show);
                    view.setLongClickable(show);
                    view.setImportantForAccessibility(show
                            ? android.view.View.IMPORTANT_FOR_ACCESSIBILITY_AUTO
                            : android.view.View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
                    view.invalidate();
                } catch (Throwable ignored) { }
            }
        });
    }

    /** Apply the native-gauge visibility switch immediately while Waze remains open. */
    public static void refreshNativeSpeedoVisibility() {
        final android.view.View view = nativeSpeedo;
        if (view != null) applyNativeSpeedoVisibility(view);
    }

    /** Add the same non-interactive red edge pulse used by the Mod HUD to Waze's map. */
    /**
     * Layer for the Mod's map widgets (float speedo, alert rail, mute and Google Maps buttons,
     * parking sign, over-speed vignette). It sits in Waze's mainActivityRoot right above the map
     * Compose view and below mapCover/mainContent, where Waze draws its side menu, Settings and
     * search. Those screens therefore cover the widgets instead of the widgets covering them.
     * Falls back to android.R.id.content (always on top) if the Waze layout is not recognised.
     */
    private static android.widget.FrameLayout mapOverlayRoot(android.view.View anchor) {
        if (anchor == null) return null;
        android.view.View rv = anchor.getRootView();
        try {
            android.content.Context c = anchor.getContext();
            int rootId = c.getResources().getIdentifier("mainActivityRoot", "id", c.getPackageName());
            // The arsc package stays com.waze in the Dual build; without this the layer fell back to the content
            // root and the widgets were drawn over Waze's own screens (Settings, search, ...).
            if (rootId == 0) rootId = c.getResources().getIdentifier("mainActivityRoot", "id", "com.waze");
            android.view.View found = rootId == 0 ? null : rv.findViewById(rootId);
            if (found instanceof android.view.ViewGroup) {
                android.view.ViewGroup main = (android.view.ViewGroup) found;
                android.view.View existing = main.findViewWithTag("gw_map_overlay_layer");
                if (existing instanceof android.widget.FrameLayout
                        && existing.getParent() == main) return (android.widget.FrameLayout) existing;
                // Direct child of mainActivityRoot that holds the map (and the speedometer anchor).
                android.view.View mapChild = anchor;
                while (mapChild != null && mapChild.getParent() != main) {
                    android.view.ViewParent parent = mapChild.getParent();
                    mapChild = parent instanceof android.view.View ? (android.view.View) parent : null;
                }
                int index = mapChild != null ? main.indexOfChild(mapChild) + 1 : 1;
                android.widget.FrameLayout layer = new android.widget.FrameLayout(c);
                layer.setTag("gw_map_overlay_layer");
                layer.setClipChildren(false);
                layer.setClipToPadding(false);
                main.addView(layer, Math.min(index, main.getChildCount()),
                        new android.view.ViewGroup.LayoutParams(
                                android.view.ViewGroup.LayoutParams.MATCH_PARENT,
                                android.view.ViewGroup.LayoutParams.MATCH_PARENT));
                return layer;
            }
        } catch (Throwable ignored) { }
        android.view.View content = rv.findViewById(android.R.id.content);
        if (content instanceof android.widget.FrameLayout) return (android.widget.FrameLayout) content;
        return rv instanceof android.widget.FrameLayout ? (android.widget.FrameLayout) rv : null;
    }

    private static volatile java.lang.ref.WeakReference<Vignette> mapGapVignette =
            new java.lang.ref.WeakReference<Vignette>(null);

    /** Second edge effect on the map, for "too close to the vehicle ahead" (xADAS). */
    private static void addMapGapEffect(android.view.View anchor) {
        try {
            final android.widget.FrameLayout root = mapOverlayRoot(anchor);
            if (root == null) return;
            android.view.View existing = root.findViewWithTag("map_gap_vignette");
            final Vignette effect;
            if (existing instanceof Vignette) {
                effect = (Vignette) existing;
            } else {
                effect = new Vignette(anchor.getContext());
                effect.setTag("map_gap_vignette");
                root.addView(effect, new android.widget.FrameLayout.LayoutParams(
                        android.view.ViewGroup.LayoutParams.MATCH_PARENT,
                        android.view.ViewGroup.LayoutParams.MATCH_PARENT));
            }
            effect.setEdgeAlpha(0x78);
            mapGapVignette = new java.lang.ref.WeakReference<Vignette>(effect);
        } catch (Throwable t) { /* never crash host */ }
    }

    /** Called by XadasAlerts: edge effect on or off; {@code mode} is a Vignette.MODE_*. */
    static void setXadasEdge(final boolean active, final int mode) {
        final Vignette effect = mapGapVignette.get();
        if (effect == null) return;
        effect.post(new Runnable() {
            @Override public void run() {
                if (!effect.isAttachedToWindow()) return;
                effect.setMode(mode);
                effect.setActive(active && mode != Vignette.MODE_NONE);
            }
        });
    }

    static int xadasPrefInt(String key, int def) { return prefInt(key, def); }

    private static void addMapOverspeedEffect(android.view.View anchor) {
        try {
            final android.widget.FrameLayout root = mapOverlayRoot(anchor);
            if (root == null) return;

            android.view.View existing = root.findViewWithTag("map_overspeed_vignette");
            final Vignette effect;
            if (existing instanceof Vignette) {
                effect = (Vignette) existing;
            } else {
                effect = new Vignette(anchor.getContext());
                effect.setTag("map_overspeed_vignette");
                effect.setEdgeAlpha(0x78);
                root.addView(effect, new android.widget.FrameLayout.LayoutParams(
                        android.view.ViewGroup.LayoutParams.MATCH_PARENT,
                        android.view.ViewGroup.LayoutParams.MATCH_PARENT));
            }
            effect.setEdgeAlpha(0x78);
            mapOverspeedVignette = new java.lang.ref.WeakReference<Vignette>(effect);
            updateMapOverspeedEffect(hudSpeed, hudLimit);
        } catch (Throwable t) { /* never crash host */ }
    }

    private static void updateMapOverspeedEffect(final int speed, final int limit) {
        final Vignette effect = mapOverspeedVignette.get();
        if (effect == null) return;
        final int mode = prefInt("map_overspeed_effect_mode", Vignette.MODE_NONE);
        final boolean active = mode != Vignette.MODE_NONE && limit >= 10 && speed > limit;
        effect.post(new Runnable() {
            @Override public void run() {
                if (effect.isAttachedToWindow()) {
                    effect.setMode(mode);
                    effect.setActive(active);
                }
            }
        });
    }

    /** Apply the map effect toggle immediately instead of waiting for another GPS callback. */
    public static void onMapOverspeedSettingChanged() {
        updateMapOverspeedEffect(hudSpeed, hudLimit);
    }

    /** Silence further over-speed voice warnings until speed drops back under the limit. */
    private static void muteOverspeedUntilEpisodeEnds() {
        synchronized (overspeedStateLock) {
            if (!wasOver) return;
            overspeedMuted = true;
        }
        setOverspeedMuteButtonWanted(false);
        Log.i(TAG, "overspeed warnings muted by user until speed is back under the limit");
    }

    /** Called on every speed frame; only touches the view when the desired state flips. */
    private static void setOverspeedMuteButtonWanted(boolean wanted) {
        if (overspeedMuteButtonWanted == wanted) return;
        overspeedMuteButtonWanted = wanted;
        applyOverspeedMuteButtonVisibility();
    }

    private static void applyOverspeedMuteButtonVisibility() {
        final android.widget.ImageButton button = overspeedMuteButton.get();
        if (button == null) return;
        final boolean visible = overspeedMuteButtonWanted;
        button.post(new Runnable() {
            @Override public void run() {
                if (visible) repositionOverspeedMuteButton();
                button.setVisibility(visible ? android.view.View.VISIBLE : android.view.View.GONE);
            }
        });
    }

    /**
     * Waze's own "sound off" glyph, tinted white for the dark button. The car_lib copy is already
     * white; the design_components copy is black and relies on the tint. If neither resource is
     * present in this build, fall back to a speaker drawn in code.
     */
    private static android.graphics.drawable.Drawable overspeedMuteIcon(android.view.View anchor) {
        Context c = anchor.getContext();
        String[] names = {"car_lib_icon_outline_sound_off_24px",
                "design_components_icon_outline_sound_off_24px"};
        for (String name : names) {
            int id = modResourceId(c, name, "drawable");
            if (id == 0) continue;
            try {
                android.graphics.drawable.Drawable icon = c.getResources().getDrawable(id, c.getTheme());
                if (icon == null) continue;
                icon = icon.mutate();
                icon.setTint(0xFFFFFFFF);
                return icon;
            } catch (Throwable ignored) { }
        }
        return new MuteIconDrawable(dp(anchor, 26));
    }

    /** Round icon (same size as the Google Maps shortcut) that appears after 10 s of over-speed and mutes the voice warning. */
    private static void addOverspeedMuteButton(android.view.View anchor) {
        try {
            final android.widget.FrameLayout root = mapOverlayRoot(anchor);
            if (root == null) return;

            android.view.View old = root.findViewWithTag("overspeed_mute_button");
            final android.widget.ImageButton button;
            if (old instanceof android.widget.ImageButton) {
                button = (android.widget.ImageButton) old;
            } else {
                button = new android.widget.ImageButton(anchor.getContext());
                button.setTag("overspeed_mute_button");
                button.setContentDescription(I18n.tr("core.temporarily_mute_over_speed_alert"));
                button.setScaleType(android.widget.ImageView.ScaleType.FIT_CENTER);
                button.setPadding(dp(button, 15), dp(button, 15), dp(button, 15), dp(button, 15));
                button.setElevation(dp(button, 8));
                button.setImageDrawable(overspeedMuteIcon(button));
                android.graphics.drawable.GradientDrawable background =
                        new android.graphics.drawable.GradientDrawable();
                background.setShape(android.graphics.drawable.GradientDrawable.OVAL);
                background.setColor(0xF2222228);
                background.setStroke(dp(button, 2), 0xFFFF3B30);
                button.setBackground(background);
                button.setVisibility(android.view.View.GONE);
                button.setOnClickListener(new android.view.View.OnClickListener() {
                    @Override public void onClick(android.view.View view) {
                        muteOverspeedUntilEpisodeEnds();
                        try {
                            android.widget.Toast.makeText(view.getContext(),
                                    I18n.tr("core.over_speed_alert_muted_until_you"),
                                    android.widget.Toast.LENGTH_SHORT).show();
                        } catch (Throwable ignored) { }
                    }
                });
                android.widget.FrameLayout.LayoutParams lp =
                        new android.widget.FrameLayout.LayoutParams(dp(button, 56), dp(button, 56));
                lp.gravity = android.view.Gravity.TOP | android.view.Gravity.END;
                root.addView(button, lp);
                root.addOnLayoutChangeListener(new android.view.View.OnLayoutChangeListener() {
                    @Override public void onLayoutChange(android.view.View view, int l, int t, int r, int b,
                                                         int ol, int ot, int or_, int ob) {
                        positionOverspeedMuteButton(root, button);
                    }
                });
            }
            overspeedMuteButton = new java.lang.ref.WeakReference<android.widget.ImageButton>(button);
            positionOverspeedMuteButton(root, button);
            applyOverspeedMuteButtonVisibility();
        } catch (Throwable ignored) { }
    }

    /**
     * Stack directly under the Google Maps shortcut, right-aligned with it. When that shortcut is
     * hidden (setting off / no route) the button takes its slot instead of leaving a gap.
     * Compare before setLayoutParams to avoid a layout loop.
     */
    private static void positionOverspeedMuteButton(android.widget.FrameLayout root,
                                                    android.widget.ImageButton button) {
        if (root == null || button == null) return;
        try {
            android.view.ViewGroup.LayoutParams raw = button.getLayoutParams();
            if (!(raw instanceof android.widget.FrameLayout.LayoutParams)) return;
            android.widget.FrameLayout.LayoutParams lp = (android.widget.FrameLayout.LayoutParams) raw;
            int targetTop = googleMapsButtonTop(root, button);
            android.widget.ImageButton maps = googleMapsButton.get();
            if (maps != null && maps.getVisibility() == android.view.View.VISIBLE)
                targetTop += dp(button, 56 + 10);
            int targetRight = dp(button, 14);
            int targetGravity = android.view.Gravity.TOP | android.view.Gravity.END;
            if (lp.topMargin == targetTop && lp.rightMargin == targetRight
                    && lp.gravity == targetGravity) return;
            lp.topMargin = targetTop;
            lp.rightMargin = targetRight;
            lp.gravity = targetGravity;
            button.setLayoutParams(lp);
        } catch (Throwable ignored) { }
    }

    /** The Google Maps shortcut shows/hides on route changes; keep the mute button in step. */
    private static void repositionOverspeedMuteButton() {
        final android.widget.ImageButton button = overspeedMuteButton.get();
        if (button == null) return;
        android.view.ViewParent parent = button.getParent();
        if (parent instanceof android.widget.FrameLayout)
            positionOverspeedMuteButton((android.widget.FrameLayout) parent, button);
    }

    /** Add a draggable HUD-styled speedometer overlay to the content root (visibility toggled in its tick). */
    private static void addFloatSpeedo(android.view.View anchor) {
        try {
            final android.widget.FrameLayout root = mapOverlayRoot(anchor);
            if (root == null) return;

            android.view.View existing = root.findViewWithTag("float_speedo");
            if (existing instanceof FloatSpeedo) {
                attachResizeClamp(root, (FloatSpeedo) existing);   // đã add rồi -> chỉ clamp resize, không add lại
                return;
            }

            Context c = anchor.getContext();
            float d = c.getResources().getDisplayMetrics().density;
            FloatSpeedo fs = new FloatSpeedo(c);
            fs.setTag("float_speedo");
            android.content.SharedPreferences p = prefs();
            int x = p != null ? p.getInt("fs_x", (int) (16 * d)) : (int) (16 * d);
            int y = p != null ? p.getInt("fs_y", (int) (130 * d)) : (int) (130 * d);
            fs.desiredX = x;
            fs.desiredY = y;
            android.widget.FrameLayout.LayoutParams lp = new android.widget.FrameLayout.LayoutParams(
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT,
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.gravity = android.view.Gravity.TOP | android.view.Gravity.START;
            lp.leftMargin = x; lp.topMargin = y;
            root.addView(fs, lp);

            attachResizeClamp(root, fs);
        } catch (Throwable t) { /* ignore */ }
    }

    /** Add the independent, edge-docked list of upcoming route alerts to the main map. */
    private static void addUpcomingAlertRail(android.view.View anchor) {
        try {
            final android.widget.FrameLayout root = mapOverlayRoot(anchor);
            if (root == null) return;
            CustomAlertBanner.attach(root);

            android.view.View existing = root.findViewWithTag("upcoming_alert_rail");
            if (existing instanceof UpcomingAlertRail) {
                ((UpcomingAlertRail) existing).attachToRoot(root);
                return;
            }

            UpcomingAlertRail rail = new UpcomingAlertRail(anchor.getContext());
            rail.setTag("upcoming_alert_rail");
            android.widget.FrameLayout.LayoutParams lp = new android.widget.FrameLayout.LayoutParams(
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT,
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.gravity = android.view.Gravity.TOP | android.view.Gravity.START;
            root.addView(rail, lp);
            rail.attachToRoot(root);
        } catch (Throwable t) { /* never crash host */ }
    }

    /** Optional fixed shortcut below Waze's audio controls; hidden whenever no route is active. */
    private static void addGoogleMapsButton(android.view.View anchor) {
        try {
            final android.widget.FrameLayout root = mapOverlayRoot(anchor);
            if (root == null) return;

            android.view.View old = root.findViewWithTag("google_maps_nav_button");
            final android.widget.ImageButton button;
            if (old instanceof android.widget.ImageButton) {
                button = (android.widget.ImageButton) old;
            } else {
                button = new android.widget.ImageButton(anchor.getContext());
                button.setTag("google_maps_nav_button");
                button.setContentDescription(I18n.tr("core.open_this_route_in_google_maps"));
                button.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
                button.setPadding(dp(button, 10), dp(button, 10), dp(button, 10), dp(button, 10));
                button.setElevation(dp(button, 8));
                android.graphics.drawable.GradientDrawable background =
                        new android.graphics.drawable.GradientDrawable();
                background.setShape(android.graphics.drawable.GradientDrawable.OVAL);
                background.setColor(0xFFF8FAFC);
                background.setStroke(dp(button, 1), 0xFFD8DEE8);
                button.setBackground(background);
                try {
                    button.setImageDrawable(anchor.getContext().getPackageManager()
                            .getApplicationIcon("com.google.android.apps.maps"));
                } catch (Throwable ignored) {
                    button.setImageResource(android.R.drawable.ic_menu_directions);
                }
                button.setOnClickListener(new android.view.View.OnClickListener() {
                    @Override public void onClick(android.view.View view) {
                        openGoogleMapsNavigation(view.getContext());
                    }
                });
                android.widget.FrameLayout.LayoutParams lp =
                        new android.widget.FrameLayout.LayoutParams(dp(button, 56), dp(button, 56));
                lp.gravity = android.view.Gravity.TOP | android.view.Gravity.END;
                root.addView(button, lp);
                root.addOnLayoutChangeListener(new android.view.View.OnLayoutChangeListener() {
                    @Override public void onLayoutChange(android.view.View view, int l, int t, int r, int b,
                                                         int ol, int ot, int or_, int ob) {
                        positionGoogleMapsButton(root, button);
                    }
                });
            }
            googleMapsButton = new java.lang.ref.WeakReference<android.widget.ImageButton>(button);
            positionGoogleMapsButton(root, button);
            refreshGoogleMapsButton();
        } catch (Throwable ignored) { }
    }

    /** Top edge of the Google Maps shortcut; the over-speed mute button is stacked relative to it. */
    private static int googleMapsButtonTop(android.widget.FrameLayout root, android.view.View button) {
        int topInset = 0;
        android.view.WindowInsets insets = root.getRootWindowInsets();
        if (insets != null) topInset = Math.max(0, insets.getSystemWindowInsetTop());
        boolean landscape = root.getWidth() > root.getHeight();
        int top = topInset + dp(button, landscape ? 102 : 340);
        int maxTop = Math.max(0, root.getHeight() - dp(button, 64));
        return Math.min(top, maxTop);
    }

    private static void positionGoogleMapsButton(android.widget.FrameLayout root,
                                                 android.widget.ImageButton button) {
        if (root == null || button == null) return;
        try {
            android.view.ViewGroup.LayoutParams raw = button.getLayoutParams();
            if (!(raw instanceof android.widget.FrameLayout.LayoutParams)) return;
            android.widget.FrameLayout.LayoutParams lp = (android.widget.FrameLayout.LayoutParams) raw;
            int targetTop = googleMapsButtonTop(root, button);
            int targetRight = dp(button, 14);
            int targetGravity = android.view.Gravity.TOP | android.view.Gravity.END;
            // setLayoutParams() schedules another root layout. Calling it unconditionally from
            // OnLayoutChangeListener created a permanent ~33 Hz feedback loop and ANRs.
            if (lp.topMargin == targetTop && lp.rightMargin == targetRight
                    && lp.gravity == targetGravity) return;
            lp.topMargin = targetTop;
            lp.rightMargin = targetRight;
            lp.gravity = targetGravity;
            button.setLayoutParams(lp);
        } catch (Throwable ignored) { }
    }

    /** Apply setting/route changes without recreating Waze's map hierarchy. */
    public static void refreshGoogleMapsButton() {
        final android.widget.ImageButton button = googleMapsButton.get();
        if (button == null) return;
        final boolean visible = pref("google_maps_nav_button", false) && hudNavigating
                && googleMapsDestinationLatE6 != Integer.MIN_VALUE
                && googleMapsDestinationLonE6 != Integer.MIN_VALUE;
        button.post(new Runnable() {
            @Override public void run() {
                button.setVisibility(visible ? android.view.View.VISIBLE : android.view.View.GONE);
                button.setEnabled(visible);
                repositionOverspeedMuteButton();
            }
        });
    }

    private static void openGoogleMapsNavigation(Context context) {
        if (context == null || !hudNavigating) return;
        int latE6 = googleMapsDestinationLatE6;
        int lonE6 = googleMapsDestinationLonE6;
        if (latE6 == Integer.MIN_VALUE || lonE6 == Integer.MIN_VALUE) return;
        String coordinate = String.format(java.util.Locale.US, "%.6f,%.6f",
                latE6 / 1000000.0, lonE6 / 1000000.0);
        try {
            android.content.Intent intent = new android.content.Intent(android.content.Intent.ACTION_VIEW,
                    android.net.Uri.parse("google.navigation:q=" + coordinate + "&mode=d"));
            intent.setPackage("com.google.android.apps.maps");
            intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            Log.i(TAG, "Opened Google Maps driving destination=" + coordinate);
        } catch (Throwable noMaps) {
            try {
                android.content.Intent web = new android.content.Intent(android.content.Intent.ACTION_VIEW,
                        android.net.Uri.parse("https://www.google.com/maps/dir/?api=1&destination="
                                + coordinate + "&travelmode=driving"));
                web.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(web);
            } catch (Throwable ignored) {
                android.widget.Toast.makeText(context, I18n.tr("core.couldnt_open_google_maps"),
                        android.widget.Toast.LENGTH_SHORT).show();
            }
        }
    }

    /** Clamp FloatSpeedo within root bounds on every layout pass — NEVER persists (only user drag does). */
    private static void attachResizeClamp(final android.widget.FrameLayout root, final FloatSpeedo fs) {
        if (fs.getTag(0x7f000001) != null) return;
        fs.setTag(0x7f000001, Boolean.TRUE);

        root.addOnLayoutChangeListener(new android.view.View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(android.view.View v, int l, int t, int r, int b,
                                        int ol, int ot, int or_, int ob) {
                if (r - l <= 0 || b - t <= 0 || fs.getWidth() <= 0 || fs.getHeight() <= 0) return;
                // One shared clamp (inside the safe area, from desiredX/desiredY). It never writes
                // SharedPreferences: only a user drag does, so the spot returns after a rotation.
                fs.clampToDesired();
            }
        });
    }

    private static int dp(android.view.View v, int val) {
        return (int) (val * v.getResources().getDisplayMetrics().density + 0.5f);
    }

    /** Keep the report-mod control on the main map; it is independent from the settings button. */
    private static void addModReport(android.view.View anchor) {
        try {
            android.view.View rv = anchor.getRootView();
            android.view.View content = rv.findViewById(android.R.id.content);
            if (!(content instanceof android.widget.FrameLayout)) {
                if (!(rv instanceof android.widget.FrameLayout)) return;
                content = rv;
            }
            android.widget.FrameLayout root = (android.widget.FrameLayout) content;
            ModReport.attach(root, false);   // "báo sai tốc độ" trigger + preset picker on the main map
        } catch (Throwable t) { /* ignore */ }
    }

    /** Called from Waze's SettingsPageFragment; the button dies with that fragment's view. */
    public static void attachSettingsButton(android.view.View settingsPage) {
        try {
            if (settingsPage == null || !modEnabled(settingsPage.getContext())) return;
            // The id of settingsLinearLayout changes every Waze build (5.23: 0x7f0a06fa -> 0x7f0a06df,
            // 5.27: 0x7f0a06da), so resolve it by name and keep the known ids as fallbacks.
            android.view.View listView = null;
            int byName = settingsPage.getResources().getIdentifier("settingsLinearLayout", "id",
                    settingsPage.getContext().getPackageName());
            for (int id : new int[]{byName, 0x7f0a06da, 0x7f0a06df, 0x7f0a06fa}) {
                if (id == 0) continue;
                listView = settingsPage.findViewById(id);
                if (listView instanceof android.widget.LinearLayout) break;
            }
            if (!(listView instanceof android.widget.LinearLayout)) return;
            android.widget.LinearLayout list = (android.widget.LinearLayout) listView;
            if (list.findViewWithTag("mod_settings_row") != null) return;

            final Context c = settingsPage.getContext();
            float d = c.getResources().getDisplayMetrics().density;
            android.widget.LinearLayout row = new android.widget.LinearLayout(c);
            row.setTag("mod_settings_row");
            row.setOrientation(android.widget.LinearLayout.HORIZONTAL);
            row.setGravity(android.view.Gravity.CENTER_VERTICAL);
            row.setPadding((int) (10 * d), 0, (int) (16 * d), 0);
            row.setClickable(true);
            row.setFocusable(true);
            row.setContentDescription(I18n.tr("core.mod_settings"));
            android.graphics.drawable.GradientDrawable rowBg = new android.graphics.drawable.GradientDrawable();
            rowBg.setColor(0xFF29202B);
            rowBg.setCornerRadius(12 * d);
            rowBg.setStroke((int) (2 * d), 0xE6FF0D7D);
            row.setBackground(new android.graphics.drawable.RippleDrawable(
                    android.content.res.ColorStateList.valueOf(0x33FFFFFF), rowBg, null));

            android.widget.TextView icon = new android.widget.TextView(c);
            icon.setText("⚙");
            icon.setTextColor(0xFFFFFFFF);
            icon.setTextSize(20);
            icon.setGravity(android.view.Gravity.CENTER);
            android.graphics.drawable.GradientDrawable bg = new android.graphics.drawable.GradientDrawable();
            bg.setShape(android.graphics.drawable.GradientDrawable.OVAL);
            bg.setColor(0xE6FF0D7D);
            bg.setStroke((int) (2 * d), 0x66FFFFFF);
            icon.setBackground(bg);
            int iconSize = (int) (40 * d + 0.5f);
            row.addView(icon, new android.widget.LinearLayout.LayoutParams(iconSize, iconSize));

            android.widget.TextView label = new android.widget.TextView(c);
            label.setText(I18n.tr("core.mod_settings"));
            label.setTextColor(0xFFFFFFFF);
            label.setTextSize(16);
            label.setGravity(android.view.Gravity.CENTER_VERTICAL);
            android.widget.LinearLayout.LayoutParams labelParams =
                    new android.widget.LinearLayout.LayoutParams(0,
                            android.view.ViewGroup.LayoutParams.MATCH_PARENT, 1f);
            labelParams.leftMargin = (int) (16 * d + 0.5f);
            row.addView(label, labelParams);
            row.setOnClickListener(new android.view.View.OnClickListener() {
                @Override public void onClick(android.view.View view) { openModSettings(c); }
            });

            android.widget.LinearLayout.LayoutParams rowParams =
                    new android.widget.LinearLayout.LayoutParams(
                            android.view.ViewGroup.LayoutParams.MATCH_PARENT,
                            (int) (60 * d + 0.5f));
            rowParams.setMargins((int) (12 * d), (int) (6 * d),
                    (int) (12 * d), (int) (6 * d));
            list.addView(row, Math.min(1, list.getChildCount()), rowParams);
        } catch (Throwable t) { /* never crash Waze settings */ }
    }

    /** Add a fixed parking/stopping-restriction sign on the right side, away from report controls. */
    private static void addParkingSign(android.view.View anchor) {
        try {
            final android.widget.FrameLayout root = mapOverlayRoot(anchor);
            if (root == null) return;
            if (root.findViewWithTag("parking_sign") != null) return;

            Context c = anchor.getContext();
            float d = c.getResources().getDisplayMetrics().density;
            int sz = (int) (72 * d);
            android.widget.ImageView ps = new android.widget.ImageView(c);
            ps.setTag("parking_sign");
            ps.setVisibility(android.view.View.GONE);
            ps.setScaleType(android.widget.ImageView.ScaleType.FIT_CENTER);

            android.widget.FrameLayout.LayoutParams lp =
                    new android.widget.FrameLayout.LayoutParams(sz, sz);
            lp.gravity = android.view.Gravity.END | android.view.Gravity.CENTER_VERTICAL;
            lp.rightMargin = (int) (18 * d);
            root.addView(ps, lp);
            parkingSign = ps;

            // Tick to sync visibility/image with parkingRestriction state
            parkingTick = new android.os.Handler(android.os.Looper.getMainLooper());
            android.os.Handler h = parkingTick;
            parkingTick.post(new Runnable() {
                @Override public void run() {
                    try {
                        if (parkingRestriction > 0 && pref("parking_test", false)) {
                            String name = parkingRestriction == 1 ? "no_parking" : "no_stopping_and_parking";
                            if (ps.getDrawable() == null) {
                                android.graphics.Bitmap b = Signs.pin(c, name);
                                if (b != null) ps.setImageBitmap(b);
                            }
                            ps.setVisibility(android.view.View.VISIBLE);
                        } else {
                            ps.setVisibility(android.view.View.GONE);
                            ps.setImageDrawable(null);
                        }
                    } catch (Throwable t) { /* ignore */ }
                    h.postDelayed(this, 500);
                }
            });
        } catch (Throwable t) { /* ignore */ }
    }

    /** Stub: will fetch parking/stopping restriction from external server for the current segment. */
    private static void checkParkingRestriction() {
        Log.i(TAG, "parking: speed slow on segment " + (hudSegmentId >> 32) + "->" + (hudSegmentId & 0xFFFFFFFFL));
        // parkingRestriction = 1;   // tạm thời test UI — sẽ thay bằng logic server
    }

    // ---- one-tap "báo sai tốc độ" (Waze's map-issue pipeline, auto-filled comment, no keyboard) ----
    private static volatile int[] mpTypes;      // map-problem type ints (from getMapProblems)
    private static volatile String[] mpDescs;   // their server labels (parallel to mpTypes)

    private static Object rtMgr() throws Exception {
        return Class.forName("com.waze.rtalerts.RtAlertsNativeManager")
                .getMethod("getInstance").invoke((Object) null);
    }

    /** Fetch + cache the map-problem type list (async) so reporting can pick the "general" type. */
    public static void warmMapProblems() {
        if (!modEnabled()) return;
        if (mpTypes != null) return;
        try {
            final Object mgr = rtMgr();
            Class<?> qiTmp;                                            // getMapProblems callback: a([MapProblem;)
            try { qiTmp = Class.forName("com.waze.rtalerts.q"); }                        // Waze 5.20
            catch (Throwable t) { qiTmp = Class.forName("com.waze.rtalerts.RtAlertsNativeManager$e"); }  // Waze 4.100
            final Class<?> qi = qiTmp;
            Object cb = java.lang.reflect.Proxy.newProxyInstance(
                    mgr.getClass().getClassLoader(), new Class[]{qi},
                    new java.lang.reflect.InvocationHandler() {
                        @Override public Object invoke(Object proxy, java.lang.reflect.Method m, Object[] a) {
                            try {
                                Object[] arr = (a != null && a.length > 0 && a[0] instanceof Object[])
                                        ? (Object[]) a[0] : null;
                                if (arr != null && arr.length > 0) {
                                    int[] ts = new int[arr.length];
                                    String[] ds = new String[arr.length];
                                    for (int i = 0; i < arr.length; i++) {
                                        ts[i] = arr[i].getClass().getField("type").getInt(arr[i]);
                                        Object dd = arr[i].getClass().getField("description").get(arr[i]);
                                        ds[i] = dd != null ? dd.toString() : "";
                                    }
                                    mpDescs = ds; mpTypes = ts;
                                    Log.i(TAG, "mapProblems types=" + java.util.Arrays.toString(ts)
                                            + " labels=" + java.util.Arrays.toString(ds));
                                }
                            } catch (Throwable t) { Log.w(TAG, "mapProblems parse", t); }
                            return null;
                        }
                    });
            mgr.getClass().getMethod("getMapProblems", qi).invoke(mgr, cb);
        } catch (Throwable t) { Log.w(TAG, "warmMapProblems", t); }
    }

    /** Pick the "general map error" type from the cached list; fall back to first entry, then 0. */
    private static int generalMapType() {
        int[] ts = mpTypes; String[] ds = mpDescs;
        if (ts != null && ds != null && ts.length > 0) {
            String[] keys = {I18n.tr("core.other"), "chung", "general", "other", "misc", I18n.tr("core.remaining")};
            for (int i = 0; i < ds.length; i++) {
                String d = ds[i] != null ? ds[i].toLowerCase() : "";
                for (String k : keys) if (d.contains(k)) return ts[i];
            }
            return ts[0];
        }
        return 0;
    }

    /** One tap: set the report location to the current position, then file a map-issue with an
     *  auto-generated comment (no keyboard). {@code correctKmh} = the driver's chosen correct limit. */
    public static void reportWrongSpeed(final int correctKmh) {
        if (!trustedBuild()) return;
        submitReport(wrongSpeedLabel(correctKmh), wrongSpeedComment(correctKmh, hudLimit));
    }

    /** Toast label of a wrong-speed report; the value is in the unit Waze shows (km/h or mph). */
    private static String wrongSpeedLabel(int correct) {
        return correct > 0
                ? I18n.f(Units.imperial() ? "core.wrong_speed_report_0_mph" : "core.wrong_speed_report_0_km_h", correct)
                : I18n.tr("core.wrong_speed_report");
    }

    /**
     * Comment sent to the map editors, in the report language ({@link I18n#reportTag()}: Vietnamese in Vietnam,
     * otherwise the UI language) and ending with the "[Reported from WazeMod]" tag in that language.
     */
    private static String wrongSpeedComment(int correct, int shown) {
        String waze = shown >= 10 ? " (Waze: " + shown + ")" : "";
        if (correct > 0) {
            return I18n.reportComment("comment.wrong_speed_correct_0_1_2", correct,
                    Units.imperial() ? "mph" : "km/h", waze);
        }
        return I18n.reportComment("comment.wrong_speed_unknown_0", waze);
    }

    /** True once Waze has stored the report location requested by {@link #beginSpeedReport()}. */
    private static volatile boolean reportLocationReady;

    /**
     * Speed report started from the traffic bubble. The report is submitted up to 15 s later, by
     * which time the car has moved hundreds of metres, so capture Waze's report location NOW (its
     * own report menu does the same when it opens) and submit against that stored location.
     * Only the Waze 5.20 path can do this; elsewhere the location is simply set at submit time.
     */
    public static void beginSpeedReport() {
        reportLocationReady = false;
        if (!trustedBuild()) return;
        try {
            final Object mgr = rtMgr();
            final Class<?> fn1 = Class.forName("g.h.a.l");
            Object callback = java.lang.reflect.Proxy.newProxyInstance(
                    mgr.getClass().getClassLoader(), new Class[]{fn1},
                    new java.lang.reflect.InvocationHandler() {
                        @Override public Object invoke(Object proxy, java.lang.reflect.Method m, Object[] a) {
                            reportLocationReady = true;
                            return null;
                        }
                    });
            mgr.getClass().getMethod("setAndRetrieveReportLocation", fn1).invoke(mgr, callback);
        } catch (Throwable t) {
            Log.i(TAG, "speed report: location capture unavailable, will be set at submit");
        }
    }

    /** Submit the bubble's speed report; {@code correctKmh <= 0} means "wrong, value unknown". */
    public static void submitSpeedReport(final int correctKmh) {
        if (!trustedBuild()) return;
        final String label = wrongSpeedLabel(correctKmh);
        final String comment = wrongSpeedComment(correctKmh, hudLimit);
        if (!reportLocationReady) {          // no stored location: set it now and submit as usual
            submitReport(label, comment);
            return;
        }
        reportLocationReady = false;
        toast(I18n.f("core.sending_0", I18n.tr(label)));
        warmMapProblems();
        try {
            Object mgr = rtMgr();
            java.lang.reflect.Method report =
                    mgr.getClass().getMethod("reportMapIssue", String.class, int.class, boolean.class);
            report.invoke(mgr, appendWazeReporter(comment, currentWazeUsername()),
                    generalMapType(), Boolean.TRUE);
            Log.i(TAG, "speed report sent (stored location) correct=" + correctKmh);
            toast(I18n.f("core.sent_0", I18n.tr(label)));
        } catch (Throwable t) {
            Log.w(TAG, "speed report", t);
            toast(I18n.tr("core.report_failed"));
        }
    }

    /** File any map-issue report to Waze's editors at the current GPS position, with an auto comment.
     *  Shared by every mod report type (wrong speed, no-turn, no-passing, missing camera, …).
     *  {@code label} is the short human text shown in the "sending/sent" toasts. */
    public static void reportIssue(String label, String comment) {
        if (trustedBuild()) submitReport(label, comment);
    }

    private static void submitReport(final String label, final String comment) {
        final String attributedComment = appendWazeReporter(comment, currentWazeUsername());
        toast(I18n.f("core.sending_0", I18n.tr(label)));
        // Waze 5.27 moved map-issue reporting out of RtAlertsNativeManager into reports.bn.
        if (submitMapIssueV527(label, attributedComment)) return;
        warmMapProblems();   // ensure the type list is (being) fetched

        Object mgrTmp;
        int typeTmp;
        try {
            mgrTmp = rtMgr();
            typeTmp = generalMapType();
        } catch (Throwable t) { Log.w(TAG, "reportIssue init", t); toast(I18n.tr("core.report_failed")); return; }
        final Object mgr = mgrTmp;
        final int type = typeTmp;

        // --- Waze 5.20: Kotlin Function1 location callback -> reportMapIssue(String,int,boolean) ---
        try {
            final Class<?> fn1 = Class.forName("g.h.a.l");   // absent on 4.100 -> falls through below
            final java.lang.reflect.Method report =
                    mgr.getClass().getMethod("reportMapIssue", String.class, int.class, boolean.class);
            Object loc = java.lang.reflect.Proxy.newProxyInstance(
                    mgr.getClass().getClassLoader(), new Class[]{fn1},
                    new java.lang.reflect.InvocationHandler() {
                        boolean done;
                        @Override public Object invoke(Object proxy, java.lang.reflect.Method m, Object[] a) {
                            if (!done) {   // location set -> now submit the report at that position
                                done = true;
                                try {
                                    report.invoke(mgr, attributedComment, type, Boolean.TRUE);
                                    Log.i(TAG, "reportMapIssue OK type=" + type
                                            + " reporter=" + (attributedComment.equals(comment)
                                            ? "unavailable" : "attached"));
                                    toast(I18n.f("core.sent_0", I18n.tr(label)));
                                } catch (Throwable t) { Log.w(TAG, "reportMapIssue", t); toast(I18n.tr("core.report_failed")); }
                            }
                            return null;
                        }
                    });
            mgr.getClass().getMethod("setAndRetrieveReportLocation", fn1).invoke(mgr, loc);
            return;
        } catch (Throwable t520) { /* older Waze -> 4.100 path below */ }

        // --- Waze 4.100: no Function1 wrapper. Set report location on the native thread (same
        //     NativeManager queue, FIFO), then reportMapIssue(String,int) — 2-arg, no boolean. ---
        try {
            final java.lang.reflect.Method locNtv =
                    mgr.getClass().getDeclaredMethod("setAndRetrieveReportLocationNTV");
            locNtv.setAccessible(true);
            Runnable r = new Runnable() {
                @Override public void run() { try { locNtv.invoke(mgr); } catch (Throwable t) { /* ignore */ } }
            };
            Class.forName("com.waze.NativeManager").getMethod("Post", Runnable.class).invoke((Object) null, r);
            mgr.getClass().getMethod("reportMapIssue", String.class, int.class)
                    .invoke(mgr, attributedComment, type);
            Log.i(TAG, "reportMapIssue(4.x) OK type=" + type
                    + " reporter=" + (attributedComment.equals(comment)
                    ? "unavailable" : "attached"));
            toast(I18n.f("core.sent_0", I18n.tr(label)));
        } catch (Throwable t4) { Log.w(TAG, "reportIssue 4.x", t4); toast(I18n.tr("core.report_failed")); }
    }

    /**
     * Waze 5.27: com.waze.reports.bn.b(typeId, description) looks the map-issue type up by id, asks the report
     * location holder for the current position and submits through reports_v2.c.j (the same path as the stock
     * "map issue" form). typeId is the id of the INCORRECT_GENERAL_ERROR entry of reports_v2.b.ac, the general
     * "other map error" type, and bn comes from Waze's DI container.
     */
    private static boolean submitMapIssueV527(String label, String description) {
        try {
            Class<?> typeClass = Class.forName("com.waze.reports_v2.b.ac");
            Class<?> reporterClass = Class.forName("com.waze.reports.bn");
            @SuppressWarnings({"rawtypes", "unchecked"})
            Object general = java.lang.Enum.valueOf((Class) typeClass, "INCORRECT_GENERAL_ERROR");
            int typeId = ((Number) typeClass.getMethod("a").invoke(general)).intValue();
            Object reporter = WazeKoin.get(reporterClass);
            if (reporter == null) {
                Log.w(TAG, "map issue reporter (reports.bn) not available from DI");
                return false;
            }
            reporterClass.getMethod("b", int.class, String.class).invoke(reporter, typeId, description);
            Log.i(TAG, "map issue submitted type=" + typeId + " label=" + label);
            toast(I18n.f("core.sent_0", I18n.tr(label)));
            return true;
        } catch (ClassNotFoundException | NoSuchMethodException older) {
            return false;       // not 5.27: fall back to the RtAlertsNativeManager paths below
        } catch (Throwable error) {
            Log.w(TAG, "map issue (5.27) failed", error);
            toast(I18n.tr("core.report_failed"));
            return true;
        }
    }

    /** Read only the public Waze editor username; never inspect login email/password fields. */
    private static String currentWazeUsername() {
        try {
            Class<?> managerClass = Class.forName("com.waze.mywaze.MyWazeNativeManager");
            Object manager = managerClass.getMethod("getInstance").invoke(null);
            if (manager == null) return "";
            try {
                Object guest = manager.getClass().getMethod("isGuestUser").invoke(manager);
                if (Boolean.TRUE.equals(guest)) return "";
            } catch (Throwable ignored) { /* getter below still fails closed */ }
            Object value = manager.getClass().getMethod("getRealUserNameNTV").invoke(manager);
            return sanitizeWazeUsername(value == null ? "" : value.toString());
        } catch (Throwable error) {
            Log.w(TAG, "Waze username unavailable for map issue: "
                    + error.getClass().getSimpleName());
            return "";
        }
    }

    static String appendWazeReporter(String comment, String username) {
        String base = comment == null ? "" : comment.trim();
        String safeUsername = sanitizeWazeUsername(username);
        if (safeUsername.length() == 0) return base;
        return base + " [Waze username: " + safeUsername + "]";
    }

    static String sanitizeWazeUsername(String username) {
        if (username == null) return "";
        String value = username.replaceAll("[\\p{Cntrl}\\[\\]]+", " ")
                .replaceAll("\\s+", " ").trim();
        if (value.length() == 0 || "0".equals(value) || "-1".equals(value)
                || "null".equalsIgnoreCase(value)) return "";
        return value.length() <= 64 ? value : value.substring(0, 64).trim();
    }

    private static void toast(final String msg) {
        final Context c = ctx();
        if (c == null) return;
        new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable() {
            @Override public void run() {
                try { android.widget.Toast.makeText(c, msg, android.widget.Toast.LENGTH_SHORT).show(); }
                catch (Throwable t) { /* ignore */ }
            }
        });
    }

    private static String safe(String s) { return s == null ? "" : s; }

    /** True only after entering the zone ("trong"), not while merely approaching it ("cách"). */
    private static boolean isActiveAverageZoneAlert(String icon, String title, String titleWithDistance) {
        String identity = normalizeAlertText(safe(icon) + " " + safe(title));
        boolean averageCamera = identity.contains("average")
                || identity.contains("french")
                || identity.contains("cam vuot");
        if (!averageCamera) return false;
        String state = normalizeAlertText(titleWithDistance);
        return state.startsWith("trong ")
                || state.contains(" trong ")
                || state.startsWith("remaining ")
                || state.contains(" remaining ");
    }

    private static String normalizeAlertText(String value) {
        if (value == null || value.isEmpty()) return "";
        try {
            return java.text.Normalizer.normalize(value, java.text.Normalizer.Form.NFD)
                    .replaceAll("\\p{M}+", "")
                    .toLowerCase(java.util.Locale.US)
                    .trim();
        } catch (Throwable ignored) {
            return value.toLowerCase(java.util.Locale.US).trim();
        }
    }

    /** Map an alert's iconName to an icon the HUD can actually load (alerter names differ from assets). */
    private static String resolveIcon(int type, String iconName) {
        String s = iconName == null ? "" : iconName.toLowerCase();
        // Waze classifies railroad crossings under its camera alert family on some builds.
        // Preserve the more specific icon before applying TYPE_CAMERA's generic fallback.
        if (s.contains("railway") || s.contains("railroad") || s.contains("train"))
            return "bigpin_railroad";
        if (type == TYPE_CAMERA) {
            if (s.contains("red_light") || s.contains("traffic_light")) return "icon_report_camera_trafficlight";
            if (s.contains("fake")) return "icon_report_camera_fake";
            return "icon_report_camera_speed";       // speed / generic camera
        }
        // hazards / police / accident: the iconName already matches an alert_icons or skin asset
        return iconName != null ? iconName : "";
    }

    /** Remaining distance for a speed-drop descriptor Waze has moved out of its repository. */
    private static int heldSpeedDropRemaining(long now) {
        long elapsedMs = Math.max(0L, now - heldSpeedDropAtMs);
        double metersPerSecond = Math.max(0, hudSpeed) / 3.6;
        String u = hudUnits == null ? "" : hudUnits.toLowerCase(java.util.Locale.US);
        if (u.contains("mph") || u.contains("mi/h")) metersPerSecond = Math.max(0, hudSpeed) * 0.44704;
        return heldSpeedDropMeters - (int) Math.round(metersPerSecond * elapsedMs / 1000.0);
    }

    private static void clearHeldSpeedDrop() {
        heldSpeedDropKey = "";
        heldSpeedDropValue = -1;
        heldSpeedDropMeters = -1;
        heldSpeedDropFromLimit = -1;
        heldSpeedDropAtMs = 0;
    }

    /** Remove only route-derived speed-drop rows; other live alerts are replaced by their own repository. */
    private static void clearSpeedDropRouteState() {
        clearHeldSpeedDrop();
        synchronized (Gateway.class) {
            java.util.List<String> current = nativeHudAlerts;
            java.util.ArrayList<String> kept = new java.util.ArrayList<String>(current.size());
            for (String row : current) {
                if (row == null || !row.startsWith("speeddrop_")) kept.add(row);
            }
            nativeHudAlerts = kept;
            mergeHudAlertsLocked();
        }
    }

    private static String fmtDist(int m) {
        if (m < 0) return "";
        String imperial = Units.imperialDistance(m, false);
        if (imperial != null) return imperial.replace(" ", "");
        if (m < 1000) return m + "m";
        return String.format(java.util.Locale.US, "%.1fkm", m / 1000.0);
    }

    /**
     * Hook: TrafficInfoNativeManager.c(TrafficZoneUpdate). While the car is inside a traffic zone Waze shows a realtime
     * "Ùn tắc trong N phút" card (N = totalTimeSec / 60, rounded). It is not an alerter descriptor, so it never reaches
     * onAlerts; it is rebuilt here as a 0 m jam row for the HUD list, the rail, the bubble and the HLP link.
     */
    public static void onTrafficZone(Object update) {
        try {
            Class<?> uc = update.getClass();
            int seconds = ((Number) uc.getMethod("getTotalTimeSec").invoke(update)).intValue();
            int level = -1;
            for (Object jam : (java.util.List<?>) uc.getMethod("getJamsList").invoke(update))
                level = Math.max(level,
                        ((Number) jam.getClass().getMethod("getLevelValue").invoke(jam)).intValue());
            if (seconds <= 0 || level < 0) {
                onTrafficZoneCleared();
                return;
            }
            int minutes = Math.max(1, (seconds + 30) / 60);
            // TrafficJamSection.Severity: 0 light, 1 moderate, 2 heavy, 3 stand-still, 5 closed road. The icon name
            // carries the severity for HudAlertCodec.jamSeverity, the "+N phút" label the delay.
            String icon = level == 0 ? "icon_report_light_traffic"
                    : level == 1 ? "icon_report_traffic_moderate"
                    : level == 2 ? "icon_report_traffic_heavy" : "icon_report_traffic_standstill";
            String text = I18n.f("core.0_min", minutes);
            setTrafficJamAlerts(java.util.Collections.singletonList(
                    icon + "\t" + text + "\t" + text + "\t0\t" + icon));
        } catch (Throwable t) {
            Log.w(TAG, "traffic zone update failed: " + t);
        }
    }

    /** Hook: TrafficInfoNativeManager.b(), the traffic zone state was reset (left the jam / route ended). */
    public static void onTrafficZoneCleared() {
        if (!trafficJamHudAlerts.isEmpty()) setTrafficJamAlerts(new java.util.ArrayList<String>());
    }

    private static void setTrafficJamAlerts(java.util.List<String> alerts) {
        synchronized (Gateway.class) {
            if (trafficJamHudAlerts.equals(alerts)) return;
            trafficJamHudAlerts = alerts;
            Log.i(TAG, "traffic jam row " + (alerts.isEmpty() ? "cleared" : alerts.get(0).replace('\t', '|')));
            mergeHudAlertsLocked();
        }
    }

    /**
     * Hook: InsightsInfraNativeManager.c(SegmentInsightUpdate). The "Khu vực trường học" card is a segment insight, not
     * an alerter descriptor, so it never reaches onAlerts. Every update carries the complete current list; the school
     * zone is rebuilt as a permanent-hazard row carrying the card's remaining distance ("cách N m" approaching,
     * "trong N m" inside the zone).
     */
    public static void onSegmentInsights(Object update) {
        try {
            java.util.ArrayList<String> rows = new java.util.ArrayList<String>();
            for (Object info : (java.util.List<?>) update.getClass().getMethod("getInfoList").invoke(update)) {
                Class<?> ic = info.getClass();
                Object id = ic.getMethod("getId").invoke(info);
                Object type = id.getClass().getMethod("getSegmentType").invoke(id);
                if (!"SCHOOL_ZONE".equals(String.valueOf(type))) continue;
                int meters = ((Number) ic.getMethod("getRemainingDistanceMeters").invoke(info)).intValue();
                if (meters < 0) continue;
                String icon = "icon_permanent_hazard_school_zone";
                rows.add(icon + "\t" + schoolZoneLabel() + "\t" + fmtDist(meters) + "\t" + meters + "\t" + icon);
                break;
            }
            setSchoolZoneAlerts(rows);
        } catch (Throwable t) {
            Log.w(TAG, "segment insight update failed: " + t);
        }
    }

    private static String schoolZoneLabel() {
        try {
            Context c = ctx();
            int id = c.getResources().getIdentifier("INSIGHTS_SEGMENT_TYPE_SCHOOL_ZONE", "string", c.getPackageName());
            if (id != 0) return c.getString(id);
        } catch (Throwable ignored) { }
        return "School zone";
    }

    private static void setSchoolZoneAlerts(java.util.List<String> alerts) {
        synchronized (Gateway.class) {
            if (schoolZoneHudAlerts.equals(alerts)) return;
            schoolZoneHudAlerts = alerts;
            mergeHudAlertsLocked();
        }
    }

    /** Meters in a distance text from Waze (metric or imperial), -1 when it has none. */
    private static int parseDistM(String s) {
        try {
            return Units.parseMeters(s);
        } catch (Throwable t) { return -1; }
    }

    private static int trailingInt(String s) {
        if (s == null) return -1;
        int i = s.length();
        while (i > 0 && s.charAt(i - 1) >= '0' && s.charAt(i - 1) <= '9') i--;
        if (i == s.length()) return -1;
        try { return Integer.parseInt(s.substring(i)); } catch (Throwable t) { return -1; }
    }

    /** Per-value voice filter configured in Mod Settings; every supported value defaults to on. */
    private static boolean voiceSpeedEnabled(String keyPrefix, int value) {
        if (value < 10 || value > 120) return false;
        return pref(keyPrefix + value, true);
    }

    /** Play a packaged speed-warning clip; point notices use the same selected voice preset. */
    static boolean playNextSpeedAsset(int value) {
        if (value < 10 || value > 120 || value % 10 != 0) return false;
        return playModVoice("next_" + value,
                voiceDir() + "next_speed_" + value + ".mp3");
    }

    /** Prefer the user's private alert clip/recording, with a safe built-in fallback. */
    private static boolean playOverspeedAlert() {
        return playModVoice("overspeed", voiceDir() + "over_speed_limit.mp3");
    }

    /** Settings preview uses the exact runtime source and Android Auto audio route. */
    static boolean previewOverspeedAlert() {
        // A preview must be audible even if Waze is muted, so it skips the sound-mode gate.
        return playCustomOrAsset("overspeed", voiceDir() + "over_speed_limit.mp3");
    }

    static long previewOverspeedDurationMs() {
        return customOrAssetDurationMs("overspeed", voiceDir() + "over_speed_limit.mp3");
    }

    static boolean previewSpeedAlert(boolean next, int value) {
        if (value < 10 || value > 120) return false;
        String slot = (next ? "next_" : "current_") + value;
        String asset = voiceDir() + (next ? "next_speed_" : "current_speed_")
                + value + ".mp3";
        return playCustomOrAsset(slot, asset);
    }

    static long previewSpeedDurationMs(boolean next, int value) {
        if (value < 10 || value > 120) return 3_500L;
        String slot = (next ? "next_" : "current_") + value;
        String asset = voiceDir() + (next ? "next_speed_" : "current_speed_")
                + value + ".mp3";
        return customOrAssetDurationMs(slot, asset);
    }

    private static long customOrAssetDurationMs(String slot, String asset) {
        Context context = ctx();
        if (context == null) return 3_500L;
        int mode = prefInt(CustomAlertAudio.modeKey(slot), CustomAlertAudio.MODE_DEFAULT);
        if (mode != CustomAlertAudio.MODE_DEFAULT) {
            long customDuration = CustomAlertAudio.durationMs(CustomAlertAudio.file(context, slot));
            if (customDuration > 0L) return customDuration;
        }
        android.media.MediaMetadataRetriever retriever =
                new android.media.MediaMetadataRetriever();
        android.content.res.AssetFileDescriptor afd = null;
        try {
            try {
                afd = context.getAssets().openFd(asset);
                retriever.setDataSource(afd.getFileDescriptor(), afd.getStartOffset(), afd.getLength());
            } catch (java.io.IOException compressedOrUnavailable) {
                try { if (afd != null) afd.close(); } catch (Throwable ignored) { }
                afd = null;
                java.io.File cached = materializeAssetAudio(context, asset);
                if (cached == null) return 3_500L;
                retriever.setDataSource(cached.getAbsolutePath());
            }
            String duration = retriever.extractMetadata(
                    android.media.MediaMetadataRetriever.METADATA_KEY_DURATION);
            long parsed = duration == null ? -1L : Long.parseLong(duration);
            return parsed > 0L ? parsed : 3_500L;
        } catch (Throwable ignored) {
            return 3_500L;
        } finally {
            try { retriever.release(); } catch (Throwable ignored) { }
            try { if (afd != null) afd.close(); } catch (Throwable ignored) { }
        }
    }

    private static boolean playCustomOrAsset(String slot, String asset) {
        return enqueueVoice(slot, asset, true);
    }

    /**
     * Should a mod clip for {@code slot} sound in Waze's current voice mode? A clip that is
     * suppressed counts as handled by the caller: returning false would trigger the TTS fallback
     * and, for the over-speed warning, an endless retry as if the audio output were not ready.
     */
    /** The user chose their own recording for this slot: it plays whatever voice Waze has selected. */
    private static boolean hasCustomClip(String slot) {
        Context context = ctx();
        return context != null
                && prefInt(CustomAlertAudio.modeKey(slot), CustomAlertAudio.MODE_DEFAULT) != CustomAlertAudio.MODE_DEFAULT
                && CustomAlertAudio.hasAudio(context, slot);
    }

    private static boolean modVoiceAllowed(String slot) {
        if (!I18n.voiceCanSpeak() && !hasCustomClip(slot)) {
            Log.i(TAG, "mod voice suppressed: Waze has a recorded voice selected slot=" + slot);
            return false;
        }
        if (WazeSoundMode.allowsClip(slot)) return true;
        Log.i(TAG, "mod voice suppressed by Waze sound mode slot=" + slot);
        return false;
    }

    /** Runtime requests are gated again at dequeue; Settings previews bypass the mode gate. */
    private static boolean playModVoice(String slot, String asset) {
        if (!modVoiceAllowed(slot)) return true;
        return enqueueVoice(slot, asset, false);
    }

    /** Settings preview is deliberately deterministic and independent from GPS/route state. */
    static boolean previewCurrentSpeedAudio() {
        return playCustomOrAsset("current_60", voiceDir() + "current_speed_60.mp3");
    }

    /** Settings preview routed through Waze's own guidance TTS/audio policy. */
    static boolean previewNavigationAudio() {
        return WazeTtsBridge.speak("tts.in_200_meters_turn_right");
    }

    private static final class VoiceWorker {
        static final android.os.Handler handler;
        static final android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
        static {
            android.os.HandlerThread thread = new android.os.HandlerThread("WazeGW-voice-queue");
            thread.start();
            handler = new android.os.Handler(thread.getLooper());
        }
    }

    private static boolean enqueueVoice(String slot, String asset, boolean preview) {
        if (ctx() == null || explicitShutdownRequested) return false;
        voiceQueue.offer(new VoiceQueue.Request(slot, asset, preview,
                SystemClock.elapsedRealtime()), SystemClock.elapsedRealtime());
        VoiceWorker.handler.post(drainVoiceQueue);
        return true; // accepted, not necessarily audible yet
    }

    private static boolean voiceStillRelevant(VoiceQueue.Request request) {
        long now = SystemClock.elapsedRealtime();
        if (explicitShutdownRequested || now >= request.expiresAt) return false;
        if (request.preview) return true;
        if (!modEnabled() || !modVoiceAllowed(request.slot)) return false;
        int value = trailingInt(request.slot);
        if (request.slot.startsWith("current_")) {
            return pref("say_limit", true) && voiceSpeedEnabled("say_limit_speed_", value)
                    && stableSpeedLimit.isCurrent(value, now) && hudLimit == value;
        }
        if (request.slot.equals("overspeed")) {
            synchronized (overspeedStateLock) {
                return pref("say_over", true) && wasOver && !overspeedMuted
                        && hudLimit == announcedLimit && stableSpeedLimit.isCurrent(hudLimit, now)
                        && hudSpeed > hudLimit + prefInt("over_margin", OVER_MARGIN);
            }
        }
        return !request.slot.startsWith("next_") || (pref("say_next", true)
                && hudLimit != value && (value < 0 || voiceSpeedEnabled("say_next_speed_", value)));
    }

    private static final Runnable drainVoiceQueue = new Runnable() {
        @Override public void run() {
            VoiceQueue.Request request = voiceQueue.poll(SystemClock.elapsedRealtime());
            if (request == null) { scheduleVoiceDrain(); return; }
            if (!voiceStillRelevant(request)) { finishVoice(request, false); return; }
            try {
                Context context = ctx();
                java.io.File file = null;
                if (context != null && prefInt(CustomAlertAudio.modeKey(request.slot),
                        CustomAlertAudio.MODE_DEFAULT) != CustomAlertAudio.MODE_DEFAULT
                        && CustomAlertAudio.hasAudio(context, request.slot)) {
                    file = CustomAlertAudio.file(context, request.slot);
                }
                if (file == null) {
                    // The packaged clips are recorded in Vietnamese: with a voice of another language use TTS
                    // (translated, or silent when that language has no translation) instead.
                    String voice = I18n.voiceTag();
                    if (voice != null && !"vi".equals(voice)) {
                        throw new java.io.IOException("built-in clips are Vietnamese, voice is " + voice);
                    }
                    // ... and say the limit in km/h, while Waze here shows (and the value is) mph.
                    if (Units.imperial()) throw new java.io.IOException("built-in clips are km/h, Waze uses mph");
                    file = materializeAssetAudio(context, request.asset);
                }
                if (file == null) throw new java.io.IOException("voice source unavailable");
                final java.io.File source = file;
                VoiceWorker.main.post(() -> {
                    if (!voiceStillRelevant(request)) { finishVoice(request, false); return; }
                    try {
                        WazeClipBridge.play(source, request.preview, () -> finishVoice(request, true));
                        Log.i(TAG, "voice submitted to Waze queue slot=" + request.slot);
                        // If the host drops a callback, release our slot. Waze still serializes
                        // actual playback; an old callback cannot release a newer request.
                        VoiceWorker.handler.postDelayed(() -> finishVoice(request, true), 60000L);
                    } catch (Exception error) {
                        Log.w(TAG, "Waze clip queue unavailable slot=" + request.slot, error);
                        voiceQueue.retry(request, SystemClock.elapsedRealtime());
                        scheduleVoiceDrain();
                    }
                });
            } catch (Exception error) {
                Log.w(TAG, "voice source failed slot=" + request.slot, error);
                int value = trailingInt(request.slot);
                boolean mph = Units.imperial();
                String template = request.slot.startsWith("current_")
                        ? (mph ? "core.current_speed_limit_0_miles_per_hour"
                                : "core.current_speed_limit_0_kilometers_per")
                        : (mph ? "core.speed_limit_ahead_0_miles_per_hour"
                                : "core.speed_limit_ahead_0_kilometers_per");
                boolean fallback = voiceStillRelevant(request)
                        && ("overspeed".equals(request.slot)
                        ? WazeTtsBridge.speak("tts.you_are_over_the_speed_limit")
                        : value >= 10 && value <= 120 && WazeTtsBridge.speak(template, value));
                // TTS also enters Waze's own sound queue, never a parallel MediaPlayer.
                finishVoice(request, fallback);
            }
        }
    };

    private static void finishVoice(VoiceQueue.Request request, boolean played) {
        voiceQueue.finish(request, SystemClock.elapsedRealtime(), played);
        scheduleVoiceDrain();
    }

    private static void scheduleVoiceDrain() {
        long delay = voiceQueue.delay(SystemClock.elapsedRealtime());
        if (delay >= 0L) {
            VoiceWorker.handler.removeCallbacks(drainVoiceQueue);
            VoiceWorker.handler.postDelayed(drainVoiceQueue, delay);
        }
    }

    /**
     * AssetManager.openFd() only supports uncompressed APK entries. Play/bundletool is allowed to
     * compress MP3 assets in an AAB split, so Store builds need a private cached file fallback.
     * The cache is disposable and is rebuilt automatically after an app update or cache cleanup.
     */
    private static java.io.File materializeAssetAudio(Context context, String asset) {
        if (context == null || asset == null || asset.length() == 0) return null;
        synchronized (assetAudioCacheLock) {
            java.io.File directory = new java.io.File(context.getCacheDir(), "wazemod_asset_audio");
            if (!directory.exists() && !directory.mkdirs()) return null;
            String leaf = asset.substring(asset.lastIndexOf('/') + 1)
                    .replaceAll("[^A-Za-z0-9._-]", "_");
            long appUpdateStamp = 0L;
            try {
                appUpdateStamp = context.getPackageManager()
                        .getPackageInfo(context.getPackageName(), 0).lastUpdateTime;
            } catch (Throwable ignored) { }
            java.io.File target = new java.io.File(directory,
                    Long.toHexString(appUpdateStamp) + "_"
                            + Integer.toHexString(asset.hashCode()) + "_" + leaf);
            if (target.isFile() && target.length() > 0L) return target;
            java.io.File temporary = new java.io.File(directory, target.getName() + ".tmp");
            if (temporary.exists()) temporary.delete();
            long written = 0L;
            try (java.io.InputStream input = context.getAssets().open(asset);
                 java.io.FileOutputStream output = new java.io.FileOutputStream(temporary)) {
                byte[] buffer = new byte[16 * 1024];
                int count;
                while ((count = input.read(buffer)) >= 0) {
                    written += count;
                    if (written > CustomAlertAudio.MAX_BYTES)
                        throw new java.io.IOException("asset audio too large");
                    output.write(buffer, 0, count);
                }
                output.getFD().sync();
            } catch (Throwable error) {
                temporary.delete();
                Log.w(TAG, "Unable to extract compressed audio asset=" + asset, error);
                return null;
            }
            if (written <= 0L) {
                temporary.delete();
                return null;
            }
            if (target.exists() && !target.delete()) {
                temporary.delete();
                return null;
            }
            if (!temporary.renameTo(target)) {
                temporary.delete();
                return null;
            }
            return target;
        }
    }

    /** True while Waze owns a projected Android Auto renderer/surface. */
    private static boolean isAndroidAutoActive() {
        return aaCarContext != null || AaSpeedo.isSurfaceActive();
    }

}
