package defpackage;

import android.app.PendingIntent;
import android.view.View;
import android.view.ViewTreeObserver;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.proto.model.SelectionPb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class sp3 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ EditPostFragment b;

    public /* synthetic */ sp3(EditPostFragment editPostFragment, int i) {
        this.a = i;
        this.b = editPostFragment;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws PendingIntent.CanceledException {
        int i = this.a;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        final EditPostFragment editPostFragment = this.b;
        switch (i) {
            case 0:
                int i2 = EditPostFragment.Q0;
                ((dq8) obj).getClass();
                editPostFragment.q1();
                return c1eVar;
            case 1:
                sp2 sp2Var = (sp2) obj;
                int i3 = EditPostFragment.Q0;
                sp2Var.getClass();
                vq6 vq6Var = editPostFragment.u0;
                String referrerSource = ((EditPostFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                EditPostReference editPostReference = ((EditPostFragment.BundleInfo) vq6Var.getValue()).getEditPostReference();
                eo2 eo2Var = sp2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                mya myaVar = new mya(ys2Var.b.a.a, on7.b());
                my6 my6Var = new my6((in7) ys2Var.b.o.get());
                cw3 cw3VarF = ys2Var.f();
                ko2 ko2Var = eo2Var.b;
                ty2 ty2Var = new ty2(ko2Var.x());
                hx4 hx4VarH = ko2Var.h();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new ht3(referrerSource, editPostReference, myaVar, my6Var, cw3VarF, ty2Var, hx4VarH, r13Var, ys2Var.a, ys2Var.b(), ys2Var.a(), ko2Var.k(), ko2Var.t(), new o98(), new qf2(ys2Var.f()));
            case 2:
                int i4 = EditPostFragment.Q0;
                ((wh3) obj).getClass();
                ViewTreeObserver.OnGlobalFocusChangeListener onGlobalFocusChangeListener = new ViewTreeObserver.OnGlobalFocusChangeListener() { // from class: zp3
                    @Override // android.view.ViewTreeObserver.OnGlobalFocusChangeListener
                    public final void onGlobalFocusChanged(View view, View view2) {
                        EditPostFragment editPostFragment2 = editPostFragment;
                        iv2 iv2Var = editPostFragment2.F0;
                        n92 n92Var2 = null;
                        if (iv2Var == null) {
                            g76.g0("binding");
                            throw null;
                        }
                        SelectionPb selection = ((EditPostBodyView) iv2Var.h).getSelection();
                        if (selection == null) {
                            selection = editPostFragment2.N0;
                        }
                        editPostFragment2.N0 = selection;
                        ht3 ht3VarJ1 = editPostFragment2.j1();
                        iv2 iv2Var2 = editPostFragment2.F0;
                        if (iv2Var2 == null) {
                            g76.g0("binding");
                            throw null;
                        }
                        vx0.c0(f76.F(ht3VarJ1), null, null, new xs3(ht3VarJ1, ((EditPostBodyView) iv2Var2.h).getCurrentFocusType(), n92Var2, 0), 3);
                    }
                };
                iv2 iv2Var = editPostFragment.F0;
                if (iv2Var != null) {
                    ((EditPostBodyView) iv2Var.h).getViewTreeObserver().addOnGlobalFocusChangeListener(onGlobalFocusChangeListener);
                    return new am0(editPostFragment, 2, onGlobalFocusChangeListener);
                }
                g76.g0("binding");
                throw null;
            case 3:
                rg1 rg1Var = (rg1) obj;
                ((p13) editPostFragment.Z()).w0(editPostFragment.S(), rg1Var.a, rg1Var.n);
                return c1eVar;
            default:
                rg1 rg1Var2 = (rg1) obj;
                int i5 = EditPostFragment.Q0;
                ht3 ht3VarJ1 = editPostFragment.j1();
                rg1Var2.getClass();
                vx0.c0(f76.F(ht3VarJ1), null, null, new rc0(ht3VarJ1, rg1Var2, n92Var, 11), 3);
                return c1eVar;
        }
    }
}
