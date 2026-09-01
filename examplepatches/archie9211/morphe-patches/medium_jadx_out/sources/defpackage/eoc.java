package defpackage;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eoc implements kr8, iof, vyf, fvg {
    public Object a;

    public eoc(int i) {
        switch (i) {
            case 12:
                this.a = new AtomicBoolean(false);
                break;
            default:
                this.a = new ArrayDeque(16);
                break;
        }
    }

    @Override // defpackage.fvg
    public Object a(String str) throws GeneralSecurityException {
        String[] strArr = {"GmsCore_OpenSSL", "AndroidOpenSSL", "Conscrypt"};
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 3; i++) {
            Provider provider = Security.getProvider(strArr[i]);
            if (provider != null) {
                arrayList.add(provider);
            }
        }
        Iterator it2 = arrayList.iterator();
        Exception exc = null;
        while (it2.hasNext()) {
            try {
                return ((jvg) this.a).d(str, (Provider) it2.next());
            } catch (Exception e) {
                if (exc == null) {
                    exc = e;
                }
            }
        }
        throw new GeneralSecurityException("No good Provider found.", exc);
    }

    @Override // defpackage.vyf
    public wcg b(long j, jrf jrfVar) {
        return new wcg(30, new m0(this, j, jrfVar, (n92) null, 7), null);
    }

    @Override // defpackage.vyf
    public ycg c(String str, String str2) {
        return new ycg(new at(2, 6, null));
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object d(defpackage.p92 r10, com.medium.android.core.models.EntityType r11, java.lang.String r12, java.lang.String r13, boolean r14) {
        /*
            r9 = this;
            boolean r0 = r10 instanceof defpackage.l3e
            if (r0 == 0) goto L14
            r0 = r10
            l3e r0 = (defpackage.l3e) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.g = r1
        L12:
            r10 = r0
            goto L1a
        L14:
            l3e r0 = new l3e
            r0.<init>(r9, r10)
            goto L12
        L1a:
            java.lang.Object r0 = r10.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r10.g
            r3 = 0
            r4 = 1
            r5 = 0
            java.lang.String r6 = ", entityId: "
            java.lang.String r7 = ", entityType: "
            if (r2 == 0) goto L3f
            if (r2 != r4) goto L39
            com.medium.android.core.models.EntityType r11 = r10.d
            java.lang.String r13 = r10.c
            java.lang.String r12 = r10.b
            defpackage.br7.v(r0)
            bjb r0 = (defpackage.bjb) r0
            java.lang.Object r9 = r0.a
            goto L70
        L39:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            return r3
        L3f:
            defpackage.br7.v(r0)
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            java.lang.String r2 = "Unsubscribe from newsletter. Newsletter id: "
            r0.<init>(r2)
            r0.append(r12)
            r0.append(r7)
            r0.append(r11)
            java.lang.String r0 = defpackage.ka1.v(r0, r6, r13)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r8 = new java.lang.Object[r5]
            defpackage.km4.I(r2, r3, r0, r8, r0)
            java.lang.Object r9 = r9.a
            pf8 r9 = (defpackage.pf8) r9
            r10.b = r12
            r10.c = r13
            r10.d = r11
            r10.g = r4
            java.lang.Object r9 = r9.c(r10, r11, r12, r13, r14)
            if (r9 != r1) goto L70
            return r1
        L70:
            boolean r10 = r9 instanceof defpackage.ajb
            if (r10 != 0) goto L8b
            r10 = r9
            c1e r10 = (defpackage.c1e) r10
            java.lang.String r10 = "Unsubscribe from newsletter success. Newsletter id: "
            java.lang.StringBuilder r10 = defpackage.km4.D(r10, r11, r12, r7, r6)
            r10.append(r13)
            java.lang.String r10 = r10.toString()
            uld r14 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r5]
            defpackage.km4.I(r14, r3, r10, r0, r10)
        L8b:
            java.lang.Throwable r10 = defpackage.bjb.b(r9)
            if (r10 == 0) goto La5
            java.lang.String r14 = "Unsubscribe from newsletter failure. Newsletter id: "
            java.lang.StringBuilder r11 = defpackage.km4.D(r14, r11, r12, r7, r6)
            r11.append(r13)
            java.lang.String r11 = r11.toString()
            uld r12 = defpackage.wld.a
            java.lang.Object[] r13 = new java.lang.Object[r5]
            r12.e(r10, r11, r13)
        La5:
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eoc.d(p92, com.medium.android.core.models.EntityType, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    @Override // defpackage.vyf
    public wcg e(String str, String str2, arf arfVar, long j) {
        return new wcg(31, new j82(this, str, arfVar, j, (n92) null, 4), null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object f(defpackage.prf r5, defpackage.jsf r6, defpackage.p92 r7) throws com.google.android.recaptcha.internal.zzfx {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.rdg
            if (r0 == 0) goto L13
            r0 = r7
            rdg r0 = (defpackage.rdg) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            rdg r0 = new rdg
            r0.<init>(r4, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r7)     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            goto L44
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r7)
            java.lang.Object r4 = r4.a     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            tag r4 = (defpackage.tag) r4     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            java.lang.String r5 = r5.c     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            byte[] r6 = r6.d()     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            r0.d = r3     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            java.lang.Object r7 = r4.a(r5, r6, r0)     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            if (r7 != r1) goto L44
            return r1
        L44:
            aeg r7 = (defpackage.aeg) r7     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            ksf r4 = defpackage.ksf.z()     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            emf r4 = r7.b(r4)     // Catch: java.lang.Exception -> L4f com.google.android.recaptcha.internal.zzfx -> L51
            return r4
        L4f:
            r4 = move-exception
            goto L53
        L51:
            r4 = move-exception
            goto L63
        L53:
            com.google.android.recaptcha.internal.zzfx r5 = new com.google.android.recaptcha.internal.zzfx
            d87 r6 = defpackage.d87.U0
            d87 r7 = defpackage.d87.o
            java.lang.String r4 = r4.getMessage()
            r0 = 8
            r5.<init>(r6, r7, r4, r0)
            throw r5
        L63:
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eoc.f(prf, jsf, p92):java.lang.Object");
    }

    public void g() {
        ArrayDeque arrayDeque = (ArrayDeque) this.a;
        if (arrayDeque.isEmpty()) {
            return;
        }
        throw new IOException("data item not completed, stackSize: " + arrayDeque.size() + " scope: " + k());
    }

    @Override // defpackage.iof
    public /* synthetic */ void h(xnf xnfVar) {
        ((iof) this.a).h((zpf) xnfVar);
    }

    @Override // defpackage.kr8
    public void i(Object obj) {
        ((wfd) ((ujf) this.a).b).a.p();
    }

    public void j(long j) throws IOException {
        long jK = k();
        if (jK != j) {
            if (jK != -1) {
                if (jK != -2) {
                    return;
                } else {
                    jK = -2;
                }
            }
            StringBuilder sbD = b09.D("expected non-string scope or scope ", " but found ", j);
            sbD.append(jK);
            throw new IOException(sbD.toString());
        }
    }

    public long k() {
        ArrayDeque arrayDeque = (ArrayDeque) this.a;
        if (arrayDeque.isEmpty()) {
            return 0L;
        }
        return ((Long) arrayDeque.peek()).longValue();
    }

    public /* synthetic */ eoc(Object obj, Object obj2) {
        this.a = obj2;
    }

    public /* synthetic */ eoc(Object obj) {
        this.a = obj;
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a, reason: collision with other method in class */
    public void mo105a(String str) {
        ((iof) this.a).mo105a(str);
    }
}
