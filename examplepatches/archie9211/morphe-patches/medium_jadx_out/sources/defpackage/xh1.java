package defpackage;

import com.medium.android.graphql.type.CatalogType;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xh1 extends p92 {
    public String b;
    public CatalogType c;
    public Map d;
    public Object e;
    public Iterator f;
    public int g;
    public int h;
    public /* synthetic */ Object i;
    public final /* synthetic */ qi1 j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xh1(qi1 qi1Var, p92 p92Var) {
        super(p92Var);
        this.j = qi1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        Object objX = this.j.x(null, null, null, null, this);
        return objX == tb2.COROUTINE_SUSPENDED ? objX : new bjb(objX);
    }
}
