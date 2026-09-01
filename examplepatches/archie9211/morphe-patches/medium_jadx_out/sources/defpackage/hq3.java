package defpackage;

import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.publicationadmin.ui.featuredposts.FeaturedPostsFragment;
import com.medium.proto.event.FindYourFriendsClickedFollowedAll;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hq3 extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hq3(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() throws Exception {
        int i = this.a;
        int i2 = 1;
        int i3 = 0;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((ht3) this.receiver).h();
                break;
            case 1:
                ((ht3) this.receiver).h();
                break;
            case 2:
                EditPostFragment editPostFragment = ((fq3) this.receiver).a;
                int i4 = EditPostFragment.Q0;
                editPostFragment.q1();
                break;
            case 3:
                ((fq3) this.receiver).a();
                break;
            case 4:
                EditPostFragment editPostFragment2 = ((fq3) this.receiver).a;
                int i5 = EditPostFragment.Q0;
                xq3 xq3Var = editPostFragment2.j1().x;
                if (xq3Var != null) {
                    editPostFragment2.o1(aq3.LOADING);
                    enc encVar = editPostFragment2.J0;
                    if (encVar != null) {
                        encVar.m(null);
                    }
                    xq3Var.a();
                    editPostFragment2.J0 = vx0.c0(o7f.x(editPostFragment2), null, null, new eq3(xq3Var, editPostFragment2, n92Var, i3), 3);
                }
                break;
            case 5:
                ((nt3) this.receiver).d();
                break;
            case 6:
                ((nt3) this.receiver).a();
                break;
            case 7:
                ((nt3) this.receiver).b();
                break;
            case 8:
                ((nt3) this.receiver).d();
                break;
            case 9:
                ((nt3) this.receiver).d();
                break;
            case 10:
                ((nt3) this.receiver).b.close();
                break;
            case 11:
                ((nt3) this.receiver).d();
                break;
            case 12:
                ju3 ju3Var = ((nt3) this.receiver).a;
                vx0.c0(f76.F(ju3Var), null, null, new gu3(ju3Var, n92Var, i2), 3);
                break;
            case 13:
                ju3 ju3Var2 = ((nt3) this.receiver).a;
                vx0.c0(f76.F(ju3Var2), null, null, new gu3(ju3Var2, n92Var, 4), 3);
                break;
            case 14:
                ((nt3) this.receiver).c();
                break;
            case 15:
                ((nt3) this.receiver).c();
                break;
            case 16:
                ((l64) this.receiver).a();
                break;
            case 17:
                ((l64) this.receiver).a();
                break;
            case 18:
                ((c84) this.receiver).a();
                break;
            case 19:
                ib4 ib4Var = ((ua4) this.receiver).b;
                vx0.c0(f76.F(ib4Var), null, null, new gb4(ib4Var, n92Var, i3), 3);
                break;
            case 20:
                ((ua4) this.receiver).b();
                break;
            case 21:
                ((ua4) this.receiver).b();
                break;
            case 22:
                ((ua4) this.receiver).b();
                break;
            case 23:
                ((ua4) this.receiver).b();
                break;
            case 24:
                ib4 ib4Var2 = ((ua4) this.receiver).b;
                vx0.c0(f76.F(ib4Var2), null, null, new gb4(ib4Var2, n92Var, i2), 3);
                break;
            case 25:
                ((ua4) this.receiver).b();
                break;
            case 26:
                k40.X(((ob4) this.receiver).a.a).f();
                break;
            case 27:
                k40.X((FeaturedPostsFragment) ((xb4) this.receiver).a.b).f();
                break;
            case 28:
                fj4 fj4Var = ((hi4) this.receiver).b;
                vx0.c0(f76.F(fj4Var), null, null, new zi4(fj4Var, n92Var, i2), 3);
                break;
            default:
                fj4 fj4Var2 = ((hi4) this.receiver).b;
                cx2 cx2Var = fj4Var2.j;
                String str = fj4Var2.b;
                String str2 = fj4Var2.A;
                String str3 = fj4Var2.y;
                cx2Var.getClass();
                str.getClass();
                str2.getClass();
                str3.getClass();
                rqd.a(cx2Var.a, new FindYourFriendsClickedFollowedAll(null, null, 3, null), str, str2, false, null, str3, 24);
                vx0.c0(f76.F(fj4Var2), null, null, new aj4(fj4Var2, n92Var, i3), 3);
                break;
        }
        return c1eVar;
    }
}
