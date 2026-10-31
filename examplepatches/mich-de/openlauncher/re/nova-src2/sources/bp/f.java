package bp;

import java.util.Objects;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: b, reason: collision with root package name */
    public static final f f18384b = new f("unspecified");

    /* renamed from: c, reason: collision with root package name */
    public static final f f18385c = new f("compromised");

    /* renamed from: d, reason: collision with root package name */
    public static final f f18386d = new f("superseded");

    /* renamed from: a, reason: collision with root package name */
    public final String f18387a;

    public f(String str) {
        Objects.requireNonNull(str);
        this.f18387a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof f) {
            return Objects.equals(this.f18387a, ((f) obj).f18387a);
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hashCode(this.f18387a);
    }

    public final String toString() {
        return this.f18387a;
    }
}
