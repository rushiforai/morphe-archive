package mh;

import java.io.Serializable;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class d implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Object f76327a;

    public d(Object obj) {
        this.f76327a = obj;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof d) {
            return a.h(this.f76327a, ((d) obj).f76327a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f76327a});
    }

    public final String toString() {
        return b.c0.l("Suppliers.ofInstance(", this.f76327a.toString(), ")");
    }
}
