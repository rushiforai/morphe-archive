package defpackage;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.Layout;
import android.text.style.LeadingMarginSpan;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rm3 implements f39, LeadingMarginSpan.LeadingMarginSpan2 {
    public final int a;

    public rm3(int i) {
        this.a = i;
    }

    @Override // android.text.style.LeadingMarginSpan
    public final void drawLeadingMargin(Canvas canvas, Paint paint, int i, int i2, int i3, int i4, int i5, CharSequence charSequence, int i6, int i7, boolean z, Layout layout) {
        canvas.getClass();
        paint.getClass();
        charSequence.getClass();
        layout.getClass();
    }

    @Override // android.text.style.LeadingMarginSpan
    public final int getLeadingMargin(boolean z) {
        if (z) {
            return this.a;
        }
        return 0;
    }

    @Override // android.text.style.LeadingMarginSpan.LeadingMarginSpan2
    public final int getLeadingMarginLineCount() {
        return 2;
    }
}
