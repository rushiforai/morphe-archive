package defpackage;

import com.google.android.recaptcha.internal.zzao;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gvf {
    public Object a;
    public long b;
    public double c;
    public mpg d;
    public ArrayList e;
    public csf f;
    public int g = 1;

    public static gvf a(Object obj) {
        gvf gvfVar = new gvf();
        int[] iArr = {1867107722, 219499797, 1647318768, 791628709, 1929020072, -436492773, 156903819, 1390543437, 216220853};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        gvfVar.r();
        gvfVar.g = (i8 % 216220853) ^ iF;
        gvfVar.a = obj;
        return gvfVar;
    }

    public static gvf b(long j) {
        gvf gvfVar = new gvf();
        int[] iArr = {1539942439, 1535257185, 1094537855, 446310416, 545003193, -1960816486, 411522957, 1143565421, 981914693};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        gvfVar.r();
        gvfVar.g = (i8 % 981914693) ^ iF;
        gvfVar.b = j;
        return gvfVar;
    }

    public static gvf c(double d) {
        gvf gvfVar = new gvf();
        int[] iArr = {978587665, 1228171534, 1025392329, 1075859846, 983056097, -1399000571, 190113083, 1723578341, 672563970};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        gvfVar.r();
        gvfVar.g = (i8 % 672563970) ^ iF;
        gvfVar.c = d;
        return gvfVar;
    }

    public static gvf d(mpg mpgVar) {
        gvf gvfVar = new gvf();
        int[] iArr = {1910210050, 1342515460, 1453014483, 168034308, 1540440520, -994065400, 318322042, 817572761, 14933990};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        gvfVar.r();
        gvfVar.g = (i8 % 14933990) ^ iF;
        gvfVar.d = mpgVar;
        return gvfVar;
    }

    public static gvf e(ArrayList arrayList) {
        gvf gvfVar = new gvf();
        int[] iArr = {379366797, 35537464, 1403037965, -2078358863, -1757307767, -386763992, 522971726, 1554725062, 997276125};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        gvfVar.r();
        gvfVar.g = (i8 % 997276125) ^ iF;
        gvfVar.e = arrayList;
        return gvfVar;
    }

    public static gvf f(csf csfVar) {
        gvf gvfVar = new gvf();
        int[] iArr = {2021303708, 824774792, 51514445, 1009340548, 257220717, 1682859529, 597010431, 1024027583, 198628789};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        gvfVar.r();
        gvfVar.g = (i8 % 198628789) ^ iF;
        gvfVar.f = csfVar;
        return gvfVar;
    }

    public static gvf g(Object obj) {
        if (obj instanceof Long) {
            return b(((Long) obj).longValue());
        }
        if (obj instanceof Boolean) {
            return b(true != ((Boolean) obj).booleanValue() ? 0L : 1L);
        }
        if (obj instanceof Integer) {
            return b(((Integer) obj).intValue());
        }
        if (obj instanceof Double) {
            return c(((Double) obj).doubleValue());
        }
        if (obj instanceof Float) {
            return c(((Float) obj).floatValue());
        }
        if (obj instanceof Short) {
            return b(((Short) obj).shortValue());
        }
        if (obj instanceof Byte) {
            return b(((Byte) obj).byteValue());
        }
        if (obj instanceof mpg) {
            return d((mpg) obj);
        }
        if (obj instanceof String) {
            return d(mpg.e(((String) obj).getBytes(Charset.forName(cmg.a("Hn2H4l0=")))));
        }
        if (!(obj instanceof ArrayList)) {
            return a(obj);
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = (ArrayList) obj;
        int size = arrayList2.size();
        for (int i = 0; i < size; i++) {
            arrayList.add(g(arrayList2.get(i)));
        }
        return e(arrayList);
    }

    public static gvf j(gvf gvfVar) {
        int[] iArr = {368046387, 1524073695, 1753971274, -1235975019, -1392305918, 807149497, 27679574, 1740033621, 135813159};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        int i9 = i8 % 135813159;
        try {
            int i10 = gvfVar.g;
            int i11 = (i9 ^ iF) + i10;
            if (i10 == 0) {
                throw null;
            }
            switch (i11) {
                case 0:
                    return new gvf();
                case 1:
                    return a(gvfVar.l());
                case 2:
                    return b(gvfVar.m());
                case 3:
                    return d(gvfVar.n());
                case 4:
                    ArrayList arrayList = new ArrayList();
                    Iterator it2 = ((ArrayList) gvfVar.o()).iterator();
                    while (it2.hasNext()) {
                        arrayList.add(j((gvf) it2.next()));
                    }
                    return e(arrayList);
                case 5:
                    return f(gvfVar.p());
                case 6:
                    return c(gvfVar.q());
                default:
                    ay0.d(cmg.a("HkezqgQcPni/TE/NwjgYPC5H6Q2JRdEp275wOg=="));
                    return null;
            }
        } catch (zzao e) {
            throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
        }
    }

    public final Object h() throws zzao {
        int[] iArr = {1946855866, 1570063841, 244151099, -250444080, -1599884485, 118034294, 5125130, 1535589735, 713475737};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        int i9 = this.g;
        int i10 = ((i8 % 713475737) ^ iF) + i9;
        if (i9 == 0) {
            throw null;
        }
        switch (i10) {
            case 0:
            case 5:
                throw new zzao();
            case 1:
                return l();
            case 2:
                return Long.valueOf(m());
            case 3:
                return n().a();
            case 4:
                ArrayList arrayList = new ArrayList();
                Iterator it2 = ((ArrayList) o()).iterator();
                while (it2.hasNext()) {
                    arrayList.add(((gvf) it2.next()).h());
                }
                return arrayList;
            case 6:
                return Double.valueOf(q());
            default:
                ay0.d(cmg.a("HkezqgQcPni/TE/NwjgYPC5H6Q2JRdEp275wOg=="));
                return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:138:0x01f4, code lost:
    
        if (r19.equals(java.lang.Object.class) != false) goto L150;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(java.lang.Class r19) throws com.google.android.recaptcha.internal.zzao {
        /*
            Method dump skipped, instruction units count: 606
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gvf.i(java.lang.Class):java.lang.Object");
    }

    public final void k(ByteArrayOutputStream byteArrayOutputStream) throws IOException, zzao {
        long[] jArr = {1096079422, 21345924, 206269241, 1367643268, 1352213041, 1453396557, 419974390, 1998713308, 1456575805};
        long j = jArr[0];
        long j2 = jArr[1];
        long j3 = jArr[2];
        long j4 = jArr[3];
        long j5 = jArr[4];
        long j6 = jArr[5];
        long j7 = jArr[6];
        long j8 = jArr[7];
        long j9 = (((((~j) & j2) | j3) + ((j & j4) | j5)) - j6) + j7;
        long j10 = j8 % 1456575805;
        int i = this.g;
        int i2 = i - 1;
        if (i == 0) {
            throw null;
        }
        switch (i2) {
            case 0:
            case 1:
            case 5:
                throw new zzao();
            case 2:
                b9g.b(m(), new eoc(byteArrayOutputStream), true);
                return;
            case 3:
                byte[] bArr = n().a;
                b9g.b(((long) bArr.length) * (j9 ^ j10), new eoc(byteArrayOutputStream), true);
                byteArrayOutputStream.write(bArr);
                return;
            case 4:
                ArrayList arrayList = (ArrayList) o();
                b9g.b(arrayList.size(), new eoc(byteArrayOutputStream), true);
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    ((gvf) it2.next()).k(byteArrayOutputStream);
                }
                return;
            case 6:
                long jDoubleToRawLongBits = Double.doubleToRawLongBits(q());
                ByteBuffer byteBufferAllocate = ByteBuffer.allocate(8);
                byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
                byteBufferAllocate.putLong(jDoubleToRawLongBits);
                for (byte b : byteBufferAllocate.array()) {
                    byteArrayOutputStream.write(b);
                }
                int length = byteBufferAllocate.array().length;
                return;
            default:
                return;
        }
    }

    public final Object l() throws zzao {
        int[] iArr = {636453333, 363983104, 1075208227, 2146014080, 1783382730, -364134701, 775056794, 1564003050, 99885196};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        s((iArr[7] % 99885196) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
        return this.a;
    }

    public final long m() throws zzao {
        int[] iArr = {30387226, 1173447944, 304523573, 1171344488, 35694692, 2069301473, 854121980, 1541417540, 1245036421};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        s((iArr[7] % 1245036421) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
        return this.b;
    }

    public final mpg n() throws zzao {
        int[] iArr = {1281944976, 1463473728, 847256033, 1698424322, 948255187, -1554299396, 419914800, 1727952741, 1091714937};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        s((iArr[7] % 1091714937) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
        return this.d;
    }

    public final List o() throws zzao {
        int[] iArr = {1654844049, 956749401, 3147556, 1023856765, 1183918756, -1963614606, 352085974, 955798986, 791251530};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        s((iArr[7] % 791251530) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
        return this.e;
    }

    public final csf p() throws zzao {
        int[] iArr = {138700754, 1311190794, 1098494212, 235277834, 2126148, 2082044642, 778544518, 631340353, 54449299};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        s((iArr[7] % 54449299) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
        return this.f;
    }

    public final double q() throws zzao {
        int[] iArr = {1360613073, 10730298, 1998148311, 682535208, 744243906, -1215447656, 441767868, 1566369633, 483689685};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        s((iArr[7] % 483689685) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
        return this.c;
    }

    public final void r() {
        this.g = 1;
        this.b = 0L;
        this.a = null;
        this.d = null;
        this.e = null;
        this.f = null;
    }

    public final void s(int i) throws zzao {
        if (i != this.g) {
            throw new zzao();
        }
    }
}
