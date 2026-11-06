package app.morphe.extension.youtube.patches.keywordfilter;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.util.Pair;
import android.widget.Button;
import android.widget.LinearLayout;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.youtube.patches.keywordfilter.EnhancedKeywordContentFilter.MatchLogEntry;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Adds the interactive "Filter match log" row to {@code KeywordContentStatsPreferenceCategory}.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class EnhancedKeywordStatsHelper {

    public static void addMatchLogRow(PreferenceCategory category) {
        if (category == null) return;
        Context context = category.getContext();
        NumberFormat nf = NumberFormat.getInstance(Settings.MORPHE_LANGUAGE.get().getLocale());

        List<MatchLogEntry> logs = EnhancedKeywordContentFilter.getRecentMatchLogs();
        Preference matchLogPref = new Preference(context);
        matchLogPref.setTitle(str("morphe_hide_keyword_log_title"));
        if (logs.isEmpty()) {
            matchLogPref.setSummary(str("morphe_hide_keyword_log_summary_empty"));
        } else {
            matchLogPref.setSummary(str("morphe_hide_keyword_log_summary", nf.format(logs.size())));
        }
        matchLogPref.setOnPreferenceClickListener(pref -> {
            showMatchLogDialog(category, matchLogPref, nf);
            return true;
        });
        category.addPreference(matchLogPref);
    }

    private static void showMatchLogDialog(PreferenceCategory category, Preference matchLogPref, NumberFormat nf) {
        Context context = category.getContext();
        List<MatchLogEntry> logs = EnhancedKeywordContentFilter.getRecentMatchLogs();
        if (logs.isEmpty()) {
            Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                    context,
                    str("morphe_hide_keyword_log_title"),
                    str("morphe_hide_keyword_log_empty"),
                    null,
                    null,
                    () -> {},
                    null,
                    null,
                    null,
                    true
            );
            dialogPair.first.show();
            return;
        }

        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm", Locale.getDefault());
        SpannableStringBuilder formatted = new SpannableStringBuilder();
        StringBuilder plainText = new StringBuilder();

        for (int i = 0, size = logs.size(); i < size; i++) {
            MatchLogEntry entry = logs.get(i);
            if (i > 0) {
                formatted.append("\n\n");
                plainText.append("\n\n");
            }

            String timeStr = timeFormat.format(new Date(entry.timestampMs()));
            String prefix = (i + 1) + ". [" + entry.source().name() + " • " + timeStr + "] ";
            int prefixStart = formatted.length();
            formatted.append(prefix);
            formatted.setSpan(new StyleSpan(Typeface.BOLD), prefixStart, formatted.length(),
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);

            appendHighlightedText(formatted, entry.matchedText(), entry.matchedWord());
            plainText.append(prefix).append(entry.matchedText())
                    .append(" («").append(entry.matchedWord()).append("»)");
        }

        Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                context,
                str("morphe_hide_keyword_log_title"),
                formatted,
                null,
                null,
                () -> {},
                null,
                str("morphe_hide_keyword_log_clear"),
                () -> {
                    EnhancedKeywordContentFilter.clearRecentMatchLogs();
                    matchLogPref.setSummary(str("morphe_hide_keyword_log_summary_empty"));
                },
                true
        );

        Button copyBtn = CustomDialog.createButton(
                context,
                null,
                str("morphe_hide_keyword_log_copy"),
                () -> {
                    ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (cm != null) {
                        cm.setPrimaryClip(ClipData.newPlainText("KeywordFilterLog", plainText.toString()));
                        Utils.showToastShort(str("morphe_hide_keyword_log_copied"));
                    }
                },
                false,
                false
        );
        dialogPair.second.addView(copyBtn);
        dialogPair.first.show();
    }

    private static void appendHighlightedText(SpannableStringBuilder sb, String text, String word) {
        int base = sb.length();
        sb.append(text);
        if (word == null || word.isEmpty()) return;

        String lowerText = text.toLowerCase(Locale.ROOT);
        String lowerWord = word.toLowerCase(Locale.ROOT);
        if (lowerText.length() != text.length() || lowerWord.length() != word.length()) {
            int idx = text.indexOf(word);
            if (idx >= 0) {
                applyWordHighlight(sb, base + idx, base + idx + word.length());
            }
            return;
        }
        int from = 0;
        while (from < lowerText.length()) {
            int idx = lowerText.indexOf(lowerWord, from);
            if (idx < 0) break;
            applyWordHighlight(sb, base + idx, base + idx + lowerWord.length());
            from = idx + lowerWord.length();
        }
    }

    private static void applyWordHighlight(SpannableStringBuilder sb, int start, int end) {
        sb.setSpan(new BackgroundColorSpan(0xFFD32F2F), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        sb.setSpan(new ForegroundColorSpan(0xFFFFFFFF), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        sb.setSpan(new StyleSpan(Typeface.BOLD), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    private EnhancedKeywordStatsHelper() {
    }
}
