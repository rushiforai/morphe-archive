package in;

import b.u4;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes.dex */
public class o0 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        String strNextString = jsonReader.nextString();
        if (strNextString.length() == 1) {
            return Character.valueOf(strNextString.charAt(0));
        }
        StringBuilder sbK = u4.k("Expecting character, got: ", strNextString, "; at ");
        sbK.append(jsonReader.getPreviousPath());
        throw new JsonSyntaxException(sbK.toString());
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        Character ch = (Character) obj;
        jsonWriter.value(ch == null ? null : String.valueOf(ch));
    }
}
