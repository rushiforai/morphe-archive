package in;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class y extends com.google.gson.h0 {

    /* renamed from: c, reason: collision with root package name */
    public static final d f61771c = new d(com.google.gson.e0.f34778a, 2);

    /* renamed from: a, reason: collision with root package name */
    public final Gson f61772a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.gson.f0 f61773b;

    public y(Gson gson, com.google.gson.f0 f0Var) {
        this.f61772a = gson;
        this.f61773b = f0Var;
    }

    public static Serializable e(JsonReader jsonReader, JsonToken jsonToken) throws IOException {
        int i5 = x.f61770a[jsonToken.ordinal()];
        if (i5 == 1) {
            jsonReader.beginArray();
            return new ArrayList();
        }
        if (i5 != 2) {
            return null;
        }
        jsonReader.beginObject();
        return new hn.o(true);
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        JsonToken jsonTokenPeek = jsonReader.peek();
        Object objE = e(jsonReader, jsonTokenPeek);
        if (objE == null) {
            return d(jsonReader, jsonTokenPeek);
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        while (true) {
            if (jsonReader.hasNext()) {
                String strNextName = objE instanceof Map ? jsonReader.nextName() : null;
                JsonToken jsonTokenPeek2 = jsonReader.peek();
                Serializable serializableE = e(jsonReader, jsonTokenPeek2);
                boolean z11 = serializableE != null;
                if (serializableE == null) {
                    serializableE = d(jsonReader, jsonTokenPeek2);
                }
                if (objE instanceof List) {
                    ((List) objE).add(serializableE);
                } else {
                    ((Map) objE).put(strNextName, serializableE);
                }
                if (z11) {
                    arrayDeque.addLast(objE);
                    objE = serializableE;
                }
            } else {
                if (objE instanceof List) {
                    jsonReader.endArray();
                } else {
                    jsonReader.endObject();
                }
                if (arrayDeque.isEmpty()) {
                    return objE;
                }
                objE = arrayDeque.removeLast();
            }
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        if (obj == null) {
            jsonWriter.nullValue();
            return;
        }
        com.google.gson.h0 adapter = this.f61772a.getAdapter(obj.getClass());
        if (!(adapter instanceof y)) {
            adapter.c(jsonWriter, obj);
        } else {
            jsonWriter.beginObject();
            jsonWriter.endObject();
        }
    }

    public final Serializable d(JsonReader jsonReader, JsonToken jsonToken) throws IOException {
        int i5 = x.f61770a[jsonToken.ordinal()];
        if (i5 == 3) {
            return jsonReader.nextString();
        }
        if (i5 == 4) {
            return this.f61773b.a(jsonReader);
        }
        if (i5 == 5) {
            return Boolean.valueOf(jsonReader.nextBoolean());
        }
        if (i5 == 6) {
            jsonReader.nextNull();
            return null;
        }
        throw new IllegalStateException("Unexpected token: " + jsonToken);
    }
}
