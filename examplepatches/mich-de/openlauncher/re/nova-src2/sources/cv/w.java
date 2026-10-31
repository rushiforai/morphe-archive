package cv;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final String f48042a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f48043b;

    /* renamed from: c, reason: collision with root package name */
    public final x f48044c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f48045d;

    public w(String lastFour, boolean z11, x xVar, boolean z12) {
        Intrinsics.g(lastFour, "lastFour");
        this.f48042a = lastFour;
        this.f48043b = z11;
        this.f48044c = xVar;
        this.f48045d = z12;
    }

    public static w a(w wVar, x xVar, boolean z11, int i5) {
        String lastFour = wVar.f48042a;
        boolean z12 = wVar.f48043b;
        if ((i5 & 4) != 0) {
            xVar = wVar.f48044c;
        }
        if ((i5 & 8) != 0) {
            z11 = wVar.f48045d;
        }
        wVar.getClass();
        Intrinsics.g(lastFour, "lastFour");
        return new w(lastFour, z12, xVar, z11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return Intrinsics.b(this.f48042a, wVar.f48042a) && this.f48043b == wVar.f48043b && Intrinsics.b(this.f48044c, wVar.f48044c) && this.f48045d == wVar.f48045d;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f48045d) + ((this.f48044c.hashCode() + c9.f(this.f48042a.hashCode() * 31, 31, this.f48043b)) * 31);
    }

    public final String toString() {
        return "CvcRecollectionViewState(lastFour=" + this.f48042a + ", isTestMode=" + this.f48043b + ", cvcState=" + this.f48044c + ", isEnabled=" + this.f48045d + ")";
    }
}
