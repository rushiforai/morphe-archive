package com.google.android.libraries.places.internal;

import java.util.Arrays;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbwe {
    private zzbwe() {
        throw null;
    }

    @JvmStatic
    @NotNull
    public static final zzbwf zza(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        zzbwf zzbwfVar = new zzbwf(zzbww.zzb(str));
        zzbwfVar.zzi(str);
        return zzbwfVar;
    }

    @JvmStatic
    @NotNull
    public static final zzbwf zzb(@NotNull byte... data) {
        Intrinsics.g(data, "data");
        byte[] bArrCopyOf = Arrays.copyOf(data, data.length);
        Intrinsics.f(bArrCopyOf, "copyOf(...)");
        return new zzbwf(bArrCopyOf);
    }

    public /* synthetic */ zzbwe(DefaultConstructorMarker defaultConstructorMarker) {
    }
}
