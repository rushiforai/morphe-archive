package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final class zzbwh {
    @NotNull
    public static final zzbwc zza(@NotNull zzbwq zzbwqVar) {
        Intrinsics.g(zzbwqVar, "<this>");
        return new zzbwk(zzbwqVar);
    }

    @NotNull
    public static final zzbwd zzb(@NotNull zzbws zzbwsVar) {
        Intrinsics.g(zzbwsVar, "<this>");
        return new zzbwl(zzbwsVar);
    }

    @NotNull
    public static final zzbwq zzc(@NotNull Socket socket) throws IOException {
        int i5 = zzbwi.zza;
        Intrinsics.g(socket, "<this>");
        zzbwr zzbwrVar = new zzbwr(socket);
        OutputStream outputStream = socket.getOutputStream();
        Intrinsics.f(outputStream, "getOutputStream(...)");
        return new zzbvx(zzbwrVar, new zzbwj(outputStream, zzbwrVar));
    }

    @NotNull
    public static final zzbws zzd(@NotNull Socket socket) throws IOException {
        int i5 = zzbwi.zza;
        Intrinsics.g(socket, "<this>");
        zzbwr zzbwrVar = new zzbwr(socket);
        InputStream inputStream = socket.getInputStream();
        Intrinsics.f(inputStream, "getInputStream(...)");
        return new zzbvy(zzbwrVar, new zzbwg(inputStream, zzbwrVar));
    }
}
