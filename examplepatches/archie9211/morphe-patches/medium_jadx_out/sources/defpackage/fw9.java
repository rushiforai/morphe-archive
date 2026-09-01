package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fw9 extends p92 {
    public o33 b;
    public n33 c;
    public List d;
    public List e;
    public boolean f;
    public /* synthetic */ Object g;
    public final /* synthetic */ sw9 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fw9(sw9 sw9Var, p92 p92Var) {
        super(p92Var);
        this.h = sw9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.n(null, false, null, this);
    }
}
