package eb0;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes5.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final Class f52642a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f52643b;

    /* renamed from: c, reason: collision with root package name */
    public final Method f52644c;

    /* renamed from: d, reason: collision with root package name */
    public final List f52645d;

    public s(Class cls, Object obj, Method method, ArrayList arrayList) {
        this.f52642a = cls;
        this.f52643b = obj;
        this.f52644c = method;
        this.f52645d = Collections.unmodifiableList(arrayList);
    }

    public final String toString() {
        return String.format("%s.%s() %s", this.f52642a.getName(), this.f52644c.getName(), this.f52645d);
    }
}
