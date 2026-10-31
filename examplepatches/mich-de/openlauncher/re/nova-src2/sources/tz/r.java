package tz;

import b.c0;
import kotlin.UInt;
import kotlin.jvm.JvmInline;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@JvmInline
@Serializable
/* loaded from: classes.dex */
public final class r {

    @NotNull
    public static final q Companion = new q();

    /* renamed from: a, reason: collision with root package name */
    public final int f90168a;

    public static final o a(int i5, int i11, o oVar) {
        if (i5 != 0) {
            if (i5 != 1) {
                o oVar2 = o.f90164b;
                return x7.f.z(i11);
            }
            c.Companion.getClass();
            if (!c.a(i11, 0)) {
                o oVar3 = o.f90164b;
                return x7.f.z(i11);
            }
        }
        return oVar;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof r) {
            return c.a(this.f90168a, ((r) obj).f90168a);
        }
        return false;
    }

    public final int hashCode() {
        UInt.Companion companion = UInt.f71696b;
        return Integer.hashCode(this.f90168a);
    }

    public final String toString() {
        return c0.l("RelativeColorPaletteConfig(seed=", c.b(this.f90168a), ")");
    }
}
