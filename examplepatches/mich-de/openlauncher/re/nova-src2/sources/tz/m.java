package tz;

import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class m {
    public static long a(int i5) {
        return (0 << 32) | (i5 & 4294967295L);
    }

    public static long b(m mVar, int i5) {
        mVar.getClass();
        return c(1, r4.a.n(i5, 255), 0);
    }

    public static long c(int i5, int i11, int i12) {
        return (i11 & 4294967295L) | ((((i5 & 255) << 24) | (i12 & 16777215)) << 32);
    }

    @NotNull
    public final KSerializer<n> serializer() {
        return l.f90139a;
    }
}
