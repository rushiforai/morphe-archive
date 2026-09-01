package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d22 extends p92 {
    public Iterator b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ e22 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d22(e22 e22Var, p92 p92Var) {
        super(p92Var);
        this.e = e22Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.N(this);
    }
}
