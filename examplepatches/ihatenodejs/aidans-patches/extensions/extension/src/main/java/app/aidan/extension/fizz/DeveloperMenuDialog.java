package app.aidan.extension.fizz;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

public final class DeveloperMenuDialog {
    private static final int COLOR_BG = 0xFF141416;
    private static final int COLOR_CARD = 0xFF202024;
    private static final int COLOR_ACCENT = 0xFF7F00FF;
    private static final int COLOR_TEXT_PRIMARY = 0xFFFFFFFF;
    private static final int COLOR_TEXT_SECONDARY = 0xFF8E8E93;

    private DeveloperMenuDialog() {
    }

    public static void show(
        final Activity activity,
        final boolean mobileStudioEnabled
    ) {
        if (activity == null || activity.isFinishing()) {
            return;
        }

        final Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedBackground(COLOR_BG, dp(activity, 16)));
        root.setPadding(dp(activity, 20), dp(activity, 20), dp(activity, 20), dp(activity, 24));

        // Header
        addHeader(root, activity, "Developer Settings", "Fizz Mobile Studio", new Runnable() {
            @Override
            public void run() {
                dialog.dismiss();
            }
        });

        // Scrollable content
        final ScrollView scrollView = new ScrollView(activity);
        scrollView.setVerticalScrollBarEnabled(false);
        final LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        scrollView.addView(content);

        // Section 1: Quick Actions (Mobile Studio & Restart)
        if (mobileStudioEnabled) {
            addSectionHeader(content, activity, "QUICK ACTIONS");

            addActionItem(content, activity, "Launch Mobile Studio", "Slide out internal developer drawer", new Runnable() {
                @Override
                public void run() {
                    dialog.dismiss();
                    DeveloperMenuBridge.openMobileStudio(activity);
                }
            });

            addActionItem(content, activity, "Restart Application", "Apply pending state & overlay changes", new Runnable() {
                @Override
                public void run() {
                    dialog.dismiss();
                    DeveloperMenuBridge.restartApp(activity);
                }
            });
        }

        root.addView(scrollView, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

        dialog.setContentView(root);
        final Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int width = (int) (activity.getResources().getDisplayMetrics().widthPixels * 0.90f);
            window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
        }

        dialog.show();
    }

    // --- UI Helper Components ---

    private static void addHeader(ViewGroup parent, Context context, String title, String subtitle, final Runnable onClose) {
        final LinearLayout headerLayout = new LinearLayout(context);
        headerLayout.setOrientation(LinearLayout.HORIZONTAL);
        headerLayout.setGravity(Gravity.CENTER_VERTICAL);
        headerLayout.setPadding(0, 0, 0, dp(context, 16));

        final LinearLayout titleLayout = new LinearLayout(context);
        titleLayout.setOrientation(LinearLayout.VERTICAL);

        final TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextColor(COLOR_TEXT_PRIMARY);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleLayout.addView(titleView);

        final TextView subView = new TextView(context);
        subView.setText(subtitle);
        subView.setTextColor(COLOR_TEXT_SECONDARY);
        subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        titleLayout.addView(subView);

        headerLayout.addView(titleLayout, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        final TextView closeBtn = new TextView(context);
        closeBtn.setText("✕");
        closeBtn.setTextColor(COLOR_TEXT_SECONDARY);
        closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        closeBtn.setGravity(Gravity.CENTER);
        closeBtn.setPadding(dp(context, 10), dp(context, 6), dp(context, 10), dp(context, 6));
        closeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onClose.run();
            }
        });
        headerLayout.addView(closeBtn);

        parent.addView(headerLayout);
    }

    private static void addSectionHeader(ViewGroup parent, Context context, String title) {
        final TextView sectionView = new TextView(context);
        sectionView.setText(title);
        sectionView.setTextColor(COLOR_ACCENT);
        sectionView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        sectionView.setTypeface(Typeface.DEFAULT_BOLD);
        sectionView.setPadding(dp(context, 4), dp(context, 14), dp(context, 4), dp(context, 8));
        parent.addView(sectionView);
    }

    private static void addActionItem(ViewGroup parent, Context context, String title, String subtitle, final Runnable onClick) {
        final LinearLayout card = createCardView(context);
        card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onClick.run();
            }
        });

        final LinearLayout textLayout = new LinearLayout(context);
        textLayout.setOrientation(LinearLayout.VERTICAL);

        final TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextColor(COLOR_TEXT_PRIMARY);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        textLayout.addView(titleView);

        if (subtitle != null && !subtitle.isEmpty()) {
            final TextView subView = new TextView(context);
            subView.setText(subtitle);
            subView.setTextColor(COLOR_TEXT_SECONDARY);
            subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            textLayout.addView(subView);
        }

        card.addView(textLayout, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        final TextView chevron = new TextView(context);
        chevron.setText("➔");
        chevron.setTextColor(COLOR_ACCENT);
        chevron.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        card.addView(chevron);

        parent.addView(card);
    }

    private static LinearLayout createCardView(Context context) {
        final LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setBackground(createRoundedBackground(COLOR_CARD, dp(context, 12)));
        card.setPadding(dp(context, 16), dp(context, 14), dp(context, 16), dp(context, 14));

        final LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins(0, dp(context, 4), 0, dp(context, 4));
        card.setLayoutParams(lp);
        return card;
    }

    private static GradientDrawable createRoundedBackground(int color, int radiusPx) {
        final GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.RECTANGLE);
        drawable.setColor(color);
        drawable.setCornerRadius(radiusPx);
        return drawable;
    }

    private static int dp(Context context, int dpVal) {
        return (int) TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dpVal,
            context.getResources().getDisplayMetrics()
        );
    }
}
