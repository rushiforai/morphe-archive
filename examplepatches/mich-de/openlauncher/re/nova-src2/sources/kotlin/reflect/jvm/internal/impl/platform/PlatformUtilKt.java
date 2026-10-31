package kotlin.reflect.jvm.internal.impl.platform;

import b70.g;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class PlatformUtilKt {
    @NotNull
    public static final String getPresentableDescription(@NotNull TargetPlatform targetPlatform) {
        Intrinsics.g(targetPlatform, "<this>");
        return g.f1(targetPlatform.getComponentPlatforms(), "/", null, null, 0, null, 62);
    }
}
