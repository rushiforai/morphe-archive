package in;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes.dex */
public class m0 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() != JsonToken.NULL) {
            return Float.valueOf((float) jsonReader.nextDouble());
        }
        jsonReader.nextNull();
        return null;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        Number numberValueOf = (Number) obj;
        if (numberValueOf == null) {
            jsonWriter.nullValue();
            return;
        }
        if (!(numberValueOf instanceof Float)) {
            numberValueOf = Float.valueOf(numberValueOf.floatValue());
        }
        jsonWriter.value(numberValueOf);
    }
}
