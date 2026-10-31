package v30;

import android.content.Context;
import android.graphics.Color;
import com.vungle.ads.internal.protos.Sdk;
import e10.q;
import e10.y2;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.security.cert.Certificate;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import kotlin.UInt;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import x80.m;
import x80.r0;
import x80.t;
import y3.o;

/* loaded from: classes.dex */
public abstract class e {
    public static final y3.e a(Context context) {
        float f11 = context.getResources().getConfiguration().fontScale;
        float f12 = context.getResources().getDisplayMetrics().density;
        z3.a aVarA = z3.b.a(f11);
        if (aVarA == null) {
            aVarA = new o(f11);
        }
        return new y3.e(f12, f11, aVarA);
    }

    public static final y8.f b(int i5, int i11) {
        return new y8.f(new y8.a(i5), new y8.a(i11));
    }

    public static void c(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException();
        }
    }

    public static void d(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }

    public static int e(int i5, int i11) {
        if (r4.a.g(i5, i11) >= 4.5d) {
            return i5;
        }
        double[] dArr = new double[3];
        r4.a.i(dArr, i11);
        double d5 = dArr[0];
        r4.a.i(dArr, i5);
        double d11 = dArr[0];
        boolean z11 = d5 < 50.0d;
        double d12 = z11 ? d11 : 0.0d;
        if (z11) {
            d11 = 100.0d;
        }
        double d13 = dArr[1];
        double d14 = dArr[2];
        for (int i12 = 0; i12 < 15 && d11 - d12 > 1.0E-5d; i12++) {
            double d15 = (d12 + d11) / 2.0d;
            if (r4.a.g(r4.a.b(d15, d13, d14), i11) <= 4.5d ? !z11 : z11) {
                d11 = d15;
            } else {
                d12 = d15;
            }
        }
        return r4.a.b(d12, d13, d14);
    }

    public static Class f(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e3) {
            e3.printStackTrace();
            return null;
        }
    }

    public static Method g(Class cls, String str, Class... clsArr) {
        if (cls == null) {
            return null;
        }
        try {
            return cls.getMethod(str, clsArr);
        } catch (NoSuchMethodException e3) {
            e3.printStackTrace();
            return null;
        }
    }

    public static Method h(String str, String str2, Class... clsArr) {
        return g(f(str), str2, clsArr);
    }

    public static Field i(Class cls, String str) throws NoSuchFieldException, SecurityException {
        if (cls == null) {
            return null;
        }
        try {
            Field declaredField = cls.getDeclaredField(str);
            declaredField.setAccessible(true);
            return declaredField;
        } catch (Exception e3) {
            e3.printStackTrace();
            return null;
        }
    }

    public static Method j(Class cls, String str, Class... clsArr) throws NoSuchMethodException, SecurityException {
        try {
            Method declaredMethod = cls.getDeclaredMethod(str, clsArr);
            declaredMethod.setAccessible(true);
            return declaredMethod;
        } catch (NoSuchMethodException e3) {
            e3.printStackTrace();
            return null;
        }
    }

    public static t k(SSLSession sSLSession) throws IOException {
        Object objJ;
        String cipherSuite = sSLSession.getCipherSuite();
        if (cipherSuite == null) {
            throw new IllegalStateException("cipherSuite == null");
        }
        if (cipherSuite.equals("TLS_NULL_WITH_NULL_NULL") ? true : cipherSuite.equals("SSL_NULL_WITH_NULL_NULL")) {
            throw new IOException("cipherSuite == ".concat(cipherSuite));
        }
        m mVarC = m.f95535b.c(cipherSuite);
        String protocol = sSLSession.getProtocol();
        if (protocol == null) {
            throw new IllegalStateException("tlsVersion == null");
        }
        if ("NONE".equals(protocol)) {
            throw new IOException("tlsVersion == NONE");
        }
        r0 r0VarG = vm.d.g(protocol);
        try {
            Certificate[] peerCertificates = sSLSession.getPeerCertificates();
            objJ = peerCertificates != null ? y80.c.j(Arrays.copyOf(peerCertificates, peerCertificates.length)) : EmptyList.f71733a;
        } catch (SSLPeerUnverifiedException unused) {
            objJ = EmptyList.f71733a;
        }
        Certificate[] localCertificates = sSLSession.getLocalCertificates();
        return new t(r0VarG, mVarC, localCertificates != null ? y80.c.j(Arrays.copyOf(localCertificates, localCertificates.length)) : EmptyList.f71733a, new a3.e(objJ, 28));
    }

    public static final int l(int i5, int i11, int i12, int i13, int i14) {
        if (((i5 >> 24) & 255) != 255) {
            throw new IllegalArgumentException("Alpha must be 255");
        }
        int iJ = r4.a.j(i13, i5);
        double dG = r4.a.g(i12, iJ);
        return dG > r4.a.g(i11, iJ) ? (dG >= 6.0d || (i14 == i12 ? dG : r4.a.g(i14, iJ)) <= dG) ? i12 : i14 : i11;
    }

    public static final int m(g30.b bVar, int i5) {
        return n(bVar, -986896, -11513776, i5, -14606047);
    }

    public static final int n(g30.b bVar, int i5, int i11, int i12, int i13) {
        y2 y2Var = y2.f51877a;
        boolean z11 = bVar.f57022f;
        mc0.d.f76206a.n("TODO supportsDarkText labelColor", new Object[0]);
        if (((Boolean) y2Var.w1().l()).booleanValue() && y2Var.T0().l() != q.f51749b) {
            z11 = y2Var.T0().l() == q.f51750c;
        }
        int iO0 = bVar.f57020d;
        if (z11) {
            tz.c.Companion.getClass();
            iO0 = -1;
        } else if (bVar.f57021e) {
            tz.c.Companion.getClass();
            iO0 = -16777216;
        } else if (iO0 == 0) {
            UInt.Companion companion = UInt.f71696b;
            iO0 = -12566464;
        } else {
            UInt.Companion companion2 = UInt.f71696b;
            if (((iO0 >>> 24) & 255) < 255) {
                iO0 = ul.b.o0(iO0, 255);
            }
        }
        if (!z11 && r4.a.g(-16777216, r4.a.j(i12, -16777216)) <= 2.9000000953674316d) {
            return i5;
        }
        if (z11) {
            int iN = r4.a.n(i12, 255);
            if (((iN >> 24) & 255) != 255) {
                throw new IllegalStateException("Alpha must be 255");
            }
            if (Color.luminance(iN) > 0.75f || ((i12 >> 24) & 255) < 44) {
                return i11;
            }
        }
        return l(iO0, i5, i11, i12, i13);
    }

    public static int o(int i5) {
        return l(i5, -986896, -11513776, 0, -14606047);
    }

    public static Object p(Iterable iterable) {
        Object next;
        if (iterable instanceof List) {
            List list = (List) iterable;
            if (list.isEmpty()) {
                throw new NoSuchElementException();
            }
            return a2.c.e(1, list);
        }
        Iterator it = iterable.iterator();
        do {
            next = it.next();
        } while (it.hasNext());
        return next;
    }

    public static String q(Class cls, String str, String str2) throws NoSuchFieldException, SecurityException {
        Field field;
        try {
            try {
                field = cls.getField(str);
                field.setAccessible(true);
            } catch (NoSuchFieldException | SecurityException unused) {
                field = null;
            }
            if (field != null) {
                return (String) field.get(cls);
            }
        } catch (IllegalAccessException | IllegalArgumentException unused2) {
        }
        return str2;
    }

    public static int r(int i5, String packageName) {
        Intrinsics.g(packageName, "packageName");
        int length = packageName.length();
        int i11 = i5;
        int i12 = 0;
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        while (i12 < length) {
            int i16 = i12 + 1;
            int iCharAt = packageName.charAt(i12);
            int i17 = 8;
            if (iCharAt < 128) {
                i12 = i16;
            } else if (iCharAt < 2048) {
                iCharAt = (((iCharAt & 63) | 128) << 8) | (iCharAt >> 6) | 192;
                i12 = i16;
                i17 = 16;
            } else if (iCharAt < 55296 || iCharAt > 57343 || i16 >= length) {
                iCharAt = (((iCharAt & 63) | 128) << 16) | (iCharAt >> 12) | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE | ((((iCharAt >> 6) & 63) | 128) << 8);
                i12 = i16;
                i17 = 24;
            } else {
                i12 += 2;
                int iCharAt2 = ((iCharAt - 55232) << 10) + (packageName.charAt(i16) & 1023);
                iCharAt = (((iCharAt2 & 63) | 128) << 24) | (((iCharAt2 >> 18) | 240) & 255) | ((((iCharAt2 >> 12) & 63) | 128) << 8) | ((((iCharAt2 >> 6) & 63) | 128) << 16);
                i17 = 32;
            }
            i15 |= iCharAt << i13;
            i13 += i17;
            if (i13 >= 32) {
                int i18 = i15 * (-862048943);
                int i19 = i11 ^ (((i18 >>> 17) | (i18 << 15)) * 461845907);
                i11 = (((i19 >>> 19) | (i19 << 13)) * 5) - 430675100;
                i13 -= 32;
                i15 = i13 != 0 ? iCharAt >>> (i17 - i13) : 0;
                i14 += 4;
            }
        }
        if (i13 > 0) {
            i14 += i13 >> 3;
            int i21 = i15 * (-862048943);
            i11 ^= ((i21 << 15) | (i21 >>> 17)) * 461845907;
        }
        int i22 = i11 ^ i14;
        int i23 = (i22 ^ (i22 >>> 16)) * (-2048144789);
        int i24 = (i23 ^ (i23 >>> 13)) * (-1028477387);
        int i25 = i24 ^ (i24 >>> 16);
        UInt.Companion companion = UInt.f71696b;
        return i25;
    }

    public static final boolean s(int i5) {
        int i11 = (i5 >> 16) & 255;
        return i11 == ((i5 >> 8) & 255) && i11 == (i5 & 255);
    }

    public static void t(List list, vk.m mVar, int i5, int i11) {
        for (int size = list.size() - 1; size > i11; size--) {
            if (mVar.apply(list.get(size))) {
                list.remove(size);
            }
        }
        for (int i12 = i11 - 1; i12 >= i5; i12--) {
            list.remove(i12);
        }
    }

    public static String u(Iterable iterable) {
        Iterator it = iterable.iterator();
        StringBuilder sb2 = new StringBuilder("[");
        boolean z11 = true;
        while (it.hasNext()) {
            if (!z11) {
                sb2.append(", ");
            }
            sb2.append(it.next());
            z11 = false;
        }
        sb2.append(AbstractJsonLexerKt.END_LIST);
        return sb2.toString();
    }
}
