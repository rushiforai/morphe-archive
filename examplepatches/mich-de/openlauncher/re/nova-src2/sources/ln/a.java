package ln;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.h0;
import com.google.gson.i0;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

/* loaded from: classes.dex */
public final class a extends h0 {

    /* renamed from: b, reason: collision with root package name */
    public static final C0357a f75053b = new C0357a();

    /* renamed from: a, reason: collision with root package name */
    public final SimpleDateFormat f75054a;

    /* renamed from: ln.a$a, reason: collision with other inner class name */
    public class C0357a implements i0 {
        @Override // com.google.gson.i0
        public final h0 a(Gson gson, mn.a aVar) {
            if (aVar.f76504a == Date.class) {
                return new a(0);
            }
            return null;
        }
    }

    public /* synthetic */ a(int i5) {
        this();
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        Date date;
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        String strNextString = jsonReader.nextString();
        synchronized (this) {
            TimeZone timeZone = this.f75054a.getTimeZone();
            try {
                try {
                    date = new Date(this.f75054a.parse(strNextString).getTime());
                } catch (ParseException e3) {
                    throw new JsonSyntaxException("Failed parsing '" + strNextString + "' as SQL Date; at path " + jsonReader.getPreviousPath(), e3);
                }
            } finally {
                this.f75054a.setTimeZone(timeZone);
            }
        }
        return date;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        String str;
        Date date = (Date) obj;
        if (date == null) {
            jsonWriter.nullValue();
            return;
        }
        synchronized (this) {
            str = this.f75054a.format((java.util.Date) date);
        }
        jsonWriter.value(str);
    }

    private a() {
        this.f75054a = new SimpleDateFormat("MMM d, yyyy");
    }
}
