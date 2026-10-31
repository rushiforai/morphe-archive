package vk;

import java.io.Serializable;

/* loaded from: classes.dex */
public final class y implements u, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Object f92839a;

    public y(Object obj) {
        this.f92839a = obj;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof y) {
            return ps.v.q(this.f92839a, ((y) obj).f92839a);
        }
        return false;
    }

    @Override // vk.u
    public final Object get() {
        return this.f92839a;
    }

    public final int hashCode() {
        return ps.v.t(this.f92839a);
    }

    public final String toString() {
        return "Suppliers.ofInstance(" + this.f92839a + ")";
    }
}
