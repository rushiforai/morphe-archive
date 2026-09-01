package defpackage;

import android.app.Application;
import android.os.Parcel;
import android.util.Base64OutputStream;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.material.behavior.SwipeDismissBehavior;
import com.google.gson.JsonIOException;
import com.medium.android.graphql.type.UserDismissableFlags;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hha implements en6, gte, kr8, l5, k9f, ex, khf, s3b, vlf, eof, xq8, hvg {
    public Object a;

    public hha(Application application, int i) {
        switch (i) {
            case 22:
                this.a = application.getSharedPreferences("_GRECAPTCHA", 0);
                break;
            default:
                obg obgVar = null;
                try {
                    obg obgVar2 = obg.c;
                    obgVar2 = obgVar2 == null ? new obg(application, obg.b, null, obg.a) : obgVar2;
                    obg.c = obgVar2;
                    obgVar = obgVar2;
                } catch (Exception unused) {
                }
                this.a = obgVar;
                break;
        }
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        vx1 vx1Var = (vx1) this.a;
        Exception excH = jrgVar.h();
        if (excH != null) {
            vx1Var.i0(excH);
        } else if (jrgVar.d) {
            vx1Var.m(null);
        } else {
            vx1Var.V(jrgVar.i());
        }
    }

    @Override // defpackage.vlf
    public Object a(String str) {
        xlf xlfVar = (xlf) this.a;
        String[] strArr = {"GmsCore_OpenSSL", "AndroidOpenSSL"};
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 2; i++) {
            Provider provider = Security.getProvider(strArr[i]);
            if (provider != null) {
                arrayList.add(provider);
            }
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            try {
                return xlfVar.d(str, (Provider) it2.next());
            } catch (Exception unused) {
            }
        }
        return xlfVar.d(str, null);
    }

    @Override // defpackage.s3b
    public void accept(Object obj, Object obj2) {
        wfd wfdVar = (wfd) obj2;
        qjf qjfVar = (qjf) ((wjf) obj).h();
        egd egdVar = (egd) this.a;
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(qjfVar.g);
        int i = zif.a;
        if (egdVar == null) {
            parcelObtain.writeInt(0);
        } else {
            parcelObtain.writeInt(1);
            egdVar.writeToParcel(parcelObtain, 0);
        }
        try {
            qjfVar.f.transact(1, parcelObtain, null, 1);
            parcelObtain.recycle();
            wfdVar.b(null);
        } catch (Throwable th) {
            parcelObtain.recycle();
            throw th;
        }
    }

    @Override // defpackage.eof
    public boolean c(Class cls) {
        for (int i = 0; i < 2; i++) {
            if (((eof[]) this.a)[i].c(cls)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.l5
    public boolean d(View view) {
        SwipeDismissBehavior swipeDismissBehavior = (SwipeDismissBehavior) this.a;
        if (!swipeDismissBehavior.v(view)) {
            return false;
        }
        boolean z = view.getLayoutDirection() == 1;
        int i = swipeDismissBehavior.e;
        int width = (!(i == 0 && z) && (i != 1 || z)) ? view.getWidth() : -view.getWidth();
        WeakHashMap weakHashMap = ute.a;
        view.offsetLeftAndRight(width);
        view.setAlpha(0.0f);
        md5 md5Var = swipeDismissBehavior.b;
        if (md5Var != null) {
            md5Var.t(view);
        }
        return true;
    }

    @Override // defpackage.eof
    public rof e(Class cls) {
        for (int i = 0; i < 2; i++) {
            eof eofVar = ((eof[]) this.a)[i];
            if (eofVar.c(cls)) {
                return eofVar.e(cls);
            }
        }
        ik4.k("No factory is available for message type: ".concat(cls.getName()));
        return null;
    }

    @Override // defpackage.gte
    public int f(View view) {
        return (view.getLeft() - ((txa) view.getLayoutParams()).b.left) - ((ViewGroup.MarginLayoutParams) ((txa) view.getLayoutParams())).leftMargin;
    }

    @Override // defpackage.ex
    public hn4 get(int i) {
        return (hn4) this.a;
    }

    @Override // defpackage.gte
    public int h() {
        return ((sxa) this.a).E();
    }

    @Override // defpackage.kr8
    public /* synthetic */ void i(Object obj) {
        ((fw8) this.a).invoke(obj);
    }

    public bo4 k(UserDismissableFlags userDismissableFlags) {
        userDismissableFlags.getClass();
        return m40.J(new pja(((oo1) this.a).a(), userDismissableFlags, 11));
    }

    @Override // defpackage.k9f
    public sr0 l(String str, xm0 xm0Var, EnumMap enumMap) {
        if (xm0Var == xm0.UPC_A) {
            return ((wn3) this.a).l("0".concat(String.valueOf(str)), xm0.EAN_13, enumMap);
        }
        ay0.e("Can only encode UPC-A, but got ".concat(String.valueOf(xm0Var)));
        return null;
    }

    @Override // defpackage.en6
    public fn6 m(n98 n98Var) {
        if ("b".equals(n98Var.b())) {
            return new dta(this, 2);
        }
        return null;
    }

    @Override // defpackage.hvg
    public Iterator o(wjc wjcVar, CharSequence charSequence) {
        return new btg(wjcVar, charSequence, new nec(((fgg) this.a).d.matcher(charSequence)), 0);
    }

    @Override // defpackage.en6
    public en6 p(mn1 mn1Var, n98 n98Var) {
        return null;
    }

    @Override // defpackage.gte
    public int q() {
        sxa sxaVar = (sxa) this.a;
        return sxaVar.n - sxaVar.F();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object r(java.lang.String r6, boolean r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.xmd
            if (r0 == 0) goto L13
            r0 = r8
            xmd r0 = (defpackage.xmd) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            xmd r0 = new xmd
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L30
            boolean r7 = r0.c
            java.lang.String r6 = r0.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r5 = r8.a
            goto L4a
        L30:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L36:
            defpackage.br7.v(r8)
            java.lang.Object r5 = r5.a
            nfb r5 = (defpackage.nfb) r5
            r0.b = r6
            r0.c = r7
            r0.f = r4
            java.lang.Object r5 = r5.i(r6, r7, r0)
            if (r5 != r1) goto L4a
            return r1
        L4a:
            boolean r8 = r5 instanceof defpackage.ajb
            r0 = 0
            java.lang.String r1 = ", isHidden: "
            if (r8 != 0) goto L6f
            r8 = r5
            c1e r8 = (defpackage.c1e) r8
            java.lang.StringBuilder r8 = new java.lang.StringBuilder
            java.lang.String r2 = "Toggle hide post responses success. Post id: "
            r8.<init>(r2)
            r8.append(r6)
            r8.append(r1)
            r8.append(r7)
            java.lang.String r8 = r8.toString()
            uld r2 = defpackage.wld.a
            java.lang.Object[] r4 = new java.lang.Object[r0]
            defpackage.km4.I(r2, r3, r8, r4, r8)
        L6f:
            java.lang.Throwable r8 = defpackage.bjb.b(r5)
            if (r8 == 0) goto L90
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            java.lang.String r3 = "Toggle hide post responses failure. Post id: "
            r2.<init>(r3)
            r2.append(r6)
            r2.append(r1)
            r2.append(r7)
            java.lang.String r6 = r2.toString()
            uld r7 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r7.e(r8, r6, r0)
        L90:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hha.r(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object s(java.lang.String r9, defpackage.p92 r10) {
        /*
            r8 = this;
            boolean r0 = r10 instanceof defpackage.c5b
            if (r0 == 0) goto L13
            r0 = r10
            c5b r0 = (defpackage.c5b) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            c5b r0 = new c5b
            r0.<init>(r8, r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            java.lang.String r5 = "Report catalog "
            r6 = 0
            if (r2 == 0) goto L37
            if (r2 != r3) goto L31
            java.lang.String r9 = r0.b
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r8 = r10.a
            goto L51
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r6
        L37:
            java.lang.String r10 = defpackage.wgd.u(r10, r5, r9)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r4]
            defpackage.km4.I(r2, r6, r10, r7, r10)
            java.lang.Object r8 = r8.a
            qi1 r8 = (defpackage.qi1) r8
            r0.b = r9
            r0.e = r3
            java.lang.Object r8 = r8.t(r9, r0)
            if (r8 != r1) goto L51
            return r1
        L51:
            boolean r10 = r8 instanceof defpackage.ajb
            if (r10 != 0) goto L65
            r10 = r8
            c1e r10 = (defpackage.c1e) r10
            java.lang.String r10 = " successful"
            java.lang.String r10 = defpackage.ev6.x(r5, r9, r10)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r4]
            defpackage.km4.I(r0, r6, r10, r1, r10)
        L65:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 == 0) goto L78
            java.lang.String r0 = " failed"
            java.lang.String r9 = defpackage.ev6.x(r5, r9, r0)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r4]
            r0.e(r10, r9, r1)
        L78:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hha.s(java.lang.String, p92):java.lang.Object");
    }

    public void t(OutputStream outputStream, Object obj) throws IOException {
        Base64OutputStream base64OutputStream = new Base64OutputStream(outputStream, 0);
        fh5 fh5Var = (fh5) this.a;
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(base64OutputStream, fh5.b);
        try {
            ch5 ch5Var = fh5Var.a;
            if (obj != null) {
                try {
                    ch5Var.j(obj, obj.getClass(), ch5Var.g(outputStreamWriter));
                } catch (IOException e) {
                    throw new JsonIOException(e);
                }
            } else {
                try {
                    ch5Var.i(ch5Var.g(outputStreamWriter));
                } catch (IOException e2) {
                    throw new JsonIOException(e2);
                }
            }
            outputStreamWriter.close();
        } finally {
        }
    }

    public synchronized bxf u() {
        return bxf.e((ssg) ((rsg) this.a).b());
    }

    @Override // defpackage.gte
    public View v(int i) {
        return ((sxa) this.a).u(i);
    }

    @Override // defpackage.gte
    public int w(View view) {
        return view.getRight() + ((txa) view.getLayoutParams()).b.right + ((ViewGroup.MarginLayoutParams) ((txa) view.getLayoutParams())).rightMargin;
    }

    public void x(List list) {
        synchronized (obg.class) {
            try {
                obg obgVar = (obg) this.a;
                if (obgVar != null) {
                    Iterator it2 = list.iterator();
                    while (it2.hasNext()) {
                        obgVar.f((tbg) it2.next());
                    }
                    int iM = obgVar.m() - 500;
                    if (iM > 0) {
                        obgVar.B(bu1.g1(obgVar.p(), iM));
                    }
                }
            } catch (Exception unused) {
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.khf
    public Object y() {
        return this.a;
    }

    public void z(List list) {
        synchronized (obg.class) {
            try {
                obg obgVar = (obg) this.a;
                if (obgVar != null) {
                    obgVar.B(list);
                }
            } catch (Exception unused) {
            }
        }
    }

    @Override // defpackage.en6
    public void b() {
    }

    public /* synthetic */ hha(Object obj) {
        this.a = obj;
    }

    public hha(qi1 qi1Var) {
        qi1Var.getClass();
        this.a = qi1Var;
    }

    @Override // defpackage.en6
    public void g(n98 n98Var, Object obj) {
    }

    @Override // defpackage.en6
    public void j(n98 n98Var, rn1 rn1Var) {
    }

    public hha(nfb nfbVar) {
        nfbVar.getClass();
        this.a = nfbVar;
    }

    @Override // defpackage.en6
    public void n(n98 n98Var, mn1 mn1Var, n98 n98Var2) {
    }
}
