/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * The sheet Copy text of the post and comment menus opens: the whole text, which can be selected with the usual
 * handles, and a Copy all button. LinkedIn does not let people copy what others write.
 */
final class CopyText {
    private CopyText() {
    }

    /** A scroll view that grows with its text up to a height, so the buttons under it always stay on screen. */
    private static final class LimitedScrollView extends ScrollView {
        private final int maxHeight;

        LimitedScrollView(Context context, int maxHeight) {
            super(context);
            this.maxHeight = maxHeight;
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            super.onMeasure(widthSpec, View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
        }
    }

    /**
     * A dialog with the text, which can be selected with the usual handles, and a Copy all button. It is built by hand
     * with its own colors: the system alert theme can hide its buttons below a long text or on the app's own colors.
     */
    static Dialog show(Activity activity, String text) {
        float density = activity.getResources().getDisplayMetrics().density;
        boolean night = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        int background = night ? (Settings.pitchBlack() ? 0xFF0D0D0D : 0xFF26262A) : 0xFFFFFFFF;
        int foreground = night ? 0xFFEDEDF0 : 0xFF1B1B1F;
        int accent = app.fakh.extension.shared.MaterialYou.accent(activity, Settings.materialYou(), 0xFF0B57D0, 0xFF8AB4F8);
        int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
        int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        TextView body = new TextView(activity);
        body.setText(text);
        body.setTextSize(16);
        body.setTextColor(foreground);
        body.setTextIsSelectable(true);
        int pad = Math.round(20 * density);
        body.setPadding(pad, pad, pad, pad);
        ScrollView scroll = new LimitedScrollView(activity, Math.round(screenHeight * 0.6f));
        scroll.addView(body);

        LinearLayout buttons = new LinearLayout(activity);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.END);
        buttons.setPadding(pad / 2, 0, pad / 2, pad / 2);
        TextView close = button(activity, I18n.tr("Close"), accent);
        close.setOnClickListener(v -> dialog.dismiss());
        TextView copy = button(activity, I18n.tr("Copy all"), accent);
        copy.setOnClickListener(v -> {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText("text", text));
            Downloads.toast(activity, "Text copied");
            dialog.dismiss();
        });
        buttons.addView(close);
        buttons.addView(copy);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(background);
        shape.setCornerRadius(24 * density);
        root.setBackground(shape);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(buttons, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(Math.round(screenWidth * 0.92f), ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        dialog.show();
        return dialog;
    }

    private static TextView button(Context context, String label, int color) {
        float density = context.getResources().getDisplayMetrics().density;
        TextView view = new TextView(context);
        view.setText(label);
        view.setTextSize(15);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setTextColor(color);
        view.setGravity(Gravity.CENTER);
        view.setPadding(Math.round(18 * density), Math.round(12 * density), Math.round(18 * density),
                Math.round(12 * density));
        view.setClickable(true);
        return view;
    }
}
