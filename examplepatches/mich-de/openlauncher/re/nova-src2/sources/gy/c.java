package gy;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: d, reason: collision with root package name */
    public static final c f58247d = new c(0.25f, true, false);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f58248a;

    /* renamed from: b, reason: collision with root package name */
    public final float f58249b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f58250c;

    public /* synthetic */ c(float f11, int i5, boolean z11, boolean z12) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, a.f58213a.getDescriptor());
        }
        this.f58248a = z11;
        this.f58249b = f11;
        this.f58250c = z12;
    }

    public static c a(c cVar, boolean z11, float f11, boolean z12, int i5) {
        if ((i5 & 1) != 0) {
            z11 = cVar.f58248a;
        }
        if ((i5 & 2) != 0) {
            f11 = cVar.f58249b;
        }
        if ((i5 & 4) != 0) {
            z12 = cVar.f58250c;
        }
        cVar.getClass();
        return new c(f11, z11, z12);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f58248a == cVar.f58248a && Float.compare(this.f58249b, cVar.f58249b) == 0 && this.f58250c == cVar.f58250c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f58250c) + a80.m.d(this.f58249b, Boolean.hashCode(this.f58248a) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ComposableSearchBarConfig(enabled=");
        sb2.append(this.f58248a);
        sb2.append(", cornerRadiusPercentage=");
        sb2.append(this.f58249b);
        sb2.append(", shadow=");
        return a80.m.k(sb2, this.f58250c, ")");
    }

    public c(float f11, boolean z11, boolean z12) {
        this.f58248a = z11;
        this.f58249b = f11;
        this.f58250c = z12;
    }
}
