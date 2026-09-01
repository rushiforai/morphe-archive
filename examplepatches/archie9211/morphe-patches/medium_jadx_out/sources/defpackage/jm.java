package defpackage;

import android.graphics.Rect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jm extends co6 implements d55 {
    public final /* synthetic */ lm a;
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jm(lm lmVar, int i) {
        super(4);
        this.a = lmVar;
        this.b = i;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int iIntValue = ((Number) obj).intValue();
        int iIntValue2 = ((Number) obj2).intValue();
        int iIntValue3 = ((Number) obj3).intValue();
        int iIntValue4 = ((Number) obj4).intValue();
        lm lmVar = this.a;
        lmVar.a.c(lmVar.c, this.b, new Rect(iIntValue, iIntValue2, iIntValue3, iIntValue4));
        return c1e.a;
    }
}
