package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyTheme;

/**
 * One navigation destination: icon and label in a single container, so they can never drift
 * apart. Used for the bottom bar, the navigation rail and the floating pill dock.
 *
 * <p>Geometry is fixed per style and independent of the theme: a 24 dp icon centred in its
 * indicator (64×32 dp bar, 56×32 dp rail, 48–60 dp circle for the pill), the label directly
 * below with no font padding, and at least a 48 dp touch target. Selecting an item only changes
 * colours and the icon's fill, never sizes, so the row doesn't reflow.
 */
public final class NavItem extends LinearLayout {
    public static final int STYLE_BAR = 0, STYLE_RAIL = 1, STYLE_PILL = 2;

    private final EppyTheme t;
    private final int style;
    private final int icon;
    private final String label;
    private final FrameLayout indicator;
    private final ImageView iconView;
    private final TextView labelView;
    private final int indicatorRadius;
    private boolean selected;

    public NavItem(Context c, EppyTheme t, int icon, String label, int style) {
        super(c);
        this.t = t;
        this.style = style;
        this.icon = icon;
        this.label = label;
        setOrientation(VERTICAL);
        setGravity(Gravity.CENTER);
        setClickable(true);
        setFocusable(true);
        setMinimumHeight(Ui.dp(c, 48));
        setMinimumWidth(Ui.dp(c, 48));

        indicator = new FrameLayout(c);
        iconView = new ImageView(c);
        indicator.addView(iconView, new FrameLayout.LayoutParams(Ui.dp(c, 24), Ui.dp(c, 24), Gravity.CENTER));
        int iw, ih;
        if (style == STYLE_PILL) {
            iw = ih = Ui.dp(c, 48);
            indicatorRadius = iw / 2;
        } else {
            iw = Ui.dp(c, style == STYLE_RAIL ? 56 : 64);
            ih = Ui.dp(c, 32);
            indicatorRadius = ih / 2;
        }
        addView(indicator, new LayoutParams(iw, ih));

        labelView = Ui.label(c, t, label, 12, 600, t.onSurfaceVariant);
        labelView.setIncludeFontPadding(false);
        // Navigation labels scale with the font setting up to 130 %, as Material 3 recommends,
        // so four destinations still fit on a phone at 200 %; content text scales fully.
        float scale = Math.min(1.3f, c.getResources().getConfiguration().fontScale);
        labelView.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, 12f * scale * c.getResources().getDisplayMetrics().density);
        labelView.setGravity(Gravity.CENTER_HORIZONTAL);
        labelView.setSingleLine(true);
        labelView.setEllipsize(TextUtils.TruncateAt.END);
        LayoutParams ll = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        ll.topMargin = Ui.dp(c, 4);
        if (style != STYLE_PILL) addView(labelView, ll);
        setBackground(Ui.ripple(t, null, Ui.dp(c, 16)));
        apply();
    }

    public int icon() {
        return icon;
    }

    public View iconView() {
        return iconView;
    }

    public View labelView() {
        return labelView;
    }

    public View indicatorView() {
        return indicator;
    }

    @Override
    public void setSelected(boolean selected) {
        super.setSelected(selected);
        if (this.selected == selected && iconView.getDrawable() != null) return;
        this.selected = selected;
        apply();
    }

    private void apply() {
        int fg, bg;
        if (style == STYLE_PILL) {
            fg = selected ? t.navSelectedFg : t.onSurfaceVariant;
            bg = selected ? t.navSelectedBg : 0;
        } else {
            fg = selected ? t.onSecondaryContainer : t.onSurfaceVariant;
            bg = selected ? t.secondaryContainer : 0;
        }
        indicator.setBackground(Ui.rounded(bg, indicatorRadius));
        iconView.setImageDrawable(new EppyIcon(icon, fg, selected));
        labelView.setTextColor(selected ? t.onSurface : t.onSurfaceVariant);
        setContentDescription(label + (selected ? ", selected" : ""));
    }
}
