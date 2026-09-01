package defpackage;

import android.os.Looper;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.digest.ui.digesthistory.DigestHistoryDialogFragment;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.settings.ui.discoverability.DiscoverabilityFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gu1 extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gu1(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 1;
        int i3 = 0;
        int i4 = 3;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((hu1) this.receiver).a();
                return c1eVar;
            case 1:
                ((vd2) this.receiver).getClass();
                String name = Thread.currentThread().getName();
                name.getClass();
                return Boolean.valueOf(muc.Q(name, "Firebase Background Thread #", false));
            case 2:
                ((vd2) this.receiver).getClass();
                String name2 = Thread.currentThread().getName();
                name2.getClass();
                return Boolean.valueOf(muc.Q(name2, "Firebase Blocking Thread #", false));
            case 3:
                ((vd2) this.receiver).getClass();
                return Boolean.valueOf(!Looper.getMainLooper().isCurrentThread());
            case 4:
                we2 we2Var = ((xd2) this.receiver).b;
                we2Var.getClass();
                vx0.c0(f76.F(we2Var), null, null, new r91(we2Var, n92Var, 15), 3);
                return c1eVar;
            case 5:
                qo7.z(k40.X(((xd2) this.receiver).a), R.id.createCatalogBottomSheetDialogFragment);
                return c1eVar;
            case 6:
                k40.X(((jl2) this.receiver).a).f();
                return c1eVar;
            case 7:
                return ((ygd) this.receiver).P();
            case 8:
                k40.X(((u43) this.receiver).a).f();
                return c1eVar;
            case 9:
                j53 j53Var = ((u43) this.receiver).b;
                j53Var.getClass();
                vx0.c0(f76.F(j53Var), null, null, new r91(j53Var, n92Var, 24), 3);
                return c1eVar;
            case 10:
                ((t53) this.receiver).a();
                return c1eVar;
            case 11:
                ((t53) this.receiver).a();
                return c1eVar;
            case 12:
                k40.X((DigestHistoryDialogFragment) ((nc3) this.receiver).a.b).f();
                return c1eVar;
            case 13:
                k40.X((DigestHistoryDialogFragment) ((nc3) this.receiver).a.b).f();
                return c1eVar;
            case 14:
                qe3 qe3Var = ((ld3) this.receiver).b;
                vx0.c0(f76.F(qe3Var), null, null, new m1(qe3Var, n92Var, 9), 3);
                return c1eVar;
            case 15:
                ((DiscoverabilityFragment) ((nf3) this.receiver).a.b).Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 16:
                k40.X(((ah3) this.receiver).b).f();
                return c1eVar;
            case 17:
                ph3 ph3Var = ((ah3) this.receiver).a;
                ph3Var.getClass();
                vx0.c0(f76.F(ph3Var), null, null, new mh3(ph3Var, n92Var, i3), 3);
                return c1eVar;
            case 18:
                ph3 ph3Var2 = ((ah3) this.receiver).a;
                ph3Var2.getClass();
                vx0.c0(f76.F(ph3Var2), null, null, new mh3(ph3Var2, n92Var, i2), 3);
                return c1eVar;
            case 19:
                tj3 tj3Var = (tj3) ((oj3) this.receiver).a.w0.getValue();
                tj3Var.b.j();
                sj3 sj3Var = new sj3(0L, false);
                xpc xpcVar = tj3Var.c;
                xpcVar.getClass();
                xpcVar.m(null, sj3Var);
                return c1eVar;
            case 20:
                ((oj3) this.receiver).a.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 21:
                EditPostFragment editPostFragment = ((gq3) this.receiver).a;
                int i5 = EditPostFragment.Q0;
                ht3 ht3VarJ1 = editPostFragment.j1();
                vx0.c0(f76.F(ht3VarJ1), null, null, new ws3(ht3VarJ1, n92Var, 6), 3);
                return c1eVar;
            case 22:
                EditPostFragment editPostFragment2 = ((gq3) this.receiver).a;
                int i6 = EditPostFragment.Q0;
                ht3 ht3VarJ12 = editPostFragment2.j1();
                vx0.c0(f76.F(ht3VarJ12), null, null, new ws3(ht3VarJ12, n92Var, i4), 3);
                return c1eVar;
            case 23:
                EditPostFragment editPostFragment3 = ((gq3) this.receiver).a;
                int i7 = EditPostFragment.Q0;
                ht3 ht3VarJ13 = editPostFragment3.j1();
                vx0.c0(f76.F(ht3VarJ13), null, null, new ws3(ht3VarJ13, n92Var, i2), 3);
                return c1eVar;
            case 24:
                EditPostFragment editPostFragment4 = ((gq3) this.receiver).a;
                iv2 iv2Var = editPostFragment4.F0;
                if (iv2Var == null) {
                    g76.g0("binding");
                    throw null;
                }
                if (((EditPostBodyView) iv2Var.h).l()) {
                    ht3 ht3VarJ14 = editPostFragment4.j1();
                    vx0.c0(f76.F(ht3VarJ14), null, null, new ws3(ht3VarJ14, n92Var, 4), 3);
                } else {
                    ht3 ht3VarJ15 = editPostFragment4.j1();
                    iv2 iv2Var2 = editPostFragment4.F0;
                    if (iv2Var2 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    vx0.c0(f76.F(ht3VarJ15), null, null, new rc0(ht3VarJ15, ((EditPostBodyView) iv2Var2.h).getCurrentFocusSelectedText(), n92Var, 10), 3);
                }
                return c1eVar;
            case 25:
                EditPostFragment editPostFragment5 = ((gq3) this.receiver).a;
                int i8 = EditPostFragment.Q0;
                ht3 ht3VarJ16 = editPostFragment5.j1();
                vx0.c0(f76.F(ht3VarJ16), null, null, new ws3(ht3VarJ16, n92Var, 5), 3);
                return c1eVar;
            case 26:
                EditPostFragment editPostFragment6 = ((gq3) this.receiver).a;
                int i9 = EditPostFragment.Q0;
                ht3 ht3VarJ17 = editPostFragment6.j1();
                vx0.c0(f76.F(ht3VarJ17), null, null, new ws3(ht3VarJ17, n92Var, 2), 3);
                return c1eVar;
            case 27:
                EditPostFragment editPostFragment7 = ((gq3) this.receiver).a;
                int i10 = EditPostFragment.Q0;
                ht3 ht3VarJ18 = editPostFragment7.j1();
                vx0.c0(f76.F(ht3VarJ18), null, null, new ws3(ht3VarJ18, n92Var, i3), 3);
                return c1eVar;
            case 28:
                EditPostFragment editPostFragment8 = ((gq3) this.receiver).a;
                int i11 = EditPostFragment.Q0;
                ht3 ht3VarJ19 = editPostFragment8.j1();
                vx0.c0(f76.F(ht3VarJ19), null, null, new ys3(ht3VarJ19, n92Var, i3), 3);
                return c1eVar;
            default:
                ((ht3) this.receiver).h();
                return c1eVar;
        }
    }
}
