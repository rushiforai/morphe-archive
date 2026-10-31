package ya;

import java.util.Objects;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f97124a;

    /* renamed from: b, reason: collision with root package name */
    public final int f97125b;

    public f(int i5, int i11) {
        this.f97124a = Math.min(i5, i11);
        this.f97125b = Math.max(i5, i11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && f.class == obj.getClass()) {
            f fVar = (f) obj;
            if (this.f97124a == fVar.f97124a && this.f97125b == fVar.f97125b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(Integer.valueOf(this.f97124a), Integer.valueOf(this.f97125b));
    }
}
