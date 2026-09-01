package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iu2 extends p92 {
    public Object b;
    public Object c;
    public Serializable d;
    public rya e;
    public boolean f;
    public int g;
    public /* synthetic */ Object h;
    public final /* synthetic */ mu2 i;
    public int j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iu2(mu2 mu2Var, p92 p92Var) {
        super(p92Var);
        this.i = mu2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.h = obj;
        this.j |= Integer.MIN_VALUE;
        return this.i.h(false, this);
    }
}
