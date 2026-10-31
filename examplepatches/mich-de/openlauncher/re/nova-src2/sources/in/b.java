package in;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

/* loaded from: classes.dex */
public final class b extends com.google.gson.h0 {

    /* renamed from: c, reason: collision with root package name */
    public static final a f61663c = new a();

    /* renamed from: a, reason: collision with root package name */
    public final Class f61664a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f61665b;

    public b(Gson gson, com.google.gson.h0 h0Var, Class cls) {
        this.f61665b = new j0(gson, h0Var, cls);
        this.f61664a = cls;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException, ArrayIndexOutOfBoundsException, IllegalArgumentException, NegativeArraySizeException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        ArrayList arrayList = new ArrayList();
        jsonReader.beginArray();
        while (jsonReader.hasNext()) {
            arrayList.add(this.f61665b.f61717b.b(jsonReader));
        }
        jsonReader.endArray();
        int size = arrayList.size();
        Class cls = this.f61664a;
        if (!cls.isPrimitive()) {
            return arrayList.toArray((Object[]) Array.newInstance((Class<?>) cls, size));
        }
        Object objNewInstance = Array.newInstance((Class<?>) cls, size);
        for (int i5 = 0; i5 < size; i5++) {
            Array.set(objNewInstance, i5, arrayList.get(i5));
        }
        return objNewInstance;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException, ArrayIndexOutOfBoundsException, IllegalArgumentException {
        if (obj == null) {
            jsonWriter.nullValue();
            return;
        }
        jsonWriter.beginArray();
        int length = Array.getLength(obj);
        for (int i5 = 0; i5 < length; i5++) {
            this.f61665b.c(jsonWriter, Array.get(obj, i5));
        }
        jsonWriter.endArray();
    }
}
