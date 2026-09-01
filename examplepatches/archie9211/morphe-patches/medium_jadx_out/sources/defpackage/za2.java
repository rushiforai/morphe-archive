package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class za2 implements PointerInputEventHandler {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ za2(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(vb9 vb9Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                Object objS = o7f.s(new ya2(vb9Var, (rhd) obj2, (lid) obj, null, 0), n92Var);
                return objS == tb2.COROUTINE_SUSPENDED ? objS : c1eVar;
            default:
                Object objI0 = ((w4d) vb9Var).I0(new uk3(new rya(), new nya(), new nya(), (x45) obj2, (x45) obj, null, 1), n92Var);
                return objI0 == tb2.COROUTINE_SUSPENDED ? objI0 : c1eVar;
        }
    }
}
