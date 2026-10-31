package in;

import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes.dex */
public final class w extends com.google.gson.h0 {

    /* renamed from: b, reason: collision with root package name */
    public static final d f61768b = new d(new w(com.google.gson.e0.f34779b), 1);

    /* renamed from: a, reason: collision with root package name */
    public final com.google.gson.f0 f61769a;

    public w(com.google.gson.f0 f0Var) {
        this.f61769a = f0Var;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        JsonToken jsonTokenPeek = jsonReader.peek();
        int i5 = v.f61767a[jsonTokenPeek.ordinal()];
        if (i5 == 1) {
            jsonReader.nextNull();
            return null;
        }
        if (i5 == 2 || i5 == 3) {
            return this.f61769a.a(jsonReader);
        }
        throw new JsonSyntaxException("Expecting number, got: " + jsonTokenPeek + "; at path " + jsonReader.getPath());
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        jsonWriter.value((Number) obj);
    }
}
