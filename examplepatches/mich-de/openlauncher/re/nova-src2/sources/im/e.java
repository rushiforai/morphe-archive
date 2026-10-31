package im;

import android.util.Base64;
import android.util.JsonWriter;
import com.google.firebase.encoders.EncodingException;
import gm.g;
import java.io.IOException;
import java.io.Writer;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes.dex */
public final class e implements gm.e, g {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f61649a = true;

    /* renamed from: b, reason: collision with root package name */
    public final JsonWriter f61650b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f61651c;

    /* renamed from: d, reason: collision with root package name */
    public final Map f61652d;

    /* renamed from: e, reason: collision with root package name */
    public final gm.d f61653e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f61654f;

    public e(Writer writer, HashMap map, HashMap map2, a aVar, boolean z11) {
        this.f61650b = new JsonWriter(writer);
        this.f61651c = map;
        this.f61652d = map2;
        this.f61653e = aVar;
        this.f61654f = z11;
    }

    @Override // gm.g
    public final g a(String str) throws IOException {
        j();
        this.f61650b.value(str);
        return this;
    }

    @Override // gm.e
    public final gm.e b(gm.c cVar, boolean z11) throws IOException {
        String str = cVar.f57747a;
        j();
        JsonWriter jsonWriter = this.f61650b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(z11);
        return this;
    }

    @Override // gm.e
    public final gm.e c(gm.c cVar, int i5) throws IOException {
        String str = cVar.f57747a;
        j();
        JsonWriter jsonWriter = this.f61650b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(i5);
        return this;
    }

    @Override // gm.e
    public final gm.e d(gm.c cVar, long j11) throws IOException {
        String str = cVar.f57747a;
        j();
        JsonWriter jsonWriter = this.f61650b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(j11);
        return this;
    }

    @Override // gm.e
    public final gm.e e(gm.c cVar, double d5) throws IOException {
        String str = cVar.f57747a;
        j();
        JsonWriter jsonWriter = this.f61650b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(d5);
        return this;
    }

    @Override // gm.e
    public final gm.e f(gm.c cVar, Object obj) throws IOException {
        i(obj, cVar.f57747a);
        return this;
    }

    @Override // gm.g
    public final g g(boolean z11) throws IOException {
        j();
        this.f61650b.value(z11);
        return this;
    }

    public final e h(Object obj) throws IOException {
        JsonWriter jsonWriter = this.f61650b;
        if (obj == null) {
            jsonWriter.nullValue();
            return this;
        }
        if (obj instanceof Number) {
            jsonWriter.value((Number) obj);
            return this;
        }
        if (!obj.getClass().isArray()) {
            if (obj instanceof Collection) {
                jsonWriter.beginArray();
                Iterator it = ((Collection) obj).iterator();
                while (it.hasNext()) {
                    h(it.next());
                }
                jsonWriter.endArray();
                return this;
            }
            if (obj instanceof Map) {
                jsonWriter.beginObject();
                for (Map.Entry entry : ((Map) obj).entrySet()) {
                    Object key = entry.getKey();
                    try {
                        i(entry.getValue(), (String) key);
                    } catch (ClassCastException e3) {
                        throw new EncodingException(String.format("Only String keys are currently supported in maps, got %s of type %s instead.", key, key.getClass()), e3);
                    }
                }
                jsonWriter.endObject();
                return this;
            }
            gm.d dVar = (gm.d) this.f61651c.get(obj.getClass());
            if (dVar != null) {
                jsonWriter.beginObject();
                dVar.encode(obj, this);
                jsonWriter.endObject();
                return this;
            }
            gm.f fVar = (gm.f) this.f61652d.get(obj.getClass());
            if (fVar != null) {
                fVar.encode(obj, this);
                return this;
            }
            if (!(obj instanceof Enum)) {
                jsonWriter.beginObject();
                this.f61653e.encode(obj, this);
                jsonWriter.endObject();
                return this;
            }
            if (obj instanceof f) {
                int number = ((f) obj).getNumber();
                j();
                jsonWriter.value(number);
                return this;
            }
            String strName = ((Enum) obj).name();
            j();
            jsonWriter.value(strName);
            return this;
        }
        if (obj instanceof byte[]) {
            j();
            jsonWriter.value(Base64.encodeToString((byte[]) obj, 2));
            return this;
        }
        jsonWriter.beginArray();
        int i5 = 0;
        if (obj instanceof int[]) {
            int length = ((int[]) obj).length;
            while (i5 < length) {
                jsonWriter.value(r6[i5]);
                i5++;
            }
        } else if (obj instanceof long[]) {
            long[] jArr = (long[]) obj;
            int length2 = jArr.length;
            while (i5 < length2) {
                long j11 = jArr[i5];
                j();
                jsonWriter.value(j11);
                i5++;
            }
        } else if (obj instanceof double[]) {
            double[] dArr = (double[]) obj;
            int length3 = dArr.length;
            while (i5 < length3) {
                jsonWriter.value(dArr[i5]);
                i5++;
            }
        } else if (obj instanceof boolean[]) {
            boolean[] zArr = (boolean[]) obj;
            int length4 = zArr.length;
            while (i5 < length4) {
                jsonWriter.value(zArr[i5]);
                i5++;
            }
        } else if (obj instanceof Number[]) {
            Number[] numberArr = (Number[]) obj;
            int length5 = numberArr.length;
            while (i5 < length5) {
                h(numberArr[i5]);
                i5++;
            }
        } else {
            Object[] objArr = (Object[]) obj;
            int length6 = objArr.length;
            while (i5 < length6) {
                h(objArr[i5]);
                i5++;
            }
        }
        jsonWriter.endArray();
        return this;
    }

    public final e i(Object obj, String str) throws IOException {
        boolean z11 = this.f61654f;
        JsonWriter jsonWriter = this.f61650b;
        if (z11) {
            if (obj == null) {
                return this;
            }
            j();
            jsonWriter.name(str);
            h(obj);
            return this;
        }
        j();
        jsonWriter.name(str);
        if (obj == null) {
            jsonWriter.nullValue();
            return this;
        }
        h(obj);
        return this;
    }

    public final void j() {
        if (!this.f61649a) {
            throw new IllegalStateException("Parent context used since this context was created. Cannot use this context anymore.");
        }
    }
}
