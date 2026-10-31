package p3;

import android.text.TextPaint;
import android.text.style.CharacterStyle;

/* loaded from: classes2.dex */
public final class j extends CharacterStyle {

    /* renamed from: a, reason: collision with root package name */
    public final int f82059a;

    /* renamed from: b, reason: collision with root package name */
    public final float f82060b;

    /* renamed from: c, reason: collision with root package name */
    public final float f82061c;

    /* renamed from: d, reason: collision with root package name */
    public final float f82062d;

    public j(float f11, float f12, float f13, int i5) {
        this.f82059a = i5;
        this.f82060b = f11;
        this.f82061c = f12;
        this.f82062d = f13;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        textPaint.setShadowLayer(this.f82062d, this.f82060b, this.f82061c, this.f82059a);
    }
}
