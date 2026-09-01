package defpackage;

import com.medium.android.graphql.ReadingHistoryQuery;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yta extends p92 {
    public c55 b;
    public ReadingHistoryQuery.PostPreviewConnection c;
    public Collection d;
    public Iterator e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k;
    public /* synthetic */ Object l;
    public final /* synthetic */ zta m;
    public int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yta(zta ztaVar, p92 p92Var) {
        super(p92Var);
        this.m = ztaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.l = obj;
        this.n |= Integer.MIN_VALUE;
        Object objA = this.m.a(0, null, this, null, null);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
