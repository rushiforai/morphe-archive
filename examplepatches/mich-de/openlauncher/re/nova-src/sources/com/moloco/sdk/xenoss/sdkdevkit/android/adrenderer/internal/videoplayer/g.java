package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.g2;

/* loaded from: classes4.dex */
public interface g extends l {
    boolean G();

    @Nullable
    View R();

    @Nullable
    Object a(@NotNull Continuation<? super Unit> continuation);

    void a(@Nullable String str);

    void b(boolean z11);

    @NotNull
    g2 f();

    @NotNull
    g2 isPlaying();

    @Nullable
    String m();

    @NotNull
    g2 p();

    void pause();

    void play();

    void seekTo(long j11);
}
