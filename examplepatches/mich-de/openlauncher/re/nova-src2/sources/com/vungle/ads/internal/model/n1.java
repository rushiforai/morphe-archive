package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class n1 {

    @NotNull
    public static final m1 Companion = new m1();

    /* renamed from: a, reason: collision with root package name */
    public final String f47097a;

    /* renamed from: b, reason: collision with root package name */
    public String f47098b;

    /* renamed from: c, reason: collision with root package name */
    public final Long f47099c;

    public /* synthetic */ n1(int i5, String str, String str2, Long l9) {
        if ((i5 & 1) == 0) {
            this.f47097a = null;
        } else {
            this.f47097a = str;
        }
        if ((i5 & 2) == 0) {
            this.f47098b = null;
        } else {
            this.f47098b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f47099c = null;
        } else {
            this.f47099c = l9;
        }
    }

    public static final void a(n1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47097a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47097a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47098b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f47098b);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.f47099c == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, LongSerializer.INSTANCE, self.f47099c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n1)) {
            return false;
        }
        n1 n1Var = (n1) obj;
        return Intrinsics.b(this.f47097a, n1Var.f47097a) && Intrinsics.b(this.f47098b, n1Var.f47098b) && Intrinsics.b(this.f47099c, n1Var.f47099c);
    }

    public final int hashCode() {
        String str = this.f47097a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f47098b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l9 = this.f47099c;
        return iHashCode2 + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("RequestExt(configExtension=");
        sbA.append(this.f47097a);
        sbA.append(", signals=");
        sbA.append(this.f47098b);
        sbA.append(", configLastValidatedTimestamp=");
        sbA.append(this.f47099c);
        sbA.append(')');
        return sbA.toString();
    }

    public n1(String str, String str2, Long l9) {
        this.f47097a = str;
        this.f47098b = str2;
        this.f47099c = l9;
    }
}
