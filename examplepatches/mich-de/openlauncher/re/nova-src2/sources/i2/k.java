package i2;

import android.graphics.Path;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class k {
    public static final h a() {
        return new h(new Path());
    }

    public static final void b(@NotNull String str) {
        throw new IllegalStateException(str);
    }
}
