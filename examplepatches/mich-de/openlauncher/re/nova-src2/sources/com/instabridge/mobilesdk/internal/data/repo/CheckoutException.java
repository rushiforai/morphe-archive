package com.instabridge.mobilesdk.internal.data.repo;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000b\b\u0001\u0018\u0000 \u00102\u00060\u0001j\u0002`\u0002:\u0001\u0010B+\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\b\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nR\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000e¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/CheckoutException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "httpCode", b.f42142b, "errorCode", b.f42142b, "userMessage", "endpoint", "<init>", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getHttpCode", "()I", "getErrorCode", "()Ljava/lang/String;", "getUserMessage", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CheckoutException extends RuntimeException {
    public static final int $stable = 0;

    @NotNull
    public static final String CODE_ALREADY_HAS_SUBSCRIPTION = "already_has_subscription";

    @NotNull
    public static final String CODE_STATE_UNAVAILABLE = "LSM-829";

    @Nullable
    private final String errorCode;
    private final int httpCode;

    @Nullable
    private final String userMessage;

    /* JADX WARN: Illegal instructions before constructor call */
    public CheckoutException(int i5, @Nullable String str, @Nullable String str2, @NotNull String endpoint) {
        Intrinsics.g(endpoint, "endpoint");
        String strL = str != null ? c0.l(" [", str, "]") : null;
        String str3 = b.f42142b;
        strL = strL == null ? b.f42142b : strL;
        String strConcat = str2 != null ? ": ".concat(str2) : null;
        super(endpoint + " " + i5 + strL + (strConcat != null ? strConcat : str3));
        this.httpCode = i5;
        this.errorCode = str;
        this.userMessage = str2;
    }

    @Nullable
    public final String getErrorCode() {
        return this.errorCode;
    }

    public final int getHttpCode() {
        return this.httpCode;
    }

    @Nullable
    public final String getUserMessage() {
        return this.userMessage;
    }
}
