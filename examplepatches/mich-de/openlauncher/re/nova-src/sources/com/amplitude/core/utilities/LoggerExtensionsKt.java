package com.amplitude.core.utilities;

import com.amplitude.common.Logger;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.ExceptionsKt;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u001a \u0010\u0000\u001a\u00020\u0001*\u00060\u0002j\u0002`\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0000¨\u0006\b"}, d2 = {"logWithStackTrace", b.f42142b, "Ljava/lang/Exception;", "Lkotlin/Exception;", "logger", "Lcom/amplitude/common/Logger;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class LoggerExtensionsKt {
    public static final void logWithStackTrace(@NotNull Exception exc, @NotNull Logger logger, @NotNull String message) {
        Intrinsics.g(exc, "<this>");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(message, "message");
        String message2 = exc.getMessage();
        if (message2 != null) {
            logger.error(message + ": " + message2);
        }
        if (exc.getStackTrace() != null) {
            logger.error("Stack trace: ".concat(ExceptionsKt.b(exc)));
        }
    }
}
