package gi;

import bh.k;
import java.util.Arrays;
import sg.w;

/* loaded from: classes3.dex */
public final class d implements qg.b {

    /* renamed from: a, reason: collision with root package name */
    public final int f57681a;

    public d(k kVar) {
        this.f57681a = kVar.f17909a;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof d) || !w.k(Integer.valueOf(this.f57681a), Integer.valueOf(((d) obj).f57681a)) || !w.k(1, 1) || !w.k(null, null)) {
            return false;
        }
        Boolean bool = Boolean.TRUE;
        return w.k(bool, bool);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f57681a), 1, null, Boolean.TRUE});
    }
}
