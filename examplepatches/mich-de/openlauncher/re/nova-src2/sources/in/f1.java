package in;

import b.u4;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.BitSet;

/* loaded from: classes.dex */
public class f1 extends com.google.gson.h0 {
    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException, NumberFormatException {
        BitSet bitSet = new BitSet();
        jsonReader.beginArray();
        JsonToken jsonTokenPeek = jsonReader.peek();
        int i5 = 0;
        while (jsonTokenPeek != JsonToken.END_ARRAY) {
            int i11 = h1.f61703a[jsonTokenPeek.ordinal()];
            boolean zNextBoolean = true;
            if (i11 == 1 || i11 == 2) {
                int iNextInt = jsonReader.nextInt();
                if (iNextInt == 0) {
                    zNextBoolean = false;
                } else if (iNextInt != 1) {
                    StringBuilder sbJ = u4.j(iNextInt, "Invalid bitset value ", ", expected 0 or 1; at path ");
                    sbJ.append(jsonReader.getPreviousPath());
                    throw new JsonSyntaxException(sbJ.toString());
                }
            } else {
                if (i11 != 3) {
                    throw new JsonSyntaxException("Invalid bitset value type: " + jsonTokenPeek + "; at path " + jsonReader.getPath());
                }
                zNextBoolean = jsonReader.nextBoolean();
            }
            if (zNextBoolean) {
                bitSet.set(i5);
            }
            i5++;
            jsonTokenPeek = jsonReader.peek();
        }
        jsonReader.endArray();
        return bitSet;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        BitSet bitSet = (BitSet) obj;
        jsonWriter.beginArray();
        int length = bitSet.length();
        for (int i5 = 0; i5 < length; i5++) {
            jsonWriter.value(bitSet.get(i5) ? 1L : 0L);
        }
        jsonWriter.endArray();
    }
}
