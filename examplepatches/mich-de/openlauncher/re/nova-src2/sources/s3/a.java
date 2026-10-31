package s3;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public abstract class a {
    public static final void a(@NotNull String str) {
        throw new IllegalArgumentException(str);
    }

    @NotNull
    public static final Void b(@NotNull String str) {
        throw new IllegalArgumentException(str);
    }

    public static final void c(@NotNull String str) {
        throw new IllegalStateException(str);
    }
}
