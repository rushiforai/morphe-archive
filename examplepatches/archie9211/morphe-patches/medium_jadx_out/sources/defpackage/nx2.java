package defpackage;

import com.android.billingclient.api.Purchase;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nx2 extends p92 {
    public Set b;
    public String c;
    public Iterator d;
    public Purchase e;
    public mw7 f;
    public int g;
    public int h;
    public boolean i;
    public /* synthetic */ Object j;
    public final /* synthetic */ xx2 k;
    public int l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nx2(xx2 xx2Var, p92 p92Var) {
        super(p92Var);
        this.k = xx2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.j = obj;
        this.l |= Integer.MIN_VALUE;
        return this.k.d(null, this);
    }
}
