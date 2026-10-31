package tf;

import gf.x0;
import java.util.Collections;
import java.util.List;
import xk.v0;

/* loaded from: classes3.dex */
public final class s implements fe.e {

    /* renamed from: a, reason: collision with root package name */
    public final x0 f89127a;

    /* renamed from: b, reason: collision with root package name */
    public final v0 f89128b;

    public s(x0 x0Var, List list) {
        if (!list.isEmpty() && (((Integer) Collections.min(list)).intValue() < 0 || ((Integer) Collections.max(list)).intValue() >= x0Var.f57655a)) {
            throw new IndexOutOfBoundsException();
        }
        this.f89127a = x0Var;
        this.f89128b = v0.o(list);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && s.class == obj.getClass()) {
            s sVar = (s) obj;
            if (this.f89127a.equals(sVar.f89127a) && this.f89128b.equals(sVar.f89128b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (this.f89128b.hashCode() * 31) + this.f89127a.hashCode();
    }
}
