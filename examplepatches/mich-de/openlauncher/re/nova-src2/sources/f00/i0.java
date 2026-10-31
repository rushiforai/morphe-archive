package f00;

import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class i0 {

    @NotNull
    public static final h0 Companion = new h0();

    /* renamed from: a, reason: collision with root package name */
    public final String f53288a;

    /* renamed from: b, reason: collision with root package name */
    public final String f53289b;

    /* renamed from: c, reason: collision with root package name */
    public final String f53290c;

    /* renamed from: d, reason: collision with root package name */
    public final f0 f53291d;

    public /* synthetic */ i0(int i5, String str, String str2, String str3, f0 f0Var) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, g0.f53271a.getDescriptor());
        }
        this.f53288a = str;
        this.f53289b = str2;
        this.f53290c = str3;
        this.f53291d = f0Var;
    }

    public final String a() {
        return u4.m(this.f53288a, ", ", this.f53290c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i0)) {
            return false;
        }
        i0 i0Var = (i0) obj;
        return Intrinsics.b(this.f53288a, i0Var.f53288a) && Intrinsics.b(this.f53289b, i0Var.f53289b) && Intrinsics.b(this.f53290c, i0Var.f53290c) && Intrinsics.b(this.f53291d, i0Var.f53291d);
    }

    public final int hashCode() {
        int iE = b.c0.e(b.c0.e(this.f53288a.hashCode() * 31, 31, this.f53289b), 31, this.f53290c);
        f0 f0Var = this.f53291d;
        return iE + (f0Var == null ? 0 : f0Var.hashCode());
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("MapLocation(name=", this.f53288a, ", id=", this.f53289b, ", address=");
        sbW.append(this.f53290c);
        sbW.append(", latLong=");
        sbW.append(this.f53291d);
        sbW.append(")");
        return sbW.toString();
    }

    public i0(String str, String str2, String str3, f0 f0Var) {
        this.f53288a = str;
        this.f53289b = str2;
        this.f53290c = str3;
        this.f53291d = f0Var;
    }
}
