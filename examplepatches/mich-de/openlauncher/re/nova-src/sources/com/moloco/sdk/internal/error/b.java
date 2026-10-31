package com.moloco.sdk.internal.error;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public interface b {

    public static final class a {
        public static /* synthetic */ void a(b bVar, String str, com.moloco.sdk.internal.error.a aVar, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: reportError");
            }
            if ((i5 & 2) != 0) {
                aVar = new com.moloco.sdk.internal.error.a(null, 1, null);
            }
            bVar.a(str, aVar);
        }
    }

    void a(@NotNull String str, @NotNull com.moloco.sdk.internal.error.a aVar);
}
