package in;

import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class c extends com.google.gson.h0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61667a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Object f61668b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f61669c;

    public c(j0 j0Var, hn.p pVar) {
        this.f61668b = j0Var;
        this.f61669c = pVar;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        switch (this.f61667a) {
            case 0:
                if (jsonReader.peek() == JsonToken.NULL) {
                    jsonReader.nextNull();
                    return null;
                }
                Collection collection = (Collection) ((hn.p) this.f61669c).a();
                jsonReader.beginArray();
                while (jsonReader.hasNext()) {
                    collection.add(((j0) this.f61668b).f61717b.b(jsonReader));
                }
                jsonReader.endArray();
                return collection;
            default:
                Class cls = (Class) this.f61668b;
                Object objB = ((e1) this.f61669c).f61684c.b(jsonReader);
                if (objB == null || cls.isInstance(objB)) {
                    return objB;
                }
                throw new JsonSyntaxException("Expected a " + cls.getName() + " but was " + objB.getClass().getName() + "; at path " + jsonReader.getPreviousPath());
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        switch (this.f61667a) {
            case 0:
                Collection collection = (Collection) obj;
                if (collection != null) {
                    jsonWriter.beginArray();
                    Iterator it = collection.iterator();
                    while (it.hasNext()) {
                        ((j0) this.f61668b).c(jsonWriter, it.next());
                    }
                    jsonWriter.endArray();
                    break;
                } else {
                    jsonWriter.nullValue();
                    break;
                }
            default:
                ((e1) this.f61669c).f61684c.c(jsonWriter, obj);
                break;
        }
    }

    public c(e1 e1Var, Class cls) {
        this.f61669c = e1Var;
        this.f61668b = cls;
    }
}
