package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uo8 extends p92 {
    public String b;
    public Iterator c;
    public String d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ yo8 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uo8(yo8 yo8Var, p92 p92Var) {
        super(p92Var);
        this.h = yo8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.l(null, this);
    }
}
