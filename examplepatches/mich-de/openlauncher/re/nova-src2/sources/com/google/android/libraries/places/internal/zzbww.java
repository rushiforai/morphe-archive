package com.google.android.libraries.places.internal;

import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final class zzbww {
    @NotNull
    public static final String zza(@NotNull byte[] bArr) {
        Intrinsics.g(bArr, "<this>");
        return new String(bArr, Charsets.f72000b);
    }

    @NotNull
    public static final byte[] zzb(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        byte[] bytes = str.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        return bytes;
    }
}
