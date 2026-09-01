package defpackage;

import androidx.datastore.core.NativeSharedCounter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l58 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ p58 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l58(p58 p58Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = p58Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        p58 p58Var = this.c;
        switch (i) {
            case 0:
                return new l58(p58Var, n92Var, 0);
            default:
                return new l58(p58Var, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((l58) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        NativeSharedCounter nativeSharedCounter = m6c.b;
        p58 p58Var = this.c;
        br7.v(obj);
        switch (i) {
            case 0:
                return new Integer(nativeSharedCounter.nativeGetCounterValue(((m6c) p58Var.i.getValue()).a));
            default:
                return new Integer(nativeSharedCounter.nativeIncrementAndGetCounterValue(((m6c) p58Var.i.getValue()).a));
        }
    }
}
