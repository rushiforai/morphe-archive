package in;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.MalformedJsonException;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class q extends JsonReader {

    /* renamed from: e, reason: collision with root package name */
    public static final o f61750e = new o();

    /* renamed from: f, reason: collision with root package name */
    public static final Object f61751f = new Object();

    /* renamed from: a, reason: collision with root package name */
    public Object[] f61752a;

    /* renamed from: b, reason: collision with root package name */
    public int f61753b;

    /* renamed from: c, reason: collision with root package name */
    public String[] f61754c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f61755d;

    public final void a(JsonToken jsonToken) {
        if (peek() == jsonToken) {
            return;
        }
        throw new IllegalStateException("Expected " + jsonToken + " but was " + peek() + b());
    }

    public final String b() {
        return " at path " + getPath(false);
    }

    @Override // com.google.gson.stream.JsonReader
    public final void beginArray() {
        a(JsonToken.BEGIN_ARRAY);
        f(((com.google.gson.m) d()).f34793a.iterator());
        this.f61755d[this.f61753b - 1] = 0;
    }

    @Override // com.google.gson.stream.JsonReader
    public final void beginObject() {
        a(JsonToken.BEGIN_OBJECT);
        f(((hn.m) ((com.google.gson.r) d()).f34795a.entrySet()).iterator());
    }

    public final String c(boolean z11) {
        a(JsonToken.NAME);
        Map.Entry entry = (Map.Entry) ((Iterator) d()).next();
        String str = (String) entry.getKey();
        this.f61754c[this.f61753b - 1] = z11 ? "<skipped>" : str;
        f(entry.getValue());
        return str;
    }

    @Override // com.google.gson.stream.JsonReader, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f61752a = new Object[]{f61751f};
        this.f61753b = 1;
    }

    public final Object d() {
        return this.f61752a[this.f61753b - 1];
    }

    public final Object e() {
        Object[] objArr = this.f61752a;
        int i5 = this.f61753b - 1;
        this.f61753b = i5;
        Object obj = objArr[i5];
        objArr[i5] = null;
        return obj;
    }

    @Override // com.google.gson.stream.JsonReader
    public final void endArray() {
        a(JsonToken.END_ARRAY);
        e();
        e();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
    }

    @Override // com.google.gson.stream.JsonReader
    public final void endObject() {
        a(JsonToken.END_OBJECT);
        this.f61754c[this.f61753b - 1] = null;
        e();
        e();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
    }

    public final void f(Object obj) {
        int i5 = this.f61753b;
        Object[] objArr = this.f61752a;
        if (i5 == objArr.length) {
            int i11 = i5 * 2;
            this.f61752a = Arrays.copyOf(objArr, i11);
            this.f61755d = Arrays.copyOf(this.f61755d, i11);
            this.f61754c = (String[]) Arrays.copyOf(this.f61754c, i11);
        }
        Object[] objArr2 = this.f61752a;
        int i12 = this.f61753b;
        this.f61753b = i12 + 1;
        objArr2[i12] = obj;
    }

    public final String getPath(boolean z11) {
        StringBuilder sb2 = new StringBuilder("$");
        int i5 = 0;
        while (true) {
            int i11 = this.f61753b;
            if (i5 >= i11) {
                return sb2.toString();
            }
            Object[] objArr = this.f61752a;
            Object obj = objArr[i5];
            if (obj instanceof com.google.gson.m) {
                i5++;
                if (i5 < i11 && (objArr[i5] instanceof Iterator)) {
                    int i12 = this.f61755d[i5];
                    if (z11 && i12 > 0 && (i5 == i11 - 1 || i5 == i11 - 2)) {
                        i12--;
                    }
                    sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                    sb2.append(i12);
                    sb2.append(AbstractJsonLexerKt.END_LIST);
                }
            } else if ((obj instanceof com.google.gson.r) && (i5 = i5 + 1) < i11 && (objArr[i5] instanceof Iterator)) {
                sb2.append('.');
                String str = this.f61754c[i5];
                if (str != null) {
                    sb2.append(str);
                }
            }
            i5++;
        }
    }

    @Override // com.google.gson.stream.JsonReader
    public final String getPreviousPath() {
        return getPath(true);
    }

    @Override // com.google.gson.stream.JsonReader
    public final boolean hasNext() {
        JsonToken jsonTokenPeek = peek();
        return (jsonTokenPeek == JsonToken.END_OBJECT || jsonTokenPeek == JsonToken.END_ARRAY || jsonTokenPeek == JsonToken.END_DOCUMENT) ? false : true;
    }

    @Override // com.google.gson.stream.JsonReader
    public final boolean nextBoolean() {
        a(JsonToken.BOOLEAN);
        boolean zD = ((com.google.gson.s) e()).d();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
        return zD;
    }

    @Override // com.google.gson.stream.JsonReader
    public final double nextDouble() throws MalformedJsonException {
        JsonToken jsonTokenPeek = peek();
        JsonToken jsonToken = JsonToken.NUMBER;
        if (jsonTokenPeek != jsonToken && jsonTokenPeek != JsonToken.STRING) {
            throw new IllegalStateException("Expected " + jsonToken + " but was " + jsonTokenPeek + b());
        }
        double dE = ((com.google.gson.s) d()).e();
        if (!isLenient() && (Double.isNaN(dE) || Double.isInfinite(dE))) {
            throw new MalformedJsonException("JSON forbids NaN and infinities: " + dE);
        }
        e();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
        return dE;
    }

    @Override // com.google.gson.stream.JsonReader
    public final int nextInt() {
        JsonToken jsonTokenPeek = peek();
        JsonToken jsonToken = JsonToken.NUMBER;
        if (jsonTokenPeek != jsonToken && jsonTokenPeek != JsonToken.STRING) {
            throw new IllegalStateException("Expected " + jsonToken + " but was " + jsonTokenPeek + b());
        }
        int iG = ((com.google.gson.s) d()).g();
        e();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
        return iG;
    }

    @Override // com.google.gson.stream.JsonReader
    public final long nextLong() {
        JsonToken jsonTokenPeek = peek();
        JsonToken jsonToken = JsonToken.NUMBER;
        if (jsonTokenPeek != jsonToken && jsonTokenPeek != JsonToken.STRING) {
            throw new IllegalStateException("Expected " + jsonToken + " but was " + jsonTokenPeek + b());
        }
        long jL = ((com.google.gson.s) d()).l();
        e();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
        return jL;
    }

    @Override // com.google.gson.stream.JsonReader
    public final String nextName() {
        return c(false);
    }

    @Override // com.google.gson.stream.JsonReader
    public final void nextNull() {
        a(JsonToken.NULL);
        e();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
    }

    @Override // com.google.gson.stream.JsonReader
    public final String nextString() {
        JsonToken jsonTokenPeek = peek();
        JsonToken jsonToken = JsonToken.STRING;
        if (jsonTokenPeek != jsonToken && jsonTokenPeek != JsonToken.NUMBER) {
            throw new IllegalStateException("Expected " + jsonToken + " but was " + jsonTokenPeek + b());
        }
        String strO = ((com.google.gson.s) e()).o();
        int i5 = this.f61753b;
        if (i5 > 0) {
            int[] iArr = this.f61755d;
            int i11 = i5 - 1;
            iArr[i11] = iArr[i11] + 1;
        }
        return strO;
    }

    @Override // com.google.gson.stream.JsonReader
    public final JsonToken peek() {
        if (this.f61753b == 0) {
            return JsonToken.END_DOCUMENT;
        }
        Object objD = d();
        if (objD instanceof Iterator) {
            boolean z11 = this.f61752a[this.f61753b - 2] instanceof com.google.gson.r;
            Iterator it = (Iterator) objD;
            if (!it.hasNext()) {
                return z11 ? JsonToken.END_OBJECT : JsonToken.END_ARRAY;
            }
            if (z11) {
                return JsonToken.NAME;
            }
            f(it.next());
            return peek();
        }
        if (objD instanceof com.google.gson.r) {
            return JsonToken.BEGIN_OBJECT;
        }
        if (objD instanceof com.google.gson.m) {
            return JsonToken.BEGIN_ARRAY;
        }
        if (objD instanceof com.google.gson.s) {
            Serializable serializable = ((com.google.gson.s) objD).f34796a;
            if (serializable instanceof String) {
                return JsonToken.STRING;
            }
            if (serializable instanceof Boolean) {
                return JsonToken.BOOLEAN;
            }
            if (serializable instanceof Number) {
                return JsonToken.NUMBER;
            }
            throw new AssertionError();
        }
        if (objD instanceof com.google.gson.q) {
            return JsonToken.NULL;
        }
        if (objD == f61751f) {
            throw new IllegalStateException("JsonReader is closed");
        }
        throw new MalformedJsonException("Custom JsonElement subclass " + objD.getClass().getName() + " is not supported");
    }

    @Override // com.google.gson.stream.JsonReader
    public final void skipValue() {
        int i5 = p.f61725a[peek().ordinal()];
        if (i5 == 1) {
            c(true);
            return;
        }
        if (i5 == 2) {
            endArray();
            return;
        }
        if (i5 == 3) {
            endObject();
            return;
        }
        if (i5 != 4) {
            e();
            int i11 = this.f61753b;
            if (i11 > 0) {
                int[] iArr = this.f61755d;
                int i12 = i11 - 1;
                iArr[i12] = iArr[i12] + 1;
            }
        }
    }

    @Override // com.google.gson.stream.JsonReader
    public final String toString() {
        return q.class.getSimpleName() + b();
    }

    @Override // com.google.gson.stream.JsonReader
    public final String getPath() {
        return getPath(false);
    }
}
