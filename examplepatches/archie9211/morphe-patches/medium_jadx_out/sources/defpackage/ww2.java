package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ww2 extends p92 {
    public Set b;
    public /* synthetic */ Object c;
    public final /* synthetic */ zw2 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ww2(zw2 zw2Var, p92 p92Var) {
        super(p92Var);
        this.d = zw2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.f(null, null, null, null, null, false, this);
    }
}
