package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class u1 {

    @NotNull
    public static final e1 Companion = new e1();

    /* renamed from: a, reason: collision with root package name */
    public final c3 f47159a;

    /* renamed from: b, reason: collision with root package name */
    public final m0 f47160b;

    /* renamed from: c, reason: collision with root package name */
    public final t1 f47161c;

    /* renamed from: d, reason: collision with root package name */
    public n1 f47162d;

    /* renamed from: e, reason: collision with root package name */
    public q1 f47163e;

    public /* synthetic */ u1(int i5, c3 c3Var, m0 m0Var, t1 t1Var, n1 n1Var, q1 q1Var) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, r0.f47135a.getDescriptor());
        }
        this.f47159a = c3Var;
        if ((i5 & 2) == 0) {
            this.f47160b = null;
        } else {
            this.f47160b = m0Var;
        }
        if ((i5 & 4) == 0) {
            this.f47161c = null;
        } else {
            this.f47161c = t1Var;
        }
        if ((i5 & 8) == 0) {
            this.f47162d = null;
        } else {
            this.f47162d = n1Var;
        }
        if ((i5 & 16) == 0) {
            this.f47163e = null;
        } else {
            this.f47163e = q1Var;
        }
    }

    public static final void a(u1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeSerializableElement(serialDesc, 0, x2.f47196a, self.f47159a);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47160b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, k0.f47071a, self.f47160b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47161c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, r1.f47137a, self.f47161c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47162d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, l1.f47079a, self.f47162d);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.f47163e == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, o1.f47106a, self.f47163e);
    }

    public final n1 b() {
        return this.f47162d;
    }

    public final q1 c() {
        return this.f47163e;
    }

    public final t1 d() {
        return this.f47161c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u1)) {
            return false;
        }
        u1 u1Var = (u1) obj;
        return Intrinsics.b(this.f47159a, u1Var.f47159a) && Intrinsics.b(this.f47160b, u1Var.f47160b) && Intrinsics.b(this.f47161c, u1Var.f47161c) && Intrinsics.b(this.f47162d, u1Var.f47162d) && Intrinsics.b(this.f47163e, u1Var.f47163e);
    }

    public final int hashCode() {
        int iHashCode = this.f47159a.hashCode() * 31;
        m0 m0Var = this.f47160b;
        int iHashCode2 = (iHashCode + (m0Var == null ? 0 : m0Var.hashCode())) * 31;
        t1 t1Var = this.f47161c;
        int iHashCode3 = (iHashCode2 + (t1Var == null ? 0 : t1Var.hashCode())) * 31;
        n1 n1Var = this.f47162d;
        int iHashCode4 = (iHashCode3 + (n1Var == null ? 0 : n1Var.hashCode())) * 31;
        q1 q1Var = this.f47163e;
        return iHashCode4 + (q1Var != null ? q1Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("CommonRequestBody(device=");
        sbA.append(this.f47159a);
        sbA.append(", app=");
        sbA.append(this.f47160b);
        sbA.append(", user=");
        sbA.append(this.f47161c);
        sbA.append(", ext=");
        sbA.append(this.f47162d);
        sbA.append(", request=");
        sbA.append(this.f47163e);
        sbA.append(')');
        return sbA.toString();
    }

    public u1(c3 device, m0 m0Var, t1 t1Var, n1 n1Var, q1 q1Var) {
        Intrinsics.g(device, "device");
        this.f47159a = device;
        this.f47160b = m0Var;
        this.f47161c = t1Var;
        this.f47162d = n1Var;
        this.f47163e = q1Var;
    }

    public final c3 a() {
        return this.f47159a;
    }

    public final void a(n1 n1Var) {
        this.f47162d = n1Var;
    }

    public final void a(q1 q1Var) {
        this.f47163e = q1Var;
    }

    public /* synthetic */ u1(c3 c3Var, m0 m0Var, t1 t1Var) {
        this(c3Var, m0Var, t1Var, null, null);
    }
}
