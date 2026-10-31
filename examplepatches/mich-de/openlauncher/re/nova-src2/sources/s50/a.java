package s50;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f86676a;

    /* renamed from: b, reason: collision with root package name */
    public final x50.a f86677b;

    public a(String str, x50.a aVar) {
        this.f86676a = str;
        this.f86677b = aVar;
        if (r70.k.U0(str)) {
            throw new IllegalArgumentException("Name can't be blank");
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f86676a, aVar.f86676a) && Intrinsics.b(this.f86677b, aVar.f86677b);
    }

    public final int hashCode() {
        return this.f86677b.hashCode() + (this.f86676a.hashCode() * 31);
    }

    public final String toString() {
        return "AttributeKey: " + this.f86676a;
    }
}
