package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class v2 {

    @NotNull
    public static final u2 Companion = new u2();

    /* renamed from: a, reason: collision with root package name */
    public final l2 f47170a;

    /* renamed from: b, reason: collision with root package name */
    public final p2 f47171b;

    public /* synthetic */ v2(int i5, l2 l2Var, p2 p2Var) {
        if ((i5 & 1) == 0) {
            this.f47170a = null;
        } else {
            this.f47170a = l2Var;
        }
        if ((i5 & 2) == 0) {
            this.f47171b = null;
        } else {
            this.f47171b = p2Var;
        }
    }

    public static final void a(v2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47170a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, j2.f47066a, self.f47170a);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.f47171b == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, m2.f47092a, self.f47171b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v2)) {
            return false;
        }
        v2 v2Var = (v2) obj;
        return Intrinsics.b(this.f47170a, v2Var.f47170a) && Intrinsics.b(this.f47171b, v2Var.f47171b);
    }

    public final int hashCode() {
        l2 l2Var = this.f47170a;
        int iHashCode = (l2Var == null ? 0 : l2Var.hashCode()) * 31;
        p2 p2Var = this.f47171b;
        return iHashCode + (p2Var != null ? p2Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("UserPrivacy(gdpr=");
        sbA.append(this.f47170a);
        sbA.append(", iab=");
        sbA.append(this.f47171b);
        sbA.append(')');
        return sbA.toString();
    }
}
