package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i;
import java.io.File;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface a {

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.a$a, reason: collision with other inner class name */
    public static final class C0203a {
        public static /* synthetic */ Object a(a aVar, String str, File file, String str2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.a aVar2, Continuation continuation, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: downloadMedia");
            }
            if ((i5 & 8) != 0) {
                aVar2 = null;
            }
            return aVar.a(str, file, str2, aVar2, continuation);
        }
    }

    @Nullable
    Object a(@NotNull String str, @NotNull File file, @NotNull String str2, @Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.a aVar, @NotNull Continuation<? super i.a> continuation);

    boolean a(@NotNull File file);

    boolean b(@NotNull File file);
}
