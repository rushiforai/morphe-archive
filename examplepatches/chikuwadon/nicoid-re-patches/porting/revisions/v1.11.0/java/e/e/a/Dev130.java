package e.e.a;

import android.content.res.Configuration;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.widget.TextView;

/** Keep the sensitivity's title primary and its second-line explanation secondary. */
public final class Dev130 {
    private Dev130() {}

    public static void styleSensitivity(TextView text) {
        if (text == null) return;
        String original = String.valueOf(text.getText());
        int separator = original.indexOf('\n');
        if (separator < 0 || separator >= original.length() - 1) return;
        boolean night = (text.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        int grey = night ? 0xffa8adb4 : 0xff626870;
        SpannableString result = new SpannableString(original);
        result.setSpan(new RelativeSizeSpan(0.86f), separator + 1,
                original.length(), 0);
        result.setSpan(new ForegroundColorSpan(grey), separator + 1,
                original.length(), 0);
        text.setText(result);
    }

    public static void stripFinalStop(TextView text) {
        if (text == null) return;
        String s = String.valueOf(text.getText());
        if (s.endsWith("。") || s.endsWith(".") || s.endsWith("．")) {
            text.setText(s.substring(0, s.length() - 1));
        }
    }
}
