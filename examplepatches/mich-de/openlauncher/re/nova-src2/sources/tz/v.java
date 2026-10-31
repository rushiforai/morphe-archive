package tz;

import android.content.Context;
import b.c0;
import b.u4;
import kotlin.UInt;

/* loaded from: classes.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final int f90178a;

    /* renamed from: b, reason: collision with root package name */
    public final int f90179b;

    /* renamed from: c, reason: collision with root package name */
    public final int f90180c;

    /* renamed from: d, reason: collision with root package name */
    public final int f90181d;

    /* renamed from: e, reason: collision with root package name */
    public final int f90182e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f90183f;

    public v(int i5, int i11, int i12, int i13, int i14) {
        this.f90178a = i5;
        this.f90179b = i11;
        this.f90180c = i12;
        this.f90181d = i13;
        this.f90182e = i14;
        this.f90183f = ((double) vz.a.a(i11).f93390c) >= 0.5d;
    }

    public static boolean b(v vVar, Context context) {
        return vVar.a(((g30.b) g30.b.f57016l.h(context)).f57020d);
    }

    public final boolean a(int i5) {
        return r4.a.h(r4.a.j(this.f90178a, i5)) < 0.5d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return this.f90178a == vVar.f90178a && this.f90179b == vVar.f90179b && this.f90180c == vVar.f90180c && this.f90181d == vVar.f90181d && c.a(this.f90182e, vVar.f90182e);
    }

    public final int hashCode() {
        int iA = u4.a(this.f90181d, u4.a(this.f90180c, u4.a(this.f90179b, Integer.hashCode(this.f90178a) * 31, 31), 31), 31);
        UInt.Companion companion = UInt.f71696b;
        return Integer.hashCode(this.f90182e) + iA;
    }

    public final String toString() {
        String hexString = Integer.toHexString(this.f90178a);
        String hexString2 = Integer.toHexString(this.f90179b);
        String hexString3 = Integer.toHexString(this.f90180c);
        String hexString4 = Integer.toHexString(this.f90181d);
        String strB = c.b(this.f90182e);
        StringBuilder sbW = c0.w("SurfaceColors(bg=", hexString, ", fg=", hexString2, ", alt=");
        c0.D(sbW, hexString3, ", alt2=", hexString4, ", effectiveColorUnderSurface=");
        sbW.append(strB);
        sbW.append(", isForegroundLight=");
        sbW.append(this.f90183f);
        sbW.append(")");
        return sbW.toString();
    }
}
