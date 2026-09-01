package defpackage;

import com.medium.android.addressbook.ui.findfriends.FindFriendsFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.following.FollowingFragment;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class wp3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ wp3(int i, int i2, Object obj, Object obj2, Object obj3) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.d;
        Object obj4 = this.c;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                EditPostFragment editPostFragment = (EditPostFragment) obj5;
                rg1 rg1Var = (rg1) obj4;
                nhc nhcVar = (nhc) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i2 = EditPostFragment.Q0;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    o28 o28Var = o28.b;
                    r28 r28VarR = gx1.R(p65Var, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    n01.f(rg1Var, editPostFragment.x0, null, oe1.S, p65Var, 3072, 4);
                    br7.k(nhcVar, iy0.a.a(o28Var, z46.k), 0.0f, null, p65Var, 0, 12);
                    p65Var.p(true);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                vx0.v((eu3) obj5, (nt3) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                s42.g((e6d) obj5, (my6) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                bgf.l((xub) obj5, (hub) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                d46.i((ky3) obj5, (b55) obj4, (b55) obj3, (x12) obj, tr7.y(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                m40.x((db4) obj5, (ua4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 6:
                ((Integer) obj2).getClass();
                m40.g((ab4) obj5, (ua4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 7:
                ((Integer) obj2).getClass();
                m40.k((bb4) obj5, (ua4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                m40.y((eb4) obj5, (ua4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                g01.d((sb4) obj5, (s26) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 10:
                ((Integer) obj2).getClass();
                n01.n((nc4) obj5, (xb4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 11:
                ((Integer) obj2).getClass();
                n01.w((kc4) obj5, (xb4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 12:
                FindFriendsFragment findFriendsFragment = (FindFriendsFragment) obj5;
                rz2 rz2Var = (rz2) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    gx1.t(((FindFriendsFragment.BundleInfo) findFriendsFragment.u0.getValue()).getReferrerSource(), rz2Var, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar.getValue()).a, 7), null, p65Var2, 0);
                }
                break;
            case 13:
                ((Integer) obj2).getClass();
                gx1.u((xi4) obj5, (hi4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 14:
                ((Integer) obj2).getClass();
                gx1.m((oi4) obj5, (hi4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 15:
                ((Integer) obj2).getClass();
                k40.j((tm4) obj5, (lm4) obj4, (r28) obj3, (x12) obj, tr7.y(385));
                break;
            case 16:
                ((Integer) obj2).getClass();
                s42.k((hu4) obj5, (r28) obj4, (rt4) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                ((Integer) obj2).getClass();
                s42.j((gu4) obj5, (rt4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 18:
                ((Integer) obj2).getClass();
                rx0.q((pv4) obj5, (iv4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 19:
                ((Integer) obj2).getClass();
                xz5.l((aw4) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 20:
                ((Integer) obj2).getClass();
                d46.j((dw4) obj5, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 21:
                ((Integer) obj2).getClass();
                f76.i((gw4) obj5, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 22:
                ((Integer) obj2).getClass();
                g76.i((jw4) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 23:
                ((Integer) obj2).getClass();
                vx0.j((tw4) obj5, (lw4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 24:
                vq6 vq6Var = ((FollowingFragment) obj5).u0;
                bx4 bx4Var = (bx4) obj4;
                upc upcVar2 = (upc) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    f49.i(((FollowingFragment.BundleInfo) vq6Var.getValue()).getUserId(), ((FollowingFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((FollowingFragment.BundleInfo) vq6Var.getValue()).getSelectedTab(), bx4Var, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar2.getValue()).a, 7), null, p65Var3, 0);
                }
                break;
            case 25:
                ((Integer) obj2).getClass();
                k50.C((t35) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 26:
                ((Integer) obj2).getClass();
                qb8.h((List) obj5, (ig5) obj4, (sh9) obj3, (x12) obj, tr7.y(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                sgg.u((String) obj5, (az5) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 28:
                ((Integer) obj2).getClass();
                g76.n((xl5) obj5, (sl5) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                g76.r((uef) obj5, (bo4) obj4, (r28) obj3, (x12) obj, tr7.y(385));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ wp3(AbstractMediumFragment abstractMediumFragment, Object obj, Object obj2, int i) {
        this.a = i;
        this.b = abstractMediumFragment;
        this.c = obj;
        this.d = obj2;
    }
}
