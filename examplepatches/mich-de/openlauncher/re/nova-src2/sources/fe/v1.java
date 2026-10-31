package fe;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class v1 extends q1 {

    /* renamed from: b, reason: collision with root package name */
    public final boolean f55033b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f55034c;

    public v1() {
        this.f55033b = false;
        this.f55034c = false;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof v1)) {
            return false;
        }
        v1 v1Var = (v1) obj;
        return this.f55034c == v1Var.f55034c && this.f55033b == v1Var.f55033b;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Boolean.valueOf(this.f55033b), Boolean.valueOf(this.f55034c)});
    }

    public v1(boolean z11) {
        this.f55033b = true;
        this.f55034c = z11;
    }
}
