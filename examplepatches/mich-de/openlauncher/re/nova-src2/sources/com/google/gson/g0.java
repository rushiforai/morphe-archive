package com.google.gson;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes.dex */
public final class g0 extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h0 f34781a;

    public g0(h0 h0Var) {
        this.f34781a = h0Var;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() != JsonToken.NULL) {
            return this.f34781a.b(jsonReader);
        }
        jsonReader.nextNull();
        return null;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        if (obj == null) {
            jsonWriter.nullValue();
        } else {
            this.f34781a.c(jsonWriter, obj);
        }
    }

    public final String toString() {
        return "NullSafeTypeAdapter[" + this.f34781a + "]";
    }
}
