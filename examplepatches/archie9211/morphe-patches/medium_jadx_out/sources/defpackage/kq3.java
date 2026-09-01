package defpackage;

import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.donkey.write.publicationflow.PublicationFlowActivity;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kq3 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ xq3 c;
    public final /* synthetic */ EditPostFragment d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kq3(xq3 xq3Var, EditPostFragment editPostFragment, String str, String str2, n92 n92Var) {
        super(2, n92Var);
        this.c = xq3Var;
        this.d = editPostFragment;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new kq3(this.c, this.d, this.e, this.f, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((kq3) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objI;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            this.b = 1;
            objI = this.c.i(this);
            if (objI == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objI = ((bjb) obj).a;
        }
        boolean z = objI instanceof ajb;
        EditPostFragment editPostFragment = this.d;
        if (!z) {
            gr3 gr3Var = (gr3) objI;
            editPostFragment.J0 = null;
            editPostFragment.o1(aq3.EDITING);
            boolean z2 = gr3Var instanceof cr3;
            String str = this.e;
            String str2 = this.f;
            if (z2) {
                k7 k7Var = editPostFragment.I0;
                if (k7Var == null) {
                    g76.g0("publicationFlowActivityResultLauncher");
                    throw null;
                }
                k7Var.a(new PublicationFlowActivity.BundleInfo(((cr3) gr3Var).b, str, str2), null);
            } else if (gr3Var instanceof fr3) {
                k7 k7Var2 = editPostFragment.I0;
                if (k7Var2 == null) {
                    g76.g0("publicationFlowActivityResultLauncher");
                    throw null;
                }
                k7Var2.a(new PublicationFlowActivity.BundleInfo(((fr3) gr3Var).b, str, str2), null);
            } else if (gr3Var instanceof er3) {
                k7 k7Var3 = editPostFragment.I0;
                if (k7Var3 == null) {
                    g76.g0("publicationFlowActivityResultLauncher");
                    throw null;
                }
                k7Var3.a(new PublicationFlowActivity.BundleInfo(((er3) gr3Var).a, str, str2), null);
            } else {
                if (!(gr3Var instanceof dr3)) {
                    ygf.a();
                    return null;
                }
                String strO = editPostFragment.o(R.string.edit_post_empty_post);
                strO.getClass();
                ahc.h(editPostFragment.T(), strO, -1).j();
            }
        }
        Throwable thB = bjb.b(objI);
        if (thB != null) {
            editPostFragment.J0 = null;
            editPostFragment.o1(aq3.EDITING);
            editPostFragment.l1(thB);
        }
        return c1e.a;
    }
}
