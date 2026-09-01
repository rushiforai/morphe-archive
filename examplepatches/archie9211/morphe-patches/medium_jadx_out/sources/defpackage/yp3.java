package defpackage;

import android.content.Context;
import android.net.Uri;
import android.view.View;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.core.navigation.s;
import com.medium.android.donkey.write.EditPostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class yp3 implements View.OnClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ EditPostFragment b;

    public /* synthetic */ yp3(EditPostFragment editPostFragment, int i) {
        this.a = i;
        this.b = editPostFragment;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i = this.a;
        EditPostFragment editPostFragment = this.b;
        switch (i) {
            case 0:
                int i2 = EditPostFragment.Q0;
                editPostFragment.n1();
                return;
            case 1:
                int i3 = EditPostFragment.Q0;
                s sVarZ = editPostFragment.Z();
                Context contextS = editPostFragment.S();
                if (editPostFragment.B0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                ((p13) sVarZ).f(contextS, Uri.parse(i03.l), gp7.u(editPostFragment.j1().v));
                return;
            case 2:
                int i4 = EditPostFragment.Q0;
                editPostFragment.n1();
                return;
            case 3:
                int i5 = EditPostFragment.Q0;
                editPostFragment.n1();
                return;
            case 4:
                int i6 = EditPostFragment.Q0;
                editPostFragment.n1();
                return;
            default:
                iv2 iv2Var = editPostFragment.F0;
                if (iv2Var == null) {
                    g76.g0("binding");
                    throw null;
                }
                if (((EditPostBodyView) iv2Var.h).getChildCount() != 0) {
                    iv2 iv2Var2 = editPostFragment.F0;
                    if (iv2Var2 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    ((EditPostBodyView) iv2Var2.h).getChildAt(r3.getChildCount() - 1).requestFocus();
                    return;
                }
                return;
        }
    }
}
