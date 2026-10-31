package y80;

import ab.e0;
import androidx.compose.ui.node.LayoutNode;
import c90.g;
import com.vungle.ads.internal.protos.Sdk;
import h6.c1;
import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.Charsets;
import kotlin.text.Regex;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import lm.e;
import m90.i;
import m90.j;
import m90.x;
import r70.k;
import x80.j0;
import x80.k0;
import x80.m0;
import x80.o0;
import x80.p0;
import x80.u;
import x80.w;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f96853a;

    /* renamed from: b, reason: collision with root package name */
    public static final u f96854b = v4.a.o(new String[0]);

    /* renamed from: c, reason: collision with root package name */
    public static final g f96855c;

    /* renamed from: d, reason: collision with root package name */
    public static final x f96856d;

    /* renamed from: e, reason: collision with root package name */
    public static final TimeZone f96857e;

    /* renamed from: f, reason: collision with root package name */
    public static final Regex f96858f;

    /* renamed from: g, reason: collision with root package name */
    public static final String f96859g;

    static {
        byte[] bArr = new byte[0];
        f96853a = bArr;
        p0.Companion.getClass();
        f96855c = o0.c(bArr, null);
        j0.d(k0.Companion, bArr, null, 0, 7);
        int i5 = x.f76171d;
        j jVar = j.f76130d;
        f96856d = e0.K(e.m("efbbbf"), e.m("feff"), e.m("fffe"), e.m("0000ffff"), e.m("ffff0000"));
        TimeZone timeZone = TimeZone.getTimeZone("GMT");
        Intrinsics.d(timeZone);
        f96857e = timeZone;
        f96858f = new Regex("([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)");
        f96859g = k.b1(k.a1(x80.e0.class.getName(), "okhttp3."), "Client");
    }

    public static final boolean a(w wVar, w other) {
        Intrinsics.g(wVar, "<this>");
        Intrinsics.g(other, "other");
        return Intrinsics.b(wVar.f95628d, other.f95628d) && wVar.f95629e == other.f95629e && Intrinsics.b(wVar.f95625a, other.f95625a);
    }

    public static final int b(long j11, TimeUnit timeUnit) {
        if (j11 < 0) {
            throw new IllegalStateException("timeout".concat(" < 0").toString());
        }
        if (timeUnit == null) {
            throw new IllegalStateException("unit == null");
        }
        long millis = timeUnit.toMillis(j11);
        if (millis > 2147483647L) {
            throw new IllegalArgumentException("timeout".concat(" too large.").toString());
        }
        if (millis != 0 || j11 <= 0) {
            return (int) millis;
        }
        throw new IllegalArgumentException("timeout".concat(" too small.").toString());
    }

    public static final void c(Closeable closeable) throws IOException {
        Intrinsics.g(closeable, "<this>");
        try {
            closeable.close();
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception unused) {
        }
    }

    public static final void d(Socket socket) throws IOException {
        Intrinsics.g(socket, "<this>");
        try {
            socket.close();
        } catch (AssertionError e3) {
            throw e3;
        } catch (RuntimeException e11) {
            if (!Intrinsics.b(e11.getMessage(), "bio == null")) {
                throw e11;
            }
        } catch (Exception unused) {
        }
    }

    public static final int e(int i5, int i11, String str, String str2) {
        Intrinsics.g(str, "<this>");
        while (i5 < i11) {
            if (k.L0(str2, str.charAt(i5))) {
                return i5;
            }
            i5++;
        }
        return i11;
    }

    public static final int f(String str, int i5, int i11, char c11) {
        Intrinsics.g(str, "<this>");
        while (i5 < i11) {
            if (str.charAt(i5) == c11) {
                return i5;
            }
            i5++;
        }
        return i11;
    }

    public static final String g(String format, Object... objArr) {
        Intrinsics.g(format, "format");
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        Locale locale = Locale.US;
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        return String.format(locale, format, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length));
    }

    public static final boolean h(String[] strArr, String[] strArr2, Comparator comparator) {
        Intrinsics.g(strArr, "<this>");
        if (strArr.length != 0 && strArr2 != null && strArr2.length != 0) {
            for (String str : strArr) {
                b70.a aVarA = ArrayIteratorKt.a(strArr2);
                while (aVarA.hasNext()) {
                    if (comparator.compare(str, (String) aVarA.next()) == 0) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static final long i(m0 m0Var) {
        String strB = m0Var.f95558f.b("Content-Length");
        if (strB == null) {
            return -1L;
        }
        try {
            return Long.parseLong(strB);
        } catch (NumberFormatException unused) {
            return -1L;
        }
    }

    public static final List j(Object... elements) {
        Intrinsics.g(elements, "elements");
        Object[] objArr = (Object[]) elements.clone();
        List listUnmodifiableList = Collections.unmodifiableList(ul.b.Q(Arrays.copyOf(objArr, objArr.length)));
        Intrinsics.f(listUnmodifiableList, "unmodifiableList(listOf(*elements.clone()))");
        return listUnmodifiableList;
    }

    public static final int k(String str) {
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = str.charAt(i5);
            if (Intrinsics.h(cCharAt, 31) <= 0 || Intrinsics.h(cCharAt, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) >= 0) {
                return i5;
            }
        }
        return -1;
    }

    public static final int l(int i5, int i11, String str) {
        Intrinsics.g(str, "<this>");
        while (i5 < i11) {
            char cCharAt = str.charAt(i5);
            if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\f' && cCharAt != '\r' && cCharAt != ' ') {
                return i5;
            }
            i5++;
        }
        return i11;
    }

    public static final int m(int i5, int i11, String str) {
        Intrinsics.g(str, "<this>");
        int i12 = i11 - 1;
        if (i5 <= i12) {
            while (true) {
                char cCharAt = str.charAt(i12);
                if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\f' && cCharAt != '\r' && cCharAt != ' ') {
                    return i12 + 1;
                }
                if (i12 == i5) {
                    break;
                }
                i12--;
            }
        }
        return i5;
    }

    public static final String[] n(String[] strArr, String[] other, Comparator comparator) {
        Intrinsics.g(other, "other");
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            int length = other.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                if (comparator.compare(str, other[i5]) == 0) {
                    arrayList.add(str);
                    break;
                }
                i5++;
            }
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    public static final boolean o(String name) {
        Intrinsics.g(name, "name");
        return name.equalsIgnoreCase("Authorization") || name.equalsIgnoreCase("Cookie") || name.equalsIgnoreCase("Proxy-Authorization") || name.equalsIgnoreCase("Set-Cookie");
    }

    public static final int p(char c11) {
        if ('0' <= c11 && c11 < ':') {
            return c11 - '0';
        }
        if ('a' <= c11 && c11 < 'g') {
            return c11 - 'W';
        }
        if ('A' > c11 || c11 >= 'G') {
            return -1;
        }
        return c11 - '7';
    }

    public static final Charset q(i iVar, Charset charset) {
        Intrinsics.g(iVar, "<this>");
        Intrinsics.g(charset, "default");
        int iV = iVar.v(f96856d);
        if (iV == -1) {
            return charset;
        }
        if (iV == 0) {
            Charset UTF_8 = StandardCharsets.UTF_8;
            Intrinsics.f(UTF_8, "UTF_8");
            return UTF_8;
        }
        if (iV == 1) {
            Charset UTF_16BE = StandardCharsets.UTF_16BE;
            Intrinsics.f(UTF_16BE, "UTF_16BE");
            return UTF_16BE;
        }
        if (iV == 2) {
            Charset UTF_16LE = StandardCharsets.UTF_16LE;
            Intrinsics.f(UTF_16LE, "UTF_16LE");
            return UTF_16LE;
        }
        if (iV == 3) {
            Charsets.f71999a.getClass();
            Charset charset2 = Charsets.f72003e;
            if (charset2 != null) {
                return charset2;
            }
            Charset charsetForName = Charset.forName("UTF-32BE");
            Intrinsics.f(charsetForName, "forName(...)");
            Charsets.f72003e = charsetForName;
            return charsetForName;
        }
        if (iV != 4) {
            throw new AssertionError();
        }
        Charsets.f71999a.getClass();
        Charset charset3 = Charsets.f72002d;
        if (charset3 != null) {
            return charset3;
        }
        Charset charsetForName2 = Charset.forName("UTF-32LE");
        Intrinsics.f(charsetForName2, "forName(...)");
        Charsets.f72002d = charsetForName2;
        return charsetForName2;
    }

    public static final int r(i iVar) {
        Intrinsics.g(iVar, "<this>");
        return (iVar.readByte() & 255) | ((iVar.readByte() & 255) << 16) | ((iVar.readByte() & 255) << 8);
    }

    public static final boolean s(m90.j0 j0Var, int i5) {
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        Intrinsics.g(timeUnit, "timeUnit");
        long jNanoTime = System.nanoTime();
        long jC = j0Var.timeout().e() ? j0Var.timeout().c() - jNanoTime : Long.MAX_VALUE;
        j0Var.timeout().d(Math.min(jC, timeUnit.toNanos(i5)) + jNanoTime);
        try {
            m90.g gVar = new m90.g();
            while (j0Var.read(gVar, 8192L) != -1) {
                gVar.a();
            }
            if (jC == Long.MAX_VALUE) {
                j0Var.timeout().a();
                return true;
            }
            j0Var.timeout().d(jNanoTime + jC);
            return true;
        } catch (InterruptedIOException unused) {
            if (jC == Long.MAX_VALUE) {
                j0Var.timeout().a();
                return false;
            }
            j0Var.timeout().d(jNanoTime + jC);
            return false;
        } catch (Throwable th2) {
            if (jC == Long.MAX_VALUE) {
                j0Var.timeout().a();
            } else {
                j0Var.timeout().d(jNanoTime + jC);
            }
            throw th2;
        }
    }

    public static final u t(List list) {
        ArrayList arrayList = new ArrayList(20);
        Iterator it = list.iterator();
        while (it.hasNext()) {
            e90.a aVar = (e90.a) it.next();
            j jVar = aVar.f52287a;
            j jVar2 = aVar.f52288b;
            String strR = jVar.r();
            String strR2 = jVar2.r();
            arrayList.add(strR);
            arrayList.add(k.u1(strR2).toString());
        }
        return new u((String[]) arrayList.toArray(new String[0]));
    }

    public static final String u(w wVar, boolean z11) {
        Intrinsics.g(wVar, "<this>");
        int i5 = wVar.f95629e;
        String strM = wVar.f95628d;
        if (k.K0(strM, ":", false)) {
            strM = c1.m(AbstractJsonLexerKt.END_LIST, "[", strM);
        }
        if (!z11) {
            String scheme = wVar.f95625a;
            Intrinsics.g(scheme, "scheme");
            if (i5 == (scheme.equals("http") ? 80 : scheme.equals("https") ? 443 : -1)) {
                return strM;
            }
        }
        return strM + AbstractJsonLexerKt.COLON + i5;
    }

    public static final List v(List list) {
        Intrinsics.g(list, "<this>");
        List listUnmodifiableList = Collections.unmodifiableList(b70.g.K1(list));
        Intrinsics.f(listUnmodifiableList, "unmodifiableList(toMutableList())");
        return listUnmodifiableList;
    }

    public static final int w(int i5, String str) throws NumberFormatException {
        if (str == null) {
            return i5;
        }
        try {
            long j11 = Long.parseLong(str);
            if (j11 > 2147483647L) {
                return LayoutNode.NotPlacedPlaceOrder;
            }
            if (j11 < 0) {
                return 0;
            }
            return (int) j11;
        } catch (NumberFormatException unused) {
            return i5;
        }
    }

    public static final String x(int i5, int i11, String str) {
        int iL = l(i5, i11, str);
        String strSubstring = str.substring(iL, m(iL, i11, str));
        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        return strSubstring;
    }
}
