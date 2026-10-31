package in;

import b.u4;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class t extends com.google.gson.h0 {

    /* renamed from: a, reason: collision with root package name */
    public final j0 f61761a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f61762b;

    /* renamed from: c, reason: collision with root package name */
    public final hn.p f61763c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ u f61764d;

    public t(u uVar, j0 j0Var, j0 j0Var2, hn.p pVar) {
        this.f61764d = uVar;
        this.f61761a = j0Var;
        this.f61762b = j0Var2;
        this.f61763c = pVar;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        JsonToken jsonTokenPeek = jsonReader.peek();
        if (jsonTokenPeek == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        Map map = (Map) this.f61763c.a();
        if (jsonTokenPeek != JsonToken.BEGIN_ARRAY) {
            jsonReader.beginObject();
            while (jsonReader.hasNext()) {
                hn.j.INSTANCE.promoteNameToValue(jsonReader);
                Object objB = this.f61761a.f61717b.b(jsonReader);
                if (map.put(objB, this.f61762b.f61717b.b(jsonReader)) != null) {
                    throw new JsonSyntaxException(u4.h(objB, "duplicate key: "));
                }
            }
            jsonReader.endObject();
            return map;
        }
        jsonReader.beginArray();
        while (jsonReader.hasNext()) {
            jsonReader.beginArray();
            Object objB2 = this.f61761a.f61717b.b(jsonReader);
            if (map.put(objB2, this.f61762b.f61717b.b(jsonReader)) != null) {
                throw new JsonSyntaxException(u4.h(objB2, "duplicate key: "));
            }
            jsonReader.endArray();
        }
        jsonReader.endArray();
        return map;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        String strO;
        Map map = (Map) obj;
        if (map == null) {
            jsonWriter.nullValue();
            return;
        }
        boolean z11 = this.f61764d.f61766b;
        j0 j0Var = this.f61762b;
        if (!z11) {
            jsonWriter.beginObject();
            for (Map.Entry entry : map.entrySet()) {
                jsonWriter.name(String.valueOf(entry.getKey()));
                j0Var.c(jsonWriter, entry.getValue());
            }
            jsonWriter.endObject();
            return;
        }
        ArrayList arrayList = new ArrayList(map.size());
        ArrayList arrayList2 = new ArrayList(map.size());
        int i5 = 0;
        boolean z12 = false;
        for (Map.Entry entry2 : map.entrySet()) {
            j0 j0Var2 = this.f61761a;
            Object key = entry2.getKey();
            try {
                s sVar = new s();
                j0Var2.c(sVar, key);
                com.google.gson.p pVarA = sVar.a();
                arrayList.add(pVarA);
                arrayList2.add(entry2.getValue());
                pVarA.getClass();
                z12 |= (pVarA instanceof com.google.gson.m) || (pVarA instanceof com.google.gson.r);
            } catch (IOException e3) {
                throw new JsonIOException(e3);
            }
        }
        if (z12) {
            jsonWriter.beginArray();
            int size = arrayList.size();
            while (i5 < size) {
                jsonWriter.beginArray();
                com.google.gson.p pVar = (com.google.gson.p) arrayList.get(i5);
                n nVar = p1.B;
                nVar.getClass();
                nVar.c(pVar, jsonWriter);
                j0Var.c(jsonWriter, arrayList2.get(i5));
                jsonWriter.endArray();
                i5++;
            }
            jsonWriter.endArray();
            return;
        }
        jsonWriter.beginObject();
        int size2 = arrayList.size();
        while (i5 < size2) {
            com.google.gson.p pVar2 = (com.google.gson.p) arrayList.get(i5);
            pVar2.getClass();
            if (pVar2 instanceof com.google.gson.s) {
                com.google.gson.s sVarK = pVar2.k();
                Serializable serializable = sVarK.f34796a;
                if (serializable instanceof Number) {
                    strO = String.valueOf(sVarK.n());
                } else if (serializable instanceof Boolean) {
                    strO = Boolean.toString(sVarK.d());
                } else {
                    if (!(serializable instanceof String)) {
                        throw new AssertionError();
                    }
                    strO = sVarK.o();
                }
            } else {
                if (!(pVar2 instanceof com.google.gson.q)) {
                    throw new AssertionError();
                }
                strO = AbstractJsonLexerKt.NULL;
            }
            jsonWriter.name(strO);
            j0Var.c(jsonWriter, arrayList2.get(i5));
            i5++;
        }
        jsonWriter.endObject();
    }
}
