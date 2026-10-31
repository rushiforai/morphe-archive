package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class p3 {

    @NotNull
    public static final o3 Companion = new o3();

    /* renamed from: a, reason: collision with root package name */
    public final c3 f47112a;

    /* renamed from: b, reason: collision with root package name */
    public final t1 f47113b;

    /* renamed from: c, reason: collision with root package name */
    public final n1 f47114c;

    /* renamed from: d, reason: collision with root package name */
    public final m3 f47115d;

    /* renamed from: e, reason: collision with root package name */
    public final int f47116e;

    public /* synthetic */ p3(int i5, c3 c3Var, t1 t1Var, n1 n1Var, m3 m3Var, int i11) {
        if (17 != (i5 & 17)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 17, n3.f47100a.getDescriptor());
        }
        this.f47112a = c3Var;
        if ((i5 & 2) == 0) {
            this.f47113b = null;
        } else {
            this.f47113b = t1Var;
        }
        if ((i5 & 4) == 0) {
            this.f47114c = null;
        } else {
            this.f47114c = n1Var;
        }
        if ((i5 & 8) == 0) {
            this.f47115d = null;
        } else {
            this.f47115d = m3Var;
        }
        this.f47116e = i11;
    }

    public static final void a(p3 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeSerializableElement(serialDesc, 0, x2.f47196a, self.f47112a);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47113b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, r1.f47137a, self.f47113b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47114c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, l1.f47079a, self.f47114c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47115d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, k3.f47074a, self.f47115d);
        }
        output.encodeIntElement(serialDesc, 4, self.f47116e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p3)) {
            return false;
        }
        p3 p3Var = (p3) obj;
        return Intrinsics.b(this.f47112a, p3Var.f47112a) && Intrinsics.b(this.f47113b, p3Var.f47113b) && Intrinsics.b(this.f47114c, p3Var.f47114c) && Intrinsics.b(this.f47115d, p3Var.f47115d) && this.f47116e == p3Var.f47116e;
    }

    public final int hashCode() {
        int iHashCode = this.f47112a.hashCode() * 31;
        t1 t1Var = this.f47113b;
        int iHashCode2 = (iHashCode + (t1Var == null ? 0 : t1Var.hashCode())) * 31;
        n1 n1Var = this.f47114c;
        int iHashCode3 = (iHashCode2 + (n1Var == null ? 0 : n1Var.hashCode())) * 31;
        m3 m3Var = this.f47115d;
        return Integer.hashCode(this.f47116e) + ((iHashCode3 + (m3Var != null ? m3Var.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("RtbToken(device=");
        sbA.append(this.f47112a);
        sbA.append(", user=");
        sbA.append(this.f47113b);
        sbA.append(", ext=");
        sbA.append(this.f47114c);
        sbA.append(", request=");
        sbA.append(this.f47115d);
        sbA.append(", ordinalView=");
        return a2.c.m(sbA, this.f47116e, ')');
    }

    public p3(c3 device, t1 t1Var, n1 n1Var, m3 m3Var, int i5) {
        Intrinsics.g(device, "device");
        this.f47112a = device;
        this.f47113b = t1Var;
        this.f47114c = n1Var;
        this.f47115d = m3Var;
        this.f47116e = i5;
    }
}
