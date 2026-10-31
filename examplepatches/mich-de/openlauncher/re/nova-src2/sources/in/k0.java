package in;

import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicIntegerArray;

/* loaded from: classes.dex */
public class k0 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        ArrayList arrayList = new ArrayList();
        jsonReader.beginArray();
        while (jsonReader.hasNext()) {
            try {
                arrayList.add(Integer.valueOf(jsonReader.nextInt()));
            } catch (NumberFormatException e3) {
                throw new JsonSyntaxException(e3);
            }
        }
        jsonReader.endArray();
        int size = arrayList.size();
        AtomicIntegerArray atomicIntegerArray = new AtomicIntegerArray(size);
        for (int i5 = 0; i5 < size; i5++) {
            atomicIntegerArray.set(i5, ((Integer) arrayList.get(i5)).intValue());
        }
        return atomicIntegerArray;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        jsonWriter.beginArray();
        int length = ((AtomicIntegerArray) obj).length();
        for (int i5 = 0; i5 < length; i5++) {
            jsonWriter.value(r6.get(i5));
        }
        jsonWriter.endArray();
    }
}
