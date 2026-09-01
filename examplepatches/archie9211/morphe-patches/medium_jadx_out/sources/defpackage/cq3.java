package defpackage;

import androidx.compose.ui.platform.ComposeView;
import com.medium.android.donkey.write.EditPostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cq3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ EditPostFragment d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cq3(EditPostFragment editPostFragment, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = editPostFragment;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        EditPostFragment editPostFragment = this.d;
        switch (i) {
            case 0:
                cq3 cq3Var = new cq3(editPostFragment, n92Var, 0);
                cq3Var.c = obj;
                return cq3Var;
            default:
                cq3 cq3Var2 = new cq3(editPostFragment, n92Var, 1);
                cq3Var2.c = obj;
                return cq3Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((cq3) create((nld) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((cq3) create((ps3) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        EditPostFragment editPostFragment = this.d;
        n92 n92Var = null;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                editPostFragment.J0 = vx0.c0(o7f.x(editPostFragment), null, null, new ku2(editPostFragment, (nld) obj2, n92Var, 11), 3);
                return c1eVar;
            default:
                ps3 ps3Var = (ps3) obj2;
                br7.v(obj);
                if (!(ps3Var instanceof ns3)) {
                    if (!(ps3Var instanceof os3)) {
                        ygf.a();
                        return null;
                    }
                    aq3 aq3Var = aq3.LOADING;
                    int i2 = EditPostFragment.Q0;
                    editPostFragment.o1(aq3Var);
                    return c1eVar;
                }
                ns3 ns3Var = (ns3) ps3Var;
                i06 i06Var = ns3Var.b;
                int i3 = 0;
                if (i06Var != null) {
                    String str = ns3Var.a;
                    int i4 = EditPostFragment.Q0;
                    iv2 iv2Var = editPostFragment.F0;
                    if (iv2Var == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    ((ComposeView) iv2Var.e).setVisibility(0);
                    iv2 iv2Var2 = editPostFragment.F0;
                    if (iv2Var2 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    ((ComposeView) iv2Var2.e).setContent(new mz1(new vp3(i06Var, editPostFragment, str, i3), true, 1445375225));
                } else {
                    rg1 rg1Var = ns3Var.c;
                    if (rg1Var != null) {
                        int i5 = EditPostFragment.Q0;
                        iv2 iv2Var3 = editPostFragment.F0;
                        if (iv2Var3 == null) {
                            g76.g0("binding");
                            throw null;
                        }
                        ((ComposeView) iv2Var3.e).setVisibility(0);
                        iv2 iv2Var4 = editPostFragment.F0;
                        if (iv2Var4 == null) {
                            g76.g0("binding");
                            throw null;
                        }
                        ((ComposeView) iv2Var4.e).setContent(new mz1(new ag1(editPostFragment, 22, rg1Var), true, 139402159));
                    }
                }
                aq3 aq3Var2 = aq3.EDITING;
                int i6 = EditPostFragment.Q0;
                editPostFragment.o1(aq3Var2);
                return c1eVar;
        }
    }
}
