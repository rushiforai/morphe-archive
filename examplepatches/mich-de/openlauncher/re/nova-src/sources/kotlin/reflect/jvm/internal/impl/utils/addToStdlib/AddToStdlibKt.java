package kotlin.reflect.jvm.internal.impl.utils.addToStdlib;

import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class AddToStdlibKt {

    @NotNull
    private static final ConcurrentHashMap<Function0<?>, Object> constantMap = new ConcurrentHashMap<>();

    @NotNull
    public static final Void shouldNotBeCalled(@NotNull String message) {
        Intrinsics.g(message, "message");
        throw new IllegalStateException(message.toString());
    }

    public static /* synthetic */ Void shouldNotBeCalled$default(String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = "should not be called";
        }
        return shouldNotBeCalled(str);
    }
}
