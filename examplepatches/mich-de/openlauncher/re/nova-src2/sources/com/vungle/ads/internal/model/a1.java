package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class a1 {

    @NotNull
    public static final z0 Companion = new z0();

    /* renamed from: a, reason: collision with root package name */
    public final Boolean f46927a;

    public /* synthetic */ a1(int i5, Boolean bool) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, y0.f47198a.getDescriptor());
        }
        this.f46927a = bool;
    }

    public static final void a(a1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeNullableSerializableElement(serialDesc, 0, BooleanSerializer.INSTANCE, self.f46927a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a1) && Intrinsics.b(this.f46927a, ((a1) obj).f46927a);
    }

    public final int hashCode() {
        Boolean bool = this.f46927a;
        if (bool == null) {
            return 0;
        }
        return bool.hashCode();
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("COPPA(isCoppa=");
        sbA.append(this.f46927a);
        sbA.append(')');
        return sbA.toString();
    }

    public a1(Boolean bool) {
        this.f46927a = bool;
    }
}
