package k;

import android.content.Context;
import android.content.Intent;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class b {
    public abstract Intent createIntent(Context context, Object obj);

    @Nullable
    public a getSynchronousResult(@NotNull Context context, Object obj) {
        Intrinsics.g(context, "context");
        return null;
    }

    public abstract Object parseResult(int i5, Intent intent);
}
