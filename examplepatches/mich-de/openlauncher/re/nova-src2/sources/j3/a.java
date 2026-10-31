package j3;

import kotlin.Function;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f68764a;

    /* renamed from: b, reason: collision with root package name */
    public final Function f68765b;

    public a(String str, Function function) {
        this.f68764a = str;
        this.f68765b = function;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f68764a, aVar.f68764a) && Intrinsics.b(this.f68765b, aVar.f68765b);
    }

    public final int hashCode() {
        String str = this.f68764a;
        int iHashCode = (str != null ? str.hashCode() : 0) * 31;
        Function function = this.f68765b;
        return iHashCode + (function != null ? function.hashCode() : 0);
    }

    public final String toString() {
        return "AccessibilityAction(label=" + this.f68764a + ", action=" + this.f68765b + ')';
    }
}
