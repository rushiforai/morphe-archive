package x1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public int f94956a = 0;

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IntRef(element = ");
        sb2.append(this.f94956a);
        sb2.append(")@");
        int iHashCode = hashCode();
        kotlin.text.a.a(16);
        String string = Integer.toString(iHashCode, 16);
        Intrinsics.f(string, "toString(...)");
        sb2.append(string);
        return sb2.toString();
    }
}
