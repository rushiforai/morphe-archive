package in;

import com.google.gson.Gson;

/* loaded from: classes.dex */
public class i implements com.google.gson.i0 {
    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        Class superclass = aVar.f76504a;
        if (!Enum.class.isAssignableFrom(superclass) || superclass == Enum.class) {
            return null;
        }
        if (!superclass.isEnum()) {
            superclass = superclass.getSuperclass();
        }
        return new j(superclass);
    }
}
