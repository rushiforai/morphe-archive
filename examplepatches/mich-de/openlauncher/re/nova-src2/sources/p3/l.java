package p3;

import android.text.TextPaint;
import android.text.style.CharacterStyle;

/* loaded from: classes2.dex */
public final class l extends CharacterStyle {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f82064a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f82065b;

    public l(boolean z11, boolean z12) {
        this.f82064a = z11;
        this.f82065b = z12;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        textPaint.setUnderlineText(this.f82064a);
        textPaint.setStrikeThruText(this.f82065b);
    }
}
