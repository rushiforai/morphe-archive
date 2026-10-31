package aq;

import com.squareup.moshi.JsonDataException;
import java.io.IOException;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class w extends x {

    /* renamed from: k, reason: collision with root package name */
    public static final String[] f15525k = new String[128];

    /* renamed from: h, reason: collision with root package name */
    public final m90.g f15526h;

    /* renamed from: i, reason: collision with root package name */
    public String f15527i;

    /* renamed from: j, reason: collision with root package name */
    public String f15528j;

    static {
        for (int i5 = 0; i5 <= 31; i5++) {
            f15525k[i5] = String.format("\\u%04x", Integer.valueOf(i5));
        }
        String[] strArr = f15525k;
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
    }

    public w(m90.g gVar) {
        int[] iArr = new int[32];
        this.f15530b = iArr;
        this.f15531c = new String[32];
        this.f15532d = new int[32];
        this.f15535g = -1;
        this.f15527i = ":";
        this.f15526h = gVar;
        this.f15529a = 1;
        iArr[0] = 6;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void K(m90.g gVar, String str) {
        String str2;
        gVar.g0(34);
        int length = str.length();
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            char cCharAt = str.charAt(i11);
            if (cCharAt < 128) {
                str2 = f15525k[cCharAt];
                if (str2 != null) {
                    if (i5 < i11) {
                        gVar.l0(i5, i11, str);
                    }
                    gVar.m0(str2);
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
                gVar.m0(str2);
                i5 = i11 + 1;
            }
        }
        if (i5 < length) {
            gVar.l0(i5, length, str);
        }
        gVar.g0(34);
    }

    public final void A(int i5, int i11, char c11) {
        int i12;
        int i13 = this.f15529a;
        int i14 = this.f15535g;
        if (i13 == i14 && ((i12 = this.f15530b[i13 - 1]) == i5 || i12 == i11)) {
            this.f15535g = ~i14;
            return;
        }
        p();
        int i15 = this.f15529a;
        int[] iArr = this.f15530b;
        if (i15 == iArr.length) {
            if (i15 == 256) {
                throw new JsonDataException("Nesting too deep at " + c() + ": circular reference?");
            }
            this.f15530b = Arrays.copyOf(iArr, iArr.length * 2);
            String[] strArr = this.f15531c;
            this.f15531c = (String[]) Arrays.copyOf(strArr, strArr.length * 2);
            int[] iArr2 = this.f15532d;
            this.f15532d = Arrays.copyOf(iArr2, iArr2.length * 2);
        }
        int[] iArr3 = this.f15530b;
        int i16 = this.f15529a;
        this.f15529a = i16 + 1;
        iArr3[i16] = i5;
        this.f15532d[i16] = 0;
        this.f15526h.g0(c11);
    }

    public final void D(String str) {
        this.f15533e = !str.isEmpty() ? str : null;
        this.f15527i = !str.isEmpty() ? ": " : ":";
    }

    public final void M() {
        if (this.f15528j != null) {
            int iF = f();
            m90.g gVar = this.f15526h;
            if (iF == 5) {
                gVar.g0(44);
            } else if (iF != 3) {
                throw new IllegalStateException("Nesting problem.");
            }
            w();
            this.f15530b[this.f15529a - 1] = 4;
            K(gVar, this.f15528j);
            this.f15528j = null;
        }
    }

    @Override // aq.x
    public final w a() {
        if (this.f15534f) {
            throw new IllegalStateException("Array cannot be used as a map key in JSON at path " + c());
        }
        M();
        A(1, 2, AbstractJsonLexerKt.BEGIN_LIST);
        return this;
    }

    @Override // aq.x
    public final w b() {
        if (this.f15534f) {
            throw new IllegalStateException("Object cannot be used as a map key in JSON at path " + c());
        }
        M();
        A(3, 5, AbstractJsonLexerKt.BEGIN_OBJ);
        return this;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        int i5 = this.f15529a;
        if (i5 > 1 || (i5 == 1 && this.f15530b[i5 - 1] != 7)) {
            throw new IOException("Incomplete document");
        }
        this.f15529a = 0;
    }

    @Override // aq.x
    public final w d(String str) {
        if (str == null) {
            throw new NullPointerException("name == null");
        }
        if (this.f15529a == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        int iF = f();
        if ((iF != 3 && iF != 5) || this.f15528j != null || this.f15534f) {
            throw new IllegalStateException("Nesting problem.");
        }
        this.f15528j = str;
        this.f15531c[this.f15529a - 1] = str;
        return this;
    }

    @Override // aq.x
    public final w e() {
        if (this.f15534f) {
            throw new IllegalStateException("null cannot be used as a map key in JSON at path " + c());
        }
        if (this.f15528j != null) {
            this.f15528j = null;
            return this;
        }
        p();
        this.f15526h.m0(AbstractJsonLexerKt.NULL);
        int[] iArr = this.f15532d;
        int i5 = this.f15529a - 1;
        iArr[i5] = iArr[i5] + 1;
        return this;
    }

    @Override // java.io.Flushable
    public final void flush() {
        if (this.f15529a == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
    }

    @Override // aq.x
    public final w h(long j11) {
        if (this.f15534f) {
            this.f15534f = false;
            d(Long.toString(j11));
            return this;
        }
        M();
        p();
        this.f15526h.m0(Long.toString(j11));
        int[] iArr = this.f15532d;
        int i5 = this.f15529a - 1;
        iArr[i5] = iArr[i5] + 1;
        return this;
    }

    @Override // aq.x
    public final w l(String str) {
        if (str == null) {
            e();
            return this;
        }
        if (this.f15534f) {
            this.f15534f = false;
            d(str);
            return this;
        }
        M();
        p();
        K(this.f15526h, str);
        int[] iArr = this.f15532d;
        int i5 = this.f15529a - 1;
        iArr[i5] = iArr[i5] + 1;
        return this;
    }

    public final void p() {
        int iF = f();
        int i5 = 2;
        if (iF != 1) {
            m90.g gVar = this.f15526h;
            if (iF == 2) {
                gVar.g0(44);
                w();
            } else if (iF == 4) {
                gVar.m0(this.f15527i);
                i5 = 5;
            } else {
                if (iF == 9) {
                    throw new IllegalStateException("Sink from valueSink() was not closed");
                }
                if (iF != 6) {
                    if (iF != 7) {
                        throw new IllegalStateException("Nesting problem.");
                    }
                    throw new IllegalStateException("JSON must have only one top-level value.");
                }
                i5 = 7;
            }
        } else {
            w();
        }
        this.f15530b[this.f15529a - 1] = i5;
    }

    public final void s(int i5, int i11, char c11) {
        int iF = f();
        if (iF != i11 && iF != i5) {
            throw new IllegalStateException("Nesting problem.");
        }
        if (this.f15528j != null) {
            throw new IllegalStateException("Dangling name: " + this.f15528j);
        }
        int i12 = this.f15529a;
        int i13 = ~this.f15535g;
        if (i12 == i13) {
            this.f15535g = i13;
            return;
        }
        int i14 = i12 - 1;
        this.f15529a = i14;
        this.f15531c[i14] = null;
        int[] iArr = this.f15532d;
        int i15 = i12 - 2;
        iArr[i15] = iArr[i15] + 1;
        if (iF == i11) {
            w();
        }
        this.f15526h.g0(c11);
    }

    public final void w() {
        if (this.f15533e == null) {
            return;
        }
        m90.g gVar = this.f15526h;
        gVar.g0(10);
        int i5 = this.f15529a;
        for (int i11 = 1; i11 < i5; i11++) {
            gVar.m0(this.f15533e);
        }
    }
}
