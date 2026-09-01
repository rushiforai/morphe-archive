package defpackage;

import android.content.Context;
import android.net.Uri;
import android.util.Patterns;
import android.view.MotionEvent;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.graphql.fragment.NotificationData;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Set;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class ur7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final int d = 9;
    public static final int e = 6;
    public static final int f = 10;
    public static final int g = 5;
    public static final int h = 15;

    public static boolean A(MotionEvent motionEvent, int i) {
        return (motionEvent.getSource() & i) == i;
    }

    public static final boolean B(wlb wlbVar) {
        long j = wlbVar.e;
        return (j >>> 32) == (4294967295L & j) && j == wlbVar.f && j == wlbVar.g && j == wlbVar.h;
    }

    public static void C(z46 z46Var) {
        xpc xpcVar;
        t89 t89Var;
        t89 t89Var2;
        do {
            xpcVar = swa.z;
            t89Var = (t89) xpcVar.getValue();
            k89 k89VarA = t89Var.c;
            c17 c17Var = (c17) k89VarA.get(z46Var);
            if (c17Var == null) {
                t89Var2 = t89Var;
            } else {
                Object obj = c17Var.a;
                Object obj2 = c17Var.b;
                zsd zsdVar = k89VarA.a;
                zsd zsdVarV = zsdVar.v(z46Var != null ? z46Var.hashCode() : 0, 0, z46Var);
                if (zsdVar != zsdVarV) {
                    k89VarA = zsdVarV == null ? k89.c : new k89(zsdVarV, k89VarA.b - 1);
                }
                fa4 fa4Var = fa4.j;
                if (obj != fa4Var) {
                    Object obj3 = k89VarA.get(obj);
                    obj3.getClass();
                    k89VarA = k89VarA.a(obj, new c17(((c17) obj3).a, obj2));
                }
                if (obj2 != fa4Var) {
                    Object obj4 = k89VarA.get(obj2);
                    obj4.getClass();
                    k89VarA = k89VarA.a(obj2, new c17(obj, ((c17) obj4).b));
                }
                Object obj5 = obj != fa4Var ? t89Var.a : obj2;
                if (obj2 != fa4Var) {
                    obj = t89Var.b;
                }
                t89Var2 = new t89(obj5, obj, k89VarA);
            }
            if (t89Var == t89Var2) {
                return;
            }
        } while (!xpcVar.k(t89Var, t89Var2));
    }

    public static final Object D(Set set, Enum r2, Enum r3, Enum r4, boolean z) {
        if (!z) {
            if (r4 != null) {
                set = bu1.q1(qo7.w(set, r4));
            }
            return bu1.b1(set);
        }
        Enum r1 = set.contains(r2) ? r2 : set.contains(r3) ? r3 : null;
        if (g76.L(r1, r2) && g76.L(r4, r3)) {
            return null;
        }
        return r4 == null ? r1 : r4;
    }

    public static final String E(NotificationData notificationData) {
        notificationData.getClass();
        return "notification:" + notificationData.getNotificationType() + ":" + notificationData.getOccurredAt();
    }

    public static final void F(String str, StringBuilder sb) {
        if (sb.length() > 0) {
            sb.append('+');
        }
        sb.append(str);
    }

    public static String J(ylf ylfVar) throws GeneralSecurityException {
        int iOrdinal = ylfVar.ordinal();
        if (iOrdinal == 0) {
            return "SHA-1";
        }
        if (iOrdinal == 1) {
            return "SHA-224";
        }
        if (iOrdinal == 2) {
            return "SHA-256";
        }
        if (iOrdinal == 3) {
            return "SHA-384";
        }
        if (iOrdinal == 4) {
            return "SHA-512";
        }
        throw new GeneralSecurityException("Unsupported hash ".concat(ylfVar.toString()));
    }

    public static final void a(Object obj, String str, r28 r28Var, xd xdVar, w82 w82Var, float f2, bs0 bs0Var, int i, x12 x12Var, int i2, int i3) {
        p65 p65Var = (p65) x12Var;
        int i4 = i2 << 3;
        gx1.d(obj, str, yec.a((Context) p65Var.j(eo.b)), r28Var, (i3 & 32) != 0 ? z46.h : xdVar, (i3 & 64) != 0 ? v82.b : w82Var, (i3 & 128) != 0 ? 1.0f : f2, (i3 & 256) != 0 ? null : bs0Var, (i3 & 512) != 0 ? 1 : i, p65Var, (i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER) | (i4 & 7168) | (57344 & i4) | (458752 & i4) | (3670016 & i4) | (29360128 & i4) | (234881024 & i4) | (i4 & 1879048192), (i2 >> 27) & 14, 0);
    }

    public static final void b(Object obj, String str, r28 r28Var, c09 c09Var, c09 c09Var2, c09 c09Var3, x45 x45Var, x45 x45Var2, x45 x45Var3, ar0 ar0Var, x12 x12Var, int i, int i2, int i3) {
        c09 c09Var4 = (i3 & 8) != 0 ? null : c09Var;
        c09 c09Var5 = (i3 & 16) != 0 ? null : c09Var2;
        c09 c09Var6 = (i3 & 32) != 0 ? c09Var5 : c09Var3;
        x45 x45Var4 = (i3 & 64) != 0 ? null : x45Var;
        x45 x45Var5 = (i3 & 128) != 0 ? null : x45Var2;
        x45 x45Var6 = (i3 & 256) != 0 ? null : x45Var3;
        ar0 ar0Var2 = (i3 & 512) != 0 ? z46.h : ar0Var;
        w82 w82Var = (i3 & 1024) != 0 ? v82.b : v82.a;
        p65 p65Var = (p65) x12Var;
        gx5 gx5VarA = yec.a((Context) p65Var.j(eo.b));
        int i4 = (i2 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
        n90 n90Var = new n90(obj, (z80) p65Var.j(t57.a), gx5VarA);
        int i5 = ppe.b;
        gx1.c(n90Var, str, r28Var, (c09Var4 == null && c09Var5 == null && c09Var6 == null) ? g90.v : new pi9(c09Var4, c09Var6, c09Var5, 24), (x45Var4 == null && x45Var5 == null && x45Var6 == null) ? null : new pi9(x45Var4, x45Var5, x45Var6, 25), ar0Var2, w82Var, 1.0f, null, 1, true, p65Var, (i4 << 15) & 3670016, 0);
    }

    public static final void c(hia hiaVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1750843102);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(hiaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            hp7.o(hiaVar.c, hl0.L, null, null, null, 0.0f, 0, null, null, p65Var, 48, 2044);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s8(i, 8, hiaVar);
        }
    }

    public static final void d(hia hiaVar, cv9 cv9Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(438304222);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(hiaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var.f(cv9Var) : p65Var.h(cv9Var) ? 32 : 16;
        }
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarY = r40.y(bgf.N(o28.b, "cta_publication_header_pictures"), rv8.r);
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i2 & 64) != 0 && p65Var.h(cv9Var));
            int i4 = i2 & 14;
            boolean z2 = (i4 == 4) | z;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new cia(cv9Var, hiaVar, i3);
                p65Var.j0(objM);
            }
            r28 r28VarR = hlg.r(r28VarY, false, null, null, (m45) objM, 15);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i5 = (int) ((j >>> 32) ^ j);
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            c(hiaVar, p65Var, i4);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dia(hiaVar, cv9Var, i, i3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:75:0x02a9  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x02ab  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x02b3  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x02b7  */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3, types: [boolean] */
    /* JADX WARN: Type inference failed for: r1v4 */
    /* JADX WARN: Type inference failed for: r21v2, types: [x12] */
    /* JADX WARN: Type inference failed for: r21v3, types: [x12] */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v15 */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v17 */
    /* JADX WARN: Type inference failed for: r3v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r3v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r3v5, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r3v6, types: [p65] */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(defpackage.hia r46, defpackage.cv9 r47, defpackage.x12 r48, int r49) {
        /*
            Method dump skipped, instruction units count: 808
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ur7.e(hia, cv9, x12, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x016e  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0198  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(java.lang.String r50, java.lang.String r51, long r52, defpackage.r28 r54, defpackage.x12 r55, int r56) {
        /*
            Method dump skipped, instruction units count: 577
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ur7.f(java.lang.String, java.lang.String, long, r28, x12, int):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v3, types: [boolean] */
    /* JADX WARN: Type inference failed for: r0v5 */
    public static final void g(kx8 kx8Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        kx8 kx8Var2;
        int i3;
        r28 r28Var2;
        p65 p65Var;
        ?? r0;
        p65 p65Var2;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(-502908625);
        if ((i & 6) == 0) {
            i2 = i | (p65Var3.f(kx8Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        int i4 = i2 | 48;
        if (p65Var3.P(i4 & 1, (i4 & 19) != 18)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
            long j = p65Var3.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var3.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var3, o28Var);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var);
            } else {
                p65Var3.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var3, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var3, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var3, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var3, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var3, cuVar4, r28VarR);
            o28 o28Var2 = o28Var;
            jjd.b(vo7.R(p65Var3, R.string.post_stats_overview_impact_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.w(p65Var3), p65Var3, 0, 0, 131070);
            p65 p65Var4 = p65Var3;
            hp7.t(p65Var4, jfc.l(o28Var2, 32.0f));
            if (kx8Var.g != null) {
                p65Var4.Y(1551560319);
                jjd.b(kx8Var.g, bgf.N(o28Var2, "earnings_amount"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.w(p65Var4), p65Var4, 48, 0, 131068);
                omb ombVarA = nmb.a(new h70(4.0f, true, new z10(21)), z46.n, p65Var4, 54);
                long j2 = p65Var4.T;
                int i6 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var4.l();
                r28 r28VarR2 = gx1.R(p65Var4, o28Var2);
                p65Var4.c0();
                if (p65Var4.S) {
                    p65Var4.k(m45Var);
                } else {
                    p65Var4.m0();
                }
                tp7.B(p65Var4, cuVar, ombVarA);
                tp7.B(p65Var4, cuVar2, i89VarL2);
                ka1.z(i6, p65Var4, cuVar3, p65Var4, fnVar);
                tp7.B(p65Var4, cuVar4, r28VarR2);
                r0 = 1;
                jjd.b(vo7.R(p65Var4, R.string.stats_earnings), bgf.N(o28Var2, "earnings_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var4.j(jt7.c)).l, p65Var4, 48, 0, 131068);
                vx0.p(vo7.R(p65Var4, R.string.stats_updated_daily), null, 0L, p65Var4, 0, 14);
                ka1.B(p65Var4, true, o28Var2, 8.0f, p65Var4);
                jjd.b(vo7.R(p65Var4, R.string.post_stats_overview_impact_earnings_description), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.v(p65Var4), p65Var4, 0, 0, 131070);
                p65 p65Var5 = p65Var4;
                i3 = 0;
                lv8.y(o28Var2, 32.0f, p65Var5, false);
                p65Var2 = p65Var5;
            } else {
                r0 = 1;
                i3 = 0;
                p65Var4.Y(1542282205);
                p65Var4.p(false);
                p65Var2 = p65Var4;
            }
            String strR = vo7.R(p65Var2, R.string.stats_followers);
            kx8Var2 = kx8Var;
            long j3 = kx8Var2.h;
            int i7 = (int) j3;
            Long lValueOf = Long.valueOf(j3);
            Long lValueOf2 = Long.valueOf(kx8Var2.i);
            Object[] objArr = new Object[2];
            objArr[i3] = lValueOf;
            objArr[r0] = lValueOf2;
            f(strR, vo7.D(R.plurals.post_stats_overview_impact_followers_description, i7, objArr, p65Var2), kx8Var2.j, null, p65Var2, 0);
            String strN = y30.n(24.0f, R.string.stats_subscribers, p65Var2, p65Var2, o28Var2);
            long j4 = kx8Var2.k;
            int i8 = (int) j4;
            Long lValueOf3 = Long.valueOf(j4);
            Long lValueOf4 = Long.valueOf(kx8Var2.l);
            Object[] objArr2 = new Object[2];
            objArr2[i3] = lValueOf3;
            objArr2[r0] = lValueOf4;
            f(strN, vo7.D(R.plurals.post_stats_overview_impact_subscribers_description, i8, objArr2, p65Var2), kx8Var2.m, null, p65Var2, 0);
            p65Var2.p(r0);
            r28Var2 = o28Var2;
            p65Var = p65Var2;
        } else {
            kx8Var2 = kx8Var;
            i3 = 0;
            p65Var3.S();
            r28Var2 = r28Var;
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hx8(kx8Var2, r28Var2, i, i3);
        }
    }

    public static final void h(kx8 kx8Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        String strW;
        jx8 jx8Var = kx8Var.n;
        Long l = kx8Var.a;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-647865925);
        int i3 = i | (p65Var.f(kx8Var) ? 4 : 2) | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.E(o28Var, 24.0f, 0.0f, 2), "overview_stats_section");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            r28Var2 = o28Var;
            jjd.b(vo7.R(p65Var, R.string.stats_lifetime), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.u(p65Var), p65Var, 0, 0, 131070);
            if (l != null && jx8Var == jx8.Hourly) {
                p65Var.Y(1792480248);
                strW = vo7.Q(R.string.stats_from_to_utc_updated_hourly, new Object[]{vo7.v(l.longValue(), p65Var), vo7.R(p65Var, R.string.common_today)}, p65Var);
                p65Var.p(false);
            } else if (l == null || jx8Var != jx8.Daily) {
                strW = km4.w(p65Var, 1792500093, R.string.stats_updated_daily, p65Var, false);
            } else {
                p65Var.Y(1792491703);
                strW = vo7.Q(R.string.stats_from_to_utc_updated_daily, new Object[]{vo7.v(l.longValue(), p65Var), vo7.R(p65Var, R.string.common_today)}, p65Var);
                p65Var.p(false);
            }
            hp7.t(p65Var, jfc.l(r28Var2, 4.0f));
            jjd.b(strW, bgf.N(r28Var2, "overview_stats_description"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.t(p65Var), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(r28Var2, 40.0f));
            int i5 = i3 & 14;
            s(kx8Var, null, p65Var, i5);
            hp7.t(p65Var, jfc.l(r28Var2, 32.0f));
            g(kx8Var, null, p65Var, i5);
            i2 = 1;
            p65Var.p(true);
        } else {
            i2 = 1;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(kx8Var, r28Var2, i, i2);
        }
    }

    public static final void i(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        r28 r28Var2;
        long j3;
        r28 r28Var3;
        yq0 yq0Var = z46.p;
        rz5 rz5Var = qb8.c;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(564102200);
        int i2 = i | 22;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            int i3 = i & 1;
            o28 o28Var = o28.b;
            if (i3 == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).c;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                j3 = j;
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarE = w2g.E(m40.V(r28Var3, p65Var, 6), 24.0f, 0.0f, 2);
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j4 = p65Var.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            p65Var.Y(1953470692);
            ok7.r(98.0f, 48, 4, j3, p65Var, null, to7.u(p65Var));
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            ok7.r(322.0f, 48, 4, j3, p65Var, null, to7.t(p65Var));
            hp7.t(p65Var, jfc.l(o28Var, 40.0f));
            ok7.r(114.0f, 48, 4, j3, p65Var, null, to7.w(p65Var));
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            ok7.r(Float.POSITIVE_INFINITY, 48, 4, j3, p65Var, null, to7.v(p65Var));
            float f2 = 32.0f;
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            r28 r28VarB = bo.B(jfc.d(o28Var, 1.0f), 1.0f, j3, bmb.a(16.0f));
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarB);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            p65Var.Y(2082569550);
            int i6 = 0;
            while (i6 < 3) {
                r28 r28VarC = w2g.C(o28Var, f2);
                wv1 wv1VarA3 = uv1.a(rz5Var, yq0Var, p65Var, 0);
                long j6 = p65Var.T;
                int i7 = (int) (j6 ^ (j6 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarC);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, wv1VarA3);
                tp7.B(p65Var, q12.e, i89VarL3);
                tp7.B(p65Var, q12.g, Integer.valueOf(i7));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR3);
                sn3 sn3Var = jt7.c;
                char c2 = '0';
                float f3 = 1.0f;
                ok7.r(76.0f, 48, 4, j3, p65Var, null, ((bu7) p65Var.j(sn3Var)).g);
                ok7.r(98.0f, 48, 4, j3, p65Var, null, ((bu7) p65Var.j(sn3Var)).l);
                ok7.r(260.0f, 48, 4, j3, p65Var, null, ((bu7) lv8.n(o28Var, 16.0f, p65Var, sn3Var)).l);
                ok7.r(58.0f, 48, 4, j3, p65Var, null, ((bu7) lv8.n(o28Var, 16.0f, p65Var, sn3Var)).l);
                p65Var.Y(886830039);
                int i8 = 0;
                while (i8 < 2) {
                    zq0 zq0Var = z46.n;
                    h70 h70Var = new h70(8.0f, true, new z10(21));
                    r28 r28VarD = jfc.d(o28Var, f3);
                    omb ombVarA = nmb.a(h70Var, zq0Var, p65Var, 54);
                    long j7 = p65Var.T;
                    int i9 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL4 = p65Var.l();
                    r28 r28VarR4 = gx1.R(p65Var, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var3);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, ombVarA);
                    tp7.B(p65Var, q12.e, i89VarL4);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i9));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR4);
                    r28 r28VarL = jfc.l(o28Var, 16.0f);
                    nr5 nr5Var = rv8.r;
                    dy0.a(flb.a0(r28VarL, j3, nr5Var), p65Var, 0);
                    ok7.r(112.0f, 48, 4, j3, p65Var, null, ((bu7) p65Var.j(jt7.c)).l);
                    dy0.a(flb.a0(jfc.l(o28Var, 16.0f), j3, nr5Var), p65Var, 0);
                    p65Var.p(true);
                    i8++;
                    yq0Var = yq0Var;
                    c2 = '0';
                    f3 = 1.0f;
                }
                yq0 yq0Var2 = yq0Var;
                p65Var.p(false);
                p65Var.p(true);
                if (i6 < 2) {
                    p65Var.Y(-1644589407);
                    r(0.0f, 0, 5, j3, p65Var, null);
                } else {
                    p65Var.Y(-1661337932);
                }
                p65Var.p(false);
                i6++;
                yq0Var = yq0Var2;
                f2 = 32.0f;
            }
            ho2.N(p65Var, false, true, false, true);
            j2 = j3;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            j2 = j;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j2, i, 14);
        }
    }

    public static final void j(final zd9 zd9Var, final ek8 ek8Var, x12 x12Var, int i) {
        int i2;
        final int i3;
        String str = zd9Var.f;
        String str2 = zd9Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1352778771);
        int i4 = (p65Var.f(zd9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            String str3 = zd9Var.e;
            boolean z = zd9Var.a;
            kx kxVarW = ho2.w(p65Var, -1354681930);
            String strA = af1.a(zd9Var.h, p65Var);
            final int i5 = 1;
            String strQ = vo7.Q(R.string.notification_type_post_added_to_catalog, new Object[]{str2, str, strA}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str2, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str2.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2, str.length() + iZ2);
                i2 = 6;
                int iZ3 = muc.Z(strQ, strA, 0, false, 6);
                mx mxVarC = ka1.c(strA, iZ3, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ3);
                p65Var.p(false);
                long j = zd9Var.b;
                int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i7 = i4 & 14;
                boolean z2 = (i6 == 32) | (i7 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    i3 = 0;
                    objM = new m45() { // from class: ae9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i8 = i3;
                            c1e c1eVar = c1e.a;
                            zd9 zd9Var2 = zd9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i8) {
                                case 0:
                                    ek8Var2.o(zd9Var2.g, zd9Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(zd9Var2.c, zd9Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                } else {
                    i3 = 0;
                }
                m45 m45Var = (m45) objM;
                int i8 = i6 == 32 ? 1 : i3;
                if (i7 == 4) {
                    i3 = 1;
                }
                int i9 = i8 | i3;
                Object objM2 = p65Var.M();
                if (i9 != 0 || objM2 == uobVar) {
                    objM2 = new m45() { // from class: ae9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i82 = i5;
                            c1e c1eVar = c1e.a;
                            zd9 zd9Var2 = zd9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i82) {
                                case 0:
                                    ek8Var2.o(zd9Var2.g, zd9Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(zd9Var2.c, zd9Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str3, null, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 36);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            i2 = 6;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(zd9Var, ek8Var, i, i2);
        }
    }

    public static final void k(hia hiaVar, cv9 cv9Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2080247539);
        int i3 = 2;
        if ((i & 6) == 0) {
            i2 = (p65Var.f(hiaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var.f(cv9Var) : p65Var.h(cv9Var) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarG = w2g.G(jfc.d(o28.b, 1.0f), 24.0f, 0.0f, 24.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.o, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i5 = i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
            d(hiaVar, cv9Var, p65Var, i5);
            hp7.t(p65Var, new sq6(1.0f, true));
            m(hiaVar, (bt4) guc.x(hiaVar.f, bt4.NOT_FOLLOWING, p65Var, 48).getValue(), cv9Var, p65Var, ((i2 << 3) & 896) | (i2 & 14));
            v(hiaVar, cv9Var, p65Var, i5);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dia(hiaVar, cv9Var, i, i3);
        }
    }

    public static final void m(hia hiaVar, bt4 bt4Var, cv9 cv9Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1182843318);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(hiaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.d(bt4Var.ordinal()) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= (i & 512) == 0 ? p65Var.f(cv9Var) : p65Var.h(cv9Var) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            int i3 = fia.a[bt4Var.ordinal()];
            if (i3 == 1 || i3 == 2) {
                p65Var.Y(1453913336);
                boolean z = bt4Var == bt4.FOLLOWING;
                tw8 tw8Var = tw8.M;
                int i4 = i2 & 896;
                int i5 = i2 & 14;
                boolean z2 = (i4 == 256 || ((i2 & 512) != 0 && p65Var.h(cv9Var))) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new cia(cv9Var, hiaVar, i);
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i6 = ((i4 == 256 || ((i2 & 512) != 0 && p65Var.h(cv9Var))) ? 1 : 0) | (i5 != 4 ? 0 : 1);
                Object objM2 = p65Var.M();
                if (i6 != 0 || objM2 == uobVar) {
                    objM2 = new cia(cv9Var, hiaVar, 2);
                    p65Var.j0(objM2);
                }
                pr7.f(z, tw8Var, m45Var, (m45) objM2, null, false, p65Var, 48, 48);
                p65Var.p(false);
            } else {
                if (i3 != 3 && i3 != 4) {
                    throw ho2.L(p65Var, 1453910261, false);
                }
                p65Var.Y(1453935086);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 18, hiaVar, bt4Var, cv9Var);
        }
    }

    public static final void n(hia hiaVar, cv9 cv9Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-384169013);
        int i2 = i | (p65Var.f(hiaVar) ? 4 : 2) | (p65Var.f(cv9Var) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new mr9(26);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), wxb.a(o28Var, false, (x45) objM), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            o(hiaVar, cv9Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 14, hiaVar, cv9Var, r28Var2);
        }
    }

    public static final void o(hia hiaVar, cv9 cv9Var, x12 x12Var, int i) {
        int i2;
        cv9 cv9Var2;
        SourceParameter sourceParameter = hiaVar.j;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1920207741);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(hiaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var.f(cv9Var) : p65Var.h(cv9Var) ? 32 : 16;
        }
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarD = jfc.d(o28.b, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
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
            int i5 = i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
            k(hiaVar, cv9Var, p65Var, i5);
            String str = hiaVar.b;
            String str2 = hiaVar.d;
            cv9Var2 = cv9Var;
            p(str, hiaVar.a, sourceParameter, cv9Var2, p65Var, (i2 << 6) & 7168);
            if (hiaVar.e != null) {
                p65Var.Y(1881146108);
                e(hiaVar, cv9Var2, p65Var, i5);
            } else {
                p65Var.Y(1878167163);
            }
            p65Var.p(false);
            if (str2 == null || muc.b0(str2)) {
                p65Var.Y(1878167163);
            } else {
                p65Var.Y(1881314345);
                l(str2, sourceParameter, cv9Var2, p65Var, (i2 << 3) & 896);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            cv9Var2 = cv9Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dia(hiaVar, cv9Var2, i, i3);
        }
    }

    public static final void p(String str, String str2, SourceParameter sourceParameter, cv9 cv9Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1169696356);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(str) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(str2) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(sourceParameter) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= (i & 4096) == 0 ? p65Var2.f(cv9Var) : p65Var2.h(cv9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            r28 r28VarG = w2g.G(jfc.d(o28.b, 1.0f), 24.0f, 16.0f, 24.0f, 0.0f, 8);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
            long j = p65Var2.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String strR = vo7.R(p65Var2, R.string.author_header_collection);
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var2.j(sn3Var)).j;
            String strW = null;
            boolean z = false;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var2, 0, 0, 131070);
            if (str != null && !muc.b0(str)) {
                strW = str;
            }
            if (strW == null) {
                strW = km4.w(p65Var2, -874975630, R.string.common_unknown_collection, p65Var2, false);
            } else {
                p65Var2.Y(-874976746);
                p65Var2.p(false);
            }
            r28 r28VarY = r40.y(new sq6(1.0f, false), bmb.a(4.0f));
            boolean z2 = ((i2 & 7168) == 2048 || ((i2 & 4096) != 0 && p65Var2.h(cv9Var))) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            if ((i2 & 896) == 256) {
                z = true;
            }
            boolean z3 = z | z2;
            Object objM = p65Var2.M();
            if (z3 || objM == w12.a) {
                objM = new i16(cv9Var, str2, sourceParameter, 18);
                p65Var2.j0(objM);
            }
            jjd.b(strW, bgf.N(w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 4.0f, 2.0f, 4.0f, 2.0f), "cta_author_name"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var2.j(sn3Var)).j, p65Var2, 0, 24960, 110588);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 10, str, str2, sourceParameter, cv9Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v8 */
    public static final void q(final Long l, final int i, int i2, r28 r28Var, String str, String str2, String str3, x12 x12Var, final int i3, final int i4) {
        String str4;
        int i5;
        String str5;
        int i6;
        String str6;
        int i7;
        final String str7;
        final String str8;
        final String str9;
        final r28 r28Var2;
        p65 p65Var;
        zq0 zq0Var;
        String str10;
        o28 o28Var;
        cu cuVar;
        fn fnVar;
        cu cuVar2;
        m45 m45Var;
        cu cuVar3;
        cu cuVar4;
        String str11;
        ?? r0;
        p65 p65Var2;
        String str12;
        final int i8 = i2;
        zq0 zq0Var2 = z46.n;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(1683741438);
        int i9 = i3 | (p65Var3.f(l) ? 4 : 2) | (p65Var3.d(i) ? 32 : 16) | (p65Var3.d(i8) ? 256 : 128);
        int i10 = i9 | 3072;
        int i11 = i4 & 16;
        if (i11 != 0) {
            i5 = i9 | 27648;
            str4 = str;
        } else {
            str4 = str;
            i5 = i10 | (p65Var3.f(str4) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        }
        int i12 = i4 & 32;
        if (i12 != 0) {
            i6 = i5 | 196608;
            str5 = str2;
        } else {
            str5 = str2;
            i6 = i5 | (p65Var3.f(str5) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        }
        int i13 = i4 & 64;
        if (i13 != 0) {
            i7 = i6 | 1572864;
            str6 = str3;
        } else {
            str6 = str3;
            i7 = i6 | (p65Var3.f(str6) ? 1048576 : 524288);
        }
        int i14 = i7;
        if (p65Var3.P(i14 & 1, (i14 & 599187) != 599186)) {
            if (i11 != 0) {
                str4 = null;
            }
            String str13 = i12 != 0 ? null : str5;
            String str14 = i13 != 0 ? null : str6;
            o28 o28Var2 = o28.b;
            r28 r28VarN = bgf.N(w2g.C(jfc.d(o28Var2, 1.0f), 24.0f), "reach_funnel_item");
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j = p65Var3.T;
            int i15 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarN);
            r12.W.getClass();
            m45 m45Var2 = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var2);
            } else {
                p65Var3.m0();
            }
            cu cuVar5 = q12.f;
            tp7.B(p65Var3, cuVar5, zk7VarC);
            cu cuVar6 = q12.e;
            tp7.B(p65Var3, cuVar6, i89VarL);
            Integer numValueOf = Integer.valueOf(i15);
            cu cuVar7 = q12.g;
            tp7.B(p65Var3, cuVar7, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var3, fnVar2);
            cu cuVar8 = q12.d;
            tp7.B(p65Var3, cuVar8, r28VarR);
            if (str4 != null) {
                p65Var3.Y(-427498682);
                String str15 = str4;
                r28 r28VarC = w2g.C(flb.a0(iy0.a.a(o28Var2, z46.f), ((zo7) p65Var3.j(kt7.b)).c, bmb.a(4.0f)), 8.0f);
                zk7 zk7VarC2 = dy0.c(ar0Var, false);
                long j2 = p65Var3.T;
                int i16 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var3.l();
                r28 r28VarR2 = gx1.R(p65Var3, r28VarC);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(m45Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar5, zk7VarC2);
                tp7.B(p65Var3, cuVar6, i89VarL2);
                ka1.z(i16, p65Var3, cuVar7, p65Var3, fnVar2);
                tp7.B(p65Var3, cuVar8, r28VarR2);
                omb ombVarA = nmb.a(new h70(4.0f, true, new z10(21)), zq0Var2, p65Var3, 54);
                long j3 = p65Var3.T;
                int i17 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var3.l();
                r28 r28VarR3 = gx1.R(p65Var3, o28Var2);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(m45Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar5, ombVarA);
                tp7.B(p65Var3, cuVar6, i89VarL3);
                ka1.z(i17, p65Var3, cuVar7, p65Var3, fnVar2);
                tp7.B(p65Var3, cuVar8, r28VarR3);
                cuVar = cuVar6;
                cuVar2 = cuVar7;
                cuVar3 = cuVar8;
                cuVar4 = cuVar5;
                o28Var = o28Var2;
                fnVar = fnVar2;
                zq0Var = zq0Var2;
                r0 = 0;
                m45Var = m45Var2;
                jjd.b(str15, bgf.N(o28Var2, "top_right_label"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(jt7.c)).n, p65Var3, ((i14 >> 12) & 14) | 48, 0, 131068);
                str10 = str15;
                p65 p65Var4 = p65Var3;
                if (str13 != null) {
                    p65Var4.Y(-933012819);
                    String str16 = str13;
                    vx0.p(str16, null, 0L, p65Var4, (i14 >> 15) & 14, 14);
                    str11 = str16;
                } else {
                    str11 = str13;
                    p65Var4.Y(-939820295);
                }
                p65Var4.p(false);
                b09.H(p65Var4, true, true, false);
                p65Var2 = p65Var4;
            } else {
                zq0Var = zq0Var2;
                str10 = str4;
                o28Var = o28Var2;
                cuVar = cuVar6;
                fnVar = fnVar2;
                cuVar2 = cuVar7;
                m45Var = m45Var2;
                cuVar3 = cuVar8;
                cuVar4 = cuVar5;
                str11 = str13;
                r0 = 0;
                p65Var3.Y(-433536738);
                p65Var3.p(false);
                p65Var2 = p65Var3;
            }
            r28 r28VarC2 = w2g.C(o28Var, 8.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, r0);
            long j4 = p65Var2.T;
            int i18 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarC2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar4, wv1VarA);
            cu cuVar9 = cuVar;
            tp7.B(p65Var2, cuVar9, i89VarL4);
            cu cuVar10 = cuVar2;
            fn fnVar3 = fnVar;
            ka1.z(i18, p65Var2, cuVar10, p65Var2, fnVar3);
            cu cuVar11 = cuVar3;
            tp7.B(p65Var2, cuVar11, r28VarR4);
            String strG = l != null ? dq1.g(l) : null;
            if (strG == null) {
                strG = km4.w(p65Var2, -76468987, R.string.post_stats_overview_reach_funnel_presentations_n_a, p65Var2, r0);
            } else {
                p65Var2.Y(-76471188);
                p65Var2.p(r0);
            }
            String str17 = strG;
            d8a d8aVar = jt7.c;
            p65 p65Var5 = p65Var2;
            jjd.b(str17, bgf.N(o28Var, "count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(d8aVar)).g, p65Var5, 48, 0, 131068);
            omb ombVarA2 = nmb.a(new h70(4.0f, true, new z10(21)), zq0Var, p65Var5, 54);
            long j5 = p65Var5.T;
            int i19 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL5 = p65Var5.l();
            r28 r28VarR5 = gx1.R(p65Var5, o28Var);
            p65Var5.c0();
            if (p65Var5.S) {
                p65Var5.k(m45Var);
            } else {
                p65Var5.m0();
            }
            tp7.B(p65Var5, cuVar4, ombVarA2);
            tp7.B(p65Var5, cuVar9, i89VarL5);
            ka1.z(i19, p65Var5, cuVar10, p65Var5, fnVar3);
            tp7.B(p65Var5, cuVar11, r28VarR5);
            jjd.b(vo7.R(p65Var5, i), bgf.N(o28Var, "title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var5.j(d8aVar)).l, p65Var5, 48, 0, 131068);
            if (str14 == null) {
                p65Var5.Y(523773826);
                p65Var5.p(false);
                str12 = str14;
            } else {
                p65Var5.Y(523773827);
                String str18 = str14;
                vx0.p(str18, null, 0L, p65Var5, 0, 14);
                str12 = str18;
                p65Var5.p(false);
            }
            ka1.B(p65Var5, true, o28Var, 16.0f, p65Var5);
            i8 = i2;
            jjd.b(vo7.R(p65Var5, i8), bgf.N(o28Var, "description"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var5.j(d8aVar)).l, ((zo7) p65Var5.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var5, 48, 0, 131068);
            p65 p65Var6 = p65Var5;
            p65Var6.p(true);
            p65Var6.p(true);
            r28Var2 = o28Var;
            str8 = str11;
            str9 = str12;
            str7 = str10;
            p65Var = p65Var6;
        } else {
            p65Var3.S();
            str7 = str4;
            str8 = str5;
            str9 = str6;
            r28Var2 = r28Var;
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(l, i, i8, r28Var2, str7, str8, str9, i3, i4) { // from class: ix8
                public final /* synthetic */ Long a;
                public final /* synthetic */ int b;
                public final /* synthetic */ int c;
                public final /* synthetic */ r28 d;
                public final /* synthetic */ String e;
                public final /* synthetic */ String f;
                public final /* synthetic */ String g;
                public final /* synthetic */ int h;

                {
                    this.h = i4;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    ur7.q(this.a, this.b, this.c, this.d, this.e, this.f, this.g, (x12) obj, iY, this.h);
                    return c1e.a;
                }
            };
        }
    }

    public static final void r(float f2, int i, int i2, long j, x12 x12Var, r28 r28Var) {
        long j2;
        float f3;
        r28 r28Var2;
        r28 r28Var3;
        int i3;
        float f4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1453146552);
        int i4 = i | 6;
        if ((i & 48) == 0) {
            j2 = j;
            i4 |= ((i2 & 2) == 0 && p65Var.e(j2)) ? 32 : 16;
        } else {
            j2 = j;
        }
        int i5 = i4 | 384;
        boolean z = true;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                if ((i2 & 2) != 0) {
                    j2 = ((zo7) p65Var.j(kt7.b)).z;
                    i5 &= -113;
                }
                r28Var3 = o28.b;
                i3 = i5;
                f4 = 1.0f;
            } else {
                p65Var.S();
                if ((i2 & 2) != 0) {
                    i5 &= -113;
                }
                r28Var3 = r28Var;
                i3 = i5;
                f4 = f2;
            }
            p65Var.q();
            float fZ = ((m73) p65Var.j(z22.h)).Z(f4);
            r28 r28VarE = jfc.e(jfc.d(r28Var3, 1.0f), 18.0f);
            if ((((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) <= 32 || !p65Var.e(j2)) && (i3 & 48) != 32) {
                z = false;
            }
            boolean zC = p65Var.c(fZ) | z;
            Object objM = p65Var.M();
            if (zC || objM == w12.a) {
                objM = new ki3(fZ, j2);
                p65Var.j0(objM);
            }
            pxf.a(r28VarE, (x45) objM, p65Var, 0);
            f3 = f4;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            f3 = f2;
            r28Var2 = r28Var;
        }
        long j3 = j2;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sp7(r28Var2, j3, f3, i, i2, 3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r15v4 */
    /* JADX WARN: Type inference failed for: r15v6 */
    public static final void s(kx8 kx8Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        kx8 kx8Var2;
        int i3;
        r28 r28Var2;
        int i4;
        int i5;
        String str;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-36589272);
        if ((i & 6) == 0) {
            i2 = i | (p65Var.f(kx8Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        int i6 = i2 | 48;
        if (p65Var.P(i6 & 1, (i6 & 19) != 18)) {
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j = p65Var.T;
            int i7 = (int) (j ^ (j >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i7);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var2 = o28Var;
            jjd.b(vo7.R(p65Var, R.string.post_stats_overview_reach_funnel_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.w(p65Var), p65Var, 0, 0, 131070);
            jjd.b(y30.n(4.0f, R.string.post_stats_overview_reach_funnel_description, p65Var, p65Var, o28Var2), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.v(p65Var), p65Var, 0, 0, 131070);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var2, 32.0f));
            r28 r28VarB = bo.B(jfc.d(o28Var2, 1.0f), 1.0f, ((zo7) p65Var.j(kt7.b)).z, bmb.a(16.0f));
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarB);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            kx8Var2 = kx8Var;
            q(kx8Var2.b, R.string.stats_presentations, R.string.post_stats_overview_reach_funnel_presentations_description, null, null, null, vo7.R(p65Var, R.string.post_stats_overview_reach_funnel_presentations_tooltip), p65Var, 0, 56);
            r(0.0f, 0, 7, 0L, p65Var, null);
            Long lValueOf = Long.valueOf(kx8Var2.c);
            Float f2 = kx8Var2.f;
            String strQ = null;
            if (f2 == null) {
                p65Var.Y(-249740551);
                p65Var.p(false);
                str = null;
                i4 = 4;
                i5 = 1;
            } else {
                p65Var.Y(-249740550);
                i4 = 4;
                i5 = 1;
                String strQ2 = vo7.Q(R.string.post_stats_overview_reach_funnel_views_ratio, new Object[]{dq1.G(Float.valueOf(f2.floatValue()), 1, 4)}, p65Var);
                p65Var.p(false);
                str = strQ2;
            }
            q(lValueOf, R.string.post_stats_overview_reach_funnel_views_title, R.string.post_stats_overview_reach_funnel_views_description, null, str, vo7.R(p65Var, R.string.post_stats_overview_reach_funnel_views_ratio_tooltip), null, p65Var, 0, 72);
            r(0.0f, 0, 7, 0L, p65Var, null);
            Long lValueOf2 = Long.valueOf(kx8Var2.d);
            Float f3 = kx8Var2.e;
            if (f3 == null) {
                p65Var.Y(-249044167);
            } else {
                p65Var.Y(-249044166);
                Object[] objArr = new Object[i5];
                objArr[0] = dq1.G(Float.valueOf(f3.floatValue()), i5, i4);
                strQ = vo7.Q(R.string.post_stats_overview_reach_funnel_reads_ratio, objArr, p65Var);
            }
            p65Var.p(false);
            q(lValueOf2, R.string.post_stats_overview_reach_funnel_reads_title, R.string.post_stats_overview_reach_funnel_reads_description, null, strQ, vo7.R(p65Var, R.string.post_stats_overview_reach_funnel_reads_ratio_tooltip), null, p65Var, 0, 72);
            p65Var.p(i5);
            p65Var.p(i5);
            r28Var2 = o28Var2;
            i3 = i5;
        } else {
            kx8Var2 = kx8Var;
            i3 = 1;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hx8(kx8Var2, r28Var2, i, i3);
        }
    }

    public static final void t(yvb yvbVar, b55 b55Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        b55Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1032161051);
        int i2 = (p65Var.f(yvbVar) ? 4 : 2) | i | (p65Var.h(b55Var) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            int i3 = yvbVar.b;
            o28 o28Var = o28.b;
            fp7.c(i3, true, bgf.N(o28Var, "see_more_replies_item"), pxf.E(-1682329963, new qg9(b55Var, 19, yvbVar), p65Var), p65Var, 3072);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 15, yvbVar, b55Var, r28Var2);
        }
    }

    public static final void u(owb owbVar, m45 m45Var, r28 r28Var, long j, x12 x12Var, int i) {
        long j2;
        long j3;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(214222561);
        int i2 = i | 25600;
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).a;
            } else {
                p65Var.S();
                j3 = j;
            }
            p65Var.q();
            amb ambVarA = bmb.a(24.0f);
            r28 r28VarR = hlg.r(r40.y(flb.a0(bgf.N(r28Var, "select_field"), uu1.g, ambVarA), ambVarA), false, null, null, m45Var, 15);
            sn3 sn3Var = kt7.b;
            r28 r28VarD = w2g.D(jfc.f(flb.a0(bo.B(r28VarR, 1.0f, ((zo7) p65Var.j(sn3Var)).z, ambVarA), j3, rv8.r), 40.0f, 0.0f, 2), 16.0f, 9.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j4 = p65Var.T;
            int i3 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            mkd mkdVarM = dl7.m(((eu7) p65Var.j(kt7.c)).m);
            r28 r28VarN = bgf.N(o28.b, "select_field_text");
            zq0 zq0Var = z46.n;
            kjd.b("Select Field", r28VarN.b(new qse(zq0Var)), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarM, p65Var, 0, 0, 65532);
            p65Var = p65Var;
            p65Var.Y(1522642431);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            hp7.t(p65Var, new sq6(1.0f <= Float.MAX_VALUE ? 1.0f : Float.MAX_VALUE, true));
            p65Var.p(false);
            rv5.a(vn7.J(R.drawable.ic_chevron_down_16, 0, p65Var), null, new qse(zq0Var), ((zo7) p65Var.j(sn3Var)).n, p65Var, 56, 0);
            p65Var.p(true);
            j2 = j3;
        } else {
            p65Var.S();
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jj3(owbVar, m45Var, r28Var, j2, i, 4);
        }
    }

    public static final void v(hia hiaVar, cv9 cv9Var, x12 x12Var, int i) {
        int i2;
        boolean z;
        ar0 ar0Var = z46.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(907733227);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(hiaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var.f(cv9Var) : p65Var.h(cv9Var) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarL = jfc.l(w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 4.0f, 6), 38.0f);
            amb ambVar = bmb.a;
            r28 r28VarN = bgf.N(r40.y(r28VarL, ambVar), "cta_subscribe_to_author");
            String strW = hiaVar.b;
            SourceParameter sourceParameter = hiaVar.j;
            gia giaVar = hiaVar.g;
            if (strW == null || muc.b0(strW)) {
                strW = null;
            }
            if (strW == null) {
                strW = km4.w(p65Var, 453281085, R.string.common_unknown_collection, p65Var, false);
            } else {
                p65Var.Y(453279814);
                p65Var.p(false);
            }
            if (giaVar != null) {
                String str = giaVar.a;
                p65Var.Y(1166996044);
                cg8 cg8Var = (cg8) guc.x(giaVar.b, new ag8(str), p65Var, 0).getValue();
                boolean z2 = cg8Var instanceof bg8;
                uob uobVar = w12.a;
                if (z2) {
                    p65Var.Y(1167271262);
                    sn3 sn3Var = kt7.b;
                    cu0 cu0VarB = k40.b(1.0f, ((zo7) p65Var.j(sn3Var)).y);
                    r28 r28VarC = bo.C(r28VarN, cu0VarB.a, cu0VarB.b, ambVar);
                    boolean zF = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i2 & 64) != 0 && p65Var.h(cv9Var))) | p65Var.f(strW);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new eia(cv9Var, hiaVar, strW, 1);
                        p65Var.j0(objM);
                    }
                    r28 r28VarN2 = bgf.N(hlg.r(r28VarC, false, null, null, (m45) objM, 15), "btn_unsubscribe_to_newsletter");
                    zk7 zk7VarC = dy0.c(ar0Var, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarN2);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    qv5.b(vn7.J(R.drawable.ic_subscribe, 0, p65Var), vo7.R(p65Var, R.string.common_unsubscribe), jfc.l(o28Var, 24.0f), ((zo7) p65Var.j(sn3Var)).n, p65Var, 392, 0);
                    p65Var.p(true);
                    cv9Var.d(str, sourceParameter);
                    z = false;
                    p65Var.p(false);
                } else if (cg8Var instanceof ag8) {
                    p65Var.Y(1168750551);
                    sn3 sn3Var2 = kt7.b;
                    r28 r28VarA0 = flb.a0(r28VarN, ((zo7) p65Var.j(sn3Var2)).d, rv8.r);
                    boolean zF2 = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i2 & 64) != 0 && p65Var.h(cv9Var))) | p65Var.f(strW);
                    Object objM2 = p65Var.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new eia(cv9Var, hiaVar, strW, 2);
                        p65Var.j0(objM2);
                    }
                    r28 r28VarN3 = bgf.N(hlg.r(r28VarA0, false, null, null, (m45) objM2, 15), "btn_subscribe_to_newsletter");
                    zk7 zk7VarC2 = dy0.c(ar0Var, false);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarN3);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC2);
                    tp7.B(p65Var, q12.e, i89VarL2);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i4));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR2);
                    qv5.b(vn7.J(R.drawable.ic_subscribe, 0, p65Var), vo7.R(p65Var, R.string.common_subscribe), jfc.l(o28Var, 24.0f), ((zo7) p65Var.j(sn3Var2)).p, p65Var, 392, 0);
                    p65Var.p(true);
                    cv9Var.d(str, sourceParameter);
                    z = false;
                    p65Var.p(false);
                } else {
                    z = false;
                    if (g76.L(cg8Var, yf8.a)) {
                        p65Var.Y(453386191);
                        p65Var.p(false);
                    } else {
                        if (!g76.L(cg8Var, zf8.a)) {
                            throw ho2.L(p65Var, 453294495, false);
                        }
                        p65Var.Y(453387919);
                        p65Var.p(false);
                    }
                }
            } else {
                z = false;
                p65Var.Y(1159366231);
            }
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dia(hiaVar, cv9Var, i, 4);
        }
    }

    public static final float x(int i, int i2, float[] fArr) {
        return fArr[((i - i2) * 2) + 1];
    }

    /* JADX WARN: Removed duplicated region for block: B:145:0x025f A[EDGE_INSN: B:204:0x025f->B:145:0x025f BREAK  A[LOOP:5: B:155:0x027b->B:207:0x027b], EDGE_INSN: B:205:0x025f->B:145:0x025f BREAK  A[LOOP:5: B:155:0x027b->B:207:0x027b]] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final int y(defpackage.ojd r19, android.text.Layout r20, defpackage.iq1 r21, int r22, android.graphics.RectF r23, defpackage.kwb r24, defpackage.k6c r25, boolean r26) {
        /*
            Method dump skipped, instruction units count: 715
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ur7.y(ojd, android.text.Layout, iq1, int, android.graphics.RectF, kwb, k6c, boolean):int");
    }

    public static final int z(int i, int i2) {
        return (i >> i2) & 31;
    }

    public abstract nzf G(h1g h1gVar);

    public abstract jjg H();

    public abstract Integer I();

    public abstract tzf K(h1g h1gVar);

    public abstract void L(tzf tzfVar, tzf tzfVar2);

    public abstract void M(tzf tzfVar, Thread thread);

    public abstract boolean N(h1g h1gVar, nzf nzfVar, nzf nzfVar2);

    public abstract boolean O(vzf vzfVar, Object obj, Object obj2);

    public abstract boolean P(vzf vzfVar, tzf tzfVar, tzf tzfVar2);

    public static final void l(String str, SourceParameter sourceParameter, cv9 cv9Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(746591490);
        int i2 = (i & 6) == 0 ? (p65Var2.f(str) ? 4 : 2) | i : i;
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(sourceParameter) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= (i & 512) == 0 ? p65Var2.f(cv9Var) : p65Var2.h(cv9Var) ? 256 : 128;
        }
        int i3 = 1;
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            sb.append(str);
            Matcher matcher = Patterns.WEB_URL.matcher(str);
            while (matcher.find()) {
                arrayListV.add(new jx(new b07(peNPu.oWvaQwJjbv, new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14), new re0(Uri.parse(matcher.group()), cv9Var, sourceParameter, i3)), matcher.start(), matcher.end(), 8));
            }
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            for (int i4 = 0; i4 < arrayListV.size(); i4 = lv8.i(sb, (jx) arrayListV.get(i4), arrayList, i4, 1)) {
            }
            p65Var = p65Var2;
            jjd.c(new mx(string, arrayList), w2g.G(o28.b, 24.0f, 16.0f, 24.0f, 0.0f, 8), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var2.j(jt7.c)).m, p65Var, 48, 0, 262140);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 19, str, sourceParameter, cv9Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object w(defpackage.l2a r5, defpackage.m45 r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.j2a
            if (r0 == 0) goto L13
            r0 = r7
            j2a r0 = (defpackage.j2a) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            j2a r0 = new j2a
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            m45 r6 = r0.b
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L2a
            goto L62
        L2a:
            r5 = move-exception
            goto L68
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L32:
            defpackage.br7.v(r7)
            ib2 r7 = r0.getContext()
            cd7 r2 = defpackage.cd7.g
            gb2 r7 = r7.o0(r2)
            if (r7 != r5) goto L6c
            r0.b = r6     // Catch: java.lang.Throwable -> L2a
            r0.d = r4     // Catch: java.lang.Throwable -> L2a
            x51 r7 = new x51     // Catch: java.lang.Throwable -> L2a
            n92 r0 = defpackage.pwd.Q(r0)     // Catch: java.lang.Throwable -> L2a
            r7.<init>(r4, r0)     // Catch: java.lang.Throwable -> L2a
            r7.s()     // Catch: java.lang.Throwable -> L2a
            z r0 = new z     // Catch: java.lang.Throwable -> L2a
            r2 = 26
            r0.<init>(r2, r7)     // Catch: java.lang.Throwable -> L2a
            r5.a(r0)     // Catch: java.lang.Throwable -> L2a
            java.lang.Object r5 = r7.q()     // Catch: java.lang.Throwable -> L2a
            if (r5 != r1) goto L62
            return r1
        L62:
            r6.invoke()
            c1e r5 = defpackage.c1e.a
            return r5
        L68:
            r6.invoke()
            throw r5
        L6c:
            r5 = 0
            java.lang.String r5 = androidx.emoji2.text.flatbuffer.aI.aJzfoQ.qThvCPVW
            defpackage.ygf.f(r5)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ur7.w(l2a, m45, p92):java.lang.Object");
    }
}
