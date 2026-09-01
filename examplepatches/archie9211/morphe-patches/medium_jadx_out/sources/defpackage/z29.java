package defpackage;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.LeadingMarginSpan;
import android.text.style.LineBackgroundSpan;
import android.text.style.MetricAffectingSpan;
import android.text.style.ReplacementSpan;
import android.widget.TextView;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z29 implements e39, LineBackgroundSpan {
    public final TextView a;
    public final TextPaint b;

    public z29(TextView textView) {
        textView.getClass();
        this.a = textView;
        this.b = new TextPaint();
    }

    public final float a(Paint paint, Spanned spanned, int i, int i2) {
        Spanned spanned2;
        float fMeasureText;
        float f = 0.0f;
        int i3 = i;
        while (i3 < i2) {
            int iNextSpanTransition = spanned.nextSpanTransition(i3, i2, Object.class);
            MetricAffectingSpan[] metricAffectingSpanArr = (MetricAffectingSpan[]) spanned.getSpans(i3, iNextSpanTransition, MetricAffectingSpan.class);
            TextPaint textPaint = this.b;
            textPaint.set(paint);
            metricAffectingSpanArr.getClass();
            ReplacementSpan replacementSpan = null;
            for (MetricAffectingSpan metricAffectingSpan : metricAffectingSpanArr) {
                metricAffectingSpan.updateMeasureState(textPaint);
                if (metricAffectingSpan instanceof ReplacementSpan) {
                    replacementSpan = (ReplacementSpan) metricAffectingSpan;
                }
            }
            if (replacementSpan != null) {
                ReplacementSpan replacementSpan2 = replacementSpan;
                spanned2 = spanned;
                fMeasureText = replacementSpan2.getSize(textPaint, spanned2, i3, iNextSpanTransition, textPaint.getFontMetricsInt());
            } else {
                spanned2 = spanned;
                fMeasureText = textPaint.measureText(spanned2, i3, iNextSpanTransition);
            }
            f += fMeasureText;
            spanned = spanned2;
            i3 = iNextSpanTransition;
        }
        return f;
    }

    @Override // android.text.style.LineBackgroundSpan
    public final void drawBackground(Canvas canvas, Paint paint, int i, int i2, int i3, int i4, int i5, CharSequence charSequence, int i6, int i7, int i8) {
        boolean z;
        boolean z2;
        int i9;
        hjc hjcVar;
        int i10;
        canvas.getClass();
        paint.getClass();
        charSequence.getClass();
        if (charSequence instanceof Spanned) {
            Spanned spanned = (Spanned) charSequence;
            hjc[] hjcVarArr = (hjc[]) spanned.getSpans(i6, i7, hjc.class);
            Paint.Align textAlign = paint.getTextAlign();
            boolean z3 = true;
            if ((this.a.getGravity() & 7) == 1) {
                paint.setTextAlign(Paint.Align.CENTER);
            }
            hjcVarArr.getClass();
            int length = hjcVarArr.length;
            int i11 = 0;
            while (i11 < length) {
                hjc hjcVar2 = hjcVarArr[i11];
                hjcVar2.getClass();
                int iMax = Math.max(spanned.getSpanStart(hjcVar2), i6);
                int iMin = Math.min(spanned.getSpanEnd(hjcVar2), i7);
                if (iMax > iMin) {
                    i9 = i11;
                } else {
                    LeadingMarginSpan[] leadingMarginSpanArr = (LeadingMarginSpan[]) spanned.getSpans(i6, i7, LeadingMarginSpan.class);
                    leadingMarginSpanArr.getClass();
                    if (leadingMarginSpanArr.length == 0) {
                        i9 = i11;
                        hjcVar = hjcVar2;
                        i10 = 0;
                    } else {
                        if (i8 == 0) {
                            z2 = z3;
                            z = z2;
                        } else {
                            z = z3;
                            z2 = false;
                        }
                        boolean z4 = z2;
                        i9 = i11;
                        hjcVar = hjcVar2;
                        Iterator it2 = new n46(0, leadingMarginSpanArr.length - 1, z ? 1 : 0).iterator();
                        boolean z5 = z4;
                        while (((m46) it2).c) {
                            LeadingMarginSpan leadingMarginSpan = leadingMarginSpanArr[((g46) it2).nextInt()];
                            if (leadingMarginSpan instanceof LeadingMarginSpan.LeadingMarginSpan2) {
                                z5 |= i8 < ((LeadingMarginSpan.LeadingMarginSpan2) leadingMarginSpan).getLeadingMarginLineCount();
                            }
                        }
                        Iterator it3 = new n46(0, leadingMarginSpanArr.length - 1, 1).iterator();
                        int leadingMargin = 0;
                        while (((m46) it3).c) {
                            leadingMargin += leadingMarginSpanArr[((g46) it3).nextInt()].getLeadingMargin(z5);
                        }
                        i10 = leadingMargin;
                    }
                    int iRound = i + i10 + (paint.getTextAlign() == Paint.Align.CENTER ? Math.round(((i2 - r2) - paint.measureText(spanned, i6, i7)) / 2.0f) : 0);
                    float fA = a(paint, spanned, i6, iMax);
                    hjcVar.d(canvas, paint, spanned, iMax, iMin, new Rect(((int) fA) + iRound, i3, iRound + ((int) (fA + a(paint, spanned, iMax, iMin))), i5), i4);
                }
                i11 = i9 + 1;
                z3 = true;
            }
            paint.setTextAlign(textAlign);
        }
    }
}
