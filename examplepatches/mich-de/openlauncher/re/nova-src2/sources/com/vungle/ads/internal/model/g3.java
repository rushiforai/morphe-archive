package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g3 {

    @NotNull
    public static final f3 Companion = new f3();

    /* renamed from: a, reason: collision with root package name */
    public final String f47012a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47013b;

    /* renamed from: c, reason: collision with root package name */
    public final String f47014c;

    public /* synthetic */ g3(int i5, String str, String str2, String str3) {
        if ((i5 & 1) == 0) {
            this.f47012a = null;
        } else {
            this.f47012a = str;
        }
        if ((i5 & 2) == 0) {
            this.f47013b = null;
        } else {
            this.f47013b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f47014c = null;
        } else {
            this.f47014c = str3;
        }
    }

    public static final void a(g3 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47012a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47012a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47013b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f47013b);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.f47014c == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.f47014c);
    }

    public final String b() {
        return this.f47013b;
    }

    public final String c() {
        return this.f47014c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g3)) {
            return false;
        }
        g3 g3Var = (g3) obj;
        return Intrinsics.b(this.f47012a, g3Var.f47012a) && Intrinsics.b(this.f47013b, g3Var.f47013b) && Intrinsics.b(this.f47014c, g3Var.f47014c);
    }

    public final int hashCode() {
        String str = this.f47012a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f47013b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f47014c;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("OmSdkData(params=");
        sbA.append(this.f47012a);
        sbA.append(", vendorKey=");
        sbA.append(this.f47013b);
        sbA.append(", vendorURL=");
        return h6.c1.t(sbA, this.f47014c, ')');
    }

    public final String a() {
        return this.f47012a;
    }
}
