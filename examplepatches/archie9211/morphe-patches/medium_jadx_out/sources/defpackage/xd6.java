package defpackage;

import android.util.Base64;
import android.util.JsonWriter;
import com.google.firebase.encoders.EncodingException;
import java.io.IOException;
import java.io.Writer;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xd6 implements mm8, fqe {
    public final boolean a = true;
    public final JsonWriter b;
    public final Map c;
    public final Map d;
    public final lm8 e;
    public final boolean f;

    public xd6(Writer writer, HashMap map, HashMap map2, vb6 vb6Var, boolean z) {
        this.b = new JsonWriter(writer);
        this.c = map;
        this.d = map2;
        this.e = vb6Var;
        this.f = z;
    }

    @Override // defpackage.mm8
    public final mm8 a(gf4 gf4Var, Object obj) throws IOException {
        i(gf4Var.a, obj);
        return this;
    }

    @Override // defpackage.fqe
    public final fqe b(String str) throws IOException {
        j();
        this.b.value(str);
        return this;
    }

    @Override // defpackage.fqe
    public final fqe c(boolean z) throws IOException {
        j();
        this.b.value(z);
        return this;
    }

    @Override // defpackage.mm8
    public final mm8 d(gf4 gf4Var, boolean z) throws IOException {
        String str = gf4Var.a;
        j();
        JsonWriter jsonWriter = this.b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(z);
        return this;
    }

    @Override // defpackage.mm8
    public final mm8 e(gf4 gf4Var, int i) throws IOException {
        String str = gf4Var.a;
        j();
        JsonWriter jsonWriter = this.b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(i);
        return this;
    }

    @Override // defpackage.mm8
    public final mm8 f(gf4 gf4Var, double d) throws IOException {
        String str = gf4Var.a;
        j();
        JsonWriter jsonWriter = this.b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(d);
        return this;
    }

    @Override // defpackage.mm8
    public final mm8 g(gf4 gf4Var, long j) throws IOException {
        String str = gf4Var.a;
        j();
        JsonWriter jsonWriter = this.b;
        jsonWriter.name(str);
        j();
        jsonWriter.value(j);
        return this;
    }

    public final xd6 h(Object obj) throws IOException {
        JsonWriter jsonWriter = this.b;
        if (obj == null) {
            jsonWriter.nullValue();
            return this;
        }
        if (obj instanceof Number) {
            jsonWriter.value((Number) obj);
            return this;
        }
        int i = 0;
        if (!obj.getClass().isArray()) {
            if (obj instanceof Collection) {
                jsonWriter.beginArray();
                Iterator it2 = ((Collection) obj).iterator();
                while (it2.hasNext()) {
                    h(it2.next());
                }
                jsonWriter.endArray();
                return this;
            }
            if (obj instanceof Map) {
                jsonWriter.beginObject();
                for (Map.Entry entry : ((Map) obj).entrySet()) {
                    Object key = entry.getKey();
                    try {
                        i((String) key, entry.getValue());
                    } catch (ClassCastException e) {
                        throw new EncodingException(String.format("Only String keys are currently supported in maps, got %s of type %s instead.", key, key.getClass()), e);
                    }
                }
                jsonWriter.endObject();
                return this;
            }
            lm8 lm8Var = (lm8) this.c.get(obj.getClass());
            if (lm8Var != null) {
                jsonWriter.beginObject();
                lm8Var.a(obj, this);
                jsonWriter.endObject();
                return this;
            }
            eqe eqeVar = (eqe) this.d.get(obj.getClass());
            if (eqeVar != null) {
                eqeVar.a(obj, this);
                return this;
            }
            if (!(obj instanceof Enum)) {
                jsonWriter.beginObject();
                this.e.a(obj, this);
                jsonWriter.endObject();
                return this;
            }
            if (obj instanceof gm8) {
                int number = ((gm8) obj).getNumber();
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
        if (obj instanceof int[]) {
            int length = ((int[]) obj).length;
            while (i < length) {
                jsonWriter.value(r7[i]);
                i++;
            }
        } else if (obj instanceof long[]) {
            long[] jArr = (long[]) obj;
            int length2 = jArr.length;
            while (i < length2) {
                long j = jArr[i];
                j();
                jsonWriter.value(j);
                i++;
            }
        } else if (obj instanceof double[]) {
            double[] dArr = (double[]) obj;
            int length3 = dArr.length;
            while (i < length3) {
                jsonWriter.value(dArr[i]);
                i++;
            }
        } else if (obj instanceof boolean[]) {
            boolean[] zArr = (boolean[]) obj;
            int length4 = zArr.length;
            while (i < length4) {
                jsonWriter.value(zArr[i]);
                i++;
            }
        } else if (obj instanceof Number[]) {
            Number[] numberArr = (Number[]) obj;
            int length5 = numberArr.length;
            while (i < length5) {
                h(numberArr[i]);
                i++;
            }
        } else {
            Object[] objArr = (Object[]) obj;
            int length6 = objArr.length;
            while (i < length6) {
                h(objArr[i]);
                i++;
            }
        }
        jsonWriter.endArray();
        return this;
    }

    public final xd6 i(String str, Object obj) throws IOException {
        boolean z = this.f;
        JsonWriter jsonWriter = this.b;
        if (z) {
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
        if (this.a) {
            return;
        }
        ygf.f("Parent context used since this context was created. Cannot use this context anymore.");
    }
}
