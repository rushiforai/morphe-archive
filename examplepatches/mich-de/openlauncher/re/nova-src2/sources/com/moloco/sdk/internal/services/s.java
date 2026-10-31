package com.moloco.sdk.internal.services;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.l1;

/* loaded from: classes.dex */
public interface s {

    /* loaded from: classes4.dex */
    public static final class a {
        public static /* synthetic */ Object a(s sVar, String str, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.model.a aVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h hVar, l1 l1Var, Continuation continuation, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: runClickThrough");
            }
            if ((i5 & 8) != 0) {
                l1Var = null;
            }
            return sVar.a(str, aVar, hVar, l1Var, continuation);
        }

        public static /* synthetic */ Object a(s sVar, String str, l1 l1Var, Continuation continuation, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: runTemplateAdClickThrough");
            }
            if ((i5 & 2) != 0) {
                l1Var = null;
            }
            return sVar.a(str, l1Var, continuation);
        }
    }

    @Nullable
    Object a(@NotNull String str, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.model.a aVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h hVar, @Nullable l1 l1Var, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull String str, @Nullable l1 l1Var, @NotNull Continuation<? super Unit> continuation);
}
