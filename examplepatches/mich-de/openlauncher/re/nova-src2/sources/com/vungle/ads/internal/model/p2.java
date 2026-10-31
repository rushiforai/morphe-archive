package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class p2 {

    @NotNull
    public static final n2 Companion = new n2();

    /* renamed from: a, reason: collision with root package name */
    public final Integer f47111a;

    public /* synthetic */ p2(int i5, Integer num) {
        if ((i5 & 1) == 0) {
            this.f47111a = null;
        } else {
            this.f47111a = num;
        }
    }

    public static final void a(p2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (!output.shouldEncodeElementDefault(serialDesc, 0) && self.f47111a == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 0, IntSerializer.INSTANCE, self.f47111a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof p2) && Intrinsics.b(this.f47111a, ((p2) obj).f47111a);
    }

    public final int hashCode() {
        Integer num = this.f47111a;
        if (num == null) {
            return 0;
        }
        return num.hashCode();
    }

    public final String toString() {
        return a2.c.o(com.iab.omid.library.vungle.internal.l.a("IABSettings(tcfStatus="), this.f47111a, ')');
    }
}
