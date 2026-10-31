package com.moloco.sdk.internal.services.bidtoken;

import b.c0;
import com.moloco.sdk.internal.MolocoLogger;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class x {
    public static final boolean a(@NotNull com.moloco.sdk.internal.bidtoken.a aVar, long j11) {
        Intrinsics.g(aVar, "<this>");
        long millis = TimeUnit.SECONDS.toMillis(aVar.a());
        long millis2 = TimeUnit.MINUTES.toMillis(2L);
        boolean z11 = j11 >= millis - millis2;
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        StringBuilder sbU = c0.u(j11, "[sbt] currentTimeInMillis: ", ", expirationTimeMillis: ");
        sbU.append(millis);
        c0.B(sbU, ", expiredThresholdMillis: ", millis2, ", expired: ");
        sbU.append(z11);
        MolocoLogger.debugBuildLog$default(molocoLogger, w.f37891g, sbU.toString(), false, 4, null);
        return z11;
    }

    public static final boolean b(@NotNull com.moloco.sdk.internal.bidtoken.a aVar, long j11) {
        Intrinsics.g(aVar, "<this>");
        long millis = TimeUnit.SECONDS.toMillis(aVar.a());
        long millis2 = TimeUnit.MINUTES.toMillis(15L);
        boolean z11 = !a(aVar, j11) && millis - j11 <= millis2;
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        StringBuilder sbU = c0.u(j11, "[sbt] currentTimeInMillis: ", ", expiryTimeMillis: ");
        sbU.append(millis);
        c0.B(sbU, ", nearExpiryThresholdMillis: ", millis2, ", expiring: ");
        sbU.append(z11);
        MolocoLogger.debugBuildLog$default(molocoLogger, w.f37891g, sbU.toString(), false, 4, null);
        return z11;
    }
}
