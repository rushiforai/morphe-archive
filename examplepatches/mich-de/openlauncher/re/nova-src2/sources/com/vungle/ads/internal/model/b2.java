package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b2 {

    @NotNull
    public static final a2 Companion = new a2();

    /* renamed from: a, reason: collision with root package name */
    public final Long f46943a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f46944b;

    public /* synthetic */ b2(int i5, Long l9, Integer num) {
        this.f46943a = (i5 & 1) == 0 ? 1000L : l9;
        if ((i5 & 2) == 0) {
            this.f46944b = 3;
        } else {
            this.f46944b = num;
        }
    }

    public static final void a(b2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Integer num;
        Long l9;
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || (l9 = self.f46943a) == null || l9.longValue() != 1000) {
            output.encodeNullableSerializableElement(serialDesc, 0, LongSerializer.INSTANCE, self.f46943a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || (num = self.f46944b) == null || num.intValue() != 3) {
            output.encodeNullableSerializableElement(serialDesc, 1, IntSerializer.INSTANCE, self.f46944b);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b2)) {
            return false;
        }
        b2 b2Var = (b2) obj;
        return Intrinsics.b(this.f46943a, b2Var.f46943a) && Intrinsics.b(this.f46944b, b2Var.f46944b);
    }

    public final int hashCode() {
        Long l9 = this.f46943a;
        int iHashCode = (l9 == null ? 0 : l9.hashCode()) * 31;
        Integer num = this.f46944b;
        return iHashCode + (num != null ? num.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("CleverCache(diskSize=");
        sbA.append(this.f46943a);
        sbA.append(", diskPercentage=");
        return a2.c.o(sbA, this.f46944b, ')');
    }
}
