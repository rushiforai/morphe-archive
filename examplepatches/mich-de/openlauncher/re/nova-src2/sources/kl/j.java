package kl;

import com.google.gson.stream.JsonReader;
import java.io.IOException;
import java.io.StringReader;

/* loaded from: classes3.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final h f71602a = new h(0);

    public static boolean a(String str) {
        int length = str.length();
        int i5 = 0;
        while (i5 != length) {
            char cCharAt = str.charAt(i5);
            int i11 = i5 + 1;
            if (!Character.isSurrogate(cCharAt)) {
                i5 = i11;
            } else {
                if (Character.isLowSurrogate(cCharAt) || i11 == length || !Character.isLowSurrogate(str.charAt(i11))) {
                    return false;
                }
                i5 += 2;
            }
        }
        return true;
    }

    public static com.google.gson.p b(String str) throws IOException {
        try {
            JsonReader jsonReader = new JsonReader(new StringReader(str));
            jsonReader.setLenient(false);
            return f71602a.b(jsonReader);
        } catch (NumberFormatException e3) {
            throw new IOException(e3);
        }
    }
}
