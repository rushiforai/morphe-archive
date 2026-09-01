package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Build;
import android.view.View;
import android.view.Window;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.avi.AviDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.google.gson.JsonIOException;
import com.google.gson.JsonParseException;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.MalformedJsonException;
import com.medium.android.upvoters.ui.UpVotersReference;
import com.medium.android.upvoters.ui.a;
import com.medium.android.upvoters.ui.d;
import com.medium.reader.R;
import java.io.IOException;
import java.io.StringReader;
import java.util.Arrays;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class r40 {
    public static final mz1 d;
    public static final mz1 e;
    public static final da4 h;
    public static final da4 i;
    public static final da4[] j;
    public static final /* synthetic */ int k = 0;
    public static Boolean l;
    public static Boolean m;
    public static Boolean n;
    public static Boolean o;
    public static final /* synthetic */ int p = 0;
    public static final mz1 a = new mz1(new e02(9), false, -446793046);
    public static final mz1 b = new mz1(new c02(1), false, -681991948);
    public static final mz1 c = new mz1(new j02(29), false, 1460403069);
    public static final pj6[] f = new pj6[0];
    public static final long[] g = new long[0];

    static {
        byte b2 = 0;
        d = new mz1(new v02(10, b2), false, 524390330);
        e = new mz1(new v02(11, b2), false, -1888337251);
        da4 da4Var = new da4("EXECUTE", 1L);
        h = da4Var;
        da4 da4Var2 = new da4("INIT", 1L);
        i = da4Var2;
        j = new da4[]{da4Var, da4Var2};
    }

    public static final boolean A(zwa zwaVar, float f2, float f3) {
        float f4 = zwaVar.a;
        if (f2 > zwaVar.c || f4 > f2) {
            return false;
        }
        return f3 <= zwaVar.d && zwaVar.b <= f3;
    }

    public static final sp4 B(elb elbVar, String[] strArr, x45 x45Var) {
        v76 v76VarF = elbVar.f();
        String[] strArr2 = (String[]) Arrays.copyOf(strArr, strArr.length);
        mtd mtdVar = v76VarF.b;
        f09 f09VarI = mtdVar.i(strArr2);
        String[] strArr3 = (String[]) f09VarI.a;
        int[] iArr = (int[]) f09VarI.b;
        strArr3.getClass();
        iArr.getClass();
        return new sp4(w2g.m(new u50(12, new gbd(mtdVar, iArr, strArr3, (n92) null, 7)), -1), elbVar, x45Var, 1);
    }

    public static final void C(Executor executor, String str, f66 f66Var, Runnable runnable) {
        executor.getClass();
        f66Var.getClass();
        try {
            if (((executor instanceof dm0) || ((executor instanceof ThreadPoolExecutor) && (((ThreadPoolExecutor) executor).getQueue() instanceof im0))) && !(runnable instanceof u98)) {
                runnable = new u98(runnable, str);
            }
            executor.execute(runnable);
        } catch (RejectedExecutionException e2) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(str, 2), e2, 48);
        }
    }

    public static final int D(d05 d05Var, int i2) {
        boolean z = d05Var.compareTo(d05.d) >= 0;
        boolean z2 = i2 == 1;
        if (z2 && z) {
            return 3;
        }
        if (z) {
            return 1;
        }
        return z2 ? 2 : 0;
    }

    public static final View E(Activity activity) {
        if (ec2.a.contains(r40.class) || activity == null) {
            return null;
        }
        try {
            Window window = activity.getWindow();
            if (window == null) {
                return null;
            }
            return window.getDecorView().getRootView();
        } catch (Exception unused) {
            return null;
        } catch (Throwable th) {
            ec2.a(r40.class, th);
            return null;
        }
    }

    public static final boolean F() {
        String str = Build.FINGERPRINT;
        str.getClass();
        if (tuc.N(str, "generic", false) || tuc.N(str, "unknown", false)) {
            return true;
        }
        String str2 = Build.MODEL;
        str2.getClass();
        if (muc.Q(str2, "google_sdk", false) || muc.Q(str2, "Emulator", false) || muc.Q(str2, "Android SDK built for x86", false)) {
            return true;
        }
        String str3 = Build.MANUFACTURER;
        str3.getClass();
        if (muc.Q(str3, "Genymotion", false)) {
            return true;
        }
        String str4 = Build.BRAND;
        str4.getClass();
        if (tuc.N(str4, "generic", false)) {
            String str5 = Build.DEVICE;
            str5.getClass();
            if (tuc.N(str5, "generic", false)) {
                return true;
            }
        }
        return "google_sdk".equals(Build.PRODUCT);
    }

    public static boolean G(Context context) {
        PackageManager packageManager = context.getPackageManager();
        Boolean boolValueOf = l;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(packageManager.hasSystemFeature("android.hardware.type.watch"));
            l = boolValueOf;
        }
        if (boolValueOf.booleanValue() && Build.VERSION.SDK_INT < 24) {
            return true;
        }
        Boolean boolValueOf2 = m;
        if (boolValueOf2 == null) {
            boolValueOf2 = Boolean.valueOf(context.getPackageManager().hasSystemFeature("cn.google"));
            m = boolValueOf2;
        }
        if (boolValueOf2.booleanValue()) {
            return !gq7.D() || Build.VERSION.SDK_INT >= 30;
        }
        return false;
    }

    public static final r28 H(r28 r28Var, ti6 ti6Var, ku6 ku6Var, hw8 hw8Var, boolean z) {
        return r28Var.b(new nu6(ti6Var, ku6Var, hw8Var, z));
    }

    public static final yx5 I(yx5 yx5Var, boolean z) {
        if (!z) {
            return yx5Var;
        }
        zz0 zz0VarV0 = yx5Var.v0();
        return (zz0VarV0.C(0L, iw2.b) || zz0VarV0.C(0L, iw2.a)) ? gx1.x(new yua(new x25(yx5Var.v0())), yx5Var.getFileSystem()) : yx5Var;
    }

    public static final r28 J(r28 r28Var, x45 x45Var) {
        return r28Var.b(new zq4(x45Var));
    }

    public static dc6 K(gd6 gd6Var) {
        euc eucVar = gd6Var.b;
        if (eucVar == euc.LEGACY_STRICT) {
            gd6Var.E0(euc.LENIENT);
        }
        try {
            try {
                return vn7.K(gd6Var);
            } finally {
                gd6Var.E0(eucVar);
            }
        } catch (OutOfMemoryError | StackOverflowError e2) {
            throw new JsonParseException("Failed parsing JSON source: " + gd6Var + " to Json", e2);
        }
    }

    public static dc6 L(String str) {
        try {
            try {
                gd6 gd6Var = new gd6(new StringReader(str));
                dc6 dc6VarK = K(gd6Var);
                try {
                    dc6VarK.getClass();
                    if (!(dc6VarK instanceof pc6) && gd6Var.p0() != jd6.END_DOCUMENT) {
                        throw new JsonSyntaxException("Did not consume the entire document.");
                    }
                    return dc6VarK;
                } catch (NumberFormatException e2) {
                    e = e2;
                    throw new JsonSyntaxException(e);
                }
            } catch (IOException e3) {
                throw new JsonIOException(e3);
            }
        } catch (MalformedJsonException | NumberFormatException e4) {
            e = e4;
        }
    }

    public static final void M(ScheduledExecutorService scheduledExecutorService, String str, long j2, f66 f66Var, Runnable runnable) {
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        timeUnit.getClass();
        f66Var.getClass();
        try {
            scheduledExecutorService.schedule(runnable, j2, timeUnit);
        } catch (RejectedExecutionException e2) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(str, 6), e2, 48);
        }
    }

    public static final g68 N(qg2 qg2Var, x45 x45Var) {
        qg2Var.getClass();
        x45Var.getClass();
        g68 g68Var = new g68(qg2Var);
        g68Var.a.put(hm5.d, new rz3(2, x45Var));
        return g68Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void a(ka kaVar, akc akcVar, x9 x9Var, y9 y9Var, r28 r28Var, x12 x12Var, int i2) {
        ka kaVar2;
        x9 x9Var2;
        p65 p65Var;
        Object obj;
        pk6 pk6Var;
        int i3;
        Object obj2;
        int i4;
        float f2;
        float f3;
        n92 n92Var;
        Object obj3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(965699322);
        int i5 = i2 | (p65Var2.f(kaVar) ? 4 : 2) | (p65Var2.f(akcVar) ? 32 : 16) | (p65Var2.f(x9Var) ? 256 : 128) | (p65Var2.f(y9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.P(i5 & 1, (i5 & 9363) != 9362)) {
            Object objM = p65Var2.M();
            Object obj4 = w12.a;
            Object objG = objM;
            if (objM == obj4) {
                objG = ka1.g(p65Var2);
            }
            sr4 sr4Var = (sr4) objG;
            Object objM2 = p65Var2.M();
            Object obj5 = objM2;
            if (objM2 == obj4) {
                String str = kaVar.b;
                int length = str.length();
                Object objU = qo7.u(new uid(str, 4, lk7.q(length, length)));
                p65Var2.j0(objU);
                obj5 = objU;
            }
            l78 l78Var = (l78) obj5;
            rh4 rh4Var = jfc.c;
            r28 r28VarN = bgf.N(r28Var.b(rh4Var), "content");
            sn3 sn3Var = kt7.a;
            r28 r28VarX = ho2.x((jp7) p65Var2.j(sn3Var), r28VarN, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarX);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarR3 = wgf.R(rh4Var, wgf.K(p65Var2), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarR3);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            hp7.t(p65Var2, jfc.l(o28Var, 16.0f));
            uid uidVar = (uid) l78Var.getValue();
            String strR = vo7.R(p65Var2, R.string.add_note_hint);
            sk6 sk6Var = sk6.f;
            sk6 sk6VarA = sk6.a(3, 0, 7, 118);
            boolean z = (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM3 = p65Var2.M();
            if (z || objM3 == obj4) {
                Object baVar = new ba(akcVar, 0);
                p65Var2.j0(baVar);
                obj = baVar;
            } else {
                obj = objM3;
            }
            pk6 pk6Var2 = new pk6((x45) obj, null, null, 62);
            r28 r28VarN2 = bgf.N(t40.F(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), sr4Var), "annotation");
            int i9 = i5 & 896;
            boolean z2 = i9 == 256;
            Object objM4 = p65Var2.M();
            if (z2 || objM4 == obj4) {
                pk6Var = pk6Var2;
                i3 = 1;
                Object i0Var = new i0(x9Var, i3, l78Var);
                p65Var2.j0(i0Var);
                obj2 = i0Var;
            } else {
                pk6Var = pk6Var2;
                i3 = 1;
                obj2 = objM4;
            }
            boolean z3 = i3;
            d46.m(uidVar, (x45) obj2, r28VarN2, false, false, null, 10, sk6VarA, pk6Var, null, null, strR, null, null, null, null, 0, p65Var2, 12582912, 0, 257144);
            ((jp7) lv8.n(o28Var, 24.0f, p65Var2, sn3Var)).getClass();
            int i10 = ca.a[jp7.a(p65Var2).ordinal()];
            if (i10 != z3) {
                i4 = 2;
                if (i10 != 2 && i10 != 3) {
                    ygf.a();
                    return;
                }
                f2 = 24.0f;
            } else {
                i4 = 2;
                f2 = 0.0f;
            }
            tp7.c(0.0f, 0, 6, 0L, p65Var2, w2g.E(o28Var, f2, 0.0f, i4));
            ((jp7) p65Var2.j(sn3Var)).getClass();
            kaVar2 = kaVar;
            en7.e(kaVar2.a, jp7.a(p65Var2) == ip7.COMPACT ? stc.M : stc.L, y9Var, jfc.d(o28Var, 1.0f), null, p65Var2, ((i5 >> 3) & 896) | 3072);
            tp7.c(0.0f, 0, 6, 0L, p65Var2, w2g.E(o28Var, f2, 0.0f, 2));
            hp7.t(p65Var2, jfc.l(o28Var, 24.0f));
            boolean z4 = i9 == 256 ? z3 ? 1 : 0 : false;
            Object objM5 = p65Var2.M();
            if (z4 || objM5 == obj4) {
                f3 = 24.0f;
                Object x8Var = new x8(0, x9Var, x9.class, "onSubmitClicked", "onSubmitClicked()V", 0, 2);
                p65Var2.j0(x8Var);
                objM5 = x8Var;
            } else {
                f3 = 24.0f;
            }
            x9Var2 = x9Var;
            fo7.r((m45) ((qh6) objM5), vo7.R(p65Var2, R.string.common_done), xn7.M, bgf.N(w2g.E(jfc.d(jfc.q(new dr5(z46.q), 0.0f, 348.0f, z3 ? 1 : 0), 1.0f), f3, 0.0f, 2), "submit"), kaVar2.c, p65Var2, 384, 0);
            p65 p65Var3 = p65Var2;
            lv8.y(o28Var, 16.0f, p65Var3, z3);
            Object objM6 = p65Var3.M();
            if (objM6 == obj4) {
                n92Var = null;
                Object y8Var = new y8(sr4Var, n92Var, z3 ? 1 : 0);
                p65Var3.j0(y8Var);
                obj3 = y8Var;
            } else {
                n92Var = null;
                obj3 = objM6;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var3, (b55) obj3, c1eVar);
            p65Var3.p(z3);
            p65Var3.p(z3);
            boolean z5 = i9 == 256 ? z3 ? 1 : 0 : false;
            Object objM7 = p65Var3.M();
            Object obj6 = objM7;
            if (z5 || objM7 == obj4) {
                Object z8Var = new z8(x9Var2, n92Var, z3 ? 1 : 0);
                p65Var3.j0(z8Var);
                obj6 = z8Var;
            }
            kyd.k(p65Var3, (b55) obj6, c1eVar);
            p65Var = p65Var3;
        } else {
            kaVar2 = kaVar;
            x9Var2 = x9Var;
            p65Var2.S();
            p65Var = p65Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(kaVar2, akcVar, x9Var2, y9Var, r28Var, i2, 1);
        }
    }

    public static final void b(la laVar, x9 x9Var, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object x8Var;
        float f2;
        la laVar2 = laVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-634759684);
        int i3 = i2 | (p65Var.f(laVar2) ? 4 : 2) | (p65Var.f(x9Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            laVar2 = laVar;
            b24 b24Var = laVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                x8Var = new x8(0, x9Var, x9.class, "refresh", "refresh()V", 0, 3);
                p65Var.j0(x8Var);
            } else {
                x8Var = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) x8Var), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 4, laVar2, x9Var, r28Var);
        }
    }

    public static final void c(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1909312723);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var.b(rh4Var), "loading"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, rh4Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            xz5.o(iy0.a.a(o28Var, ar0Var), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, 0L, 0L, 0, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 0);
        }
    }

    public static final void d(vpc vpcVar, bo4 bo4Var, x9 x9Var, y9 y9Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(823409873);
        int i3 = 4;
        int i4 = i2 | (p65Var.h(vpcVar) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(x9Var) ? 256 : 128) | (p65Var.f(y9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576;
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var, i4 & 14);
            nhc nhcVarF = mk7.F(p65Var);
            akc akcVar = (akc) p65Var.j(z22.r);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new b5(6);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            pr7.b(bgf.N(wxb.a(o28Var, false, (x45) objM), "add_note_screen"), pxf.E(-371921843, new r(x9Var, i3, l78VarZ), p65Var), null, pxf.E(-158304757, new u8(nhcVarF, i5), p65Var), null, 0, 0L, 0L, null, pxf.E(603718946, new fd3(akcVar, x9Var, y9Var, l78VarZ, 12), p65Var), p65Var, 805309488, 500);
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            boolean zH = p65Var.h(bo4Var) | ((i4 & 896) == 256) | p65Var.f(nhcVarF) | p65Var.h(resources) | ((i4 & 7168) == 2048);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                b9 b9Var = new b9((Object) bo4Var, (Object) x9Var, nhcVarF, resources, (Object) y9Var, (n92) null, 1);
                p65Var.j0(b9Var);
                objM2 = b9Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(vpcVar, bo4Var, x9Var, y9Var, r28Var2, i2, 2);
        }
    }

    public static final void e(na naVar, x9 x9Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        int i4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1802391783);
        int i5 = (p65Var2.f(naVar) ? 4 : 2) | i2 | (p65Var2.f(x9Var) ? 32 : 16);
        if (p65Var2.P(i5 & 1, (i5 & 19) != 18)) {
            if ((naVar instanceof ka) && ((ka) naVar).d) {
                i3 = 1226692974;
                i4 = R.string.list_edit_note;
            } else {
                i3 = 1226695437;
                i4 = R.string.list_add_note;
            }
            String strW = km4.w(p65Var2, i3, i4, p65Var2, false);
            c09 c09VarJ = vn7.J(R.drawable.ic_close_24, 0, p65Var2);
            String strR = vo7.R(p65Var2, R.string.common_close);
            boolean z = (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new x8(0, x9Var, x9.class, "onBackPressed", "onBackPressed()V", 0, 4);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, strW, (m45) ((qh6) objM), null, c09VarJ, strR, 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_VENDOR);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(naVar, x9Var, i2, 3);
        }
    }

    public static final void f(va0 va0Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        boolean z;
        String strW;
        Integer num = va0Var.b;
        Long l2 = va0Var.a;
        Integer num2 = va0Var.c;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1509498494);
        int i3 = i2 | (p65Var.f(va0Var) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(o28Var, "audience_all_time_section");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String strR = vo7.R(p65Var, R.string.stats_lifetime);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, bgf.N(o28Var, "audience_all_time_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).h, p65Var, 48, 0, 131068);
            if (l2 != null) {
                p65Var.Y(-507821176);
                z = false;
                strW = vo7.Q(R.string.stats_from_to_utc_updated_daily, new Object[]{vo7.v(l2.longValue(), p65Var), vo7.R(p65Var, R.string.common_today)}, p65Var);
                p65Var.p(false);
            } else {
                z = false;
                strW = km4.w(p65Var, -507584398, R.string.stats_updated_daily, p65Var, false);
            }
            boolean z2 = z;
            jjd.b(strW, bgf.N(o28Var, "audience_all_time_from"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) lv8.n(o28Var, 4.0f, p65Var, sn3Var)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            if (num != null) {
                p65Var.Y(-507160287);
                l(num.intValue(), va0Var.d, R.string.stats_followers, R.string.audience_stats_followers_tooltip, bgf.N(o28Var, "audience_all_time_followers"), p65Var, 24576);
                lv8.y(o28Var, 24.0f, p65Var, z2);
            } else {
                p65Var.Y(-509392938);
                p65Var.p(z2);
            }
            if (num2 != null) {
                p65Var.Y(-506701363);
                l(num2.intValue(), va0Var.e, R.string.stats_subscribers, R.string.audience_stats_subscribers_tooltip, bgf.N(o28Var, "audience_all_time_subscribers"), p65Var, 24576);
                if (num2.intValue() > 0) {
                    p65Var.Y(-506294643);
                    jjd.b(vo7.R(p65Var, R.string.audience_stats_view_subscribers_list), hlg.r(bgf.N(o28Var, "audience_all_time_view_subscribers_list"), false, null, null, m45Var, 15), 0L, 0L, 0L, ohd.c, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 805306368, 0, 130556);
                    p65Var = p65Var;
                } else {
                    p65Var.Y(-509392938);
                }
                p65Var.p(z2);
            } else {
                p65Var.Y(-509392938);
            }
            p65Var.p(z2);
            p65Var.p(true);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 20, va0Var, m45Var, obj);
        }
    }

    public static final void g(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2022680075);
        int i3 = i2 | 6;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j2) ? 32 : 16;
        }
        int i4 = i3;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            p65Var.U();
            int i5 = i2 & 1;
            o28 o28Var = o28.b;
            if (i5 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) ((j3 >>> 32) ^ j3);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var3);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            sn3 sn3Var = jt7.c;
            int i7 = ((i4 << 6) & 7168) | 48;
            ok7.r(78.0f, i7, 4, j2, p65Var, null, ((bu7) p65Var.j(sn3Var)).h);
            ok7.r(210.0f, i7, 4, j2, p65Var, null, ((bu7) lv8.n(o28Var, 4.0f, p65Var, sn3Var)).n);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            int i8 = (i4 >> 3) & 14;
            m(j2, p65Var, i8);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            m(j2, p65Var, i8);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j2, i2, 0);
        }
    }

    public static final void h(r28 r28Var, xd xdVar, mz1 mz1Var, x12 x12Var, int i2, int i3) {
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(380139498);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
        } else if ((i2 & 6) == 0) {
            i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        int i6 = i3 & 2;
        if (i6 != 0) {
            i4 |= 48;
        } else if ((i2 & 48) == 0) {
            i4 |= p65Var.f(xdVar) ? 32 : 16;
        }
        int i7 = i4 | 384;
        if ((i2 & 3072) == 0) {
            i7 |= p65Var.h(mz1Var) ? 2048 : 1024;
        }
        if (p65Var.P(i7 & 1, (i7 & 1171) != 1170)) {
            if (i5 != 0) {
                r28Var = o28.b;
            }
            if (i6 != 0) {
                xdVar = z46.d;
            }
            zk7 zk7VarC = dy0.c(xdVar, false);
            boolean zF = p65Var.f(zk7VarC) | ((i7 & 7168) == 2048);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new r(zk7VarC, 18, mz1Var);
                p65Var.j0(objM);
            }
            f76.u(r28Var, (b55) objM, p65Var, i7 & 14, 0);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        xd xdVar2 = xdVar;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(r28Var2, xdVar2, mz1Var, i2, i3, 1);
        }
    }

    public static final void i(v81 v81Var, y81 y81Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        r28 r28Var2;
        y81Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1655283282);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(v81Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(y81Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            boolean zF = p65Var2.f(v81Var.c) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var2.f(v81Var.g);
            Object objM = p65Var2.M();
            if (zF || objM == w12.a) {
                objM = new u81(y81Var, v81Var);
                p65Var2.j0(objM);
            }
            u81 u81Var = (u81) objM;
            if (v81Var.a) {
                p65Var = p65Var2;
                r28Var2 = r28Var;
                p65Var.Y(1589379043);
                p(y81Var, !v81Var.b, r28Var2, p65Var, (i3 & 896) | ((i3 >> 3) & 14));
                p65Var.p(false);
            } else {
                p65Var2.Y(1589369363);
                r28Var2 = r28Var;
                p65Var = p65Var2;
                wo7.e(v81Var.d, Integer.valueOf(v81Var.e), !v81Var.f, u81Var, w2g.G(r28Var, 0.0f, 0.0f, 0.0f, 16.0f, 7), p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var = p65Var2;
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 8, v81Var, y81Var, r28Var2);
        }
    }

    public static final void j(rr3 rr3Var, fq3 fq3Var, r28 r28Var, x12 x12Var, int i2, int i3) {
        int i4;
        r28 r28Var2;
        int i5;
        r28 r28Var3;
        ms3 ms3Var;
        Object hq3Var;
        fq3 fq3Var2;
        fq3Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1216630525);
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var.f(rr3Var) ? 4 : 2);
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.f(fq3Var) ? 32 : 16;
        }
        int i6 = i3 & 4;
        if (i6 != 0) {
            i5 = i4 | 384;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i5 = i4 | (p65Var.f(r28Var2) ? 256 : 128);
        }
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            r28 r28Var4 = i6 != 0 ? o28.b : r28Var2;
            if (rr3Var == null || (ms3Var = rr3Var.b) == null) {
                ms3Var = js3.a;
            }
            ms3 ms3Var2 = ms3Var;
            boolean z = rr3Var != null ? rr3Var.a : false;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            c09 c09VarJ = vn7.J(R.drawable.ic_close_24, 0, p65Var);
            String strR = vo7.R(p65Var, R.string.common_close);
            boolean z2 = (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                hq3Var = new hq3(0, fq3Var, fq3.class, "onBack", "onBack()V", 0, 2);
                fq3Var2 = fq3Var;
                p65Var.j0(hq3Var);
            } else {
                fq3Var2 = fq3Var;
                hq3Var = objM2;
            }
            r28 r28Var5 = r28Var4;
            qk7.g(r28Var5, null, (m45) ((qh6) hq3Var), pxf.E(-115916700, new nb(ms3Var2, fq3Var2, l78Var, z), p65Var), c09VarJ, strR, 0L, ((zo7) p65Var.j(kt7.b)).a, null, p65Var, ((i5 >> 6) & 14) | 35888, AviDirectory.TAG_DATETIME_ORIGINAL);
            r28Var3 = r28Var5;
        } else {
            p65Var.S();
            r28Var3 = r28Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(rr3Var, fq3Var, r28Var3, i2, i3, 2);
        }
    }

    public static final void k(l78 l78Var, boolean z) {
        l78Var.setValue(Boolean.valueOf(z));
    }

    public static final void l(int i2, Integer num, int i3, int i4, r28 r28Var, x12 x12Var, int i5) {
        f09 f09Var;
        boolean z;
        int i6 = i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-608897727);
        int i7 = i5 | (p65Var.d(i2) ? 4 : 2) | (p65Var.f(num) ? 32 : 16) | (p65Var.d(i3) ? 256 : 128) | (p65Var.d(i6) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i7 & 1, (i7 & 9363) != 9362)) {
            Integer numValueOf = num != null ? Integer.valueOf(Integer.signum(num.intValue())) : null;
            if (numValueOf != null && numValueOf.intValue() == 1) {
                p65Var.Y(-1035155501);
                f09Var = new f09("+", new uu1(((zo7) p65Var.j(kt7.b)).r));
                p65Var.p(false);
            } else if (numValueOf != null && numValueOf.intValue() == -1) {
                p65Var.Y(-1035153423);
                f09Var = new f09("", new uu1(((zo7) p65Var.j(kt7.b)).u));
                p65Var.p(false);
            } else {
                p65Var.Y(-1035151379);
                p65Var.p(false);
                f09Var = new f09(null, null);
            }
            String str = (String) f09Var.a;
            uu1 uu1Var = (uu1) f09Var.b;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf2 = Integer.valueOf(i8);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf2);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            String strQ = dq1.q(Integer.valueOf(i2));
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).i;
            o28 o28Var = o28.b;
            jjd.b(strQ, bgf.N(o28Var, "audience_impact_item_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, 48, 0, 131068);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j3 = p65Var.T;
            int i9 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            jjd.b(vo7.R(p65Var, i3), bgf.N(o28Var, "audience_impact_item_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, 48, 0, 131068);
            p65Var = p65Var;
            i6 = i4;
            vx0.p(y30.n(8.0f, i6, p65Var, p65Var, o28Var), bgf.N(o28Var, "audience_impact_item_info_tooltip"), 0L, p65Var, 48, 12);
            p65Var.p(true);
            if (str == null || uu1Var == null || num == null) {
                z = false;
                p65Var.Y(826938507);
            } else {
                p65Var.Y(831724814);
                z = false;
                jjd.b(vo7.Q(R.string.audience_stats_from_last_month, new Object[]{str.concat(dq1.q(num))}, p65Var), bgf.N(o28Var, "audience_impact_item_gain"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).l, uu1Var.a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
                p65Var = p65Var;
            }
            p65Var.p(z);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ta0(i2, num, i3, i6, r28Var, i5);
        }
    }

    public static final void m(long j2, x12 x12Var, final int i2) {
        int i3;
        final long j3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(484221540);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.e(j2) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            sn3 sn3Var = jt7.c;
            int i4 = ((i3 << 9) & 7168) | 48;
            j3 = j2;
            ok7.r(22.0f, i4, 4, j3, p65Var, null, ((bu7) p65Var.j(sn3Var)).i);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            ok7.r(68.0f, i4, 4, j3, p65Var, null, ((bu7) p65Var.j(sn3Var)).l);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            dy0.a(flb.a0(jfc.l(o28Var, 16.0f), j3, rv8.r), p65Var, 0);
            p65Var.p(true);
            ok7.r(142.0f, i4, 4, j3, p65Var, null, ((bu7) p65Var.j(sn3Var)).l);
        } else {
            j3 = j2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: ua0
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).intValue();
                    int iY = tr7.y(i2 | 1);
                    r40.m(j3, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:177:0x0275  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void n(final defpackage.r28 r37, defpackage.ur6 r38, final defpackage.sg5 r39, final defpackage.hy8 r40, final defpackage.dn4 r41, final boolean r42, final defpackage.fx8 r43, final defpackage.j70 r44, final defpackage.g70 r45, final defpackage.x45 r46, defpackage.x12 r47, final int r48, final int r49) {
        /*
            Method dump skipped, instruction units count: 912
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r40.n(r28, ur6, sg5, hy8, dn4, boolean, fx8, j70, g70, x45, x12, int, int):void");
    }

    public static final void o(m45 m45Var, m45 m45Var2, m45 m45Var3, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        m45Var3.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1941387166);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(m45Var2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(m45Var3) ? 256 : 128;
        }
        int i4 = i3 | 3072;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            float fP = br7.p(p65Var, R.dimen.list_catalog_preview_horizontal_padding);
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.E(o28Var, fP, 0.0f, 2), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            dm2.b(m45Var, jfc.d(bgf.N(o28Var, "lists_catalog_tutorial"), 1.0f), false, null, gx1.A(((zo7) p65Var.j(kt7.b)).r, 0L, p65Var, 0, 14), null, null, pxf.E(748955040, new g64(m45Var2, 17, m45Var3), p65Var), p65Var, (i4 & 14) | 100663344, 236);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 27, m45Var, m45Var2, m45Var3, r28Var2);
        }
    }

    public static final void p(y81 y81Var, boolean z, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        y81 y81Var2;
        p65 p65Var;
        boolean z2;
        int i4;
        int i5;
        boolean z3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(449544594);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(y81Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.g(z) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarA0 = flb.a0(jfc.d(r28Var, 1.0f), ((zo7) p65Var2.j(kt7.b)).a, rv8.r);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarA0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            tp7.c(0.0f, 0, 7, 0L, p65Var2, null);
            o28 o28Var = o28.b;
            hp7.t(p65Var2, jfc.l(o28Var, 24.0f));
            r28 r28VarJ = ka1.j((jp7) p65Var2.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarJ);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var2.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            r28 r28VarE = w2g.E(jfc.d(o28Var, 1.0f), 12.0f, 0.0f, 2);
            omb ombVarA = nmb.a(qb8.e, z46.m, p65Var2, 6);
            long j5 = p65Var2.T;
            int i9 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarE);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i9, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            String strR = vo7.R(p65Var2, R.string.common_cancel);
            xn7 xn7Var = xn7.M;
            int i10 = i3 & 14;
            boolean z4 = i10 == 4;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z4 || objM == uobVar) {
                i4 = i3;
                i5 = 2;
                z3 = false;
                sc0 sc0Var = new sc0(0, y81Var, y81.class, "cancelReorder", "cancelReorder()V", 0, 8);
                p65Var2.j0(sc0Var);
                objM = sc0Var;
            } else {
                i4 = i3;
                i5 = 2;
                z3 = false;
            }
            int i11 = i5;
            int i12 = ((i4 << 9) & 57344) | 3456;
            fo7.j((m45) ((qh6) objM), strR, xn7Var, jfc.q(o28Var, 120.0f, 0.0f, i5), z, null, p65Var2, i12, 32);
            String strN = y30.n(12.0f, R.string.common_done, p65Var2, p65Var2, o28Var);
            if (i10 == 4) {
                z3 = true;
            }
            Object objM2 = p65Var2.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new sc0(0, y81Var, y81.class, "submitReorder", "submitReorder()V", 0, 9);
                y81Var2 = y81Var;
                p65Var2.j0(objM2);
            } else {
                y81Var2 = y81Var;
            }
            z2 = z;
            fo7.i((m45) ((qh6) objM2), strN, xn7Var, jfc.q(o28Var, 120.0f, 0.0f, i11), z2, p65Var2, i12, 0);
            p65Var = p65Var2;
            b09.H(p65Var, true, true, true);
            lv8.y(o28Var, 24.0f, p65Var, true);
        } else {
            y81Var2 = y81Var;
            p65Var = p65Var2;
            z2 = z;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s81(y81Var2, z2, r28Var, i2);
        }
    }

    public static final void q(int i2, int i3, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-187393841);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i4 = (p65Var.f(r28Var2) ? 4 : 2) | i2;
        }
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            o28 o28Var = o28.b;
            if (i5 != 0) {
                r28Var2 = o28Var;
            }
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var2, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            tr7.g(0, 1, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var2, i2, i3, 20);
        }
    }

    public static final void r(y3e y3eVar, kv6 kv6Var, s3e s3eVar, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1501768144);
        int i3 = i2 | (p65Var.f(y3eVar) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(s3eVar) ? 256 : 128) | (p65Var.f(obeVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (!p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.S();
        } else if (y3eVar instanceof w3e) {
            p65Var.Y(-90165584);
            t(r28Var, p65Var, (i3 >> 12) & 14);
            p65Var.p(false);
        } else if (y3eVar instanceof x3e) {
            p65Var.Y(-90162825);
            u((x3e) y3eVar, kv6Var, s3eVar, obeVar, r28Var, p65Var, i3 & 65534);
            p65Var.p(false);
        } else {
            if (!(y3eVar instanceof v3e)) {
                throw ho2.L(p65Var, -90167240, false);
            }
            p65Var.Y(-90153916);
            s((v3e) y3eVar, s3eVar, r28Var, p65Var, ((i3 >> 6) & 896) | (i3 & 14) | ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(y3eVar, kv6Var, s3eVar, obeVar, r28Var, i2, 14);
        }
    }

    public static final void s(v3e v3eVar, s3e s3eVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        ar0 ar0Var;
        Object ibdVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1562349482);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(v3eVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(s3eVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            int i6 = i3;
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            b24 b24Var = v3eVar.a;
            boolean z = (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                ibdVar = new ibd(0, s3eVar, s3e.class, "refresh", "refresh()V", 0, 19);
                p65Var.j0(ibdVar);
            } else {
                ibdVar = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, iy0.a.a(o28Var, ar0Var), null, null, null, null, (m45) ((qh6) ibdVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 21, v3eVar, s3eVar, r28Var);
        }
    }

    public static final void t(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1659894849);
        int i3 = (i2 & 6) == 0 ? (p65Var.f(r28Var) ? 4 : 2) | i2 : i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), m40.V(r28Var, p65Var, i3 & 14), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(-35023432);
            for (int i7 = 0; i7 < 20; i7++) {
                q(0, 1, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 21);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:71:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0135  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void u(defpackage.x3e r33, defpackage.kv6 r34, defpackage.s3e r35, defpackage.obe r36, defpackage.r28 r37, defpackage.x12 r38, int r39) {
        /*
            Method dump skipped, instruction units count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r40.u(x3e, kv6, s3e, obe, r28, x12, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:73:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void v(defpackage.y3e r22, defpackage.s3e r23, defpackage.obe r24, defpackage.r28 r25, defpackage.nhc r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 323
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r40.v(y3e, s3e, obe, r28, nhc, x12, int, int):void");
    }

    public static final void w(UpVotersReference upVotersReference, String str, a aVar, r28 r28Var, d dVar, x12 x12Var, int i2) {
        d dVar2;
        int i3;
        d dVar3;
        upVotersReference.getClass();
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(391512416);
        int i4 = i2 | (p65Var.f(upVotersReference) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(aVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new vrd(upVotersReference, 7, str);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-57345);
                    dVar3 = (d) to7.z(n1b.a.b(d.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                dVar3 = dVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(dVar3.p, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i6 = i3 & 896;
            boolean zF = (i6 == 256) | p65Var.f(dVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new s3e(aVar, dVar3);
                p65Var.j0(objM2);
            }
            s3e s3eVar = (s3e) objM2;
            boolean zF2 = p65Var.f(dVar3) | (i6 == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new t3e(aVar, dVar3);
                p65Var.j0(objM3);
            }
            t3e t3eVar = (t3e) objM3;
            v((y3e) l78VarZ.getValue(), s3eVar, t3eVar, r28Var, nhcVarF, p65Var, i3 & 7168, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = kyd.M(p65Var);
                p65Var.j0(objM4);
            }
            sb2 sb2Var = (sb2) objM4;
            boolean zH = p65Var.h(dVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(t3eVar);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                kyc kycVar = new kyc((que) dVar3, nhcVarF, sb2Var, resources, (Object) t3eVar, (n92) null, 5);
                p65Var.j0(kycVar);
                objM5 = kycVar;
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
            dVar2 = dVar3;
        } else {
            p65Var.S();
            dVar2 = dVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(upVotersReference, str, aVar, r28Var, dVar2, i2);
        }
    }

    public static final void x(y3e y3eVar, float f2, s3e s3eVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-52369907);
        int i3 = i2 | (p65Var.f(y3eVar) ? 4 : 2) | (p65Var.c(f2) ? 32 : 16) | (p65Var.f(s3eVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            String strD = "";
            if (y3eVar instanceof x3e) {
                p65Var.Y(-1078498900);
                x3e x3eVar = (x3e) y3eVar;
                Long l2 = x3eVar.b;
                Long l3 = x3eVar.a;
                if (l3 == null || l2 == null) {
                    p65Var.Y(-1077856301);
                    p65Var.p(false);
                } else {
                    p65Var.Y(-1078423570);
                    strD = vo7.D(R.plurals.up_voters_title, (int) Math.min(l3.longValue(), 2147483647L), new Object[]{dq1.g(l3), dq1.g(l2)}, p65Var);
                    p65Var.p(false);
                }
                p65Var.p(false);
            } else if (y3eVar instanceof v3e) {
                p65Var.Y(-1077764047);
                p65Var.p(false);
            } else {
                if (!(y3eVar instanceof w3e)) {
                    throw ho2.L(p65Var, 1212133768, false);
                }
                p65Var.Y(-1077710479);
                p65Var.p(false);
            }
            String str = strD;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarW = wo7.w(o28Var, f2, nr5Var, 0L, 0L, 28);
            boolean z = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ibd ibdVar = new ibd(0, s3eVar, s3e.class, "onBackPressed", "onBackPressed()V", 0, 22);
                p65Var.j0(ibdVar);
                objM = ibdVar;
            }
            qk7.g(r28VarW, str, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 504);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dj3(y3eVar, f2, s3eVar, r28Var2, i2, 8);
        }
    }

    public static final r28 y(r28 r28Var, m3c m3cVar) {
        return xz5.Y(r28Var, 0.0f, 0.0f, 0.0f, m3cVar, 518143);
    }

    public static final r28 z(r28 r28Var) {
        return xz5.Y(r28Var, 0.0f, 0.0f, 0.0f, null, 520191);
    }
}
