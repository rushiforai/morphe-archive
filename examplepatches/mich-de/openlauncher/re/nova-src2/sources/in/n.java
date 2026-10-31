package in;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.Iterator;

/* loaded from: classes.dex */
public class n extends com.google.gson.h0 {

    /* renamed from: a, reason: collision with root package name */
    public static final n f61724a = new n();

    private n() {
    }

    public static com.google.gson.p d(JsonReader jsonReader, JsonToken jsonToken) throws IOException {
        int i5 = m.f61723a[jsonToken.ordinal()];
        if (i5 == 3) {
            return new com.google.gson.s(jsonReader.nextString());
        }
        if (i5 == 4) {
            return new com.google.gson.s(new hn.k(jsonReader.nextString()));
        }
        if (i5 == 5) {
            return new com.google.gson.s(Boolean.valueOf(jsonReader.nextBoolean()));
        }
        if (i5 == 6) {
            jsonReader.nextNull();
            return com.google.gson.q.f34794a;
        }
        throw new IllegalStateException("Unexpected token: " + jsonToken);
    }

    public static com.google.gson.p e(JsonReader jsonReader, JsonToken jsonToken) throws IOException {
        int i5 = m.f61723a[jsonToken.ordinal()];
        if (i5 == 1) {
            jsonReader.beginArray();
            return new com.google.gson.m();
        }
        if (i5 != 2) {
            return null;
        }
        jsonReader.beginObject();
        return new com.google.gson.r();
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader instanceof q) {
            q qVar = (q) jsonReader;
            JsonToken jsonTokenPeek = qVar.peek();
            if (jsonTokenPeek != JsonToken.NAME && jsonTokenPeek != JsonToken.END_ARRAY && jsonTokenPeek != JsonToken.END_OBJECT && jsonTokenPeek != JsonToken.END_DOCUMENT) {
                com.google.gson.p pVar = (com.google.gson.p) qVar.d();
                qVar.skipValue();
                return pVar;
            }
            throw new IllegalStateException("Unexpected " + jsonTokenPeek + " when reading a JsonElement.");
        }
        JsonToken jsonTokenPeek2 = jsonReader.peek();
        com.google.gson.p pVarE = e(jsonReader, jsonTokenPeek2);
        if (pVarE == null) {
            return d(jsonReader, jsonTokenPeek2);
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        while (true) {
            if (jsonReader.hasNext()) {
                String strNextName = pVarE instanceof com.google.gson.r ? jsonReader.nextName() : null;
                JsonToken jsonTokenPeek3 = jsonReader.peek();
                com.google.gson.p pVarE2 = e(jsonReader, jsonTokenPeek3);
                boolean z11 = pVarE2 != null;
                if (pVarE2 == null) {
                    pVarE2 = d(jsonReader, jsonTokenPeek3);
                }
                if (pVarE instanceof com.google.gson.m) {
                    ((com.google.gson.m) pVarE).p(pVarE2);
                } else {
                    ((com.google.gson.r) pVarE).p(strNextName, pVarE2);
                }
                if (z11) {
                    arrayDeque.addLast(pVarE);
                    pVarE = pVarE2;
                }
            } else {
                if (pVarE instanceof com.google.gson.m) {
                    jsonReader.endArray();
                } else {
                    jsonReader.endObject();
                }
                if (arrayDeque.isEmpty()) {
                    return pVarE;
                }
                pVarE = (com.google.gson.p) arrayDeque.removeLast();
            }
        }
    }

    @Override // com.google.gson.h0
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public final void c(com.google.gson.p pVar, JsonWriter jsonWriter) throws IOException {
        if (pVar == null || (pVar instanceof com.google.gson.q)) {
            jsonWriter.nullValue();
            return;
        }
        if (pVar instanceof com.google.gson.s) {
            com.google.gson.s sVarK = pVar.k();
            Serializable serializable = sVarK.f34796a;
            if (serializable instanceof Number) {
                jsonWriter.value(sVarK.n());
                return;
            } else if (serializable instanceof Boolean) {
                jsonWriter.value(sVarK.d());
                return;
            } else {
                jsonWriter.value(sVarK.o());
                return;
            }
        }
        if (pVar instanceof com.google.gson.m) {
            jsonWriter.beginArray();
            Iterator it = pVar.h().f34793a.iterator();
            while (it.hasNext()) {
                c((com.google.gson.p) it.next(), jsonWriter);
            }
            jsonWriter.endArray();
            return;
        }
        if (!(pVar instanceof com.google.gson.r)) {
            throw new IllegalArgumentException("Couldn't write " + pVar.getClass());
        }
        jsonWriter.beginObject();
        Iterator it2 = ((hn.m) pVar.j().f34795a.entrySet()).iterator();
        while (((hn.l) it2).hasNext()) {
            hn.n nVarB = ((hn.l) it2).b();
            jsonWriter.name((String) nVarB.getKey());
            c((com.google.gson.p) nVarB.getValue(), jsonWriter);
        }
        jsonWriter.endObject();
    }
}
