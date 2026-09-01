package defpackage;

import com.medium.android.susi.data.CreateAccountData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fdc extends p92 {
    public CreateAccountData b;
    public String c;
    public String d;
    public String e;
    public String f;
    public Object g;
    public /* synthetic */ Object h;
    public final /* synthetic */ hac i;
    public int j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fdc(hac hacVar, p92 p92Var) {
        super(p92Var);
        this.i = hacVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.h = obj;
        this.j |= Integer.MIN_VALUE;
        Object objA = this.i.a(null, null, null, null, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
