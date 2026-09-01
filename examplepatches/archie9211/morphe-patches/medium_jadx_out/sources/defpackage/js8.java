package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class js8 extends p92 {
    public String b;
    public m15 c;
    public SusiDestination d;
    public /* synthetic */ Object e;
    public final /* synthetic */ ks8 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public js8(ks8 ks8Var, p92 p92Var) {
        super(p92Var);
        this.f = ks8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.b(null, this);
    }
}
