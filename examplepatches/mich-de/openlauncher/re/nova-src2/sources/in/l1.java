package in;

import b.u4;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes.dex */
public class l1 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        try {
            int iNextInt = jsonReader.nextInt();
            if (iNextInt <= 65535 && iNextInt >= -32768) {
                return Short.valueOf((short) iNextInt);
            }
            StringBuilder sbJ = u4.j(iNextInt, "Lossy conversion from ", " to short; at path ");
            sbJ.append(jsonReader.getPreviousPath());
            throw new JsonSyntaxException(sbJ.toString());
        } catch (NumberFormatException e3) {
            throw new JsonSyntaxException(e3);
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        if (((Number) obj) == null) {
            jsonWriter.nullValue();
        } else {
            jsonWriter.value(r4.shortValue());
        }
    }
}
