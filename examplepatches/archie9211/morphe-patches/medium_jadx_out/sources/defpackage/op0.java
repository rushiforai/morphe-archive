package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class op0 implements PointerInputEventHandler {
    public final /* synthetic */ int a;
    public final /* synthetic */ pod b;

    public /* synthetic */ op0(pod podVar, int i) {
        this.a = i;
        this.b = podVar;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(vb9 vb9Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pod podVar = this.b;
        switch (i) {
            case 0:
                Object objS = o7f.s(new np0(vb9Var, podVar, null, 0), n92Var);
                return objS == tb2.COROUTINE_SUSPENDED ? objS : c1eVar;
            default:
                Object objS2 = o7f.s(new np0(vb9Var, podVar, null, 1), n92Var);
                return objS2 == tb2.COROUTINE_SUSPENDED ? objS2 : c1eVar;
        }
    }
}
