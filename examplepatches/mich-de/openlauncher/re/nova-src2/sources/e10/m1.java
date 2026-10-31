package e10;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class m1 {

    @NotNull
    public static final l1 Companion = new l1();

    /* renamed from: h, reason: collision with root package name */
    public static final m1 f51650h;

    /* renamed from: a, reason: collision with root package name */
    public final j1 f51651a;

    /* renamed from: b, reason: collision with root package name */
    public final j1 f51652b;

    /* renamed from: c, reason: collision with root package name */
    public final j1 f51653c;

    /* renamed from: d, reason: collision with root package name */
    public final j1 f51654d;

    /* renamed from: e, reason: collision with root package name */
    public final j1 f51655e;

    /* renamed from: f, reason: collision with root package name */
    public final j1 f51656f;

    /* renamed from: g, reason: collision with root package name */
    public final j1 f51657g;

    static {
        j1 j1Var = new j1(false, true);
        i1 i1Var = j1.Companion;
        i1Var.getClass();
        i1Var.getClass();
        i1Var.getClass();
        i1Var.getClass();
        j1 j1Var2 = new j1(false, false);
        j1 j1Var3 = new j1(false, true);
        j1 j1Var4 = j1.f51604c;
        f51650h = new m1(j1Var, j1Var4, j1Var4, j1Var4, j1Var4, j1Var2, j1Var3);
    }

    public /* synthetic */ m1(int i5, j1 j1Var, j1 j1Var2, j1 j1Var3, j1 j1Var4, j1 j1Var5, j1 j1Var6, j1 j1Var7) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, k1.f51624a.getDescriptor());
        }
        this.f51651a = j1Var;
        this.f51652b = j1Var2;
        this.f51653c = j1Var3;
        this.f51654d = j1Var4;
        if ((i5 & 16) == 0) {
            j1.Companion.getClass();
            this.f51655e = j1.f51604c;
        } else {
            this.f51655e = j1Var5;
        }
        if ((i5 & 32) == 0) {
            this.f51656f = new j1(true, true);
        } else {
            this.f51656f = j1Var6;
        }
        if ((i5 & 64) == 0) {
            this.f51657g = new j1(false, true);
        } else {
            this.f51657g = j1Var7;
        }
    }

    public static m1 a(m1 m1Var, j1 j1Var, j1 j1Var2, j1 j1Var3, j1 j1Var4, j1 j1Var5, j1 j1Var6, j1 j1Var7, int i5) {
        if ((i5 & 1) != 0) {
            j1Var = m1Var.f51651a;
        }
        j1 j1Var8 = j1Var;
        if ((i5 & 2) != 0) {
            j1Var2 = m1Var.f51652b;
        }
        j1 j1Var9 = j1Var2;
        if ((i5 & 4) != 0) {
            j1Var3 = m1Var.f51653c;
        }
        j1 j1Var10 = j1Var3;
        if ((i5 & 8) != 0) {
            j1Var4 = m1Var.f51654d;
        }
        j1 j1Var11 = j1Var4;
        if ((i5 & 16) != 0) {
            j1Var5 = m1Var.f51655e;
        }
        j1 j1Var12 = j1Var5;
        if ((i5 & 32) != 0) {
            j1Var6 = m1Var.f51656f;
        }
        j1 j1Var13 = j1Var6;
        if ((i5 & 64) != 0) {
            j1Var7 = m1Var.f51657g;
        }
        m1Var.getClass();
        return new m1(j1Var8, j1Var9, j1Var10, j1Var11, j1Var12, j1Var13, j1Var7);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m1)) {
            return false;
        }
        m1 m1Var = (m1) obj;
        return Intrinsics.b(this.f51651a, m1Var.f51651a) && Intrinsics.b(this.f51652b, m1Var.f51652b) && Intrinsics.b(this.f51653c, m1Var.f51653c) && Intrinsics.b(this.f51654d, m1Var.f51654d) && Intrinsics.b(this.f51655e, m1Var.f51655e) && Intrinsics.b(this.f51656f, m1Var.f51656f) && Intrinsics.b(this.f51657g, m1Var.f51657g);
    }

    public final int hashCode() {
        return this.f51657g.hashCode() + ((this.f51656f.hashCode() + ((this.f51655e.hashCode() + ((this.f51654d.hashCode() + ((this.f51653c.hashCode() + ((this.f51652b.hashCode() + (this.f51651a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "PopupItems(uninstall=" + this.f51651a + ", playStore=" + this.f51652b + ", closeApp=" + this.f51653c + ", relaunch=" + this.f51654d + ", saveApk=" + this.f51655e + ", sesame=" + this.f51656f + ", hideApp=" + this.f51657g + ")";
    }

    public m1(j1 j1Var, j1 j1Var2, j1 j1Var3, j1 j1Var4, j1 j1Var5, j1 j1Var6, j1 j1Var7) {
        this.f51651a = j1Var;
        this.f51652b = j1Var2;
        this.f51653c = j1Var3;
        this.f51654d = j1Var4;
        this.f51655e = j1Var5;
        this.f51656f = j1Var6;
        this.f51657g = j1Var7;
    }
}
