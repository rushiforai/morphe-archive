package io.sentry;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Locale;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public enum m4 implements i1 {
    OK(200, 299),
    CANCELLED(499),
    INTERNAL_ERROR(500),
    UNKNOWN(500),
    UNKNOWN_ERROR(500),
    INVALID_ARGUMENT(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE),
    DEADLINE_EXCEEDED(PglCryptUtils.BASE64_FAILED),
    NOT_FOUND(TTAdConstant.DEEPLINK_FALLBACK_CODE),
    ALREADY_EXISTS(TTAdConstant.IMAGE_LIST_CODE),
    PERMISSION_DENIED(TTAdConstant.DEEPLINK_UNAVAILABLE_CODE),
    RESOURCE_EXHAUSTED(429),
    FAILED_PRECONDITION(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE),
    ABORTED(TTAdConstant.IMAGE_LIST_CODE),
    OUT_OF_RANGE(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE),
    UNIMPLEMENTED(PglCryptUtils.LOAD_SO_FAILED),
    UNAVAILABLE(PglCryptUtils.COMPRESS_FAILED),
    DATA_LOSS(500),
    UNAUTHENTICATED(TTAdConstant.MATE_IS_NULL_CODE);

    private final int maxHttpStatusCode;
    private final int minHttpStatusCode;

    m4(int i5) {
        this.minHttpStatusCode = i5;
        this.maxHttpStatusCode = i5;
    }

    @Nullable
    public static m4 fromHttpStatusCode(int i5) {
        for (m4 m4Var : values()) {
            if (m4Var.matches(i5)) {
                return m4Var;
            }
        }
        return null;
    }

    private boolean matches(int i5) {
        return i5 >= this.minHttpStatusCode && i5 <= this.maxHttpStatusCode;
    }

    @Override // io.sentry.i1
    public void serialize(@NotNull y1 y1Var, @NotNull ILogger iLogger) throws IOException {
        ((e3) y1Var).A(name().toLowerCase(Locale.ROOT));
    }

    @NotNull
    public static m4 fromHttpStatusCode(@Nullable Integer num, @NotNull m4 m4Var) {
        m4 m4VarFromHttpStatusCode = num != null ? fromHttpStatusCode(num.intValue()) : m4Var;
        return m4VarFromHttpStatusCode != null ? m4VarFromHttpStatusCode : m4Var;
    }

    m4(int i5, int i11) {
        this.minHttpStatusCode = i5;
        this.maxHttpStatusCode = i11;
    }
}
