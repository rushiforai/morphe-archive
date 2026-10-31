package in;

import com.google.gson.Gson;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Map;
import java.util.Properties;

/* loaded from: classes.dex */
public final class u implements com.google.gson.i0 {

    /* renamed from: a, reason: collision with root package name */
    public final hn.c f61765a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f61766b;

    public u(hn.c cVar, boolean z11) {
        this.f61765a = cVar;
        this.f61766b = z11;
    }

    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        Type[] actualTypeArguments;
        Type type = aVar.f76505b;
        Class cls = aVar.f76504a;
        if (!Map.class.isAssignableFrom(cls)) {
            return null;
        }
        if (Properties.class.isAssignableFrom(cls)) {
            actualTypeArguments = new Type[]{String.class, String.class};
        } else {
            Type typeH = hn.h.h(type, cls, Map.class);
            actualTypeArguments = typeH instanceof ParameterizedType ? ((ParameterizedType) typeH).getActualTypeArguments() : new Type[]{Object.class, Object.class};
        }
        Type type2 = actualTypeArguments[0];
        Type type3 = actualTypeArguments[1];
        return new t(this, new j0(gson, (type2 == Boolean.TYPE || type2 == Boolean.class) ? p1.f61728c : gson.getAdapter(new mn.a(type2)), type2), new j0(gson, gson.getAdapter(new mn.a(type3)), type3), this.f61765a.b(aVar, false));
    }
}
