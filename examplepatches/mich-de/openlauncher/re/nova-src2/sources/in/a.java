package in;

import com.google.gson.Gson;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

/* loaded from: classes.dex */
public class a implements com.google.gson.i0 {
    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        Type type = aVar.f76505b;
        boolean z11 = type instanceof GenericArrayType;
        if (!z11 && (!(type instanceof Class) || !((Class) type).isArray())) {
            return null;
        }
        Type genericComponentType = z11 ? ((GenericArrayType) type).getGenericComponentType() : ((Class) type).getComponentType();
        return new b(gson, gson.getAdapter(new mn.a(genericComponentType)), hn.h.g(genericComponentType));
    }
}
