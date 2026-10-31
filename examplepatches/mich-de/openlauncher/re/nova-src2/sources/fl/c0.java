package fl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class c0 extends c {

    /* renamed from: a, reason: collision with root package name */
    public final String f55296a;

    /* renamed from: b, reason: collision with root package name */
    public final b0 f55297b;

    public c0(String str, b0 b0Var) {
        this.f55296a = str;
        this.f55297b = b0Var;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55297b != b0.f55285d;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof c0)) {
            return false;
        }
        c0 c0Var = (c0) obj;
        return c0Var.f55296a.equals(this.f55296a) && c0Var.f55297b.equals(this.f55297b);
    }

    public final int hashCode() {
        return Objects.hash(c0.class, this.f55296a, this.f55297b);
    }

    public final String toString() {
        return "LegacyKmsAead Parameters (keyUri: " + this.f55296a + ", variant: " + this.f55297b + ")";
    }
}
