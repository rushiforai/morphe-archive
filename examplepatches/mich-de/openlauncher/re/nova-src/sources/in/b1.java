package in;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;

/* loaded from: classes.dex */
public class b1 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException, NumberFormatException {
        int iNextInt;
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        jsonReader.beginObject();
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        while (jsonReader.peek() != JsonToken.END_OBJECT) {
            String strNextName = jsonReader.nextName();
            iNextInt = jsonReader.nextInt();
            strNextName.getClass();
            switch (strNextName) {
                case "dayOfMonth":
                    i12 = iNextInt;
                    break;
                case "minute":
                    i14 = iNextInt;
                    break;
                case "second":
                    i15 = iNextInt;
                    break;
                case "year":
                    i5 = iNextInt;
                    break;
                case "month":
                    i11 = iNextInt;
                    break;
                case "hourOfDay":
                    i13 = iNextInt;
                    break;
            }
        }
        jsonReader.endObject();
        return new GregorianCalendar(i5, i11, i12, i13, i14, i15);
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        if (((Calendar) obj) == null) {
            jsonWriter.nullValue();
            return;
        }
        jsonWriter.beginObject();
        jsonWriter.name("year");
        jsonWriter.value(r4.get(1));
        jsonWriter.name("month");
        jsonWriter.value(r4.get(2));
        jsonWriter.name("dayOfMonth");
        jsonWriter.value(r4.get(5));
        jsonWriter.name("hourOfDay");
        jsonWriter.value(r4.get(11));
        jsonWriter.name("minute");
        jsonWriter.value(r4.get(12));
        jsonWriter.name("second");
        jsonWriter.value(r4.get(13));
        jsonWriter.endObject();
    }
}
