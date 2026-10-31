package k6;

import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f71150a = new LinkedHashMap();

    public abstract Object a(b bVar);

    public final boolean equals(Object obj) {
        if (obj instanceof c) {
            return Intrinsics.b(this.f71150a, ((c) obj).f71150a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f71150a.hashCode();
    }

    public final String toString() {
        return "CreationExtras(extras=" + this.f71150a + ')';
    }
}
