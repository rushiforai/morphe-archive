package com.google.gson;

import com.google.gson.stream.JsonReader;

/* loaded from: classes.dex */
public enum b0 extends e0 {
    public b0() {
        super("LAZILY_PARSED_NUMBER", 1);
    }

    @Override // com.google.gson.f0
    public final Number a(JsonReader jsonReader) {
        return new hn.k(jsonReader.nextString());
    }
}
