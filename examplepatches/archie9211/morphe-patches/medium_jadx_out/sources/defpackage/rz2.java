package defpackage;

import android.content.ClipDescription;
import android.content.ContentProviderClient;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.profile.ui.edit.EditProfileFragment;
import java.io.IOException;
import java.io.StringWriter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rz2 implements ye1, r55, iz4, y27, qx5, s3b, jkc {
    public final /* synthetic */ int a;
    public Object b;

    public rz2(int i) {
        this.a = i;
        switch (i) {
            case 28:
                this.b = new o78(new bt6[16]);
                break;
            default:
                this.b = new hkc(d46.f);
                break;
        }
    }

    @Override // defpackage.ye1
    public void D(int i, String str) {
        str.getClass();
    }

    @Override // defpackage.y27
    public void F(int i, int i2) {
        ((gy6) this.b).a.c(i, i2);
    }

    public void H(aq6 aq6Var) {
        if (!aq6Var.H()) {
            b26.b("DepthSortedSet.add called on an unattached node");
        }
        ((hkc) this.b).add(aq6Var);
    }

    public String I(Object obj) {
        StringWriter stringWriter = new StringWriter();
        try {
            yb6 yb6Var = (yb6) this.b;
            xd6 xd6Var = new xd6(stringWriter, yb6Var.a, yb6Var.b, yb6Var.c, yb6Var.d);
            xd6Var.h(obj);
            xd6Var.j();
            xd6Var.b.flush();
        } catch (IOException unused) {
        }
        return stringWriter.toString();
    }

    public upc J() {
        yw3 yw3VarA = yw3.a();
        if (yw3VarA.c() == 1) {
            return new wy5(true);
        }
        k49 k49VarU = qo7.u(Boolean.FALSE);
        yw3VarA.h(new qz2(k49VarU, this));
        return k49VarU;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object K(com.medium.android.graphql.type.UserDismissableFlags r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.d86
            if (r0 == 0) goto L13
            r0 = r7
            d86 r0 = (defpackage.d86) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            d86 r0 = new d86
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L34
            if (r2 != r4) goto L2e
            com.medium.android.graphql.type.UserDismissableFlags r6 = r0.b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r5 = r7.a
            goto L46
        L2e:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L34:
            defpackage.br7.v(r7)
            java.lang.Object r5 = r5.b
            oo1 r5 = (defpackage.oo1) r5
            r0.b = r6
            r0.e = r4
            java.lang.Object r5 = r5.b(r0)
            if (r5 != r1) goto L46
            return r1
        L46:
            java.lang.Throwable r7 = defpackage.bjb.b(r5)
            if (r7 != 0) goto L5a
            java.util.List r5 = (java.util.List) r5
            if (r5 != 0) goto L51
            goto L5a
        L51:
            boolean r5 = r5.contains(r6)
            java.lang.Boolean r5 = java.lang.Boolean.valueOf(r5)
            return r5
        L5a:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rz2.K(com.medium.android.graphql.type.UserDismissableFlags, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object L(defpackage.yd4 r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.yc5
            if (r0 == 0) goto L13
            r0 = r7
            yc5 r0 = (defpackage.yc5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            yc5 r0 = new yc5
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r5 = r7.a
            goto L42
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L32:
            defpackage.br7.v(r7)
            java.lang.Object r5 = r5.b
            l2c r5 = (defpackage.l2c) r5
            r0.d = r4
            java.lang.Object r5 = r5.b(r6, r0)
            if (r5 != r1) goto L42
            return r1
        L42:
            java.lang.Throwable r6 = defpackage.bjb.b(r5)
            if (r6 != 0) goto L5b
            gee r5 = (defpackage.gee) r5
            if (r5 == 0) goto L4d
            goto L60
        L4d:
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException
            java.lang.String r6 = "preferences is null"
            r5.<init>(r6)
            ajb r6 = new ajb
            r6.<init>(r5)
            r5 = r6
            goto L60
        L5b:
            ajb r5 = new ajb
            r5.<init>(r6)
        L60:
            java.lang.Throwable r6 = defpackage.bjb.b(r5)
            r7 = 0
            if (r6 != 0) goto L74
            r6 = r5
            gee r6 = (defpackage.gee) r6
            uld r6 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r7]
            java.lang.String r0 = "Successfully fetched user preferences"
            defpackage.km4.I(r6, r3, r0, r7, r0)
            return r5
        L74:
            uld r0 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r7]
            java.lang.String r1 = "Failed to fetch user preferences"
            r0.e(r6, r1, r7)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rz2.L(yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object M(java.lang.String r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.de4
            if (r0 == 0) goto L13
            r0 = r6
            de4 r0 = (defpackage.de4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            de4 r0 = new de4
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r4 = r6.a
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r6)
            java.lang.Object r4 = r4.b
            kla r4 = (defpackage.kla) r4
            r0.d = r3
            java.io.Serializable r4 = r4.f(r5, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rz2.M(java.lang.String, p92):java.lang.Object");
    }

    public boolean N(int i) {
        if (i < 0) {
            return false;
        }
        xp xpVar = (xp) this.b;
        if (i >= xpVar.b) {
            return false;
        }
        v66 v66VarP = xpVar.p(i);
        x45 x45Var = ((yv6) v66VarP.c).c;
        return x45Var != null && x45Var.invoke(Integer.valueOf(i - v66VarP.a)) == zi5.g;
    }

    public void O() {
        ((l15) this.b).y.P();
    }

    public boolean P(aq6 aq6Var) {
        if (!aq6Var.H()) {
            b26.b("DepthSortedSet.remove called on an unattached node");
        }
        return ((hkc) this.b).remove(aq6Var);
    }

    @Override // defpackage.qx5
    public void a() {
        ImageCarouselActivity imageCarouselActivity = (ImageCarouselActivity) this.b;
        uz5 uz5Var = imageCarouselActivity.q;
        if (uz5Var == null) {
            g76.g0("binding");
            throw null;
        }
        ((ImageView) uz5Var.f).setVisibility(8);
        imageCarouselActivity.startPostponedEnterTransition();
    }

    @Override // defpackage.s3b
    public void accept(Object obj, Object obj2) {
        po1 po1Var = (po1) this.b;
        k66 k66Var = new k66((wfd) obj2, 0);
        su5 su5Var = (su5) ((uu5) ((rib) obj).h());
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken("com.google.android.gms.auth.blockstore.restorecredential.internal.IRestoreCredentialService");
        int i = nxf.a;
        parcelObtain.writeInt(1);
        po1Var.writeToParcel(parcelObtain, 0);
        parcelObtain.writeStrongBinder(k66Var);
        su5Var.a(4, parcelObtain);
    }

    @Override // defpackage.r55
    public r55 b(e41 e41Var) {
        e41Var.getClass();
        return this;
    }

    @Override // defpackage.r55
    public s55 build() {
        return (h14) this.b;
    }

    @Override // defpackage.ye1
    public void c(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        n92 n92Var = null;
        if (z) {
            int i = EditPostFragment.Q0;
            ht3 ht3VarJ1 = editPostFragment.j1();
            vx0.c0(f76.F(ht3VarJ1), null, null, new us3(0, n92Var, ht3VarJ1, str, str2), 3);
        } else {
            int i2 = EditPostFragment.Q0;
            ht3 ht3VarJ12 = editPostFragment.j1();
            vx0.c0(f76.F(ht3VarJ12), null, null, new us3(3, n92Var, ht3VarJ12, str, str2), 3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.iz4
    public void close() throws Exception {
        switch (this.a) {
            case 5:
                EditProfileFragment editProfileFragment = (EditProfileFragment) this.b;
                if (editProfileFragment.t()) {
                    f25 f25Var = editProfileFragment.s;
                    if (!(f25Var == null ? false : f25Var.N()) && !editProfileFragment.Q().isFinishing()) {
                        g25 g25VarM = editProfileFragment.Q().m();
                        g25VarM.w(new d25(g25VarM, null, -1, 0), false);
                        break;
                    }
                }
                break;
            default:
                ContentProviderClient contentProviderClient = (ContentProviderClient) this.b;
                if (contentProviderClient != 0) {
                    if (contentProviderClient instanceof AutoCloseable) {
                        contentProviderClient.close();
                    } else if (!(contentProviderClient instanceof ExecutorService)) {
                        contentProviderClient.release();
                    } else {
                        cm0.g((ExecutorService) contentProviderClient);
                    }
                }
                break;
        }
    }

    @Override // defpackage.y27
    public void e(int i, int i2) {
        ((gy6) this.b).a.b(i, i2);
    }

    @Override // defpackage.ye1
    public void f(String str, String str2) {
        str.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        ((p13) editPostFragment.Z()).c(editPostFragment.S(), str, str2);
    }

    @Override // defpackage.ye1
    public void g(String str, String str2) {
        str.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        int i = EditPostFragment.Q0;
        ht3 ht3VarJ1 = editPostFragment.j1();
        vx0.c0(f76.F(ht3VarJ1), null, null, new us3(2, null, ht3VarJ1, str, str2), 3);
    }

    @Override // defpackage.ye1
    public void j(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        int i = EditPostFragment.Q0;
        ht3 ht3VarJ1 = editPostFragment.j1();
        vx0.c0(f76.F(ht3VarJ1), null, null, new lj1(z, ht3VarJ1, rg1Var, (n92) null, 2), 3);
    }

    @Override // defpackage.qx5
    public void k() {
        ((ImageCarouselActivity) this.b).startPostponedEnterTransition();
    }

    @Override // defpackage.y27
    public void l(int i, int i2) {
        ((gy6) this.b).a.d(i, i2);
    }

    @Override // defpackage.ye1
    public void m(eg1 eg1Var, String str) {
        eg1Var.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        int i = EditPostFragment.Q0;
        ht3 ht3VarJ1 = editPostFragment.j1();
        String str2 = eg1Var.b;
        str2.getClass();
        ht3VarJ1.m.h(str2, ht3VarJ1.b, str, ht3VarJ1.u);
        j7c.a(editPostFragment.S(), eg1Var);
    }

    @Override // defpackage.ye1
    public void n(rg1 rg1Var) {
        rg1Var.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        int i = EditPostFragment.Q0;
        ht3 ht3VarJ1 = editPostFragment.j1();
        vx0.c0(f76.F(ht3VarJ1), null, null, new vs3(ht3VarJ1, rg1Var, null, 1), 3);
    }

    @Override // defpackage.ye1
    public void o(String str, String str2) {
        str.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        int i = EditPostFragment.Q0;
        ht3 ht3VarJ1 = editPostFragment.j1();
        if (ht3VarJ1.s.add(str)) {
            ev6.L(ht3VarJ1.m, str, ht3VarJ1.b, str2, ht3VarJ1.u);
        }
    }

    @Override // defpackage.qx5
    public void onCancel() {
        ImageCarouselActivity imageCarouselActivity = (ImageCarouselActivity) this.b;
        uz5 uz5Var = imageCarouselActivity.q;
        if (uz5Var == null) {
            g76.g0("binding");
            throw null;
        }
        ((ImageView) uz5Var.f).setVisibility(8);
        imageCarouselActivity.startPostponedEnterTransition();
    }

    @Override // defpackage.r55
    public r55 r(ly lyVar) {
        lyVar.getClass();
        return this;
    }

    @Override // defpackage.ye1
    public void s(String str, String str2) {
        str.getClass();
        EditPostFragment editPostFragment = (EditPostFragment) this.b;
        int i = EditPostFragment.Q0;
        ht3 ht3VarJ1 = editPostFragment.j1();
        vx0.c0(f76.F(ht3VarJ1), null, null, new us3(1, null, ht3VarJ1, str, str2), 3);
    }

    @Override // defpackage.r55
    public r55 t(g93 g93Var) {
        g93Var.getClass();
        return this;
    }

    public String toString() {
        switch (this.a) {
            case 1:
                return ((hkc) this.b).toString();
            case 27:
                StringBuilder sb = new StringBuilder();
                js6 js6Var = (js6) this.b;
                sb.append(js6Var);
                sb.append(": ");
                sb.append(((Map) mk7.z(js6Var.j, js6.n[0])).keySet());
                return sb.toString();
            default:
                return super.toString();
        }
    }

    @Override // defpackage.iz4
    public Cursor v(Uri uri, String[] strArr, String[] strArr2) {
        ContentProviderClient contentProviderClient = (ContentProviderClient) this.b;
        if (contentProviderClient == null) {
            return null;
        }
        try {
            return contentProviderClient.query(uri, strArr, "query = ?", strArr2, null, null);
        } catch (RemoteException e) {
            Log.w("FontsProvider", "Unable to query the content provider", e);
            return null;
        }
    }

    @Override // defpackage.y27
    public void w(int i, int i2) {
        ((gy6) this.b).a.e(i, i2);
    }

    @Override // defpackage.r55
    public r55 z(mn6 mn6Var) {
        mn6Var.getClass();
        return this;
    }

    @Override // defpackage.r55
    public r55 B() {
        return this;
    }

    @Override // defpackage.r55
    public r55 G() {
        return this;
    }

    @Override // defpackage.r55
    public r55 i() {
        return this;
    }

    @Override // defpackage.r55
    public r55 p() {
        return this;
    }

    @Override // defpackage.r55
    public r55 q() {
        return this;
    }

    @Override // defpackage.r55
    public r55 u() {
        return this;
    }

    @Override // defpackage.r55
    public r55 y() {
        return this;
    }

    @Override // defpackage.r55
    public r55 C(yv2 yv2Var) {
        return this;
    }

    @Override // defpackage.r55
    public r55 E(n98 n98Var) {
        return this;
    }

    @Override // defpackage.r55
    public r55 d(List list) {
        return this;
    }

    @Override // defpackage.r55
    public r55 h(yq6 yq6Var) {
        return this;
    }

    @Override // defpackage.r55
    public r55 x(c28 c28Var) {
        return this;
    }

    public /* synthetic */ rz2(int i, boolean z) {
        this.a = i;
    }

    public /* synthetic */ rz2(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public rz2(TextView textView) {
        this.a = 7;
        this.b = new ox3(textView);
    }

    public rz2(EditText editText) {
        this.a = 6;
        this.b = new s26(editText, 21);
    }

    public rz2(Uri uri, ClipDescription clipDescription, Uri uri2) {
        this.a = 21;
        if (Build.VERSION.SDK_INT >= 25) {
            this.b = new p26(uri, clipDescription, uri2);
        } else {
            this.b = new ku3(uri, clipDescription, uri2, 9);
        }
    }

    public rz2(Context context, Uri uri) {
        this.a = 15;
        this.b = context.getContentResolver().acquireUnstableContentProviderClient(uri);
    }
}
