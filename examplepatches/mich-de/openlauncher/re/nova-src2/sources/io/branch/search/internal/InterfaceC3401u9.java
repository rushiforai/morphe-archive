package io.branch.search.internal;

import android.net.Network;
import android.net.NetworkCapabilities;
import java.util.Set;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.u9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3401u9 {
    @Nullable
    NetworkCapabilities a(@NotNull Network network);

    @NotNull
    Set<Integer> a();

    @Nullable
    Network b();

    @Nullable
    NetworkCapabilities c();

    @NotNull
    Network[] d();
}
