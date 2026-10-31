package com.google.gson;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

/* loaded from: classes.dex */
public abstract class h0 {
    public final g0 a() {
        return !(this instanceof g0) ? new g0(this) : (g0) this;
    }

    public abstract Object b(JsonReader jsonReader);

    public abstract void c(JsonWriter jsonWriter, Object obj);
}
