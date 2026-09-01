package defpackage;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.type.PagingOptions;
import com.medium.reader.R;
import j$.util.Objects;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class vp7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;
    public static final /* synthetic */ int f = 0;

    public static final f41 A(f41 f41Var) {
        f41Var.getClass();
        f41 f41VarZ = z(f41Var);
        if (f41VarZ != null) {
            return f41VarZ;
        }
        int i = a11.l;
        n98 name = f41Var.getName();
        name.getClass();
        if (mlc.e.contains(name)) {
            return f93.b(f41Var, zkc.d);
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:55:0x013e, code lost:
    
        if (r6 == null) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0145, code lost:
    
        return !defpackage.vm6.z(r13);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean B(defpackage.y28 r13, defpackage.f41 r14) {
        /*
            Method dump skipped, instruction units count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vp7.B(y28, f41):boolean");
    }

    public static boolean C(byte b2) {
        return b2 > -65;
    }

    public static final wgc D(ArrayList arrayList) {
        wgc wgcVar = new wgc();
        for (Object obj : arrayList) {
            ev7 ev7Var = (ev7) obj;
            if (ev7Var != null && ev7Var != dv7.b) {
                wgcVar.add(obj);
            }
        }
        return wgcVar;
    }

    public static final void E(igc igcVar, x60 x60Var, int i) {
        while (true) {
            int i2 = igcVar.v;
            if (i > i2 && i < igcVar.u) {
                return;
            }
            if (i2 == 0 && i == 0) {
                return;
            }
            igcVar.L();
            if (igcVar.x(igcVar.v)) {
                x60Var.i();
            }
            igcVar.i();
        }
    }

    public static final PagingOptions F(agb agbVar) {
        agbVar.getClass();
        String str = agbVar.a;
        zv8 yv8Var = xv8.a;
        zv8 yv8Var2 = str == null ? yv8Var : new yv8(str);
        List list = agbVar.b;
        zv8 yv8Var3 = list == null ? yv8Var : new yv8(list);
        Integer num = agbVar.c;
        zv8 yv8Var4 = num == null ? yv8Var : new yv8(num);
        String str2 = agbVar.d;
        zv8 yv8Var5 = str2 == null ? yv8Var : new yv8(str2);
        Integer num2 = agbVar.e;
        zv8 yv8Var6 = num2 == null ? yv8Var : new yv8(num2);
        Long l = agbVar.f;
        zv8 yv8Var7 = l == null ? yv8Var : new yv8(l);
        String str3 = agbVar.g;
        zv8 yv8Var8 = str3 == null ? yv8Var : new yv8(str3);
        String str4 = agbVar.h;
        if (str4 != null) {
            yv8Var = new yv8(str4);
        }
        return new PagingOptions(yv8Var2, yv8Var3, yv8Var4, yv8Var5, yv8Var6, yv8Var7, yv8Var8, yv8Var);
    }

    public static final agb G(PagingParamsData pagingParamsData) {
        return new agb(pagingParamsData.getFrom(), pagingParamsData.getIgnoredIds(), pagingParamsData.getLimit(), pagingParamsData.getOrder(), pagingParamsData.getPage(), pagingParamsData.getSince(), pagingParamsData.getSource(), pagingParamsData.getTo());
    }

    public static jrg H(List list) {
        if (list == null || list.isEmpty()) {
            return x(null);
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            if (((jrg) it2.next()) == null) {
                z72.c("null tasks are not accepted");
                return null;
            }
        }
        jrg jrgVar = new jrg();
        mnf mnfVar = new mnf(list.size(), jrgVar);
        Iterator it3 = list.iterator();
        while (it3.hasNext()) {
            jrg jrgVar2 = (jrg) it3.next();
            bf3 bf3Var = yfd.b;
            jrgVar2.e(bf3Var, mnfVar);
            jrgVar2.d(bf3Var, mnfVar);
            jrgVar2.b.h(new l6g((Executor) bf3Var, (kq8) mnfVar));
            jrgVar2.r();
        }
        return jrgVar;
    }

    public static Object I(jrg jrgVar) throws ExecutionException {
        if (jrgVar.k()) {
            return jrgVar.i();
        }
        if (jrgVar.d) {
            throw new CancellationException("Task is already canceled");
        }
        throw new ExecutionException(jrgVar.h());
    }

    public static ArrayList J(List list) {
        if (list == null || list.isEmpty()) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            hqf hqfVar = (hqf) it2.next();
            Object hqdVar = null;
            if (hqfVar != null) {
                if (TextUtils.isEmpty(hqfVar.a)) {
                    crf crfVar = hqfVar.e;
                    if (crfVar != null) {
                        hqdVar = new hqd(hqfVar.b, hqfVar.c, hqfVar.d, crfVar);
                    }
                } else {
                    String str = hqfVar.b;
                    String str2 = hqfVar.c;
                    long j = hqfVar.d;
                    String str3 = hqfVar.a;
                    n(str3);
                    hqdVar = new d99(j, str, str2, str3);
                }
            }
            if (hqdVar != null) {
                arrayList.add(hqdVar);
            }
        }
        return arrayList;
    }

    public static void K() {
        try {
            if (oag.a()) {
                throw new GeneralSecurityException("Cannot use non-FIPS-compliant AeadConfigurationV1 in FIPS mode");
            }
        } catch (GeneralSecurityException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(753904784);
        if (p65Var.P(i & 1, i != 0)) {
            o28 o28Var = o28.b;
            r28 r28VarE = jfc.e(jfc.d(o28Var, 1.0f), 160.0f);
            wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var, 54);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarE);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            kjd.b("Divider", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 6, 0, 131070);
            b(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.d(jfc.e(o28Var, 8.0f), 1.0f));
            hp7.t(p65Var, jfc.d(jfc.e(o28Var, 8.0f), 1.0f));
            kjd.b("Divider vertical", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 6, 0, 131070);
            p65Var = p65Var;
            c(0.0f, 0, 0L, p65Var, null);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 12);
        }
    }

    public static final void b(float f2, int i, int i2, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i3;
        float f3;
        int i4;
        long j2;
        float f4;
        r28 r28Var3;
        int i5;
        long j3;
        r28 r28Var4;
        float f5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-885534606);
        int i6 = i2 & 1;
        if (i6 != 0) {
            i3 = i | 6;
            r28Var2 = r28Var;
        } else if ((i & 6) == 0) {
            r28Var2 = r28Var;
            i3 = i | (p65Var.f(r28Var2) ? 4 : 2);
        } else {
            r28Var2 = r28Var;
            i3 = i;
        }
        long j4 = j;
        int i7 = i3 | (((i2 & 2) == 0 && p65Var.e(j4)) ? 32 : 16);
        int i8 = i2 & 4;
        if (i8 != 0) {
            i4 = i7 | 384;
            f3 = f2;
        } else {
            f3 = f2;
            i4 = i7 | (p65Var.c(f3) ? 256 : 128);
        }
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                r28 r28Var5 = i6 != 0 ? o28.b : r28Var2;
                if ((i2 & 2) != 0) {
                    j4 = ((zo7) p65Var.j(kt7.b)).x;
                    i4 &= -113;
                }
                if (i8 != 0) {
                    long j5 = j4;
                    r28Var4 = r28Var5;
                    f5 = 1.0f;
                    i5 = i4;
                    j3 = j5;
                    p65Var.q();
                    f49.f(f5, i5 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION, j3, p65Var, r28Var4);
                    f4 = f5;
                    j2 = j3;
                    r28Var3 = r28Var4;
                } else {
                    i5 = i4;
                    j3 = j4;
                    r28Var4 = r28Var5;
                }
            } else {
                p65Var.S();
                if ((i2 & 2) != 0) {
                    i4 &= -113;
                }
                r28Var4 = r28Var2;
                i5 = i4;
                j3 = j4;
            }
            f5 = f3;
            p65Var.q();
            f49.f(f5, i5 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION, j3, p65Var, r28Var4);
            f4 = f5;
            j2 = j3;
            r28Var3 = r28Var4;
        } else {
            p65Var.S();
            j2 = j4;
            f4 = f3;
            r28Var3 = r28Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sp7(r28Var3, j2, f4, i, i2, 2);
        }
    }

    public static final void c(float f2, int i, long j, x12 x12Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-79723364);
        int i2 = i | 406;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                j = ((zo7) p65Var.j(kt7.b)).x;
                r28Var = o28.b;
                f2 = 1.0f;
            } else {
                p65Var.S();
            }
            p65Var.q();
            dy0.a(flb.a0(jfc.p(jfc.c(r28Var, 1.0f), f2), j, rv8.r), p65Var, 0);
        } else {
            p65Var.S();
        }
        float f3 = f2;
        long j2 = j;
        r28 r28Var2 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new up7(r28Var2, j2, f3, i);
        }
    }

    public static f99 d() {
        v4.f();
        v4.f();
        f99 f99Var = new f99();
        f99Var.a = h7.a;
        v4.f();
        f99Var.a = i7.a;
        return f99Var;
    }

    public static final void e(final pra praVar, final ek8 ek8Var, x12 x12Var, int i) {
        int i2;
        String str = praVar.h;
        String strD = praVar.f;
        int i3 = praVar.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-977009535);
        int i4 = (p65Var.f(praVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            String str2 = praVar.d;
            boolean z = praVar.a;
            kx kxVarW = ho2.w(p65Var, 1691686241);
            if (i3 == 1) {
                p65Var.Y(1245271788);
                p65Var.p(false);
                i2 = 1;
            } else {
                i2 = 1;
                p65Var.Y(1245273252);
                int i5 = i3 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i5, new Object[]{strD, Integer.valueOf(i5)}, p65Var);
                p65Var.p(false);
            }
            Object[] objArr = new Object[2];
            objArr[0] = strD;
            objArr[i2] = str;
            String strQ = vo7.Q(R.string.notification_type_quote_rollup, objArr, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, strD, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, strD.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = praVar.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_quote);
                int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i7 = i4 & 14;
                int i8 = (i6 == 32 ? i2 : 0) | (i7 == 4 ? i2 : 0);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i8 != 0 || objM == uobVar) {
                    objM = new m45() { // from class: qra
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i9 = i;
                            c1e c1eVar = c1e.a;
                            pra praVar2 = praVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i9) {
                                case 0:
                                    ek8Var2.n(praVar2.c, praVar2.i);
                                    break;
                                default:
                                    ek8Var2.k(praVar2.e, praVar2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i9 = (i6 == 32 ? i2 : 0) | (i7 == 4 ? i2 : 0);
                Object objM2 = p65Var.M();
                if (i9 != 0 || objM2 == uobVar) {
                    final int i10 = i2;
                    objM2 = new m45() { // from class: qra
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i92 = i10;
                            c1e c1eVar = c1e.a;
                            pra praVar2 = praVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i92) {
                                case 0:
                                    ek8Var2.n(praVar2.c, praVar2.i);
                                    break;
                                default:
                                    ek8Var2.k(praVar2.e, praVar2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str2, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(praVar, ek8Var, i, 5);
        }
    }

    public static final void f(j4b j4bVar, i4b i4bVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1756906796);
        int i2 = i | (p65Var.f(j4bVar) ? 4 : 2) | (p65Var.f(i4bVar) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                uta utaVar = new uta(0, i4bVar, h4b.class, "onDismissed", "onDismissed()V", 0, 3);
                p65Var.j0(utaVar);
                objM = utaVar;
            }
            m45 m45Var = (m45) ((qh6) objM);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new qna(9);
                p65Var.j0(objM2);
            }
            r28Var2 = o28.b;
            vv2.r(m45Var, bgf.N(wxb.a(r28Var2, false, (x45) objM2), "remove_note_confirmation"), pxf.E(-190651036, new qg9(i4bVar, 12, j4bVar), p65Var), p65Var, 384);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 25, j4bVar, i4bVar, r28Var2);
        }
    }

    public static final void g(j4b j4bVar, h4b h4bVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(110502324);
        int i2 = i | (p65Var2.f(j4bVar) ? 4 : 2) | (p65Var2.f(h4bVar) ? 32 : 16) | 384;
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            v7c v7cVarF = t18.f(6, 2, p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var2);
                p65Var2.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            boolean zH = p65Var2.h(sb2Var) | p65Var2.f(v7cVarF) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var2.M();
            if (zH || objM2 == uobVar) {
                objM2 = new ks0(sb2Var, v7cVarF, h4bVar);
                p65Var2.j0(objM2);
            }
            mz1 mz1VarE = pxf.E(-1437855248, new ov2(j4bVar, sb2Var, v7cVarF, h4bVar, 19), p65Var2);
            p65Var = p65Var2;
            o28 o28Var = o28.b;
            qq7.a((m45) objM2, o28Var, v7cVarF, mz1VarE, p65Var, 3120, 0);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 24, j4bVar, h4bVar, r28Var2);
        }
    }

    public static Object h(jrg jrgVar) throws InterruptedException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            ygf.f("Must not be called on the main application thread");
            return null;
        }
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper != null && Objects.equals(looperMyLooper.getThread().getName(), "GoogleApiHandler")) {
            ygf.f("Must not be called on GoogleApiHandler thread.");
            return null;
        }
        q("Task must not be null", jrgVar);
        if (jrgVar.j()) {
            return I(jrgVar);
        }
        blf blfVar = new blf();
        Executor executor = yfd.b;
        jrgVar.e(executor, blfVar);
        jrgVar.d(executor, blfVar);
        jrgVar.b.h(new l6g(executor, (kq8) blfVar));
        jrgVar.r();
        blfVar.a.await();
        return I(jrgVar);
    }

    public static Object i(jrg jrgVar, long j, TimeUnit timeUnit) throws TimeoutException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            ygf.f("Must not be called on the main application thread");
            return null;
        }
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper != null && Objects.equals(looperMyLooper.getThread().getName(), "GoogleApiHandler")) {
            ygf.f("Must not be called on GoogleApiHandler thread.");
            return null;
        }
        q("Task must not be null", jrgVar);
        q("TimeUnit must not be null", timeUnit);
        if (jrgVar.j()) {
            return I(jrgVar);
        }
        blf blfVar = new blf();
        Executor executor = yfd.b;
        jrgVar.e(executor, blfVar);
        jrgVar.d(executor, blfVar);
        jrgVar.b.h(new l6g(executor, (kq8) blfVar));
        jrgVar.r();
        if (blfVar.a.await(j, timeUnit)) {
            return I(jrgVar);
        }
        throw new TimeoutException("Timed out waiting for Task");
    }

    public static jrg j(Executor executor, Callable callable) {
        q("Executor must not be null", executor);
        jrg jrgVar = new jrg();
        executor.execute(new p0g(jrgVar, 29, callable));
        return jrgVar;
    }

    public static void k(String str, boolean z) {
        if (z) {
            return;
        }
        ay0.e(str);
    }

    public static void l(boolean z) {
        if (z) {
            return;
        }
        lg8.r();
    }

    public static void m(Handler handler) {
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper != handler.getLooper()) {
            String name = looperMyLooper != null ? looperMyLooper.getThread().getName() : "null current looper";
            String name2 = handler.getLooper().getThread().getName();
            StringBuilder sb = new StringBuilder(String.valueOf(name).length() + String.valueOf(name2).length() + 35 + 1);
            ka1.C(sb, "Must be called on ", name2, " thread, but got ", name);
            lg8.v(sb, ".");
        }
    }

    public static void n(String str) {
        if (TextUtils.isEmpty(str)) {
            ay0.e("Given String is empty or null");
        }
    }

    public static void o(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            ay0.e(str2);
        }
    }

    public static void p(Object obj) {
        if (obj != null) {
            return;
        }
        z72.c("null reference");
    }

    public static void q(String str, Object obj) {
        if (obj != null) {
            return;
        }
        z72.c(str);
    }

    public static void r(String str, boolean z) {
        if (z) {
            return;
        }
        ygf.f(str);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String s(defpackage.s55 r5, int r6) {
        /*
            pz1 r0 = defpackage.pz1.s
            r1 = r6 & 1
            r2 = 0
            r3 = 1
            if (r1 == 0) goto La
            r1 = r3
            goto Lb
        La:
            r1 = r2
        Lb:
            r6 = r6 & 2
            if (r6 == 0) goto L10
            r2 = r3
        L10:
            r5.getClass()
            java.lang.StringBuilder r6 = new java.lang.StringBuilder
            r6.<init>()
            if (r2 == 0) goto L32
            boolean r2 = r5 instanceof defpackage.p72
            if (r2 == 0) goto L21
            java.lang.String r2 = "<init>"
            goto L2f
        L21:
            r2 = r5
            zv2 r2 = (defpackage.zv2) r2
            n98 r2 = r2.getName()
            java.lang.String r2 = r2.b()
            r2.getClass()
        L2f:
            r6.append(r2)
        L32:
            java.lang.String r2 = "("
            r6.append(r2)
            yq6 r2 = r5.P()
            if (r2 == 0) goto L4c
            mn6 r2 = r2.getType()
            rwd r3 = defpackage.rwd.i
            java.lang.Object r2 = defpackage.hlg.H(r2, r3, r0)
            mg6 r2 = (defpackage.mg6) r2
            r6.append(r2)
        L4c:
            java.util.List r2 = r5.I()
            java.util.Iterator r2 = r2.iterator()
        L54:
            boolean r3 = r2.hasNext()
            if (r3 == 0) goto L73
            java.lang.Object r3 = r2.next()
            lqe r3 = (defpackage.lqe) r3
            mn6 r3 = r3.getType()
            r3.getClass()
            rwd r4 = defpackage.rwd.i
            java.lang.Object r3 = defpackage.hlg.H(r3, r4, r0)
            mg6 r3 = (defpackage.mg6) r3
            r6.append(r3)
            goto L54
        L73:
            java.lang.String r2 = ")"
            r6.append(r2)
            if (r1 == 0) goto Lb9
            boolean r1 = r5 instanceof defpackage.p72
            if (r1 == 0) goto L7f
            goto La1
        L7f:
            mn6 r1 = r5.getReturnType()
            r1.getClass()
            n98 r2 = defpackage.vm6.e
            z05 r2 = defpackage.lnc.d
            boolean r1 = defpackage.vm6.D(r1, r2)
            if (r1 == 0) goto La7
            mn6 r1 = r5.getReturnType()
            r1.getClass()
            boolean r1 = defpackage.nxd.e(r1)
            if (r1 != 0) goto La7
            boolean r1 = r5 instanceof defpackage.s4a
            if (r1 != 0) goto La7
        La1:
            java.lang.String r5 = "V"
            r6.append(r5)
            goto Lb9
        La7:
            mn6 r5 = r5.getReturnType()
            r5.getClass()
            rwd r1 = defpackage.rwd.i
            java.lang.Object r5 = defpackage.hlg.H(r5, r1, r0)
            mg6 r5 = (defpackage.mg6) r5
            r6.append(r5)
        Lb9:
            java.lang.String r5 = r6.toString()
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vp7.s(s55, int):java.lang.String");
    }

    public static final String t(c41 c41Var) {
        if (!d93.n(c41Var)) {
            yv2 yv2VarH = c41Var.h();
            y28 y28Var = yv2VarH instanceof y28 ? (y28) yv2VarH : null;
            if (y28Var != null && !y28Var.getName().b) {
                c41 c41VarA = c41Var.x0();
                bec becVar = c41VarA instanceof bec ? (bec) c41VarA : null;
                if (becVar != null) {
                    String strS = s(becVar, 3);
                    String str = s96.a;
                    mn1 mn1VarG = s96.g(f93.g(y28Var).a);
                    return ev6.r('.', mn1VarG != null ? te6.e(mn1VarG) : hlg.t(y28Var, wz7.i), strS);
                }
            }
        }
        return null;
    }

    public static final Collection u(Collection collection, Collection collection2) {
        collection2.getClass();
        if (collection2.isEmpty()) {
            return collection;
        }
        if (collection == null) {
            return collection2;
        }
        if (collection instanceof LinkedHashSet) {
            ((LinkedHashSet) collection).addAll(collection2);
            return collection;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet(collection);
        linkedHashSet.addAll(collection2);
        return linkedHashSet;
    }

    public static u5e v(byte[] bArr) {
        return new u5e(0, ByteBuffer.wrap(bArr, 0, bArr.length).slice());
    }

    public static jrg w(Exception exc) {
        jrg jrgVar = new jrg();
        jrgVar.o(exc);
        return jrgVar;
    }

    public static jrg x(Object obj) {
        jrg jrgVar = new jrg();
        jrgVar.m(obj);
        return jrgVar;
    }

    public static final String y(s55 s55Var) {
        n98 n98Var;
        f41 f41VarZ = vm6.z(s55Var) ? z(s55Var) : null;
        if (f41VarZ != null) {
            f41 f41VarI = f93.i(f41VarZ);
            if (f41VarI instanceof q4a) {
                vm6.z(f41VarI);
                f41 f41VarB = f93.b(f93.i(f41VarI), xx.s);
                if (f41VarB != null && (n98Var = (n98) b11.a.get(f93.g(f41VarB))) != null) {
                    return n98Var.b();
                }
            } else if (f41VarI instanceof bec) {
                int i = z01.l;
                LinkedHashMap linkedHashMap = mlc.i;
                String strT = t((bec) f41VarI);
                n98 n98Var2 = strT == null ? null : (n98) linkedHashMap.get(strT);
                if (n98Var2 != null) {
                    return n98Var2.b();
                }
            }
        }
        return null;
    }

    public static final f41 z(f41 f41Var) {
        f41Var.getClass();
        if (!mlc.j.contains(f41Var.getName()) && !b11.d.contains(f93.i(f41Var).getName())) {
            return null;
        }
        if ((f41Var instanceof q4a) || (f41Var instanceof o4a)) {
            return f93.b(f41Var, zkc.b);
        }
        if (f41Var instanceof bec) {
            return f93.b(f41Var, zkc.c);
        }
        return null;
    }
}
