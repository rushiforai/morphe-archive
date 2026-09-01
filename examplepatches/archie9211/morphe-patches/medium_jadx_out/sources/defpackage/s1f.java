package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s1f extends p92 {
    public sb2 b;
    public rya c;
    public rya d;
    public rya e;
    public Map f;
    public wy7 g;
    public x50 h;
    public long i;
    public /* synthetic */ Object j;
    public final /* synthetic */ t1f k;
    public int l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s1f(t1f t1fVar, p92 p92Var) {
        super(p92Var);
        this.k = t1fVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.j = obj;
        this.l |= Integer.MIN_VALUE;
        return this.k.b(null, this);
    }
}
