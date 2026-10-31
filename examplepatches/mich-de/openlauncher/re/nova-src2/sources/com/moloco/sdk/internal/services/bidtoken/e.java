package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.BidToken;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final f f37694a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final k f37695b;

    static {
        f fVar = new f(false);
        f37694a = fVar;
        f37695b = new k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, fVar);
    }

    @NotNull
    public static final f a() {
        return f37694a;
    }

    @NotNull
    public static final k b() {
        return f37695b;
    }

    @NotNull
    public static final f a(@NotNull BidToken.BidTokenResponseV3 bidTokenResponseV3) {
        Intrinsics.g(bidTokenResponseV3, "<this>");
        return bidTokenResponseV3.hasClientTokenConfigs() ? new f(bidTokenResponseV3.getClientTokenConfigs().getEnableDbt()) : f37694a;
    }
}
