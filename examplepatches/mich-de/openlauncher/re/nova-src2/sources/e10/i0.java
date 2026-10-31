package e10;

import b.c9;
import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class i0 {

    @NotNull
    public static final h0 Companion = new h0();

    /* renamed from: h, reason: collision with root package name */
    public static final KSerializer[] f51582h = {null, EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.preferences.Pref.Key.FolderPreview", e2.values()), null, null, null, null, null};

    /* renamed from: i, reason: collision with root package name */
    public static final i0 f51583i = new i0(fz.d.f56189j, e2.f51488f, true, 262914, 160);

    /* renamed from: j, reason: collision with root package name */
    public static final i0 f51584j = new i0(fz.d.o, e2.f51493k, true, 262914, 0);

    /* renamed from: a, reason: collision with root package name */
    public final fz.d f51585a;

    /* renamed from: b, reason: collision with root package name */
    public final e2 f51586b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f51587c;

    /* renamed from: d, reason: collision with root package name */
    public final int f51588d;

    /* renamed from: e, reason: collision with root package name */
    public final int f51589e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f51590f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f51591g;

    public /* synthetic */ i0(int i5, fz.d dVar, e2 e2Var, boolean z11, int i11, int i12, boolean z12, boolean z13) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, g0.f51541a.getDescriptor());
        }
        this.f51585a = dVar;
        this.f51586b = e2Var;
        this.f51587c = z11;
        this.f51588d = i11;
        if ((i5 & 16) == 0) {
            this.f51589e = 255;
        } else {
            this.f51589e = i12;
        }
        if ((i5 & 32) == 0) {
            this.f51590f = true;
        } else {
            this.f51590f = z12;
        }
        if ((i5 & 64) == 0) {
            this.f51591g = false;
        } else {
            this.f51591g = z13;
        }
    }

    public static i0 c(i0 i0Var, fz.d dVar, e2 e2Var, boolean z11, int i5, boolean z12, int i11) {
        if ((i11 & 1) != 0) {
            dVar = i0Var.f51585a;
        }
        fz.d dVar2 = dVar;
        if ((i11 & 2) != 0) {
            e2Var = i0Var.f51586b;
        }
        e2 e2Var2 = e2Var;
        if ((i11 & 4) != 0) {
            z11 = i0Var.f51587c;
        }
        boolean z13 = z11;
        if ((i11 & 8) != 0) {
            i5 = i0Var.f51588d;
        }
        int i12 = i5;
        int i13 = i0Var.f51589e;
        if ((i11 & 32) != 0) {
            z12 = i0Var.f51590f;
        }
        boolean z14 = i0Var.f51591g;
        i0Var.getClass();
        return new i0(dVar2, e2Var2, z13, i12, i13, z12, z14);
    }

    public static final i0 f() {
        Companion.getClass();
        return f51584j;
    }

    public final boolean a() {
        return (Intrinsics.b(g(), fz.d.f56197t) || Intrinsics.b(g(), fz.d.D)) ? false : true;
    }

    public final boolean b() {
        return a() && this.f51587c;
    }

    public final e2 d() {
        return this.f51586b;
    }

    public final boolean e() {
        return this.f51591g;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i0)) {
            return false;
        }
        i0 i0Var = (i0) obj;
        return Intrinsics.b(this.f51585a, i0Var.f51585a) && this.f51586b == i0Var.f51586b && this.f51587c == i0Var.f51587c && this.f51588d == i0Var.f51588d && this.f51589e == i0Var.f51589e && this.f51590f == i0Var.f51590f && this.f51591g == i0Var.f51591g;
    }

    public final fz.d g() {
        fz.d dVar = fz.d.f56189j;
        fz.d dVar2 = this.f51585a;
        return !Intrinsics.b(dVar2, dVar) ? dVar2 : (fz.d) y2.f51877a.i().l();
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f51591g) + c9.f(u4.a(this.f51589e, u4.a(this.f51588d, c9.f((this.f51586b.hashCode() + (this.f51585a.hashCode() * 31)) * 31, 31, this.f51587c), 31), 31), 31, this.f51590f);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FolderIconConfig(_shape=");
        sb2.append(this.f51585a);
        sb2.append(", preview=");
        sb2.append(this.f51586b);
        sb2.append(", _clipToBounds=");
        sb2.append(this.f51587c);
        sb2.append(", _matchWindowColorWhenSetToColorAuto=");
        sb2.append(this.f51588d);
        sb2.append(", unused_oldIconAlpha=");
        sb2.append(this.f51589e);
        sb2.append(", outline=");
        sb2.append(this.f51590f);
        sb2.append(", prioritizeFirstIcon=");
        return a80.m.k(sb2, this.f51591g, ")");
    }

    public /* synthetic */ i0(fz.d dVar, e2 e2Var, boolean z11, int i5, int i11) {
        this(dVar, e2Var, z11, i5, i11, true, false);
    }

    public i0(fz.d dVar, e2 e2Var, boolean z11, int i5, int i11, boolean z12, boolean z13) {
        this.f51585a = dVar;
        this.f51586b = e2Var;
        this.f51587c = z11;
        this.f51588d = i5;
        this.f51589e = i11;
        this.f51590f = z12;
        this.f51591g = z13;
    }
}
