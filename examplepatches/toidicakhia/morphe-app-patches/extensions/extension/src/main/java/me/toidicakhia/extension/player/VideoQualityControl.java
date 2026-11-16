package me.toidicakhia.extension.player;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Overlay settings button for the BetterPlayer video quality.
 *
 * The button follows the bounds of the video surface, so it stays inside the
 * player area (also in fullscreen). Tapping it opens a small menu listing the
 * available quality presets.
 *
 * Visibility is driven by the exact state of the player's control bar. Flutter
 * only exposes that state through its semantics tree, so the engine semantics
 * are switched on from Java (no accessibility service required) and the tree
 * is polled for the pause/play button that the player centres over the video.
 */
public final class VideoQualityControl {

    private static final String[] LABELS = {"Tự động", "1080p", "720p", "480p", "360p"};
    private static final int[] WIDTHS = {0, 1920, 1280, 854, 640};
    private static final int[] HEIGHTS = {0, 1080, 720, 480, 360};
    private static final long CONTROLS_TIMEOUT_MS = 2000L;

    private static final int COLOR_PANEL = 0xF2141414;
    private static final int COLOR_STROKE = 0x33FFFFFF;
    private static final int COLOR_TITLE = 0xB3FFFFFF;
    private static final int COLOR_TEXT = 0xFFFFFFFF;
    private static final int COLOR_ACCENT = 0xFF4FC3F7;

    private static final List<WeakReference<Object>> PLAYERS = new CopyOnWriteArrayList<>();
    private static final List<WeakReference<View>> TOUCH_WATCHED = new CopyOnWriteArrayList<>();
    private static final Handler HANDLER = new Handler(Looper.getMainLooper());
    private static final Runnable REFRESH = VideoQualityControl::refreshVisibility;
    private static final View.OnTouchListener TOUCH_WATCHER = VideoQualityControl::handleTouch;

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static TextView button;
    private static View panel;
    private static View scrim;
    private static boolean panelOpen;
    private static final Map<Object, PlaybackSnapshot> SNAPSHOTS =
        Collections.synchronizedMap(new WeakHashMap<>());

    private static volatile int qualityIndex = 0;
    private static volatile int appWidth;
    private static volatile int appHeight;
    private static volatile int appBitrate;
    private static boolean internalChange;
    private static Object semanticsBridge;
    private static Object flutterJni;
    private static boolean semanticsTried;
    private static long lastSemanticsAttempt;
    private static int areaLeft;
    private static int areaTop;
    private static int areaWidth;
    private static int areaHeight;
    private static int lastAreaLeft = -1;
    private static int lastAreaTop = -1;
    private static int lastAreaWidth = -1;
    private static int lastAreaHeight = -1;
    private static long lastInteraction;
    private static boolean lastActive;

    private VideoQualityControl() {
    }

    /**
     * Returns the parameters that the patched BetterPlayer.setTrackParameters
     * call should apply.
     *
     * The "Tự động" preset keeps the values requested by the app so its own
     * quality menu and limits keep working. Any other preset overrides them.
     */
    public static int[] resolve(int width, int height, int bitrate) {
        if (!internalChange && width > 0 && height > 0) {
            appWidth = width;
            appHeight = height;
            appBitrate = bitrate;
        }
        int index = qualityIndex;
        if (index == 0) {
            return new int[]{width, height, bitrate};
        }
        return new int[]{WIDTHS[index], HEIGHTS[index], 0};
    }

