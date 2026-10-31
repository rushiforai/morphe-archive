package b10;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final String f16661a;

    /* renamed from: b, reason: collision with root package name */
    public final String f16662b;

    /* renamed from: c, reason: collision with root package name */
    public final List f16663c;

    public f(String str, String str2, List list) {
        this.f16661a = str;
        this.f16662b = str2;
        this.f16663c = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f16661a, fVar.f16661a) && Intrinsics.b(this.f16662b, fVar.f16662b) && Intrinsics.b(this.f16663c, fVar.f16663c);
    }

    public final int hashCode() {
        return this.f16663c.hashCode() + b.c0.e(this.f16661a.hashCode() * 31, 31, this.f16662b);
    }

    public final String toString() {
        return a80.m.j(b.c0.w("DebugField(key=", this.f16661a, ", label=", this.f16662b, ", presets="), this.f16663c, ")");
    }
}
