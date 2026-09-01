package defpackage;

import com.medium.android.graphql.type.CatalogType;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ah1 extends p92 {
    public String b;
    public CatalogType c;
    public ud1 d;
    public List e;
    public Object f;
    public int g;
    public /* synthetic */ Object h;
    public final /* synthetic */ qi1 i;
    public int j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ah1(qi1 qi1Var, p92 p92Var) {
        super(p92Var);
        this.i = qi1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.h = obj;
        this.j |= Integer.MIN_VALUE;
        Object objE = this.i.e(null, null, null, null, null, this);
        return objE == tb2.COROUTINE_SUSPENDED ? objE : new bjb(objE);
    }
}
