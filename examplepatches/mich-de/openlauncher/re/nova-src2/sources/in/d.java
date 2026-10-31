package in;

import com.google.gson.Gson;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Calendar;
import java.util.Collection;
import java.util.GregorianCalendar;

/* loaded from: classes.dex */
public final class d implements com.google.gson.i0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61671a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f61672b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f61671a = i5;
        this.f61672b = obj;
    }

    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        switch (this.f61671a) {
            case 0:
                Type type = aVar.f76505b;
                Class cls = aVar.f76504a;
                if (!Collection.class.isAssignableFrom(cls)) {
                    return null;
                }
                Type typeH = hn.h.h(type, cls, Collection.class);
                Class cls2 = typeH instanceof ParameterizedType ? ((ParameterizedType) typeH).getActualTypeArguments()[0] : Object.class;
                return new c(new j0(gson, gson.getAdapter(new mn.a(cls2)), cls2), ((hn.c) this.f61672b).b(aVar, false));
            case 1:
                if (aVar.f76504a == Number.class) {
                    return (w) this.f61672b;
                }
                return null;
            case 2:
                if (aVar.f76504a == Object.class) {
                    return new y(gson, (com.google.gson.f0) this.f61672b);
                }
                return null;
            default:
                Class cls3 = aVar.f76504a;
                if (cls3 == Calendar.class || cls3 == GregorianCalendar.class) {
                    return (b1) this.f61672b;
                }
                return null;
        }
    }

    public String toString() {
        switch (this.f61671a) {
            case 3:
                return "Factory[type=" + Calendar.class.getName() + "+" + GregorianCalendar.class.getName() + ",adapter=" + ((b1) this.f61672b) + "]";
            default:
                return super.toString();
        }
    }
}
