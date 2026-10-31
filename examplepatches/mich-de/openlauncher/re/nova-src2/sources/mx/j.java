package mx;

import android.content.Context;
import android.content.res.Resources;
import b.c9;
import b.u4;
import e10.y2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class j {

    @NotNull
    public static final i Companion = new i();

    /* renamed from: a, reason: collision with root package name */
    public final float f77123a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f77124b;

    /* renamed from: c, reason: collision with root package name */
    public final float f77125c;

    /* renamed from: d, reason: collision with root package name */
    public final int f77126d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f77127e;

    /* renamed from: f, reason: collision with root package name */
    public final String f77128f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f77129g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f77130h;

    public /* synthetic */ j(int i5, float f11, boolean z11, float f12, int i11, boolean z12, String str, boolean z13, boolean z14) {
        this.f77123a = (i5 & 1) == 0 ? 1.25f : f11;
        if ((i5 & 2) == 0) {
            this.f77124b = true;
        } else {
            this.f77124b = z11;
        }
        if ((i5 & 4) == 0) {
            this.f77125c = 13.0f;
        } else {
            this.f77125c = f12;
        }
        if ((i5 & 8) == 0) {
            this.f77126d = 262914;
        } else {
            this.f77126d = i11;
        }
        if ((i5 & 16) == 0) {
            this.f77127e = false;
        } else {
            this.f77127e = z12;
        }
        if ((i5 & 32) == 0) {
            this.f77128f = "sans-serif-condensed";
        } else {
            this.f77128f = str;
        }
        if ((i5 & 64) == 0) {
            this.f77129g = true;
        } else {
            this.f77129g = z13;
        }
        if ((i5 & 128) == 0) {
            this.f77130h = false;
        } else {
            this.f77130h = z14;
        }
    }

    public static j a(j jVar, float f11, boolean z11, float f12, boolean z12, String str, boolean z13, boolean z14, int i5) {
        if ((i5 & 1) != 0) {
            f11 = jVar.f77123a;
        }
        float f13 = f11;
        if ((i5 & 2) != 0) {
            z11 = jVar.f77124b;
        }
        boolean z15 = z11;
        if ((i5 & 4) != 0) {
            f12 = jVar.f77125c;
        }
        float f14 = f12;
        int i11 = jVar.f77126d;
        if ((i5 & 16) != 0) {
            z12 = jVar.f77127e;
        }
        boolean z16 = z12;
        if ((i5 & 32) != 0) {
            str = jVar.f77128f;
        }
        String str2 = str;
        if ((i5 & 64) != 0) {
            z13 = jVar.f77129g;
        }
        boolean z17 = z13;
        boolean z18 = (i5 & 128) != 0 ? jVar.f77130h : z14;
        jVar.getClass();
        return new j(f13, z15, f14, i11, z16, str2, z17, z18);
    }

    public final float b() {
        if (this.f77130h) {
            y2 y2Var = y2.f51877a;
            if (!equals(y2Var.s().l())) {
                return ((j) y2Var.s().l()).f77123a;
            }
        }
        return this.f77123a;
    }

    public final int c(Resources resources) {
        return MathKt.b(b() * resources.getDimensionPixelSize(2131165300));
    }

    public final String d(Context context) {
        StringBuilder sb2 = new StringBuilder();
        if (this.f77130h) {
            sb2.append(context.getString(2132018209));
        } else {
            sb2.append(MathKt.b(b() * 100));
            sb2.append("%");
        }
        sb2.append(", ");
        if (this.f77124b) {
            sb2.append(context.getString(2132018036));
        } else {
            sb2.append(context.getString(2132018035));
        }
        return sb2.toString();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Float.compare(this.f77123a, jVar.f77123a) == 0 && this.f77124b == jVar.f77124b && Float.compare(this.f77125c, jVar.f77125c) == 0 && this.f77126d == jVar.f77126d && this.f77127e == jVar.f77127e && Intrinsics.b(this.f77128f, jVar.f77128f) && this.f77129g == jVar.f77129g && this.f77130h == jVar.f77130h;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f77130h) + c9.f(b.c0.e(c9.f(u4.a(this.f77126d, a80.m.d(this.f77125c, c9.f(Float.hashCode(this.f77123a) * 31, 31, this.f77124b), 31), 31), 31, this.f77127e), 31, this.f77128f), 31, this.f77129g);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CellSpecConfig(rawIconScale=");
        sb2.append(this.f77123a);
        sb2.append(", labelVisible=");
        sb2.append(this.f77124b);
        sb2.append(", labelSizeSp=");
        sb2.append(this.f77125c);
        sb2.append(", unused=");
        sb2.append(this.f77126d);
        sb2.append(", labelShadow=");
        c9.s(", labelFont=", this.f77128f, ", labelSingleLine=", sb2, this.f77127e);
        sb2.append(this.f77129g);
        sb2.append(", matchDesktopSize=");
        sb2.append(this.f77130h);
        sb2.append(")");
        return sb2.toString();
    }

    public j(float f11, boolean z11, float f12, int i5, boolean z12, String str, boolean z13, boolean z14) {
        this.f77123a = f11;
        this.f77124b = z11;
        this.f77125c = f12;
        this.f77126d = i5;
        this.f77127e = z12;
        this.f77128f = str;
        this.f77129g = z13;
        this.f77130h = z14;
    }

    public /* synthetic */ j(float f11, boolean z11, float f12, boolean z12, String str, boolean z13, boolean z14, int i5) {
        this((i5 & 1) != 0 ? 1.25f : f11, (i5 & 2) != 0 ? true : z11, (i5 & 4) != 0 ? 13.0f : f12, 262914, (i5 & 16) != 0 ? false : z12, (i5 & 32) != 0 ? "sans-serif-condensed" : str, (i5 & 64) != 0 ? true : z13, (i5 & 128) != 0 ? false : z14);
    }
}
