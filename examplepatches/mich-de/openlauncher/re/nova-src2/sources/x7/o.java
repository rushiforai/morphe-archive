package x7;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public String f95153a;

    /* renamed from: b, reason: collision with root package name */
    public int f95154b;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Intrinsics.b(this.f95153a, oVar.f95153a) && this.f95154b == oVar.f95154b;
    }

    public final int hashCode() {
        return c0.F(this.f95154b) + (this.f95153a.hashCode() * 31);
    }

    public final String toString() {
        return "IdAndState(id=" + this.f95153a + ", state=" + fq.c.A(this.f95154b) + ')';
    }
}
