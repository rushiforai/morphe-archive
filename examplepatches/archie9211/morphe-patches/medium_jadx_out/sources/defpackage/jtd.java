package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jtd extends p92 {
    public s26 b;
    public /* synthetic */ Object c;
    public final /* synthetic */ mtd d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jtd(mtd mtdVar, p92 p92Var) {
        super(p92Var);
        this.d = mtdVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.h(this);
    }
}
