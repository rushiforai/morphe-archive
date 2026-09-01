package defpackage;

import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.common.post.pre.ParagraphEditPreLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class op3 implements c19, e19 {
    public final /* synthetic */ EditPostBodyView a;

    public /* synthetic */ op3(EditPostBodyView editPostBodyView) {
        this.a = editPostBodyView;
    }

    @Override // defpackage.c19
    public void A(ParagraphEditImageLayout paragraphEditImageLayout, String str) {
        EditPostBodyView editPostBodyView = this.a;
        editPostBodyView.getListener().j(str);
        int iD = editPostBodyView.d(paragraphEditImageLayout);
        Integer numValueOf = Integer.valueOf(iD);
        if (iD == -1) {
            numValueOf = null;
        }
        if (numValueOf != null) {
            editPostBodyView.p(numValueOf.intValue());
        }
    }

    @Override // defpackage.c19
    public void E0(ParagraphEditImageLayout paragraphEditImageLayout) {
        int i = EditPostBodyView.q;
        this.a.n(paragraphEditImageLayout);
    }

    @Override // defpackage.e19
    public void T(y5d y5dVar) {
        this.a.p = y5dVar;
    }

    @Override // defpackage.e19
    public void b(ParagraphEditPreLayout paragraphEditPreLayout) {
        int i = EditPostBodyView.q;
        this.a.n(paragraphEditPreLayout);
    }

    @Override // defpackage.c19
    public void x0(y09 y09Var) {
        boolean z = y09Var instanceof s09;
        EditPostBodyView editPostBodyView = this.a;
        if (z) {
            s09 s09Var = (s09) y09Var;
            editPostBodyView.getListener().e(s09Var.d, s09Var.a);
            return;
        }
        if (y09Var instanceof t09) {
            t09 t09Var = (t09) y09Var;
            editPostBodyView.getListener().l(t09Var.b, t09Var.a);
            return;
        }
        if (!(y09Var instanceof u09) && !(y09Var instanceof v09) && !(y09Var instanceof w09) && !(y09Var instanceof r09) && !(y09Var instanceof x09)) {
            ygf.a();
            return;
        }
        throw new UnsupportedOperationException("Retry on " + y09Var + " is not supported");
    }
}
