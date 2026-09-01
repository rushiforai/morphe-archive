package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Parcel;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.api.Status;
import com.google.android.recaptcha.internal.zzacz;
import com.google.firebase.FirebaseNetworkException;
import com.google.firebase.auth.internal.zzbw;
import j$.util.Objects;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ujf implements s3b, vlf, iof, enf, br8, o92, a7g, dfg, hvg {
    public final /* synthetic */ int a;
    public Object b;

    public ujf(xj4 xj4Var) {
        this.a = 16;
        xj4Var.a();
        Context context = xj4Var.a;
        kvf kvfVar = new kvf();
        kvf.e.F("Initializing TokenRefresher", new Object[0]);
        HandlerThread handlerThread = new HandlerThread("TokenRefresher", 10);
        handlerThread.start();
        tjf tjfVar = new tjf(handlerThread.getLooper());
        Looper.getMainLooper();
        kvfVar.c = tjfVar;
        xj4Var.a();
        kvfVar.d = new p0g(kvfVar, xj4Var.b);
        this.b = kvfVar;
        qm0.b((Application) context.getApplicationContext());
        qm0.e.a(new tif(1, this));
    }

    public static ujf n(int i) {
        return new ujf(28, qvg.a(qig.a(i)));
    }

    public static void q(ujf ujfVar, irf irfVar, zjf zjfVar, iof iofVar) {
        if (!irfVar.a && TextUtils.isEmpty(irfVar.l)) {
            ujfVar.s(new zpf(irfVar.c, irfVar.b, Long.valueOf(irfVar.d)), irfVar.g, irfVar.f, Boolean.valueOf(irfVar.h), irfVar.b(), zjfVar, iofVar);
            return;
        }
        zjfVar.d(new o2b(irfVar.a ? new Status(17012, null, null, null) : hp7.K(irfVar.l), irfVar.b(), irfVar.e, irfVar.n, 18));
    }

    @Override // defpackage.dfg
    public Object Q(String str, String str2, n92 n92Var) {
        Map mapSingletonMap = Collections.singletonMap(str, str2);
        mapSingletonMap.getClass();
        SharedPreferences.Editor editorEdit = ((SharedPreferences) ((hha) this.b).a).edit();
        editorEdit.getClass();
        for (Map.Entry entry : mapSingletonMap.entrySet()) {
            editorEdit.putString((String) entry.getKey(), (String) entry.getValue());
        }
        editorEdit.commit();
        return c1e.a;
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a */
    public void mo105a(String str) {
        ((zjf) this.b).b(hp7.K(str));
    }

    @Override // defpackage.s3b
    public void accept(Object obj, Object obj2) {
        switch (this.a) {
            case 0:
                wfd wfdVar = (wfd) obj2;
                ojf ojfVar = (ojf) ((sif) obj).h();
                rif rifVar = (rif) this.b;
                Parcel parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken(ojfVar.g);
                int i = zif.a;
                parcelObtain.writeInt(1);
                rifVar.writeToParcel(parcelObtain, 0);
                try {
                    ojfVar.f.transact(1, parcelObtain, null, 1);
                    parcelObtain.recycle();
                    wfdVar.b(null);
                    return;
                } catch (Throwable th) {
                    parcelObtain.recycle();
                    throw th;
                }
            case 1:
                ckf ckfVar = (ckf) this.b;
                bkf bkfVar = new bkf((wfd) obj2);
                tkf tkfVar = (tkf) ((dkf) obj).h();
                String str = ckfVar.l;
                Parcel parcelA = tkfVar.a();
                int i2 = hkf.a;
                parcelA.writeStrongBinder(bkfVar);
                parcelA.writeString(str);
                tkfVar.c(2, parcelA);
                return;
            case 2:
                akf akfVar = new akf((wfd) obj2, 1);
                tkf tkfVar2 = (tkf) ((dkf) obj).h();
                ac5 ac5Var = (ac5) this.b;
                Parcel parcelA2 = tkfVar2.a();
                int i3 = hkf.a;
                parcelA2.writeStrongBinder(akfVar);
                hkf.c(parcelA2, ac5Var);
                tkfVar2.c(3, parcelA2);
                return;
            default:
                io1 io1Var = (io1) this.b;
                a66 a66Var = new a66((wfd) obj2, 0);
                eu5 eu5Var = (eu5) ((tv5) obj).h();
                hz hzVarB = wo7.B();
                Parcel parcelObtain2 = Parcel.obtain();
                parcelObtain2.writeInterfaceToken("com.google.android.gms.identitycredentials.internal.IIdentityCredentialService");
                int i4 = qxf.a;
                parcelObtain2.writeStrongBinder(a66Var);
                qxf.b(parcelObtain2, io1Var);
                qxf.b(parcelObtain2, hzVarB);
                ((cu5) eu5Var).a(9, parcelObtain2);
                return;
        }
    }

    @Override // defpackage.enf
    public void b(Status status) {
        bof bofVar = (bof) this.b;
        String str = status.b;
        if (str != null) {
            if (str.contains("MISSING_MFA_PENDING_CREDENTIAL")) {
                status = new Status(17081, null, null, null);
            } else if (str.contains("MISSING_MFA_ENROLLMENT_ID")) {
                status = new Status(17082, null, null, null);
            } else if (str.contains("INVALID_MFA_PENDING_CREDENTIAL")) {
                status = new Status(17083, null, null, null);
            } else if (str.contains("MFA_ENROLLMENT_NOT_FOUND")) {
                status = new Status(17084, null, null, null);
            } else if (str.contains("ADMIN_ONLY_OPERATION")) {
                status = new Status(17085, null, null, null);
            } else if (str.contains("UNVERIFIED_EMAIL")) {
                status = new Status(17086, null, null, null);
            } else if (str.contains("SECOND_FACTOR_EXISTS")) {
                status = new Status(17087, null, null, null);
            } else if (str.contains("SECOND_FACTOR_LIMIT_EXCEEDED")) {
                status = new Status(17088, null, null, null);
            } else if (str.contains("UNSUPPORTED_FIRST_FACTOR")) {
                status = new Status(17089, null, null, null);
            } else if (str.contains("EMAIL_CHANGE_NEEDS_VERIFICATION")) {
                status = new Status(17090, null, null, null);
            }
        }
        if (bofVar.a == 8) {
            bofVar.m = true;
            throw null;
        }
        ovf ovfVar = bofVar.f;
        if (ovfVar != null) {
            ovfVar.b(status);
        }
        bofVar.d(status);
    }

    @Override // defpackage.a7g
    public b8g c(Class cls) {
        for (int i = 0; i < 2; i++) {
            a7g a7gVar = ((a7g[]) this.b)[i];
            if (a7gVar.e(cls)) {
                return a7gVar.c(cls);
            }
        }
        ik4.k("No factory is available for message type: ".concat(cls.getName()));
        return null;
    }

    @Override // defpackage.enf
    public void d(o2b o2bVar) {
        Status status = (Status) o2bVar.b;
        lxf lxfVar = (lxf) o2bVar.c;
        bof bofVar = (bof) this.b;
        ovf ovfVar = bofVar.f;
        if (ovfVar != null) {
            ovfVar.b(status);
        }
        bofVar.j = lxfVar;
        ovf ovfVar2 = bofVar.f;
        if (ovfVar2 != null) {
            ovfVar2.b(status);
        }
        bofVar.d(status);
    }

    @Override // defpackage.a7g
    public boolean e(Class cls) {
        for (int i = 0; i < 2; i++) {
            if (((a7g[]) this.b)[i].e(cls)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.enf
    public void f(bqf bqfVar) {
        bof bofVar = (bof) this.b;
        bofVar.l = bqfVar;
        bofVar.e();
        vp7.r("no success or failure set on method implementation", bofVar.m);
    }

    @Override // defpackage.enf
    public void g(zpf zpfVar) {
        bof bofVar = (bof) this.b;
        int i = bofVar.a;
        vp7.r("Unexpected response type: " + i, i == 1);
        bofVar.h = zpfVar;
        bofVar.e();
        vp7.r("no success or failure set on method implementation", bofVar.m);
    }

    @Override // defpackage.iof
    public /* synthetic */ void h(xnf xnfVar) {
        ((zjf) this.b).f((bqf) xnfVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object i(defpackage.p92 r8) throws com.google.android.recaptcha.internal.zzfx {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.ndg
            if (r0 == 0) goto L14
            r0 = r8
            ndg r0 = (defpackage.ndg) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r6 = r0
            goto L1a
        L14:
            ndg r0 = new ndg
            r0.<init>(r7, r8)
            goto L12
        L1a:
            java.lang.Object r8 = r6.b
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r6.d
            r2 = 1
            if (r1 == 0) goto L30
            if (r1 != r2) goto L29
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            goto L48
        L29:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L30:
            defpackage.br7.v(r8)
            java.lang.Object r7 = r7.b     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            r1 = r7
            tag r1 = (defpackage.tag) r1     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            r6.d = r2     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            fy3 r5 = defpackage.fy3.a     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            java.lang.String r2 = "https://www.gstatic.com/recaptcha/verify_key/orcas/prod/android/verify_key.txt"
            java.lang.String r3 = "GET"
            r4 = 0
            java.lang.Object r8 = r1.m(r2, r3, r4, r5, r6)     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            if (r8 != r0) goto L48
            return r0
        L48:
            aeg r8 = (defpackage.aeg) r8     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            r8.a()     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            java.lang.String r7 = new java.lang.String     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            byte[] r8 = r8.b     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            java.nio.charset.Charset r0 = defpackage.wk1.a     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            r7.<init>(r8, r0)     // Catch: java.lang.Exception -> L57 com.google.android.recaptcha.internal.zzfx -> L5a
            return r7
        L57:
            r0 = move-exception
            r7 = r0
            goto L5d
        L5a:
            r0 = move-exception
            r7 = r0
            goto L6d
        L5d:
            com.google.android.recaptcha.internal.zzfx r8 = new com.google.android.recaptcha.internal.zzfx
            d87 r0 = defpackage.d87.U0
            d87 r1 = defpackage.d87.F0
            java.lang.String r7 = r7.getMessage()
            r2 = 8
            r8.<init>(r0, r1, r7, r2)
            throw r8
        L6d:
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ujf.i(p92):java.lang.Object");
    }

    @Override // defpackage.enf
    public void j(zjf zjfVar) {
        bof bofVar = (bof) this.b;
        bofVar.k = zjfVar;
        bofVar.d(hp7.K("REQUIRES_SECOND_FACTOR_AUTH"));
    }

    @Override // defpackage.enf
    public void k(zpf zpfVar, ppf ppfVar) {
        bof bofVar = (bof) this.b;
        int i = bofVar.a;
        vp7.r("Unexpected response type: " + i, i == 2);
        bofVar.h = zpfVar;
        bofVar.i = ppfVar;
        bofVar.e();
        vp7.r("no success or failure set on method implementation", bofVar.m);
    }

    @Override // defpackage.dfg
    public Object k0(String str, n92 n92Var) {
        return ((SharedPreferences) ((hha) this.b).a).getString(str, null);
    }

    @Override // defpackage.enf
    public void l(Status status, c99 c99Var) {
        bof bofVar = (bof) this.b;
        int i = bofVar.a;
        vp7.r("Unexpected response type " + i, i == 2);
        ovf ovfVar = bofVar.f;
        if (ovfVar != null) {
            ovfVar.b(status);
        }
        bofVar.j = c99Var;
        ovf ovfVar2 = bofVar.f;
        if (ovfVar2 != null) {
            ovfVar2.b(status);
        }
        bofVar.d(status);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object m(defpackage.mqf r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.mcg
            if (r0 == 0) goto L13
            r0 = r8
            mcg r0 = (defpackage.mcg) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            mcg r0 = new mcg
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L58
            goto L4a
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            java.lang.Thread r8 = java.lang.Thread.currentThread()     // Catch: java.lang.Exception -> L58
            long r4 = r8.getId()     // Catch: java.lang.Exception -> L58
            int r8 = (int) r4     // Catch: java.lang.Exception -> L58
            android.net.TrafficStats.setThreadStatsTag(r8)     // Catch: java.lang.Exception -> L58
            java.lang.Object r6 = r6.b     // Catch: java.lang.Exception -> L58
            d2f r6 = (defpackage.d2f) r6     // Catch: java.lang.Exception -> L58
            r0.d = r3     // Catch: java.lang.Exception -> L58
            java.lang.Object r8 = r6.w0(r7, r0)     // Catch: java.lang.Exception -> L58
            if (r8 != r1) goto L4a
            return r1
        L4a:
            java.lang.Boolean r8 = (java.lang.Boolean) r8     // Catch: java.lang.Exception -> L58
            boolean r6 = r8.booleanValue()     // Catch: java.lang.Exception -> L58
            if (r6 == 0) goto L55
            java.lang.Boolean r6 = java.lang.Boolean.TRUE     // Catch: java.lang.Exception -> L58
            return r6
        L55:
            java.lang.Boolean r6 = java.lang.Boolean.FALSE     // Catch: java.lang.Exception -> L58
            return r6
        L58:
            r6 = move-exception
            r6.getMessage()
            java.lang.Boolean r6 = java.lang.Boolean.FALSE
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ujf.m(mqf, p92):java.lang.Object");
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        switch (this.a) {
            case 14:
                br7 br7Var = (br7) this.b;
                if (jrgVar.k()) {
                    return br7Var.E((String) jrgVar.i());
                }
                Exception excH = jrgVar.h();
                vp7.p(excH);
                Log.e("RecaptchaCallWrapper", "Failed to get Recaptcha token, error - " + excH.getMessage() + "\n\n Failing open with a fake token.");
                return br7Var.E("NO_RECAPTCHA");
            default:
                if (jrgVar.k()) {
                    x7g x7gVar = (x7g) jrgVar.i();
                    o33 o33VarG = vx0.G((k92) x7gVar.e.a, null, new kaf(x7gVar, (awa) this.b, null, 7), 3);
                    wfd wfdVar = new wfd(new ujf(12));
                    o33VarG.R(new j8e(wfdVar, 13, o33VarG));
                    return wfdVar.a;
                }
                Exception excH2 = jrgVar.h();
                vp7.p(excH2);
                if (!(excH2 instanceof zzbw)) {
                    return vp7.w(excH2);
                }
                if (Log.isLoggable("RecaptchaHandler", 4)) {
                    Log.i("RecaptchaHandler", "Ignoring error related to fetching recaptcha config - " + excH2.getMessage());
                }
                return vp7.x("");
        }
    }

    @Override // defpackage.hvg
    public Iterator o(wjc wjcVar, CharSequence charSequence) {
        return new btg(wjcVar, charSequence, (j6g) this.b, 1);
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        if (exc instanceof FirebaseNetworkException) {
            xp xpVar = kvf.e;
            xpVar.F("Failure to refresh token; scheduling refresh after failure", new Object[0]);
            kvf kvfVar = (kvf) ((p0g) this.b).c;
            int i = (int) kvfVar.b;
            kvfVar.b = (i == 30 || i == 60 || i == 120 || i == 240 || i == 480) ? 2 * kvfVar.b : i != 960 ? 30L : 960L;
            kvfVar.a = (kvfVar.b * 1000) + System.currentTimeMillis();
            xpVar.F(ho2.D(kvfVar.a, "Scheduling refresh for "), new Object[0]);
            kvfVar.c.postDelayed(kvfVar.d, kvfVar.b * 1000);
        }
    }

    public void p(String str, iof iofVar) {
        vp7.n(str);
        zpf zpfVarD = zpf.d(str);
        if (zpfVarD.g()) {
            iofVar.h(zpfVarD);
            return;
        }
        d2f d2fVar = new d2f(zpfVarD.a);
        bh4 bh4Var = (bh4) this.b;
        eoc eocVar = new eoc(this, iofVar);
        unf unfVar = (unf) bh4Var.d;
        qk7.D(unfVar.t("/token", (String) bh4Var.a), d2fVar, eocVar, new zpf(), (o2b) unfVar.b);
    }

    public void r(fpf fpfVar, zjf zjfVar) {
        bh4 bh4Var = (bh4) this.b;
        hlf hlfVar = new hlf(this, zjfVar, 0);
        unf unfVar = (unf) bh4Var.b;
        qk7.D(unfVar.t("/emailLinkSignin", (String) bh4Var.a), fpfVar, hlfVar, new hpf(), (o2b) unfVar.b);
    }

    public void s(zpf zpfVar, String str, String str2, Boolean bool, lxf lxfVar, zjf zjfVar, iof iofVar) {
        String str3 = zpfVar.b;
        zwf zwfVar = new zwf();
        vp7.n(str3);
        zwfVar.b = str3;
        bh4 bh4Var = (bh4) this.b;
        jz1 jz1Var = new jz1(this, iofVar, str2, str, bool, lxfVar, zjfVar, zpfVar);
        unf unfVar = (unf) bh4Var.b;
        qk7.D(unfVar.t("/getAccountInfo", (String) bh4Var.a), zwfVar, jz1Var, new mpf(), (o2b) unfVar.b);
    }

    public void t(int i, Object obj, suf sufVar) {
        xrf xrfVar = (xrf) obj;
        htf htfVar = (htf) this.b;
        htfVar.r(i, 2);
        htfVar.q(xrfVar.a(sufVar));
        sufVar.f(xrfVar, this);
    }

    public void u(Object obj, Object... objArr) {
        List listAsList = Arrays.asList(objArr);
        if (obj == null) {
            Iterator it2 = listAsList.iterator();
            StringBuilder sb = new StringBuilder("[");
            boolean z = true;
            while (it2.hasNext()) {
                if (!z) {
                    sb.append(", ");
                }
                sb.append(it2.next());
                z = false;
            }
            sb.append(']');
            throw new NullPointerException("null key in entry: null=".concat(sb.toString()));
        }
        Iterator it3 = listAsList.iterator();
        if (it3.hasNext()) {
            tfg tfgVar = (tfg) this.b;
            if (tfgVar == null) {
                tfgVar = new tfg();
                this.b = tfgVar;
            }
            ugg uggVar = (ugg) tfgVar.get(obj);
            if (uggVar == null) {
                int iMax = listAsList instanceof Set ? Math.max(4, ((Set) listAsList).size()) : 4;
                br7.G(iMax, "expectedSize");
                uggVar = new ugg();
                br7.G(iMax, "initialCapacity");
                uggVar.a = new Object[iMax];
                uggVar.b = 0;
                uggVar.d = new Object[vgg.r(iMax)];
                tfg tfgVar2 = (tfg) this.b;
                if (tfgVar2 == null) {
                    tfgVar2 = new tfg();
                    this.b = tfgVar2;
                }
                tfgVar2.put(obj, uggVar);
            }
            while (it3.hasNext()) {
                Object next = it3.next();
                br7.F(obj, next);
                if (uggVar.d != null) {
                    int iR = vgg.r(uggVar.b);
                    Object[] objArr2 = uggVar.d;
                    if (iR <= objArr2.length) {
                        int length = objArr2.length - 1;
                        int iHashCode = next.hashCode();
                        int iG = gr7.G(iHashCode);
                        while (true) {
                            int i = iG & length;
                            Object[] objArr3 = uggVar.d;
                            Object obj2 = objArr3[i];
                            if (obj2 == null) {
                                objArr3[i] = next;
                                uggVar.e += iHashCode;
                                uggVar.a(next);
                                break;
                            } else if (!obj2.equals(next)) {
                                iG = i + 1;
                            }
                        }
                    }
                }
                uggVar.d = null;
                uggVar.a(next);
            }
        }
    }

    public void v(int i, Object obj, vof vofVar) throws zzacz {
        h30 h30Var = (h30) this.b;
        emf emfVar = (emf) obj;
        h30Var.O(i, 2);
        h30Var.X(emfVar.e(vofVar));
        vofVar.h(emfVar, this);
    }

    public void w(int i, Object obj, d8g d8gVar) {
        c4g c4gVar = (c4g) this.b;
        d3g d3gVar = (d3g) obj;
        c4gVar.k(i, 2);
        c4gVar.m(d3gVar.c(d8gVar));
        d8gVar.f(d3gVar, this);
    }

    @Override // defpackage.vlf
    public Object a(String str) {
        return ((xlf) this.b).d(str, null);
    }

    public /* synthetic */ ujf(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public /* synthetic */ ujf(int i, boolean z) {
        this.a = i;
    }

    public /* synthetic */ ujf(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj2;
    }

    public ujf(h30 h30Var) {
        this.a = 8;
        this.b = h30Var;
        h30Var.d = this;
    }

    public ujf(c4g c4gVar) {
        this.a = 17;
        this.b = c4gVar;
        c4gVar.a = this;
    }

    public ujf(htf htfVar) {
        this.a = 10;
        byte[] bArr = ztf.a;
        this.b = htfVar;
        htfVar.a = this;
    }

    public ujf(uz5 uz5Var, awa awaVar) {
        this.a = 15;
        this.b = awaVar;
        Objects.requireNonNull(uz5Var);
    }

    public ujf(int i) {
        this.a = i;
        switch (i) {
            case 18:
                System.currentTimeMillis();
                jfg jfgVar = new jfg();
                jq7.y("This stopwatch is already running.", !jfgVar.a);
                jfgVar.a = true;
                jfgVar.c = System.nanoTime();
                this.b = jfgVar;
                break;
            default:
                this.b = new jrg();
                break;
        }
    }
}
