package com.instabridge.mobilesdk.internal.data.repo;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\b\u0001\u0018\u00002\u00060\u0001j\u0002`\u0002B!\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tR\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/BrandJourneyException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "httpCode", b.f42142b, "userMessage", b.f42142b, "endpoint", "<init>", "(ILjava/lang/String;Ljava/lang/String;)V", "getHttpCode", "()I", "getUserMessage", "()Ljava/lang/String;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BrandJourneyException extends RuntimeException {
    public static final int $stable = 0;
    private final int httpCode;

    @Nullable
    private final String userMessage;

    /* JADX WARN: Illegal instructions before constructor call */
    public BrandJourneyException(int i5, @Nullable String str, @NotNull String endpoint) {
        Intrinsics.g(endpoint, "endpoint");
        String strConcat = str != null ? ": ".concat(str) : null;
        super(endpoint + " " + i5 + (strConcat == null ? b.f42142b : strConcat));
        this.httpCode = i5;
        this.userMessage = str;
    }

    public final int getHttpCode() {
        return this.httpCode;
    }

    @Nullable
    public final String getUserMessage() {
        return this.userMessage;
    }
}
