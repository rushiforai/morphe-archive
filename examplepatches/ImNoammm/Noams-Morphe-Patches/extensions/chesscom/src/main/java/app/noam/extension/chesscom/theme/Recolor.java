package app.noam.extension.chesscom.theme;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import android.widget.TextView;

import app.noam.extension.chesscom.Utils;

/**
 * The older (View-based) screens: their colours come from fixed resources, so AMOLED and the
 * accent colour are applied to the views themselves, every time a screen lays out new views.
 */
public final class Recolor {
    private Recolor() {}

    /** Called for every activity of the app as it is created. */
    public static void onActivityCreated(Activity activity) {
        boolean amoled = Amoled.enabled();
        boolean accent = Accent.enabled();
        if (!amoled && !accent) return;
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            if (amoled) window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
            View decor = window.getDecorView();
            decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> recolor(decor, amoled, accent));
        } catch (Throwable throwable) {
            Utils.logError("Recolouring failed", throwable);
        }
    }

    private static int map(int color, boolean amoled, boolean accent) {
        if (amoled) color = Amoled.legacy(color);
        if (accent) color = Accent.legacy(color);
        return color;
    }

    private static ColorStateList map(ColorStateList list, boolean amoled, boolean accent) {
        if (list == null) return null;
        int color = list.getDefaultColor();
        int mapped = map(color, amoled, accent);
        return mapped == color ? null : ColorStateList.valueOf(mapped);
    }

    private static void recolor(View view, boolean amoled, boolean accent) {
        Drawable background = view.getBackground();
        if (background instanceof ColorDrawable) {
            int color = ((ColorDrawable) background).getColor();
            int mapped = map(color, amoled, accent);
            if (mapped != color) ((ColorDrawable) background).setColor(mapped);
        } else if (background instanceof GradientDrawable && Build.VERSION.SDK_INT >= 24) {
            ColorStateList replaced = map(((GradientDrawable) background).getColor(), amoled, accent);
            if (replaced != null) ((GradientDrawable) background.mutate()).setColor(replaced);
        }
        if (accent) {
            ColorStateList tint = map(view.getBackgroundTintList(), false, true);
            if (tint != null) view.setBackgroundTintList(tint);
            if (view instanceof TextView) {
                TextView text = (TextView) view;
                int color = text.getCurrentTextColor();
                int mapped = Accent.legacy(color);
                if (mapped != color) text.setTextColor(mapped);
            } else if (view instanceof ImageView) {
                ColorStateList imageTint = map(((ImageView) view).getImageTintList(), false, true);
                if (imageTint != null) ((ImageView) view).setImageTintList(imageTint);
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) recolor(group.getChildAt(i), amoled, accent);
        }
    }
}
