package ke;

import b.c0;

/* loaded from: classes3.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final t f71430a;

    /* renamed from: b, reason: collision with root package name */
    public final t f71431b;

    public r(t tVar, t tVar2) {
        this.f71430a = tVar;
        this.f71431b = tVar2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && r.class == obj.getClass()) {
            r rVar = (r) obj;
            if (this.f71430a.equals(rVar.f71430a) && this.f71431b.equals(rVar.f71431b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f71431b.hashCode() + (this.f71430a.hashCode() * 31);
    }

    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder("[");
        t tVar = this.f71430a;
        sb2.append(tVar);
        t tVar2 = this.f71431b;
        if (tVar.equals(tVar2)) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            str = ", " + tVar2;
        }
        return c0.q(sb2, str, "]");
    }
}
