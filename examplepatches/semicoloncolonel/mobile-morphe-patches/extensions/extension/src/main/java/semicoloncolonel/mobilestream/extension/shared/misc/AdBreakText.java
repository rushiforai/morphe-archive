package semicoloncolonel.mobilestream.extension.shared.misc;

import android.graphics.Color;
import android.graphics.Typeface;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;

import java.util.Locale;

/** The message on the screen that covers an ad break. */
public final class AdBreakText {
    private static final String HEADLINE = "We'll be right back!";
    private static final String MUTED = "The ads are muted and out of sight.";

    private AdBreakText() {
    }

    /** With no time left known. */
    public static CharSequence untimed() {
        return styled(MUTED + " Perfect time for a snack run.");
    }

    /** With the seconds left in the break. */
    public static CharSequence timed(long seconds) {
        return styled(String.format(Locale.US, "%s Snack run? You have %d:%02d.",
                MUTED, seconds / 60, seconds % 60));
    }

    private static CharSequence styled(String body) {
        SpannableString text = new SpannableString(HEADLINE + "\n\n" + body);
        int end = HEADLINE.length();
        text.setSpan(new StyleSpan(Typeface.BOLD), 0, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new RelativeSizeSpan(1.5f), 0, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new ForegroundColorSpan(Color.WHITE), 0, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return text;
    }
}
