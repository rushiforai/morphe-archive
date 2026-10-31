package ln;

import com.google.gson.h0;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.sql.Timestamp;
import java.util.Date;

/* loaded from: classes.dex */
public final class d extends h0 {

    /* renamed from: b, reason: collision with root package name */
    public static final c f75057b = new c();

    /* renamed from: a, reason: collision with root package name */
    public final h0 f75058a;

    public d(h0 h0Var) {
        this.f75058a = h0Var;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) {
        Date date = (Date) this.f75058a.b(jsonReader);
        if (date != null) {
            return new Timestamp(date.getTime());
        }
        return null;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) {
        this.f75058a.c(jsonWriter, (Timestamp) obj);
    }
}
