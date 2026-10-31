package x8;

import b.c9;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: b, reason: collision with root package name */
    public static final s f95374b = new s(b70.h.f17594a);

    /* renamed from: a, reason: collision with root package name */
    public final Map f95375a;

    public s(Map map) {
        this.f95375a = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof s) {
            return Intrinsics.b(this.f95375a, ((s) obj).f95375a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f95375a.hashCode();
    }

    public final String toString() {
        return c9.l(new StringBuilder("Tags(tags="), this.f95375a, ')');
    }
}
