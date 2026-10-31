package in;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.net.InetAddress;

/* loaded from: classes.dex */
public class y0 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() != JsonToken.NULL) {
            return InetAddress.getByName(jsonReader.nextString());
        }
        jsonReader.nextNull();
        return null;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        InetAddress inetAddress = (InetAddress) obj;
        jsonWriter.value(inetAddress == null ? null : inetAddress.getHostAddress());
    }
}
