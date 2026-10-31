package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class l2 {

    @NotNull
    public static final k2 Companion = new k2();

    /* renamed from: a, reason: collision with root package name */
    public final Boolean f47081a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47082b;

    /* renamed from: c, reason: collision with root package name */
    public final String f47083c;

    /* renamed from: d, reason: collision with root package name */
    public final String f47084d;

    /* renamed from: e, reason: collision with root package name */
    public final String f47085e;

    /* renamed from: f, reason: collision with root package name */
    public final String f47086f;

    public /* synthetic */ l2(int i5, Boolean bool, String str, String str2, String str3, String str4, String str5) {
        if ((i5 & 1) == 0) {
            this.f47081a = null;
        } else {
            this.f47081a = bool;
        }
        if ((i5 & 2) == 0) {
            this.f47082b = null;
        } else {
            this.f47082b = str;
        }
        if ((i5 & 4) == 0) {
            this.f47083c = null;
        } else {
            this.f47083c = str2;
        }
        if ((i5 & 8) == 0) {
            this.f47084d = null;
        } else {
            this.f47084d = str3;
        }
        if ((i5 & 16) == 0) {
            this.f47085e = null;
        } else {
            this.f47085e = str4;
        }
        if ((i5 & 32) == 0) {
            this.f47086f = null;
        } else {
            this.f47086f = str5;
        }
    }

    public static final void a(l2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47081a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, BooleanSerializer.INSTANCE, self.f47081a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47082b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f47082b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47083c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.f47083c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47084d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.f47084d);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.f47085e != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.f47085e);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 5) && self.f47086f == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.f47086f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l2)) {
            return false;
        }
        l2 l2Var = (l2) obj;
        return Intrinsics.b(this.f47081a, l2Var.f47081a) && Intrinsics.b(this.f47082b, l2Var.f47082b) && Intrinsics.b(this.f47083c, l2Var.f47083c) && Intrinsics.b(this.f47084d, l2Var.f47084d) && Intrinsics.b(this.f47085e, l2Var.f47085e) && Intrinsics.b(this.f47086f, l2Var.f47086f);
    }

    public final int hashCode() {
        Boolean bool = this.f47081a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        String str = this.f47082b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f47083c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f47084d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f47085e;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f47086f;
        return iHashCode5 + (str5 != null ? str5.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("GDPRSettings(isCountryDataProtected=");
        sbA.append(this.f47081a);
        sbA.append(", consentTitle=");
        sbA.append(this.f47082b);
        sbA.append(", consentMessage=");
        sbA.append(this.f47083c);
        sbA.append(", consentMessageVersion=");
        sbA.append(this.f47084d);
        sbA.append(", buttonAccept=");
        sbA.append(this.f47085e);
        sbA.append(", buttonDeny=");
        return h6.c1.t(sbA, this.f47086f, ')');
    }
}
