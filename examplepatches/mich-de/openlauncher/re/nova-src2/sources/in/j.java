package in;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;

/* loaded from: classes.dex */
public final class j extends com.google.gson.h0 {

    /* renamed from: d, reason: collision with root package name */
    public static final i f61712d = new i();

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f61713a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f61714b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f61715c = new HashMap();

    public j(Class cls) throws SecurityException {
        try {
            Field[] declaredFields = cls.getDeclaredFields();
            int i5 = 0;
            for (Field field : declaredFields) {
                if (field.isEnumConstant()) {
                    declaredFields[i5] = field;
                    i5++;
                }
            }
            Field[] fieldArr = (Field[]) Arrays.copyOf(declaredFields, i5);
            AccessibleObject.setAccessible(fieldArr, true);
            for (Field field2 : fieldArr) {
                Enum r42 = (Enum) field2.get(null);
                String strName = r42.name();
                String string = r42.toString();
                gn.c cVar = (gn.c) field2.getAnnotation(gn.c.class);
                if (cVar != null) {
                    strName = cVar.value();
                    for (String str : cVar.alternate()) {
                        this.f61713a.put(str, r42);
                    }
                }
                this.f61713a.put(strName, r42);
                this.f61714b.put(string, r42);
                this.f61715c.put(r42, strName);
            }
        } catch (IllegalAccessException e3) {
            throw new AssertionError(e3);
        }
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (jsonReader.peek() == JsonToken.NULL) {
            jsonReader.nextNull();
            return null;
        }
        String strNextString = jsonReader.nextString();
        Enum r02 = (Enum) this.f61713a.get(strNextString);
        return r02 == null ? (Enum) this.f61714b.get(strNextString) : r02;
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        Enum r32 = (Enum) obj;
        jsonWriter.value(r32 == null ? null : (String) this.f61715c.get(r32));
    }
}
