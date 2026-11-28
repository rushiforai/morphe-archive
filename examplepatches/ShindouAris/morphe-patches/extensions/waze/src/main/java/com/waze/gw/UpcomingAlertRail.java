package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Draggable list of the nearest upcoming speed change and route alerts on Waze's main map.
 *
 * The rail is deliberately independent from FloatSpeedo. Dropping it on the left/right edge uses
 * a vertical list; dropping it on the top/bottom edge uses a horizontal list. Portrait and
 * landscape positions are persisted separately.
 */
public final class UpcomingAlertRail extends LinearLayout {
    private static final String PREFS = "waze_hud_gw";
    private static final int DOCK_LEFT = 0;
    private static final int DOCK_RIGHT = 1;
    private static final int DOCK_TOP = 2;
    private static final int DOCK_BOTTOM = 3;
    private static final int RAIL_LAYOUT_VERSION = 2;
    /** Alerts further away than this are not listed; same 2 km cap as the traffic bubble. */
    private static final int MAX_ALERT_METERS = 2000;

    private final SharedPreferences prefs;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final TextView handle;
    private final LinearLayout items;
    private final DistanceRailView distanceRail;
    private FrameLayout root;
    private int dock = DOCK_LEFT;
    private int desiredX = -1;
    private int desiredY = -1;
    private int lastSize = -1;
    private boolean vertical = true;
    private Boolean portraitState;
    private String lastSignature = "";
    private boolean rootListenerInstalled;
    private boolean previewMode;
    private boolean previewEnabled = true;
    private int previewCount = 3;
    private int previewSize = 100;
    private int previewStyle = 1;
    private int previewIconSize = 100;
    private java.util.List<String> previewRows;
    private int lastStyle = -1;

    public UpcomingAlertRail(Context context) {
        super(context);
        prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        setGravity(Gravity.CENTER);
        setPivotX(0f);
        setPivotY(0f);
        setPadding(dp(5), dp(5), dp(5), dp(5));
        setBackground(panelBackground());

        handle = new TextView(context);
        handle.setTextColor(0xFFA6A6AD);
        handle.setTextSize(14);
        handle.setGravity(Gravity.CENTER);
        handle.setTypeface(Typeface.DEFAULT_BOLD);
        handle.setIncludeFontPadding(false);

        items = new LinearLayout(context);
        items.setGravity(Gravity.CENTER);
        distanceRail = new DistanceRailView(context);
        configureDock(DOCK_LEFT, true);
        setupDrag();
    }

