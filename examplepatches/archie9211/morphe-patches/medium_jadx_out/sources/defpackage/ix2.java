package defpackage;

import com.android.billingclient.api.Purchase;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ix2 extends p92 {
    public Purchase b;
    public /* synthetic */ Object c;
    public final /* synthetic */ xx2 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ix2(xx2 xx2Var, p92 p92Var) {
        super(p92Var);
        this.d = xx2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
