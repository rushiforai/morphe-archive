package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyTheme;

/** A Material 3 modal bottom sheet built on a plain FrameLayout overlay. */
public final class Sheet {
    private final FrameLayout overlay;
    private final LinearLayout sheet;
    private final LinearLayout items;
    private final EppyTheme t;
    private final Context c;
    private final ViewGroup host;
    private Runnable onDismiss;

    public Sheet(ViewGroup host, EppyTheme t, String title) {
        this.host = host;
        this.t = t;
        this.c = host.getContext();
        overlay = new FrameLayout(c);
        overlay.setBackgroundColor(t.scrim);
        overlay.setClickable(true);
        overlay.setOnClickListener(v -> dismiss());
        overlay.setContentDescription("Close sheet");

        sheet = Ui.column(c);
        float r = Ui.dp(c, 28);
        android.graphics.drawable.GradientDrawable bg = new android.graphics.drawable.GradientDrawable();
        bg.setColor(t.surfaceContainerLow);
        bg.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
        sheet.setBackground(bg);
        sheet.setClickable(true);
        // The sheet's surface runs under the navigation bar; its content stays above it.
        int navInset = 0;
        android.view.WindowInsets wi = host.getRootWindowInsets();
        if (wi != null) {
            navInset = Math.max(wi.getInsets(android.view.WindowInsets.Type.systemBars()).bottom,
                    wi.getInsets(android.view.WindowInsets.Type.ime()).bottom);
        }
        sheet.setPadding(0, Ui.dp(c, 12), 0, Ui.dp(c, 24) + navInset);

        View handle = new View(c);
        handle.setBackground(Ui.rounded(t.outline, Ui.dp(c, 2)));
        LinearLayout.LayoutParams hl = new LinearLayout.LayoutParams(Ui.dp(c, 32), Ui.dp(c, 4));
        hl.gravity = Gravity.CENTER_HORIZONTAL;
        hl.bottomMargin = Ui.dp(c, 12);
        sheet.addView(handle, hl);

        if (title != null) {
            TextView tv = Ui.text(c, t, title, 20, 600, t.onSurface);
            tv.setPadding(Ui.dp(c, 24), Ui.dp(c, 4), Ui.dp(c, 24), Ui.dp(c, 12));
            sheet.addView(tv);
        }
        ScrollView scroll = new ScrollView(c);
        items = Ui.column(c);
        scroll.addView(items);
        sheet.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int maxW = Ui.dp(c, 640);
        FrameLayout.LayoutParams sl = new FrameLayout.LayoutParams(
                Math.min(maxW, c.getResources().getDisplayMetrics().widthPixels), ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        overlay.addView(sheet, sl);
    }

    public Sheet onDismiss(Runnable r) {
        onDismiss = r;
        return this;
    }

    public LinearLayout content() {
        return items;
    }

    public Sheet item(int icon, String label, String supporting, Runnable action) {
        LinearLayout row = Ui.row(c);
        row.setMinimumHeight(Ui.dp(c, 56));
        row.setPadding(Ui.dp(c, 24), Ui.dp(c, 8), Ui.dp(c, 24), Ui.dp(c, 8));
        row.setBackground(Ui.ripple(t, null, 0));
        ImageView iv = new ImageView(c);
        iv.setImageDrawable(new EppyIcon(icon, t.onSurfaceVariant));
        LinearLayout.LayoutParams il = new LinearLayout.LayoutParams(Ui.dp(c, 24), Ui.dp(c, 24));
        il.rightMargin = Ui.dp(c, 16);
        row.addView(iv, il);
        LinearLayout texts = Ui.column(c);
        texts.addView(Ui.text(c, t, label, 16, 500, t.onSurface));
        if (supporting != null) {
            TextView s = Ui.text(c, t, supporting, 13, 400, t.onSurfaceVariant);
            s.setPadding(0, Ui.dp(c, 4), 0, 0);
            texts.addView(s);
        }
        row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(label + (icon == EppyIcon.CHECK ? ", selected" : ""));
        row.setOnClickListener(v -> {
            Ui.haptic(v, t);
            dismiss();
            if (action != null) action.run();
        });
        items.addView(row, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return this;
    }

    /** The sheet currently on screen, so Back can dismiss it. */
    public static Sheet current;

    public Sheet show() {
        current = this;
        host.addView(overlay, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        if (!t.reduceMotion) {
            overlay.setAlpha(0f);
            overlay.animate().alpha(1f).setDuration(150).start();
            sheet.setTranslationY(Ui.dp(c, 320));
            sheet.animate().translationY(0).setDuration(250)
                    .setInterpolator(new android.view.animation.DecelerateInterpolator(2f)).start();
        }
        sheet.requestFocus();
        return this;
    }

    public boolean isShowing() {
        return overlay.getParent() != null;
    }

    public void dismiss() {
        if (overlay.getParent() == null) return;
        if (current == this) current = null;
        Runnable remove = () -> {
            if (overlay.getParent() != null) ((ViewGroup) overlay.getParent()).removeView(overlay);
            if (onDismiss != null) onDismiss.run();
        };
        if (t.reduceMotion) {
            remove.run();
        } else {
            overlay.animate().alpha(0f).setDuration(150).withEndAction(remove).start();
            sheet.animate().translationY(sheet.getHeight()).setDuration(150).start();
        }
    }
}
