package com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface d {

    public static final class a {
        public static /* synthetic */ void a(d dVar, String str, byte[] bArr, o50.e eVar, String str2, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: sendPost");
            }
            if ((i5 & 8) != 0) {
                str2 = null;
            }
            dVar.a(str, bArr, eVar, str2);
        }
    }

    void a(@NotNull String str);

    void a(@NotNull String str, @NotNull byte[] bArr, @NotNull o50.e eVar, @Nullable String str2);
}
