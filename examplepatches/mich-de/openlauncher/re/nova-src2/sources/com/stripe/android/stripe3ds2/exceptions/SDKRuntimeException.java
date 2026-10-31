package com.stripe.android.stripe3ds2.exceptions;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/stripe3ds2/exceptions/SDKRuntimeException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class SDKRuntimeException extends RuntimeException {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SDKRuntimeException(String message, int i5) {
        super(message, null);
        Intrinsics.g(message, "message");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public SDKRuntimeException(Throwable th2) {
        String message = th2.getMessage();
        super(message == null ? b.f42142b : message, th2.getCause());
    }
}
