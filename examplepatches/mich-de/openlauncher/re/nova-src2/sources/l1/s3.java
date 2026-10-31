package l1;

import android.window.OnBackAnimationCallback;
import kotlin.Unit;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public abstract class s3 {
    @JvmStatic
    @NotNull
    public static final OnBackAnimationCallback a(@NotNull Function0<Unit> function0, @NotNull c0.e eVar, @NotNull t70.j0 j0Var) {
        return new r3(function0, eVar, j0Var);
    }
}
