package ln;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.h0;
import com.google.gson.i0;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/* loaded from: classes.dex */
public final class b extends h0 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f75055b = new a();

    /* renamed from: a, reason: collision with root package name */
    public final SimpleDateFormat f75056a;

    public class a implements i0 {
        @Override // com.google.gson.i0
        public final h0 a(Gson gson, mn.a aVar) {
            if (aVar.f76504a == Time.class) {
                return new b(0);
            }
            return null;
        }
    }

    public /* synthetic */ b(int i5) {
        this();
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        Time time;
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        String strNextString = jsonReader.nextString();
        synchronized (this) {
            TimeZone timeZone = this.f75056a.getTimeZone();
            try {
                try {
                    time = new Time(this.f75056a.parse(strNextString).getTime());
                } catch (ParseException e3) {
                    throw new JsonSyntaxException("Failed parsing '" + strNextString + "' as SQL Time; at path " + jsonReader.getPreviousPath(), e3);
                }
            } finally {
                this.f75056a.setTimeZone(timeZone);
            }
        }
        return time;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        String str;
        Time time = (Time) obj;
        if (time == null) {
            jsonWriter.nullValue();
            return;
        }
        synchronized (this) {
            str = this.f75056a.format((Date) time);
        }
        jsonWriter.value(str);
    }

    private b() {
        this.f75056a = new SimpleDateFormat("hh:mm:ss a");
    }
}