    public static void install(Activity activity) {
        if (activity == null) {
            return;
        }
        activityRef = new WeakReference<>(activity);
        semanticsTried = false;
        semanticsBridge = null;
        HANDLER.post(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            if (activity.isInPictureInPictureMode()) {
                closePanel();
                if (button != null) {
                    button.setVisibility(View.GONE);
                }
                return;
            }
            ensureButton(activity);
            if (button != null) {
                button.setVisibility(View.GONE);
            }
            attachTouchWatcher(activity);
            scheduleRefresh();
        });
    }

    public static void register(Object player) {
        if (player == null) {
            return;
        }
        for (WeakReference<Object> reference : PLAYERS) {
            if (reference.get() == player) {
                return;
            }
        }
        PLAYERS.add(new WeakReference<>(player));
        lastInteraction = SystemClock.uptimeMillis();
        scheduleRefresh();
    }

    public static void unregister(Object player) {
        for (Iterator<WeakReference<Object>> iterator = PLAYERS.iterator(); iterator.hasNext(); ) {
            Object registered = iterator.next().get();
            if (registered == null || registered == player) {
                iterator.remove();
            }
        }
        scheduleRefresh();
    }

    private static boolean ensureButton(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null) {
            return false;
        }
        if (panel != null && panel.getParent() != content) {
            closePanel();
        }
        if (button == null) {
            button = createButton(activity);
        }
        if (button.getParent() != content) {
            if (button.getParent() instanceof ViewGroup) {
                ((ViewGroup) button.getParent()).removeView(button);
            }
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            );
            params.gravity = Gravity.TOP | Gravity.START;
            content.addView(button, params);
        }
        return positionButton(activity, content);
    }

    private static TextView createButton(Activity activity) {
        TextView view = new TextView(activity);
        view.setText("\u2699");
        view.setTextColor(Color.WHITE);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        view.setShadowLayer(3f, 0f, 1f, 0x99000000);
        view.setGravity(Gravity.CENTER);
        view.setMinWidth(dp(activity, 34));
        view.setMinHeight(dp(activity, 34));
        view.setFocusable(false);
        view.setClickable(true);
        view.setAlpha(0.92f);
        view.setOnClickListener(v -> {
            Activity current = activityRef.get();
            if (current == null) {
                return;
            }
            if (panelOpen) {
                closePanel();
            } else {
                showPanel(current);
            }
        });

        return view;
    }

    /**
     * Opens the quality menu above the settings button. A transparent scrim
     * behind it closes the menu when the user taps anywhere else.
     */
    private static void showPanel(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null || panelOpen) {
            return;
        }
        panelOpen = true;

        removeFromParent(panel);
        removeFromParent(scrim);

        scrim = new View(activity);
        scrim.setBackgroundColor(0x33000000);
        scrim.setClickable(true);
        scrim.setOnClickListener(v -> closePanel());
        content.addView(scrim, new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        ));

        panel = createPanel(activity);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.gravity = Gravity.TOP | Gravity.START;
        content.addView(panel, params);

        if (button != null) {
            ViewGroup.LayoutParams buttonParams = button.getLayoutParams();
            content.removeView(button);
            content.addView(button, buttonParams);
            button.setVisibility(View.VISIBLE);
        }

        positionPanel(activity, content);
    }

    private static LinearLayout createPanel(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(dp(activity, 8), dp(activity, 6), dp(activity, 8), dp(activity, 6));
        GradientDrawable background = new GradientDrawable();
        background.setColor(COLOR_PANEL);
        background.setCornerRadius(dp(activity, 10));
        background.setStroke(dp(activity, 1), COLOR_STROKE);
        layout.setBackground(background);

        TextView title = new TextView(activity);
        title.setText("Cài đặt video");
        title.setTextColor(COLOR_TITLE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        title.setPadding(dp(activity, 6), dp(activity, 2), dp(activity, 6), dp(activity, 6));
        layout.addView(title);

        for (int i = 0; i < LABELS.length; i++) {
            LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                dp(activity, 148),
                dp(activity, 34)
            );
            layout.addView(createRow(activity, i), rowParams);
        }
        return layout;
    }

    /**
     * Reflects the quality requested by the app itself, so "Tự động" can show
     * what the app will actually use (for example "Tự động (720p)").
     */
    private static String autoLabel() {
        int height = appHeight;
        String suffix;
        if (height >= 1000) {
            suffix = "1080p";
        } else if (height >= 700) {
            suffix = "720p";
        } else if (height >= 460) {
            suffix = "480p";
        } else if (height >= 340) {
            suffix = "360p";
        } else if (height > 0) {
            suffix = height + "p";
        } else {
            return LABELS[0];
        }
        return LABELS[0] + " (" + suffix + ")";
    }

    private static LinearLayout createRow(Activity activity, int index) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(activity, 8), 0, dp(activity, 8), 0);
        row.setClickable(true);
        if (index == qualityIndex) {
            GradientDrawable selected = new GradientDrawable();
            selected.setColor(0x1A4FC3F7);
            selected.setCornerRadius(dp(activity, 6));
            row.setBackground(selected);
        }
        row.setOnClickListener(v -> selectQuality(index));

        TextView label = new TextView(activity);
        label.setText(index == 0 && qualityIndex == 0 ? autoLabel() : LABELS[index]);
        label.setTextColor(index == qualityIndex ? COLOR_ACCENT : COLOR_TEXT);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        row.addView(label, new LinearLayout.LayoutParams(
            0,
            ViewGroup.LayoutParams.WRAP_CONTENT,
            1f
        ));

        TextView check = new TextView(activity);
        check.setText("\u2713");
        check.setTextColor(COLOR_ACCENT);
        check.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        check.setVisibility(index == qualityIndex ? View.VISIBLE : View.INVISIBLE);
        row.addView(check);

        return row;
    }

    private static void positionPanel(Activity activity, ViewGroup content) {
        if (panel == null || button == null) {
            return;
        }
        FrameLayout.LayoutParams buttonParams = (FrameLayout.LayoutParams) button.getLayoutParams();
        int buttonLeft = buttonParams == null ? 0 : buttonParams.leftMargin;
        int buttonTop = buttonParams == null ? 0 : buttonParams.topMargin;
        int buttonWidth = button.getWidth() > 0 ? button.getWidth() : button.getMeasuredWidth();
        int buttonHeight = button.getHeight() > 0 ? button.getHeight() : button.getMeasuredHeight();

        panel.measure(
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED)
        );
        int panelWidth = panel.getMeasuredWidth();
        int panelHeight = panel.getMeasuredHeight();

        int left = buttonLeft + buttonWidth - panelWidth;
        int top = buttonTop - panelHeight - dp(activity, 6);
        int minTop = areaTop + dp(activity, 4);
        if (top < minTop) {
            int centeredTop = areaTop + (areaHeight - panelHeight) / 2;
            if (centeredTop >= minTop) {
                left = buttonLeft - panelWidth - dp(activity, 6);
                top = centeredTop;
            } else {
                top = buttonTop + buttonHeight + dp(activity, 6);
            }
        }
        left = Math.max(dp(activity, 4), Math.min(left, content.getWidth() - panelWidth - dp(activity, 4)));
        top = Math.max(dp(activity, 4), Math.min(top, content.getHeight() - panelHeight - dp(activity, 4)));

        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) panel.getLayoutParams();
        if (params == null) {
            params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            );
        }
        params.gravity = Gravity.TOP | Gravity.START;
        params.leftMargin = left;
        params.topMargin = top;
        panel.setLayoutParams(params);
    }

    private static void closePanel() {
        panelOpen = false;
        removeFromParent(panel);
        removeFromParent(scrim);
        panel = null;
        scrim = null;
        lastInteraction = SystemClock.uptimeMillis();
        HANDLER.removeCallbacks(REFRESH);
        HANDLER.post(REFRESH);
    }

    private static void removeFromParent(View view) {
        if (view != null && view.getParent() instanceof ViewGroup) {
            ((ViewGroup) view.getParent()).removeView(view);
        }
    }

    private static void selectQuality(int index) {
        qualityIndex = index;
        for (WeakReference<Object> reference : PLAYERS) {
            Object player = reference.get();
            if (player != null) {
                applyTo(player);
            }
        }
        closePanel();
    }

    /**
     * Places the button on the bottom-right corner of the video surface.
     * When the player is backed by a Flutter platform view its window bounds
     * are used. Texture based players have no Android view, so the usual
     * VTVGo layout (full width 16:9 under the app bar) is assumed instead.
     */
    private static boolean positionButton(Activity activity, ViewGroup content) {
        View player = findPlayerView(activity);
        int contentWidth = content.getWidth();
        int contentHeight = content.getHeight();
        if (contentWidth <= 0 || contentHeight <= 0) {
            return false;
        }

        areaLeft = 0;
        areaTop = 0;
        areaWidth = contentWidth;
        areaHeight = contentHeight;
        if (player != null && player.getWidth() > 0 && player.getHeight() > 0) {
            int[] playerLocation = new int[2];
            int[] contentLocation = new int[2];
            player.getLocationOnScreen(playerLocation);
            content.getLocationOnScreen(contentLocation);
            areaLeft = playerLocation[0] - contentLocation[0];
            areaTop = playerLocation[1] - contentLocation[1];
            areaWidth = player.getWidth();
            areaHeight = player.getHeight();
        } else if (contentWidth < contentHeight) {
            // Texture based player: the video is a full width 16:9 surface
            // below the app bar.
            areaTop = statusBarHeight(activity) + dp(activity, 60);
            areaHeight = Math.round(contentWidth * 9f / 16f);
        }

        if (player != null && lastAreaWidth > 0) {
            boolean moved = Math.abs(areaLeft - lastAreaLeft) > dp(activity, 2)
                || Math.abs(areaTop - lastAreaTop) > dp(activity, 2)
                || Math.abs(areaWidth - lastAreaWidth) > dp(activity, 2)
                || Math.abs(areaHeight - lastAreaHeight) > dp(activity, 2);
            if (moved) {
                // Entering/leaving fullscreen or a layout change: the app
                // shows its controls for those transitions too.
                lastInteraction = SystemClock.uptimeMillis();
            }
        }
        lastAreaLeft = areaLeft;
        lastAreaTop = areaTop;
        lastAreaWidth = areaWidth;
        lastAreaHeight = areaHeight;

        button.measure(
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED)
        );
        int buttonWidth = button.getMeasuredWidth();
        int buttonHeight = button.getMeasuredHeight();

        // Sit next to the player's own fullscreen icon: same baseline, one
        // icon width to its left.
        int left = areaLeft + areaWidth - buttonWidth - dp(activity, 35);
        int top = areaTop + areaHeight - buttonHeight - dp(activity, 4);
        left = Math.max(dp(activity, 4), Math.min(left, contentWidth - buttonWidth - dp(activity, 4)));
        top = Math.max(dp(activity, 4), Math.min(top, contentHeight - buttonHeight - dp(activity, 4)));

        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) button.getLayoutParams();
        if (params == null) {
            params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            );
        }
        params.gravity = Gravity.TOP | Gravity.START;
        params.leftMargin = left;
        params.topMargin = top;
        button.setLayoutParams(params);

        if (panelOpen) {
            positionPanel(activity, content);
        }
        return true;
    }

    /**
     * Finds the native surface that renders the video. Flutter adds it as a
     * child of the FlutterView, positioned exactly over the player widget.
     */
    private static View findPlayerView(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        ViewGroup flutterView = content == null ? null : findFlutterView(content);
        if (flutterView == null) {
            return null;
        }
        View best = null;
        int bestArea = 0;
        for (int i = 0; i < flutterView.getChildCount(); i++) {
            View child = flutterView.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) {
                continue;
            }
            if (isFlutterRenderSurface(child)) {
                continue;
            }
            int area = child.getWidth() * child.getHeight();
            if (area > bestArea) {
                best = child;
                bestArea = area;
            }
        }
        return best;
    }

    /**
     * The Flutter view class name is obfuscated in release builds, so it is
     * identified by its rendering surface child instead.
     */
    private static ViewGroup findFlutterView(ViewGroup root) {
        for (int i = 0; i < root.getChildCount(); i++) {
            View child = root.getChildAt(i);
            if (!(child instanceof ViewGroup) || child == button || child == panel || child == scrim) {
                continue;
            }
            ViewGroup group = (ViewGroup) child;
            for (int j = 0; j < group.getChildCount(); j++) {
                if (isFlutterRenderSurface(group.getChildAt(j))) {
                    return group;
                }
            }
        }
        return null;
    }

    /**
     * Watches taps without consuming them, so the button appears together
     * with the player's own controls and hides again after a few seconds.
     */
    private static void attachTouchWatcher(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        ViewGroup flutterView = content == null ? null : findFlutterView(content);
        if (flutterView == null) {
            return;
        }
        watchTouches(flutterView);
        for (int i = 0; i < flutterView.getChildCount(); i++) {
            View child = flutterView.getChildAt(i);
            if (child != null && !isFlutterRenderSurface(child)) {
                watchTouches(child);
            }
        }
    }

    private static void watchTouches(View view) {
        if (view == null || view == button || view == panel || view == scrim) {
            return;
        }
        for (WeakReference<View> reference : TOUCH_WATCHED) {
            if (reference.get() == view) {
                return;
            }
        }
        TOUCH_WATCHED.add(new WeakReference<>(view));
        view.setOnTouchListener(TOUCH_WATCHER);
    }

    private static boolean handleTouch(View watched, MotionEvent event) {
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            lastInteraction = SystemClock.uptimeMillis();
            HANDLER.removeCallbacks(REFRESH);
            HANDLER.post(REFRESH);
        }
        return false;
    }

    private static boolean isFlutterRenderSurface(View view) {
        return view instanceof SurfaceView
            || view instanceof TextureView
            || view instanceof ImageView;
    }

    /**
     * Turns Flutter semantics on through the engine, so the control bar nodes
     * are available even when no accessibility service is running.
     */
    private static void enableSemantics(Activity activity) {
        if (semanticsTried) {
            return;
        }
        semanticsTried = true;
        try {
            ViewGroup content = activity.findViewById(android.R.id.content);
            ViewGroup flutterView = content == null ? null : findFlutterView(content);
            if (flutterView == null) {
                return;
            }
            for (Field field : flutterView.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(flutterView);
                if (value != null && isNamed(value.getClass(), "io.flutter.view.d")) {
                    semanticsBridge = value;
                    break;
                }
            }
            flutterJni = findNestedFieldValue(
                flutterView, "io.flutter.embedding.engine.FlutterJNI"
            );
            if (flutterJni != null) {
                Method method = flutterJni.getClass().getMethod("setSemanticsEnabled", boolean.class);
                method.invoke(flutterJni, true);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void reenableSemantics() {
        long now = SystemClock.uptimeMillis();
        if (now - lastSemanticsAttempt < 2000) {
            return;
        }
        lastSemanticsAttempt = now;
        try {
            Method method = flutterJni.getClass().getMethod("setSemanticsEnabled", boolean.class);
            method.invoke(flutterJni, true);
        } catch (Throwable ignored) {
        }
    }

    private static Object findNestedFieldValue(Object target, String typeName) {
        Class<?> type = target.getClass();
        while (type != null) {
            for (Field field : type.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object value = field.get(target);
                    if (value == null) {
                        continue;
                    }
                    if (isNamed(value.getClass(), typeName)) {
                        return value;
                    }
                    Class<?> innerType = value.getClass();
                    while (innerType != null) {
                        for (Field inner : innerType.getDeclaredFields()) {
                            try {
                                inner.setAccessible(true);
                                Object nested = inner.get(value);
                                if (nested != null && isNamed(nested.getClass(), typeName)) {
                                    return nested;
                                }
                            } catch (Throwable ignored) {
                            }
                        }
                        innerType = innerType.getSuperclass();
                    }
                } catch (Throwable ignored) {
                }
            }
            type = type.getSuperclass();
        }
        return null;
    }

    private static boolean isNamed(Class<?> type, String name) {
        while (type != null) {
            if (name.equals(type.getName())) {
                return true;
            }
            type = type.getSuperclass();
        }
        return false;
    }

    /**
     * Reads Flutter's own semantics tree and reports whether the player is
     * currently showing small clickable controls (pause / fullscreen).
     */
    private static Boolean readControlsVisible(Activity activity) {
        if (semanticsBridge == null) {
            return null;
        }
        try {
            HashMap<?, ?> nodes = null;
            for (Field field : semanticsBridge.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(semanticsBridge);
                if (value instanceof HashMap && !((HashMap<?, ?>) value).isEmpty()) {
                    Object first = ((HashMap<?, ?>) value).values().iterator().next();
                    if (first != null && isNamed(first.getClass(), "io.flutter.view.c")) {
                        nodes = (HashMap<?, ?>) value;
                        break;
                    }
                }
            }
            if (nodes == null) {
                return null;
            }
            Method create = semanticsBridge.getClass().getMethod(
                "createAccessibilityNodeInfo", int.class
            );
            ViewGroup content = activity.findViewById(android.R.id.content);
            ViewGroup flutterView = content == null ? null : findFlutterView(content);
            if (flutterView == null) {
                return null;
            }
            int[] location = new int[2];
            flutterView.getLocationOnScreen(location);
            int left = location[0] + areaLeft;
            int top = location[1] + areaTop;
            int right = left + areaWidth;
            int bottom = top + areaHeight;
            int expectedRight = right - dp(activity, 8);
            int expectedBottom = bottom - dp(activity, 8);
            int minSize = dp(activity, 18);
            int maxSize = dp(activity, 36);
            Rect rect = new Rect();
            for (Object key : nodes.keySet()) {
                AccessibilityNodeInfo node = (AccessibilityNodeInfo) create.invoke(
                    semanticsBridge, (Integer) key
                );
                if (node == null || !node.isClickable()) {
                    continue;
                }
                node.getBoundsInScreen(rect);
                boolean inside = rect.left >= left - 4 && rect.right <= right + 4
                    && rect.top >= top - 4 && rect.bottom <= bottom + 4;
                boolean corner = Math.abs(rect.right - expectedRight) <= dp(activity, 10)
                    && Math.abs(rect.bottom - expectedBottom) <= dp(activity, 10);
                boolean sized = rect.width() >= minSize && rect.width() <= maxSize
                    && rect.height() >= minSize && rect.height() <= maxSize;
                if (inside && corner && sized) {
                    return true;
                }
            }
            return false;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void refreshVisibility() {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        if (activity.isInPictureInPictureMode()) {
            closePanel();
            if (button != null) {
                button.setVisibility(View.GONE);
            }
            scheduleRefresh();
            return;
        }

        attachTouchWatcher(activity);
        enableSemantics(activity);
        boolean anchored = ensureButton(activity);

        long now = SystemClock.uptimeMillis();
        boolean active = hasActivePlayer();
        if (active && !lastActive) {
            lastInteraction = now;
        }
        lastActive = active;

        if (!active && panelOpen) {
            closePanel();
            return;
        }

        syncWithPlayers();
        Boolean exactControls = readControlsVisible(activity);
        if (exactControls == null && flutterJni != null) {
            reenableSemantics();
        }

        boolean controlsVisible = exactControls != null
            ? exactControls
            : now - lastInteraction < CONTROLS_TIMEOUT_MS;
        boolean show = panelOpen || (anchored && active && controlsVisible);
        if (button != null) {
            button.setVisibility(show ? View.VISIBLE : View.GONE);
        }
        if (panelOpen) {
            ViewGroup content = activity.findViewById(android.R.id.content);
            if (content != null) {
                positionPanel(activity, content);
            }
        }

        scheduleRefresh();
    }

    private static void scheduleRefresh() {
        HANDLER.removeCallbacks(REFRESH);
        boolean active = hasActivePlayer();
        HANDLER.postDelayed(REFRESH, active ? 400 : 1000);
    }

    private static boolean hasActivePlayer() {
        for (Iterator<WeakReference<Object>> iterator = PLAYERS.iterator(); iterator.hasNext(); ) {
            Object player = iterator.next().get();
            if (player == null) {
                iterator.remove();
            } else if (isPlayerActive(player)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Watches the players for play/pause/seek/buffering changes and treats
     * them as player interactions, so the button follows the controls the
     * app itself shows for those actions.
     */
    private static void syncWithPlayers() {
        long now = SystemClock.uptimeMillis();
        for (Iterator<WeakReference<Object>> iterator = PLAYERS.iterator(); iterator.hasNext(); ) {
            Object player = iterator.next().get();
            if (player == null) {
                iterator.remove();
                continue;
            }
            try {
                Object exoPlayer = getExoPlayer(player);
                if (exoPlayer == null) {
                    continue;
                }
                int state = getPlaybackState(exoPlayer);
                Method playingMethod = exoPlayer.getClass().getMethod("isPlaying");
                boolean playing = (Boolean) playingMethod.invoke(exoPlayer);
                Method positionMethod = exoPlayer.getClass().getMethod("getCurrentPosition");
                long position = (Long) positionMethod.invoke(exoPlayer);

                PlaybackSnapshot previous = SNAPSHOTS.get(player);
                if (previous == null) {
                    SNAPSHOTS.put(player, new PlaybackSnapshot(state, playing, position, now));
                    continue;
                }
                boolean changed = previous.playing != playing;
                if (!changed && Math.abs(position - previous.position) > 2500) {
                    long elapsed = now - previous.timestamp;
                    long delta = position - previous.position;
                    changed = Math.abs(delta - elapsed) > 2000 || delta < 0;
                }
                if (changed) {
                    lastInteraction = now;
                }
                previous.state = state;
                previous.playing = playing;
                previous.position = position;
                previous.timestamp = now;
            } catch (Throwable ignored) {
            }
        }
    }

    private static final class PlaybackSnapshot {
        int state;
        boolean playing;
        long position;
        long timestamp;

        PlaybackSnapshot(int state, boolean playing, long position, long timestamp) {
            this.state = state;
            this.playing = playing;
            this.position = position;
            this.timestamp = timestamp;
        }
    }

    private static boolean isPlayerActive(Object player) {
        try {
            Object exoPlayer = getExoPlayer(player);
            if (exoPlayer == null) {
                return false;
            }
            int state = getPlaybackState(exoPlayer);
            if (state == 2 || state == 3) { // BUFFERING or READY
                return true;
            }
            Method playWhenReadyMethod = exoPlayer.getClass().getMethod("getPlayWhenReady");
            return (Boolean) playWhenReadyMethod.invoke(exoPlayer);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static boolean isPlayerPaused(Object player) {
        try {
            Object exoPlayer = getExoPlayer(player);
            if (exoPlayer == null) {
                return false;
            }
            int state = getPlaybackState(exoPlayer);
            Method playingMethod = exoPlayer.getClass().getMethod("isPlaying");
            return state == 3 && !((Boolean) playingMethod.invoke(exoPlayer));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Object getExoPlayer(Object player) throws Exception {
        Field field = player.getClass().getDeclaredField("exoPlayer");
        field.setAccessible(true);
        return field.get(player);
    }

    private static int getPlaybackState(Object exoPlayer) throws Exception {
        Method stateMethod = exoPlayer.getClass().getMethod("getPlaybackState");
        return (Integer) stateMethod.invoke(exoPlayer);
    }

    private static void applyTo(Object player) {
        try {
            int index = qualityIndex;
            Method method = player.getClass().getMethod(
                "setTrackParameters", int.class, int.class, int.class
            );
            internalChange = true;
            try {
                if (index == 0 && appWidth > 0 && appHeight > 0) {
                    method.invoke(player, appWidth, appHeight, appBitrate);
                } else if (index == 0) {
                    method.invoke(player, 0, 0, 0);
                } else {
                    method.invoke(player, WIDTHS[index], HEIGHTS[index], 0);
                }
            } finally {
                internalChange = false;
            }
        } catch (Throwable ignored) {
        }
    }

    private static int statusBarHeight(Context context) {
        int identifier = context.getResources().getIdentifier(
            "status_bar_height", "dimen", "android"
        );
        if (identifier > 0) {
            return context.getResources().getDimensionPixelSize(identifier);
        }
        return dp(context, 24);
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