    /** Bind once after the rail is inserted into Waze's content FrameLayout. */
    public void attachToRoot(final FrameLayout parent) {
        root = parent;
        if (!rootListenerInstalled) {
            rootListenerInstalled = true;
            parent.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override
                public void onLayoutChange(View v, int l, int t, int r, int b,
                                           int oldL, int oldT, int oldR, int oldB) {
                    if (r - l <= 0 || b - t <= 0) return;
                    boolean portrait = b - t > r - l;
                    if (portraitState == null || portraitState.booleanValue() != portrait) {
                        restoreForOrientation(portrait);
                    } else {
                        post(new Runnable() {
                            @Override public void run() { snapAndClamp(false); }
                        });
                    }
                }
            });
        }
        post(new Runnable() {
            @Override public void run() { restoreForOrientation(isPortrait()); }
        });
    }

    /** Render the real rail with isolated sample data for Mod Settings. */
    public void setPreviewState(java.util.List<String> rows, boolean enabled,
                                int count, int sizePercent, int iconSizePercent, int style) {
        previewMode = true;
        previewEnabled = enabled;
        previewCount = Math.max(1, Math.min(3, count));
        previewSize = Math.max(70, Math.min(160, sizePercent));
        previewIconSize = Math.max(70, Math.min(160, iconSizePercent));
        previewStyle = style == 0 ? 0 : 1;
        previewRows = rows == null
                ? new java.util.ArrayList<String>()
                : new java.util.ArrayList<String>(rows);
        root = null;
        desiredX = desiredY = -1;
        configureDock(previewStyle == 1 ? DOCK_LEFT : DOCK_TOP, true);
        setOnTouchListener(null);
        lastSize = -1;
        lastSignature = "";
        handler.removeCallbacks(tick);
        handler.post(tick);
    }

    private final Runnable tick = new Runnable() {
        @Override public void run() {
            try {
                boolean enabled = previewMode ? previewEnabled
                        : prefs.getBoolean("upcoming_alerts", true);
                int size = previewMode ? previewSize : prefs.getInt("upcoming_size", 100);
                int style = previewMode ? previewStyle : prefs.getInt("upcoming_style", 1);
                if (style != lastStyle) {
                    lastStyle = style;
                    configureDock(dock, true);
                }
                if (size != lastSize) {
                    lastSize = size;
                    float scale = size / 100f;
                    setScaleX(scale);
                    setScaleY(scale);
                    post(new Runnable() {
                        @Override public void run() { snapAndClamp(false); }
                    });
                }

                java.util.List<UpcomingAlertModel.Entry> next = (enabled || previewMode)
                        ? readEntries() : new java.util.ArrayList<UpcomingAlertModel.Entry>();
                UpcomingAlertModel.Entry jam = null;
                if (usesDistanceRail()) {
                    // A jam is a stretch, not a point: it colours the rail line instead of getting a chip. The
                    // rail itself only shows while an alert is ahead, so a jam alone never brings it up.
                    java.util.ArrayList<UpcomingAlertModel.Entry> points = new java.util.ArrayList<UpcomingAlertModel.Entry>();
                    for (UpcomingAlertModel.Entry entry : next) {
                        if (entry.jamLevel > 0) { if (jam == null) jam = entry; }
                        else points.add(entry);
                    }
                    next = points;
                    distanceRail.setJam(jam);
                }
                if (usesDistanceRail()) {
                    java.util.ArrayList<UpcomingAlertModel.Entry> withinHorizon = new java.util.ArrayList<UpcomingAlertModel.Entry>();
                    for (UpcomingAlertModel.Entry entry : next) {
                        if (entry.meters <= DistanceRailView.HORIZON_METERS)
                            withinHorizon.add(entry);
                    }
                    next = withinHorizon;
                }
                int configured = previewMode ? previewCount
                        : Math.max(1, Math.min(3, prefs.getInt("upcoming_count", 3)));
                int max = usesDistanceRail() ? configured
                        : (previewMode ? configured : Math.min(configured, isPortrait() ? 2 : 3));
                if (next.size() > max) next = new java.util.ArrayList<UpcomingAlertModel.Entry>(next.subList(0, max));

                if (usesDistanceRail()) {
                    int iconSize = previewMode ? previewIconSize
                            : Math.max(70, Math.min(160, prefs.getInt("upcoming_icon_size", 100)));
                    distanceRail.setEntries(next, iconSize);
                } else {
                    String signature = signature(next);
                    if (!signature.equals(lastSignature)) {
                        lastSignature = signature;
                        rebuild(next);
                    }
                }
                if (previewMode) {
                    setAlpha(enabled ? 1f : 0.32f);
                    setVisibility(!next.isEmpty() ? VISIBLE : GONE);
                } else {
                    setAlpha(1f);
                    setVisibility(enabled && !next.isEmpty() ? VISIBLE : GONE);
                }
            } catch (Throwable ignored) { }
            handler.postDelayed(this, 500);
        }
    };

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        handler.removeCallbacks(tick);
        handler.post(tick);
    }

    @Override protected void onDetachedFromWindow() {
        handler.removeCallbacks(tick);
        super.onDetachedFromWindow();
    }

    private java.util.List<UpcomingAlertModel.Entry> readEntries() {
        java.util.List<String> snapshot = previewMode ? previewRows : Gateway.hudAlerts;
        return UpcomingAlertModel.select(snapshot, previewMode ? -1 : Gateway.hudLimit,
                MAX_ALERT_METERS, Integer.MAX_VALUE);
    }

    private String signature(java.util.List<UpcomingAlertModel.Entry> entries) {
        StringBuilder s = new StringBuilder(vertical ? "V" : "H");
        for (UpcomingAlertModel.Entry e : entries) {
            s.append('|').append(e.rawIcon).append(':').append(e.distance)
                    .append(':').append(e.meters);
        }
        return s.toString();
    }

    private void rebuild(java.util.List<UpcomingAlertModel.Entry> entries) {
        items.removeAllViews();
        for (int i = 0; i < entries.size(); i++) {
            View item = makeItem(entries.get(i));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(66),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            if (i > 0) {
                if (vertical) lp.topMargin = dp(7);
                else lp.leftMargin = dp(7);
            }
            items.addView(item, lp);
        }
        requestLayout();
        post(new Runnable() {
            @Override public void run() { snapAndClamp(false); }
        });
    }

    private View makeItem(UpcomingAlertModel.Entry entry) {
        LinearLayout item = new LinearLayout(getContext());
        item.setOrientation(VERTICAL);
        item.setGravity(Gravity.CENTER);
        item.setPadding(dp(3), dp(3), dp(3), dp(4));

        if (entry.speed > 0) {
            TextView sign = new TextView(getContext());
            sign.setText(String.valueOf(entry.speed));
            sign.setTextColor(Color.BLACK);
            sign.setTextSize(entry.speed >= 100 ? 23 : 27);
            sign.setGravity(Gravity.CENTER);
            sign.setIncludeFontPadding(false);
            sign.setTypeface(Typeface.DEFAULT_BOLD);
            ModTypeface.applySpeed(sign);
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(Color.WHITE);
            circle.setStroke(dp(6), 0xFF9A9AA1); // grey = upcoming, not the active speed limit
            sign.setBackground(circle);
            item.addView(sign, new LinearLayout.LayoutParams(dp(58), dp(58)));
        } else {
            ImageView icon = new ImageView(getContext());
            icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
            Bitmap bitmap = Signs.alertIcon(getContext(), entry.rawIcon);
            if (bitmap != null) icon.setImageBitmap(bitmap);
            item.addView(icon, new LinearLayout.LayoutParams(dp(52), dp(52)));
        }

        TextView distance = new TextView(getContext());
        distance.setText(entry.distance != null && entry.distance.length() > 0
                ? entry.distance : formatDistance(entry.meters));
        distance.setTextColor(0xFFF3F3F5);
        distance.setTextSize(14);
        distance.setGravity(Gravity.CENTER);
        distance.setTypeface(Typeface.DEFAULT_BOLD);
        distance.setIncludeFontPadding(false);
        LinearLayout.LayoutParams dlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dlp.topMargin = dp(3);
        item.addView(distance, dlp);
        return item;
    }

    private String formatDistance(int meters) {
        String imperial = Units.imperialDistance(meters, false);
        if (imperial != null) return imperial;
        if (meters < 1000) return meters + " m";
        if (meters < 10000)
            return String.format(java.util.Locale.US, "%.1f km", meters / 1000f);
        return Math.round(meters / 1000f) + " km";
    }

    private void configureDock(int nextDock, boolean force) {
        boolean nextVertical = nextDock == DOCK_LEFT || nextDock == DOCK_RIGHT;
        dock = nextDock;
        if (!force && nextVertical == vertical) return;
        vertical = nextVertical;
        removeAllViews();
        if (vertical) {
            setOrientation(VERTICAL);
            handle.setText("•••");
            items.setOrientation(VERTICAL);
            addView(handle, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dp(12)));
            if (usesDistanceRail()) {
                addView(distanceRail, new LinearLayout.LayoutParams(
                        distanceRail.desiredWidth, distanceRail.desiredHeight));
            } else {
                addView(items, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
        } else {
            setOrientation(HORIZONTAL);
            handle.setText("⋮");
            items.setOrientation(HORIZONTAL);
            addView(handle, new LinearLayout.LayoutParams(
                    dp(12), ViewGroup.LayoutParams.MATCH_PARENT));
            addView(items, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        lastSignature = "";
        requestLayout();
    }

    private boolean usesDistanceRail() {
        int style = previewMode ? previewStyle : prefs.getInt("upcoming_style", 1);
        return vertical && style == 1;
    }

    private void setupDrag() {
        final int slop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        setOnTouchListener(new View.OnTouchListener() {
            float offsetX, offsetY, downX, downY;
            boolean moved;

            @Override public boolean onTouch(View v, MotionEvent event) {
                ViewGroup.LayoutParams raw = getLayoutParams();
                if (!(raw instanceof FrameLayout.LayoutParams)) return true;
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) raw;
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        if (getParent() != null) getParent().requestDisallowInterceptTouchEvent(true);
                        downX = event.getRawX();
                        downY = event.getRawY();
                        offsetX = downX - lp.leftMargin;
                        offsetY = downY - lp.topMargin;
                        moved = false;
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        if (!moved && (Math.abs(event.getRawX() - downX) > slop
                                || Math.abs(event.getRawY() - downY) > slop)) moved = true;
                        if (moved) {
                            int[] xy = clamp((int) (event.getRawX() - offsetX),
                                    (int) (event.getRawY() - offsetY));
                            lp.gravity = Gravity.TOP | Gravity.START;
                            lp.leftMargin = xy[0];
                            lp.topMargin = xy[1];
                            desiredX = xy[0];
                            desiredY = xy[1];
                            setLayoutParams(lp);
                        }
                        return true;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        if (moved) chooseNearestDock();
                        return true;
                    default:
                        return true;
                }
            }
        });
    }

    private void chooseNearestDock() {
        if (root == null || root.getWidth() <= 0 || root.getHeight() <= 0) return;
        float width = getWidth() * Math.max(0.01f, getScaleX());
        float height = getHeight() * Math.max(0.01f, getScaleY());
        float centerX = desiredX + getPivotX() * (1f - getScaleX()) + width / 2f;
        float centerY = desiredY + getPivotY() * (1f - getScaleY()) + height / 2f;
        float left = centerX;
        float right = root.getWidth() - centerX;
        float top = centerY;
        float bottom = root.getHeight() - centerY;
        int nearest = DOCK_LEFT;
        float distance = left;
        if (right < distance) { nearest = DOCK_RIGHT; distance = right; }
        if (top < distance) { nearest = DOCK_TOP; distance = top; }
        if (bottom < distance) nearest = DOCK_BOTTOM;
        configureDock(nearest, false);
        post(new Runnable() {
            @Override public void run() { snapAndClamp(true); }
        });
    }

    private void restoreForOrientation(boolean portrait) {
        if (root == null || root.getWidth() <= 0 || root.getHeight() <= 0) return;
        portraitState = Boolean.valueOf(portrait);
        String suffix = portrait ? "_p" : "_l";
        int restoredDock = prefs.getInt("uar_dock" + suffix, DOCK_LEFT);
        int layoutVersion = prefs.getInt("uar_layout_version" + suffix, 0);
        if (layoutVersion < RAIL_LAYOUT_VERSION && restoredDock == DOCK_LEFT) {
            desiredX = dp(12);
            desiredY = dp(portrait ? 220 : 190);
            prefs.edit().putInt("uar_x" + suffix, desiredX)
                    .putInt("uar_y" + suffix, desiredY)
                    .putInt("uar_layout_version" + suffix, RAIL_LAYOUT_VERSION).apply();
        } else {
            desiredX = prefs.getInt("uar_x" + suffix, dp(12));
            desiredY = prefs.getInt("uar_y" + suffix, dp(portrait ? 220 : 190));
        }
        configureDock(restoredDock, false);
        ViewGroup.LayoutParams raw = getLayoutParams();
        if (raw instanceof FrameLayout.LayoutParams) {
            FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) raw;
            lp.gravity = Gravity.TOP | Gravity.START;
            lp.leftMargin = desiredX;
            lp.topMargin = desiredY;
            setLayoutParams(lp);
        }
        post(new Runnable() {
            @Override public void run() { snapAndClamp(false); }
        });
    }

    private void snapAndClamp(boolean persist) {
        if (root == null || getWidth() <= 0 || getHeight() <= 0) return;
        updateDockPivot();
        int margin = dp(8);
        int x = desiredX >= 0 ? desiredX : margin;
        int y = desiredY >= 0 ? desiredY : dp(150);
        if (dock == DOCK_LEFT) x = margin;
        else if (dock == DOCK_RIGHT) x = root.getWidth() - getWidth() - margin;
        else if (dock == DOCK_TOP) y = margin;
        else if (dock == DOCK_BOTTOM) y = root.getHeight() - getHeight() - margin;
        int[] xy = clamp(x, y);
        desiredX = xy[0];
        desiredY = xy[1];
        ViewGroup.LayoutParams raw = getLayoutParams();
        if (raw instanceof FrameLayout.LayoutParams) {
            FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) raw;
            if (lp.leftMargin != xy[0] || lp.topMargin != xy[1]) {
                lp.gravity = Gravity.TOP | Gravity.START;
                lp.leftMargin = xy[0];
                lp.topMargin = xy[1];
                setLayoutParams(lp);
            }
        }
        if (persist) savePosition();
    }

    private int[] clamp(int x, int y) {
        if (root != null && root.getWidth() > 0 && getWidth() > 0) {
            float sx = Math.max(0.01f, getScaleX());
            float sy = Math.max(0.01f, getScaleY());
            int width = Math.round(getWidth() * sx);
            int height = Math.round(getHeight() * sy);
            int offsetX = Math.round(getPivotX() * (1f - sx));
            int offsetY = Math.round(getPivotY() * (1f - sy));
            int minX = -offsetX;
            int minY = -offsetY;
            int maxX = root.getWidth() - width - offsetX;
            int maxY = root.getHeight() - height - offsetY;
            x = Math.max(minX, Math.min(x, Math.max(minX, maxX)));
            y = Math.max(minY, Math.min(y, Math.max(minY, maxY)));
        } else {
            x = Math.max(0, x);
            y = Math.max(0, y);
        }
        return new int[]{x, y};
    }

    /** Anchor scaling at the selected screen edge so the unscaled layout box never gets clipped. */
    private void updateDockPivot() {
        setPivotX(dock == DOCK_RIGHT ? getWidth() : 0f);
        setPivotY(dock == DOCK_BOTTOM ? getHeight() : 0f);
    }

    private void savePosition() {
        boolean portrait = isPortrait();
        String suffix = portrait ? "_p" : "_l";
        prefs.edit().putInt("uar_dock" + suffix, dock)
                .putInt("uar_x" + suffix, desiredX)
                .putInt("uar_y" + suffix, desiredY).apply();
    }

    private boolean isPortrait() {
        if (root != null && root.getWidth() > 0 && root.getHeight() > 0)
            return root.getHeight() > root.getWidth();
        return getResources().getConfiguration().orientation
                == android.content.res.Configuration.ORIENTATION_PORTRAIT;
    }

    private GradientDrawable panelBackground() {
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.RECTANGLE);
        background.setColor(0xA619191F);
        background.setCornerRadius(dp(14));
        background.setStroke(dp(1), 0x443F3F48);
        return background;
    }

    private int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }

    /** Compact one-dimensional route: far alerts start at the top and approach the car. */
    private final class DistanceRailView extends View {
        private static final int HORIZON_METERS = 1000;
        private static final int TOP_PAD_DP = 18;
        private static final int BOTTOM_PAD_DP = 52;
        /** Fixed rail length, unchanged from the original V2 layout. */
        private static final int RAIL_HEIGHT_DP = 310;
        /** Smallest visible gap between two alert icons before that stretch is zoomed. */
        private static final int ZOOM_GAP_DP = 30;
        /** Distance to the nearest alert, printed under the car glyph. */
        private static final int DISTANCE_TEXT_DP = 18;
        /** Hard floor between icons when even a zoomed rail runs out of room. */
        private static final int MIN_GAP_DP = 6;
        private static final float ANIMATION_MS = 360f;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path carPath = new Path();
        private java.util.List<Marker> markers = new java.util.ArrayList<Marker>();
        private long animationStarted;
        private String dataSignature = "";
        private int jamLevel;
        /** Size the rail asks its parent for: fixed length, width widens only for big icons. */
        int desiredWidth = dp(72);
        final int desiredHeight = dp(RAIL_HEIGHT_DP);

        DistanceRailView(Context context) {
            super(context);
            setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        }

        /** Jam the car is in (null when none): tints the line by severity. */
        void setJam(UpcomingAlertModel.Entry jam) {
            int level = jam == null ? 0 : jam.jamLevel;
            if (level == jamLevel) return;
            jamLevel = level;
            invalidate();
        }

        /** Waze traffic-bar colours: light, moderate, heavy, stand-still. */
        private int jamColor(int level) {
            return level <= 1 ? 0xFFF6C945 : level == 2 ? 0xFFF5842B : level == 3 ? 0xFFE53935 : 0xFF9E1B1B;
        }

        void setEntries(java.util.List<UpcomingAlertModel.Entry> entries, int iconPercent) {
            String nextSignature = signature(entries) + '#' + iconPercent;
            if (nextSignature.equals(dataSignature)) return;
            dataSignature = nextSignature;
            java.util.HashMap<String, Marker> old = new java.util.HashMap<String, Marker>();
            for (Marker marker : markers) old.put(marker.key, marker);

            // Entries arrive nearest-first. Nearer alerts are drawn larger; the user's icon
            // size multiplies on top so both stay independent.
            int count = entries.size();
            float userScale = iconPercent / 100f;
            float[] scale = new float[count];
            float[] half = new float[count];
            float maxHalf = 0f;
            for (int i = 0; i < count; i++) {
                UpcomingAlertModel.Entry entry = entries.get(i);
                scale[i] = proximityScale(entry.meters) * userScale;
                half[i] = markerHalf(entry) * scale[i];
                maxHalf = Math.max(maxHalf, half[i]);
            }

            // The rail keeps a fixed length; crowded alerts are zoomed inside it instead.
            float[] offset = new float[count];
            boolean[] zoomed = new boolean[count];
            layoutOffsets(entries, half, dp(RAIL_HEIGHT_DP) - dp(TOP_PAD_DP) - dp(BOTTOM_PAD_DP),
                    offset, zoomed);

            java.util.ArrayList<Marker> next = new java.util.ArrayList<Marker>();
            java.util.HashMap<String, Integer> occurrences = new java.util.HashMap<String, Integer>();
            for (int i = 0; i < count; i++) {
                UpcomingAlertModel.Entry entry = entries.get(i);
                String base = entry.speed > 0 ? "speed_" + entry.speed : entry.rawIcon;
                Integer occurrence = occurrences.get(base);
                int index = occurrence == null ? 0 : occurrence.intValue();
                occurrences.put(base, Integer.valueOf(index + 1));
                String key = base + "#" + index;
                Marker previous = old.get(key);
                float startOffset = previous != null ? previous.currentOffset() : offset[i];
                float startScale = previous != null ? previous.currentScale() : scale[i];
                float targetZoom = zoomed[i] ? 1f : 0f;
                float startZoom = previous != null ? previous.currentZoom() : targetZoom;
                int gapMeters = i == 0 ? 0 : Math.max(0, entry.meters - entries.get(i - 1).meters);
                next.add(new Marker(key, entry, startOffset, offset[i], startScale, scale[i],
                        startZoom, targetZoom, gapMeters));
            }
            markers = next;
            applyWidth(maxHalf);
            animationStarted = android.os.SystemClock.uptimeMillis();
            invalidate();
        }

        /**
         * Distance-from-car (px, measured up the rail) for every marker on a rail of fixed length.
         * The nearest marker always clears the car glyph.
         *
         * Zoom: when two alerts would sit closer than ZOOM_GAP_DP edge-to-edge at the true scale,
         * the gap between them is magnified to ZOOM_GAP_DP and zoomed[i] marks it (the gap below
         * marker i) so the real distance can be labelled. The extra length is paid for by first
         * squeezing the empty stretch between the car and the nearest alert, then by shrinking
         * the zoomed gaps toward MIN_GAP_DP, so everything always fits the fixed rail.
         */
        private void layoutOffsets(java.util.List<UpcomingAlertModel.Entry> entries, float[] half, int track,
                                   float[] offset, boolean[] zoomed) {
            int count = offset.length;
            if (count == 0) return;
            float zoomGap = dp(ZOOM_GAP_DP);
            float minGap = dp(MIN_GAP_DP);
            float[] wanted = new float[count];   // preferred step from the previous marker (or the car)
            float[] floor = new float[count];    // smallest step that still keeps icons apart
            float previousIdeal = 0f;
            float total = half[count - 1];
            for (int i = 0; i < count; i++) {
                float ideal = positionFor(entries.get(i).meters) * track;
                if (i == 0) {
                    floor[i] = half[i] + dp(16);
                    wanted[i] = Math.max(ideal, floor[i]);
                    zoomed[i] = false;
                } else {
                    float halves = half[i - 1] + half[i];
                    float idealGap = ideal - previousIdeal;
                    zoomed[i] = idealGap - halves < zoomGap;
                    floor[i] = halves + minGap;
                    wanted[i] = zoomed[i] ? halves + zoomGap : idealGap;
                }
                previousIdeal = ideal;
                total += wanted[i];
            }

            // Outer edge of the last marker may reach into the top padding.
            float excess = total - (track + dp(TOP_PAD_DP) - dp(2));
            if (excess > 0f) {
                float squeeze = Math.min(excess, wanted[0] - floor[0]);
                wanted[0] -= squeeze;
                excess -= squeeze;
            }
            if (excess > 0f) {
                float flexible = 0f;
                for (int i = 1; i < count; i++) flexible += wanted[i] - floor[i];
                float keep = flexible <= 0f ? 0f : Math.max(0f, 1f - excess / flexible);
                for (int i = 1; i < count; i++) wanted[i] = floor[i] + (wanted[i] - floor[i]) * keep;
            }

            float position = 0f;
            for (int i = 0; i < count; i++) {
                position += wanted[i];
                offset[i] = position;
            }
        }

        /** Only the width follows the icon size; the length stays fixed. */
        private void applyWidth(float maxHalf) {
            int width = Math.max(dp(72), Math.round(maxHalf * 2f) + dp(16));
            if (width == desiredWidth) return;
            desiredWidth = width;
            ViewGroup.LayoutParams lp = getLayoutParams();
            if (lp != null) {
                lp.width = width;
                setLayoutParams(lp);
            }
            UpcomingAlertRail.this.post(new Runnable() {
                @Override public void run() { snapAndClamp(false); }
            });
        }

        /** Alerts within 200 m read at 1.12x, fading to 0.78x at the 1 km horizon. */
        private float proximityScale(int meters) {
            float t = Math.max(0f, Math.min(1f, (meters - 200) / 800f));
            return 1.12f - 0.34f * t;
        }

        private float markerHalf(UpcomingAlertModel.Entry entry) {
            return dp(entry.speed > 0 ? 20 : 18);
        }

        private float positionFor(int meters) {
            return UpcomingAlertModel.position(meters, HORIZON_METERS);
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            int width = getWidth();
            int height = getHeight();
            float center = width / 2f;
            float top = dp(TOP_PAD_DP);
            float bottom = height - dp(BOTTOM_PAD_DP);

            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeWidth(dp(7));
            int ambient = jamLevel > 0 ? jamColor(jamLevel) : AmbientTheme.color(prefs);
            int faded = (ambient & 0x00FFFFFF) | 0x18000000;
            paint.setShader(new LinearGradient(center, top, center, bottom,
                    new int[]{faded, ambient, ambient, faded},
                    new float[]{0f, 0.28f, 0.72f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawLine(center, top, center, bottom, paint);
            paint.setShader(null);

            // Zoomed stretches go under the icons so the highlight never covers a marker.
            for (int i = 1; i < markers.size(); i++) {
                Marker upper = markers.get(i);
                Marker lower = markers.get(i - 1);
                float zoom = upper.currentZoom();
                if (zoom <= 0.02f) continue;
                float lowerEdge = bottom - lower.currentOffset()
                        - markerHalf(lower.entry) * lower.currentScale();
                float upperEdge = bottom - upper.currentOffset()
                        + markerHalf(upper.entry) * upper.currentScale();
                drawZoomGap(canvas, center, upperEdge, lowerEdge, upper.gapMeters, zoom);
            }

            // Markers are already spaced along the rail by setEntries(); they only need placing.
            for (Marker marker : markers) {
                drawMarker(canvas, marker.entry, center, bottom - marker.currentOffset(),
                        marker.currentScale());
            }

            float carY = bottom + dp(5);
            drawCar(canvas, center, carY);
            if (!markers.isEmpty()) drawDistance(canvas, markers.get(0).entry.meters,
                    center, bottom + dp(41));

            if (android.os.SystemClock.uptimeMillis() - animationStarted < (long) ANIMATION_MS)
                postInvalidateOnAnimation();
        }

        /** Highlight a magnified stretch between two alerts and label the real distance between them. */
        private void drawZoomGap(Canvas canvas, float x, float upperY, float lowerY,
                                 int meters, float amount) {
            if (lowerY - upperY < dp(20)) return;   // no room left for the 18dp label
            int ambient = AmbientTheme.color(prefs);
            paint.setShader(null);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.BUTT);
            paint.setStrokeWidth(dp(7));
            paint.setColor((ambient & 0x00FFFFFF) | ((int) (150 * amount) << 24));
            canvas.drawLine(x, upperY + dp(2), x, lowerY - dp(2), paint);

            // Dimension-style end caps mark exactly which two alerts the number refers to.
            paint.setStrokeWidth(dp(2));
            paint.setColor((0x00FFFFFF) | ((int) (200 * amount) << 24));
            float cap = dp(11);
            canvas.drawLine(x - cap, upperY + dp(2), x + cap, upperY + dp(2), paint);
            canvas.drawLine(x - cap, lowerY - dp(2), x + cap, lowerY - dp(2), paint);

            String label = formatDistance(meters);
            paint.setTextSize(dp(11));
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextAlign(Paint.Align.CENTER);
            float midY = (upperY + lowerY) / 2f;
            float halfW = paint.measureText(label) / 2f + dp(6);
            float halfH = dp(9);
            RectF pill = new RectF(x - halfW, midY - halfH, x + halfW, midY + halfH);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(((int) (235 * amount) << 24) | 0x0019191F);
            canvas.drawRoundRect(pill, halfH, halfH, paint);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(dp(1));
            paint.setColor((ambient & 0x00FFFFFF) | ((int) (255 * amount) << 24));
            canvas.drawRoundRect(pill, halfH, halfH, paint);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor((0x00F3F3F5) | ((int) (255 * amount) << 24));
            canvas.drawText(label, x, midY - (paint.ascent() + paint.descent()) / 2f, paint);
        }

        private void drawLimit(Canvas canvas, float x, float y, int limit, float scale) {
            if (limit <= 0) return;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.WHITE);
            canvas.drawCircle(x, y, dp(20) * scale, paint);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(dp(4) * scale);
            paint.setColor(0xFFE52329);
            canvas.drawCircle(x, y, dp(18) * scale, paint);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.BLACK);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextSize(dp(limit >= 100 ? 13 : 16) * scale);
            canvas.drawText(String.valueOf(limit), x, y - (paint.ascent() + paint.descent()) / 2f, paint);
        }

        private void drawMarker(Canvas canvas, UpcomingAlertModel.Entry entry, float x, float y, float scale) {
            if (entry.speed > 0) {
                drawLimit(canvas, x, y, entry.speed, scale);
                return;
            }
            Bitmap bitmap = Signs.alertIcon(getContext(), entry.rawIcon);
            if (bitmap == null) return;
            float half = dp(18) * scale;
            RectF target = new RectF(x - half, y - half, x + half, y + half);
            // Alert assets already contain their intended outline. A synthetic dark disc here
            // made Waze icons look shadowed and muted against the translucent rail.
            paint.setAlpha(255);
            paint.setColorFilter(null);
            paint.setFilterBitmap(true);
            canvas.drawBitmap(bitmap, null, target, paint);
        }

        private void drawCar(Canvas canvas, float x, float y) {
            UpcomingRailCarGlyph.draw(canvas, paint, carPath, x, y,
                    getResources().getDisplayMetrics().density);
        }

        private void drawDistance(Canvas canvas, int meters, float x, float baseline) {
            String text = formatDistance(meters);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(0xFFF3F3F5);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            // Big enough to read at a glance; shrunk only when a long value ("1.0 km") would
            // overflow the rail.
            paint.setTextSize(dp(DISTANCE_TEXT_DP));
            float maxWidth = getWidth() - dp(8);
            float measured = paint.measureText(text);
            if (measured > maxWidth) paint.setTextSize(dp(DISTANCE_TEXT_DP) * maxWidth / measured);
            canvas.drawText(text, x, baseline, paint);
        }

        /** One rail marker; offset is px above the car, both values ease toward their targets. */
        private final class Marker {
            final String key;
            final UpcomingAlertModel.Entry entry;
            final float startOffset;
            final float targetOffset;
            final float startScale;
            final float targetScale;
            /** 0..1 amount of "zoom" on the gap below this marker, plus that gap's real length. */
            final float startZoom;
            final float targetZoom;
            final int gapMeters;

            Marker(String key, UpcomingAlertModel.Entry entry, float startOffset, float targetOffset,
                   float startScale, float targetScale, float startZoom, float targetZoom,
                   int gapMeters) {
                this.key = key;
                this.entry = entry;
                this.startOffset = startOffset;
                this.targetOffset = targetOffset;
                this.startScale = startScale;
                this.targetScale = targetScale;
                this.startZoom = startZoom;
                this.targetZoom = targetZoom;
                this.gapMeters = gapMeters;
            }

            private float progress() {
                float t = Math.min(1f, Math.max(0f,
                        (android.os.SystemClock.uptimeMillis() - animationStarted) / ANIMATION_MS));
                return 1f - (1f - t) * (1f - t);
            }

            float currentZoom() {
                return startZoom + (targetZoom - startZoom) * progress();
            }

            float currentOffset() {
                return startOffset + (targetOffset - startOffset) * progress();
            }

            float currentScale() {
                return startScale + (targetScale - startScale) * progress();
            }
        }
    }

}
