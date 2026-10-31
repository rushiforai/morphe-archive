package d1;

import b.c0;
import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final String f48802a;

    /* renamed from: b, reason: collision with root package name */
    public String f48803b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f48804c = false;

    /* renamed from: d, reason: collision with root package name */
    public e f48805d = null;

    public l(String str, String str2) {
        this.f48802a = str;
        this.f48803b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return Intrinsics.b(this.f48802a, lVar.f48802a) && Intrinsics.b(this.f48803b, lVar.f48803b) && this.f48804c == lVar.f48804c && Intrinsics.b(this.f48805d, lVar.f48805d);
    }

    public final int hashCode() {
        int iF = c9.f(c0.e(this.f48802a.hashCode() * 31, 31, this.f48803b), 31, this.f48804c);
        e eVar = this.f48805d;
        return iF + (eVar == null ? 0 : eVar.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TextSubstitution(layoutCache=");
        sb2.append(this.f48805d);
        sb2.append(", isShowingSubstitution=");
        return a2.c.p(sb2, this.f48804c, ')');
    }
}
