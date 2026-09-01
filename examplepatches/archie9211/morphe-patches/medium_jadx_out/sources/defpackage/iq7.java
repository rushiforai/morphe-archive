package defpackage;

import android.view.View;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;
import com.apollographql.apollo.exception.ApolloException;
import com.apollographql.apollo.exception.ApolloNetworkException;
import com.apollographql.apollo.exception.JsonDataException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import kotlinx.serialization.MissingFieldException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class iq7 {
    public static final /* synthetic */ int a = 0;

    public static final xgd A(a43 a43Var) {
        jhd jhdVar;
        ugd ugdVar = new ugd();
        br7.z(a43Var, zgd.a, new zzb(new zzb(13, ugdVar), new hgb(1, ugdVar, ugd.class, "addFilter", "addFilter$foundation(Lkotlin/jvm/functions/Function1;)V", 0, 12)));
        x68 x68Var = new x68();
        x68 x68Var2 = ugdVar.a;
        Object[] objArr = x68Var2.a;
        int i = x68Var2.b;
        int i2 = 0;
        int i3 = 0;
        boolean z = true;
        vgd vgdVar = null;
        while (true) {
            jhdVar = jhd.b;
            if (i3 >= i) {
                break;
            }
            vgd vgdVar2 = (vgd) objArr[i3];
            if (!z || vgdVar2 != jhdVar) {
                if (vgdVar2 == jhdVar && vgdVar == jhdVar) {
                    z = false;
                    break;
                    break;
                }
                if (vgdVar2 != jhdVar) {
                    x68 x68Var3 = ugdVar.b;
                    Object[] objArr2 = x68Var3.a;
                    int i4 = x68Var3.b;
                    for (int i5 = 0; i5 < i4; i5++) {
                        if (!((Boolean) ((x45) objArr2[i5]).invoke(vgdVar2)).booleanValue()) {
                            z = false;
                            break;
                        }
                    }
                }
                x68Var.a(vgdVar2);
                z = false;
                vgdVar = vgdVar2;
            }
            i3++;
        }
        if (((vgd) (x68Var.h() ? null : x68Var.a[x68Var.b - 1])) == jhdVar) {
            x68Var.k(x68Var.b - 1);
        }
        v68 v68Var = x68Var.c;
        if (v68Var == null) {
            v68Var = new v68(i2, x68Var);
            x68Var.c = v68Var;
        }
        return new xgd(v68Var);
    }

    public static final void B(ru ruVar, String str, String str2) {
        ruVar.getClass();
        str.getClass();
        str2.getClass();
        ArrayList arrayList = ruVar.b;
        arrayList.add(str);
        arrayList.add(muc.y0(str2).toString());
    }

    public static final yi5 C(ru ruVar) {
        ruVar.getClass();
        return new yi5((String[]) ruVar.b.toArray(new String[0]));
    }

    public static final String D(yi5 yi5Var, int i) {
        yi5Var.getClass();
        String str = (String) k80.y0(i * 2, yi5Var.a);
        if (str != null) {
            return str;
        }
        z10.i(ev6.u("name[", i, ']'));
        return null;
    }

    public static final ru E(yi5 yi5Var) {
        yi5Var.getClass();
        ru ruVar = new ru(3);
        ArrayList arrayList = ruVar.b;
        String[] strArr = yi5Var.a;
        strArr.getClass();
        List listAsList = Arrays.asList(strArr);
        listAsList.getClass();
        arrayList.addAll(listAsList);
        return ruVar;
    }

    public static final String F(yi5 yi5Var, int i) {
        yi5Var.getClass();
        String str = (String) k80.y0((i * 2) + 1, yi5Var.a);
        if (str != null) {
            return str;
        }
        z10.i(ev6.u("value[", i, ']'));
        return null;
    }

    public static final ugb G(List list, x45 x45Var) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ugb ugbVar = (ugb) it2.next();
            if (((Boolean) x45Var.invoke(ugbVar)).booleanValue()) {
                return ugbVar;
            }
            ugb ugbVarG = G(ugbVar.m, x45Var);
            if (ugbVarG != null) {
                return ugbVarG;
            }
        }
        return null;
    }

    public static vc8 H(String str) {
        uc6 uc6VarE = r40.L(str).e();
        int iD = uc6VarE.s("signal").d();
        long jF = uc6VarE.s("timestamp").f();
        dc6 dc6VarS = uc6VarE.s("time_since_app_start_ms");
        Long lValueOf = null;
        if (dc6VarS != null && !(dc6VarS instanceof pc6)) {
            lValueOf = Long.valueOf(dc6VarS.f());
        }
        String strM = uc6VarE.s("signal_name").m();
        strM.getClass();
        String strM2 = uc6VarE.s("message").m();
        strM2.getClass();
        String strM3 = uc6VarE.s("stacktrace").m();
        strM3.getClass();
        return new vc8(iD, jF, lValueOf, strM, strM2, strM3);
    }

    public static int I(RecyclerView recyclerView) {
        sxa layoutManager = recyclerView.getLayoutManager();
        if (layoutManager instanceof LinearLayoutManager) {
            LinearLayoutManager linearLayoutManager = (LinearLayoutManager) layoutManager;
            View viewP0 = linearLayoutManager.P0(0, linearLayoutManager.v(), false, true);
            if (viewP0 == null) {
                return -1;
            }
            return sxa.H(viewP0);
        }
        if (!(layoutManager instanceof StaggeredGridLayoutManager)) {
            return 0;
        }
        StaggeredGridLayoutManager staggeredGridLayoutManager = (StaggeredGridLayoutManager) layoutManager;
        int[] iArr = new int[staggeredGridLayoutManager.p];
        for (int i = 0; i < staggeredGridLayoutManager.p; i++) {
            bd7 bd7Var = staggeredGridLayoutManager.q[i];
            iArr[i] = ((StaggeredGridLayoutManager) bd7Var.g).w ? bd7Var.g(r6.size() - 1, -1, false, true, false) : bd7Var.g(0, ((ArrayList) bd7Var.f).size(), false, true, false);
        }
        return iArr[0];
    }

    public static final void J(String str) {
        str.getClass();
        if (str.length() <= 0) {
            ay0.e("name is empty");
            return;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char cCharAt = str.charAt(i);
            if ('!' > cCharAt || cCharAt >= 127) {
                StringBuilder sb = new StringBuilder("Unexpected char 0x");
                kyd.I(16);
                String string = Integer.toString(cCharAt, 16);
                string.getClass();
                if (string.length() < 2) {
                    string = "0".concat(string);
                }
                sb.append(string);
                sb.append(" at ");
                sb.append(i);
                sb.append(" in header name: ");
                sb.append(str);
                throw new IllegalArgumentException(sb.toString().toString());
            }
        }
    }

    public static final void K(String str, String str2) {
        str.getClass();
        str2.getClass();
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char cCharAt = str.charAt(i);
            if (cCharAt != '\t' && (' ' > cCharAt || cCharAt >= 127)) {
                StringBuilder sb = new StringBuilder("Unexpected char 0x");
                kyd.I(16);
                String string = Integer.toString(cCharAt, 16);
                string.getClass();
                if (string.length() < 2) {
                    string = "0".concat(string);
                }
                sb.append(string);
                sb.append(" at ");
                sb.append(i);
                sb.append(" in ");
                sb.append(str2);
                sb.append(" value");
                sb.append(egf.m(str2) ? "" : ": ".concat(str));
                throw new IllegalArgumentException(sb.toString().toString());
            }
        }
    }

    public static final ugb L(ugb ugbVar) {
        return ugb.a(ugbVar, null, null, 0, false, O(ugbVar.m, new qna(19)), null, 0, false, 1044479);
    }

    public static int M(int i, int i2) {
        if (i > -12 || i2 > -65) {
            return -1;
        }
        return i ^ (i2 << 8);
    }

    public static int N(byte[] bArr, int i, int i2) {
        byte b = bArr[i - 1];
        int i3 = i2 - i;
        if (i3 == 0) {
            if (b > -12) {
                return -1;
            }
            return b;
        }
        if (i3 == 1) {
            return M(b, bArr[i]);
        }
        if (i3 != 2) {
            ywb.d();
            return 0;
        }
        byte b2 = bArr[i];
        byte b3 = bArr[i + 1];
        if (b > -12 || b2 > -65 || b3 > -65) {
            return -1;
        }
        return (b3 << 16) ^ ((b2 << 8) ^ b);
    }

    public static final ArrayList O(List list, x45 x45Var) {
        ArrayList arrayList = new ArrayList();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ugb ugbVar = (ugb) x45Var.invoke((ugb) it2.next());
            ugb ugbVarA = ugbVar != null ? ugb.a(ugbVar, null, null, 0, false, O(ugbVar.m, x45Var), null, 0, false, 1044479) : null;
            if (ugbVarA != null) {
                arrayList.add(ugbVarA);
            }
        }
        return arrayList;
    }

    public static int P(byte[] bArr, int i, int i2) {
        while (i < i2 && bArr[i] >= 0) {
            i++;
        }
        if (i >= i2) {
            return 0;
        }
        while (i < i2) {
            int i3 = i + 1;
            byte b = bArr[i];
            if (b >= 0) {
                i = i3;
            } else if (b < -32) {
                if (i3 >= i2) {
                    return b;
                }
                if (b < -62) {
                    return -1;
                }
                i += 2;
                if (bArr[i3] > -65) {
                    return -1;
                }
            } else if (b < -16) {
                if (i3 >= i2 - 1) {
                    return N(bArr, i3, i2);
                }
                int i4 = i + 2;
                byte b2 = bArr[i3];
                if (b2 > -65) {
                    return -1;
                }
                if (b == -32 && b2 < -96) {
                    return -1;
                }
                if (b == -19 && b2 >= -96) {
                    return -1;
                }
                i += 3;
                if (bArr[i4] > -65) {
                    return -1;
                }
            } else {
                if (i3 >= i2 - 2) {
                    return N(bArr, i3, i2);
                }
                int i5 = i + 2;
                byte b3 = bArr[i3];
                if (b3 > -65) {
                    return -1;
                }
                if ((((b3 + 112) + (b << 28)) >> 30) != 0) {
                    return -1;
                }
                int i6 = i + 3;
                if (bArr[i5] > -65) {
                    return -1;
                }
                i += 4;
                if (bArr[i6] > -65) {
                    return -1;
                }
            }
        }
        return 0;
    }

    public static final ArrayList Q(ugb ugbVar) {
        ugbVar.getClass();
        List list = ugbVar.m;
        ArrayList arrayList = new ArrayList();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            bu1.n0(Q((ugb) it2.next()), arrayList);
        }
        return arrayList;
    }

    public static l46 R(n46 n46Var, int i) {
        n46Var.getClass();
        boolean z = i > 0;
        Integer numValueOf = Integer.valueOf(i);
        if (!z) {
            lg8.f(46, numValueOf, "Step must be positive, was: ");
            return null;
        }
        int i2 = n46Var.a;
        int i3 = n46Var.b;
        if (n46Var.c <= 0) {
            i = -i;
        }
        return new l46(i2, i3, i);
    }

    public static final void S(int i, int i2, xzb xzbVar) {
        xzbVar.getClass();
        ArrayList arrayList = new ArrayList();
        int i3 = (~i) & i2;
        for (int i4 = 0; i4 < 32; i4++) {
            if ((i3 & 1) != 0) {
                arrayList.add(xzbVar.f(i4));
            }
            i3 >>>= 1;
        }
        throw new MissingFieldException(xzbVar.a(), arrayList);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r12v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r12v3 */
    /* JADX WARN: Type inference failed for: r12v4 */
    /* JADX WARN: Type inference failed for: r12v5 */
    public static final j00 T(fd6 fd6Var, hv8 hv8Var, UUID uuid, yl2 yl2Var, Set set) {
        j00 j00Var;
        ?? r12;
        j00 j00Var2 = null;
        try {
            j00Var = hp7.D(fd6Var, hv8Var, uuid, yl2Var, set);
            if (fd6Var.peek() != cd6.END_DOCUMENT) {
                throw new JsonDataException("Expected END_DOCUMENT but was " + fd6Var.peek(), null);
            }
        } catch (Throwable th) {
            if (uuid == null) {
                try {
                    uuid = UUID.randomUUID();
                    uuid.getClass();
                } catch (Throwable th2) {
                    Throwable th3 = th2;
                    try {
                        fd6Var.close();
                        r12 = th3;
                    } catch (Throwable th4) {
                        kyd.D(th3, th4);
                        r12 = th3;
                    }
                }
            }
            j00Var = new j00(uuid, hv8Var, null, null, th instanceof ApolloException ? th : new ApolloNetworkException("Error while reading JSON response", th), fy3.a, by3.a, true);
        }
        try {
            fd6Var.close();
        } catch (Throwable th5) {
            j00Var2 = th5;
        }
        r12 = j00Var2;
        j00Var2 = j00Var;
        if (r12 == 0) {
            return j00Var2;
        }
        throw r12;
    }

    public static void U(hz0 hz0Var, byte[] bArr) {
        long j;
        hz0Var.getClass();
        bArr.getClass();
        int length = bArr.length;
        int i = 0;
        do {
            byte[] bArr2 = hz0Var.e;
            int i2 = hz0Var.f;
            int i3 = hz0Var.g;
            if (bArr2 != null) {
                while (i2 < i3) {
                    int i4 = i % length;
                    bArr2[i2] = (byte) (bArr2[i2] ^ bArr[i4]);
                    i2++;
                    i = i4 + 1;
                }
            }
            long j2 = hz0Var.d;
            kz0 kz0Var = hz0Var.a;
            kz0Var.getClass();
            if (j2 == kz0Var.b) {
                ygf.f("no more bytes");
                return;
            }
            j = hz0Var.d;
        } while (hz0Var.m(j == -1 ? 0L : j + ((long) (hz0Var.g - hz0Var.f))) != -1);
    }

    public static final ugb V(ugb ugbVar, boolean z) {
        if (!z) {
            return L(ugbVar);
        }
        List list = ugbVar.m;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(ugb.a((ugb) it2.next(), null, null, 0, true, null, null, 0, false, 1047551));
        }
        return ugb.a(ugbVar, null, null, 0, false, arrayList, null, 0, false, 1044479);
    }

    public static n46 W(int i, int i2) {
        if (i2 > Integer.MIN_VALUE) {
            return new n46(i, i2 - 1, 1);
        }
        n46 n46Var = n46.d;
        return n46.d;
    }

    public static final String X(String str) {
        str.getClass();
        StringBuilder sb = new StringBuilder();
        byte[] bytes = str.getBytes(wk1.a);
        bytes.getClass();
        for (byte b : bytes) {
            int i = b & 255;
            if ((97 > i || i >= 123) && ((65 > i || i >= 91) && !((48 <= i && i < 58) || i == 45 || i == 46 || i == 95 || i == 126))) {
                kyd.I(16);
                String string = Integer.toString(i, 16);
                string.getClass();
                String upperCase = string.toUpperCase(Locale.ROOT);
                upperCase.getClass();
                if (upperCase.length() == 1) {
                    upperCase = "0".concat(upperCase);
                }
                sb.append("%".concat(upperCase));
            } else {
                sb.append((char) i);
            }
        }
        return sb.toString();
    }

    public static d1g Y(pcg pcgVar) {
        boolean z = false;
        int i = 19;
        if (pcgVar == pcg.d) {
            return new d1g(i, "HmacSha256", z);
        }
        if (pcgVar == pcg.e) {
            return new d1g(i, "HmacSha384", z);
        }
        if (pcgVar == pcg.f) {
            return new d1g(i, "HmacSha512", z);
        }
        ay0.e("Unrecognized HPKE KDF identifier");
        return null;
    }

    public static keg Z(ocg ocgVar) {
        if (ocgVar == ocg.d) {
            return new d87(16);
        }
        if (ocgVar == ocg.e) {
            return new d87(32);
        }
        if (ocgVar == ocg.f) {
            return new q9g(1);
        }
        ay0.e("Unrecognized HPKE AEAD identifier");
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:122:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0176  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x017e  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0197  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x01aa  */
    /* JADX WARN: Removed duplicated region for block: B:133:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00e4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.b24 r21, defpackage.r28 r22, java.lang.String r23, java.lang.String r24, java.lang.String r25, java.lang.String r26, defpackage.m45 r27, defpackage.m45 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 436
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iq7.a(b24, r28, java.lang.String, java.lang.String, java.lang.String, java.lang.String, m45, m45, x12, int, int):void");
    }

    public static reg a0(rcg rcgVar) {
        if (rcgVar == rcg.g) {
            return new zjf(new d1g(19, "HmacSha256", false));
        }
        if (rcgVar == rcg.d) {
            return d2f.u0(xug.zza);
        }
        if (rcgVar == rcg.e) {
            return d2f.u0(xug.zzb);
        }
        if (rcgVar == rcg.f) {
            return d2f.u0(xug.zzc);
        }
        ay0.e("Unrecognized HPKE KEM identifier");
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:119:0x017e  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0182  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0227  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x02dc  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0346  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x035a  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0369  */
    /* JADX WARN: Removed duplicated region for block: B:150:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00e8  */
    /* JADX WARN: Type inference failed for: r1v11 */
    /* JADX WARN: Type inference failed for: r1v8 */
    /* JADX WARN: Type inference failed for: r1v9, types: [boolean, int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.r28 r38, java.lang.String r39, java.lang.String r40, java.lang.String r41, java.lang.String r42, defpackage.m45 r43, defpackage.m45 r44, defpackage.x12 r45, int r46, int r47) {
        /*
            Method dump skipped, instruction units count: 884
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iq7.b(r28, java.lang.String, java.lang.String, java.lang.String, java.lang.String, m45, m45, x12, int, int):void");
    }

    public static void b0(int i, int i2) {
        String strJ;
        if (i < 0 || i >= i2) {
            if (i < 0) {
                strJ = mq7.J("%s (%s) must not be negative", "index", Integer.valueOf(i));
            } else {
                if (i2 < 0) {
                    ay0.e(b09.w(i2, "negative size: "));
                    return;
                }
                strJ = mq7.J("%s (%s) must be less than size (%s)", "index", Integer.valueOf(i), Integer.valueOf(i2));
            }
            throw new IndexOutOfBoundsException(strJ);
        }
    }

    public static final void c(ub0 ub0Var, ye7 ye7Var, x12 x12Var, int i) {
        p65 p65Var;
        ub0Var.getClass();
        ye7Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1060873375);
        int i2 = (p65Var2.f(ub0Var) ? 4 : 2) | i;
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(ye7Var) ? 32 : 16;
        }
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new qv7(0, ye7Var, ye7.class, "expand", "expand()V", 0, 1);
                p65Var2.j0(objM);
            }
            hl0 hl0Var = as7.a;
            p65Var = p65Var2;
            g3d.b((m45) ((qh6) objM), jfc.e(o28.b, 64.0f), false, null, ((zo7) p65Var2.j(kt7.b)).a, 0L, 0.0f, 0.0f, null, null, pxf.E(301136810, new hm4(ub0Var, 27, ye7Var), p65Var2), p65Var, 12582912, 876);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(ub0Var, ye7Var, i, 22);
        }
    }

    public static void c0(int i, int i2) {
        if (i < 0 || i > i2) {
            z10.i(e0(i, i2, "index"));
        }
    }

    public static final void d(sw5 sw5Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(704879604);
        int i2 = (p65Var.f(sw5Var) ? 4 : 2) | i;
        int i3 = 3;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            if (sw5Var != null) {
                p65Var.Y(-1305544013);
                int i5 = i2 & 14;
                boolean z = i5 == 4;
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z || objM == uobVar) {
                    objM = qo7.u(Boolean.TRUE);
                    p65Var.j0(objM);
                }
                l78 l78Var = (l78) objM;
                boolean z2 = i5 == 4;
                Object objM2 = p65Var.M();
                if (z2 || objM2 == uobVar) {
                    objM2 = qo7.u(Boolean.FALSE);
                    p65Var.j0(objM2);
                }
                l78 l78Var2 = (l78) objM2;
                k40.c(u57.a.a(bo.a0(p65Var)), pxf.E(397000499, new ho5(sw5Var, l78Var, l78Var2, 11), p65Var), p65Var, 56);
                vv2.c(((Boolean) l78Var.getValue()).booleanValue(), null, sz3.c(null, 3), sz3.d(null, 3), null, rv8.l, p65Var, 200064, 18);
                vv2.c(((Boolean) l78Var2.getValue()).booleanValue(), null, sz3.c(null, 3), sz3.d(null, 3), null, rv8.m, p65Var, 200064, 18);
                p65Var.p(false);
            } else {
                p65Var.Y(-1303690461);
                e(p65Var, 0);
                p65Var.p(false);
            }
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new x35(sw5Var, i, i3);
        }
    }

    public static void d0(int i, int i2, int i3) {
        if (i < 0 || i2 < i || i2 > i3) {
            throw new IndexOutOfBoundsException((i < 0 || i > i3) ? e0(i, i3, "start index") : (i2 < 0 || i2 > i3) ? e0(i2, i3, "end index") : mq7.J("end index (%s) must not be less than start index (%s)", Integer.valueOf(i2), Integer.valueOf(i)));
        }
    }

    public static final void e(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1082119083);
        if (p65Var.P(i & 1, i != 0)) {
            w2g.e(vn7.J(R.drawable.ic_story, 0, p65Var), null, r40.y(w2g.C(flb.a0(jfc.l(w2g.C(o28.b, 12.0f), 40.0f), xo7.c, rv8.r), 6.0f), bmb.a(2.0f)), null, v82.a, 0.0f, new bs0(5, xo7.f), p65Var, 24632, 40);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 25);
        }
    }

    public static String e0(int i, int i2, String str) {
        if (i < 0) {
            return mq7.J("%s (%s) must not be negative", str, Integer.valueOf(i));
        }
        if (i2 >= 0) {
            return mq7.J("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i), Integer.valueOf(i2));
        }
        ay0.e(b09.w(i2, "negative size: "));
        return null;
    }

    public static final void f(f9c f9cVar, u8c u8cVar, r28 r28Var, x12 x12Var, int i) {
        String str = f9cVar.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1386130416);
        int i2 = 2;
        int i3 = i | (p65Var.f(f9cVar) ? 4 : 2) | (p65Var.f(u8cVar) ? 32 : 16) | (p65Var.g(true) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            boolean z = !f9cVar.h;
            String strQ = vo7.Q(R.string.common_mute_author_cd, new Object[]{str}, p65Var);
            vkb vkbVar = new vkb(0);
            boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new x8c(u8cVar, f9cVar, i2);
                p65Var.j0(objM);
            }
            r28 r28VarG = w2g.G(hlg.r(r28VarD, z, strQ, vkbVar, (m45) objM, 8), 0.0f, 4.0f, 0.0f, 0.0f, 13);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            c09 c09VarJ = vn7.J(R.drawable.ic_mute, 0, p65Var);
            o28 o28Var = o28.b;
            r28 r28VarG2 = w2g.G(o28Var, 24.0f, 16.0f, 0.0f, 0.0f, 12);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, r28VarG2, ((zo7) p65Var.j(sn3Var)).o, p65Var, 440, 0);
            r28 r28VarF = w2g.F(o28Var, 24.0f, 16.0f, 24.0f, 16.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var, R.string.show_less_like_this_dialog_mute_author);
            sn3 sn3Var2 = jt7.c;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).m, p65Var, 0, 0, 131070);
            jjd.b(str, w2g.G(o28Var, 0.0f, 6.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).n, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 24960, 110588);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 19, f9cVar, u8cVar, r28Var);
        }
    }

    public static final void g(f9c f9cVar, u8c u8cVar, boolean z, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1899834557);
        int i2 = i | (p65Var.f(f9cVar) ? 4 : 2) | (p65Var.f(u8cVar) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            String str = f9cVar.f;
            String str2 = f9cVar.g;
            if (str == null) {
                ay0.e("If canMuteCollection is true, a collectionId must be provided");
                return;
            }
            if (str2 == null) {
                ay0.e("If canMuteCollection is true, a collectionName must be provided");
                return;
            }
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            boolean z2 = !f9cVar.h;
            String strQ = vo7.Q(R.string.common_mute_collection_cd, new Object[]{str2}, p65Var);
            vkb vkbVar = new vkb(0);
            boolean z3 = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new x8c(u8cVar, f9cVar, i3);
                p65Var.j0(objM);
            }
            r28 r28VarG = w2g.G(hlg.r(r28VarD, z2, strQ, vkbVar, (m45) objM, 8), 0.0f, z ? 4.0f : 0.0f, 0.0f, 0.0f, 13);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            c09 c09VarJ = vn7.J(R.drawable.ic_mute, 0, p65Var);
            o28 o28Var = o28.b;
            r28 r28VarG2 = w2g.G(o28Var, 24.0f, 16.0f, 0.0f, 0.0f, 12);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, r28VarG2, ((zo7) p65Var.j(sn3Var)).o, p65Var, 440, 0);
            r28 r28VarF = w2g.F(o28Var, 24.0f, 16.0f, 24.0f, 16.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var, R.string.show_less_like_this_dialog_mute_collection);
            sn3 sn3Var2 = jt7.c;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).m, p65Var, 0, 0, 131070);
            jjd.b(f9cVar.g, w2g.G(o28Var, 0.0f, 6.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).n, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 24960, 110588);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y8c(f9cVar, u8cVar, z, r28Var, i, 0);
        }
    }

    public static final void h(uga ugaVar, eb8 eb8Var, m45 m45Var, ui9 ui9Var, x12 x12Var, int i) {
        p65 p65Var;
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2031403847);
        int i2 = i | (p65Var2.f(ugaVar) ? 4 : 2) | (p65Var2.h(eb8Var) ? 32 : 16) | (p65Var2.h(m45Var) ? 256 : 128) | (p65Var2.h(ui9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            p65Var = p65Var2;
            rr7.d(null, false, null, pxf.E(98950050, new c60(13, m45Var), p65Var2), null, null, null, 0, false, null, 0.0f, 0L, 0L, 0L, ((zo7) p65Var2.j(kt7.b)).a, 0L, pxf.E(-413963429, new nh(ui9Var, ugaVar, eb8Var, 5), p65Var2), p65Var, 3072, 196599);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i, 25, ugaVar, eb8Var, m45Var, ui9Var);
        }
    }

    public static final void i(int i, boolean z, r28 r28Var, m45 m45Var, x12 x12Var, int i2) {
        r28 r28Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1232376917);
        int i3 = 2;
        int i4 = i2 | (p65Var.d(i) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | 384 | (p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            String strD = vo7.D(!z ? R.plurals.replies : R.plurals.hide_replies, i, new Object[]{Integer.valueOf(i)}, p65Var);
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(o28Var, "replies_button");
            amb ambVarA = bmb.a(21.0f);
            jy8 jy8Var = h11.a;
            long j = uu1.g;
            f76.g(m45Var, r28VarN, false, ambVarA, h11.a(j, ((fv1) p65Var.j(iv1.a)).q, j, 0L, p65Var, 8), null, null, new jy8(12.0f, 8.0f, 12.0f, 8.0f), pxf.E(2081051237, new ba1(strD, i3), p65Var), p65Var, ((i4 >> 9) & 14) | 818085888, ExifDirectoryBase.TAG_TILE_OFFSETS);
            p65Var = p65Var;
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hs(i, z, r28Var2, m45Var, i2);
        }
    }

    public static final void j(f9c f9cVar, u8c u8cVar, boolean z, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2140965632);
        int i2 = i | (p65Var.f(f9cVar) ? 4 : 2) | (p65Var.f(u8cVar) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            zq0 zq0Var = z46.n;
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            boolean z2 = !f9cVar.h;
            String strR = vo7.R(p65Var, R.string.show_less_like_this_dialog_report_post);
            vkb vkbVar = new vkb(0);
            boolean z3 = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new x8c(u8cVar, f9cVar, i3);
                p65Var.j0(objM);
            }
            r28 r28VarG = w2g.G(hlg.r(r28VarD, z2, strR, vkbVar, (m45) objM, 8), 0.0f, z ? 4.0f : 0.0f, 0.0f, 0.0f, 13);
            omb ombVarA = nmb.a(qb8.a, zq0Var, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) ((j >>> 32) ^ j);
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
            c09 c09VarJ = vn7.J(R.drawable.ic_error, 0, p65Var);
            o28 o28Var = o28.b;
            r28 r28VarG2 = w2g.G(o28Var, 24.0f, 16.0f, 0.0f, 20.0f, 4);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, r28VarG2, ((zo7) p65Var.j(sn3Var)).u, p65Var, 440, 0);
            jjd.b(vo7.R(p65Var, R.string.show_less_like_this_dialog_report_post), w2g.F(o28Var, 24.0f, 16.0f, 24.0f, 20.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(sn3Var)).u, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y8c(f9cVar, u8cVar, z, r28Var, i, 1);
        }
    }

    public static final void k(f9c f9cVar, u8c u8cVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1500566091);
        int i3 = 2;
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(f9cVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(u8cVar) ? 32 : 16;
        }
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            String strR = vo7.R(p65Var2, R.string.show_less_like_this_dialog_title);
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new j5c(0, u8cVar, u8c.class, "onClose", "onClose()V", 0, 12);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            ek7.g(strR, (m45) ((qh6) objM), null, vo7.R(p65Var2, R.string.show_less_like_this_dialog_message), pxf.E(809528671, new qg9(u8cVar, 22, f9cVar), p65Var2), p65Var, 24576, 4);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(f9cVar, u8cVar, i, i3);
        }
    }

    public static final void l(u8c u8cVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-75734953);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(u8cVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarA0 = flb.a0(r40.y(jfc.d(o28.b, 1.0f), bmb.c(16.0f, 16.0f, 0.0f, 0.0f, 12)), ap7.b(((zo7) p65Var.j(kt7.b)).a, p65Var, 0), rv8.r);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var2 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                objM6 = new fr0(l78Var2, hl7Var, m62Var, l78Var, 27);
                p65Var.j0(objM6);
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            int i4 = 27;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarA0, false, (x45) objM8), pxf.E(1200550679, new z8c(l78Var2, z52Var, m45Var, u8cVar, 0), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w8c(u8cVar, i, i3);
        }
    }

    public static final void m(u8c u8cVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(123239883);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(u8cVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarA0 = flb.a0(r40.y(jfc.d(o28.b, 1.0f), bmb.c(16.0f, 16.0f, 0.0f, 0.0f, 12)), ap7.b(((zo7) p65Var.j(kt7.b)).a, p65Var, 0), rv8.r);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var2 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                objM6 = new fr0(l78Var2, hl7Var, m62Var, l78Var, 28);
                p65Var.j0(objM6);
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            int i4 = 28;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarA0, false, (x45) objM8), pxf.E(1200550679, new z8c(l78Var2, z52Var, m45Var, u8cVar, 1), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w8c(u8cVar, i, i3);
        }
    }

    public static final void n(vpc vpcVar, bo4 bo4Var, u8c u8cVar, x12 x12Var, int i) {
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-258979166);
        int i2 = (p65Var.h(vpcVar) ? 4 : 2) | i | (p65Var.h(bo4Var) ? 32 : 16);
        if ((i & 384) == 0) {
            i2 |= p65Var.f(u8cVar) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            i9c i9cVar = (i9c) guc.z(vpcVar, p65Var, i2 & 14).getValue();
            if (i9cVar instanceof f9c) {
                p65Var.Y(-1486714467);
                k((f9c) i9cVar, u8cVar, p65Var, (i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var.p(false);
            } else if (i9cVar instanceof g9c) {
                p65Var.Y(-1486528994);
                l(u8cVar, p65Var, (i2 >> 6) & 14);
                p65Var.p(false);
            } else {
                if (!g76.L(i9cVar, h9c.a)) {
                    throw ho2.L(p65Var, 229133722, false);
                }
                p65Var.Y(-1486406916);
                m(u8cVar, p65Var, (i2 >> 6) & 14);
                p65Var.p(false);
            }
            boolean zH = p65Var.h(bo4Var) | ((i2 & 896) == 256);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new eub(bo4Var, u8cVar, null, 11);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 2, vpcVar, bo4Var, u8cVar);
        }
    }

    public static final void o(wmc wmcVar, omc omcVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        l78 l78Var;
        ar0 ar0Var = z46.h;
        ar0 ar0Var2 = z46.d;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1233250841);
        int i2 = i | (p65Var2.f(wmcVar) ? 4 : 2) | (p65Var2.f(omcVar) ? 32 : 16);
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            boolean z = wmcVar instanceof vmc;
            iy0 iy0Var = iy0.a;
            o28 o28Var = o28.b;
            if (z) {
                p65Var2.Y(-256908069);
                zk7 zk7VarC = dy0.c(ar0Var2, false);
                long j = p65Var2.T;
                int i3 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var2.l();
                r28 r28VarR = gx1.R(p65Var2, r28Var);
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
                xz5.o(iy0Var.a(o28Var, ar0Var), null, 0.0f, 0L, 0L, 0, p65Var2, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var = p65Var2;
                p65Var.p(true);
                p65Var.p(false);
            } else {
                p65Var = p65Var2;
                if (wmcVar instanceof smc) {
                    p65Var.Y(-256902217);
                    zk7 zk7VarC2 = dy0.c(ar0Var2, false);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28Var);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var, cuVar, zk7VarC2);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var, cuVar2, i89VarL2);
                    Integer numValueOf = Integer.valueOf(i4);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    r28 r28VarE = w2g.E(jfc.d(iy0Var.a(o28Var, ar0Var), 1.0f), 24.0f, 0.0f, 2);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                    long j3 = p65Var.T;
                    int i5 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var.l();
                    r28 r28VarR3 = gx1.R(p65Var, r28VarE);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, wv1VarA);
                    tp7.B(p65Var, cuVar2, i89VarL3);
                    ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR3);
                    sn3 sn3Var = jt7.c;
                    jjd.b("No Stage Branch selected", jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 54, 0, 130044);
                    hp7.t(p65Var, jfc.l(o28Var, 24.0f));
                    kx kxVar = new kx();
                    kxVar.d("Click on a ");
                    int iH = kxVar.h(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439));
                    try {
                        kxVar.d("https://medium.com?branch_deploy");
                        kxVar.f(iH);
                        kxVar.d(" deeplink to enable Stage Branch.");
                        jjd.c(kxVar.i(), null, 0L, 0L, 0L, new jgd(3), 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 0, 0, 261118);
                        p65Var = p65Var;
                        b09.H(p65Var, true, true, false);
                    } catch (Throwable th) {
                        kxVar.f(iH);
                        throw th;
                    }
                } else {
                    if (!(wmcVar instanceof umc)) {
                        throw ho2.L(p65Var, -256901748, false);
                    }
                    p65Var.Y(627232403);
                    p65Var.Y(-1003410150);
                    p65Var.Y(212064437);
                    p65Var.p(false);
                    m73 m73Var = (m73) p65Var.j(z22.h);
                    Object objM = p65Var.M();
                    uob uobVar = w12.a;
                    if (objM == uobVar) {
                        objM = b09.t(m73Var, p65Var);
                    }
                    hl7 hl7Var = (hl7) objM;
                    Object objM2 = p65Var.M();
                    if (objM2 == uobVar) {
                        objM2 = b09.r(p65Var);
                    }
                    z52 z52Var = (z52) objM2;
                    Object objM3 = p65Var.M();
                    if (objM3 == uobVar) {
                        objM3 = qo7.u(Boolean.FALSE);
                        p65Var.j0(objM3);
                    }
                    l78 l78Var2 = (l78) objM3;
                    Object objM4 = p65Var.M();
                    if (objM4 == uobVar) {
                        objM4 = b09.s(z52Var, p65Var);
                    }
                    m62 m62Var = (m62) objM4;
                    Object objM5 = p65Var.M();
                    if (objM5 == uobVar) {
                        objM5 = b09.v(c1e.a, y3b.h, p65Var);
                    }
                    l78 l78Var3 = (l78) objM5;
                    boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
                    Object objM6 = p65Var.M();
                    if (zH || objM6 == uobVar) {
                        fr0 fr0Var = new fr0(l78Var3, hl7Var, m62Var, l78Var2, 29);
                        l78Var = l78Var2;
                        p65Var.j0(fr0Var);
                        objM6 = fr0Var;
                    } else {
                        l78Var = l78Var2;
                    }
                    zk7 zk7Var = (zk7) objM6;
                    Object objM7 = p65Var.M();
                    int i6 = 29;
                    if (objM7 == uobVar) {
                        objM7 = new gr0(l78Var, m62Var, i6);
                        p65Var.j0(objM7);
                    }
                    m45 m45Var = (m45) objM7;
                    boolean zH2 = p65Var.h(hl7Var);
                    Object objM8 = p65Var.M();
                    if (zH2 || objM8 == uobVar) {
                        objM8 = new hr0(hl7Var, i6);
                        p65Var.j0(objM8);
                    }
                    hlg.j(wxb.a(r28Var, false, (x45) objM8), pxf.E(1200550679, new je2(l78Var3, z52Var, m45Var, wmcVar, omcVar, 5), p65Var), zk7Var, p65Var, 48);
                    p65Var.p(false);
                    p65Var.p(false);
                }
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 20, wmcVar, omcVar, r28Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void p(mya myaVar, String str, r28 r28Var, xmc xmcVar, x12 x12Var, int i) {
        xmc xmcVar2;
        int i2;
        xmc xmcVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(93017382);
        int i3 = i | (p65Var.f(myaVar) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                Object[] objArr = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                Object objM = p65Var.M();
                if (objArr != false || objM == uobVar) {
                    objM = new nmc(str, i);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i2 = i3 & (-7169);
                    xmcVar3 = (xmc) to7.z(n1b.a.b(xmc.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i2 = i3 & (-7169);
                xmcVar3 = xmcVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(xmcVar3.j, p65Var, 0);
            int i5 = (p65Var.f(xmcVar3) ? 1 : 0) | ((i2 & 14) == 4 ? 1 : 0);
            Object objM2 = p65Var.M();
            if (i5 != 0 || objM2 == uobVar) {
                objM2 = new omc(xmcVar3, myaVar);
                p65Var.j0(objM2);
            }
            q((wmc) l78VarZ.getValue(), (omc) objM2, r28Var, p65Var, i2 & 896, 0);
            xmcVar2 = xmcVar3;
        } else {
            p65Var.S();
            xmcVar2 = xmcVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 5, r28Var, (Object) myaVar, (Object) str, (Object) xmcVar2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void q(defpackage.wmc r20, defpackage.omc r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 215
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iq7.q(wmc, omc, r28, x12, int, int):void");
    }

    public static final void r(drd drdVar, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        boolean z;
        String strW;
        ot2 ot2Var;
        int i2;
        int i3;
        String strW2;
        fa4 fa4Var = qb8.a;
        drdVar.getClass();
        Long l = drdVar.a;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1816245882);
        int i4 = i | (p65Var.f(drdVar) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarE = w2g.E(o28Var, 24.0f, 0.0f, 2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarE);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            jjd.b(vo7.R(p65Var, R.string.post_stats_traffic_sources_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.u(p65Var), p65Var, 0, 0, 131070);
            if (l != null) {
                p65Var.Y(-1733095768);
                z = false;
                strW = vo7.Q(R.string.stats_from_to_utc_updated_hourly, new Object[]{vo7.v(l.longValue(), p65Var), vo7.R(p65Var, R.string.common_today)}, p65Var);
                p65Var.p(false);
            } else {
                z = false;
                strW = km4.w(p65Var, -1732851271, R.string.stats_updated_hourly, p65Var, false);
            }
            String str = strW;
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            boolean z2 = z;
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.t(p65Var), p65Var, 0, 0, 131070);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            p65Var.Y(1191037345);
            kx kxVar = new kx();
            kxVar.d(vo7.R(p65Var, R.string.post_stats_traffic_sources_description));
            kxVar.d("\n");
            p65Var.Y(1191042198);
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
            boolean z3 = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? true : z2;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new al4(3, m45Var);
                p65Var.j0(objM);
            }
            int iV = ho2.v("learn_more", wjdVar, (e07) objM, kxVar);
            try {
                kxVar.d(vo7.R(p65Var, R.string.post_stats_traffic_sources_learn_more));
                kxVar.f(iV);
                p65Var.p(z2);
                mx mxVarI = kxVar.i();
                p65Var.p(z2);
                jjd.c(mxVarI, null, 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, to7.s(p65Var), p65Var, 0, 0, 262142);
                hp7.t(p65Var, jfc.l(o28Var, 32.0f));
                r28 r28VarD = jfc.d(o28Var, 1.0f);
                zq0 zq0Var = z46.n;
                omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
                long j2 = p65Var.T;
                int i6 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    ot2Var = ot2Var2;
                    p65Var.k(ot2Var);
                } else {
                    ot2Var = ot2Var2;
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA);
                tp7.B(p65Var, cuVar2, i89VarL2);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR2);
                qmb qmbVar = qmb.a;
                boolean z4 = z2;
                r28 r28VarA = qmbVar.a(1.0f, o28Var, true);
                omb ombVarA2 = nmb.a(new h70(4.0f, true, new z10(21)), zq0Var, p65Var, 54);
                long j3 = p65Var.T;
                int i7 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarA);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                String strR = vo7.R(p65Var, R.string.post_stats_traffic_sources_internal);
                sn3 sn3Var = jt7.c;
                ot2 ot2Var3 = ot2Var;
                jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).j, p65Var, 0, 0, 131070);
                vx0.p(vo7.R(p65Var, R.string.post_stats_traffic_sources_internal_tooltip), null, 0L, p65Var, 0, 14);
                p65Var.p(true);
                hp7.t(p65Var, qmbVar.a(1.0f, o28Var, true));
                Object[] objArr = new Object[1];
                objArr[z4 ? 1 : 0] = Integer.valueOf(drdVar.b);
                jjd.b(vo7.Q(R.string.stats_percentage, objArr, p65Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, 0, 0, 131070);
                ka1.B(p65Var, true, o28Var, 16.0f, p65Var);
                r28 r28VarD2 = jfc.d(o28Var, 1.0f);
                omb ombVarA3 = nmb.a(fa4Var, zq0Var, p65Var, 48);
                long j4 = p65Var.T;
                int i8 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL4 = p65Var.l();
                r28 r28VarR4 = gx1.R(p65Var, r28VarD2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var3);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA3);
                tp7.B(p65Var, cuVar2, i89VarL4);
                ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR4);
                jjd.b(vo7.R(p65Var, R.string.post_stats_traffic_sources_external), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).j, p65Var, 0, 0, 131070);
                hp7.t(p65Var, qmbVar.a(1.0f, o28Var, true));
                Object[] objArr2 = new Object[1];
                objArr2[z4 ? 1 : 0] = Integer.valueOf(drdVar.c);
                jjd.b(vo7.Q(R.string.stats_percentage, objArr2, p65Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, 0, 0, 131070);
                p65Var = p65Var;
                p65Var.p(true);
                p65Var.Y(1191111600);
                for (crd crdVar : drdVar.d) {
                    hp7.t(p65Var, jfc.l(o28Var, 12.0f));
                    r28 r28VarD3 = jfc.d(o28Var, 1.0f);
                    omb ombVarA4 = nmb.a(fa4Var, z46.m, p65Var, z4 ? 1 : 0);
                    long j5 = p65Var.T;
                    int i9 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var.l();
                    r28 r28VarR5 = gx1.R(p65Var, r28VarD3);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var4);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, ombVarA4);
                    tp7.B(p65Var, q12.e, i89VarL5);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i9));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR5);
                    if (crdVar instanceof yqd) {
                        p65Var.Y(458789923);
                        p65Var.p(false);
                        strW2 = ((yqd) crdVar).a;
                    } else {
                        if (crdVar instanceof zqd) {
                            i2 = 458792569;
                            i3 = R.string.post_stats_traffic_sources_direct;
                        } else if (crdVar instanceof brd) {
                            i2 = 458796790;
                            i3 = R.string.post_stats_traffic_sources_rss;
                        } else {
                            if (!(crdVar instanceof ard)) {
                                throw ho2.L(p65Var, 458787129, false);
                            }
                            i2 = 458801026;
                            i3 = R.string.post_stats_traffic_sources_other_referrals;
                        }
                        strW2 = km4.w(p65Var, i2, i3, p65Var, false);
                    }
                    sn3 sn3Var2 = jt7.c;
                    mkd mkdVar = ((bu7) p65Var.j(sn3Var2)).l;
                    sn3 sn3Var3 = kt7.b;
                    p65 p65Var2 = p65Var;
                    jjd.b(strW2, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var3)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 131070);
                    hp7.t(p65Var2, new sq6(1.0f, true));
                    jjd.b(dq1.g(Integer.valueOf(crdVar.getCount())), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).l, ((zo7) p65Var2.j(sn3Var3)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 131070);
                    p65Var = p65Var2;
                    p65Var.p(true);
                    z4 = false;
                }
                p65Var.p(z4);
                p65Var.p(true);
                obj = o28Var;
            } catch (Throwable th) {
                kxVar.f(iV);
                throw th;
            }
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 7, drdVar, m45Var, obj);
        }
    }

    public static double t(double d, double d2, double d3) {
        if (d2 <= d3) {
            return d < d2 ? d2 : d > d3 ? d3 : d;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + d3 + " is less than minimum " + d2 + '.');
    }

    public static float u(float f, float f2, float f3) {
        if (f2 <= f3) {
            return f < f2 ? f2 : f > f3 ? f3 : f;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + f3 + " is less than minimum " + f2 + '.');
    }

    public static int v(int i, int i2, int i3) {
        if (i2 <= i3) {
            return i < i2 ? i2 : i > i3 ? i3 : i;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + i3 + " is less than minimum " + i2 + '.');
    }

    public static long w(long j, long j2, long j3) {
        if (j2 <= j3) {
            return j < j2 ? j2 : j > j3 ? j3 : j;
        }
        StringBuilder sbD = b09.D("Cannot coerce value to an empty range: maximum ", " is less than minimum ", j3);
        sbD.append(j2);
        sbD.append('.');
        throw new IllegalArgumentException(sbD.toString());
    }

    public static long x(long j, ua7 ua7Var) {
        long j2 = ua7Var.b;
        long j3 = ua7Var.a;
        if (!ua7Var.isEmpty()) {
            return j < Long.valueOf(j3).longValue() ? Long.valueOf(j3).longValue() : j > Long.valueOf(j2).longValue() ? Long.valueOf(j2).longValue() : j;
        }
        lg8.f(46, ua7Var, "Cannot coerce value to an empty range: ");
        return 0L;
    }

    public static Comparable y(Comparable comparable, hp1 hp1Var) {
        hp1Var.getClass();
        float f = hp1Var.b;
        float f2 = hp1Var.a;
        if (!hp1Var.a()) {
            return (!hp1.b(comparable, Float.valueOf(f2)) || hp1.b(Float.valueOf(f2), comparable)) ? (!hp1.b(Float.valueOf(f), comparable) || hp1.b(comparable, Float.valueOf(f))) ? comparable : Float.valueOf(f) : Float.valueOf(f2);
        }
        lg8.f(46, hp1Var, "Cannot coerce value to an empty range: ");
        return null;
    }

    public static Comparable z(Integer num, Integer num2, Integer num3) {
        if (num2 == null || num3 == null) {
            if (num2 != null && num.compareTo(num2) < 0) {
                return num2;
            }
            if (num3 != null && num.compareTo(num3) > 0) {
                return num3;
            }
        } else {
            if (num2.compareTo(num3) > 0) {
                lg8.h(46, "Cannot coerce value to an empty range: maximum ", num3, " is less than minimum ", num2);
                return null;
            }
            if (num.compareTo(num2) < 0) {
                return num2;
            }
            if (num.compareTo(num3) > 0) {
                return num3;
            }
        }
        return num;
    }

    public static void s(Object obj) {
        if (obj != null) {
            return;
        }
        z72.c(KLTXZbnQvj.ZogFsYmrqwxlT);
    }
}
