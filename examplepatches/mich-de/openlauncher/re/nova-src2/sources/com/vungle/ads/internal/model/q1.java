package com.vungle.ads.internal.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class q1 {

    @NotNull
    public static final p1 Companion = new p1();

    /* renamed from: a, reason: collision with root package name */
    public final List f47124a;

    /* renamed from: b, reason: collision with root package name */
    public u0 f47125b;

    /* renamed from: c, reason: collision with root package name */
    public final Long f47126c;

    /* renamed from: d, reason: collision with root package name */
    public final String f47127d;

    /* renamed from: e, reason: collision with root package name */
    public final String f47128e;

    /* renamed from: f, reason: collision with root package name */
    public final String f47129f;

    /* renamed from: g, reason: collision with root package name */
    public final d1 f47130g;

    public /* synthetic */ q1(int i5, List list, u0 u0Var, Long l9, String str, String str2, String str3, d1 d1Var) {
        if ((i5 & 1) == 0) {
            this.f47124a = null;
        } else {
            this.f47124a = list;
        }
        if ((i5 & 2) == 0) {
            this.f47125b = null;
        } else {
            this.f47125b = u0Var;
        }
        if ((i5 & 4) == 0) {
            this.f47126c = null;
        } else {
            this.f47126c = l9;
        }
        if ((i5 & 8) == 0) {
            this.f47127d = null;
        } else {
            this.f47127d = str;
        }
        if ((i5 & 16) == 0) {
            this.f47128e = null;
        } else {
            this.f47128e = str2;
        }
        if ((i5 & 32) == 0) {
            this.f47129f = null;
        } else {
            this.f47129f = str3;
        }
        if ((i5 & 64) == 0) {
            this.f47130g = null;
        } else {
            this.f47130g = d1Var;
        }
    }

    public static final void a(q1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47124a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, new ArrayListSerializer(StringSerializer.INSTANCE), self.f47124a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47125b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, s0.f47142a, self.f47125b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47126c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, LongSerializer.INSTANCE, self.f47126c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47127d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.f47127d);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.f47128e != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.f47128e);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.f47129f != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.f47129f);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 6) && self.f47130g == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 6, b1.f46941a, self.f47130g);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q1)) {
            return false;
        }
        q1 q1Var = (q1) obj;
        return Intrinsics.b(this.f47124a, q1Var.f47124a) && Intrinsics.b(this.f47125b, q1Var.f47125b) && Intrinsics.b(this.f47126c, q1Var.f47126c) && Intrinsics.b(this.f47127d, q1Var.f47127d) && Intrinsics.b(this.f47128e, q1Var.f47128e) && Intrinsics.b(this.f47129f, q1Var.f47129f) && Intrinsics.b(this.f47130g, q1Var.f47130g);
    }

    public final int hashCode() {
        List list = this.f47124a;
        int iHashCode = (list == null ? 0 : list.hashCode()) * 31;
        u0 u0Var = this.f47125b;
        int iHashCode2 = (iHashCode + (u0Var == null ? 0 : u0Var.hashCode())) * 31;
        Long l9 = this.f47126c;
        int iHashCode3 = (iHashCode2 + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str = this.f47127d;
        int iHashCode4 = (iHashCode3 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f47128e;
        int iHashCode5 = (iHashCode4 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f47129f;
        int iHashCode6 = (iHashCode5 + (str3 == null ? 0 : str3.hashCode())) * 31;
        d1 d1Var = this.f47130g;
        return iHashCode6 + (d1Var != null ? d1Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("RequestParam(placements=");
        sbA.append(this.f47124a);
        sbA.append(", adSize=");
        sbA.append(this.f47125b);
        sbA.append(", adStartTime=");
        sbA.append(this.f47126c);
        sbA.append(", advAppId=");
        sbA.append(this.f47127d);
        sbA.append(", placementReferenceId=");
        sbA.append(this.f47128e);
        sbA.append(", user=");
        sbA.append(this.f47129f);
        sbA.append(", csb=");
        sbA.append(this.f47130g);
        sbA.append(')');
        return sbA.toString();
    }

    public q1(List list, u0 u0Var, Long l9, String str, String str2, String str3, d1 d1Var) {
        this.f47124a = list;
        this.f47125b = u0Var;
        this.f47126c = l9;
        this.f47127d = str;
        this.f47128e = str2;
        this.f47129f = str3;
        this.f47130g = d1Var;
    }

    public final List a() {
        return this.f47124a;
    }

    public final void a(u0 u0Var) {
        this.f47125b = u0Var;
    }

    public /* synthetic */ q1(List list, Long l9, String str, String str2, String str3, d1 d1Var, int i5) {
        this((i5 & 1) != 0 ? null : list, (u0) null, (i5 & 4) != 0 ? null : l9, (i5 & 8) != 0 ? null : str, (i5 & 16) != 0 ? null : str2, (i5 & 32) != 0 ? null : str3, (i5 & 64) != 0 ? null : d1Var);
    }
}
