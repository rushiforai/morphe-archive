package y7;

import java.time.Duration;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class e {
    public static final long a(@NotNull Duration duration) {
        Intrinsics.g(duration, "<this>");
        return duration.toMillis();
    }
}
