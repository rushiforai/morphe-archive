package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class f {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: a, reason: collision with root package name */
    public final Integer f46999a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f47000b;

    public /* synthetic */ f(int i5, Integer num, Integer num2) {
        if ((i5 & 1) == 0) {
            this.f46999a = 0;
        } else {
            this.f46999a = num;
        }
        if ((i5 & 2) == 0) {
            this.f47000b = 0;
        } else {
            this.f47000b = num2;
        }
    }

    public static final void a(f self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Integer num;
        Integer num2;
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || (num2 = self.f46999a) == null || num2.intValue() != 0) {
            output.encodeNullableSerializableElement(serialDesc, 0, IntSerializer.INSTANCE, self.f46999a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || (num = self.f47000b) == null || num.intValue() != 0) {
            output.encodeNullableSerializableElement(serialDesc, 1, IntSerializer.INSTANCE, self.f47000b);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f46999a, fVar.f46999a) && Intrinsics.b(this.f47000b, fVar.f47000b);
    }

    public final int hashCode() {
        Integer num = this.f46999a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.f47000b;
        return iHashCode + (num2 != null ? num2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("AdSizeInfo(width=");
        sbA.append(this.f46999a);
        sbA.append(", height=");
        return a2.c.o(sbA, this.f47000b, ')');
    }
}
