package kl;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.ArrayDeque;

/* loaded from: classes3.dex */
public final class h extends com.google.gson.h0 {
    private h() {
    }

    public static com.google.gson.p e(JsonReader jsonReader, JsonToken jsonToken) throws IOException {
        int i5 = g.f71596a[jsonToken.ordinal()];
        if (i5 == 3) {
            String strNextString = jsonReader.nextString();
            if (j.a(strNextString)) {
                return new com.google.gson.s(strNextString);
            }
            throw new IOException("illegal characters in string");
        }
        if (i5 == 4) {
            return new com.google.gson.s(new i(jsonReader.nextString()));
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

    public static com.google.gson.p f(JsonReader jsonReader, JsonToken jsonToken) throws IOException {
        int i5 = g.f71596a[jsonToken.ordinal()];
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
    public final void c(JsonWriter jsonWriter, Object obj) {
        throw new UnsupportedOperationException("write is not supported");
    }

    @Override // com.google.gson.h0
    /* renamed from: d, reason: merged with bridge method [inline-methods] */
    public final com.google.gson.p b(JsonReader jsonReader) throws IOException {
        String strNextName;
        JsonToken jsonTokenPeek = jsonReader.peek();
        com.google.gson.p pVarF = f(jsonReader, jsonTokenPeek);
        if (pVarF == null) {
            return e(jsonReader, jsonTokenPeek);
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        while (true) {
            if (jsonReader.hasNext()) {
                if (pVarF instanceof com.google.gson.r) {
                    strNextName = jsonReader.nextName();
                    if (!j.a(strNextName)) {
                        throw new IOException("illegal characters in string");
                    }
                } else {
                    strNextName = null;
                }
                JsonToken jsonTokenPeek2 = jsonReader.peek();
                com.google.gson.p pVarF2 = f(jsonReader, jsonTokenPeek2);
                boolean z11 = pVarF2 != null;
                if (pVarF2 == null) {
                    pVarF2 = e(jsonReader, jsonTokenPeek2);
                }
                if (pVarF instanceof com.google.gson.m) {
                    ((com.google.gson.m) pVarF).p(pVarF2);
                } else {
                    com.google.gson.r rVar = (com.google.gson.r) pVarF;
                    if (rVar.f34795a.containsKey(strNextName)) {
                        throw new IOException(b.c0.k("duplicate key: ", strNextName));
                    }
                    rVar.p(strNextName, pVarF2);
                }
                if (z11) {
                    arrayDeque.addLast(pVarF);
                    if (arrayDeque.size() > 100) {
                        throw new IOException("too many recursions");
                    }
                    pVarF = pVarF2;
                } else {
                    continue;
                }
            } else {
                if (pVarF instanceof com.google.gson.m) {
                    jsonReader.endArray();
                } else {
                    jsonReader.endObject();
                }
                if (arrayDeque.isEmpty()) {
                    return pVarF;
                }
                pVarF = (com.google.gson.p) arrayDeque.removeLast();
            }
        }
    }

    public /* synthetic */ h(int i5) {
        this();
    }
}
