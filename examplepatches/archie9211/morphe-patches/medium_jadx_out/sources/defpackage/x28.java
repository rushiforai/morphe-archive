package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x28 implements PointerInputEventHandler {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ m45 b;

    public x28(boolean z, m45 m45Var) {
        this.a = z;
        this.b = m45Var;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(vb9 vb9Var, n92 n92Var) {
        Object objS = o7f.s(new qa(vb9Var, this.a, this.b, null), n92Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }
}
