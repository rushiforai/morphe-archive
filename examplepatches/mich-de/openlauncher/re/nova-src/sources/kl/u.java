package kl;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class u {

    /* renamed from: b, reason: collision with root package name */
    public static final u f71638b = new u(Collections.unmodifiableMap(new HashMap()));

    /* renamed from: a, reason: collision with root package name */
    public final Map f71639a;

    public u(Map map) {
        this.f71639a = map;
    }

    public final boolean a() {
        return this.f71639a.isEmpty();
    }

    public final boolean equals(Object obj) {
        if (obj instanceof u) {
            return this.f71639a.equals(((u) obj).f71639a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f71639a.hashCode();
    }

    public final String toString() {
        return this.f71639a.toString();
    }
}
