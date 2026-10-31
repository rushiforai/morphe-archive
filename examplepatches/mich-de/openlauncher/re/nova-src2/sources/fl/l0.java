package fl;

import java.security.GeneralSecurityException;
import java.util.Objects;

/* loaded from: classes.dex */
public final class l0 extends c {

    /* renamed from: a, reason: collision with root package name */
    public final j f55377a;

    /* renamed from: b, reason: collision with root package name */
    public final int f55378b;

    public l0(int i5, j jVar) {
        this.f55377a = jVar;
        this.f55378b = i5;
    }

    public static l0 b(int i5, j jVar) throws GeneralSecurityException {
        if (i5 < 8 || i5 > 12) {
            throw new GeneralSecurityException("Salt size must be between 8 and 12 bytes");
        }
        return new l0(i5, jVar);
    }

    @Override // el.g
    public final boolean a() {
        return this.f55377a != j.f55355x;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof l0)) {
            return false;
        }
        l0 l0Var = (l0) obj;
        return l0Var.f55377a == this.f55377a && l0Var.f55378b == this.f55378b;
    }

    public final int hashCode() {
        return Objects.hash(l0.class, this.f55377a, Integer.valueOf(this.f55378b));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("X-AES-GCM Parameters (variant: ");
        sb2.append(this.f55377a);
        sb2.append("salt_size_bytes: ");
        return b.c0.o(sb2, this.f55378b, ")");
    }
}
