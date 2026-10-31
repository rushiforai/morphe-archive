package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class f2 {

    @NotNull
    public static final e2 Companion = new e2();

    /* renamed from: a, reason: collision with root package name */
    public final Long f47006a;

    public /* synthetic */ f2(int i5, Long l9) {
        if ((i5 & 1) == 0) {
            this.f47006a = null;
        } else {
            this.f47006a = l9;
        }
    }

    public static final void a(f2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (!output.shouldEncodeElementDefault(serialDesc, 0) && self.f47006a == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 0, LongSerializer.INSTANCE, self.f47006a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f2) && Intrinsics.b(this.f47006a, ((f2) obj).f47006a);
    }

    public final int hashCode() {
        Long l9 = this.f47006a;
        if (l9 == null) {
            return 0;
        }
        return l9.hashCode();
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("ConfigSettings(refreshTime=");
        sbA.append(this.f47006a);
        sbA.append(')');
        return sbA.toString();
    }

    public final Long a() {
        return this.f47006a;
    }
}
