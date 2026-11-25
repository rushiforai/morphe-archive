package app.morphed.extension.twitch.ui;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.os.Build;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.Included;
import app.morphed.extension.twitch.Messages;
import app.morphed.extension.twitch.musicfilter.SongRemoval;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.settings.PatchSettings;

/**
 * The patches' parts of the video player's controls, put into the controls themselves (one more child of their
 * view), so they come, fade, go and sit under sheets and menus exactly as the player's own buttons do:
 * <ul>
 *     <li>In full screen, a lock button after the top row's left-hand buttons. Locking hides the controls at
 *     once; touches don't reach the player then, and three quick taps unlock (each tap shows a padlock with the
 *     taps so far). The screen stays horizontal and in full screen however the phone is turned, auto-rotate
 *     or not; the back button unlocks (and goes back, as it would).</li>
 *     <li>While song removal is on for the stream, a pill next to the player's own (uptime, viewers) with what
 *     it is doing.</li>
 * </ul>
 * The controls are React Native: found by their test ids. They are taken down each time they hide and built anew
 * each time they show, so they are looked up again (and our parts put into the new ones) on every frame they
 * aren't there. React Native doesn't lay out a child it doesn't know: ours are sized and placed here.
 */
public final class PlayerOverlay {
    private static final int TAG_KEY = 0x7e000102;
    private static final int GUARD_KEY = 0x7e000103;
    /*
     * Twitch has two players: a React Native one (its views named by test ids) and a native Android one (named by
     * resource ids). Each part is looked for by either name.
     */
    /** The controls of the player (React Native, its vertical view's, and the native player's). */
    private static final String[] OVERLAYS = {"player-controls-overlay", "skyline-controls-overlay", "player_overlay"};
    /** What a tap on the video lands on (it shows and hides the controls). */
    private static final String[] TAP_LAYERS = {"player-controls-tap-layer", "player_view_delegate"};
    private static final String[] BACK = {"player-controls-back", "back_button"};
    private static final String[] SCALE = {"player-controls-scale-video"};
    private static final String[] STATS = {"viewer-stats", "stream_stats_text"};
    /** The player's own pills, each of them also a child of the controls. */
    private static final String STATS_PARTS = "viewer-stats-";
    /** The vertical view's top bar (its controls may have neither a back button nor pills of their own). */
    private static final String[] VERTICAL_TOP_BAR = {"skyline-top-bar"};
    /** The native player's vertical view: its controls are this one Compose view. */
    private static final String COMPOSE_CONTROLS = "player_overlay_container";
    /** Compose's nodes are read at most this often (each read walks its accessibility tree). */
    private static final long COMPOSE_READ_GAP_MS = 150;
    /** The controls' parts are their children (classic); looked for a little deeper for other layouts. */
    private static final int PART_DEPTH = 3;
    private static final long HINT_MS = 1200;
    /** The window is looked through for the controls at most this often while they aren't up. */
    private static final long SEARCH_GAP_MS = 60;
    /** ... and this often while no player is on screen (the home page, the chat alone). */
    private static final long IDLE_SEARCH_GAP_MS = 500;

    private static int testIdKey;
    /** Resource id -> its name (looked up once each: the window is walked often). */
    private static final android.util.SparseArray<String> RESOURCE_NAMES = new android.util.SparseArray<>();

    private final Activity activity;
    private final Theme theme;
    private final ViewGroup decor;
    private final FrameLayout layer;
    private final LockIcon lockButton;
    private final LinearLayout pill;
    private final NoteIcon pillIcon;
    private final TextView pillText;
    private final View shield;
    private final LinearLayout hint;
    private final LockIcon hintIcon;
    private final View[] hintDots = new View[TripleTap.NEEDED];
    private final TripleTap taps = new TripleTap();
    private final int[] at = new int[2], other = new int[2];
    private final Runnable fadeHint, followLater;
    private WeakReference<View> controls = new WeakReference<>(null), tapLayer = new WeakReference<>(null);
    private long searchedAt;
    private WeakReference<View> composeControls = new WeakReference<>(null);
    private final android.graphics.Rect uptime = new android.graphics.Rect();
    private boolean uptimeShown;
    private long uptimeReadAt;
    /** A player's tap layer was seen (it going away, while locked, means the player closed). */
    private boolean hadTapLayer;
    private boolean followQueued;
    private boolean locked;
    private int savedOrientation;
    private long notFullSince; // (uptime ms) locked, but the screen isn't in full screen since
    private boolean orientationHeld; // locked: held horizontal (the app's own wish kept for after)
    /** The controls hidden by the lock (shown again on unlock, if they're still there). */
    private final java.util.List<WeakReference<View>> hiddenControls = new java.util.ArrayList<>();
    private final int[] hostAt = new int[2];
    private SongPillText shownPill;
    private boolean noPillPlaceLogged;
    /** When it last failed (uptime ms), 0 if it hasn't; and the failures told so far (each told once). */
    private long failedAt;
    private int failuresInARow;
    private final java.util.Set<String> failuresShown = new java.util.HashSet<>();

