package in;

import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public class n1 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) {
        try {
            return new AtomicInteger(jsonReader.nextInt());
        } catch (NumberFormatException e3) {
            throw new JsonSyntaxException(e3);
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        jsonWriter.value(((AtomicInteger) obj).get());
    }
}
