package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l3e extends p92 {
    public String b;
    public String c;
    public EntityType d;
    public /* synthetic */ Object e;
    public final /* synthetic */ eoc f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l3e(eoc eocVar, p92 p92Var) {
        super(p92Var);
        this.f = eocVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        Object objD = this.f.d(this, null, null, null, false);
        return objD == tb2.COROUTINE_SUSPENDED ? objD : new bjb(objD);
    }
}
