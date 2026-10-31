package com.moloco.sdk.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface y {

    public static final class a {
        public static /* synthetic */ boolean a(y yVar, String str, long j11, t tVar, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: invoke");
            }
            if ((i5 & 4) != 0) {
                tVar = null;
            }
            return yVar.a(str, j11, tVar);
        }
    }

    boolean a(@NotNull String str, long j11, @Nullable t tVar);
}
