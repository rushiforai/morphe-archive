package kp;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.vungle.ads.internal.protos.Sdk;
import cp.i;
import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public class b implements Closeable, Flushable {

    /* renamed from: l, reason: collision with root package name */
    public static final Pattern f72099l = Pattern.compile("-?(?:0|[1-9][0-9]*)(?:\\.[0-9]+)?(?:[eE][-+]?[0-9]+)?");

    /* renamed from: m, reason: collision with root package name */
    public static final String[] f72100m = new String[128];
    public static final String[] n;

    /* renamed from: a, reason: collision with root package name */
    public final Writer f72101a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f72102b;

    /* renamed from: c, reason: collision with root package name */
    public int f72103c;

    /* renamed from: d, reason: collision with root package name */
    public i f72104d;

    /* renamed from: e, reason: collision with root package name */
    public String f72105e;

    /* renamed from: f, reason: collision with root package name */
    public String f72106f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f72107g;

    /* renamed from: h, reason: collision with root package name */
    public int f72108h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f72109i;

    /* renamed from: j, reason: collision with root package name */
    public String f72110j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f72111k;

    static {
        for (int i5 = 0; i5 <= 31; i5++) {
            f72100m[i5] = String.format("\\u%04x", Integer.valueOf(i5));
        }
        String[] strArr = f72100m;
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
        String[] strArr2 = (String[]) strArr.clone();
        n = strArr2;
        strArr2[60] = "\\u003c";
        strArr2[62] = "\\u003e";
        strArr2[38] = "\\u0026";
        strArr2[61] = "\\u003d";
        strArr2[39] = "\\u0027";
    }

    public b(Writer writer) {
        int[] iArr = new int[32];
        this.f72102b = iArr;
        this.f72103c = 0;
        if (iArr.length == 0) {
            this.f72102b = Arrays.copyOf(iArr, 0);
        }
        int[] iArr2 = this.f72102b;
        int i5 = this.f72103c;
        this.f72103c = i5 + 1;
        iArr2[i5] = 6;
        this.f72108h = 2;
        this.f72111k = true;
        Objects.requireNonNull(writer, "out == null");
        this.f72101a = writer;
        w(i.f47746d);
    }

    public final void A(int i5) {
        if (i5 == 0) {
            throw null;
        }
        this.f72108h = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void D(String str) throws IOException {
        String str2;
        String[] strArr = this.f72109i ? n : f72100m;
        Writer writer = this.f72101a;
        writer.write(34);
        int length = str.length();
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            char cCharAt = str.charAt(i11);
            if (cCharAt < 128) {
                str2 = strArr[cCharAt];
                if (str2 != null) {
                    if (i5 < i11) {
                        writer.write(str, i5, i11 - i5);
                    }
                    writer.write(str2);
                    i5 = i11 + 1;
                }
            } else {
                if (cCharAt == 8232) {
                    str2 = "\\u2028";
                } else if (cCharAt == 8233) {
                    str2 = "\\u2029";
                }
                if (i5 < i11) {
                }
                writer.write(str2);
                i5 = i11 + 1;
            }
        }
        if (i5 < length) {
            writer.write(str, i5, length - i5);
        }
        writer.write(34);
    }

    public void K(double d5) throws IOException {
        c0();
        if (this.f72108h == 1 || !(Double.isNaN(d5) || Double.isInfinite(d5))) {
            a();
            this.f72101a.append((CharSequence) Double.toString(d5));
        } else {
            throw new IllegalArgumentException("Numeric values must be finite, but was " + d5);
        }
    }

    public void M(long j11) throws IOException {
        c0();
        a();
        this.f72101a.write(Long.toString(j11));
    }

    public void P(Number number) throws IOException {
        if (number == null) {
            p();
            return;
        }
        c0();
        String string = number.toString();
        Class<?> cls = number.getClass();
        if (cls != Integer.class && cls != Long.class && cls != Byte.class && cls != Short.class && cls != BigDecimal.class && cls != BigInteger.class && cls != AtomicInteger.class && cls != AtomicLong.class) {
            if (string.equals("-Infinity") || string.equals("Infinity") || string.equals("NaN")) {
                if (this.f72108h != 1) {
                    throw new IllegalArgumentException("Numeric values must be finite, but was ".concat(string));
                }
            } else if (cls != Float.class && cls != Double.class && !f72099l.matcher(string).matches()) {
                throw new IllegalArgumentException("String created by " + cls + " is not a valid JSON number: " + string);
            }
        }
        a();
        this.f72101a.append((CharSequence) string);
    }

    public void S(String str) throws IOException {
        if (str == null) {
            p();
            return;
        }
        c0();
        a();
        D(str);
    }

    public void V(boolean z11) throws IOException {
        c0();
        a();
        this.f72101a.write(z11 ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
    }

    public final void a() throws IOException {
        int iS = s();
        if (iS == 1) {
            this.f72102b[this.f72103c - 1] = 2;
            l();
            return;
        }
        Writer writer = this.f72101a;
        if (iS == 2) {
            writer.append((CharSequence) this.f72106f);
            l();
        } else {
            if (iS == 4) {
                writer.append((CharSequence) this.f72105e);
                this.f72102b[this.f72103c - 1] = 5;
                return;
            }
            if (iS != 6) {
                if (iS != 7) {
                    throw new IllegalStateException("Nesting problem.");
                }
                if (this.f72108h != 1) {
                    throw new IllegalStateException("JSON must have only one top-level value.");
                }
            }
            this.f72102b[this.f72103c - 1] = 7;
        }
    }

    public void b() throws IOException {
        c0();
        a();
        int i5 = this.f72103c;
        int[] iArr = this.f72102b;
        if (i5 == iArr.length) {
            this.f72102b = Arrays.copyOf(iArr, i5 * 2);
        }
        int[] iArr2 = this.f72102b;
        int i11 = this.f72103c;
        this.f72103c = i11 + 1;
        iArr2[i11] = 1;
        this.f72101a.write(91);
    }

    public void c() throws IOException {
        c0();
        a();
        int i5 = this.f72103c;
        int[] iArr = this.f72102b;
        if (i5 == iArr.length) {
            this.f72102b = Arrays.copyOf(iArr, i5 * 2);
        }
        int[] iArr2 = this.f72102b;
        int i11 = this.f72103c;
        this.f72103c = i11 + 1;
        iArr2[i11] = 3;
        this.f72101a.write(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
    }

    public final void c0() throws IOException {
        if (this.f72110j != null) {
            int iS = s();
            if (iS == 5) {
                this.f72101a.write(this.f72106f);
            } else if (iS != 3) {
                throw new IllegalStateException("Nesting problem.");
            }
            l();
            this.f72102b[this.f72103c - 1] = 4;
            D(this.f72110j);
            this.f72110j = null;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.f72101a.close();
        int i5 = this.f72103c;
        if (i5 > 1 || (i5 == 1 && this.f72102b[i5 - 1] != 7)) {
            throw new IOException("Incomplete document");
        }
        this.f72103c = 0;
    }

    public final void d(int i5, int i11, char c11) throws IOException {
        int iS = s();
        if (iS != i11 && iS != i5) {
            throw new IllegalStateException("Nesting problem.");
        }
        if (this.f72110j != null) {
            throw new IllegalStateException("Dangling name: " + this.f72110j);
        }
        this.f72103c--;
        if (iS == i11) {
            l();
        }
        this.f72101a.write(c11);
    }

    public void e() throws IOException {
        d(1, 2, AbstractJsonLexerKt.END_LIST);
    }

    public void f() throws IOException {
        d(3, 5, AbstractJsonLexerKt.END_OBJ);
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        if (this.f72103c == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        this.f72101a.flush();
    }

    public void h(String str) {
        Objects.requireNonNull(str, "name == null");
        if (this.f72110j != null) {
            throw new IllegalStateException("Already wrote a name, expecting a value.");
        }
        int iS = s();
        if (iS != 3 && iS != 5) {
            throw new IllegalStateException("Please begin an object before writing a name.");
        }
        this.f72110j = str;
    }

    public final void l() throws IOException {
        if (this.f72107g) {
            return;
        }
        String str = this.f72104d.f47747a;
        Writer writer = this.f72101a;
        writer.write(str);
        int i5 = this.f72103c;
        for (int i11 = 1; i11 < i5; i11++) {
            writer.write(this.f72104d.f47748b);
        }
    }

    public b p() throws IOException {
        if (this.f72110j != null) {
            if (!this.f72111k) {
                this.f72110j = null;
                return this;
            }
            c0();
        }
        a();
        this.f72101a.write(AbstractJsonLexerKt.NULL);
        return this;
    }

    public final int s() {
        int i5 = this.f72103c;
        if (i5 != 0) {
            return this.f72102b[i5 - 1];
        }
        throw new IllegalStateException("JsonWriter is closed.");
    }

    public final void w(i iVar) {
        Objects.requireNonNull(iVar);
        this.f72104d = iVar;
        this.f72106f = ",";
        if (iVar.f47749c) {
            this.f72105e = ": ";
            if (iVar.f47747a.isEmpty()) {
                this.f72106f = ", ";
            }
        } else {
            this.f72105e = ":";
        }
        this.f72107g = this.f72104d.f47747a.isEmpty() && this.f72104d.f47748b.isEmpty();
    }
}
