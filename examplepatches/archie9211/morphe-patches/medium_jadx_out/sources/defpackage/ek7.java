package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextDirectionHeuristic;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Patterns;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.facebook.FacebookException;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import com.medium.reader.R;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class ek7 {
    public static final /* synthetic */ int a = 0;

    public static gsa A(int i) {
        return i != 0 ? i != 1 ? new cmb() : new km2() : new cmb();
    }

    public static final void B(long j, byte[] bArr, int i, int i2, int i3) {
        int i4 = 7 - i2;
        int i5 = 8 - i3;
        if (i5 > i4) {
            return;
        }
        while (true) {
            int i6 = kj5.a[(int) ((j >> (i4 << 3)) & 255)];
            int i7 = i + 1;
            bArr[i] = (byte) (i6 >> 8);
            i += 2;
            bArr[i7] = (byte) i6;
            if (i4 == i5) {
                return;
            } else {
                i4--;
            }
        }
    }

    public static final String C(String str, pp1 pp1Var) {
        pp1Var.getClass();
        if (!J(str)) {
            throw new FacebookException("Invalid Code Verifier.");
        }
        if (pp1Var == pp1.PLAIN) {
            return str;
        }
        try {
            byte[] bytes = str.getBytes(wk1.d);
            bytes.getClass();
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(bytes, 0, bytes.length);
            String strEncodeToString = Base64.encodeToString(messageDigest.digest(), 11);
            strEncodeToString.getClass();
            return strEncodeToString;
        } catch (Exception e) {
            throw new FacebookException(e);
        }
    }

    public static final mmb D(tk7 tk7Var) {
        Object objW = tk7Var.w();
        if (objW instanceof mmb) {
            return (mmb) objW;
        }
        return null;
    }

    public static final jwb E(Object obj) {
        if (obj != s42.f) {
            return (jwb) obj;
        }
        ygf.f("Does not contain segment");
        return null;
    }

    public static final float F(mmb mmbVar) {
        if (mmbVar != null) {
            return mmbVar.a;
        }
        return 0.0f;
    }

    public static final String G(g6d g6dVar, int i) {
        int iC = hlg.C(g6dVar, i);
        int iRed = Color.red(iC);
        int iGreen = Color.green(iC);
        int iBlue = Color.blue(iC);
        int iAlpha = Color.alpha(iC);
        StringBuilder sbB = ev6.B(iRed, iGreen, "rgba(", ", ", ", ");
        sbB.append(iBlue);
        sbB.append(", ");
        sbB.append(iAlpha);
        sbB.append(")");
        return sbB.toString();
    }

    public static final boolean H(Object obj) {
        return obj == s42.f;
    }

    public static boolean I(double d, int i, int i2) {
        return d >= ((double) i) && d < ((double) i2);
    }

    public static final boolean J(String str) {
        if (str.length() == 0 || str.length() < 43 || str.length() > 128) {
            return false;
        }
        Pattern patternCompile = Pattern.compile("^[-._~A-Za-z0-9]+$");
        patternCompile.getClass();
        return patternCompile.matcher(str).matches();
    }

    public static final xjd K(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        yy4 yy4Var = (yy4) p65Var.j(z22.k);
        m73 m73Var = (m73) p65Var.j(z22.h);
        ip6 ip6Var = (ip6) p65Var.j(z22.n);
        boolean zF = p65Var.f(yy4Var) | p65Var.f(m73Var) | p65Var.d(ip6Var.ordinal()) | p65Var.d(8);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            objM = new xjd(yy4Var, m73Var, ip6Var);
            p65Var.j0(objM);
        }
        return (xjd) objM;
    }

    public static final void L(m45 m45Var) {
        vx0.c0(o7f.i(), null, null, new qe(m45Var, null, 4), 3);
    }

    public static final k36 M(b36 b36Var) {
        return new k36(b36Var.a, b36Var.b, b36Var.c, b36Var.d);
    }

    public static final wlc N(i48 i48Var, x12 x12Var) {
        h48 h48Var = (h48) ((p65) x12Var).j(jk7.a);
        switch (j48.a[i48Var.ordinal()]) {
            case 1:
                h48Var.getClass();
                wlc wlcVar = h48.b;
                wlcVar.getClass();
                return wlcVar;
            case 2:
                h48Var.getClass();
                wlc wlcVar2 = h48.c;
                wlcVar2.getClass();
                return wlcVar2;
            case 3:
                h48Var.getClass();
                wlc wlcVar3 = h48.d;
                wlcVar3.getClass();
                return wlcVar3;
            case 4:
                h48Var.getClass();
                wlc wlcVar4 = h48.e;
                wlcVar4.getClass();
                return wlcVar4;
            case 5:
                h48Var.getClass();
                wlc wlcVar5 = h48.f;
                wlcVar5.getClass();
                return wlcVar5;
            case 6:
                h48Var.getClass();
                wlc wlcVar6 = h48.g;
                wlcVar6.getClass();
                return wlcVar6;
            default:
                ygf.a();
                return null;
        }
    }

    public static int O(Object obj) {
        if (obj == null) {
            return 4;
        }
        if (obj instanceof String) {
            return qq7.m((String) obj).length;
        }
        if (obj instanceof Boolean) {
            return 16;
        }
        if (obj instanceof Integer) {
            return 4;
        }
        if ((obj instanceof Long) || (obj instanceof Double)) {
            return 8;
        }
        if (obj instanceof rc6) {
            return qq7.m(((rc6) obj).a).length + 8;
        }
        int iO = 0;
        if (!(obj instanceof Map)) {
            if (obj instanceof List) {
                Iterator it2 = ((Iterable) obj).iterator();
                while (it2.hasNext()) {
                    iO += O(it2.next());
                }
                return 16 + iO;
            }
            if (obj instanceof i31) {
                return qq7.m(((i31) obj).a).length + 16;
            }
            lg8.y("Unknown field type in Record: '", obj);
            return 0;
        }
        Map map = (Map) obj;
        Iterator it3 = map.keySet().iterator();
        int iO2 = 0;
        while (it3.hasNext()) {
            iO2 += O(it3.next());
        }
        int i = 16 + iO2;
        Iterator it4 = map.values().iterator();
        while (it4.hasNext()) {
            iO += O(it4.next());
        }
        return i + iO;
    }

    public static void P(ylf ylfVar) throws GeneralSecurityException {
        int iOrdinal = ylfVar.ordinal();
        if (iOrdinal != 2 && iOrdinal != 3 && iOrdinal != 4) {
            throw new GeneralSecurityException("Unsupported hash: ".concat(String.valueOf(ylfVar.name())));
        }
    }

    public static /* synthetic */ boolean Q(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, vzf vzfVar, Object obj, Object obj2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(vzfVar, obj, obj2)) {
            if (atomicReferenceFieldUpdater.get(vzfVar) != obj && atomicReferenceFieldUpdater.get(vzfVar) != obj) {
                return false;
            }
        }
        return true;
    }

    public static void R(int i) throws GeneralSecurityException {
        if (i < 2048) {
            throw new GeneralSecurityException(String.format("Modulus size is %d; only modulus size >= 2048-bit is supported", Integer.valueOf(i)));
        }
        if (yjg.a() && i != 2048 && i != 3072) {
            throw new GeneralSecurityException(String.format("Modulus size is %d; only modulus size of 2048- or 3072-bit is supported in FIPS mode.", Integer.valueOf(i)));
        }
    }

    public static void S(int i, int i2) {
        String strA;
        if (i < 0 || i >= i2) {
            if (i < 0) {
                strA = dl7.A("%s (%s) must not be negative", "index", Integer.valueOf(i));
            } else {
                if (i2 < 0) {
                    ay0.e(b09.A(new StringBuilder(String.valueOf(i2).length() + 15), i2, "negative size: "));
                    return;
                }
                strA = dl7.A("%s (%s) must be less than size (%s)", "index", Integer.valueOf(i), Integer.valueOf(i2));
            }
            throw new IndexOutOfBoundsException(strA);
        }
    }

    public static void T(int i, int i2) {
        if (i < 0 || i > i2) {
            z10.i(W(i, i2, "index"));
        }
    }

    public static void U(BigInteger bigInteger) throws GeneralSecurityException {
        if (!bigInteger.testBit(0)) {
            ygf.l("Public exponent must be odd.");
        } else {
            if (bigInteger.compareTo(BigInteger.valueOf(65536L)) > 0) {
                return;
            }
            ygf.l("Public exponent must be greater than 65536.");
        }
    }

    public static void V(int i, int i2, int i3) {
        if (i < 0 || i2 < i || i2 > i3) {
            throw new IndexOutOfBoundsException((i < 0 || i > i3) ? W(i, i3, "start index") : (i2 < 0 || i2 > i3) ? W(i2, i3, "end index") : dl7.A("end index (%s) must not be less than start index (%s)", Integer.valueOf(i2), Integer.valueOf(i)));
        }
    }

    public static String W(int i, int i2, String str) {
        if (i < 0) {
            return dl7.A("%s (%s) must not be negative", str, Integer.valueOf(i));
        }
        if (i2 >= 0) {
            return dl7.A("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i), Integer.valueOf(i2));
        }
        ay0.e(b09.A(new StringBuilder(String.valueOf(i2).length() + 15), i2, "negative size: "));
        return null;
    }

    public static final void a(pe9 pe9Var, cv9 cv9Var, x12 x12Var, int i) {
        int i2;
        int i3;
        boolean z;
        boolean z2;
        cv9 cv9Var2;
        cv9 cv9Var3 = cv9Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1985894329);
        int i4 = i | (p65Var.f(pe9Var) ? 4 : 2) | (p65Var.f(cv9Var3) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            d46.a(pe9Var.d, hl0.XXXS, null, null, null, null, null, 0.0f, 0, null, null, p65Var, 48, 0, 4092);
            hp7.t(p65Var, jfc.p(o28Var, 4.0f));
            String strW = pe9Var.e;
            if (strW == null || muc.b0(strW)) {
                strW = null;
            }
            if (strW == null) {
                strW = km4.w(p65Var, 841856865, R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(841855315);
                p65Var.p(false);
            }
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            r28 r28VarY = r40.y(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, false), bmb.a(4.0f));
            int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i7 = i4 & 14;
            boolean z3 = (i6 == 32) | (i7 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                i3 = 1;
                objM = new ne9(cv9Var3, pe9Var, i3);
                p65Var.j0(objM);
            } else {
                i3 = 1;
            }
            r28 r28VarN = bgf.N(w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 4.0f, 2.0f, 4.0f, 2.0f), "cta_author_name");
            sn3 sn3Var = jt7.c;
            jjd.b(strW, r28VarN, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            if (pe9Var.g) {
                p65Var.Y(328397052);
                w2g.e(vn7.J(R.drawable.ic_book_author, 0, p65Var), vo7.R(p65Var, R.string.book_author), null, null, null, 0.0f, null, p65Var, 8, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                hp7.t(p65Var, jfc.p(o28Var, 4.0f));
                z = false;
            } else {
                z = false;
                p65Var.Y(322466349);
            }
            p65Var.p(z);
            if (pe9Var.h == null || pe9Var.i == null) {
                cv9Var3 = cv9Var;
                z2 = false;
                p65Var.Y(322466349);
            } else {
                p65Var.Y(328736254);
                jjd.b(vo7.R(p65Var, R.string.in_word), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
                String str = pe9Var.i;
                if (1.0f <= 0.0d) {
                    z16.a("invalid weight; must be greater than zero");
                }
                r28 r28VarY2 = r40.y(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, false), bmb.a(4.0f));
                boolean z4 = (i7 == 4) | (i6 == 32);
                Object objM2 = p65Var.M();
                if (z4 || objM2 == uobVar) {
                    cv9Var2 = cv9Var;
                    objM2 = new ne9(cv9Var2, pe9Var, 2);
                    p65Var.j0(objM2);
                } else {
                    cv9Var2 = cv9Var;
                }
                cv9Var3 = cv9Var2;
                jjd.b(str, bgf.N(w2g.F(hlg.r(r28VarY2, false, null, null, (m45) objM2, 15), 4.0f, 2.0f, 4.0f, 2.0f), "cta_collection_name"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 24960, 110588);
                p65Var = p65Var;
                z2 = false;
            }
            p65Var.p(z2);
            i2 = 1;
            p65Var.p(true);
        } else {
            i2 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oe9(pe9Var, cv9Var3, i, i2);
        }
    }

    public static final void b(pia piaVar, nla nlaVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        mwa mwaVarS;
        mia miaVar;
        o28 o28Var;
        p65 p65Var2;
        boolean z;
        String strValueOf;
        o28 o28Var2;
        r28 r28VarB;
        o28 o28Var3;
        ar0 ar0Var = z46.h;
        ar0 ar0Var2 = z46.d;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(-1798900500);
        int i2 = 2;
        int i3 = (i & 6) == 0 ? i | (p65Var3.f(piaVar) ? 4 : 2) : i;
        if ((i & 48) == 0) {
            i3 |= (i & 64) == 0 ? p65Var3.f(nlaVar) : p65Var3.h(nlaVar) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var3.P(i4 & 1, (i4 & 147) != 146)) {
            Collection collection = piaVar.f;
            boolean zIsEmpty = ((t0) collection).isEmpty();
            o28 o28Var4 = o28.b;
            if (zIsEmpty) {
                mwaVarS = p65Var3.s();
                if (mwaVarS != null) {
                    miaVar = new mia(piaVar, nlaVar, o28Var4, i, 0);
                    mwaVarS.d = miaVar;
                }
                return;
            }
            r28 r28VarY = r40.y(bgf.N(o28Var4, "editors"), bmb.a(2.0f));
            boolean z2 = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i4 & 64) != 0 && p65Var3.h(nlaVar))) | ((i4 & 14) == 4);
            Object objM = p65Var3.M();
            if (z2 || objM == w12.a) {
                objM = new nia(nlaVar, piaVar, i2);
                p65Var3.j0(objM);
            }
            r28 r28VarF = w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 4.0f, 2.0f, 4.0f, 2.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var3, 48);
            long j = p65Var3.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var3, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var3, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var3, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var3, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var3, cuVar4, r28VarR);
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var3.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var3.l();
            r28 r28VarR2 = gx1.R(p65Var3, o28Var4);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar, zk7VarC);
            tp7.B(p65Var3, cuVar2, i89VarL2);
            ka1.z(i6, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR2);
            r28 r28VarC = w2g.C(flb.a0(jfc.l(o28Var4, 22.0f), ((zo7) p65Var3.j(kt7.b)).a, bmb.a), 1.0f);
            ArrayList arrayList = new ArrayList();
            for (Object obj : collection) {
                String str = (String) obj;
                if (str != null && str.length() != 0) {
                    arrayList.add(obj);
                }
            }
            List listY0 = bu1.Y0(bu1.g1(arrayList, 5));
            t0 t0Var = (t0) collection;
            if (t0Var.getSize() > 5) {
                p65Var3.Y(477294229);
                o28Var = o28Var4;
                r28 r28VarC2 = w2g.C(jfc.l(w2g.G(o28Var4, 80.0f, 0.0f, 0.0f, 0.0f, 14), 22.0f), 1.0f);
                sn3 sn3Var = kt7.b;
                r28 r28VarN = bgf.N(flb.a0(r28VarC2, ((zo7) p65Var3.j(sn3Var)).b, bmb.a), "editors_more_icon_container");
                zk7 zk7VarC2 = dy0.c(ar0Var2, false);
                long j3 = p65Var3.T;
                int i7 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var3.l();
                r28 r28VarR3 = gx1.R(p65Var3, r28VarN);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, q12.f, zk7VarC2);
                tp7.B(p65Var3, q12.e, i89VarL3);
                tp7.B(p65Var3, q12.g, Integer.valueOf(i7));
                tp7.y(p65Var3, q12.h);
                tp7.B(p65Var3, q12.d, r28VarR3);
                p65Var2 = p65Var3;
                qv5.b(vn7.J(R.drawable.ic_more_horizontal_16, 0, p65Var3), null, iy0.a.a(bgf.N(o28Var, "editors_more_icon"), ar0Var), ((zo7) p65Var3.j(sn3Var)).o, p65Var2, 56, 0);
                p65Var2.p(true);
                z = false;
            } else {
                o28Var = o28Var4;
                p65Var2 = p65Var3;
                z = false;
                p65Var2.Y(467571296);
            }
            p65Var2.p(z);
            p65Var2.Y(1123805810);
            int i8 = 0;
            for (Object obj2 : listY0) {
                int i9 = i8 + 1;
                if (i8 < 0) {
                    d46.i0();
                    throw null;
                }
                String str2 = (String) obj2;
                if (i8 == listY0.size() - 1) {
                    r28VarB = bgf.N(r28VarC, "editor_avatar_" + i8);
                    o28Var2 = o28Var;
                } else {
                    o28Var2 = o28Var;
                    r28VarB = bgf.N(w2g.G(o28Var2, 16.0f * ((listY0.size() - 1) - i8), 0.0f, 0.0f, 0.0f, 14), "editor_avatar_" + i8).b(r28VarC);
                }
                if (((Boolean) p65Var2.j(l36.a)).booleanValue()) {
                    p65Var2.Y(1896974034);
                    p65 p65Var4 = p65Var2;
                    r28 r28Var3 = r28VarB;
                    o28Var3 = o28Var2;
                    w2g.e(vn7.J(R.drawable.avatar_fallback, 0, p65Var2), null, r28Var3, null, null, 0.0f, null, p65Var4, 56, 120);
                    p65Var2 = p65Var4;
                    p65Var2.p(false);
                } else {
                    p65Var2.Y(-1323835152);
                    nx5 nx5Var = new nx5((Context) p65Var2.j(eo.b));
                    if (str2 == null) {
                        str2 = null;
                    }
                    nx5Var.c = str2 != null ? new ax5(str2) : null;
                    hlg.W(nx5Var);
                    p65 p65Var5 = p65Var2;
                    ur7.a(nx5Var.a(), null, r28VarB, ar0Var, v82.b, 0.0f, null, 0, p65Var5, 1769520, 1944);
                    p65Var2 = p65Var5;
                    p65Var2.p(false);
                    o28Var3 = o28Var2;
                }
                o28Var = o28Var3;
                i8 = i9;
            }
            o28 o28Var5 = o28Var;
            p65Var2.p(false);
            p65Var2.p(true);
            hp7.t(p65Var2, jfc.l(o28Var5, 7.0f));
            int size = t0Var.getSize();
            if (size > 5) {
                p65Var2.Y(-1615863609);
                strValueOf = vo7.Q(R.string.publication_header_editors_count_more, new Object[]{5}, p65Var2);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-1615745902);
                p65Var2.p(false);
                strValueOf = String.valueOf(size);
            }
            p65 p65Var6 = p65Var2;
            jjd.b(vo7.D(R.plurals.publication_header_editors, size, new Object[]{strValueOf}, p65Var2), bgf.N(o28Var5, "editors_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var6, 48, 0, 131068);
            p65Var = p65Var6;
            p65Var.p(true);
            r28Var2 = o28Var5;
        } else {
            p65Var = p65Var3;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            miaVar = new mia(piaVar, nlaVar, r28Var2, i, 2);
            mwaVarS.d = miaVar;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v6, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r10v14 */
    /* JADX WARN: Type inference failed for: r10v15 */
    /* JADX WARN: Type inference failed for: r10v21 */
    /* JADX WARN: Type inference failed for: r11v3, types: [x12] */
    /* JADX WARN: Type inference failed for: r12v1, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v15, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v16, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v18, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v19 */
    /* JADX WARN: Type inference failed for: r12v20 */
    /* JADX WARN: Type inference failed for: r12v21 */
    /* JADX WARN: Type inference failed for: r12v22 */
    /* JADX WARN: Type inference failed for: r12v23 */
    /* JADX WARN: Type inference failed for: r12v24 */
    /* JADX WARN: Type inference failed for: r12v25 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r8v25 */
    /* JADX WARN: Type inference failed for: r8v26 */
    /* JADX WARN: Type inference failed for: r8v31 */
    /* JADX WARN: Type inference failed for: r9v17 */
    /* JADX WARN: Type inference failed for: r9v18 */
    /* JADX WARN: Type inference failed for: r9v23 */
    public static final void c(pia piaVar, nla nlaVar, boolean z, r28 r28Var, x12 x12Var, int i) {
        int i2;
        ?? r12;
        int i3;
        boolean z2;
        boolean z3;
        boolean z4;
        r28 sq6Var;
        int i4;
        ?? r0;
        ?? r122;
        ?? r123;
        bt4 bt4Var = piaVar.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-701903055);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(piaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var.f(nlaVar) : p65Var.h(nlaVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            cg8 cg8Var = piaVar.i;
            int i6 = oia.a[bt4Var.ordinal()];
            o28 o28Var = o28.b;
            uob uobVar = w12.a;
            if (i6 == 1 || i6 == 2) {
                p65Var.Y(783660022);
                if (bt4Var == bt4.FOLLOWING) {
                    i3 = i2;
                    z3 = false;
                    z2 = true;
                } else {
                    i3 = i2;
                    z2 = false;
                    z3 = false;
                }
                xn7 xn7Var = xn7.M;
                int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                boolean z5 = (i7 == 32 || ((i3 & 64) != 0 && p65Var.h(nlaVar))) ? true : z3;
                int i8 = i3 & 14;
                int i9 = 4;
                boolean z6 = z5 | (i8 == 4);
                Object objM = p65Var.M();
                if (z6 || objM == uobVar) {
                    objM = new nia(nlaVar, piaVar, i9);
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                boolean z7 = (i7 == 32 || ((i3 & 64) != 0 && p65Var.h(nlaVar))) | (i8 == 4);
                Object objM2 = p65Var.M();
                if (z7 || objM2 == uobVar) {
                    objM2 = new nia(nlaVar, piaVar, 5);
                    p65Var.j0(objM2);
                }
                m45 m45Var2 = (m45) objM2;
                if (z) {
                    z4 = true;
                    sq6Var = new sq6(1.0f, true);
                } else {
                    z4 = true;
                    sq6Var = o28Var;
                }
                p65 p65Var2 = p65Var;
                i4 = i3;
                r0 = 0;
                vx0.g(z2, xn7Var, m45Var, m45Var2, sq6Var, false, p65Var2, 48);
                p65Var2.p(false);
                r122 = p65Var2;
            } else {
                if (i6 != 3 && i6 != 4) {
                    throw ho2.L(p65Var, 579464664, false);
                }
                p65Var.Y(579492337);
                p65Var.p(false);
                i4 = i2;
                r0 = 0;
                r122 = p65Var;
            }
            if (piaVar.h != null) {
                r122.Y(784508058);
                boolean z8 = cg8Var instanceof bg8;
                if (z8 || (cg8Var instanceof ag8)) {
                    r122.Y(784684944);
                    int i10 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                    int i11 = i4 & 14;
                    int i12 = (i11 == 4 ? 1 : r0) | ((i10 == 32 || ((i4 & 64) != 0 && r122.h(nlaVar))) ? 1 : r0);
                    Object objM3 = r122.M();
                    if (i12 != 0 || objM3 == uobVar) {
                        objM3 = new nia(nlaVar, piaVar, r0);
                        r122.j0(objM3);
                    }
                    m45 m45Var3 = (m45) objM3;
                    int i13 = ((i10 == 32 || ((i4 & 64) != 0 && r122.h(nlaVar))) ? 1 : r0) | (i11 == 4 ? 1 : r0);
                    Object objM4 = r122.M();
                    if (i13 != 0 || objM4 == uobVar) {
                        objM4 = new nia(nlaVar, piaVar, 1);
                        r122.j0(objM4);
                    }
                    ?? r11 = r122;
                    hp7.w(z8, m45Var3, (m45) objM4, w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 0.0f, 14), false, r11, 3072);
                    ?? r124 = r11;
                    r124.p(r0);
                    r123 = r124;
                } else {
                    if (!g76.L(cg8Var, yf8.a) && !g76.L(cg8Var, zf8.a)) {
                        throw ho2.L(r122, 579496040, r0);
                    }
                    r122.Y(579538961);
                    r122.p(r0);
                    r123 = r122;
                }
            } else {
                r122.Y(770541845);
                r123 = r122;
            }
            r123.p(r0);
            r123.p(true);
            r12 = r123;
        } else {
            p65 p65Var3 = p65Var;
            p65Var3.S();
            r12 = p65Var3;
        }
        mwa mwaVarS = r12.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w61(piaVar, nlaVar, z, r28Var, i, 5);
        }
    }

    public static final void d(pia piaVar, nla nlaVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        r28 r28Var2;
        mwa mwaVarS;
        mia miaVar;
        Integer num = piaVar.e;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1410797085);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.f(piaVar) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var2.f(nlaVar) : p65Var2.h(nlaVar) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            if (num == null) {
                mwaVarS = p65Var2.s();
                if (mwaVarS != null) {
                    miaVar = new mia(piaVar, nlaVar, o28Var, i, 3);
                    mwaVarS.d = miaVar;
                }
                return;
            }
            String strD = vo7.D(R.plurals.followers, num.intValue(), new Object[]{dq1.g(num)}, p65Var2);
            r28 r28VarY = r40.y(bgf.N(o28Var, "followers_count"), bmb.a(2.0f));
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i3 & 64) != 0 && p65Var2.h(nlaVar))) | ((i3 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new nia(nlaVar, piaVar, 3);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            jjd.b(strD, w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 4.0f, 2.0f, 4.0f, 2.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).n, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131068);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            miaVar = new mia(piaVar, nlaVar, r28Var2, i, 4);
            mwaVarS.d = miaVar;
        }
    }

    public static final void e(pia piaVar, nla nlaVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        boolean z;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1911363570);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(piaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var2.f(nlaVar) : p65Var2.h(nlaVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarG = w2g.G(r28Var, 20.0f, 0.0f, 20.0f, 0.0f, 10);
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
            int i4 = i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
            d(piaVar, nlaVar, null, p65Var2, i4);
            if (piaVar.e == null || piaVar.f.isEmpty()) {
                p65Var = p65Var2;
                z = false;
                p65Var.Y(2134040056);
            } else {
                p65Var2.Y(2141011646);
                String strR = vo7.R(p65Var2, R.string.common_interpunct_no_space);
                r28 r28VarG2 = w2g.G(bgf.N(o28.b, "followers_editors_separator"), 4.0f, 0.0f, 3.0f, 0.0f, 10);
                mkd mkdVarA = mkd.a(((bu7) p65Var2.j(jt7.c)).n, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                z = false;
                jjd.b(strR, r28VarG2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var2, 48, 0, 131068);
                p65Var = p65Var2;
            }
            p65Var.p(z);
            b(piaVar, nlaVar, null, p65Var, i4);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mia(piaVar, nlaVar, r28Var, i, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0182  */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.m45 r19, defpackage.r28 r20, defpackage.mz1 r21, defpackage.x12 r22, int r23, int r24) {
        /*
            Method dump skipped, instruction units count: 401
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ek7.f(m45, r28, mz1, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(java.lang.String r13, defpackage.m45 r14, defpackage.r28 r15, java.lang.String r16, defpackage.mz1 r17, defpackage.x12 r18, int r19, int r20) {
        /*
            r5 = r17
            r6 = r19
            r13.getClass()
            r14.getClass()
            r10 = r18
            p65 r10 = (defpackage.p65) r10
            r0 = 218253830(0xd024a06, float:4.0148445E-31)
            r10.a0(r0)
            r0 = r6 & 6
            if (r0 != 0) goto L23
            boolean r0 = r10.f(r13)
            if (r0 == 0) goto L20
            r0 = 4
            goto L21
        L20:
            r0 = 2
        L21:
            r0 = r0 | r6
            goto L24
        L23:
            r0 = r6
        L24:
            r1 = r6 & 48
            if (r1 != 0) goto L34
            boolean r1 = r10.h(r14)
            if (r1 == 0) goto L31
            r1 = 32
            goto L33
        L31:
            r1 = 16
        L33:
            r0 = r0 | r1
        L34:
            r1 = r20 & 4
            if (r1 == 0) goto L3b
            r0 = r0 | 384(0x180, float:5.38E-43)
            goto L4b
        L3b:
            r2 = r6 & 384(0x180, float:5.38E-43)
            if (r2 != 0) goto L4b
            boolean r2 = r10.f(r15)
            if (r2 == 0) goto L48
            r2 = 256(0x100, float:3.59E-43)
            goto L4a
        L48:
            r2 = 128(0x80, float:1.8E-43)
        L4a:
            r0 = r0 | r2
        L4b:
            r2 = r20 & 8
            if (r2 == 0) goto L54
            r0 = r0 | 3072(0xc00, float:4.305E-42)
        L51:
            r3 = r16
            goto L66
        L54:
            r3 = r6 & 3072(0xc00, float:4.305E-42)
            if (r3 != 0) goto L51
            r3 = r16
            boolean r4 = r10.f(r3)
            if (r4 == 0) goto L63
            r4 = 2048(0x800, float:2.87E-42)
            goto L65
        L63:
            r4 = 1024(0x400, float:1.435E-42)
        L65:
            r0 = r0 | r4
        L66:
            r4 = r6 & 24576(0x6000, float:3.4438E-41)
            if (r4 != 0) goto L76
            boolean r4 = r10.h(r5)
            if (r4 == 0) goto L73
            r4 = 16384(0x4000, float:2.2959E-41)
            goto L75
        L73:
            r4 = 8192(0x2000, float:1.148E-41)
        L75:
            r0 = r0 | r4
        L76:
            r4 = r0 & 9363(0x2493, float:1.312E-41)
            r7 = 9362(0x2492, float:1.3119E-41)
            if (r4 == r7) goto L7e
            r4 = 1
            goto L7f
        L7e:
            r4 = 0
        L7f:
            r7 = r0 & 1
            boolean r4 = r10.P(r7, r4)
            if (r4 == 0) goto Lb1
            if (r1 == 0) goto L8b
            o28 r15 = defpackage.o28.b
        L8b:
            r8 = r15
            if (r2 == 0) goto L90
            r15 = 0
            goto L91
        L90:
            r15 = r3
        L91:
            gx4 r1 = new gx4
            r2 = 9
            r1.<init>(r13, r15, r5, r2)
            r2 = 917965790(0x36b70bde, float:5.4552065E-6)
            mz1 r9 = defpackage.pxf.E(r2, r1, r10)
            int r0 = r0 >> 3
            r1 = r0 & 14
            r1 = r1 | 384(0x180, float:5.38E-43)
            r0 = r0 & 112(0x70, float:1.57E-43)
            r11 = r1 | r0
            r12 = 0
            r7 = r14
            f(r7, r8, r9, r10, r11, r12)
            r4 = r15
            r3 = r8
            goto Lb6
        Lb1:
            r10.S()
            r4 = r3
            r3 = r15
        Lb6:
            mwa r15 = r10.s()
            if (r15 == 0) goto Lc7
            sf r0 = new sf
            r1 = r13
            r2 = r14
            r7 = r20
            r0.<init>(r1, r2, r3, r4, r5, r6, r7)
            r15.d = r0
        Lc7:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ek7.g(java.lang.String, m45, r28, java.lang.String, mz1, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void h(java.lang.String r17, defpackage.m45 r18, defpackage.r28 r19, java.lang.String r20, java.lang.String r21, defpackage.m45 r22, java.lang.String r23, defpackage.m45 r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 312
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ek7.h(java.lang.String, m45, r28, java.lang.String, java.lang.String, m45, java.lang.String, m45, x12, int, int):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v2, types: [boolean] */
    /* JADX WARN: Type inference failed for: r1v6 */
    public static final void i(pe9 pe9Var, x12 x12Var, int i) {
        p65 p65Var;
        ?? r1;
        o28 o28Var;
        p65 p65Var2;
        pe9 pe9Var2 = pe9Var;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(350264855);
        int i2 = i | (p65Var3.f(pe9Var2) ? 4 : 2);
        if (p65Var3.P(i2 & 1, (i2 & 3) != 2)) {
            o28 o28Var2 = o28.b;
            r28 r28VarD = jfc.d(o28Var2, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var3, 48);
            long j = p65Var3.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarD);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, q12.f, ombVarA);
            tp7.B(p65Var3, q12.e, i89VarL);
            tp7.B(p65Var3, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var3, q12.h);
            tp7.B(p65Var3, q12.d, r28VarR);
            if (pe9Var2.f) {
                p65Var3.Y(-1575645949);
                w2g.e(vn7.J(R.drawable.ic_member_16, 0, p65Var3), vo7.R(p65Var3, R.string.cd_member_only), null, null, null, 0.0f, null, p65Var3, 8, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                o28Var = o28Var2;
                r1 = 0;
                jjd.b(vo7.R(p65Var3, R.string.common_interpunct_no_space), w2g.G(o28Var2, 8.0f, 0.0f, 8.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var3.j(jt7.c)).n, ((zo7) p65Var3.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 48, 0, 131068);
                p65Var2 = p65Var3;
            } else {
                r1 = 0;
                o28Var = o28Var2;
                p65Var3.Y(-1583130713);
                p65Var2 = p65Var3;
            }
            p65Var2.p(r1);
            Object[] objArr = new Object[1];
            objArr[r1] = String.valueOf(pe9Var2.j);
            String strQ = vo7.Q(R.string.catalog_recirc_item_read_time, objArr, p65Var2);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            sq6 sq6Var = new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, r1);
            d8a d8aVar = jt7.c;
            mkd mkdVar = ((bu7) p65Var2.j(d8aVar)).n;
            d8a d8aVar2 = kt7.b;
            p65 p65Var4 = p65Var2;
            jjd.b(strQ, sq6Var, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(mkdVar, ((zo7) p65Var2.j(d8aVar2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var4, 0, 24960, 110588);
            jjd.b(vo7.R(p65Var4, R.string.common_interpunct_no_space), w2g.G(o28Var, 8.0f, 0.0f, 8.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var4.j(d8aVar)).n, ((zo7) p65Var4.j(d8aVar2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var4, 48, 0, 131068);
            Context context = (Context) p65Var4.j(eo.b);
            Long l = pe9Var.k;
            String strT = vo7.T(context, l != null ? l.longValue() : 0L);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            pe9Var2 = pe9Var;
            jjd.b(strT, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, false), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var4.j(d8aVar)).n, ((zo7) p65Var4.j(d8aVar2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var4, 0, 24960, 110588);
            p65 p65Var5 = p65Var4;
            p65Var5.p(true);
            p65Var = p65Var5;
        } else {
            p65Var3.S();
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v08(i, 10, pe9Var2);
        }
    }

    public static final void j(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        int i2;
        m45 m45Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1380530722);
        if ((i & 6) == 0) {
            i2 = i | (p65Var.h(m45Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i3 = i2;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            r28 r28VarD2 = jfc.d(w2g.C(o28Var, 24.0f), 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarD3 = w2g.D(flb.a0(r28VarD2, ((zo7) p65Var.j(sn3Var)).b, rv8.r), 24.0f, 48.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD3);
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
            sn3 sn3Var2 = jt7.c;
            jjd.b(vo7.R(p65Var, R.string.notifications_empty_state_title), jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).d, p65Var, 48, 0, 130044);
            int i7 = 3;
            jjd.b(vo7.R(p65Var, R.string.notifications_empty_state_text), jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var2)).l, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 130044);
            p65Var = p65Var;
            b09.H(p65Var, true, true, true);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                m45Var2 = m45Var;
                objM = new qe(m45Var2, null, i7);
                p65Var.j0(objM);
            } else {
                m45Var2 = m45Var;
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gw5(m45Var2, r28Var, i, 1);
        }
    }

    public static final void k(List list, cv9 cv9Var, x12 x12Var, int i) {
        cv9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1755189814);
        int i2 = (p65Var.h(list) ? 4 : 2) | i | (p65Var.f(cv9Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarD = jfc.d(o28.b, 1.0f);
            boolean zH = p65Var.h(list) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new q58(list, 19, cv9Var);
                p65Var.j0(objM);
            }
            k40.u(r28VarD, null, null, null, null, null, false, null, (x45) objM, p65Var, 6, 510);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(list, cv9Var, i, 7);
        }
    }

    public static final void l(pe9 pe9Var, cv9 cv9Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2138349236);
        int i2 = (p65Var.f(pe9Var) ? 4 : 2) | i | (p65Var.f(cv9Var) ? 32 : 16);
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ne9(cv9Var, pe9Var, i3);
                p65Var.j0(objM);
            }
            r28 r28VarP = jfc.p(o28.b, 240.0f);
            amb ambVarA = bmb.a(4.0f);
            sn3 sn3Var = kt7.b;
            dm2.b((m45) objM, r28VarP, false, ambVarA, gx1.A(((zo7) p65Var.j(sn3Var)).a, 0L, p65Var, 0, 14), gx1.B(0), k40.b(1.0f, ((zo7) p65Var.j(sn3Var)).z), pxf.E(1312494007, new g64(pe9Var, 28, cv9Var), p65Var), p65Var, 100663344, NikonType2MakernoteDirectory.TAG_LENS);
            p65Var = p65Var;
            String str = pe9Var.a;
            PostClientVisibilityState postClientVisibilityState = pe9Var.l;
            String str2 = pe9Var.m;
            cv9Var.getClass();
            str.getClass();
            postClientVisibilityState.getClass();
            sw9 sw9Var = cv9Var.a;
            if (sw9Var.I0.add(str)) {
                b09.Y(sw9Var.n, str, postClientVisibilityState, PostDensity.POST_DENSITY_SMALL_PREVIEW, sw9Var.d, str2, sw9Var.D0, false, 448);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oe9(pe9Var, cv9Var, i, i3);
        }
    }

    public static final void n(int i, x12 x12Var, r28 r28Var, String str, String str2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1523206562);
        int i2 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            hp7.o(str != null ? str : null, hl0.L, null, null, null, 0.0f, 0, null, null, p65Var, 48, 2044);
            r28 qseVar = o28.b;
            hp7.t(p65Var, jfc.l(qseVar, 16.0f));
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.TRUE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            if (((Boolean) l78Var.getValue()).booleanValue()) {
                qseVar = new qse(z46.n);
            }
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ws(l78Var, 20);
                p65Var.j0(objM2);
            }
            jjd.b(str2, qseVar, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, (x45) objM2, ((bu7) p65Var.j(jt7.c)).i, p65Var, (i2 >> 3) & 14, 1572864, 65532);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new im4(str, str2, r28Var, i, 2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v1 */
    /* JADX WARN: Type inference failed for: r10v2, types: [int] */
    /* JADX WARN: Type inference failed for: r10v7 */
    /* JADX WARN: Type inference failed for: r3v18, types: [java.util.ArrayList] */
    public static final void o(pia piaVar, nla nlaVar, r28 r28Var, x12 x12Var, int i) {
        nla nlaVar2;
        o28 o28Var;
        float f;
        boolean z;
        o28 o28Var2;
        float f2;
        int i2;
        boolean z2;
        boolean z3;
        p65 p65Var;
        o28 o28Var3;
        r28 r28VarG;
        boolean z4;
        o28 o28Var4;
        String str = piaVar.d;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(909640665);
        int i3 = (i & 6) == 0 ? (p65Var2.f(piaVar) ? 4 : 2) | i : i;
        if ((i & 48) == 0) {
            i3 |= (i & 64) == 0 ? p65Var2.f(nlaVar) : p65Var2.h(nlaVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        int i4 = i3;
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            Context context = (Context) p65Var2.j(eo.b);
            context.getClass();
            float f3 = r2.widthPixels / context.getResources().getDisplayMetrics().density;
            boolean z5 = (vj3.a(f3, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f3, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT;
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var2.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var5 = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, o28Var5);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            hp7.t(p65Var2, jfc.l(o28Var5, 12.0f));
            r28 r28VarG2 = w2g.G(o28Var5, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
            long j4 = p65Var2.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarG2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            n(0, p65Var2, new sq6(1.0f, true), piaVar.b, piaVar.c);
            if (z5) {
                nlaVar2 = nlaVar;
                o28Var = o28Var5;
                f = 12.0f;
                z = false;
                p65Var2.Y(1253982448);
            } else {
                f = 12.0f;
                km4.F(12.0f, 1257484146, p65Var2, p65Var2, o28Var5);
                o28Var = o28Var5;
                nlaVar2 = nlaVar;
                c(piaVar, nlaVar2, false, w2g.G(o28Var, 0.0f, 8.0f, 0.0f, 0.0f, 13), p65Var2, (i4 & 14) | 3456 | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
                z = false;
            }
            p65Var2.p(z);
            p65Var2.p(true);
            if (str == null) {
                p65Var2.Y(1733524284);
                p65Var2.p(z);
                p65Var = p65Var2;
                i2 = i4;
                z3 = z;
                f2 = 24.0f;
                o28Var2 = o28Var;
                z2 = true;
            } else {
                p65Var2.Y(1733524285);
                StringBuilder sb = new StringBuilder(16);
                ?? V = wgd.v();
                new ArrayList();
                sb.append(str);
                Matcher matcher = Patterns.WEB_URL.matcher(str);
                while (matcher.find()) {
                    V.add(new jx(new b07("web_url", new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14), new re0(Uri.parse(matcher.group()), nlaVar2, piaVar, 2)), matcher.start(), matcher.end(), 8));
                }
                String string = sb.toString();
                ArrayList arrayList = new ArrayList(V.size());
                for (?? I = z; I < V.size(); I = lv8.i(sb, (jx) V.get(I), arrayList, I, 1)) {
                }
                mx mxVar = new mx(string, arrayList);
                r28 r28VarG3 = w2g.G(o28Var, 24.0f, f, 24.0f, 0.0f, 8);
                o28Var2 = o28Var;
                f2 = 24.0f;
                mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
                i2 = i4;
                z2 = true;
                z3 = z;
                jjd.c(mxVar, r28VarG3, 0L, 0L, 0L, null, 0L, 2, false, 3, 0, null, null, mkdVar, p65Var2, 48, 24960, 241660);
                p65Var = p65Var2;
                p65Var.p(z3);
            }
            if (str != null) {
                o28Var3 = o28Var2;
                r28VarG = w2g.G(o28Var3, 0.0f, 10.0f, 0.0f, 0.0f, 13);
            } else {
                o28Var3 = o28Var2;
                r28VarG = w2g.G(o28Var3, 0.0f, 22.0f, 0.0f, 0.0f, 13);
            }
            int i9 = i2 & 14;
            int i10 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            e(piaVar, nlaVar2, r28VarG, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            if (z5) {
                p65Var.Y(1734662543);
                o28Var4 = o28Var3;
                z4 = z3;
                p65Var2 = p65Var;
                c(piaVar, nlaVar2, true, w2g.G(o28Var3, f2, 17.0f, f2, 0.0f, 8), p65Var2, i9 | 3456 | i10);
            } else {
                z4 = z3;
                p65Var2 = p65Var;
                o28Var4 = o28Var3;
                p65Var2.Y(1729574668);
            }
            p65Var2.p(z4);
            hp7.t(p65Var2, jfc.l(o28Var4, 7.0f));
            p65Var2.p(z2);
            p65Var2.p(z2);
            p65Var2.p(z2);
        } else {
            p65Var2.S();
        }
        mwa mwaVarS = p65Var2.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mia(piaVar, nlaVar, r28Var, i, 5);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void p(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        r28 r28Var2;
        long j3;
        r28 r28Var3;
        boolean z;
        boolean z2;
        long j4;
        boolean z3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1258464660);
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
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f = r7.widthPixels / context.getResources().getDisplayMetrics().density;
            Object[] objArr = (vj3.a(f, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT;
            r28 r28VarD = jfc.d(jfc.r(m40.V(r28Var3, p65Var, 6), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j5 = p65Var.T;
            int i4 = (int) (j5 ^ (j5 >>> 32));
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
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j6 = p65Var.T;
            int i5 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
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
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            r28 r28Var4 = r28Var3;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j7 = p65Var.T;
            int i6 = (int) (j7 ^ (j7 >>> 32));
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
            hp7.t(p65Var, jfc.l(o28Var, 12.0f));
            Object[] objArr2 = objArr;
            r28 r28VarG = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j8 = p65Var.T;
            int i7 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            dy0.a(flb.a0(jfc.l(o28Var, 64.0f), j3, bmb.a(2.0f)), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            p65Var.Y(-66601588);
            sn3 sn3Var = z22.h;
            m73 m73Var = (m73) p65Var.j(sn3Var);
            sn3 sn3Var2 = jt7.c;
            float fZ = m73Var.z(((bu7) p65Var.j(sn3Var2)).i.b.c);
            p65Var.p(false);
            long j9 = j3;
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            sq6 sq6Var = new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j10 = p65Var.T;
            int i8 = (int) (j10 ^ (j10 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            r28 r28VarE = jfc.e(jfc.d(o28Var, 0.75f), fZ);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarE, j9, nr5Var), p65Var, 0);
            p65Var.p(true);
            if (objArr2 == true) {
                z = false;
                p65Var.Y(-2081030649);
            } else {
                km4.F(12.0f, -2064123869, p65Var, p65Var, o28Var);
                r28 r28VarM = jfc.m(o28Var, 72.0f, 38.0f);
                amb ambVar = bmb.a;
                dy0.a(flb.a0(r28VarM, j9, ambVar), p65Var, 0);
                hp7.t(p65Var, jfc.l(o28Var, 8.0f));
                z = false;
                dy0.a(flb.a0(jfc.l(o28Var, 38.0f), j9, ambVar), p65Var, 0);
            }
            p65Var.p(z);
            ka1.B(p65Var, true, o28Var, 12.0f, p65Var);
            r28 r28VarG2 = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, z ? 1 : 0);
            long j11 = p65Var.T;
            int i9 = (int) (j11 ^ (j11 >>> 32));
            i89 i89VarL6 = p65Var.l();
            r28 r28VarR6 = gx1.R(p65Var, r28VarG2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL6);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR6);
            p65Var.Y(922522813);
            float fZ2 = ((m73) p65Var.j(sn3Var)).z(((bu7) p65Var.j(sn3Var2)).m.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 0.9f), fZ2), j9, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 1.0f), fZ2), j9, nr5Var), p65Var, 0);
            ka1.B(p65Var, true, o28Var, 12.0f, p65Var);
            r28 r28VarG3 = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            zq0 zq0Var2 = z46.m;
            omb ombVarA2 = nmb.a(fa4Var, zq0Var2, p65Var, 0);
            long j12 = p65Var.T;
            int i10 = (int) (j12 ^ (j12 >>> 32));
            i89 i89VarL7 = p65Var.l();
            r28 r28VarR7 = gx1.R(p65Var, r28VarG3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL7);
            ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR7);
            dy0.a(flb.a0(jfc.d(jfc.e(o28Var, 20.0f), 0.3f), j9, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 20.0f));
            dy0.a(flb.a0(jfc.d(jfc.e(o28Var, 20.0f), 0.5f), j9, nr5Var), p65Var, 0);
            p65Var.p(true);
            if (objArr2 == true) {
                km4.F(24.0f, -1807999341, p65Var, p65Var, o28Var);
                r28 r28VarG4 = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
                omb ombVarA3 = nmb.a(fa4Var, zq0Var2, p65Var, 0);
                long j13 = p65Var.T;
                int i11 = (int) (j13 ^ (j13 >>> 32));
                i89 i89VarL8 = p65Var.l();
                r28 r28VarR8 = gx1.R(p65Var, r28VarG4);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA3);
                tp7.B(p65Var, cuVar2, i89VarL8);
                ka1.z(i11, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR8);
                r28 r28VarE2 = jfc.e(o28Var, 38.0f);
                if (1.0f <= 0.0d) {
                    z16.a("invalid weight; must be greater than zero");
                }
                z3 = true;
                r28 r28VarB = r28VarE2.b(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true));
                amb ambVar2 = bmb.a;
                j4 = j9;
                z2 = false;
                dy0.a(flb.a0(r28VarB, j4, ambVar2), p65Var, 0);
                hp7.t(p65Var, jfc.l(o28Var, 8.0f));
                dy0.a(flb.a0(jfc.l(o28Var, 38.0f), j4, ambVar2), p65Var, 0);
                p65Var.p(true);
            } else {
                z2 = false;
                j4 = j9;
                z3 = true;
                p65Var.Y(-1827227029);
            }
            p65Var.p(z2);
            hp7.t(p65Var, jfc.l(o28Var, 12.0f));
            p65Var.p(z3);
            p65Var.p(z3);
            p65Var.p(z3);
            j2 = j4;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            j2 = j;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j2, i, 15);
        }
    }

    public static final void q(n7b n7bVar, c7b c7bVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-483062289);
        int i2 = (p65Var.f(n7bVar) ? 4 : 2) | i | (p65Var.f(c7bVar) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            r28 r28VarJ = ka1.j((jp7) p65Var.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ui9(c7bVar, 25, n7bVar);
                p65Var.j0(objM);
            }
            fo7.l((m45) objM, vo7.R(p65Var, R.string.common_report), xn7.L, bgf.N(jfc.d(w2g.F(o28Var, 24.0f, 21.0f, 24.0f, 21.0f), 1.0f), "button_report"), n7bVar.c, p65Var, 3456, 0);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(n7bVar, c7bVar, i, 13);
        }
    }

    public static final void s(vpc vpcVar, bo4 bo4Var, c7b c7bVar, x12 x12Var, int i) {
        p65 p65Var;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1028138182);
        int i2 = 16;
        int i3 = i | (p65Var2.h(vpcVar) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(c7bVar) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var2, i3 & 14);
            nhc nhcVarF = mk7.F(p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new qna(13);
                p65Var2.j0(objM);
            }
            pr7.b(bgf.N(new l60((x45) objM, false), "report_user_screen"), pxf.E(534326966, new g7b(c7bVar), p65Var2), pxf.E(703470741, new pma(c7bVar, 12, l78VarZ), p65Var2), pxf.E(872614516, new w87(nhcVarF, 21), p65Var2), null, 0, 0L, 0L, null, pxf.E(-1402877301, new qg9(c7bVar, i2, l78VarZ), p65Var2), p65Var2, 805309872, 496);
            p65Var = p65Var2;
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            boolean zH = p65Var.h(bo4Var) | p65Var.f(nhcVarF) | p65Var.h(resources) | ((i3 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                rna rnaVar = new rna(bo4Var, nhcVarF, resources, c7bVar, null, 9);
                p65Var.j0(rnaVar);
                objM2 = rnaVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 2, vpcVar, bo4Var, c7bVar);
        }
    }

    public static final void t(c7b c7bVar, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(522879903);
        int i2 = (p65Var2.f(c7bVar) ? 4 : 2) | i;
        if (p65Var2.P(i2 & 1, (i2 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.report_user_title);
            boolean z = (i2 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new uta(0, c7bVar, c7b.class, "onClose", "onClose()V", 0, 14);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, strR, (m45) ((qh6) objM), null, vn7.J(R.drawable.ic_close_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_close), 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_VENDOR);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g7b(c7bVar, i);
        }
    }

    public static final void u(int i, int i2, x12 x12Var, m45 m45Var, r28 r28Var, String str, String str2) {
        String str3;
        int i3;
        String str4;
        String str5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-607515387);
        int i4 = i | (p65Var.f(str) ? 4 : 2);
        int i5 = i2 & 2;
        if (i5 != 0) {
            i3 = i4 | 48;
            str3 = str2;
        } else {
            str3 = str2;
            i3 = i4 | (p65Var.f(str3) ? 32 : 16);
        }
        int i6 = i3 | (p65Var.h(m45Var) ? 256 : 128);
        if (p65Var.P(i6 & 1, (i6 & 1171) != 1170)) {
            String str6 = i5 != 0 ? null : str3;
            r28 r28VarR = hlg.r(jfc.d(r28Var, 1.0f), false, null, new vkb(0), m45Var, 11);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i7 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, cuVar4, r28VarR2);
            o28 o28Var = o28.b;
            r28 r28VarF = jfc.f(o28Var, 48.0f, 0.0f, 2);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), true);
            sn3 sn3Var = jt7.c;
            jjd.b(str, r28VarU, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, i6 & 14, 0, 131068);
            p65Var = p65Var;
            boolean z = false;
            c09 c09VarJ = vn7.J(R.drawable.ic_chevron_forward, 0, p65Var);
            r28 r28VarG = w2g.G(o28Var, 0.0f, 0.0f, 16.0f, 0.0f, 11);
            sn3 sn3Var2 = kt7.b;
            qv5.b(c09VarJ, null, r28VarG, ((zo7) p65Var.j(sn3Var2)).o, p65Var, 440, 0);
            p65Var.p(true);
            if (str6 != null) {
                p65Var.Y(831438084);
                str5 = str6;
                jjd.b(str5, w2g.G(o28Var, 24.0f, 0.0f, 64.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, ((i6 >> 3) & 14) | 48, 0, 131068);
                p65Var = p65Var;
                z = false;
            } else {
                str5 = str6;
                p65Var.Y(822354247);
            }
            p65Var.p(z);
            p65Var.p(true);
            str4 = str5;
        } else {
            p65Var.S();
            str4 = str3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rma(str, str4, m45Var, r28Var, i, i2, 4);
        }
    }

    public static final void v(e6d e6dVar, b6d b6dVar, r28 r28Var, x12 x12Var, int i) {
        e6d e6dVar2;
        p65 p65Var;
        r28 r28Var2;
        l78 l78Var;
        boolean z;
        boolean z2;
        b6dVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(192833010);
        int i2 = i | (p65Var2.f(e6dVar) ? 4 : 2) | (p65Var2.f(b6dVar) ? 32 : 16) | 384;
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.TRUE);
                p65Var2.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            boolean zN = yi2.N(p65Var2);
            boolean zF = p65Var2.f(e6dVar.f);
            Object objM2 = p65Var2.M();
            if (zF || objM2 == uobVar) {
                objM2 = qo7.u(null);
                p65Var2.j0(objM2);
            }
            l78 l78Var3 = (l78) objM2;
            o28 o28Var = o28.b;
            r28 r28VarB = jfc.b(jfc.d(o28Var, 1.0f), 0.0f, 58.0f, 1);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var2.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarB);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            sn3 sn3Var = l36.a;
            if (((Boolean) p65Var2.j(sn3Var)).booleanValue()) {
                e6dVar2 = e6dVar;
                l78Var = l78Var2;
                p65Var = p65Var2;
                z = false;
                p65Var.Y(1456513162);
            } else {
                p65Var2.Y(1458423630);
                int i4 = i2 & 14;
                boolean zF2 = (i4 == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var2.f(l78Var3);
                Object objM3 = p65Var2.M();
                if (zF2 || objM3 == uobVar) {
                    iu iuVar = new iu(b6dVar, e6dVar, l78Var2, l78Var3, 25);
                    e6dVar2 = e6dVar;
                    l78Var = l78Var2;
                    p65Var2.j0(iuVar);
                    objM3 = iuVar;
                } else {
                    e6dVar2 = e6dVar;
                    l78Var = l78Var2;
                }
                x45 x45Var = (x45) objM3;
                boolean zG = p65Var2.g(zN) | (i4 == 4);
                Object objM4 = p65Var2.M();
                if (zG || objM4 == uobVar) {
                    objM4 = new xl0(e6dVar2, zN, 5);
                    p65Var2.j0(objM4);
                }
                p65Var = p65Var2;
                vc2.a(x45Var, null, (x45) objM4, p65Var, 0, 2);
                z = false;
            }
            p65Var.p(z);
            if (((Boolean) l78Var.getValue()).booleanValue()) {
                p65Var.Y(1462002270);
                p65 p65Var3 = p65Var;
                xz5.o(iy0.a.a(jfc.l(o28Var, 24.0f), z46.h), ((Boolean) p65Var.j(sn3Var)).booleanValue() ? Float.valueOf(0.75f) : null, 2.0f, ((zo7) p65Var.j(kt7.b)).d, 0L, 0, p65Var3, 384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var = p65Var3;
                z2 = false;
            } else {
                z2 = false;
                p65Var.Y(1456513162);
            }
            p65Var.p(z2);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            e6dVar2 = e6dVar;
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 1, e6dVar2, b6dVar, r28Var2);
        }
    }

    public static final void w(int i, String str) {
        if (str.charAt(i) == '-') {
            return;
        }
        StringBuilder sbC = ev6.C("Expected '-' (hyphen) at index ", i, ", but was '");
        sbC.append(str.charAt(i));
        sbC.append('\'');
        throw new IllegalArgumentException(sbC.toString().toString());
    }

    public static void x(long j, String str) {
        if (j >= 0) {
            return;
        }
        ay0.e(str);
    }

    public static ev7 y(String str, Collection collection) {
        collection.getClass();
        Collection collection2 = collection;
        ArrayList arrayList = new ArrayList(cu1.k0(collection2, 10));
        Iterator it2 = collection2.iterator();
        while (it2.hasNext()) {
            arrayList.add(((mn6) it2.next()).H());
        }
        wgc wgcVarD = vp7.D(arrayList);
        int i = wgcVarD.a;
        ev7 sj1Var = i != 0 ? i != 1 ? new sj1(str, (ev7[]) wgcVarD.toArray(new ev7[0])) : (ev7) wgcVarD.get(0) : dv7.b;
        return wgcVarD.a <= 1 ? sj1Var : new tv6(sj1Var);
    }

    public static StaticLayout z(CharSequence charSequence, TextPaint textPaint, int i, int i2, TextDirectionHeuristic textDirectionHeuristic, Layout.Alignment alignment, int i3, TextUtils.TruncateAt truncateAt, int i4, int i5, boolean z, int i6, int i7, int i8, int i9) {
        if (i2 < 0) {
            c26.a("invalid start value");
        }
        int length = charSequence.length();
        if (i2 < 0 || i2 > length) {
            c26.a("invalid end value");
        }
        if (i3 < 0) {
            c26.a("invalid maxLines value");
        }
        if (i < 0) {
            c26.a("invalid width value");
        }
        if (i4 < 0) {
            c26.a("invalid ellipsizedWidth value");
        }
        StaticLayout.Builder builderObtain = StaticLayout.Builder.obtain(charSequence, 0, i2, textPaint, i);
        builderObtain.setTextDirection(textDirectionHeuristic);
        builderObtain.setAlignment(alignment);
        builderObtain.setMaxLines(i3);
        builderObtain.setEllipsize(truncateAt);
        builderObtain.setEllipsizedWidth(i4);
        builderObtain.setLineSpacing(0.0f, 1.0f);
        builderObtain.setIncludePad(z);
        builderObtain.setBreakStrategy(i6);
        builderObtain.setHyphenationFrequency(i9);
        builderObtain.setIndents(null, null);
        int i10 = Build.VERSION.SDK_INT;
        if (i10 >= 26) {
            epe.a0(builderObtain, i5);
        }
        if (i10 >= 28) {
            uy.L(builderObtain);
        }
        if (i10 >= 33) {
            v4.w(builderObtain, i7, i8);
        }
        if (i10 >= 35) {
            dv3.a(builderObtain);
        }
        return builderObtain.build();
    }

    public static final void m(vpc vpcVar, x2a x2aVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        o28 o28Var;
        boolean z;
        vpcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-211704635);
        int i2 = i | (p65Var.h(vpcVar) ? 4 : 2);
        if ((i & 48) == 0) {
            i2 |= p65Var.f(x2aVar) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new mr9(5);
                p65Var.j0(objM);
            }
            o28 o28Var2 = o28.b;
            r28 r28VarN = bgf.N(wxb.a(o28Var2, false, (x45) objM), "profile_premium");
            d3a d3aVar = (d3a) guc.z(vpcVar, p65Var, i3 & 14).getValue();
            if (d3aVar instanceof a3a) {
                p65Var.Y(-1880332544);
                String strR = vo7.R(p65Var, R.string.profile_premium_title);
                String strR2 = vo7.R(p65Var, R.string.profile_premium_upsell_description);
                int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                boolean z2 = i4 == 32;
                Object objM2 = p65Var.M();
                if (z2 || objM2 == uobVar) {
                    bo9 bo9Var = new bo9(0, x2aVar, x2a.class, "onClose", "onClose()V", 0, 16);
                    p65Var.j0(bo9Var);
                    objM2 = bo9Var;
                }
                qh6 qh6Var = (qh6) objM2;
                String strR3 = vo7.R(p65Var, R.string.common_upgrade);
                String strR4 = vo7.R(p65Var, R.string.learn_more);
                boolean z3 = i4 == 32;
                Object objM3 = p65Var.M();
                if (z3 || objM3 == uobVar) {
                    bo9 bo9Var2 = new bo9(0, x2aVar, x2a.class, "onUpgradeButtonClicked", "onUpgradeButtonClicked()V", 0, 17);
                    p65Var.j0(bo9Var2);
                    objM3 = bo9Var2;
                }
                qh6 qh6Var2 = (qh6) objM3;
                z = i4 == 32;
                Object objM4 = p65Var.M();
                if (z || objM4 == uobVar) {
                    bo9 bo9Var3 = new bo9(0, x2aVar, x2a.class, "onLearnMoreButtonClicked", mBTDfueQiGWRV.qJpwHiUxJQtLPbn, 0, 18);
                    p65Var.j0(bo9Var3);
                    objM4 = bo9Var3;
                }
                o28Var = o28Var2;
                h(strR, (m45) qh6Var, r28VarN, strR2, strR3, (m45) qh6Var2, strR4, (m45) ((qh6) objM4), p65Var, 0, 0);
                p65Var.p(false);
            } else {
                o28Var = o28Var2;
                if (d3aVar instanceof c3a) {
                    p65Var.Y(-1879742397);
                    String str = new SimpleDateFormat("MMMM yyyy", Locale.US).format(Long.valueOf(((c3a) d3aVar).a));
                    String strR5 = vo7.R(p65Var, R.string.profile_premium_title);
                    str.getClass();
                    String strQ = vo7.Q(R.string.you_profile_premium_description, new Object[]{str}, p65Var);
                    int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                    boolean z4 = i5 == 32;
                    Object objM5 = p65Var.M();
                    if (z4 || objM5 == uobVar) {
                        bo9 bo9Var4 = new bo9(0, x2aVar, x2a.class, "onClose", "onClose()V", 0, 19);
                        p65Var.j0(bo9Var4);
                        objM5 = bo9Var4;
                    }
                    qh6 qh6Var3 = (qh6) objM5;
                    String strR6 = vo7.R(p65Var, R.string.common_got_it);
                    z = i5 == 32;
                    Object objM6 = p65Var.M();
                    if (z || objM6 == uobVar) {
                        bo9 bo9Var5 = new bo9(0, x2aVar, x2a.class, "onClose", "onClose()V", 0, 20);
                        p65Var.j0(bo9Var5);
                        objM6 = bo9Var5;
                    }
                    h(strR5, (m45) qh6Var3, r28VarN, strQ, strR6, (m45) ((qh6) objM6), null, null, p65Var, 0, 192);
                    p65Var.p(false);
                } else if (d3aVar instanceof b3a) {
                    p65Var.Y(-1879153986);
                    b3a b3aVar = (b3a) d3aVar;
                    String str2 = new SimpleDateFormat("MMMM yyyy", Locale.US).format(Long.valueOf(b3aVar.b));
                    String strR7 = vo7.R(p65Var, R.string.profile_premium_title);
                    String str3 = b3aVar.a;
                    str2.getClass();
                    String strQ2 = vo7.Q(R.string.profile_premium_description, new Object[]{str3, str2}, p65Var);
                    int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                    boolean z5 = i6 == 32;
                    Object objM7 = p65Var.M();
                    if (z5 || objM7 == uobVar) {
                        bo9 bo9Var6 = new bo9(0, x2aVar, x2a.class, "onClose", "onClose()V", 0, 21);
                        p65Var.j0(bo9Var6);
                        objM7 = bo9Var6;
                    }
                    qh6 qh6Var4 = (qh6) objM7;
                    String strR8 = vo7.R(p65Var, R.string.common_got_it);
                    z = i6 == 32;
                    Object objM8 = p65Var.M();
                    if (z || objM8 == uobVar) {
                        bo9 bo9Var7 = new bo9(0, x2aVar, x2a.class, "onClose", "onClose()V", 0, 22);
                        p65Var.j0(bo9Var7);
                        objM8 = bo9Var7;
                    }
                    h(strR7, (m45) qh6Var4, r28VarN, strQ2, strR8, (m45) ((qh6) objM8), null, null, p65Var, 0, 192);
                    p65Var.p(false);
                } else if (g76.L(d3aVar, z2a.b)) {
                    p65Var.Y(-1584619422);
                    String strR9 = vo7.R(p65Var, R.string.profile_premium_title);
                    z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                    Object objM9 = p65Var.M();
                    if (z || objM9 == uobVar) {
                        bo9 bo9Var8 = new bo9(0, x2aVar, x2a.class, "onClose", "onClose()V", 0, 23);
                        p65Var.j0(bo9Var8);
                        objM9 = bo9Var8;
                    }
                    g(strR9, (m45) ((qh6) objM9), r28VarN, null, w2g.j, p65Var, 24576, 8);
                    p65Var.p(false);
                } else {
                    if (!g76.L(d3aVar, z2a.a)) {
                        throw ho2.L(p65Var, -1584677284, false);
                    }
                    p65Var.Y(-1584601650);
                    p65Var.p(false);
                    x2aVar.a();
                }
            }
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 15, vpcVar, x2aVar, r28Var2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void r(n7b n7bVar, final c7b c7bVar, r28 r28Var, x12 x12Var, int i) {
        final int i2;
        Object utaVar;
        o28 o28Var;
        n7b n7bVar2 = n7bVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1720479877);
        int i3 = i | (p65Var.f(n7bVar2) ? 4 : 2) | (p65Var.f(c7bVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var2 = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            r28 r28VarR3 = wgf.R(r28Var, wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarR3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            hp7.t(p65Var, jfc.l(o28Var2, 16.0f));
            n7bVar2 = n7bVar;
            e7b e7bVar = n7bVar2.a;
            boolean z = e7bVar == e7b.HARASSMENT;
            String strR = vo7.R(p65Var, R.string.report_user_reason_harassment);
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i7 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                final int i8 = 2;
                objM = new m45() { // from class: f7b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i9 = i8;
                        c1e c1eVar = c1e.a;
                        c7b c7bVar2 = c7bVar;
                        switch (i9) {
                            case 0:
                                c7bVar2.a(e7b.SPAM);
                                break;
                            case 1:
                                c7bVar2.a(e7b.AI_GENERATED_CONTENT);
                                break;
                            case 2:
                                c7bVar2.a(e7b.HARASSMENT);
                                break;
                            default:
                                c7bVar2.a(e7b.RULES_VIOLATION);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            final int i9 = 3;
            aq7.e(z, strR, (m45) objM, bgf.N(o28Var2, "radio_button_harassment"), p65Var, 3072);
            boolean z3 = e7bVar == e7b.RULES_VIOLATION;
            String strR2 = vo7.R(p65Var, R.string.report_user_reason_rules_violation);
            boolean z4 = i7 == 32;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                objM2 = new m45() { // from class: f7b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i9;
                        c1e c1eVar = c1e.a;
                        c7b c7bVar2 = c7bVar;
                        switch (i92) {
                            case 0:
                                c7bVar2.a(e7b.SPAM);
                                break;
                            case 1:
                                c7bVar2.a(e7b.AI_GENERATED_CONTENT);
                                break;
                            case 2:
                                c7bVar2.a(e7b.HARASSMENT);
                                break;
                            default:
                                c7bVar2.a(e7b.RULES_VIOLATION);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            aq7.e(z3, strR2, (m45) objM2, bgf.N(o28Var2, "radio_button_rules_violation"), p65Var, 3072);
            boolean z5 = e7bVar == e7b.SPAM;
            String strR3 = vo7.R(p65Var, R.string.report_user_reason_spam);
            boolean z6 = i7 == 32;
            Object objM3 = p65Var.M();
            if (z6 || objM3 == uobVar) {
                i2 = 0;
                objM3 = new m45() { // from class: f7b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i2;
                        c1e c1eVar = c1e.a;
                        c7b c7bVar2 = c7bVar;
                        switch (i92) {
                            case 0:
                                c7bVar2.a(e7b.SPAM);
                                break;
                            case 1:
                                c7bVar2.a(e7b.AI_GENERATED_CONTENT);
                                break;
                            case 2:
                                c7bVar2.a(e7b.HARASSMENT);
                                break;
                            default:
                                c7bVar2.a(e7b.RULES_VIOLATION);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM3);
            } else {
                i2 = 0;
            }
            aq7.e(z5, strR3, (m45) objM3, bgf.N(o28Var2, "radio_button_spam"), p65Var, 3072);
            boolean z7 = e7bVar == e7b.AI_GENERATED_CONTENT ? 1 : i2;
            String strR4 = vo7.R(p65Var, R.string.report_user_reason_ai_generated_content);
            int i10 = i7 == 32 ? 1 : i2;
            Object objM4 = p65Var.M();
            if (i10 != 0 || objM4 == uobVar) {
                final int i11 = 1;
                objM4 = new m45() { // from class: f7b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i11;
                        c1e c1eVar = c1e.a;
                        c7b c7bVar2 = c7bVar;
                        switch (i92) {
                            case 0:
                                c7bVar2.a(e7b.SPAM);
                                break;
                            case 1:
                                c7bVar2.a(e7b.AI_GENERATED_CONTENT);
                                break;
                            case 2:
                                c7bVar2.a(e7b.HARASSMENT);
                                break;
                            default:
                                c7bVar2.a(e7b.RULES_VIOLATION);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM4);
            }
            aq7.e(z7, strR4, (m45) objM4, bgf.N(o28Var2, "radio_button_ai_generated_content"), p65Var, 3072);
            hp7.t(p65Var, jfc.l(o28Var2, 16.0f));
            boolean z8 = n7bVar2.b;
            String strR5 = vo7.R(p65Var, R.string.report_user_block_user);
            int i12 = i7 == 32 ? 1 : i2;
            Object objM5 = p65Var.M();
            if (i12 != 0 || objM5 == uobVar) {
                objM5 = new eb8(22, c7bVar);
                p65Var.j0(objM5);
            }
            int i13 = i2;
            bgf.i(z8, strR5, (x45) objM5, bgf.N(o28Var2, gYpYQDQkhfs.cjwMvc), false, p65Var, 3072);
            hp7.t(p65Var, jfc.l(o28Var2, 25.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            String strN = y30.n(24.0f, R.string.report_user_report_violation, p65Var, p65Var, o28Var2);
            int i14 = i7 == 32 ? 1 : i13;
            Object objM6 = p65Var.M();
            if (i14 != 0 || objM6 == uobVar) {
                o28Var = o28Var2;
                utaVar = new uta(0, c7bVar, c7b.class, "goToReportViolationScreen", pUlNWdybf.mZiavvFQGWy, 0, 12);
                p65Var.j0(utaVar);
            } else {
                utaVar = objM6;
                o28Var = o28Var2;
            }
            u(3072, 2, p65Var, (m45) ((qh6) utaVar), bgf.N(o28Var, "row_report_violation"), strN, null);
            String strR6 = vo7.R(p65Var, R.string.report_user_read_our_rules_title);
            String strR7 = vo7.R(p65Var, R.string.report_user_read_our_rules_description);
            if (i7 == 32) {
                i13 = 1;
            }
            Object objM7 = p65Var.M();
            if (i13 != 0 || objM7 == uobVar) {
                uta utaVar2 = new uta(0, c7bVar, c7b.class, "goToMediumRulesScreen", "goToMediumRulesScreen()V", 0, 13);
                p65Var.j0(utaVar2);
                objM7 = utaVar2;
            }
            u(3072, 0, p65Var, (m45) ((qh6) objM7), bgf.N(o28Var, "row_rules"), strR6, strR7);
            p65Var = p65Var;
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 1, n7bVar2, c7bVar, r28Var);
        }
    }
}
