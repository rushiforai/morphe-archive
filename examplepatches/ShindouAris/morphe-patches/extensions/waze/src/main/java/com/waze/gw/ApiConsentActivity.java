package com.waze.gw;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * "com.wazemod.api.action.REQUEST_ACCESS", started for result by a third-party app. The caller is
 * identified by getCallingPackage(), and its name and icon come from the system, never from the
 * intent. Already allowed -> RESULT_OK without asking again. Drawn as the mod's bottom sheet
 * (same look as the settings sheets) over a dimmed, translucent activity.
 */
public final class ApiConsentActivity extends Activity {
    private static final long ALLOW_DELAY_MS = 1000L;   // guards against a tap meant for the app behind
    private static final int COLOR_TEXT = 0xFFF3F4F6;
    private static final int COLOR_MUTED = 0xFF9AA3B2;
    private static final int COLOR_CONTROL = 0xFF1B1F29;
    private static final int COLOR_BORDER = 0xFF2A2F3B;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        final String caller = getCallingPackage();
        if (caller == null || caller.equals(getPackageName())) {
            finishWith(RESULT_CANCELED);
            return;
        }
        if (DataApiGrants.isGranted(this, caller)) {
            finishWith(RESULT_OK);
            return;
        }
        PackageManager pm = getPackageManager();
        CharSequence label;
        Drawable icon;
        try {
            ApplicationInfo info = pm.getApplicationInfo(caller, 0);
            label = pm.getApplicationLabel(info);
            icon = pm.getApplicationIcon(info);
        } catch (PackageManager.NameNotFoundException ignored) {
            finishWith(RESULT_CANCELED);
            return;
        }
        setContentView(buildSheet(caller, label, icon));
    }

    @Override public void onBackPressed() {
        finishWith(RESULT_CANCELED);
    }

    private View buildSheet(final String caller, CharSequence label, Drawable icon) {
        FrameLayout scrim = new FrameLayout(this);
        scrim.setBackgroundColor(0x99000000);
        scrim.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { finishWith(RESULT_CANCELED); }
        });

        LinearLayout sheet = new LinearLayout(this);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setClickable(true);                        // taps on the sheet never dismiss it
        sheet.setPadding(dp(18), dp(10), dp(18), dp(20));
        GradientDrawable sheetBg = new GradientDrawable();
        sheetBg.setColor(0xFF151821);
        sheetBg.setCornerRadius(dp(24));
        sheetBg.setStroke(dp(1), COLOR_BORDER);
        sheet.setBackground(sheetBg);

        View handle = new View(this);
        GradientDrawable handleBg = new GradientDrawable();
        handleBg.setColor(0xFF626A79);
        handleBg.setCornerRadius(dp(4));
        handle.setBackground(handleBg);
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(44), dp(4));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handleLp.bottomMargin = dp(18);
        sheet.addView(handle, handleLp);

        LinearLayout head = new LinearLayout(this);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setGravity(Gravity.CENTER_VERTICAL);
        ImageView appIcon = new ImageView(this);
        appIcon.setImageDrawable(icon);
        head.addView(appIcon, new LinearLayout.LayoutParams(dp(52), dp(52)));
        LinearLayout titles = new LinearLayout(this);
        titles.setOrientation(LinearLayout.VERTICAL);
        titles.addView(text(label.toString(), 20, COLOR_TEXT, true));
        titles.addView(text(I18n.tr("api.wants_to_connect_to_wazemod_to"), 14, COLOR_MUTED, false));
        LinearLayout.LayoutParams titlesLp = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titlesLp.leftMargin = dp(14);
        head.addView(titles, titlesLp);
        sheet.addView(head);

        TextView question = text(I18n.tr("api.allow_it_make_sure_you_trust"),
                16, COLOR_TEXT, false);
        question.setPadding(0, dp(18), 0, dp(12));
        sheet.addView(question);

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(14), dp(12), dp(14), dp(12));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(COLOR_CONTROL);
        cardBg.setCornerRadius(dp(14));
        cardBg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(cardBg);
        card.addView(text(I18n.tr("api.data_shared"), 13, COLOR_MUTED, true));
        TextView shared = text(I18n.tr("api.speed_speed_limit_turn_direction_and"), 14, COLOR_TEXT, false);
        shared.setPadding(0, dp(4), 0, dp(6));
        card.addView(shared);
        card.addView(text(I18n.tr("api.does_not_include_gps_location_you"), 13, COLOR_MUTED, false));
        sheet.addView(card);

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams actionsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        actionsLp.topMargin = dp(18);

        TextView deny = button(I18n.tr("api.deny"), COLOR_CONTROL, COLOR_BORDER);
        deny.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { finishWith(RESULT_CANCELED); }
        });
        actions.addView(deny, new LinearLayout.LayoutParams(0, dp(52), 1f));

        final TextView allow = button(I18n.tr("api.allow"), 0xFF1687C9, 0xFF55C7FF);
        allow.setEnabled(false);
        allow.setAlpha(0.45f);
        allow.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                DataApiGrants.grant(ApiConsentActivity.this, caller);
                finishWith(RESULT_OK);
            }
        });
        allow.postDelayed(new Runnable() {
            @Override public void run() { allow.setEnabled(true); allow.setAlpha(1f); }
        }, ALLOW_DELAY_MS);
        LinearLayout.LayoutParams allowLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        allowLp.leftMargin = dp(10);
        actions.addView(allow, allowLp);
        sheet.addView(actions, actionsLp);

        int width = Math.min(getResources().getDisplayMetrics().widthPixels - dp(16), dp(560));
        FrameLayout.LayoutParams sheetLp = new FrameLayout.LayoutParams(width,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        sheetLp.bottomMargin = dp(8);
        scrim.addView(sheet, sheetLp);
        // targetSdk 35+ is edge-to-edge: keep the sheet above the navigation/gesture bar.
        scrim.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override public android.view.WindowInsets onApplyWindowInsets(View v,
                    android.view.WindowInsets insets) {
                v.setPadding(0, insets.getSystemWindowInsetTop(), 0,
                        insets.getSystemWindowInsetBottom());
                return insets;
            }
        });
        return scrim;
    }

    private TextView text(String value, float sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    private TextView button(String label, int fill, int stroke) {
        TextView view = text(label, 16, 0xFFFFFFFF, true);
        view.setGravity(Gravity.CENTER);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(fill);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), stroke);
        view.setBackground(bg);
        return view;
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private void finishWith(int result) {
        setResult(result);
        finish();
    }
}
