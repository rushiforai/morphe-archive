package in;

import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

/* loaded from: classes.dex */
public final class s extends JsonWriter {

    /* renamed from: d, reason: collision with root package name */
    public static final r f61756d = new r();

    /* renamed from: e, reason: collision with root package name */
    public static final com.google.gson.s f61757e = new com.google.gson.s("closed");

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f61758a;

    /* renamed from: b, reason: collision with root package name */
    public String f61759b;

    /* renamed from: c, reason: collision with root package name */
    public com.google.gson.p f61760c;

    public s() {
        super(f61756d);
        this.f61758a = new ArrayList();
        this.f61760c = com.google.gson.q.f34794a;
    }

    public final com.google.gson.p a() {
        ArrayList arrayList = this.f61758a;
        if (arrayList.isEmpty()) {
            return this.f61760c;
        }
        throw new IllegalStateException("Expected one JSON element but was " + arrayList);
    }

    public final com.google.gson.p b() {
        return (com.google.gson.p) h6.c1.l(this.f61758a, 1);
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter beginArray() {
        com.google.gson.m mVar = new com.google.gson.m();
        c(mVar);
        this.f61758a.add(mVar);
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter beginObject() {
        com.google.gson.r rVar = new com.google.gson.r();
        c(rVar);
        this.f61758a.add(rVar);
        return this;
    }

    public final void c(com.google.gson.p pVar) {
        if (this.f61759b != null) {
            if (!(pVar instanceof com.google.gson.q) || getSerializeNulls()) {
                ((com.google.gson.r) b()).p(this.f61759b, pVar);
            }
            this.f61759b = null;
            return;
        }
        if (this.f61758a.isEmpty()) {
            this.f61760c = pVar;
            return;
        }
        com.google.gson.p pVarB = b();
        if (!(pVarB instanceof com.google.gson.m)) {
            throw new IllegalStateException();
        }
        ((com.google.gson.m) pVarB).p(pVar);
    }

    @Override // com.google.gson.stream.JsonWriter, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        ArrayList arrayList = this.f61758a;
        if (!arrayList.isEmpty()) {
            throw new IOException("Incomplete document");
        }
        arrayList.add(f61757e);
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter endArray() {
        ArrayList arrayList = this.f61758a;
        if (arrayList.isEmpty() || this.f61759b != null) {
            throw new IllegalStateException();
        }
        if (!(b() instanceof com.google.gson.m)) {
            throw new IllegalStateException();
        }
        arrayList.remove(arrayList.size() - 1);
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter endObject() {
        ArrayList arrayList = this.f61758a;
        if (arrayList.isEmpty() || this.f61759b != null) {
            throw new IllegalStateException();
        }
        if (!(b() instanceof com.google.gson.r)) {
            throw new IllegalStateException();
        }
        arrayList.remove(arrayList.size() - 1);
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter, java.io.Flushable
    public final void flush() {
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter jsonValue(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter name(String str) {
        Objects.requireNonNull(str, "name == null");
        if (this.f61758a.isEmpty() || this.f61759b != null) {
            throw new IllegalStateException("Did not expect a name");
        }
        if (!(b() instanceof com.google.gson.r)) {
            throw new IllegalStateException("Please begin an object before writing a name.");
        }
        this.f61759b = str;
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter nullValue() {
        c(com.google.gson.q.f34794a);
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter value(boolean z11) {
        c(new com.google.gson.s(Boolean.valueOf(z11)));
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter value(float f11) {
        if (isLenient() || !(Float.isNaN(f11) || Float.isInfinite(f11))) {
            c(new com.google.gson.s(Float.valueOf(f11)));
            return this;
        }
        throw new IllegalArgumentException("JSON forbids NaN and infinities: " + f11);
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter value(double d5) {
        if (!isLenient() && (Double.isNaN(d5) || Double.isInfinite(d5))) {
            throw new IllegalArgumentException("JSON forbids NaN and infinities: " + d5);
        }
        c(new com.google.gson.s(Double.valueOf(d5)));
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter value(long j11) {
        c(new com.google.gson.s(Long.valueOf(j11)));
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter value(Boolean bool) {
        if (bool == null) {
            c(com.google.gson.q.f34794a);
            return this;
        }
        c(new com.google.gson.s(bool));
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter value(Number number) {
        if (number == null) {
            c(com.google.gson.q.f34794a);
            return this;
        }
        if (!isLenient()) {
            double dDoubleValue = number.doubleValue();
            if (Double.isNaN(dDoubleValue) || Double.isInfinite(dDoubleValue)) {
                throw new IllegalArgumentException("JSON forbids NaN and infinities: " + number);
            }
        }
        c(new com.google.gson.s(number));
        return this;
    }

    @Override // com.google.gson.stream.JsonWriter
    public final JsonWriter value(String str) {
        if (str == null) {
            c(com.google.gson.q.f34794a);
            return this;
        }
        c(new com.google.gson.s(str));
        return this;
    }
}
