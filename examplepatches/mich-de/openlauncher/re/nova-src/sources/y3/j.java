package y3;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public abstract class j {
    public static final void a(@NotNull String str) {
        throw new IllegalArgumentException(str);
    }

    public static final void b(@NotNull String str) {
        throw new IllegalStateException(str);
    }
}
