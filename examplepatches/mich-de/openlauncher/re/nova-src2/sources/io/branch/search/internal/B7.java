package io.branch.search.internal;

import android.graphics.Path;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum B7 {
    UNKNOWN(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b),
    CIRCLE("M50 0A50 50,0,1,1,50 100A50 50,0,1,1,50 0"),
    SQUIRCLE("M50,0 C10,0 0,10 0,50 0,90 10,100 50,100 90,100 100,90 100,50 100,10 90,0 50,0 Z"),
    ROUNDED_SQUARE("M50 0h20a30 30 0 0 1 30 30v40a30 30 0 0 1-30 30H30A30 30 0 0 1 0 70V30A30 30 0 0 1 30 0z"),
    SQUARE("M50,0L100,0 100,100 0,100 0,0z");


    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Path f62135a;

    B7(String str) {
        this.f62135a = Ra.a(str);
    }
}
