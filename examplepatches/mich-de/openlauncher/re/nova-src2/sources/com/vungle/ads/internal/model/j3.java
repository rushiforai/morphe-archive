package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class j3 {

    @NotNull
    public static final i3 Companion = new i3();

    /* renamed from: a, reason: collision with root package name */
    public final String f47068a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f47069b;

    /* renamed from: c, reason: collision with root package name */
    public final String f47070c;

    public /* synthetic */ j3(int i5, String str, boolean z11, String str2) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, h3.f47019a.getDescriptor());
        }
        this.f47068a = str;
        if ((i5 & 2) == 0) {
            this.f47069b = false;
        } else {
            this.f47069b = z11;
        }
        if ((i5 & 4) == 0) {
            this.f47070c = null;
        } else {
            this.f47070c = str2;
        }
    }

    public static final void a(j3 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.f47068a);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47069b) {
            output.encodeBooleanElement(serialDesc, 1, self.f47069b);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.f47070c == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.f47070c);
    }

    public final String b() {
        return this.f47068a;
    }

    public final String c() {
        return this.f47070c;
    }

    public final boolean d() {
        return Intrinsics.b(this.f47070c, "appopen");
    }

    public final boolean e() {
        return Intrinsics.b(this.f47070c, "banner");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j3)) {
            return false;
        }
        j3 j3Var = (j3) obj;
        return Intrinsics.b(this.f47068a, j3Var.f47068a) && this.f47069b == j3Var.f47069b && Intrinsics.b(this.f47070c, j3Var.f47070c);
    }

    public final boolean f() {
        return Intrinsics.b(this.f47070c, "in_line");
    }

    public final boolean g() {
        return Intrinsics.b(this.f47070c, "interstitial");
    }

    public final boolean h() {
        return Intrinsics.b(this.f47070c, "mrec");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.f47068a.hashCode() * 31;
        boolean z11 = this.f47069b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode + i5) * 31;
        String str = this.f47070c;
        return i11 + (str == null ? 0 : str.hashCode());
    }

    public final boolean i() {
        return Intrinsics.b(this.f47070c, "native");
    }

    public final boolean j() {
        return Intrinsics.b(this.f47070c, "rewarded");
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Placement(referenceId=");
        sbA.append(this.f47068a);
        sbA.append(", headerBidding=");
        sbA.append(this.f47069b);
        sbA.append(", type=");
        return h6.c1.t(sbA, this.f47070c, ')');
    }

    public j3(String referenceId, String str, boolean z11) {
        Intrinsics.g(referenceId, "referenceId");
        this.f47068a = referenceId;
        this.f47069b = z11;
        this.f47070c = str;
    }

    public final boolean a() {
        return this.f47069b;
    }

    public /* synthetic */ j3(String str) {
        this(str, null, false);
    }
}
