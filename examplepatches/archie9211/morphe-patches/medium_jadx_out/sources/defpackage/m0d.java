package defpackage;

import com.medium.android.payments.ui.subscription.SubscriptionViewModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class m0d extends p4d implements b55 {
    public o33 b;
    public n33 c;
    public gcb d;
    public rj2 e;
    public int f;
    public int g;
    public /* synthetic */ Object h;
    public final /* synthetic */ SubscriptionViewModel i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0d(SubscriptionViewModel subscriptionViewModel, n92 n92Var) {
        super(2, n92Var);
        this.i = subscriptionViewModel;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        m0d m0dVar = new m0d(this.i, n92Var);
        m0dVar.h = obj;
        return m0dVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((m0d) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00c3  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 205
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m0d.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
