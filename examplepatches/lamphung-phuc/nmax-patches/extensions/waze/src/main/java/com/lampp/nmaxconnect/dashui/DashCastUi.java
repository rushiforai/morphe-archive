package com.lampp.nmaxconnect.dashui;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Locale;

/**
 * The patched map app's phone UI while the dash can have the map (it navigates, NmaxConnect attached), in Material 3
 * from the app's own theme (its color roles and type styles, so it follows its light/dark): a round cast button over
 * the map that moves the map between the dash and the phone (filled "cast connected" while the dash has it), and while
 * the dash has it, a "Map is on the dash" note over the map's blank surface. Main thread only.
 *
 * Shared by both patches (tools/gmap-patch/build.sh and tools/wazemod-patch/patch.py compile this same file).
 */
public final class DashCastUi {
    private static WeakReference<ImageButton> button = new WeakReference<>(null);
    /** The note drawn on the map container's overlay, and that container. */
    private static WeakReference<NoteDrawable> note = new WeakReference<>(null);
    private static WeakReference<ViewGroup> noteHost = new WeakReference<>(null);
    /** Whether the dash has the map now: the map's touch listener swallows touches then. */
    private static volatile boolean blocking;

    private DashCastUi() {
    }

    /**
     * @param map the app's map SurfaceView (the note goes right above it, under the app's own controls); null if unknown
     * @param dashTurn the dash can have the map (button shown)
     * @param onDash the dash has the map now (note shown, button filled)
     * @param blockTouches set a touch listener on the map view that swallows touches while the dash has the map (Waze,
     *     whose gestures live in the map view's onTouchEvent); Maps' gestures live in its container, blocked by a patch
     *     hook instead. A pan or zoom on the blank phone map would move the dash map unseen.
     */
    public static void update(Activity a, Object map, boolean dashTurn, boolean onDash, Runnable flip, boolean blockTouches) {
        ImageButton b = button.get();
        if (dashTurn && (b == null || b.getContext() != a)) b = addButton(a, flip);
        if (b != null) {
            b.setVisibility(dashTurn ? View.VISIBLE : View.GONE);
            style(b, onDash);
        }
        blocking = dashTurn && onDash;
        if (blockTouches && map instanceof View) ((View) map).setOnTouchListener((v, e) -> blocking);
        boolean wantNote = dashTurn && onDash && map instanceof View;
        if (blockTouches) {
            // Waze: its map sits in a Compose AndroidView holder, which neither lays out extra children nor draws a
            // ViewGroup overlay, so the note is the map view's own foreground (bounds follow the view).
            if (map instanceof View) {
                View m = (View) map;
                boolean has = m.getForeground() instanceof NoteDrawable;
                if (wantNote && !has) m.setForeground(new NoteDrawable(noteView(a)));
                else if (!wantNote && has) m.setForeground(null);
            }
            return;
        }
        // Maps: drawn on the map container's overlay (the container takes no other child, it throws). Above the map's
        // blank surface, under Maps' own cards and controls.
        ViewGroup host = wantNote && ((View) map).getParent() instanceof ViewGroup ? (ViewGroup) ((View) map).getParent() : null;
        wantNote = host != null;
        NoteDrawable n = note.get();
        ViewGroup was = noteHost.get();
        if (n != null && (was != host || !wantNote)) {
            if (was != null) was.getOverlay().remove(n);
            note = new WeakReference<>(null);
            noteHost = new WeakReference<>(null);
            n = null;
        }
        if (wantNote && n == null) {
            n = new NoteDrawable(noteView(a));
            host.getOverlay().add(n);
            note = new WeakReference<>(n);
            noteHost = new WeakReference<>(host);
        }
        if (n != null) n.setBounds(0, 0, host.getWidth(), host.getHeight()); // follows a resized container
    }

    private static boolean vi() {
        return "vi".equals(Locale.getDefault().getLanguage());
    }

