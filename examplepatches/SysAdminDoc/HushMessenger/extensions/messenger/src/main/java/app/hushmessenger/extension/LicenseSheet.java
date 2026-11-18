package app.hushmessenger.extension;

import android.graphics.Typeface;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.widget.Button;
import android.widget.TextView;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Source and licenses: the NOTICE the repository ships, word for word, with no connection needed. Morphe's section 7b
 * asks that its notice reach the person using the app. The notice stays in English, as the licenses it carries are: a
 * translation of the GPL is not the license.
 */
final class LicenseSheet {
    static final String SOURCE_PAGE = "https://github.com/SysAdminDoc/HushMessenger";

    private LicenseSheet() {
    }

    static SettingsDialog show(SettingsActivity page) {
        SettingsUi ui = page.ui;
        SettingsDialog sheet = new SettingsDialog(page, ui, page.text, page.text.get("source"), page.text.get("licenses_hint"));
        sheet.setTag("licenses_sheet");
        TextView notice = new TextView(page);
        notice.setTag("licenses_text");
        notice.setText(forScreen(reflow(LicenseNotice.TEXT), ui.heading));
        notice.setTextDirection(TextView.TEXT_DIRECTION_LTR);
        notice.setTextAlignment(TextView.TEXT_ALIGNMENT_VIEW_START);
        notice.setLayoutDirection(TextView.LAYOUT_DIRECTION_LTR);
        notice.setTextIsSelectable(true);
        notice.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        notice.setBreakStrategy(Layout.BREAK_STRATEGY_HIGH_QUALITY);
        notice.setLineSpacing(ui.dp(2), 1.04f);
        notice.setTextColor(ui.text);
        notice.setLinkTextColor(ui.accent);
        Linkify.addLinks(notice, Linkify.WEB_URLS);
        ui.add(sheet.body, notice, 0);
        Button source = ui.button(page.text.get("licenses_source"));
        source.setTag("licenses_source");
        source.setOnClickListener(clicked -> page.openPage(SOURCE_PAGE));
        sheet.action(source);
        Button close = ui.primaryButton(page.text.get("message_log_close"));
        close.setTag("licenses_close");
        close.setOnClickListener(clicked -> sheet.dialog.dismiss());
        sheet.action(close);
        sheet.show();
        return sheet;
    }

    /**
     * NOTICE is hard-wrapped for a source file. Prose reflows on a narrow screen, while blank lines, headings, lists,
     * the indented license texts and the table of projects keep their lines, the table with each address under its name.
     */
    static String reflow(String notice) {
        return notice.replaceAll("(?<=[\\p{L}\\p{N}.,;)\"])\\n(?=[\\p{L}\\p{N}(\"])", " ")
            .replaceAll("(?m)^ {2}(\\S.*?) {2,}(https?://\\S+)$", "$1\n$2\n");
    }

    /**
     * NOTICE marks its headings with a line of = or - under them, which reads as a heading in a text file and as a row
     * of symbols on a phone. The heading turns bold and the rule goes, and so does a rule standing alone between
     * notices, since the blank lines already part them.
     */
    static CharSequence forScreen(String notice, int headingColor) {
        Matcher heading = Pattern.compile("(?m)^(\\S[^\\n]*)\\n[=-]{3,}$").matcher(notice);
        SpannableStringBuilder shown = new SpannableStringBuilder();
        int at = 0;
        while (heading.find()) {
            shown.append(notice, at, heading.start());
            int start = shown.length();
            shown.append(heading.group(1));
            shown.setSpan(new StyleSpan(Typeface.BOLD), start, shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            shown.setSpan(new ForegroundColorSpan(headingColor), start, shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            at = heading.end();
        }
        shown.append(notice, at, notice.length());
        for (Matcher rule = Pattern.compile("(?m)^[=-]{3,}\\n").matcher(shown); rule.find(); rule.reset(shown)) {
            shown.delete(rule.start(), rule.end());
        }
        for (Matcher gap = Pattern.compile("\\n{4,}").matcher(shown); gap.find(); gap.reset(shown)) {
            shown.replace(gap.start(), gap.end(), "\n\n\n");
        }
        return shown;
    }
}
