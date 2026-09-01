package defpackage;

import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ezb extends p92 {
    public String b;
    public String c;
    public String d;
    public SusiOperation e;
    public boolean f;
    public /* synthetic */ Object g;
    public final /* synthetic */ gzb h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ezb(gzb gzbVar, p92 p92Var) {
        super(p92Var);
        this.h = gzbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.a(null, null, null, null, null, null, null, false, this);
    }
}
