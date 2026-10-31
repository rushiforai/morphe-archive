package com.google.android.libraries.places.internal;

import java.util.logging.Logger;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.k;

/* loaded from: classes3.dex */
final /* synthetic */ class zzbwi {
    public static final /* synthetic */ int zza = 0;
    private static final Logger zzb = Logger.getLogger("okio.Okio");

    public static final boolean zza(@NotNull AssertionError assertionError) {
        String message;
        Intrinsics.g(assertionError, "<this>");
        return (assertionError.getCause() == null || (message = assertionError.getMessage()) == null || !k.K0(message, "getsockname failed", false)) ? false : true;
    }
}
