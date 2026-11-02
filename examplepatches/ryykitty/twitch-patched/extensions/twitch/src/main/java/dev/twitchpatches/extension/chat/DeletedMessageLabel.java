package dev.twitchpatches.extension.chat;

import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.StrikethroughSpan;

final class DeletedMessageLabel extends CharacterStyle {
    private static final String TEXT = " (Deleted)";
    private static final int ALPHA = 170;

    static Spanned appendTo(Spanned message, Class<?> senderNameSpan) {
        if (message.getSpans(0, message.length(), DeletedMessageLabel.class).length > 0) return message;
        SpannableStringBuilder labelled = new SpannableStringBuilder(message);
        labelled.setSpan(new StrikethroughSpan(), bodyStart(message, senderNameSpan), labelled.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        int labelStart = labelled.length();
        labelled.append(TEXT);
        labelled.setSpan(new DeletedMessageLabel(), labelStart, labelled.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        return labelled;
    }

    private static int bodyStart(Spanned message, Class<?> senderNameSpan) {
        Object[] names = message.getSpans(0, message.length(), senderNameSpan);
        if (names.length == 0) return 0;
        int start = message.getSpanEnd(names[0]);
        if (start < message.length() && message.charAt(start) == ':') start++;
        if (start < message.length() && message.charAt(start) == ' ') start++;
        return start;
    }

    @Override public void updateDrawState(TextPaint paint) { paint.setAlpha(ALPHA); }
}
