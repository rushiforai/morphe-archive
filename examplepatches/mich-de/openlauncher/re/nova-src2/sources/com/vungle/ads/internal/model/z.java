package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class z {

    @NotNull
    public static final y Companion = new y();

    /* renamed from: a, reason: collision with root package name */
    public final c0 f47202a;

    public /* synthetic */ z(int i5, c0 c0Var) {
        if ((i5 & 1) == 0) {
            this.f47202a = null;
        } else {
            this.f47202a = c0Var;
        }
    }

    public static final void a(z self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (!output.shouldEncodeElementDefault(serialDesc, 0) && self.f47202a == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 0, a0.f46925a, self.f47202a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof z) && Intrinsics.b(this.f47202a, ((z) obj).f47202a);
    }

    public final int hashCode() {
        c0 c0Var = this.f47202a;
        if (c0Var == null) {
            return 0;
        }
        return c0Var.hashCode();
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("ViewAbility(om=");
        sbA.append(this.f47202a);
        sbA.append(')');
        return sbA.toString();
    }
}
