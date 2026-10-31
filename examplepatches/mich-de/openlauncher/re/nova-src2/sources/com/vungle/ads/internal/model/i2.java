package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class i2 {

    @NotNull
    public static final h2 Companion = new h2();

    /* renamed from: a, reason: collision with root package name */
    public final String f47057a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47058b;

    /* renamed from: c, reason: collision with root package name */
    public final String f47059c;

    /* renamed from: d, reason: collision with root package name */
    public final String f47060d;

    /* renamed from: e, reason: collision with root package name */
    public final String f47061e;

    public /* synthetic */ i2(int i5, String str, String str2, String str3, String str4, String str5) {
        if ((i5 & 1) == 0) {
            this.f47057a = null;
        } else {
            this.f47057a = str;
        }
        if ((i5 & 2) == 0) {
            this.f47058b = null;
        } else {
            this.f47058b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f47059c = null;
        } else {
            this.f47059c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f47060d = null;
        } else {
            this.f47060d = str4;
        }
        if ((i5 & 16) == 0) {
            this.f47061e = null;
        } else {
            this.f47061e = str5;
        }
    }

    public static final void a(i2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47057a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47057a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47058b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f47058b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47059c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.f47059c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47060d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.f47060d);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.f47061e == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.f47061e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i2)) {
            return false;
        }
        i2 i2Var = (i2) obj;
        return Intrinsics.b(this.f47057a, i2Var.f47057a) && Intrinsics.b(this.f47058b, i2Var.f47058b) && Intrinsics.b(this.f47059c, i2Var.f47059c) && Intrinsics.b(this.f47060d, i2Var.f47060d) && Intrinsics.b(this.f47061e, i2Var.f47061e);
    }

    public final int hashCode() {
        String str = this.f47057a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f47058b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f47059c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f47060d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f47061e;
        return iHashCode4 + (str5 != null ? str5.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Endpoints(adsEndpoint=");
        sbA.append(this.f47057a);
        sbA.append(", riEndpoint=");
        sbA.append(this.f47058b);
        sbA.append(", errorLogsEndpoint=");
        sbA.append(this.f47059c);
        sbA.append(", metricsEndpoint=");
        sbA.append(this.f47060d);
        sbA.append(", csbEndpoint=");
        return h6.c1.t(sbA, this.f47061e, ')');
    }
}
