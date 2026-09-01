package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class k92 implements sb2 {
    public final ib2 a;

    public k92(ib2 ib2Var) {
        this.a = ib2Var;
    }

    @Override // defpackage.sb2
    public final ib2 Q() {
        return this.a;
    }

    public final String toString() {
        return "CoroutineScope(coroutineContext=" + this.a + ')';
    }
}
