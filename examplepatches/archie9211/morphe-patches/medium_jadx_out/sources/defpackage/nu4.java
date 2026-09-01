package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nu4 extends p92 {
    public EntityType b;
    public String c;
    public Object d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ qu4 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nu4(qu4 qu4Var, p92 p92Var) {
        super(p92Var);
        this.g = qu4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.g(null, null, null, this);
    }
}
