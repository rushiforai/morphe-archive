package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mf8 extends p92 {
    public EntityType b;
    public String c;
    public Object d;
    public boolean e;
    public /* synthetic */ Object f;
    public final /* synthetic */ pf8 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mf8(pf8 pf8Var, p92 p92Var) {
        super(p92Var);
        this.g = pf8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objC = this.g.c(this, null, null, null, false);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : new bjb(objC);
    }
}
