package in;

import b.u4;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.math.BigDecimal;

/* loaded from: classes.dex */
public class q0 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        String strNextString = jsonReader.nextString();
        try {
            return hn.h.j(strNextString);
        } catch (NumberFormatException e3) {
            StringBuilder sbK = u4.k("Failed parsing '", strNextString, "' as BigDecimal; at path ");
            sbK.append(jsonReader.getPreviousPath());
            throw new JsonSyntaxException(sbK.toString(), e3);
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        jsonWriter.value((BigDecimal) obj);
    }
}
