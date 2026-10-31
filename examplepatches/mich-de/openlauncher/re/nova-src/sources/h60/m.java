package h60;

import b.c0;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final String f59488a;

    public m(String str) {
        this.f59488a = str;
    }

    public final Object a(h hVar) {
        Object obj = hVar.f59486a.get(this);
        if (obj != null) {
            return obj;
        }
        throw new NullPointerException(this.f59488a);
    }

    public final void b(h hVar, Object obj) {
        HashMap map = hVar.f59486a;
        if (obj == null) {
            map.remove(this);
        } else {
            map.put(this, obj);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || m.class != obj.getClass()) {
            return false;
        }
        return this.f59488a.equals(((m) obj).f59488a);
    }

    public final int hashCode() {
        return this.f59488a.hashCode();
    }

    public final String toString() {
        return c0.q(new StringBuilder("Prop{name='"), this.f59488a, "'}");
    }
}
