package e10;

import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class n0 {

    @NotNull
    public static final m0 Companion = new m0();

    /* renamed from: m, reason: collision with root package name */
    public static final KSerializer[] f51676m = {EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.preferences.FolderWindowStyle", p0.values()), null, null, null, null, null, null, null, EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.preferences.FolderScrollDirection", k0.values()), null, null, null};
    public static final n0 n = new n0(255, -1, 24, 3, k0.f51620b);

    /* renamed from: a, reason: collision with root package name */
    public final p0 f51677a;

    /* renamed from: b, reason: collision with root package name */
    public final int f51678b;

    /* renamed from: c, reason: collision with root package name */
    public final int f51679c;

    /* renamed from: d, reason: collision with root package name */
    public final int f51680d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f51681e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f51682f;

    /* renamed from: g, reason: collision with root package name */
    public final int f51683g;

    /* renamed from: h, reason: collision with root package name */
    public final int f51684h;

    /* renamed from: i, reason: collision with root package name */
    public final k0 f51685i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f51686j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f51687k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f51688l;

    public /* synthetic */ n0(int i5, p0 p0Var, int i11, int i12, int i13, boolean z11, boolean z12, int i14, int i15, k0 k0Var, boolean z13, boolean z14, boolean z15) {
        if (511 != (i5 & 511)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 511, l0.f51633a.getDescriptor());
        }
        this.f51677a = p0Var;
        this.f51678b = i11;
        this.f51679c = i12;
        this.f51680d = i13;
        this.f51681e = z11;
        this.f51682f = z12;
        this.f51683g = i14;
        this.f51684h = i15;
        this.f51685i = k0Var;
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f51686j = true;
        } else {
            this.f51686j = z13;
        }
        if ((i5 & 1024) == 0) {
            this.f51687k = false;
        } else {
            this.f51687k = z14;
        }
        if ((i5 & 2048) == 0) {
            this.f51688l = true;
        } else {
            this.f51688l = z15;
        }
    }

    public static n0 a(n0 n0Var, p0 p0Var, int i5, boolean z11, boolean z12, int i11, int i12, k0 k0Var, boolean z13, boolean z14, int i13) {
        if ((i13 & 1) != 0) {
            p0Var = n0Var.f51677a;
        }
        p0 p0Var2 = p0Var;
        int i14 = n0Var.f51678b;
        int i15 = n0Var.f51679c;
        int i16 = (i13 & 8) != 0 ? n0Var.f51680d : i5;
        boolean z15 = (i13 & 16) != 0 ? n0Var.f51681e : z11;
        boolean z16 = (i13 & 32) != 0 ? n0Var.f51682f : z12;
        int i17 = (i13 & 64) != 0 ? n0Var.f51683g : i11;
        int i18 = (i13 & 128) != 0 ? n0Var.f51684h : i12;
        k0 k0Var2 = (i13 & 256) != 0 ? n0Var.f51685i : k0Var;
        boolean z17 = (i13 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? n0Var.f51686j : z13;
        boolean z18 = (i13 & 1024) != 0 ? n0Var.f51687k : z14;
        n0Var.getClass();
        return new n0(p0Var2, i14, i15, i16, z15, z16, i17, i18, k0Var2, z17, z18);
    }

    public final int b() {
        boolean z11 = this.f51688l;
        int i5 = this.f51678b;
        if (!z11) {
            y2.f51877a.getClass();
            if (((Boolean) y2.O0().l()).booleanValue()) {
                py.c.f83128b.getClass();
                if (py.c.d() && i5 < 128) {
                    return 128;
                }
            }
        }
        return i5;
    }

    public final int c() {
        if (!this.f51688l) {
            y2 y2Var = y2.f51877a;
            y2Var.getClass();
            if (((Boolean) y2.O0().l()).booleanValue()) {
                py.c.f83128b.getClass();
                if (py.c.d()) {
                    return ((Number) y2Var.P0().l()).intValue();
                }
            }
        }
        return this.f51679c;
    }

    public final boolean d() {
        return this.f51677a == p0.f51734b || this.f51681e;
    }

    public final boolean e() {
        return this.f51677a == p0.f51734b && this.f51686j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n0)) {
            return false;
        }
        n0 n0Var = (n0) obj;
        return this.f51677a == n0Var.f51677a && this.f51678b == n0Var.f51678b && this.f51679c == n0Var.f51679c && this.f51680d == n0Var.f51680d && this.f51681e == n0Var.f51681e && this.f51682f == n0Var.f51682f && this.f51683g == n0Var.f51683g && this.f51684h == n0Var.f51684h && this.f51685i == n0Var.f51685i && this.f51686j == n0Var.f51686j && this.f51687k == n0Var.f51687k;
    }

    public final p0 f() {
        return this.f51677a;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f51687k) + c9.f((this.f51685i.hashCode() + u4.a(this.f51684h, u4.a(this.f51683g, c9.f(c9.f(u4.a(this.f51680d, u4.a(this.f51679c, u4.a(this.f51678b, this.f51677a.hashCode() * 31, 31), 31), 31), 31, this.f51681e), 31, this.f51682f), 31), 31)) * 31, 31, this.f51686j);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FolderWindowConfig(style=");
        sb2.append(this.f51677a);
        sb2.append(", rawBackgroundAlpha=");
        sb2.append(this.f51678b);
        sb2.append(", rawBackgroundColor=");
        b.c0.A(sb2, this.f51679c, ", cornerRadiusDp=", this.f51680d, ", rawCardBackground=");
        a80.m.s(sb2, this.f51681e, ", showFolderName=", this.f51682f, ", rows=");
        b.c0.A(sb2, this.f51683g, ", cols=", this.f51684h, ", scrollDirection=");
        sb2.append(this.f51685i);
        sb2.append(", rawShadow=");
        sb2.append(this.f51686j);
        sb2.append(", pinToBottom=");
        return a80.m.k(sb2, this.f51687k, ")");
    }

    public /* synthetic */ n0(int i5, int i11, int i12, int i13, k0 k0Var) {
        this(p0.f51734b, i5, i11, i12, true, true, i13, 4, k0Var, true, false);
    }

    public n0(p0 p0Var, int i5, int i11, int i12, boolean z11, boolean z12, int i13, int i14, k0 k0Var, boolean z13, boolean z14) {
        this.f51677a = p0Var;
        this.f51678b = i5;
        this.f51679c = i11;
        this.f51680d = i12;
        this.f51681e = z11;
        this.f51682f = z12;
        this.f51683g = i13;
        this.f51684h = i14;
        this.f51685i = k0Var;
        this.f51686j = z13;
        this.f51687k = z14;
        this.f51688l = true;
    }
}
