package defpackage;

import android.graphics.Shader;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.UpdateAppearance;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h3c extends CharacterStyle implements UpdateAppearance {
    public final g3c a;
    public final float b;
    public final k49 c = qo7.u(new dfc(9205357640488583168L));
    public final j83 d = bjc.b(new i5b(21, this));

    public h3c(g3c g3cVar, float f) {
        this.a = g3cVar;
        this.b = f;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        vc2.O(textPaint, this.b);
        textPaint.setShader((Shader) this.d.getValue());
    }
}
