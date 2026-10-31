package in;

import b.u4;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.Currency;

/* loaded from: classes.dex */
public class a1 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        String strNextString = jsonReader.nextString();
        try {
            return Currency.getInstance(strNextString);
        } catch (IllegalArgumentException e3) {
            StringBuilder sbK = u4.k("Failed parsing '", strNextString, "' as Currency; at path ");
            sbK.append(jsonReader.getPreviousPath());
            throw new JsonSyntaxException(sbK.toString(), e3);
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        jsonWriter.value(((Currency) obj).getCurrencyCode());
    }
}
