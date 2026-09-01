package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.unsplash.ui.UnsplashPickerFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eq3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ xq3 d;
    public final /* synthetic */ EditPostFragment e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ eq3(xq3 xq3Var, EditPostFragment editPostFragment, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = xq3Var;
        this.e = editPostFragment;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        EditPostFragment editPostFragment = this.e;
        xq3 xq3Var = this.d;
        switch (i) {
            case 0:
                return new eq3(xq3Var, editPostFragment, n92Var, 0);
            case 1:
                return new eq3(xq3Var, editPostFragment, n92Var, 1);
            case 2:
                return new eq3(xq3Var, editPostFragment, n92Var, 2);
            default:
                return new eq3(xq3Var, editPostFragment, n92Var, 3);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((eq3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws PendingIntent.CanceledException {
        Object objK;
        Object objI;
        Object objI2;
        Object objI3;
        int i = this.b;
        c1e c1eVar = c1e.a;
        xq3 xq3Var = this.d;
        EditPostFragment editPostFragment = this.e;
        int i2 = 1;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    objK = xq3Var.k(this);
                    if (objK == tb2Var) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objK = ((bjb) obj).a;
                }
                if (!(objK instanceof ajb)) {
                    editPostFragment.J0 = null;
                    editPostFragment.k1();
                }
                Throwable thB = bjb.b(objK);
                if (thB != null) {
                    editPostFragment.J0 = null;
                    editPostFragment.o1(aq3.EDITING);
                    editPostFragment.l1(thB);
                }
                break;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    objI = xq3Var.i(this);
                    if (objI == tb2Var2) {
                    }
                } else if (i4 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objI = ((bjb) obj).a;
                }
                if (!(objI instanceof ajb)) {
                    editPostFragment.J0 = null;
                    editPostFragment.o1(aq3.EDITING);
                    editPostFragment.Z();
                    Context contextS = editPostFragment.S();
                    String strU = gp7.u(editPostFragment.j1().v);
                    Bundle bundle = new Bundle();
                    bundle.putParcelable("bundle_info", new UnsplashPickerFragment.BundleInfo(strU));
                    m4.w(contextS, R.id.unsplashPickerFragment, bundle, null, 12);
                }
                Throwable thB2 = bjb.b(objI);
                if (thB2 != null) {
                    editPostFragment.J0 = null;
                    editPostFragment.o1(aq3.EDITING);
                    editPostFragment.l1(thB2);
                }
                break;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    objI2 = xq3Var.i(this);
                    if (objI2 == tb2Var3) {
                    }
                } else if (i5 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objI2 = ((bjb) obj).a;
                }
                if (!(objI2 instanceof ajb)) {
                    editPostFragment.J0 = null;
                    editPostFragment.p1((gr3) objI2);
                }
                if (bjb.b(objI2) != null) {
                    editPostFragment.J0 = null;
                }
                break;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    objI3 = xq3Var.i(this);
                    if (objI3 == tb2Var4) {
                    }
                } else if (i6 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objI3 = ((bjb) obj).a;
                }
                if (!(objI3 instanceof ajb)) {
                    editPostFragment.J0 = null;
                    editPostFragment.p1((gr3) objI3);
                    editPostFragment.k1();
                }
                if (bjb.b(objI3) != null) {
                    editPostFragment.J0 = null;
                    ht3 ht3VarJ1 = editPostFragment.j1();
                    vx0.c0(f76.F(ht3VarJ1), null, null, new ys3(ht3VarJ1, n92Var, i2), 3);
                }
                break;
        }
        return c1eVar;
    }
}
