package fe;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class l0 extends q1 {

    /* renamed from: b, reason: collision with root package name */
    public final boolean f54906b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f54907c;

    public l0() {
        this.f54906b = false;
        this.f54907c = false;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof l0)) {
            return false;
        }
        l0 l0Var = (l0) obj;
        return this.f54907c == l0Var.f54907c && this.f54906b == l0Var.f54906b;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Boolean.valueOf(this.f54906b), Boolean.valueOf(this.f54907c)});
    }

    public l0(boolean z11) {
        this.f54906b = true;
        this.f54907c = z11;
    }
}
