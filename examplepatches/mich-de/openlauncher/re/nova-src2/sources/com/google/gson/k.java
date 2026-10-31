package com.google.gson;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes.dex */
public final class k extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34790a;

    public /* synthetic */ k(int i5) {
        this.f34790a = i5;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        switch (this.f34790a) {
            case 0:
                if (jsonReader.peek() != JsonToken.NULL) {
                    return Double.valueOf(jsonReader.nextDouble());
                }
                jsonReader.nextNull();
                return null;
            default:
                if (jsonReader.peek() != JsonToken.NULL) {
                    return Float.valueOf((float) jsonReader.nextDouble());
                }
                jsonReader.nextNull();
                return null;
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        switch (this.f34790a) {
            case 0:
                Number number = (Number) obj;
                if (number != null) {
                    double dDoubleValue = number.doubleValue();
                    Gson.checkValidFloatingPoint(dDoubleValue);
                    jsonWriter.value(dDoubleValue);
                    break;
                } else {
                    jsonWriter.nullValue();
                    break;
                }
            default:
                Number numberValueOf = (Number) obj;
                if (numberValueOf != null) {
                    float fFloatValue = numberValueOf.floatValue();
                    Gson.checkValidFloatingPoint(fFloatValue);
                    if (!(numberValueOf instanceof Float)) {
                        numberValueOf = Float.valueOf(fFloatValue);
                    }
                    jsonWriter.value(numberValueOf);
                    break;
                } else {
                    jsonWriter.nullValue();
                    break;
                }
        }
    }
}
