package com.google.android.libraries.places.internal;

import java.net.Socket;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
final class zzbwr extends zzbvz {

    @NotNull
    private final Socket zzd;

    public zzbwr(@NotNull Socket socket) {
        Intrinsics.g(socket, "socket");
        this.zzd = socket;
    }
}
