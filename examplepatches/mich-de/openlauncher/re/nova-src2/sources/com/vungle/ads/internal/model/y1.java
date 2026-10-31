package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class y1 {

    @NotNull
    public static final x1 Companion = new x1();

    /* renamed from: a, reason: collision with root package name */
    public final Boolean f47200a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f47201b;

    public /* synthetic */ y1(int i5, Boolean bool, Long l9) {
        this.f47200a = (i5 & 1) == 0 ? Boolean.FALSE : bool;
        if ((i5 & 2) == 0) {
            this.f47201b = Long.MAX_VALUE;
        } else {
            this.f47201b = l9;
        }
    }

    public static final void a(y1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Long l9;
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || !Intrinsics.b(self.f47200a, Boolean.FALSE)) {
            output.encodeNullableSerializableElement(serialDesc, 0, BooleanSerializer.INSTANCE, self.f47200a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || (l9 = self.f47201b) == null || l9.longValue() != Long.MAX_VALUE) {
            output.encodeNullableSerializableElement(serialDesc, 1, LongSerializer.INSTANCE, self.f47201b);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y1)) {
            return false;
        }
        y1 y1Var = (y1) obj;
        return Intrinsics.b(this.f47200a, y1Var.f47200a) && Intrinsics.b(this.f47201b, y1Var.f47201b);
    }

    public final int hashCode() {
        Boolean bool = this.f47200a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Long l9 = this.f47201b;
        return iHashCode + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("AutoRedirect(allowAutoRedirect=");
        sbA.append(this.f47200a);
        sbA.append(", afterClickDuration=");
        sbA.append(this.f47201b);
        sbA.append(')');
        return sbA.toString();
    }
}
