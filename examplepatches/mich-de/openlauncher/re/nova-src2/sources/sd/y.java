package sd;

import android.util.JsonReader;
import android.util.JsonToken;
import java.io.BufferedReader;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final long f87233a;

    public y(long j11) {
        this.f87233a = j11;
    }

    public static y a(BufferedReader bufferedReader) throws IOException {
        JsonReader jsonReader = new JsonReader(bufferedReader);
        try {
            jsonReader.beginObject();
            while (jsonReader.hasNext()) {
                if (jsonReader.nextName().equals("nextRequestWaitMillis")) {
                    return jsonReader.peek() == JsonToken.STRING ? new y(Long.parseLong(jsonReader.nextString())) : new y(jsonReader.nextLong());
                }
                jsonReader.skipValue();
            }
            throw new IOException("Response is missing nextRequestWaitMillis field.");
        } finally {
            jsonReader.close();
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        return (obj instanceof y) && this.f87233a == ((y) obj).f87233a;
    }

    public final int hashCode() {
        long j11 = this.f87233a;
        return ((int) ((j11 >>> 32) ^ j11)) ^ 1000003;
    }

    public final String toString() {
        return a2.c.i(this.f87233a, "}", new StringBuilder("LogResponse{nextRequestWaitMillis="));
    }
}
