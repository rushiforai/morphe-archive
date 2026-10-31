package w3;

import android.graphics.Paint;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.UpdateAppearance;
import k2.g;
import k2.j;
import k2.k;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a extends CharacterStyle implements UpdateAppearance {

    /* renamed from: a, reason: collision with root package name */
    public final g f93738a;

    public a(g gVar) {
        this.f93738a = gVar;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        if (textPaint != null) {
            j jVar = j.f70871a;
            g gVar = this.f93738a;
            if (Intrinsics.b(gVar, jVar)) {
                textPaint.setStyle(Paint.Style.FILL);
                return;
            }
            if (!(gVar instanceof k)) {
                throw new NoWhenBranchMatchedException();
            }
            textPaint.setStyle(Paint.Style.STROKE);
            k kVar = (k) gVar;
            textPaint.setStrokeWidth(kVar.f70872a);
            textPaint.setStrokeMiter(kVar.f70873b);
            int i5 = kVar.f70875d;
            textPaint.setStrokeJoin(i5 == 0 ? Paint.Join.MITER : i5 == 1 ? Paint.Join.ROUND : i5 == 2 ? Paint.Join.BEVEL : Paint.Join.MITER);
            int i11 = kVar.f70874c;
            textPaint.setStrokeCap(i11 == 0 ? Paint.Cap.BUTT : i11 == 1 ? Paint.Cap.ROUND : i11 == 2 ? Paint.Cap.SQUARE : Paint.Cap.BUTT);
            textPaint.setPathEffect(null);
        }
    }
}
