package defpackage;

import com.medium.android.core.models.HighlightType;
import com.medium.android.graphql.fragment.HighlightDataWithGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yl9 extends p92 {
    public String b;
    public HighlightType c;
    public Object d;
    public HighlightDataWithGroup e;
    public int f;
    public int g;
    public int h;
    public /* synthetic */ Object i;
    public final /* synthetic */ gn9 j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yl9(gn9 gn9Var, p92 p92Var) {
        super(p92Var);
        this.j = gn9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        Object objA = this.j.a(null, null, 0, 0, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