    // M3 FAB: 56dp circle, icon 24dp, no shadow (tonal), 16dp from the screen edge.
    private static ImageButton addButton(Activity a, Runnable flip) {
        ImageButton old = button.get();
        if (old != null && old.getParent() instanceof ViewGroup) ((ViewGroup) old.getParent()).removeView(old);
        ViewGroup content = a.findViewById(android.R.id.content);
        if (content == null) return null;
        ImageButton b = new ImageButton(a);
        b.setScaleType(ImageView.ScaleType.CENTER);
        b.setElevation(0f);
        b.setStateListAnimator(null);
        b.setOnClickListener(v -> flip.run());
        int size = dp(a, 56);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size, Gravity.START | Gravity.CENTER_VERTICAL);
        lp.leftMargin = dp(a, 16);
        content.addView(b, lp);
        button = new WeakReference<>(b);
        return b;
    }

    private static void style(ImageButton b, boolean onDash) {
        Context c = b.getContext();
        // On the dash: the active cast, primaryContainer; on the phone: a plain map control, surfaceContainerHigh.
        // Themes without the Material 3 roles (Waze) fall back to the platform accent / background pair.
        int fill = color(c, onDash ? "colorPrimaryContainer" : "colorSurfaceContainerHigh",
            onDash ? android.R.attr.colorAccent : android.R.attr.colorBackground);
        int ink = color(c, onDash ? "colorOnPrimaryContainer" : "colorOnSurface",
            onDash ? android.R.attr.colorBackground : android.R.attr.textColorPrimary);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(fill);
        b.setBackground(new RippleDrawable(ColorStateList.valueOf(color(c, "colorControlHighlight",
            android.R.attr.colorControlHighlight)), circle, null));
        b.setImageDrawable(new CastIcon(onDash, ink, dp(c, 24)));
        b.setContentDescription(onDash ? (vi() ? "Xem bản đồ trên điện thoại" : "Show the map on the phone")
            : (vi() ? "Đưa bản đồ lên đồng hồ" : "Show the map on the dash"));
    }

    /** Over the map's blank surface: cast icon, "Map is on the dash" and how to get it back. */
    private static View noteView(Activity a) {
        LinearLayout column = new LinearLayout(a);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setGravity(Gravity.CENTER);
        int pad = dp(a, 24);
        column.setPadding(pad, pad, pad, pad);
        column.setBackgroundColor(color(a, "colorSurfaceContainerLow", android.R.attr.colorBackground));

        ImageView icon = new ImageView(a);
        int size = dp(a, 48);
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        icon.setImageDrawable(new CastIcon(true, color(a, "colorOnSurfaceVariant", android.R.attr.textColorSecondary), size));
        column.addView(icon, new LinearLayout.LayoutParams(size, size));

        TextView title = new TextView(a);
        textStyle(title, "textAppearanceTitleMedium", "colorOnSurface", android.R.attr.textColorPrimary);
        title.setText(vi() ? "Bản đồ đang ở trên đồng hồ" : "Map is on the dash");
        title.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams tl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT);
        tl.topMargin = dp(a, 16);
        column.addView(title, tl);

        TextView body = new TextView(a);
        textStyle(body, "textAppearanceBodyMedium", "colorOnSurfaceVariant", android.R.attr.textColorSecondary);
        body.setText(vi() ? "Chạm nút truyền để xem trên điện thoại" : "Tap the cast button to see it here");
        body.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams bl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT);
        bl.topMargin = dp(a, 8);
        column.addView(body, bl);
        return column;
    }

    /** Draws a detached view (laid out to the drawable's bounds) so it can sit in a ViewOverlay. */
    static final class NoteDrawable extends Drawable {
        private final View view;

        NoteDrawable(View view) {
            this.view = view;
        }

        @Override
        protected void onBoundsChange(android.graphics.Rect b) {
            view.measure(View.MeasureSpec.makeMeasureSpec(b.width(), View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(b.height(), View.MeasureSpec.EXACTLY));
            view.layout(0, 0, b.width(), b.height());
        }

        @Override
        public void draw(Canvas canvas) {
            int save = canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            view.draw(canvas);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.OPAQUE;
        }
    }

    private static void textStyle(TextView t, String appearance, String colorAttr, int fallbackColor) {
        int res = resolve(t.getContext(), appearance, 0, false);
        if (res != 0) t.setTextAppearance(res);
        t.setTextColor(color(t.getContext(), colorAttr, fallbackColor));
    }

    /** A Maps theme color by attribute name (Material 3 roles), else the platform attribute. */
    private static int color(Context c, String attr, int fallbackAttr) {
        TypedValue v = new TypedValue();
        int id = c.getResources().getIdentifier(attr, "attr", c.getPackageName());
        if (id == 0 || !c.getTheme().resolveAttribute(id, v, true)) c.getTheme().resolveAttribute(fallbackAttr, v, true);
        if (v.type >= TypedValue.TYPE_FIRST_COLOR_INT && v.type <= TypedValue.TYPE_LAST_COLOR_INT) return v.data;
        return v.resourceId != 0 ? c.getColorStateList(v.resourceId).getDefaultColor() : 0xff808080;
    }

    private static int resolve(Context c, String attr, int fallback, boolean data) {
        TypedValue v = new TypedValue();
        int id = c.getResources().getIdentifier(attr, "attr", c.getPackageName());
        if (id == 0 || !c.getTheme().resolveAttribute(id, v, true)) return fallback;
        return data ? v.data : v.resourceId;
    }

    private static int dp(Context c, int dp) {
        return Math.round(dp * c.getResources().getDisplayMetrics().density);
    }

    /**
     * Material Symbols "cast" / "cast_connected" on its 24-unit grid: a screen whose lower-left corner opens into three
     * broadcast arcs (a dot and two rings around (1, 21)); connected also fills the screen's inner panel.
     */
    static final class CastIcon extends Drawable {
        private final boolean connected;
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path frame = new Path();
        private final Path panel = new Path();
        private final int size;

        CastIcon(boolean connected, int color, int size) {
            this.connected = connected;
            this.size = size;
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(2f);
            stroke.setColor(color);
            fill.setStyle(Paint.Style.FILL);
            fill.setColor(color);
            frame.moveTo(2f, 8f);
            frame.lineTo(2f, 5f);
            frame.arcTo(new RectF(2f, 4f, 4f, 6f), 180f, 90f);
            frame.lineTo(21f, 4f);
            frame.arcTo(new RectF(20f, 4f, 22f, 6f), 270f, 90f);
            frame.lineTo(22f, 19f);
            frame.arcTo(new RectF(20f, 18f, 22f, 20f), 0f, 90f);
            frame.lineTo(14f, 20f);
            // cast_connected's inner panel, cut away around the arcs
            panel.addRect(5f, 7f, 19f, 17f, Path.Direction.CW);
            Path rings = new Path();
            rings.addCircle(1f, 21f, 12.5f, Path.Direction.CW);
            panel.op(rings, Path.Op.DIFFERENCE);
        }

        @Override
        public void draw(Canvas canvas) {
            int save = canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(getBounds().width() / 24f, getBounds().height() / 24f);
            canvas.drawPath(frame, stroke);
            canvas.drawArc(new RectF(-2f, 18f, 4f, 24f), 270f, 90f, true, fill);
            canvas.drawArc(new RectF(-5f, 15f, 7f, 27f), 270f, 90f, false, stroke);
            canvas.drawArc(new RectF(-9f, 11f, 11f, 31f), 270f, 90f, false, stroke);
            if (connected) canvas.drawPath(panel, fill);
            canvas.restoreToCount(save);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            stroke.setAlpha(alpha);
            fill.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            stroke.setColorFilter(filter);
            fill.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
