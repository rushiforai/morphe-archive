package l10;

import b.c9;
import b.u4;
import kotlin.UInt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class t {

    @NotNull
    public static final s Companion = new s();

    /* renamed from: g, reason: collision with root package name */
    public static final t f74453g = new t(1.0f, -1, false, true);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f74454a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f74455b;

    /* renamed from: c, reason: collision with root package name */
    public final int f74456c;

    /* renamed from: d, reason: collision with root package name */
    public final float f74457d;

    /* renamed from: e, reason: collision with root package name */
    public final tz.v f74458e;

    /* renamed from: f, reason: collision with root package name */
    public final float f74459f;

    public t(int i5, boolean z11, boolean z12, int i11, float f11) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, r.f74452a.getDescriptor());
        }
        this.f74454a = z11;
        this.f74455b = z12;
        this.f74456c = i11;
        this.f74457d = f11;
        tz.c.Companion.getClass();
        int iJ = 0;
        this.f74458e = new tz.v(0, 0, 0, 0, 0);
        if (!z11) {
            UInt.Companion companion = UInt.f71696b;
            iJ = r4.a.j(0, 0);
        }
        this.f74459f = (float) v4.a.n(iJ);
    }

    public static t a(t tVar, boolean z11, boolean z12, int i5, float f11, tz.v vVar, int i11) {
        if ((i11 & 1) != 0) {
            z11 = tVar.f74454a;
        }
        boolean z13 = z11;
        if ((i11 & 2) != 0) {
            z12 = tVar.f74455b;
        }
        boolean z14 = z12;
        if ((i11 & 4) != 0) {
            i5 = tVar.f74456c;
        }
        int i12 = i5;
        if ((i11 & 8) != 0) {
            f11 = tVar.f74457d;
        }
        float f12 = f11;
        if ((i11 & 16) != 0) {
            vVar = tVar.f74458e;
        }
        tVar.getClass();
        return new t(z13, z14, i12, f12, vVar);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return this.f74454a == tVar.f74454a && this.f74455b == tVar.f74455b && this.f74456c == tVar.f74456c && Float.compare(this.f74457d, tVar.f74457d) == 0 && Intrinsics.b(this.f74458e, tVar.f74458e);
    }

    public final int hashCode() {
        return this.f74458e.hashCode() + a80.m.d(this.f74457d, u4.a(this.f74456c, c9.f(Boolean.hashCode(this.f74454a) * 31, 31, this.f74455b), 31), 31);
    }

    public final String toString() {
        return "QsbBackgroundConfig(wireFrame=" + this.f74454a + ", shadow=" + this.f74455b + ", color=" + this.f74456c + ", radius=" + this.f74457d + ", colors=" + this.f74458e + ")";
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t(float f11, int i5, boolean z11, boolean z12) {
        this(z11, z12, i5, f11, new tz.v(0, 0, 0, 0, 0));
        tz.c.Companion.getClass();
    }

    public t(boolean z11, boolean z12, int i5, float f11, tz.v vVar) {
        int iJ;
        this.f74454a = z11;
        this.f74455b = z12;
        this.f74456c = i5;
        this.f74457d = f11;
        this.f74458e = vVar;
        if (z11) {
            iJ = vVar.f90182e;
        } else {
            iJ = vVar.f90178a;
            if (((iJ >> 24) & 255) >= 255) {
                UInt.Companion companion = UInt.f71696b;
            } else {
                UInt.Companion companion2 = UInt.f71696b;
                iJ = r4.a.j(iJ, vVar.f90182e);
            }
        }
        this.f74459f = (float) v4.a.n(iJ);
    }
}