    private PlayerOverlay(Activity activity) {
        this.activity = activity;
        theme = new Theme(activity);
        decor = (ViewGroup) activity.getWindow().getDecorView();
        layer = new FrameLayout(activity);
        layer.setClipChildren(false);
        // Not clickable: touches go through it to the player, except on its own button and the lock's shield.

        shield = new View(activity);
        shield.setVisibility(View.GONE);
        shield.setOnTouchListener((v, event) -> {
            if (event.getActionMasked() == MotionEvent.ACTION_UP) lockedTap();
            return true; // locked: nothing reaches the player
        });
        layer.addView(shield, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        lockButton = new LockIcon(activity, theme.dpf(24));
        lockButton.setOpen(true);
        lockButton.setClickable(true);
        lockButton.setContentDescription("Lock the screen");
        lockButton.setVisibility(View.INVISIBLE);
        lockButton.setOnClickListener(v -> {
            try {
                lock();
            } catch (Throwable t) {
                failed(t);
            }
        });
        lockButton.setLayoutParams(new ViewGroup.LayoutParams(theme.dp(40), theme.dp(40)));

        // As the player's own pills: black, mostly opaque, a white glyph and plain white text.
        pill = new LinearLayout(activity);
        pill.setOrientation(LinearLayout.HORIZONTAL);
        pill.setGravity(Gravity.CENTER_VERTICAL);
        pill.setPadding(theme.dp(5), 0, theme.dp(8), 0);
        pill.setBackground(new Squircle(0xCC000000, theme.dpf(7)));
        pill.setVisibility(View.INVISIBLE);
        pillIcon = new NoteIcon(activity);
        LinearLayout.LayoutParams iconSize = new LinearLayout.LayoutParams(theme.dp(20), theme.dp(20));
        iconSize.rightMargin = theme.dp(3);
        pill.addView(pillIcon, iconSize);
        pillText = new TextView(activity);
        pillText.setTextColor(0xFFFFFFFF);
        pillText.setTextSize(14);
        pillText.setTypeface(TwitchFonts.regular(activity));
        pillText.setIncludeFontPadding(false);
        pillText.setSingleLine(true);
        pillText.setEllipsize(TextUtils.TruncateAt.END);
        pill.addView(pillText, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        pill.setLayoutParams(new ViewGroup.LayoutParams(theme.dp(40), theme.dp(28)));

        hint = new LinearLayout(activity);
        hint.setOrientation(LinearLayout.VERTICAL);
        hint.setGravity(Gravity.CENTER_HORIZONTAL);
        hint.setPadding(theme.dp(18), theme.dp(14), theme.dp(18), theme.dp(14));
        hint.setBackground(new Squircle(0xCC000000, theme.dpf(20)));
        hint.setAlpha(0f);
        hint.setVisibility(View.GONE);
        hintIcon = new LockIcon(activity, theme.dpf(36));
        hint.addView(hintIcon, new LinearLayout.LayoutParams(theme.dp(40), theme.dp(40)));
        LinearLayout dots = new LinearLayout(activity);
        dots.setPadding(0, theme.dp(8), 0, 0);
        for (int i = 0; i < hintDots.length; i++) {
            View dot = new View(activity);
            LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(theme.dp(7), theme.dp(7));
            size.leftMargin = size.rightMargin = theme.dp(3);
            dots.addView(dot, size);
            hintDots[i] = dot;
        }
        hint.addView(dots);
        layer.addView(hint, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        fadeHint = () -> hint.animate().alpha(0f).setDuration(250).withEndAction(() -> hint.setVisibility(View.GONE));
        followLater = () -> {
            followQueued = false;
            followSafely();
        };

        decor.addView(layer, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        guardTouches();
        // Every frame: the controls come, fade, move and go, and so do ours.
        ViewTreeObserver.OnPreDrawListener follow = () -> {
            followSafely();
            return true;
        };
        decor.getViewTreeObserver().addOnPreDrawListener(follow);
        SongRemoval.StatusListener songs = s -> App.onMain(layer::invalidate);
        PatchSettings.Listener settings = (key, on) -> App.onMain(layer::invalidate);
        layer.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                SongRemoval.removeListener(songs);
                PatchSettings.removeListener(settings);
                decor.getViewTreeObserver().removeOnPreDrawListener(follow);
            }
        });
        SongRemoval.addListener(songs);
        PatchSettings.addListener(settings);
    }

    /**
     * While locked, the window's touches go to the shield only, before the screen sees them: the player also
     * reads taps there (a double tap switches its chat mode), past any view on top.
     */
    private void guardTouches() {
        android.view.Window window = activity.getWindow();
        android.view.Window.Callback original = window.getCallback();
        View decorView = activity.getWindow().getDecorView();
        if (decorView.getTag(GUARD_KEY) != null) return; // (guarded already)
        if (original == null) {
            DebugLog.log("PROBLEM Player: the window has no touch callback, a locked screen can't hold back taps");
            return;
        }
        decorView.setTag(GUARD_KEY, Boolean.TRUE);
        window.setCallback((android.view.Window.Callback) java.lang.reflect.Proxy.newProxyInstance(
                android.view.Window.Callback.class.getClassLoader(), new Class<?>[]{android.view.Window.Callback.class},
                (proxy, method, args) -> {
                    if (locked && "dispatchKeyEvent".equals(method.getName()) && args != null && args.length == 1
                            && args[0] instanceof android.view.KeyEvent
                            && ((android.view.KeyEvent) args[0]).getKeyCode() == android.view.KeyEvent.KEYCODE_BACK
                            && ((android.view.KeyEvent) args[0]).getAction() == android.view.KeyEvent.ACTION_DOWN) {
                        try {
                            unlock("back", false); // (and back it goes, as the app does it)
                        } catch (Throwable t) {
                            failed(t);
                        }
                    }
                    if (locked && "dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1
                            && args[0] instanceof MotionEvent) {
                        try {
                            shield.dispatchTouchEvent((MotionEvent) args[0]);
                        } catch (Throwable t) {
                            failed(t);
                        }
                        return true;
                    }
                    if (!locked && "dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1
                            && args[0] instanceof MotionEvent) {
                        try {
                            if (lockButtonTouch((MotionEvent) args[0])) return true;
                        } catch (Throwable t) {
                            failed(t);
                        }
                    }
                    try {
                        return method.invoke(original, args);
                    } catch (java.lang.reflect.InvocationTargetException e) {
                        throw e.getCause();
                    }
                }));
    }

    /** Called on the activity's layout changes (Screens): once a player's controls are there, ours follow them. */
    public static void scan(Activity activity, View root) {
        if (!Included.songRemoval() && !Included.adBlock() && !Included.qualityUnlock() && !Included.highestQuality()) return;
        if (testIdKey == 0) {
            testIdKey = activity.getResources().getIdentifier("react_test_id", "id", activity.getPackageName());
            if (testIdKey == 0) testIdKey = -1;
        }
        View decor = activity.getWindow().getDecorView();
        PlayerOverlay overlay = (PlayerOverlay) decor.getTag(TAG_KEY);
        if (overlay == null) {
            // (the layer is added over the app's content once and stays: adding it lays the window out again)
            View[] found = new View[3];
            find(root, null, found);
            if (found[0] == null && found[2] == null) return;
            overlay = new PlayerOverlay(activity);
            decor.setTag(TAG_KEY, overlay);
        }
        overlay.followSafely();
    }

    /** The screen went away (left, picture in picture): a lock ends with it. */
    public static void paused(Activity activity) {
        PlayerOverlay overlay = (PlayerOverlay) activity.getWindow().getDecorView().getTag(TAG_KEY);
        if (overlay == null || !overlay.locked) return;
        try {
            overlay.unlock("left the screen", false);
        } catch (Throwable t) {
            overlay.failed(t);
        }
    }

    /**
     * The controls on screen and the tap layer under them, in one walk: found[0] the controls, found[1] the tap
     * layer. Views that don't show are passed over (the player keeps old copies of its layouts around).
     */
    private static void find(View view, View skip, View[] found) {
        if (view == skip || view.getVisibility() != View.VISIBLE || (found[0] != null && found[1] != null)) return;
        String id = idOf(view);
        if (id != null) {
            if (found[1] == null && is(id, TAP_LAYERS) && view.getWidth() > 0) found[1] = view;
            // found[2]: the vertical view's controls, drawn by Compose (no children of their own)
            if (found.length > 2 && found[2] == null && COMPOSE_CONTROLS.equals(id) && view.getWidth() > 0
                    && view.getClass().getName().endsWith("ComposeView")) {
                found[2] = view;
                return;
            }
            if (isControls(id)) {
                if (found[0] == null && view.getWidth() > 0) found[0] = view;
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) find(group.getChildAt(i), skip, found);
        }
    }

    /** A view's name: its React Native test id, else its resource id's name, else null. */
    static String idOf(View view) {
        Object tag = testIdKey > 0 ? view.getTag(testIdKey) : null;
        if (tag instanceof String) return (String) tag;
        int id = view.getId();
        if (id == View.NO_ID || (id >>> 24) != 0x7f) return null; // (only the app's own resources)
        String name = RESOURCE_NAMES.get(id);
        if (name == null) {
            try {
                name = view.getResources().getResourceEntryName(id);
            } catch (Exception unnamed) {
                name = "";
            }
            RESOURCE_NAMES.put(id, name);
        }
        return name.isEmpty() ? null : name;
    }

    static boolean is(String id, String[] names) {
        if (id == null) return false;
        for (String name : names) if (name.equals(id)) return true;
        return false;
    }

    /** A shown part of the controls by its name, at most this many levels into them. */
    private static View part(ViewGroup group, String[] id, int depth) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (!alive(child)) continue;
            if (is(idOf(child), id)) return child;
            if (depth > 1 && child instanceof ViewGroup) {
                View found = part((ViewGroup) child, id, depth - 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    static boolean isControls(String id) {
        return is(id, OVERLAYS);
    }

    /** How much of a view shows: its own alpha and its parents' (the controls fade as a whole). */
    private static float shownAlpha(View view) {
        if (view == null || !view.isAttachedToWindow() || !view.isShown()) return 0f;
        float alpha = view.getAlpha();
        for (ViewParent p = view.getParent(); p instanceof View && alpha > 0f; p = p.getParent()) {
            alpha *= ((View) p).getAlpha();
        }
        return alpha;
    }

    private static boolean alive(View view) {
        return view != null && view.isAttachedToWindow() && view.isShown() && view.getWidth() > 0;
    }

    private boolean pictureInPicture() {
        return Build.VERSION.SDK_INT >= 24 && activity.isInPictureInPictureMode();
    }

    private boolean fullScreen() {
        return activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE
                && !pictureInPicture();
    }

    private void followSafely() {
        // It broke and said so: left alone for a moment, then tried again (a player in a passing state, as an ad
        // at the stream's start, mustn't take the lock and pill away for good).
        long left = LockRules.pauseLeft(failedAt, failuresInARow, SystemClock.uptimeMillis());
        if (left > 0) {
            if (!followQueued) {
                followQueued = true;
                layer.postDelayed(followLater, left);
            }
            return;
        }
        try {
            follow();
            failuresInARow = 0; // (worked: a next failure pauses only briefly again)
        } catch (Throwable t) {
            failed(t);
        }
    }

    /** The controls as they are now, looked up again when the ones known are gone. */
    private View currentControls() {
        View known = controls.get();
        if (alive(known)) return known;
        long now = SystemClock.uptimeMillis();
        // Often while a player is on screen (its controls come back any moment), seldom while none is.
        long gap = alive(tapLayer.get()) ? SEARCH_GAP_MS : IDLE_SEARCH_GAP_MS;
        if (now - searchedAt < gap) {
            // Too soon to look again: looked for once more after the gap (no frame may come by itself).
            if (!followQueued) {
                followQueued = true;
                layer.postDelayed(followLater, gap);
            }
            return null;
        }
        searchedAt = now;
        View[] found = new View[3];
        find(decor, layer, found);
        controls = new WeakReference<>(found[0]);
        composeControls = new WeakReference<>(found[2]);
        if (found[1] != null) {
            tapLayer = new WeakReference<>(found[1]);
            hadTapLayer = true;
        }
        return found[0];
    }

    private void follow() {
        View controls = currentControls();
        float alpha = pictureInPicture() ? 0f : shownAlpha(controls);
        boolean shown = alpha > 0.02f && controls instanceof ViewGroup;
        if (locked) holdOrientation();
        // Out of full screen all the same for a while (not just turning): the lock goes with it, never left
        // holding back touches on a screen it isn't for.
        if (locked && !fullScreen()) {
            long now = SystemClock.uptimeMillis();
            if (notFullSince == 0) notFullSince = now;
            if (LockRules.leftFullScreen(notFullSince, now)) unlock("left full screen", false);
        } else {
            notFullSince = 0;
        }
        if (locked && pictureInPicture()) unlock("picture in picture", false);
        else if (locked && hadTapLayer && !alive(tapLayer.get()) && controls == null) {
            unlock("the player closed", false);
        }
        if (locked && controls != null && controls.getVisibility() == View.VISIBLE) hide(controls); // came back
        boolean lockShown = false, pillShown = false;
        if (shown && !locked) {
            ViewGroup group = (ViewGroup) controls;
            View back = part(group, BACK, PART_DEPTH), scale = part(group, SCALE, PART_DEPTH);
            View stats = part(group, STATS, PART_DEPTH);
            lockShown = fullScreen() && placeLock(group, back, scale);
            pillShown = Included.songRemoval() && PatchSettings.songRemoval() && placePill(group, stats, back);
        } else if (!locked && controls == null && Included.songRemoval() && PatchSettings.songRemoval()
                && !pictureInPicture() && alive(composeControls.get())) {
            // (Compose's own fade can't be read: shown while its uptime is)
            pillShown = placePillByUptime(composeControls.get());
        }
        show(lockButton, lockShown);
        if (!lockShown) lockTarget = Integer.MIN_VALUE;
        show(pill, pillShown);
        if (!lockShown) letGo(lockButton);
        if (!pillShown) letGo(pill);
    }

    /**
     * While locked, the screen stays horizontal: when the app asks for another orientation (with auto-rotate on
     * it does as the phone is turned upright, to leave full screen), that's kept for after the lock and the
     * screen is held horizontal again.
     */
    private void holdOrientation() {
        int wanted = activity.getRequestedOrientation();
        if (wanted == ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE) return;
        savedOrientation = wanted;
        activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
        DebugLog.log("Player: the app turned the screen while locked, held horizontal");
    }

    /** Shown or not where it was put; it fades with the controls it's in (their alpha is its parent's). */
    private static void show(View view, boolean shown) {
        int wanted = shown ? View.VISIBLE : View.INVISIBLE; // (never GONE: that would lay the parent out again)
        if (view.getVisibility() != wanted) view.setVisibility(wanted);
    }

    /**
     * Puts our part into the player's controls (as their last child, or right after a given one of them), once:
     * it's moved over when the controls are built anew. Only into views that leave it where it's put (React
     * Native's, a FrameLayout, the native player's ConstraintLayout); false (and told) for others.
     */
    private boolean inject(View view, ViewGroup into, View after) {
        if (view.getParent() == into) return true;
        if (!reactView(into) && !ControlsLayout.takesFreeChildren(classNames(into))) {
            tell("these player controls (" + into.getClass().getName() + ") place their parts themselves,"
                    + " the lock and song pill aren't shown in them");
            return false;
        }
        ViewParent old = view.getParent();
        if (old instanceof ViewGroup) ((ViewGroup) old).removeView(view);
        int index = after == null ? into.getChildCount() : into.indexOfChild(after) + 1;
        view.setVisibility(View.INVISIBLE); // (shown once it's placed)
        into.addView(view, index < 0 ? into.getChildCount() : index, view.getLayoutParams());
        return true;
    }

    /** A view's class name and its superclasses' names, its own first. */
    private static java.util.List<String> classNames(View view) {
        java.util.List<String> names = new java.util.ArrayList<>();
        for (Class<?> c = view.getClass(); c != null && c != View.class; c = c.getSuperclass()) names.add(c.getName());
        return names;
    }

    /** A React Native view (it never lays out children it doesn't know: ours stay where they're put). */
    private static boolean reactView(View view) {
        return testIdKey > 0 && view.getTag(testIdKey) instanceof String;
    }

    /** Our part out of controls that are gone (kept in them, it could end up in a view the player reuses). */
    private static void letGo(View view) {
        ViewParent parent = view.getParent();
        if (parent instanceof ViewGroup && !alive((View) parent)) ((ViewGroup) parent).removeView(view);
    }

    /**
     * Sizes our part (its parent may never lay it out: React Native doesn't lay out a child it doesn't know),
     * and returns where it is laid out on screen; it's moved from there by its translation.
     */
    private void size(View view, int width, int height) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        params.width = width; // (kept for a parent that does lay it out; no request, that would lay it all out)
        params.height = height;
        if (view.getWidth() != width || view.getHeight() != height || view.isLayoutRequested()) {
            view.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            view.layout(view.getLeft(), view.getTop(), view.getLeft() + width, view.getTop() + height);
        }
        ((View) view.getParent()).getLocationOnScreen(hostAt);
        hostAt[0] += view.getLeft();
        hostAt[1] += view.getTop();
    }

    /**
     * The lock button: after the top row's left-hand buttons and anything the player shows after them there (a
     * label as "Intended for certain audiences"), as big as the buttons; it slides along when that comes or goes.
     */
    private boolean placeLock(ViewGroup controls, View back, View scale) {
        View last = scale != null ? scale : back;
        if (last == null) return false;
        if (!inject(lockButton, controls, null)) return false;
        int first = -1;
        if (scale != null && back != null) {
            back.getLocationOnScreen(at);
            first = at[0];
        }
        last.getLocationOnScreen(at);
        int lastLeft = at[0], rowTop = at[1], size = last.getWidth(), rowHeight = last.getHeight();
        int step = ControlsLayout.lockLeft(first, lastLeft, size) - lastLeft; // the row's own spacing
        int rowEnd = lastLeft + size;
        controls.getLocationOnScreen(other);
        int middle = other[0] + controls.getWidth() / 2;
        rowEnd = Math.max(rowEnd, rowEndAfter(controls, rowEnd, rowTop, rowTop + rowHeight, middle, PART_DEPTH));
        int left = rowEnd + (step - size); // the same gap as between the buttons
        boolean wasShown = lockButton.getVisibility() == View.VISIBLE;
        float drawnX = lockButton.getTranslationX(); // (where it is now: an animation may be moving it)
        size(lockButton, size, rowHeight);
        int target = left - hostAt[0];
        lockButton.setTranslationY(rowTop - hostAt[1]);
        if (!wasShown || lockTarget == Integer.MIN_VALUE) {
            lockButton.animate().cancel();
            lockButton.setTranslationX(target);
        } else if (Math.abs(target - lockTarget) > theme.dp(2)) {
            // Something came or went in the row: it slides to its new place instead of jumping.
            lockButton.setTranslationX(drawnX);
            lockButton.animate().translationX(target).setDuration(180).start();
        } else {
            lockButton.setTranslationX(drawnX); // still where it was, or on its way (mustn't be stopped)
        }
        lockTarget = target;
        return true;
    }

    private int lockTarget = Integer.MIN_VALUE;

    /** Where the last thing shown in the top row after the left-hand buttons ends (0 when nothing is). */
    private int rowEndAfter(ViewGroup group, int buttonsRight, int rowTop, int rowBottom, int middle, int depth) {
        int end = 0;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (!alive(child) || child == lockButton || child == pill) continue;
            child.getLocationOnScreen(other);
            if (ControlsLayout.inRowAfterButtons(other[0], other[1], other[0] + child.getWidth(),
                    other[1] + child.getHeight(), buttonsRight, rowTop, rowBottom, middle)) {
                end = Math.max(end, other[0] + child.getWidth());
            } else if (depth > 1 && child instanceof ViewGroup) {
                end = Math.max(end, rowEndAfter((ViewGroup) child, buttonsRight, rowTop, rowBottom, middle, depth - 1));
            }
        }
        return end;
    }

    /** The pill: one more of the player's own pills, after them; or on a line of its own above them. */
    private boolean placePill(ViewGroup controls, View stats, View back) {
        if (!inject(pill, controls, null)) return false;
        refreshPillWords();
        controls.getLocationOnScreen(at);
        int controlsLeft = at[0], controlsRight = at[0] + controls.getWidth();
        int wanted = wantedWidth();
        if (stats == null) {
            // Controls without the player's pills (the vertical view's may be): under the back button or the
            // top bar, at its left; without those too, there's no telling where it wouldn't cover something.
            View above = back != null ? back : part(controls, VERTICAL_TOP_BAR, PART_DEPTH);
            if (above == null) {
                if (!noPillPlaceLogged) {
                    noPillPlaceLogged = true;
                    DebugLog.log("PROBLEM Player: these controls have no place for the song pill");
                }
                return false;
            }
            above.getLocationOnScreen(at);
            int gap = theme.dp(4), left = Math.max(at[0], controlsLeft) + (above == back ? 0 : theme.dp(12));
            place(pill, left, at[1] + above.getHeight() + gap,
                    Math.min(wanted, Math.max(0, controlsRight - theme.dp(12) - left)), theme.dp(28));
            return true;
        }
        stats.getLocationOnScreen(at);
        int statsLeft = at[0], statsTop = at[1], statsRight = at[0] + stats.getWidth(), statsHeight = stats.getHeight();
        // The space the player leaves between its two pills, and the next control in their row.
        int gap = theme.dp(4), nextLeft = controlsRight;
        View firstPill = null;
        for (int i = 0; i < controls.getChildCount(); i++) {
            View child = controls.getChildAt(i);
            if (child == stats || child == pill || child == lockButton || !alive(child)) continue;
            child.getLocationOnScreen(at);
            String id = idOf(child);
            if (id != null && id.startsWith(STATS_PARTS)) {
                if (firstPill == null) {
                    firstPill = child;
                } else {
                    firstPill.getLocationOnScreen(other);
                    int between = at[0] - (other[0] + firstPill.getWidth());
                    if (between > 0 && between < theme.dp(16)) gap = between;
                }
                continue;
            }
            if (ControlsLayout.inRowAfter(at[0], at[1], at[1] + child.getHeight(), statsTop, statsTop + statsHeight,
                    statsRight)) {
                nextLeft = Math.min(nextLeft, at[0]);
            }
        }
        ControlsLayout.Pill spot = ControlsLayout.pill(statsLeft, statsTop, statsRight, statsHeight, gap, nextLeft,
                controlsRight, wanted, shownPill.tone == SongPillText.Tone.PROBLEM);
        if (spot.maxWidth < theme.dp(48) || spot.top < 0 || spot.left < controlsLeft) return false;
        place(pill, spot.left, spot.top, Math.min(wanted, spot.maxWidth), statsHeight);
        return true;
    }

    private SongRemoval.Status pillStatus;
    private SongPillText pillWords;
    private long pillWordsUntil; // when a countdown's next number is due (uptime ms)
    private final Runnable pillTick = this::frameForTick; // a frame, for a countdown's next number

    private void frameForTick() {
        layer.invalidate();
    }
    private int pillWidth = -1;

    /**
     * The pill in the vertical view (Compose controls): after the stream's uptime in the controls' top row, while
     * that shows (it's there only while the controls are up).
     */
    private boolean placePillByUptime(View compose) {
        long now = SystemClock.uptimeMillis();
        if (now - uptimeReadAt >= COMPOSE_READ_GAP_MS) {
            uptimeReadAt = now;
            uptimeShown = ComposeControls.uptime(compose, uptime);
        } else if (!followQueued) {
            followQueued = true; // looked at again once the gap is over (no frame may come by itself)
            layer.postDelayed(followLater, COMPOSE_READ_GAP_MS);
        }
        if (!uptimeShown || uptime.width() <= 0) return false;
        // Compose takes no views into its own: the pill goes right after it, in its parent.
        if (!(compose.getParent() instanceof ViewGroup)) return false;
        if (!inject(pill, (ViewGroup) compose.getParent(), compose)) return false;
        refreshPillWords();
        compose.getLocationOnScreen(at);
        int left = uptime.right + theme.dp(8);
        int room = at[0] + compose.getWidth() - theme.dp(12) - left;
        int height = Math.max(uptime.height(), theme.dp(22));
        if (room < theme.dp(48)) return false;
        place(pill, left, uptime.centerY() - height / 2, Math.min(wantedWidth(), room), height);
        return true;
    }

    /**
     * The pill's words and colors, from song removal's status (worked out again only when it changes, or a
     * countdown's next number is due: a frame is asked for then, none may come by itself).
     */
    private void refreshPillWords() {
        SongRemoval.Status status = SongRemoval.status();
        long now = SystemClock.uptimeMillis();
        if (status != pillStatus || shownPill == null || (pillWordsUntil > 0 && now >= pillWordsUntil)) {
            pillStatus = status;
            pillWords = SongPillText.of(status, SystemClock.elapsedRealtime());
            pillWordsUntil = pillWords.nextTick >= 0 ? now + pillWords.nextTick : 0;
            layer.removeCallbacks(pillTick);
            if (pillWords.nextTick >= 0) layer.postDelayed(pillTick, pillWords.nextTick);
        }
        SongPillText words = pillWords;
        if (shownPill == null || !words.text.equals(shownPill.text) || words.tone != shownPill.tone) {
            shownPill = words;
            pillWidth = -1;
            pillText.setText(words.text);
            pillIcon.setColor(words.tone == SongPillText.Tone.PROBLEM ? 0xFFFF6B6B : 0xFFFFFFFF);
            pillText.setTextColor(words.tone == SongPillText.Tone.PROBLEM ? 0xFFFFB3B3 : 0xFFFFFFFF);
        }
    }

    /** The pill's width with its whole text (measured again only when the text changes). */
    private int wantedWidth() {
        if (pillWidth < 0) {
            float text = pillText.getPaint().measureText(shownPill.text);
            pillWidth = pill.getPaddingLeft() + pill.getPaddingRight() + theme.dp(23) + (int) Math.ceil(text) + 1;
        }
        return pillWidth;
    }

    /** Our part at this place on screen, this big, in the controls it was put into. */
    private void place(View view, int screenX, int screenY, int width, int height) {
        size(view, width, height);
        view.setTranslationX(screenX - hostAt[0]);
        view.setTranslationY(screenY - hostAt[1]);
    }

    private void lock() {
        if (locked) return;
        // The player's controls close as they would on a tap on the video (before the guard takes the window's
        // touches, so that tap reaches the player), and they're gone at once instead of fading out; nothing
        // brings them back until unlocked.
        View shownControls = controls.get();
        if (alive(shownControls)) tapVideo();
        locked = true;
        taps.reset();
        if (shownControls != null && shownControls.getVisibility() == View.VISIBLE) hide(shownControls);
        // Held horizontal, whichever way the phone is turned (with auto-rotate on, the app itself would leave
        // full screen on its own when the phone is held upright: that's held off too, see holdOrientation).
        orientationHeld = true;
        savedOrientation = activity.getRequestedOrientation();
        activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
        shield.setVisibility(View.VISIBLE);
        catchBack(true);
        show(lockButton, false);
        show(pill, false);
        hintIcon.setOpen(false);
        showHint(0);
        DebugLog.log("Player: screen locked");
    }

    /** The controls out of sight at once (they'd fade); shown again on unlock if they're still there. */
    /**
     * Back while locked unlocks, then goes back as it would. Twitch targets Android 16, where back (the gesture
     * and the button) no longer comes as a key event: it's taken here first, on Android 13 and later.
     */
    private void catchBack(boolean on) {
        if (Build.VERSION.SDK_INT < 33) return; // (older: the key event, see guardTouches)
        android.window.OnBackInvokedDispatcher dispatcher = activity.getOnBackInvokedDispatcher();
        if (on) {
            if (backCallback == null) {
                backCallback = (android.window.OnBackInvokedCallback) () -> {
                    try {
                        unlock("back", false); // (this callback is let go of with it)
                        activity.onBackPressed(); // back goes on as it would
                    } catch (Throwable t) {
                        failed(t);
                    }
                };
            }
            dispatcher.registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_OVERLAY,
                    (android.window.OnBackInvokedCallback) backCallback);
        } else if (backCallback != null) {
            dispatcher.unregisterOnBackInvokedCallback((android.window.OnBackInvokedCallback) backCallback);
        }
    }

