package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class u0 {

    @NotNull
    public static final t0 Companion = new t0();

    /* renamed from: a, reason: collision with root package name */
    public final int f47157a;

    /* renamed from: b, reason: collision with root package name */
    public final int f47158b;

    public u0(int i5, int i11) {
        this.f47157a = i5;
        this.f47158b = i11;
    }

    public static final void a(u0 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeIntElement(serialDesc, 0, self.f47157a);
        output.encodeIntElement(serialDesc, 1, self.f47158b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return this.f47157a == u0Var.f47157a && this.f47158b == u0Var.f47158b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f47158b) + (Integer.hashCode(this.f47157a) * 31);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("AdSizeParam(width=");
        sbA.append(this.f47157a);
        sbA.append(", height=");
        return a2.c.m(sbA, this.f47158b, ')');
    }

    public /* synthetic */ u0(int i5, int i11, int i12) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, s0.f47142a.getDescriptor());
        }
        this.f47157a = i11;
        this.f47158b = i12;
    }
}
