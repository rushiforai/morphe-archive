package defpackage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Shader;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.io.File;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlin.reflect.jvm.internal.impl.km.InconsistentKotlinMetadataException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qq7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;

    public static final long A(long j, oq6 oq6Var) {
        return oq6Var == oq6.Horizontal ? h72.a(f72.j(j), f72.h(j), f72.i(j), f72.g(j)) : h72.a(f72.i(j), f72.g(j), f72.j(j), f72.h(j));
    }

    public static final n05 B(y5a y5aVar, bh4 bh4Var) {
        n05 n05Var = new n05(1);
        int i = y5aVar.c;
        s6a s6aVarF = null;
        if ((y5aVar.b & 4) == 4) {
            x5a x5aVar = y5aVar.e;
            if (x5aVar == null) {
                ay0.e("Required value was null.");
                return null;
            }
            int i2 = ota.g[x5aVar.ordinal()];
            if (i2 != 1 && i2 != 2 && i2 != 3) {
                ygf.a();
                return null;
            }
        }
        wjc wjcVar = (wjc) bh4Var.b;
        int i3 = y5aVar.b;
        if ((i3 & 8) == 8) {
            s6aVarF = y5aVar.f;
        } else if ((i3 & 16) == 16) {
            s6aVarF = wjcVar.f(y5aVar.g);
        }
        if (s6aVarF != null) {
            D(s6aVarF, bh4Var);
        }
        List<y5a> list = y5aVar.h;
        list.getClass();
        for (y5a y5aVar2 : list) {
            y5aVar2.getClass();
            n05Var.a.add(B(y5aVar2, bh4Var));
        }
        List<y5a> list2 = y5aVar.i;
        list2.getClass();
        for (y5a y5aVar3 : list2) {
            y5aVar3.getClass();
            n05Var.b.add(B(y5aVar3, bh4Var));
        }
        return n05Var;
    }

    public static final jm6 C(i6a i6aVar, bh4 bh4Var) {
        ArrayList arrayList;
        i6aVar.getClass();
        jm6 jm6Var = new jm6(i6aVar.d, (i6aVar.c & 256) == 256 ? i6aVar.q : q(i6aVar.d), (i6aVar.c & 512) == 512 ? i6aVar.r : q(i6aVar.d), ((p98) bh4Var.a).getString(i6aVar.f));
        List list = i6aVar.i;
        list.getClass();
        bh4 bh4VarG = bh4Var.g(list);
        wjc wjcVar = (wjc) bh4VarG.b;
        List<x6a> list2 = i6aVar.i;
        list2.getClass();
        for (x6a x6aVar : list2) {
            x6aVar.getClass();
            jm6Var.d.add(E(x6aVar, bh4VarG));
        }
        s6a s6aVarR = vn7.R(i6aVar, wjcVar);
        if (s6aVarR != null) {
            D(s6aVarR, bh4VarG);
        }
        List list3 = i6aVar.o;
        list3.getClass();
        Iterator it2 = list3.iterator();
        while (true) {
            boolean zHasNext = it2.hasNext();
            arrayList = jm6Var.f;
            if (!zHasNext) {
                break;
            }
            a7a a7aVar = (a7a) it2.next();
            a7aVar.getClass();
            arrayList.add(F(a7aVar, bh4VarG));
        }
        if (i6aVar.o.isEmpty()) {
            List list4 = i6aVar.l;
            list4.getClass();
            if (!list4.isEmpty()) {
                Iterator it3 = vn7.l(i6aVar, wjcVar).iterator();
                while (it3.hasNext()) {
                    D((s6a) it3.next(), bh4VarG);
                    arrayList.add(new om6(0, "_"));
                }
            }
        }
        if ((i6aVar.c & 128) == 128) {
            a7a a7aVar2 = i6aVar.p;
            a7aVar2.getClass();
            F(a7aVar2, bh4VarG);
        }
        D(vn7.V(i6aVar, wjcVar), bh4VarG);
        List<Integer> list5 = i6aVar.s;
        list5.getClass();
        for (Integer num : list5) {
            num.getClass();
            jm6Var.g.add(y(num.intValue(), bh4VarG));
        }
        Iterator it4 = ((List) bh4VarG.g).iterator();
        while (it4.hasNext()) {
            ((kf6) ((sz7) it4.next())).getClass();
            p98 p98Var = (p98) bh4VarG.a;
            gm6 gm6Var = qf6.a;
            gm6Var.getClass();
            List<h5a> list6 = i6aVar.u;
            list6.getClass();
            for (h5a h5aVar : list6) {
                h5aVar.getClass();
                jm6Var.h.add(jq7.r(h5aVar, p98Var));
            }
            List<h5a> list7 = i6aVar.v;
            list7.getClass();
            ArrayList arrayList2 = jm6Var.b.b;
            for (h5a h5aVar2 : list7) {
                h5aVar2.getClass();
                arrayList2.add(jq7.r(h5aVar2, p98Var));
            }
            km6 km6Var = jm6Var.c;
            if (km6Var != null) {
                List<h5a> list8 = i6aVar.w;
                list8.getClass();
                ArrayList arrayList3 = km6Var.b;
                for (h5a h5aVar3 : list8) {
                    h5aVar3.getClass();
                    arrayList3.add(jq7.r(h5aVar3, p98Var));
                }
            }
            List<h5a> list9 = i6aVar.x;
            list9.getClass();
            for (h5a h5aVar4 : list9) {
                h5aVar4.getClass();
                jm6Var.e.add(jq7.r(h5aVar4, p98Var));
            }
            List<h5a> list10 = i6aVar.y;
            list10.getClass();
            for (h5a h5aVar5 : list10) {
                h5aVar5.getClass();
                jm6Var.i.add(jq7.r(h5aVar5, p98Var));
            }
            List<h5a> list11 = i6aVar.z;
            list11.getClass();
            for (h5a h5aVar6 : list11) {
                h5aVar6.getClass();
                jm6Var.j.add(jq7.r(h5aVar6, p98Var));
            }
            q74 q74Var = hg6.a;
            if6 if6VarB = hg6.b(i6aVar, p98Var, wjcVar, true);
            o75 o75Var = gg6.d;
            o75Var.getClass();
            ag6 ag6Var = (ag6) il7.z(i6aVar, o75Var);
            yf6 yf6Var = null;
            yf6 yf6Var2 = (ag6Var == null || !ag6Var.g()) ? null : ag6Var.e;
            yf6 yf6Var3 = (ag6Var == null || (ag6Var.b & 8) != 8) ? null : ag6Var.f;
            Object objI = i6aVar.i(gg6.e);
            objI.getClass();
            ((Number) objI).intValue();
            if (if6VarB != null) {
                String str = if6VarB.r;
                String str2 = if6VarB.s;
                str.getClass();
                str2.getClass();
            }
            if (yf6Var2 != null) {
                p98Var.getString(yf6Var2.c);
                p98Var.getString(yf6Var2.d);
            }
            if (yf6Var3 != null) {
                p98Var.getString(yf6Var3.c);
                p98Var.getString(yf6Var3.d);
            }
            yf6 yf6Var4 = (ag6Var == null || (ag6Var.b & 2) != 2) ? null : ag6Var.d;
            if (yf6Var4 != null) {
                p98Var.getString(yf6Var4.c);
                p98Var.getString(yf6Var4.d);
            }
            if (ag6Var != null && (ag6Var.b & 16) == 16) {
                yf6Var = ag6Var.g;
            }
            if (yf6Var != null) {
                p98Var.getString(yf6Var.c);
                p98Var.getString(yf6Var.d);
            }
        }
        return jm6Var;
    }

    public static final lm6 D(s6a s6aVar, bh4 bh4Var) {
        gsa cm6Var;
        pm6 pm6Var;
        wjc wjcVar = (wjc) bh4Var.b;
        p98 p98Var = (p98) bh4Var.a;
        lm6 lm6Var = new lm6((s6aVar.e ? 1 : 0) + (s6aVar.q << 1));
        hm6 hm6Var = null;
        if (s6aVar.n()) {
            cm6Var = new am6(jq7.o(p98Var, s6aVar.i));
        } else {
            int i = s6aVar.c;
            if ((i & 128) == 128) {
                cm6Var = new bm6(jq7.o(p98Var, s6aVar.l));
            } else if ((i & 32) == 32) {
                cm6Var = new cm6(s6aVar.j);
            } else {
                if ((i & 64) != 64) {
                    throw new InconsistentKotlinMetadataException("No classifier (class, type alias or type parameter) recorded for Type", null);
                }
                Integer numC = bh4Var.c(s6aVar.k);
                if (numC == null) {
                    throw new InconsistentKotlinMetadataException("No type parameter id for ".concat(p98Var.getString(s6aVar.k)), null);
                }
                cm6Var = new cm6(numC.intValue());
            }
        }
        lm6Var.b = cm6Var;
        for (q6a q6aVar : s6aVar.d) {
            p6a p6aVar = q6aVar.c;
            if (p6aVar == null) {
                ay0.e("Required value was null.");
                return null;
            }
            int i2 = ota.b[p6aVar.ordinal()];
            if (i2 == 1) {
                pm6Var = pm6.IN;
            } else if (i2 == 2) {
                pm6Var = pm6.OUT;
            } else if (i2 == 3) {
                pm6Var = pm6.INVARIANT;
            } else {
                if (i2 != 4) {
                    ygf.a();
                    return null;
                }
                pm6Var = null;
            }
            ArrayList arrayList = lm6Var.c;
            if (pm6Var != null) {
                int i3 = q6aVar.b;
                s6a s6aVarF = (i3 & 2) == 2 ? q6aVar.d : (i3 & 4) == 4 ? wjcVar.f(q6aVar.e) : null;
                if (s6aVarF == null) {
                    throw new InconsistentKotlinMetadataException("No type argument for non-STAR projection in Type", null);
                }
                arrayList.add(new nm6(pm6Var, D(s6aVarF, bh4Var)));
            } else {
                arrayList.add(nm6.c);
            }
        }
        int i4 = s6aVar.c;
        s6a s6aVarF2 = (i4 & 1024) == 1024 ? s6aVar.o : (i4 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048 ? wjcVar.f(s6aVar.p) : null;
        lm6Var.d = s6aVarF2 != null ? D(s6aVarF2, bh4Var) : null;
        s6a s6aVarI = vn7.I(s6aVar, wjcVar);
        lm6Var.e = s6aVarI != null ? D(s6aVarI, bh4Var) : null;
        int i5 = s6aVar.c;
        s6a s6aVarF3 = (i5 & 4) == 4 ? s6aVar.g : (i5 & 8) == 8 ? wjcVar.f(s6aVar.h) : null;
        if (s6aVarF3 != null) {
            lm6 lm6VarD = D(s6aVarF3, bh4Var);
            String string = (s6aVar.c & 2) == 2 ? p98Var.getString(s6aVar.f) : null;
            hm6 hm6Var2 = new hm6();
            hm6Var2.a = lm6VarD;
            hm6Var2.b = string;
            hm6Var = hm6Var2;
        }
        lm6Var.f = hm6Var;
        Iterator it2 = ((List) bh4Var.g).iterator();
        while (it2.hasNext()) {
            ((kf6) ((sz7) it2.next())).getClass();
            gm6 gm6Var = ng6.c;
            gm6Var.getClass();
            ng6 ng6Var = (ng6) dm2.X(lm6Var.g, gm6Var);
            Object objI = s6aVar.i(gg6.g);
            objI.getClass();
            ng6Var.a = ((Boolean) objI).booleanValue();
            for (h5a h5aVar : (List) s6aVar.i(gg6.f)) {
                ArrayList arrayList2 = ng6Var.b;
                h5aVar.getClass();
                arrayList2.add(jq7.r(h5aVar, p98Var));
            }
        }
        return lm6Var;
    }

    public static final n05 E(x6a x6aVar, bh4 bh4Var) {
        pm6 pm6Var;
        p98 p98Var = (p98) bh4Var.a;
        w6a w6aVar = x6aVar.g;
        if (w6aVar == null) {
            ay0.e("Required value was null.");
            return null;
        }
        int i = ota.a[w6aVar.ordinal()];
        if (i == 1) {
            pm6Var = pm6.IN;
        } else if (i == 2) {
            pm6Var = pm6.OUT;
        } else {
            if (i != 3) {
                ygf.a();
                return null;
            }
            pm6Var = pm6.INVARIANT;
        }
        boolean z = x6aVar.f;
        n05 n05Var = new n05(z ? 1 : 0, p98Var.getString(x6aVar.e), pm6Var);
        Iterator it2 = vn7.i0(x6aVar, (wjc) bh4Var.b).iterator();
        while (it2.hasNext()) {
            n05Var.a.add(D((s6a) it2.next(), bh4Var));
        }
        Iterator it3 = ((List) bh4Var.g).iterator();
        while (it3.hasNext()) {
            ((kf6) ((sz7) it3.next())).getClass();
            gm6 gm6Var = pg6.b;
            gm6Var.getClass();
            pg6 pg6Var = (pg6) dm2.X(n05Var.b, gm6Var);
            for (h5a h5aVar : (List) x6aVar.i(gg6.h)) {
                ArrayList arrayList = pg6Var.a;
                h5aVar.getClass();
                arrayList.add(jq7.r(h5aVar, p98Var));
            }
        }
        return n05Var;
    }

    public static final om6 F(a7a a7aVar, bh4 bh4Var) {
        int i = a7aVar.d;
        int i2 = a7aVar.e;
        p98 p98Var = (p98) bh4Var.a;
        om6 om6Var = new om6(i, p98Var.getString(i2));
        wjc wjcVar = (wjc) bh4Var.b;
        D(vn7.f0(a7aVar, wjcVar), bh4Var);
        int i3 = a7aVar.c;
        s6a s6aVarF = (i3 & 16) == 16 ? a7aVar.h : (i3 & 32) == 32 ? wjcVar.f(a7aVar.i) : null;
        if (s6aVarF != null) {
            D(s6aVarF, bh4Var);
        }
        if ((a7aVar.c & 64) == 64) {
            e5a e5aVar = a7aVar.k;
            e5aVar.getClass();
            jq7.s(e5aVar, p98Var);
        }
        Iterator it2 = ((List) bh4Var.g).iterator();
        while (it2.hasNext()) {
            ((kf6) ((sz7) it2.next())).getClass();
            List<h5a> list = a7aVar.j;
            list.getClass();
            for (h5a h5aVar : list) {
                h5aVar.getClass();
                om6Var.b.add(jq7.r(h5aVar, p98Var));
            }
        }
        return om6Var;
    }

    public static final mn1 G(mn1 mn1Var) {
        y05 y05Var = gnc.a;
        return new mn1(gnc.a, n98.e("U".concat(mn1Var.f().c())));
    }

    public static String H(String str, Object... objArr) {
        int length;
        int length2;
        int iIndexOf;
        String strY;
        int i = 0;
        int i2 = 0;
        while (true) {
            length = objArr.length;
            if (i2 >= length) {
                break;
            }
            Object obj = objArr[i2];
            if (obj == null) {
                strY = "null";
            } else {
                try {
                    strY = obj.toString();
                } catch (Exception e) {
                    String strX = ev6.x(obj.getClass().getName(), "@", Integer.toHexString(System.identityHashCode(obj)));
                    Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strX), (Throwable) e);
                    strY = ev6.y("<", strX, " threw ", e.getClass().getName(), ">");
                }
            }
            objArr[i2] = strY;
            i2++;
        }
        StringBuilder sb = new StringBuilder(str.length() + (length * 16));
        int i3 = 0;
        while (true) {
            length2 = objArr.length;
            if (i >= length2 || (iIndexOf = str.indexOf("%s", i3)) == -1) {
                break;
            }
            sb.append((CharSequence) str, i3, iIndexOf);
            sb.append(objArr[i]);
            i++;
            i3 = iIndexOf + 2;
        }
        sb.append((CharSequence) str, i3, str.length());
        if (i < length2) {
            sb.append(" [");
            sb.append(objArr[i]);
            for (int i4 = i + 1; i4 < objArr.length; i4++) {
                sb.append(", ");
                sb.append(objArr[i4]);
            }
            sb.append(']');
        }
        return sb.toString();
    }

    public static BigInteger I(byte[] bArr) {
        return new BigInteger(1, bArr);
    }

    public static byte[] J(BigInteger bigInteger) {
        if (bigInteger.signum() != -1) {
            return bigInteger.toByteArray();
        }
        ay0.e("n must not be negative");
        return null;
    }

    public static byte[] K(BigInteger bigInteger, int i) throws GeneralSecurityException {
        if (bigInteger.signum() == -1) {
            ay0.e("integer must be nonnegative");
            return null;
        }
        byte[] byteArray = bigInteger.toByteArray();
        if (byteArray.length == i) {
            return byteArray;
        }
        int i2 = i + 1;
        if (byteArray.length > i2) {
            ygf.l("integer too large");
            return null;
        }
        if (byteArray.length != i2) {
            byte[] bArr = new byte[i];
            System.arraycopy(byteArray, 0, bArr, i - byteArray.length, byteArray.length);
            return bArr;
        }
        if (byteArray[0] == 0) {
            return Arrays.copyOfRange(byteArray, 1, byteArray.length);
        }
        ygf.l("integer too large");
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:86:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.m45 r25, defpackage.r28 r26, defpackage.v7c r27, defpackage.mz1 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 330
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qq7.a(m45, r28, v7c, mz1, x12, int, int):void");
    }

    public static final void b(String str, boolean z, m45 m45Var, m45 m45Var2, x12 x12Var, int i) {
        p65 p65Var;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1635444593);
        int i2 = (p65Var2.f(str != null ? new ax5(str) : null) ? 4 : 2) | i | (p65Var2.g(z) ? 32 : 16) | (p65Var2.h(m45Var) ? 256 : 128) | (p65Var2.h(m45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new lg9(5);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            m40.h((m45) objM, new pb3(4), pxf.E(-966749402, new fz9(str, m45Var, z, m45Var2, 0), p65Var2), p65Var, 438, 0);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fz9(str, z, m45Var, m45Var2, i);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v23, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r5v30 */
    public static final void c(String str, String str2, mda mdaVar, String str3, fha fhaVar, wea weaVar, lma lmaVar, x12 x12Var, int i) {
        fha fhaVar2;
        wea weaVar2;
        p65 p65Var;
        lma lmaVar2;
        lma lmaVar3;
        fha fhaVar3;
        wea weaVar3;
        ?? r5;
        long j;
        str.getClass();
        str2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-393351725);
        int i2 = 4;
        int i3 = i | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.f(mdaVar) ? 256 : 128) | (p65Var2.f(str3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 598016;
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var2.U();
            int i5 = i & 1;
            Object obj = w12.a;
            if (i5 == 0 || p65Var2.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var2.M();
                if (z || objM == obj) {
                    objM = new bb0(str, str2, 10);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                hm5 hm5VarE = t40.E(wueVarA, p65Var2);
                g68 g68VarN = wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var);
                s1b s1bVar = n1b.a;
                fha fhaVar4 = (fha) to7.z(s1bVar.b(fha.class), wueVarA, hm5VarE, g68VarN, p65Var2);
                wue wueVarA2 = e67.a(p65Var2);
                if (wueVarA2 == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                wea weaVar4 = (wea) to7.z(s1bVar.b(wea.class), wueVarA2, null, wueVarA2 instanceof pi5 ? ((pi5) wueVarA2).getDefaultViewModelCreationExtras() : og2.b, p65Var2);
                boolean z2 = (i3 & 14) == 4;
                Object objM2 = p65Var2.M();
                if (z2 || objM2 == obj) {
                    objM2 = new ov5(str, 20);
                    p65Var2.j0(objM2);
                }
                x45 x45Var2 = (x45) objM2;
                wue wueVarA3 = e67.a(p65Var2);
                if (wueVarA3 == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    lmaVar3 = (lma) to7.z(s1bVar.b(lma.class), wueVarA3, t40.E(wueVarA3, p65Var2), wueVarA3 instanceof pi5 ? r40.N(((pi5) wueVarA3).getDefaultViewModelCreationExtras(), x45Var2) : r40.N(og2.b, x45Var2), p65Var2);
                    fhaVar3 = fhaVar4;
                    weaVar3 = weaVar4;
                }
            } else {
                p65Var2.S();
                fhaVar3 = fhaVar;
                weaVar3 = weaVar;
                lmaVar3 = lmaVar;
            }
            p65Var2.q();
            cqb cqbVarD = zpb.d(p65Var2);
            Context context = (Context) p65Var2.j(eo.b);
            Object[] objArrCopyOf = Arrays.copyOf(new sc8[0], 0);
            mya myaVar = new mya(new wn7(27), 3, new eb8(i4, context));
            boolean zH = p65Var2.h(context);
            Object objM3 = p65Var2.M();
            if (zH || objM3 == obj) {
                objM3 = new nc0(context, i2);
                p65Var2.j0(objM3);
            }
            db8 db8Var = (db8) hp7.G(objArrCopyOf, myaVar, (m45) objM3, p65Var2, 0, 4);
            l78 l78VarL = no7.l(bo.z(db8Var.b.z), null, p65Var2, 48, 2);
            Object objM4 = p65Var2.M();
            if (objM4 == obj) {
                objM4 = bjc.b(new rr1(l78VarL, 9));
                p65Var2.j0(objM4);
            }
            if (g76.L((String) ((upc) objM4).getValue(), "main_route")) {
                p65Var2.Y(-53852883);
                j = z46.h(p65Var2).b;
                r5 = 0;
            } else {
                r5 = 0;
                p65Var2.Y(-53851253);
                j = z46.h(p65Var2).a;
            }
            p65Var2.p(r5);
            upc upcVarA = wec.a(j, f76.Q(250, r5, null, 6), "System bar color", p65Var2, 432, 8);
            long j2 = z46.h(p65Var2).a;
            nr5 nr5Var = rv8.r;
            fha fhaVar5 = fhaVar3;
            wea weaVar5 = weaVar3;
            lma lmaVar4 = lmaVar3;
            p65 p65Var3 = p65Var2;
            rr7.d(rv8.X(flb.a0(rv8.X(flb.a0(o28.b, j2, nr5Var), rv8.w), ((uu1) upcVarA.getValue()).a, nr5Var), rv8.u), false, cqbVarD, null, null, null, null, 0, false, null, 0.0f, 0L, 0L, 0L, z46.h(p65Var2).b, 0L, pxf.E(-522292249, new s9d(mdaVar, str, str2, fhaVar5, weaVar5, lmaVar4, db8Var, str3, cqbVarD, 1), p65Var2), p65Var3, 0, 196602);
            fhaVar2 = fhaVar5;
            weaVar2 = weaVar5;
            lmaVar2 = lmaVar4;
            p65Var = p65Var3;
        } else {
            p65Var2.S();
            fhaVar2 = fhaVar;
            weaVar2 = weaVar;
            p65Var = p65Var2;
            lmaVar2 = lmaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(str, str2, mdaVar, str3, fhaVar2, weaVar2, lmaVar2, i);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0317  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0340  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0374  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0376  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0381  */
    /* JADX WARN: Type inference failed for: r10v14 */
    /* JADX WARN: Type inference failed for: r10v15 */
    /* JADX WARN: Type inference failed for: r10v25 */
    /* JADX WARN: Type inference failed for: r12v1, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r12v3, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r12v4 */
    /* JADX WARN: Type inference failed for: r12v5 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r1v22 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8, types: [boolean] */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v18 */
    /* JADX WARN: Type inference failed for: r8v19 */
    /* JADX WARN: Type inference failed for: r8v21 */
    /* JADX WARN: Type inference failed for: r8v23 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.zib r55, defpackage.pq5 r56, defpackage.r28 r57, defpackage.x12 r58, int r59) {
        /*
            Method dump skipped, instruction units count: 943
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qq7.d(zib, pq5, r28, x12, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x032a A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:103:0x032c  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0322  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(final defpackage.yub r35, defpackage.hub r36, final defpackage.fub r37, final defpackage.gub r38, final defpackage.fub r39, final defpackage.gub r40, final defpackage.fub r41, defpackage.r28 r42, defpackage.x12 r43, int r44) {
        /*
            Method dump skipped, instruction units count: 862
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qq7.e(yub, hub, fub, gub, fub, gub, fub, r28, x12, int):void");
    }

    public static final void f(avb avbVar, hub hubVar, fub fubVar, gub gubVar, fub fubVar2, gub gubVar2, fub fubVar3, r28 r28Var, x12 x12Var, int i) {
        int i2;
        fub fubVar4;
        gub gubVar3;
        fub fubVar5;
        gub gubVar4;
        fub fubVar6;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-162066687);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(avbVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(hubVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            fubVar4 = fubVar;
            i2 |= p65Var2.f(fubVar4) ? 256 : 128;
        } else {
            fubVar4 = fubVar;
        }
        if ((i & 3072) == 0) {
            gubVar3 = gubVar;
            i2 |= p65Var2.f(gubVar3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            gubVar3 = gubVar;
        }
        if ((i & 24576) == 0) {
            fubVar5 = fubVar2;
            i2 |= p65Var2.f(fubVar5) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            fubVar5 = fubVar2;
        }
        if ((196608 & i) == 0) {
            gubVar4 = gubVar2;
            i2 |= p65Var2.f(gubVar4) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            gubVar4 = gubVar2;
        }
        if ((1572864 & i) == 0) {
            fubVar6 = fubVar3;
            i2 |= p65Var2.f(fubVar6) ? 1048576 : 524288;
        } else {
            fubVar6 = fubVar3;
        }
        if ((12582912 & i) == 0) {
            i2 |= p65Var2.f(r28Var) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i2 & 1, (4793491 & i2) != 4793490)) {
            p65Var = p65Var2;
            pr7.b(bgf.N(r28Var, "search"), pxf.E(-1502145275, new pma(avbVar, 26, hubVar), p65Var2), null, null, null, 0, 0L, 0L, null, pxf.E(1131370320, new c98(avbVar, hubVar, fubVar4, gubVar3, fubVar5, gubVar4, fubVar6, 3), p65Var2), p65Var, 805306416, 508);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ey4(avbVar, hubVar, fubVar, gubVar, fubVar2, gubVar2, fubVar3, r28Var, i);
        }
    }

    public static final void g(String str, jtb jtbVar, r28 r28Var, gvb gvbVar, x12 x12Var, int i) {
        gvb gvbVar2;
        gvb gvbVar3;
        int i2;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(951598446);
        int i3 = 2;
        int i4 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(jtbVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ov5(str, 29);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    gvbVar3 = (gvb) to7.z(n1b.a.b(gvb.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i4 & (-7169);
                }
            } else {
                p65Var.S();
                i2 = i4 & (-7169);
                gvbVar3 = gvbVar;
            }
            p65Var.q();
            f((avb) guc.z(gvbVar3.k, p65Var, 0).getValue(), new hub(jtbVar, gvbVar3), new fub(jtbVar, gvbVar3), new gub(jtbVar, gvbVar3), new fub(jtbVar, gvbVar3), new gub(jtbVar, gvbVar3), new fub(jtbVar, gvbVar3), r28Var, p65Var, 29360128 & (i2 << 15));
            boolean zH = p65Var.h(gvbVar3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new obb(gvbVar3, null, i3);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            gvbVar2 = gvbVar3;
        } else {
            p65Var.S();
            gvbVar2 = gvbVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 2, r28Var, (Object) str, (Object) jtbVar, (Object) gvbVar2);
        }
    }

    public static m2d h() {
        return new m2d(null);
    }

    public static final mn1 i(String str) {
        y05 y05Var = gnc.a;
        return new mn1(gnc.h, n98.e(str));
    }

    public static final mn1 j(String str) {
        y05 y05Var = gnc.a;
        return new mn1(gnc.a, n98.e(str));
    }

    public static i28 k(JSONObject jSONObject) {
        float[] fArr;
        float[] fArr2;
        if (jSONObject == null) {
            return null;
        }
        try {
            String string = jSONObject.getString("use_case");
            String string2 = jSONObject.getString("asset_uri");
            String strOptString = jSONObject.optString("rules_uri", null);
            int i = jSONObject.getInt("version_id");
            k28 k28Var = k28.a;
            JSONArray jSONArray = jSONObject.getJSONArray("thresholds");
            Set set = ec2.a;
            if (set.contains(k28.class)) {
                fArr2 = null;
            } else {
                try {
                    if (set.contains(k28Var) || jSONArray == null) {
                        fArr = null;
                        fArr2 = fArr;
                    } else {
                        try {
                            fArr = new float[jSONArray.length()];
                            int length = jSONArray.length();
                            for (int i2 = 0; i2 < length; i2++) {
                                try {
                                    String string3 = jSONArray.getString(i2);
                                    string3.getClass();
                                    fArr[i2] = Float.parseFloat(string3);
                                } catch (JSONException unused) {
                                }
                            }
                        } catch (Throwable th) {
                            ec2.a(k28Var, th);
                            fArr = null;
                        }
                        fArr2 = fArr;
                    }
                } catch (Throwable th2) {
                    ec2.a(k28.class, th2);
                    fArr2 = null;
                }
            }
            string.getClass();
            string2.getClass();
            return new i28(string, string2, strOptString, i, fArr2);
        } catch (Exception unused2) {
            return null;
        }
    }

    public static final mn1 l(String str) {
        y05 y05Var = gnc.a;
        return new mn1(gnc.c, n98.e(str));
    }

    public static final byte[] m(String str) {
        int i;
        char cCharAt;
        str.getClass();
        byte[] bArr = new byte[str.length() * 4];
        int length = str.length();
        int i2 = 0;
        while (i2 < length) {
            char cCharAt2 = str.charAt(i2);
            if (g76.Q(cCharAt2, 128) >= 0) {
                int length2 = str.length();
                int i3 = i2;
                while (i2 < length2) {
                    char cCharAt3 = str.charAt(i2);
                    if (g76.Q(cCharAt3, 128) < 0) {
                        int i4 = i3 + 1;
                        bArr[i3] = (byte) cCharAt3;
                        i2++;
                        while (true) {
                            i3 = i4;
                            if (i2 >= length2 || g76.Q(str.charAt(i2), 128) >= 0) {
                                break;
                            }
                            i4 = i3 + 1;
                            bArr[i3] = (byte) str.charAt(i2);
                            i2++;
                        }
                    } else {
                        if (g76.Q(cCharAt3, RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) < 0) {
                            bArr[i3] = (byte) ((cCharAt3 >> 6) | 192);
                            i3 += 2;
                            bArr[i3 + 1] = (byte) ((cCharAt3 & '?') | 128);
                        } else if (55296 > cCharAt3 || cCharAt3 >= 57344) {
                            bArr[i3] = (byte) ((cCharAt3 >> '\f') | CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY);
                            bArr[i3 + 1] = (byte) (((cCharAt3 >> 6) & 63) | 128);
                            i3 += 3;
                            bArr[i3 + 2] = (byte) ((cCharAt3 & '?') | 128);
                        } else if (g76.Q(cCharAt3, 56319) > 0 || length2 <= (i = i2 + 1) || 56320 > (cCharAt = str.charAt(i)) || cCharAt >= 57344) {
                            bArr[i3] = 63;
                            i2++;
                            i3++;
                        } else {
                            int iCharAt = (str.charAt(i) + (cCharAt3 << '\n')) - 56613888;
                            bArr[i3] = (byte) ((iCharAt >> 18) | 240);
                            bArr[i3 + 1] = (byte) (((iCharAt >> 12) & 63) | 128);
                            bArr[i3 + 2] = (byte) (((iCharAt >> 6) & 63) | 128);
                            i3 += 4;
                            bArr[i3 + 3] = (byte) ((iCharAt & 63) | 128);
                            i2 += 2;
                        }
                        i2++;
                    }
                }
                return Arrays.copyOf(bArr, i3);
            }
            bArr[i2] = (byte) cCharAt2;
            i2++;
        }
        return Arrays.copyOf(bArr, str.length());
    }

    public static long n(long j, oq6 oq6Var) {
        oq6 oq6Var2 = oq6.Horizontal;
        return h72.a(oq6Var == oq6Var2 ? f72.j(j) : f72.i(j), oq6Var == oq6Var2 ? f72.h(j) : f72.g(j), oq6Var == oq6Var2 ? f72.i(j) : f72.j(j), oq6Var == oq6Var2 ? f72.g(j) : f72.h(j));
    }

    public static long o(int i, long j) {
        return h72.a(0, f72.h(j), (i & 4) != 0 ? f72.i(j) : 0, f72.g(j));
    }

    public static void p(i28 i28Var, ArrayList arrayList) {
        File[] fileArrListFiles;
        String str = i28Var.a;
        int i = i28Var.d;
        File fileO = hpe.o();
        if (fileO != null && (fileArrListFiles = fileO.listFiles()) != null && fileArrListFiles.length != 0) {
            String str2 = str + '_' + i;
            for (File file : fileArrListFiles) {
                String name = file.getName();
                name.getClass();
                if (tuc.N(name, str, false) && !tuc.N(name, str2, false)) {
                    file.delete();
                }
            }
        }
        String str3 = str + '_' + i;
        String str4 = i28Var.b;
        f70 f70Var = new f70(28, arrayList);
        File file2 = new File(hpe.o(), str3);
        if (file2.exists()) {
            f70Var.b(file2);
        } else {
            new kg4(str4, file2, f70Var).execute(new String[0]);
        }
    }

    public static final int q(int i) {
        return cm4.b(cm4.c.d(i).booleanValue(), (g7a) cm4.d.d(i), (c6a) cm4.e.d(i));
    }

    public static final void r(LinkedHashMap linkedHashMap) {
        Set<Map.Entry> setEntrySet = linkedHashMap.entrySet();
        int iP = ei7.P(cu1.k0(setEntrySet, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(iP);
        for (Map.Entry entry : setEntrySet) {
            linkedHashMap2.put(entry.getValue(), entry.getKey());
        }
    }

    public static final Paint s(Bitmap bitmap, int i, int i2) {
        Matrix matrix = new Matrix();
        float fL0 = (float) nk7.l0(bitmap.getWidth(), bitmap.getHeight(), i, i2, dqb.FILL);
        matrix.setTranslate((i - (bitmap.getWidth() * fL0)) / 2.0f, (i2 - (bitmap.getHeight() * fL0)) / 2.0f);
        matrix.preScale(fL0, fL0);
        Paint paint = new Paint(3);
        Shader.TileMode tileMode = Shader.TileMode.CLAMP;
        BitmapShader bitmapShader = new BitmapShader(bitmap, tileMode, tileMode);
        bitmapShader.setLocalMatrix(matrix);
        paint.setShader(bitmapShader);
        return paint;
    }

    public static final q28 t(a43 a43Var, int i) {
        q28 q28Var = ((q28) a43Var).a.f;
        if (q28Var == null || (q28Var.d & i) == 0) {
            return null;
        }
        while (q28Var != null) {
            int i2 = q28Var.c;
            if ((i2 & 2) != 0) {
                return null;
            }
            if ((i2 & i) != 0) {
                return q28Var;
            }
            q28Var = q28Var.f;
        }
        return null;
    }

    public static void u(uid uidVar, i00 i00Var, qjd qjdVar, hp6 hp6Var, ejd ejdVar, boolean z, yqa yqaVar) {
        if (z) {
            int iE = bkd.e(uidVar.b);
            yqaVar.a(iE);
            String str = uhd.a;
            zwa zwaVarB = iE < qjdVar.a.a.b.length() ? qjdVar.b(iE) : iE != 0 ? qjdVar.b(iE - 1) : new zwa(0.0f, 0.0f, 1.0f, (int) (uhd.a((mkd) i00Var.c, (m73) i00Var.d, (yy4) i00Var.f, uhd.a, 1) & 4294967295L));
            float f = zwaVarB.b;
            float f2 = zwaVarB.a;
            long jI = hp6Var.I((((long) Float.floatToRawIntBits(f2)) << 32) | (((long) Float.floatToRawIntBits(f)) & 4294967295L));
            zwa zwaVarL = lk7.l((((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (jI & 4294967295L)))) & 4294967295L) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (jI >> 32)))) << 32), (((long) Float.floatToRawIntBits(zwaVarB.c - f2)) << 32) | (((long) Float.floatToRawIntBits(zwaVarB.d - f)) & 4294967295L));
            if (g76.L((ejd) ejdVar.a.b.get(), ejdVar)) {
                ejdVar.b.h(zwaVarL);
            }
        }
    }

    public static r28 v(r28 r28Var, lr lrVar) {
        return r28Var.b(new nb9(lrVar));
    }

    public static final mn1 w(n98 n98Var) {
        y05 y05Var = gnc.a;
        mn1 mn1Var = gnc.l;
        return new mn1(mn1Var.a, n98.e(n98Var.c().concat(mn1Var.f().c())));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object x(defpackage.qkc r5, defpackage.p92 r6) {
        /*
            boolean r0 = r6 instanceof defpackage.npe
            if (r0 == 0) goto L13
            r0 = r6
            npe r0 = (defpackage.npe) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            npe r0 = new npe
            r0.<init>(r6)
        L18:
            java.lang.Object r6 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            kz0 r5 = r0.c
            qkc r0 = r0.b
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L2c
            goto L4e
        L2c:
            r5 = move-exception
            goto L57
        L2e:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L34:
            defpackage.br7.v(r6)
            kz0 r6 = new kz0     // Catch: java.lang.Throwable -> L55
            r6.<init>()     // Catch: java.lang.Throwable -> L55
            r0.b = r5     // Catch: java.lang.Throwable -> L55
            r0.c = r6     // Catch: java.lang.Throwable -> L55
            r0.e = r3     // Catch: java.lang.Throwable -> L55
            zz0 r0 = r5.a     // Catch: java.lang.Throwable -> L55
            r0.S(r6)     // Catch: java.lang.Throwable -> L55
            c1e r0 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L55
            if (r0 != r1) goto L4c
            return r1
        L4c:
            r0 = r5
            r5 = r6
        L4e:
            defpackage.xz5.F(r0, r4)
            return r5
        L52:
            r0 = r5
            r5 = r6
            goto L57
        L55:
            r6 = move-exception
            goto L52
        L57:
            throw r5     // Catch: java.lang.Throwable -> L58
        L58:
            r6 = move-exception
            defpackage.xz5.F(r0, r5)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qq7.x(qkc, p92):java.lang.Object");
    }

    public static final iq1 y(int i, bh4 bh4Var) {
        b83 b83Var;
        iq1 iq1Var;
        sm6 sm6Var;
        rm6 rm6Var;
        iq1 iq1Var2 = new iq1(11, false);
        p98 p98Var = (p98) bh4Var.a;
        kse kseVar = (kse) bh4Var.c;
        p98Var.getClass();
        e7a e7aVar = (e7a) bu1.A0(i, kseVar.a);
        jse jseVar = jse.d;
        if (e7aVar == null) {
            iq1Var = null;
        } else {
            Integer numValueOf = (e7aVar.b & 1) == 1 ? Integer.valueOf(e7aVar.c) : null;
            Integer numValueOf2 = (e7aVar.b & 2) == 2 ? Integer.valueOf(e7aVar.d) : null;
            jse jseVar2 = numValueOf2 != null ? new jse(numValueOf2.intValue() & 255, (numValueOf2.intValue() >> 8) & 255, (numValueOf2.intValue() >> 16) & 255) : numValueOf != null ? new jse(numValueOf.intValue() & 7, (numValueOf.intValue() >> 3) & 15, (numValueOf.intValue() >> 7) & 127) : jseVar;
            c7a c7aVar = e7aVar.e;
            c7aVar.getClass();
            int i2 = ise.a[c7aVar.ordinal()];
            if (i2 == 1) {
                b83Var = b83.WARNING;
            } else if (i2 == 2) {
                b83Var = b83.ERROR;
            } else {
                if (i2 != 3) {
                    ygf.a();
                    return null;
                }
                b83Var = b83.HIDDEN;
            }
            b83 b83Var2 = b83Var;
            Integer numValueOf3 = (e7aVar.b & 8) == 8 ? Integer.valueOf(e7aVar.f) : null;
            String string = (e7aVar.b & 16) == 16 ? p98Var.getString(e7aVar.g) : null;
            d7a d7aVar = e7aVar.h;
            d7aVar.getClass();
            iq1Var = new iq1(jseVar2, d7aVar, b83Var2, numValueOf3, string);
        }
        if (iq1Var == null) {
            throw new InconsistentKotlinMetadataException("No VersionRequirement with the given id in the table", null);
        }
        d7a d7aVar2 = iq1Var != null ? (d7a) iq1Var.c : null;
        int i3 = d7aVar2 == null ? -1 : ota.c[d7aVar2.ordinal()];
        if (i3 == -1) {
            sm6Var = sm6.UNKNOWN;
        } else if (i3 == 1) {
            sm6Var = sm6.LANGUAGE_VERSION;
        } else if (i3 == 2) {
            sm6Var = sm6.COMPILER_VERSION;
        } else {
            if (i3 != 3) {
                ygf.a();
                return null;
            }
            sm6Var = sm6.API_VERSION;
        }
        b83 b83Var3 = iq1Var != null ? (b83) iq1Var.d : null;
        int i4 = b83Var3 == null ? -1 : ota.d[b83Var3.ordinal()];
        if (i4 == -1) {
            rm6Var = rm6.HIDDEN;
        } else if (i4 == 1) {
            rm6Var = rm6.WARNING;
        } else if (i4 != 2) {
            if (i4 != 3) {
                ygf.a();
                return null;
            }
            rm6Var = rm6.HIDDEN;
        } else {
            rm6Var = rm6.ERROR;
        }
        sm6Var.getClass();
        iq1Var2.b = sm6Var;
        rm6Var.getClass();
        iq1Var2.c = rm6Var;
        iq1Var2.d = iq1Var != null ? (Integer) iq1Var.e : null;
        iq1Var2.e = iq1Var != null ? (String) iq1Var.f : null;
        if (iq1Var != null) {
            jseVar = (jse) iq1Var.b;
        }
        iq1Var2.f = new qm6(jseVar.a, jseVar.b, jseVar.c);
        return iq1Var2;
    }

    public static final mn1 z(String str) {
        y05 y05Var = gnc.a;
        return new mn1(gnc.b, n98.e(str));
    }
}
