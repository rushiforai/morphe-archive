package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dp implements PointerInputEventHandler {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ dp(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(vb9 vb9Var, n92 n92Var) {
        int i = this.a;
        int i2 = 2;
        int i3 = 3;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                Object objL = w2g.l(vb9Var, new cp((ep) obj, n92Var2, 0), n92Var);
                return objL == tb2.COROUTINE_SUSPENDED ? objL : c1eVar;
            case 1:
                Object objS = o7f.s(new xs3(vb9Var, (gz8) obj, n92Var2, 23), n92Var);
                return objS == tb2.COROUTINE_SUSPENDED ? objS : c1eVar;
            case 2:
                Class<uu6> cls = uu6.class;
                k0 k0Var = new k0(1, (uu6) obj, cls, "onDragStart", "onDragStart-k-4lQ0M$core_release(J)V", 0, 25);
                int i4 = 0;
                int i5 = 0;
                ek5 ek5Var = new ek5(i5, (uu6) obj, cls, "onDragEnd", "onDragEnd$core_release()V", i4, 13);
                uu6 uu6Var = (uu6) obj;
                ek5 ek5Var2 = new ek5(i5, uu6Var, cls, "onDragCancel", "onDragCancel$core_release()V", i4, 14);
                l23 l23Var = new l23(28, uu6Var);
                float f = yk3.a;
                Object objL2 = w2g.l(vb9Var, new vk3(k0Var, ek5Var, ek5Var2, l23Var, null), n92Var);
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                if (objL2 != tb2Var) {
                    objL2 = c1eVar;
                }
                return objL2 == tb2Var ? objL2 : c1eVar;
            case 3:
                Object objD = qfd.d(vb9Var, null, new r00(4, (m45) obj), n92Var, 7);
                return objD == tb2.COROUTINE_SUSPENDED ? objD : c1eVar;
            case 4:
                Object objI0 = ((w4d) vb9Var).I0(new cp((qa2) obj, n92Var2, i3), n92Var);
                return objI0 == tb2.COROUTINE_SUSPENDED ? objI0 : c1eVar;
            case 5:
                bgc bgcVar = (bgc) obj;
                Object objD2 = qfd.d(vb9Var, new zfc(bgcVar, null), new vfc(bgcVar, i2), n92Var, 3);
                return objD2 == tb2.COROUTINE_SUSPENDED ? objD2 : c1eVar;
            case 6:
                Object objL3 = w2g.l(vb9Var, new pp0((yuc) obj, n92Var2, i3), n92Var);
                return objL3 == tb2.COROUTINE_SUSPENDED ? objL3 : c1eVar;
            case 7:
                Object objL4 = w2g.l(vb9Var, new cp(new hgb(1, (chd) obj, chd.class, "tryShowContextMenu", "tryShowContextMenu-k-4lQ0M(J)V", 0, 11), n92Var2, i2), n92Var);
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                if (objL4 != tb2Var2) {
                    objL4 = c1eVar;
                }
                return objL4 == tb2Var2 ? objL4 : c1eVar;
            case 8:
                lid lidVar = (lid) obj;
                o72 o72Var = lidVar.z;
                jid jidVar = lidVar.y;
                w4d w4dVar = (w4d) vb9Var;
                w4dVar.getClass();
                Object objL5 = w2g.l(vb9Var, new pp0(new xp(flb.v0(w4dVar).A), o72Var, jidVar, null), n92Var);
                if (objL5 != tb2.COROUTINE_SUSPENDED) {
                    objL5 = c1eVar;
                }
                return objL5 == tb2.COROUTINE_SUSPENDED ? objL5 : c1eVar;
            default:
                Object objS2 = o7f.s(new lm1(vb9Var, (rhd) obj, n92Var2, 8), n92Var);
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                if (objS2 != tb2Var3) {
                    objS2 = c1eVar;
                }
                return objS2 == tb2Var3 ? objS2 : c1eVar;
        }
    }
}
