package defpackage;

import android.text.TextPaint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jf5 extends f76 {
    public final CharSequence s;
    public final TextPaint t;

    public jf5(CharSequence charSequence, TextPaint textPaint) {
        this.s = charSequence;
        this.t = textPaint;
    }

    @Override // defpackage.f76
    public final int I(int i) {
        CharSequence charSequence = this.s;
        return this.t.getTextRunCursor(charSequence, 0, charSequence.length(), false, i, 0);
    }

    @Override // defpackage.f76
    public final int J(int i) {
        CharSequence charSequence = this.s;
        return this.t.getTextRunCursor(charSequence, 0, charSequence.length(), false, i, 2);
    }
}
