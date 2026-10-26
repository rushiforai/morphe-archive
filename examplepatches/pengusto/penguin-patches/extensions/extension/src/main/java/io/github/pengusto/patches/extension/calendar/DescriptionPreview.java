/* GPL-3.0. Rendering approach derived from Pengusto's Fossify Calendar fix (d4f1825). */
package io.github.pengusto.patches.extension.calendar;

import android.app.Activity;
import android.text.*;
import android.text.style.*;
import android.text.method.LinkMovementMethod;
import android.util.TypedValue;
import android.view.View;
import android.widget.*;
import java.util.Locale;
import java.util.regex.Pattern;

/** Presentation only: never calls setText on the stored source editor. */
public final class DescriptionPreview {
    private static final Pattern HTML = Pattern.compile("<\\s*(?:html|body)\\b[^>]*>|<\\s*(p|div|span|font|a|b|strong|i|em|u|ul|ol|li|blockquote|h[1-6]|table|thead|tbody|tfoot|tr|td|th|caption)\\b[^>]*>[\\s\\S]*?</\\s*\\1\\s*>|<br\\s*/?>", Pattern.CASE_INSENSITIVE);
    private static final Pattern HIDDEN = Pattern.compile("<(head|script|style)\\b[^>]*>[\\s\\S]*?(?:</\\1\\s*>|$)", Pattern.CASE_INSENSITIVE);
    private static final Pattern CELL_END = Pattern.compile("</\\s*(?:td|th)\\s*>", Pattern.CASE_INSENSITIVE);
    private static final Pattern ROW_END = Pattern.compile("</\\s*tr\\s*>", Pattern.CASE_INSENSITIVE);
    private static final String TAG = "penguin.calendar.description.preview";

    public static void attach(Activity activity) {
        int id = activity.getResources().getIdentifier("event_description", "id", activity.getPackageName());
        View view = activity.findViewById(id);
        if (!(view instanceof EditText) || !(view.getParent() instanceof LinearLayout)) return;
        EditText editor = (EditText) view;
        LinearLayout holder = (LinearLayout) editor.getParent();
        if (holder.findViewWithTag(TAG) != null) return;
        TextView preview = new TextView(activity);
        preview.setTag(TAG);
        preview.setTextIsSelectable(true);
        preview.setMovementMethod(LinkMovementMethod.getInstance());
        Button toggle = new Button(activity, null, android.R.attr.borderlessButtonStyle);
        boolean[] sourceMode = {false};
        Runnable render = () -> {
            String raw = editor.getText().toString();
            boolean html = HTML.matcher(raw).find();
            preview.setTextColor(editor.getCurrentTextColor());
            preview.setTextSize(TypedValue.COMPLEX_UNIT_PX, editor.getTextSize());
            toggle.setTextColor(editor.getCurrentTextColor());
            preview.setText(html ? display(raw) : raw);
            preview.setVisibility(html && !sourceMode[0] ? View.VISIBLE : View.GONE);
            editor.setVisibility(html && !sourceMode[0] ? View.GONE : View.VISIBLE);
            toggle.setVisibility(html || sourceMode[0] ? View.VISIBLE : View.GONE);
            boolean german = Locale.getDefault().getLanguage().equals("de");
            toggle.setText(sourceMode[0] ? (german ? "Vorschau anzeigen" : "Show preview") : (german ? "HTML-Quelltext bearbeiten" : "Edit HTML source"));
        };
        holder.addView(preview, 0, new LinearLayout.LayoutParams(-1, -2));
        holder.addView(toggle, new LinearLayout.LayoutParams(-2, -2));
        toggle.setOnClickListener(v -> { sourceMode[0] = !sourceMode[0]; render.run(); });
        editor.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            public void onTextChanged(CharSequence s, int start, int before, int count) {}
            public void afterTextChanged(Editable s) { render.run(); }
        });
        render.run();
    }

    /** Plain summary for list rows; never writes back to the event or editor. */
    public static String summary(String raw) {
        if (!HTML.matcher(raw).find()) return raw;
        return display(raw).toString().replace('\n', ' ');
    }

    static CharSequence display(String raw) {
        SpannableStringBuilder parsed = new SpannableStringBuilder(Html.fromHtml(ROW_END.matcher(CELL_END.matcher(HIDDEN.matcher(raw).replaceAll("")).replaceAll(" ")).replaceAll("<br>"), Html.FROM_HTML_MODE_COMPACT));
        for (Object span : parsed.getSpans(0, parsed.length(), Object.class)) {
            if (span instanceof ForegroundColorSpan || span instanceof BackgroundColorSpan || span instanceof AbsoluteSizeSpan || span instanceof RelativeSizeSpan) parsed.removeSpan(span);
            if (span instanceof URLSpan) {
                String url = ((URLSpan) span).getURL();
                int colon = url.indexOf(':');
                String scheme = colon < 0 ? "" : url.substring(0, colon).toLowerCase(Locale.ROOT);
                if (!scheme.equals("https") && !scheme.equals("http") && !scheme.equals("mailto")) parsed.removeSpan(span);
            }
        }
        int end = parsed.length();
        while (end > 0 && (parsed.charAt(end - 1) == '\n' || parsed.charAt(end - 1) == ' ')) end--;
        return parsed.subSequence(0, end);
    }
}
