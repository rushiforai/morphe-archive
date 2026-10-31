package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import com.moloco.sdk.internal.x;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface d {

    public static final class a {
        public static /* synthetic */ Object a(d dVar, String str, String str2, boolean z11, Continuation continuation, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: invoke");
            }
            if ((i5 & 2) != 0) {
                str2 = "UNKNOWN_MTID";
            }
            return dVar.a(str, str2, z11, continuation);
        }
    }

    @NotNull
    com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c a(@NotNull String str);

    @Nullable
    Object a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.a aVar, long j11, @NotNull Continuation<? super x<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.a, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.k>> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull String str2, boolean z11, @NotNull Continuation<? super x<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.a, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.k>> continuation);
}
