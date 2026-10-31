package h6;

import java.lang.reflect.Method;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final int f59354a;

    /* renamed from: b, reason: collision with root package name */
    public final Method f59355b;

    public e(Method method, int i5) throws SecurityException {
        this.f59354a = i5;
        this.f59355b = method;
        method.setAccessible(true);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f59354a == eVar.f59354a && this.f59355b.getName().equals(eVar.f59355b.getName());
    }

    public final int hashCode() {
        return this.f59355b.getName().hashCode() + (this.f59354a * 31);
    }
}
