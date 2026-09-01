package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aid implements PointerInputEventHandler {
    public final /* synthetic */ sb2 a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ l78 c;

    public aid(sb2 sb2Var, l78 l78Var, l78 l78Var2) {
        this.a = sb2Var;
        this.b = l78Var;
        this.c = l78Var2;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(vb9 vb9Var, n92 n92Var) {
        zhd zhdVar = new zhd(this.a, this.b, null);
        ws wsVar = new ws(this.c, 28);
        ol3 ol3Var = qfd.a;
        Object objS = o7f.s(new kyc(vb9Var, zhdVar, wsVar, new f0a(vb9Var), (n92) null, 2), n92Var);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objS != tb2Var) {
            objS = c1eVar;
        }
        return objS == tb2Var ? objS : c1eVar;
    }
}
