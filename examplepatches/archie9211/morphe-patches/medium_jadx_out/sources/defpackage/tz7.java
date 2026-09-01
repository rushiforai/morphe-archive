package defpackage;

import android.net.Uri;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.concurrent.Executor;
import javax.net.ssl.SSLSocket;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tz7 implements dz1, hb2, mqe, ux0, ndf, sy3, t33, vg0, r44, x77, jkc, dp1, ukg, vfg {
    public static final tz7 b;
    public static boolean c;
    public static final /* synthetic */ tz7 d;
    public static final no f;
    public static final tz7 h;
    public static final tz7 i;
    public static final /* synthetic */ tz7 j;
    public static final tz7 k;
    public static final tz7 l;
    public static final tz7 o;
    public static final /* synthetic */ tz7 p;
    public final /* synthetic */ int a;
    public static final l00 e = new l00();
    public static final no g = new no(2);
    public static final ywb m = new ywb(6);
    public static final ywb n = new ywb(7);

    static {
        boolean z = false;
        b = new tz7(0, z);
        int i2 = 1;
        d = new tz7(i2, z);
        f = new no(i2);
        h = new tz7(3, z);
        i = new tz7(4, z);
        j = new tz7(5, z);
        k = new tz7(6, z);
        l = new tz7(7, z);
        o = new tz7(9, z);
        p = new tz7(26, z);
    }

    public tz7(int i2) {
        this.a = i2;
        switch (i2) {
            case 21:
                new d80(0);
                new HashMap();
                break;
            default:
                i03 i03Var = i03.a;
                break;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:194:0x048e, code lost:
    
        r0 = r1.size();
        defpackage.ygf.d((java.lang.String.valueOf(r5).length() + 34) + java.lang.String.valueOf(r0).length(), "Invalid index ", r5, " for keyset of size ", r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:195:0x04ac, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void l(defpackage.trf r26, java.lang.String r27) throws java.security.GeneralSecurityException, com.google.android.recaptcha.internal.zzfx {
        /*
            Method dump skipped, instruction units count: 1296
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tz7.l(trf, java.lang.String):void");
    }

    @Override // defpackage.mqe
    public Object L0(id6 id6Var, float f2) {
        return wd6.b(id6Var, f2);
    }

    @Override // defpackage.sy3
    public void M0(vy3 vy3Var) {
        int i2;
        String str = vy3Var.a;
        int i3 = vy3Var.d;
        int length = str.length();
        if (i3 < length) {
            char cCharAt = str.charAt(i3);
            i2 = 0;
            while (wgf.C(cCharAt) && i3 < length) {
                i2++;
                i3++;
                if (i3 < length) {
                    cCharAt = str.charAt(i3);
                }
            }
        } else {
            i2 = 0;
        }
        if (i2 >= 2) {
            char cCharAt2 = str.charAt(vy3Var.d);
            char cCharAt3 = str.charAt(vy3Var.d + 1);
            if (wgf.C(cCharAt2) && wgf.C(cCharAt3)) {
                vy3Var.d((char) ((cCharAt3 - '0') + ((cCharAt2 - '0') * 10) + NikonType2MakernoteDirectory.TAG_ADAPTER));
                vy3Var.d += 2;
                return;
            } else {
                throw new IllegalArgumentException("not digits: " + cCharAt2 + cCharAt3);
            }
        }
        char cA = vy3Var.a();
        int iF = wgf.F(str, vy3Var.d, 0);
        if (iF == 0) {
            if (!wgf.D(cA)) {
                vy3Var.d((char) (cA + 1));
                vy3Var.d++;
                return;
            } else {
                vy3Var.d((char) 235);
                vy3Var.d((char) (cA - 127));
                vy3Var.d++;
                return;
            }
        }
        if (iF == 1) {
            vy3Var.d((char) 230);
            vy3Var.e = 1;
            return;
        }
        if (iF == 2) {
            vy3Var.d((char) 239);
            vy3Var.e = 2;
            return;
        }
        if (iF == 3) {
            vy3Var.d((char) 238);
            vy3Var.e = 3;
        } else if (iF == 4) {
            vy3Var.d((char) 240);
            vy3Var.e = 4;
        } else if (iF != 5) {
            ygf.f("Illegal mode: ".concat(String.valueOf(iF)));
        } else {
            vy3Var.d((char) 231);
            vy3Var.e = 5;
        }
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.AesGcmKey")) {
            ay0.e("Wrong type URL in call to AesGcmProtoSerialization.parseKey");
            return null;
        }
        try {
            ang angVarU = ang.u((hsf) nigVar.c, ptf.a);
            if (angVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            o2b o2bVarB = g2g.b();
            o2bVarB.W(angVarU.x().e());
            o2bVarB.R();
            o2bVarB.Y();
            o2bVarB.e = f6g.a((ntg) nigVar.e);
            g2g g2gVarP = o2bVarB.P();
            vwa vwaVar = new vwa(27, false);
            vwaVar.c = null;
            vwaVar.d = null;
            vwaVar.b = g2gVarP;
            vwaVar.c = new ujf(28, qvg.a(angVarU.x().x()));
            vwaVar.d = (Integer) nigVar.f;
            return vwaVar.I();
        } catch (zzale unused) {
            ygf.l("Parsing AesGcmKey failed");
            return null;
        }
    }

    @Override // defpackage.t33
    public boolean a(SSLSocket sSLSocket) {
        return tuc.N(sSLSocket.getClass().getName(), "com.google.android.gms.org.conscrypt.", false);
    }

    @Override // defpackage.vg0
    public void b(z25 z25Var) {
        z25Var.getClass();
        z25Var.D("UPDATE WorkSpec SET `last_enqueue_time` = -1 WHERE `last_enqueue_time` = 0");
    }

    @Override // defpackage.t33
    public yjc c(SSLSocket sSLSocket) {
        Class<?> cls = sSLSocket.getClass();
        Class<?> superclass = cls;
        while (!superclass.getSimpleName().equals("OpenSSLSocketImpl")) {
            superclass = superclass.getSuperclass();
            if (superclass == null) {
                rd6.u("No OpenSSLSocketImpl superclass of socket of type ", cls);
                return null;
            }
        }
        return new js(superclass);
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) {
        tug tugVar = (tug) ur7Var;
        return ing.k("type.googleapis.com/google.crypto.tink.RsaSsaPssPublicKey", ilf.c(tugVar).c(), d1g.y, ilf.a(tugVar.i.c), tugVar.l);
    }

    @Override // defpackage.dp1
    public long e() {
        return System.currentTimeMillis();
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        Object objO = iq1Var.o(new rqa(om0.class, Executor.class));
        objO.getClass();
        return bgf.y((Executor) objO);
    }

    @Override // defpackage.ux0
    public long g(int i2, ym0 ym0Var) {
        String str = ((qjd) ym0Var.e).a.a.b;
        return lk7.q(mo7.L(str, i2), mo7.K(str, i2));
    }

    public Uri h(String str, boolean z) {
        str.getClass();
        i03 i03Var = i03.a;
        if (!z) {
            Uri uriBuild = Uri.parse(i03.b).buildUpon().appendEncodedPath("@".concat(str)).build();
            uriBuild.getClass();
            return uriBuild;
        }
        Uri uri = Uri.parse("https://" + str + ".medium.com");
        uri.getClass();
        return uri;
    }

    @Override // defpackage.x77
    public void i(int i2, String str, Throwable th, LinkedHashMap linkedHashMap, HashSet hashSet) {
        str.getClass();
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0088, code lost:
    
        if (r7 == r9) goto L37;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r7v20 */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r8v0, types: [hk4] */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v19 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v20 */
    /* JADX WARN: Type inference failed for: r8v21 */
    /* JADX WARN: Type inference failed for: r8v22 */
    /* JADX WARN: Type inference failed for: r8v23 */
    /* JADX WARN: Type inference failed for: r8v24 */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v6, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r8v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object j(defpackage.hk4 r8, defpackage.p92 r9) {
        /*
            r7 = this;
            boolean r0 = r9 instanceof defpackage.r36
            if (r0 == 0) goto L13
            r0 = r9
            r36 r0 = (defpackage.r36) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            r36 r0 = new r36
            r0.<init>(r7, r9)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r9 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.e
            java.lang.String r2 = "FirebaseSessions"
            r3 = 2
            r4 = 1
            java.lang.String r5 = ""
            if (r1 == 0) goto L46
            if (r1 == r4) goto L3c
            if (r1 != r3) goto L35
            java.lang.Object r8 = r0.b
            java.lang.String r8 = (java.lang.String) r8
            defpackage.br7.v(r7)     // Catch: java.lang.Exception -> L32
            goto L8b
        L32:
            r7 = move-exception
            goto L92
        L35:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L3c:
            java.lang.Object r8 = r0.b
            hk4 r8 = (defpackage.hk4) r8
            defpackage.br7.v(r7)     // Catch: java.lang.Exception -> L44
            goto L61
        L44:
            r7 = move-exception
            goto L70
        L46:
            defpackage.br7.v(r7)
            r7 = r8
            gk4 r7 = (defpackage.gk4) r7     // Catch: java.lang.Exception -> L44
            jrg r8 = r7.e()     // Catch: java.lang.Exception -> L44
            r8.getClass()     // Catch: java.lang.Exception -> L6c
            r0.b = r7     // Catch: java.lang.Exception -> L6c
            r0.e = r4     // Catch: java.lang.Exception -> L6c
            java.lang.Object r8 = defpackage.aq7.j(r8, r0)     // Catch: java.lang.Exception -> L6c
            if (r8 != r9) goto L5e
            goto L8a
        L5e:
            r6 = r8
            r8 = r7
            r7 = r6
        L61:
            qj0 r7 = (defpackage.qj0) r7     // Catch: java.lang.Exception -> L44
            java.lang.String r7 = r7.a     // Catch: java.lang.Exception -> L44
            r7.getClass()     // Catch: java.lang.Exception -> L44
            r6 = r8
            r8 = r7
            r7 = r6
            goto L77
        L6c:
            r8 = move-exception
            r6 = r8
            r8 = r7
            r7 = r6
        L70:
            java.lang.String r1 = "Error getting authentication token."
            android.util.Log.w(r2, r1, r7)
            r7 = r8
            r8 = r5
        L77:
            gk4 r7 = (defpackage.gk4) r7     // Catch: java.lang.Exception -> L32
            jrg r7 = r7.d()     // Catch: java.lang.Exception -> L32
            r7.getClass()     // Catch: java.lang.Exception -> L32
            r0.b = r8     // Catch: java.lang.Exception -> L32
            r0.e = r3     // Catch: java.lang.Exception -> L32
            java.lang.Object r7 = defpackage.aq7.j(r7, r0)     // Catch: java.lang.Exception -> L32
            if (r7 != r9) goto L8b
        L8a:
            return r9
        L8b:
            java.lang.String r7 = (java.lang.String) r7     // Catch: java.lang.Exception -> L32
            if (r7 != 0) goto L90
            goto L97
        L90:
            r5 = r7
            goto L97
        L92:
            java.lang.String r9 = "Error getting Firebase installation id ."
            android.util.Log.w(r2, r9, r7)
        L97:
            s36 r7 = new s36
            r7.<init>(r5, r8)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tz7.j(hk4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x0087 -> B:25:0x0067). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x008a -> B:25:0x0067). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object k(java.util.List r7, defpackage.wt2 r8, defpackage.p92 r9) throws java.lang.Throwable {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.lt2
            if (r0 == 0) goto L13
            r0 = r9
            lt2 r0 = (defpackage.lt2) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            lt2 r0 = new lt2
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r6 = r0.d
            tb2 r9 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.f
            r2 = 0
            r3 = 2
            r4 = 1
            if (r1 == 0) goto L43
            if (r1 == r4) goto L3b
            if (r1 != r3) goto L35
            java.util.Iterator r7 = r0.c
            java.util.Iterator r7 = (java.util.Iterator) r7
            java.io.Serializable r8 = r0.b
            rya r8 = (defpackage.rya) r8
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L33
            goto L67
        L33:
            r6 = move-exception
            goto L83
        L35:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r2
        L3b:
            java.io.Serializable r7 = r0.b
            java.util.List r7 = (java.util.List) r7
            defpackage.br7.v(r6)
            goto L5d
        L43:
            defpackage.br7.v(r6)
            java.util.ArrayList r6 = new java.util.ArrayList
            r6.<init>()
            yu r1 = new yu
            r5 = 6
            r1.<init>(r7, r6, r2, r5)
            r0.b = r6
            r0.f = r4
            java.lang.Object r7 = r8.a(r1, r0)
            if (r7 != r9) goto L5c
            goto L82
        L5c:
            r7 = r6
        L5d:
            rya r6 = new rya
            r6.<init>()
            java.util.Iterator r7 = r7.iterator()
            r8 = r6
        L67:
            boolean r6 = r7.hasNext()
            if (r6 == 0) goto L90
            java.lang.Object r6 = r7.next()
            x45 r6 = (defpackage.x45) r6
            r0.b = r8     // Catch: java.lang.Throwable -> L33
            r1 = r7
            java.util.Iterator r1 = (java.util.Iterator) r1     // Catch: java.lang.Throwable -> L33
            r0.c = r1     // Catch: java.lang.Throwable -> L33
            r0.f = r3     // Catch: java.lang.Throwable -> L33
            java.lang.Object r6 = r6.invoke(r0)     // Catch: java.lang.Throwable -> L33
            if (r6 != r9) goto L67
        L82:
            return r9
        L83:
            java.lang.Object r1 = r8.a
            if (r1 != 0) goto L8a
            r8.a = r6
            goto L67
        L8a:
            java.lang.Throwable r1 = (java.lang.Throwable) r1
            defpackage.kyd.D(r1, r6)
            goto L67
        L90:
            java.lang.Object r6 = r8.a
            java.lang.Throwable r6 = (java.lang.Throwable) r6
            if (r6 != 0) goto L99
            c1e r6 = defpackage.c1e.a
            return r6
        L99:
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tz7.k(java.util.List, wt2, p92):java.lang.Object");
    }

    public String toString() {
        switch (this.a) {
            case 23:
                return "NO_SOURCE";
            default:
                return super.toString();
        }
    }

    public /* synthetic */ tz7(int i2, boolean z) {
        this.a = i2;
    }

    public tz7(tz7 tz7Var) {
        this.a = 24;
    }
}
