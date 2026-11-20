/*
 * Story mention pill settings (Morphe).
 *
 * The way a custom entry is added to the story "..." bottom sheet (append to the list being
 * built, then intercept the tap) is the approach used by Piko's StoryButton
 * <https://github.com/crimera/piko> (GPLv3; see NOTICE.piko).
 */

package app.morphe.extension.instagram.patches.story;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class StoryMentionSettings {
    private static final String TAG = "StoryMentionIcon";
    private static final String PREFS = "wagg13_story_mention";
    private static final String KEY_ENABLED = "pill_enabled";
    private static final String KEY_STYLE = "pill_style";
    private static final String KEY_POPUP_STYLE = "popup_style";

    private StoryMentionSettings() {
    }

    // ---- hooks ---------------------------------------------------------------------------

    /** Called with the list of entries of the story "..." sheet; appends ours and returns it. */
    public static ArrayList addButtons(ArrayList list) {
        try {
            list.add(menuLabel());
        } catch (Throwable t) {
            Log.e(TAG, "addButtons failed", t);
        }
        return list;
    }

    /** Called when an entry is tapped. Returns true if it was ours (Instagram must then skip it). */
    public static boolean buttonAction(CharSequence text, Context context) {
        try {
            if (text == null || !menuLabel().contentEquals(text)) return false;
            showSettings(context);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "buttonAction failed", t);
            return false;
        }
    }

    // ---- state ---------------------------------------------------------------------------

    // Cached: read on every layout pass of the story view.
    private static volatile Boolean enabledCache;

    public static boolean isEnabled(Context context) {
        Boolean cached = enabledCache;
        if (cached == null) {
            cached = prefs(context).getBoolean(KEY_ENABLED, true);
            enabledCache = cached;
        }
        return cached;
    }

    private static void setEnabled(Context context, boolean enabled) {
        enabledCache = enabled;
        prefs(context).edit().putBoolean(KEY_ENABLED, enabled).apply();
    }

    private static volatile Integer styleCache;

    /** One of StoryMentionIcon.STYLE_*; classic by default. */
    public static int style(Context context) {
        Integer cached = styleCache;
        if (cached == null) {
            int stored = prefs(context).getInt(KEY_STYLE, StoryMentionIcon.STYLE_CLASSIC);
            cached = stored >= 0 && stored < StoryMentionIcon.STYLE_COUNT ? stored : StoryMentionIcon.STYLE_CLASSIC;
            styleCache = cached;
        }
        return cached;
    }

    private static void setStyle(Context context, int style) {
        styleCache = style;
        prefs(context).edit().putInt(KEY_STYLE, style).apply();
    }

    private static volatile Integer popupStyleCache;

    /** One of StoryMentionPopup.STYLE_*; the minimalist centered popup by default. */
    public static int popupStyle(Context context) {
        Integer cached = popupStyleCache;
        if (cached == null) {
            int stored = prefs(context).getInt(KEY_POPUP_STYLE, StoryMentionPopup.STYLE_MINIMAL);
            cached = stored >= 0 && stored < StoryMentionPopup.STYLE_COUNT ? stored : StoryMentionPopup.STYLE_MINIMAL;
            popupStyleCache = cached;
        }
        return cached;
    }

    private static void setPopupStyle(Context context, int style) {
        popupStyleCache = style;
        prefs(context).edit().putInt(KEY_POPUP_STYLE, style).apply();
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    // ---- UI ------------------------------------------------------------------------------

    private static boolean pt() {
        return "pt".equals(Locale.getDefault().getLanguage());
    }

    private static String menuLabel() {
        return pt() ? "Pílula de menções" : "Mention pill";
    }

    private static void showSettings(Context context) {
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(context, 20);
        content.setPadding(pad, dp(context, 8), pad, dp(context, 8));

        // Top row: on/off.
        Switch toggle = new Switch(context);
        toggle.setText(pt() ? "Mostrar pílula de menções" : "Show mention pill");
        toggle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        toggle.setChecked(isEnabled(context));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            setEnabled(context, checked);
            StoryMentionIcon.refresh();
        });
        content.addView(toggle, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));

        // Style picker: one card per style, each with a live preview of the bubble.
        TextView section = new TextView(context);
        section.setText(pt() ? "Estilo da bolha" : "Bubble style");
        section.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        section.setPadding(0, dp(context, 8), 0, dp(context, 8));
        content.addView(section);

        List<TextView> checks = new ArrayList<>();
        int selected = style(context);
        for (int i = 0; i < StoryMentionIcon.STYLE_COUNT; i++) {
            final int style = i;
            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.HORIZONTAL);
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setPadding(dp(context, 12), dp(context, 10), dp(context, 12), dp(context, 10));
            GradientDrawable cardBg = new GradientDrawable();
            // Mid-dark neutral: every style (light pearl, translucent glass) stays readable on it.
            cardBg.setColor(0xFF3A3F47);
            cardBg.setCornerRadius(dp(context, 12));
            card.setBackground(cardBg);

            TextView preview = new TextView(context);
            preview.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            preview.setSingleLine(true);
            preview.setGravity(Gravity.CENTER);
            preview.setText("@1 mention");
            StoryMentionIcon.applyStyle(preview, style);
            card.addView(preview, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            TextView name = new TextView(context);
            name.setText(StoryMentionIcon.styleName(style, pt()));
            name.setTextColor(Color.WHITE);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            LinearLayout.LayoutParams nameLp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            nameLp.setMarginStart(dp(context, 12));
            card.addView(name, nameLp);

            TextView check = new TextView(context);
            check.setText("\u2713");
            check.setTextColor(Color.WHITE);
            check.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
            check.setVisibility(style == selected ? View.VISIBLE : View.INVISIBLE);
            checks.add(check);
            card.addView(check);

            card.setOnClickListener(v -> {
                setStyle(context, style);
                for (int k = 0; k < checks.size(); k++) {
                    checks.get(k).setVisibility(k == style ? View.VISIBLE : View.INVISIBLE);
                }
                StoryMentionIcon.refresh();
            });
            LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cardLp.bottomMargin = dp(context, 8);
            content.addView(card, cardLp);
        }

        // Popup style: how the list of mentioned accounts looks when the bubble is tapped.
        TextView popupSection = new TextView(context);
        popupSection.setText(pt() ? "Estilo do popup de menções" : "Mentions popup style");
        popupSection.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        popupSection.setPadding(0, dp(context, 12), 0, dp(context, 8));
        content.addView(popupSection);

        List<TextView> popupChecks = new ArrayList<>();
        int popupSelected = popupStyle(context);
        for (int i = 0; i < StoryMentionPopup.STYLE_COUNT; i++) {
            final int style = i;
            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.HORIZONTAL);
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setPadding(dp(context, 14), dp(context, 12), dp(context, 14), dp(context, 12));
            GradientDrawable cardBg = new GradientDrawable();
            cardBg.setColor(0xFF3A3F47);
            cardBg.setCornerRadius(dp(context, 12));
            card.setBackground(cardBg);

            LinearLayout texts = new LinearLayout(context);
            texts.setOrientation(LinearLayout.VERTICAL);
            TextView name = new TextView(context);
            name.setText(StoryMentionPopup.styleName(style, pt()));
            name.setTextColor(Color.WHITE);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            texts.addView(name);
            TextView description = new TextView(context);
            description.setText(StoryMentionPopup.styleDescription(style, pt()));
            description.setTextColor(0xFFB6BDC6);
            description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            texts.addView(description);
            card.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView check = new TextView(context);
            check.setText("\u2713");
            check.setTextColor(Color.WHITE);
            check.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
            check.setVisibility(style == popupSelected ? View.VISIBLE : View.INVISIBLE);
            popupChecks.add(check);
            card.addView(check);

            card.setOnClickListener(v -> {
                setPopupStyle(context, style);
                for (int k = 0; k < popupChecks.size(); k++) {
                    popupChecks.get(k).setVisibility(k == style ? View.VISIBLE : View.INVISIBLE);
                }
            });
            LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cardLp.bottomMargin = dp(context, 8);
            content.addView(card, cardLp);
        }

        ScrollView scroll = new ScrollView(context);
        scroll.addView(content);

        new AlertDialog.Builder(context)
                .setTitle(menuLabel())
                .setView(scroll)
                .setPositiveButton(pt() ? "Fechar" : "Close", null)
                .show();
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }
}
