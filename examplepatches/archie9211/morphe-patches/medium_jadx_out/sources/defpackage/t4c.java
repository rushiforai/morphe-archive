package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t4c implements r82 {
    public final s4c a;
    public final qu b;
    public final qu c;
    public final qu d;
    public final boolean e;

    public t4c(String str, s4c s4cVar, qu quVar, qu quVar2, qu quVar3, boolean z) {
        this.a = s4cVar;
        this.b = quVar;
        this.c = quVar2;
        this.d = quVar3;
        this.e = z;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        return new ntd(tn0Var, this);
    }

    public final String toString() {
        return "Trim Path: {start: " + this.b + ", end: " + this.c + ", offset: " + this.d + "}";
    }
}
