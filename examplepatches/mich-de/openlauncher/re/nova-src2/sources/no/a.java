package no;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f78368a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78369b;

    public a(String str, String str2) {
        this.f78368a = str;
        this.f78369b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f78368a, aVar.f78368a) && Intrinsics.b(this.f78369b, aVar.f78369b);
    }

    public final int hashCode() {
        return this.f78369b.hashCode() + (this.f78368a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppInfo(packageName=");
        sb2.append(this.f78368a);
        sb2.append(", label=");
        return c1.t(sb2, this.f78369b, ')');
    }
}
