package com.instabridge.mobilesdk.internal.data.repo;

import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a+\u0010\u0000\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0004\b\u0000\u0010\u00022\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0004H\u0080\bø\u0001\u0000¢\u0006\u0002\u0010\u0005\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0006"}, d2 = {"runCatchingRequest", "Lkotlin/Result;", "T", "block", "Lkotlin/Function0;", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CheckoutRepositoryKt {
    @NotNull
    public static final <T> Object runCatchingRequest(@NotNull Function0<? extends T> block) {
        Intrinsics.g(block, "block");
        try {
            int i5 = Result.f71687b;
            return block.invoke();
        } catch (CancellationException e3) {
            throw e3;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }
}
