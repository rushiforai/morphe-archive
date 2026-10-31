package in;

import com.google.gson.JsonIOException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public class x0 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        try {
            String strNextString = jsonReader.nextString();
            if (strNextString.equals(AbstractJsonLexerKt.NULL)) {
                return null;
            }
            return new URI(strNextString);
        } catch (URISyntaxException e3) {
            throw new JsonIOException(e3);
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        URI uri = (URI) obj;
        jsonWriter.value(uri == null ? null : uri.toASCIIString());
    }
}
