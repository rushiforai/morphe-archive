package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.MediumMembershipType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s9 extends p92 {
    public String b;
    public String c;
    public String d;
    public MediumMembershipType e;
    public UpsellInfo f;
    public String g;
    public String h;
    public String i;
    public String j;
    public long k;
    public /* synthetic */ Object l;
    public final /* synthetic */ n0c m;
    public int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s9(n0c n0cVar, p92 p92Var) {
        super(p92Var);
        this.m = n0cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.l = obj;
        this.n |= Integer.MIN_VALUE;
        Object objR = this.m.R(null, null, null, 0L, null, null, null, null, null, null, this);
        return objR == tb2.COROUTINE_SUSPENDED ? objR : new bjb(objR);
    }
}
