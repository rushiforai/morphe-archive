package defpackage;

import java.text.BreakIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kf5 extends f76 {
    public final BreakIterator s;

    public kf5(CharSequence charSequence) {
        BreakIterator characterInstance = BreakIterator.getCharacterInstance();
        characterInstance.setText(charSequence.toString());
        this.s = characterInstance;
    }

    @Override // defpackage.f76
    public final int I(int i) {
        return this.s.following(i);
    }

    @Override // defpackage.f76
    public final int J(int i) {
        return this.s.preceding(i);
    }
}
