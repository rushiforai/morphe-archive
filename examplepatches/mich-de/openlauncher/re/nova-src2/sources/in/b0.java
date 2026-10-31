package in;

import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class b0 extends com.google.gson.h0 {

    /* renamed from: a, reason: collision with root package name */
    public final d0 f61666a;

    public b0(d0 d0Var) {
        this.f61666a = d0Var;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        Object objD = d();
        Map map = this.f61666a.f61674a;
        try {
            jsonReader.beginObject();
            while (jsonReader.hasNext()) {
                a0 a0Var = (a0) map.get(jsonReader.nextName());
                if (a0Var == null) {
                    jsonReader.skipValue();
                } else {
                    f(objD, jsonReader, a0Var);
                }
            }
            jsonReader.endObject();
            return e(objD);
        } catch (IllegalAccessException e3) {
            ul.b bVar = kn.c.f71660a;
            throw new RuntimeException("Unexpected IllegalAccessException occurred (Gson 2.13.2). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e3);
        } catch (IllegalStateException e11) {
            throw new JsonSyntaxException(e11);
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException, IllegalArgumentException, InvocationTargetException {
        if (obj == null) {
            jsonWriter.nullValue();
            return;
        }
        jsonWriter.beginObject();
        try {
            Iterator it = this.f61666a.f61675b.iterator();
            while (it.hasNext()) {
                ((a0) it.next()).a(jsonWriter, obj);
            }
            jsonWriter.endObject();
        } catch (IllegalAccessException e3) {
            ul.b bVar = kn.c.f71660a;
            throw new RuntimeException("Unexpected IllegalAccessException occurred (Gson 2.13.2). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e3);
        }
    }

    public abstract Object d();

    public abstract Object e(Object obj);

    public abstract void f(Object obj, JsonReader jsonReader, a0 a0Var);
}
