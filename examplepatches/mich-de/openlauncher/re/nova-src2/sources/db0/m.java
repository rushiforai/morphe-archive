package db0;

import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class m {
    public static i a(m mVar, boolean z11, String str, String str2, int i5, int i11) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        mVar.getClass();
        f0.Companion.getClass();
        return new i(e0.a(str), e0.a(str2), jCurrentTimeMillis, i5, i11, z11);
    }

    public static p b(m mVar, j0 j0Var, String str, long j11) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        mVar.getClass();
        f0.Companion.getClass();
        return new p(j0Var, e0.a(str), j11, jCurrentTimeMillis);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    @NotNull
    public final KSerializer<c0> serializer() {
        return (KSerializer) c0.f49137a.getValue();
    }
}
