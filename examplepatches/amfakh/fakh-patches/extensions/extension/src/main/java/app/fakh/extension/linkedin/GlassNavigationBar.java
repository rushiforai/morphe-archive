package app.fakh.extension.linkedin;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.ViewGroup;

/** Draws LinkedIn's bottom bar as a floating, translucent capsule, in the style of Morphe's glass navigation bar. */
final class GlassNavigationBar {
    private static final float FILL_ALPHA = 0.85f;
    private static final int SIDE_MARGIN_DP = 12;
    private static final int INNER_PADDING_DP = 14;
    /** The widest a tab gets, so the capsule stays compact on a wide screen. */
    private static final int MAX_TAB_DP = 96;

    private GlassNavigationBar() {
    }

    /** Replaces the background of the bar with the capsule, and removes what the app draws apart from it. */
    static void install(View bar, ViewGroup tabs) {
        Drawable background = tabs.getBackground();
        int color = background instanceof ColorDrawable ? ((ColorDrawable) background).getColor() : Color.DKGRAY;
        tabs.setBackground(null);
        // The app sets the visibility and alpha of these itself when the tab changes.
        for (String name : new String[]{"bb_slim_bottom_bar_shadow", "bottom_nav_indicator_view"}) {
            View view = NavigationBar.child(bar, name);
            if (view != null) view.setScaleY(0);
        }
        Activity activity = activity(bar.getContext());
        if (activity != null) {
            activity.getWindow().setNavigationBarColor(Color.TRANSPARENT);
            activity.getWindow().setNavigationBarContrastEnforced(false);
        }
        bar.setElevation(0);
        bar.setBackground(new Capsule(tabs, color, bar.getResources().getDisplayMetrics().density));
    }

    /** Gives the tabs equal shares of the capsule, and a ripple that stays inside the tab. */
    static void arrangeTabs(ViewGroup tabs, int barWidth) {
        int count = tabs.getChildCount();
        if (count == 0 || barWidth <= 0) return;
        float density = tabs.getResources().getDisplayMetrics().density;
        int width = Math.min((barWidth - 2 * Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density)) / count,
                Math.round(MAX_TAB_DP * density));
        for (int i = 0; i < count; i++) {
            View tab = tabs.getChildAt(i);
            ViewGroup.LayoutParams params = tab.getLayoutParams();
            if (params.width != width) {
                params.width = width;
                tab.setLayoutParams(params);
            }
            if (!(tab.getBackground() instanceof TabRipple)) tab.setBackground(new TabRipple());
        }
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /** A ripple that stays inside its tab, as a pill, where LinkedIn's own one spreads past the capsule. */
    private static final class TabRipple extends RippleDrawable {
        TabRipple() {
            super(ColorStateList.valueOf(0x33FFFFFF), null, mask());
        }

        private static Drawable mask() {
            GradientDrawable mask = new GradientDrawable();
            mask.setColor(Color.WHITE);
            mask.setCornerRadius(Float.MAX_VALUE);
            return mask;
        }
    }

    /** The capsule, around the tabs, which the row centers, with the bar's own color as a translucent fill. */
    private static final class Capsule extends Drawable {
        private final ViewGroup tabs;
        private final float density;
        private final RectF rect = new RectF();
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint sheen = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint edge = new Paint(Paint.ANTI_ALIAS_FLAG);

        Capsule(ViewGroup tabs, int color, float density) {
            this.tabs = tabs;
            this.density = density;
            fill.setColor(Color.argb(Math.round(255 * FILL_ALPHA), Color.red(color), Color.green(color), Color.blue(color)));
            fill.setShadowLayer(10 * density, 0, 3 * density, 0x50000000);
            edge.setStyle(Paint.Style.STROKE);
            edge.setStrokeWidth(density);
        }

        @Override
        public void draw(Canvas canvas) {
            int count = tabs.getChildCount();
            if (count == 0) return;
            View row = (View) tabs.getParent();
            float top = row.getTop() + tabs.getTop();
            float left = row.getLeft() + tabs.getLeft();
            float padding = INNER_PADDING_DP * density;
            rect.set(left + tabs.getChildAt(0).getLeft() - padding, top,
                    left + tabs.getChildAt(count - 1).getRight() + padding, top + tabs.getHeight());
            sheen.setShader(new LinearGradient(0, rect.top, 0, rect.bottom, 0x1FFFFFFF, Color.TRANSPARENT,
                    Shader.TileMode.CLAMP));
            edge.setShader(new LinearGradient(0, rect.top, 0, rect.bottom, 0x55FFFFFF, 0x12FFFFFF,
                    Shader.TileMode.CLAMP));
            float radius = rect.height() / 2;
            canvas.drawRoundRect(rect, radius, radius, fill);
            canvas.drawRoundRect(rect, radius, radius, sheen);
            canvas.drawRoundRect(rect, radius, radius, edge);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
