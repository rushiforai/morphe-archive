package defpackage;

import android.text.Layout;
import android.text.Selection;
import android.text.Spannable;
import android.text.method.LinkMovementMethod;
import android.text.method.Touch;
import android.text.style.ClickableSpan;
import android.view.MotionEvent;
import android.widget.TextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m29 extends LinkMovementMethod {
    public static m29 a;

    @Override // android.text.method.LinkMovementMethod, android.text.method.BaseMovementMethod, android.text.method.MovementMethod
    public final boolean canSelectArbitrarily() {
        return true;
    }

    @Override // android.text.method.LinkMovementMethod, android.text.method.ScrollingMovementMethod, android.text.method.BaseMovementMethod, android.text.method.MovementMethod
    public final boolean onTouchEvent(TextView textView, Spannable spannable, MotionEvent motionEvent) {
        textView.getClass();
        spannable.getClass();
        motionEvent.getClass();
        int action = motionEvent.getAction();
        if (action == 0 || action == 1) {
            int x = (int) motionEvent.getX();
            int y = (int) motionEvent.getY();
            int totalPaddingLeft = x - textView.getTotalPaddingLeft();
            int totalPaddingTop = y - textView.getTotalPaddingTop();
            int scrollX = textView.getScrollX() + totalPaddingLeft;
            int scrollY = textView.getScrollY() + totalPaddingTop;
            Layout layout = textView.getLayout();
            int offsetForHorizontal = layout.getOffsetForHorizontal(layout.getLineForVertical(scrollY), scrollX);
            Object[] spans = spannable.getSpans(offsetForHorizontal, offsetForHorizontal, ClickableSpan.class);
            spans.getClass();
            ClickableSpan[] clickableSpanArr = (ClickableSpan[]) spans;
            int length = clickableSpanArr.length;
            ClickableSpan clickableSpan = null;
            for (int i = 0; i < length; i++) {
                ClickableSpan clickableSpan2 = clickableSpanArr[i];
                char c = 2;
                char c2 = clickableSpan2 instanceof dk ? (char) 5 : clickableSpan2 instanceof lde ? (char) 4 : clickableSpan2 instanceof fl5 ? (char) 3 : clickableSpan2 != null ? (char) 2 : (char) 1;
                if (clickableSpan instanceof dk) {
                    c = 5;
                } else if (clickableSpan instanceof lde) {
                    c = 4;
                } else if (clickableSpan instanceof fl5) {
                    c = 3;
                } else if (clickableSpan == null) {
                    c = 1;
                }
                if (c2 > c) {
                    clickableSpan = clickableSpan2;
                }
            }
            if (clickableSpan != null) {
                if (action == 0) {
                    Selection.setSelection(spannable, spannable.getSpanStart(clickableSpan), spannable.getSpanEnd(clickableSpan));
                    return true;
                }
                if (action != 1) {
                    return true;
                }
                clickableSpan.onClick(textView);
                return true;
            }
        }
        return Touch.onTouchEvent(textView, spannable, motionEvent);
    }
}
