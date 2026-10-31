package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class f0 {

    @NotNull
    public static final e0 Companion = new e0();

    /* renamed from: a, reason: collision with root package name */
    public final Boolean f47001a;

    /* renamed from: b, reason: collision with root package name */
    public final Boolean f47002b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f47003c;

    public /* synthetic */ f0(int i5, Boolean bool, Boolean bool2, Integer num) {
        if ((i5 & 1) == 0) {
            this.f47001a = null;
        } else {
            this.f47001a = bool;
        }
        if ((i5 & 2) == 0) {
            this.f47002b = null;
        } else {
            this.f47002b = bool2;
        }
        if ((i5 & 4) == 0) {
            this.f47003c = null;
        } else {
            this.f47003c = num;
        }
    }

    public static final void a(f0 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47001a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, BooleanSerializer.INSTANCE, self.f47001a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47002b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, BooleanSerializer.INSTANCE, self.f47002b);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.f47003c == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, IntSerializer.INSTANCE, self.f47003c);
    }

    public final Boolean b() {
        return this.f47002b;
    }

    public final Integer c() {
        return this.f47003c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f0)) {
            return false;
        }
        f0 f0Var = (f0) obj;
        return Intrinsics.b(this.f47001a, f0Var.f47001a) && Intrinsics.b(this.f47002b, f0Var.f47002b) && Intrinsics.b(this.f47003c, f0Var.f47003c);
    }

    public final int hashCode() {
        Boolean bool = this.f47001a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Boolean bool2 = this.f47002b;
        int iHashCode2 = (iHashCode + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Integer num = this.f47003c;
        return iHashCode2 + (num != null ? num.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("WebViewSettings(allowFileAccessFromFileUrls=");
        sbA.append(this.f47001a);
        sbA.append(", allowUniversalAccessFromFileUrls=");
        sbA.append(this.f47002b);
        sbA.append(", layerType=");
        return a2.c.o(sbA, this.f47003c, ')');
    }

    public final Boolean a() {
        return this.f47001a;
    }
}
