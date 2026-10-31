package h3;

import android.content.res.Resources;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final Resources.Theme f59036a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59037b;

    public b(Resources.Theme theme, int i5) {
        this.f59036a = theme;
        this.f59037b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f59036a, bVar.f59036a) && this.f59037b == bVar.f59037b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f59037b) + (this.f59036a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Key(theme=");
        sb2.append(this.f59036a);
        sb2.append(", id=");
        return a2.c.m(sb2, this.f59037b, ')');
    }
}
