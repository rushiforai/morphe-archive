package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c0 {

    @NotNull
    public static final b0 Companion = new b0();

    /* renamed from: a, reason: collision with root package name */
    public final Boolean f46968a;

    /* renamed from: b, reason: collision with root package name */
    public final String f46969b;

    public /* synthetic */ c0(int i5, Boolean bool, String str) {
        if ((i5 & 1) == 0) {
            this.f46968a = null;
        } else {
            this.f46968a = bool;
        }
        if ((i5 & 2) == 0) {
            this.f46969b = null;
        } else {
            this.f46969b = str;
        }
    }

    public static final void a(c0 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f46968a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, BooleanSerializer.INSTANCE, self.f46968a);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.f46969b == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f46969b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c0)) {
            return false;
        }
        c0 c0Var = (c0) obj;
        return Intrinsics.b(this.f46968a, c0Var.f46968a) && Intrinsics.b(this.f46969b, c0Var.f46969b);
    }

    public final int hashCode() {
        Boolean bool = this.f46968a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        String str = this.f46969b;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("ViewAbilityInfo(isEnabled=");
        sbA.append(this.f46968a);
        sbA.append(", extraVast=");
        return h6.c1.t(sbA, this.f46969b, ')');
    }
}
