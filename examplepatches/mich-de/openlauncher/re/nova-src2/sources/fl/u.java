package fl;

import java.util.Objects;
import kl.q0;

/* loaded from: classes.dex */
public final class u extends c {

    /* renamed from: a, reason: collision with root package name */
    public final int f55420a;

    /* renamed from: b, reason: collision with root package name */
    public final j f55421b;

    public u(int i5, j jVar) {
        this.f55420a = i5;
        this.f55421b = jVar;
    }

    public static q0 b() {
        q0 q0Var = new q0();
        q0Var.f71629a = null;
        q0Var.f71630b = j.f55350s;
        return q0Var;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55421b != j.f55350s;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return uVar.f55420a == this.f55420a && uVar.f55421b == this.f55421b;
    }

    public final int hashCode() {
        return Objects.hash(u.class, Integer.valueOf(this.f55420a), this.f55421b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AesGcmSiv Parameters (variant: ");
        sb2.append(this.f55421b);
        sb2.append(", ");
        return b.c0.o(sb2, this.f55420a, "-byte key)");
    }
}
