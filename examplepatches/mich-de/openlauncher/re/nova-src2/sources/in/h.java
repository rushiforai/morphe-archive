package in;

import b.u4;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Objects;
import java.util.TimeZone;

/* loaded from: classes.dex */
public final class h extends com.google.gson.h0 {

    /* renamed from: c, reason: collision with root package name */
    public static final e f61695c = new e();

    /* renamed from: a, reason: collision with root package name */
    public final g f61696a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f61697b;

    public h(g gVar, int i5, int i11) {
        ArrayList arrayList = new ArrayList();
        this.f61697b = arrayList;
        Objects.requireNonNull(gVar);
        this.f61696a = gVar;
        Locale locale = Locale.US;
        arrayList.add(DateFormat.getDateTimeInstance(i5, i11, locale));
        if (!Locale.getDefault().equals(locale)) {
            arrayList.add(DateFormat.getDateTimeInstance(i5, i11));
        }
        if (hn.i.a()) {
            arrayList.add(ex.i.C(i5, i11));
        }
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        Date dateB;
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        String strNextString = jsonReader.nextString();
        synchronized (this.f61697b) {
            try {
                Iterator it = this.f61697b.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        try {
                            dateB = jn.a.b(strNextString, new ParsePosition(0));
                            break;
                        } catch (ParseException e3) {
                            StringBuilder sbK = u4.k("Failed parsing '", strNextString, "' as Date; at path ");
                            sbK.append(jsonReader.getPreviousPath());
                            throw new JsonSyntaxException(sbK.toString(), e3);
                        }
                    }
                    DateFormat dateFormat = (DateFormat) it.next();
                    TimeZone timeZone = dateFormat.getTimeZone();
                    try {
                        try {
                            dateB = dateFormat.parse(strNextString);
                            break;
                        } finally {
                            dateFormat.setTimeZone(timeZone);
                        }
                    } catch (ParseException unused) {
                        dateFormat.setTimeZone(timeZone);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return this.f61696a.a(dateB);
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        String str;
        Date date = (Date) obj;
        if (date == null) {
            jsonWriter.nullValue();
            return;
        }
        DateFormat dateFormat = (DateFormat) this.f61697b.get(0);
        synchronized (this.f61697b) {
            str = dateFormat.format(date);
        }
        jsonWriter.value(str);
    }

    public final String toString() {
        DateFormat dateFormat = (DateFormat) this.f61697b.get(0);
        if (dateFormat instanceof SimpleDateFormat) {
            return "DefaultDateTypeAdapter(" + ((SimpleDateFormat) dateFormat).toPattern() + ')';
        }
        return "DefaultDateTypeAdapter(" + dateFormat.getClass().getSimpleName() + ')';
    }

    public h(g gVar, String str) {
        ArrayList arrayList = new ArrayList();
        this.f61697b = arrayList;
        Objects.requireNonNull(gVar);
        this.f61696a = gVar;
        Locale locale = Locale.US;
        arrayList.add(new SimpleDateFormat(str, locale));
        if (Locale.getDefault().equals(locale)) {
            return;
        }
        arrayList.add(new SimpleDateFormat(str));
    }
}
