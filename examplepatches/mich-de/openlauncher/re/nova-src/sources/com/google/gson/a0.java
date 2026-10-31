package com.google.gson;

import com.google.gson.stream.JsonReader;

/* loaded from: classes.dex */
public enum a0 extends e0 {
    public a0() {
        super("DOUBLE", 0);
    }

    @Override // com.google.gson.f0
    public final Number a(JsonReader jsonReader) {
        return Double.valueOf(jsonReader.nextDouble());
    }
}
