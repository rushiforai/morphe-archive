package w5;

import android.content.Context;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public abstract class a {
    @JvmStatic
    public static final boolean a(@NotNull Context context, @NotNull String name) {
        Intrinsics.g(context, "context");
        Intrinsics.g(name, "name");
        return context.deleteSharedPreferences(name);
    }
}
