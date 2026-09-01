package defpackage;

import android.graphics.Paint;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.UpdateAppearance;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class am3 extends CharacterStyle implements UpdateAppearance {
    public final pxf a;

    public am3(pxf pxfVar) {
        this.a = pxfVar;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        if (textPaint != null) {
            ph4 ph4Var = ph4.R;
            pxf pxfVar = this.a;
            if (g76.L(pxfVar, ph4Var)) {
                textPaint.setStyle(Paint.Style.FILL);
                return;
            }
            if (!(pxfVar instanceof uuc)) {
                ygf.a();
                return;
            }
            textPaint.setStyle(Paint.Style.STROKE);
            uuc uucVar = (uuc) pxfVar;
            textPaint.setStrokeWidth(uucVar.R);
            textPaint.setStrokeMiter(uucVar.S);
            int i = uucVar.U;
            textPaint.setStrokeJoin(i == 0 ? Paint.Join.MITER : i == 1 ? Paint.Join.ROUND : i == 2 ? Paint.Join.BEVEL : Paint.Join.MITER);
            int i2 = uucVar.T;
            textPaint.setStrokeCap(i2 == 0 ? Paint.Cap.BUTT : i2 == 1 ? Paint.Cap.ROUND : i2 == 2 ? Paint.Cap.SQUARE : Paint.Cap.BUTT);
            textPaint.setPathEffect(null);
        }
    }
}