    private Object backCallback; // (an OnBackInvokedCallback: that class is only there on Android 13 and later)

    private void hide(View view) {
        if (!view.isAttachedToWindow()) return; // (a view the player let go of may be reused: left alone)
        view.setVisibility(View.INVISIBLE);
        hiddenControls.add(new WeakReference<>(view));
    }

    /** A screen lock problem that doesn't stop it, told on screen once (and in the log). */
    private void tell(String text) {
        if (!told.add(text)) return;
        DebugLog.log("PROBLEM Screen lock: " + text);
        Toast.makeText(activity, "Screen lock: " + text, Toast.LENGTH_LONG).show();
    }

    private final java.util.Set<String> told = new java.util.HashSet<>();

    /**
     * A touch on the lock button is taken here, before the window hands it on: the button sits inside React
     * Native's views, which give every touch to the app's JavaScript and may have a view of theirs above it that
     * takes it first. The whole gesture is the button's; a tap (let go on it) locks.
     */
    private boolean lockButtonTouch(MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            buttonGesture = lockButton.getVisibility() == View.VISIBLE && shownAlpha(lockButton) > 0.5f
                    && onButton(event);
            buttonFinger = event.getPointerId(0);
            buttonTap = buttonGesture;
            if (buttonGesture) lockButton.setPressed(true);
            return buttonGesture;
        }
        if (!buttonGesture) return false;
        if (action == MotionEvent.ACTION_POINTER_UP && event.getPointerId(event.getActionIndex()) == buttonFinger) {
            buttonTap = false; // the finger that pressed it went up elsewhere: no tap, whatever lifts last
            lockButton.setPressed(false);
        }
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            buttonGesture = false;
            lockButton.setPressed(false);
            if (action == MotionEvent.ACTION_UP && buttonTap && event.getPointerId(0) == buttonFinger
                    && onButton(event)) {
                lockButton.performClick();
            }
        }
        return true;
    }

    private boolean buttonGesture, buttonTap;
    private int buttonFinger;
    private final android.graphics.Rect buttonRect = new android.graphics.Rect();

    /** Whether the touch is on the lock button as it shows on screen (a little slack around it, as a finger). */
    private boolean onButton(MotionEvent event) {
        if (!lockButton.isAttachedToWindow()) return false;
        decor.getLocationOnScreen(other);
        // The log window, dragged over the button, is above it: the touch is the window's.
        if (LogWindow.covers(event.getX() + other[0], event.getY() + other[1])) return false;
        lockButton.getLocationOnScreen(at);
        int slack = theme.dp(6);
        buttonRect.set(at[0] - slack, at[1] - slack, at[0] + lockButton.getWidth() + slack,
                at[1] + lockButton.getHeight() + slack);
        return buttonRect.contains(Math.round(event.getX() + other[0]), Math.round(event.getY() + other[1]));
    }

    private void lockedTap() {
        int count = taps.tap(SystemClock.uptimeMillis());
        if (count >= TripleTap.NEEDED) unlock("three taps", true);
        else showHint(count);
    }

    private void unlock(String why, boolean byUser) {
        if (!locked) return;
        locked = false;
        taps.reset();
        shield.setVisibility(View.GONE);
        catchBack(false);
        // Back to the orientation the app wants: the one from before, or what it asked for while locked.
        if (orientationHeld && activity.getRequestedOrientation() == ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE) {
            activity.setRequestedOrientation(savedOrientation);
        }
        orientationHeld = false;
        boolean controlsBack = false;
        for (WeakReference<View> hidden : hiddenControls) {
            View view = hidden.get();
            // (only what's still as the lock left it: the player may have taken it down meanwhile, GONE)
            if (view == null || view.getVisibility() != View.INVISIBLE) continue;
            view.setVisibility(View.VISIBLE);
            if (shownAlpha(view) > 0.02f) controlsBack = true;
        }
        hiddenControls.clear();
        layer.removeCallbacks(fadeHint);
        if (byUser) {
            // The padlock opens for a moment, and the controls come back (as on a tap on the video).
            hintIcon.setOpen(true);
            showHint(TripleTap.NEEDED);
            if (!controlsBack && !alive(controls.get())) tapVideo();
        } else {
            fadeHint.run();
        }
        DebugLog.log("Player: screen unlocked (" + why + ")");
    }

    /**
     * A tap on the video, as the viewer's finger would make it: the player shows or hides its controls. Made at
     * a quarter of the video's width, half its height: clear of the play button in the middle and of the rows.
     */
    private void tapVideo() {
        View tap = tapLayer.get();
        if (!alive(tap)) return;
        tap.getLocationOnScreen(at);
        decor.getLocationOnScreen(other);
        float x = at[0] - other[0] + tap.getWidth() * 0.25f, y = at[1] - other[1] + tap.getHeight() * 0.5f;
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 50, MotionEvent.ACTION_UP, x, y, 0);
        try {
            decor.dispatchTouchEvent(down);
            decor.dispatchTouchEvent(up);
        } finally {
            down.recycle();
            up.recycle();
        }
    }

    /** The biggest picture the player draws on screen (its TextureView or SurfaceView), or null. */
    private static final android.graphics.Rect VISIBLE = new android.graphics.Rect();
    private static final long[] bestArea = {0};

    private static long shownArea(android.graphics.Rect rect) {
        return (long) rect.width() * rect.height();
    }

    /** The video that shows the most on screen, or null. */
    private static View largestVideo(View root) {
        bestArea[0] = 0;
        return largestVideo(root, null);
    }

    private static View largestVideo(View view, View best) {
        if (view.getVisibility() != View.VISIBLE) return best;
        if ((view instanceof android.view.TextureView || view instanceof android.view.SurfaceView)
                && view.isShown() && view.getGlobalVisibleRect(VISIBLE) && shownArea(VISIBLE) > bestArea[0]) {
            best = view; // (by how much of it shows: one pushed off screen doesn't count)
            bestArea[0] = shownArea(VISIBLE);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) best = largestVideo(group.getChildAt(i), best);
        }
        return best;
    }

    /** The padlock in the middle, with the taps so far as filled dots; it fades after a moment. */
    private void showHint(int count) {
        for (int i = 0; i < hintDots.length; i++) {
            hintDots[i].setBackground(new Squircle(i < count ? 0xFFFFFFFF : 0x59FFFFFF, theme.dpf(3.5f)));
        }
        hint.animate().cancel();
        // Over the middle of the video (not of the screen: the chat may take a column beside it).
        View video = largestVideo(decor);
        if (video == null) video = tapLayer.get();
        android.graphics.Rect shows = new android.graphics.Rect(), window = new android.graphics.Rect();
        if (alive(video) && video.getGlobalVisibleRect(shows) && layer.getGlobalVisibleRect(window)) {
            hint.setTranslationX(shows.exactCenterX() - window.exactCenterX());
            hint.setTranslationY(shows.exactCenterY() - window.exactCenterY());
        } else {
            hint.setTranslationX(0);
            hint.setTranslationY(0);
        }
        hint.setVisibility(View.VISIBLE);
        hint.setAlpha(1f);
        layer.removeCallbacks(fadeHint);
        layer.postDelayed(fadeHint, HINT_MS);
    }

    /** One step of undoing after a failure; the failure itself is told already, the next step goes on. */
    private static void attempt(Runnable step) {
        try {
            step.run();
        } catch (Throwable ignored) {
            // (told with the failure that brought it here)
        }
    }

    private void failed(Throwable t) {
        Log.e(App.TAG, "The player's lock and song pill failed", t);
        try {
            if (locked) unlock("an error", false); // never left locked without a way out
        } catch (Throwable again) {
            // (whatever unlock didn't get to is undone below)
        }
        // Each part undone on its own, whether the lock got that far or not: nothing is left held.
        locked = false;
        buttonGesture = false;
        attempt(() -> shield.setVisibility(View.GONE));
        attempt(() -> lockButton.setPressed(false));
        for (WeakReference<View> hidden : hiddenControls) {
            View view = hidden.get();
            if (view != null) attempt(() -> {
                if (view.getVisibility() == View.INVISIBLE) view.setVisibility(View.VISIBLE);
            });
        }
        hiddenControls.clear();
        attempt(() -> {
            if (orientationHeld) activity.setRequestedOrientation(savedOrientation);
        });
        orientationHeld = false;
        attempt(() -> catchBack(false));
        attempt(() -> show(lockButton, false));
        attempt(() -> show(pill, false));
        failedAt = Math.max(1, SystemClock.uptimeMillis());
        failuresInARow++;
        lockTarget = Integer.MIN_VALUE; // (placed afresh when it comes back)
        notFullSince = 0;
        String message = Messages.of(t);
        // Told once each (it keeps being tried again all the same); a few kinds at most, in case the words vary.
        if (failuresShown.size() >= 8 || !failuresShown.add(message)) {
            Log.w(App.TAG, "The player's lock and song pill failed again (" + failuresInARow + " in a row): " + message);
            return;
        }
        DebugLog.log("PROBLEM Player overlay: " + Log.getStackTraceString(t));
        Toast.makeText(activity, "The screen lock and song pill failed (tried again in a moment): " + message,
                Toast.LENGTH_LONG).show();
    }
}
