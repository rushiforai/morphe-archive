package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.internal.services.I;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface v {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f37887a = a.f37888a;

    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f37888a = new a();

        @NotNull
        public final v a(@NotNull com.moloco.sdk.internal.bidtoken.b bidTokenParser, @NotNull I timeProviderService) {
            Intrinsics.g(bidTokenParser, "bidTokenParser");
            Intrinsics.g(timeProviderService, "timeProviderService");
            return new w(bidTokenParser, timeProviderService);
        }
    }

    @NotNull
    k a();

    @Nullable
    Object a(@NotNull k kVar, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull Continuation<? super B> continuation);

    void b();
}
