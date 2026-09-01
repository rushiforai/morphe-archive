package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n08 extends p92 {
    public List b;
    public y88 c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ o08 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n08(o08 o08Var, p92 p92Var) {
        super(p92Var);
        this.f = o08Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.d(null, this);
    }
}
