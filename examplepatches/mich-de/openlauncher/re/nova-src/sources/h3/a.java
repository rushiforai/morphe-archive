package h3;

import kotlin.jvm.internal.Intrinsics;
import o2.g;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final g f59034a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59035b;

    public a(g gVar, int i5) {
        this.f59034a = gVar;
        this.f59035b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f59034a, aVar.f59034a) && this.f59035b == aVar.f59035b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f59035b) + (this.f59034a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ImageVectorEntry(imageVector=");
        sb2.append(this.f59034a);
        sb2.append(", configFlags=");
        return a2.c.m(sb2, this.f59035b, ')');
    }
}
