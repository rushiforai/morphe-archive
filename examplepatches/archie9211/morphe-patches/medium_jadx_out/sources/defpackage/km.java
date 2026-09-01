package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class km extends co6 implements d55 {
    public final /* synthetic */ lm a;
    public final /* synthetic */ aq6 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public km(lm lmVar, aq6 aq6Var) {
        super(4);
        this.a = lmVar;
        this.b = aq6Var;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int iIntValue = ((Number) obj).intValue();
        int iIntValue2 = ((Number) obj2).intValue();
        int iIntValue3 = ((Number) obj3).intValue();
        int iIntValue4 = ((Number) obj4).intValue();
        lm lmVar = this.a;
        lmVar.f.set(iIntValue, iIntValue2, iIntValue3, iIntValue4);
        lmVar.a.f(lmVar.c, this.b.b, lmVar.f);
        return c1e.a;
    }
}
