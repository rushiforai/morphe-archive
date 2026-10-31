package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class s2 {

    @NotNull
    public static final r2 Companion = new r2();

    /* renamed from: a, reason: collision with root package name */
    public final Integer f47144a;

    /* renamed from: b, reason: collision with root package name */
    public final Boolean f47145b;

    public /* synthetic */ s2(int i5, Integer num, Boolean bool) {
        if ((i5 & 1) == 0) {
            this.f47144a = null;
        } else {
            this.f47144a = num;
        }
        if ((i5 & 2) == 0) {
            this.f47145b = null;
        } else {
            this.f47145b = bool;
        }
    }

    public static final void a(s2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47144a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, IntSerializer.INSTANCE, self.f47144a);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.f47145b == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, BooleanSerializer.INSTANCE, self.f47145b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s2)) {
            return false;
        }
        s2 s2Var = (s2) obj;
        return Intrinsics.b(this.f47144a, s2Var.f47144a) && Intrinsics.b(this.f47145b, s2Var.f47145b);
    }

    public final int hashCode() {
        Integer num = this.f47144a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Boolean bool = this.f47145b;
        return iHashCode + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("LogMetricsSettings(errorLogLevel=");
        sbA.append(this.f47144a);
        sbA.append(", metricsEnabled=");
        sbA.append(this.f47145b);
        sbA.append(')');
        return sbA.toString();
    }
}
