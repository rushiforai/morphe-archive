package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.publisher.MolocoAd;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface A {

    public static final class a {
        public static void a(@NotNull A a11) {
        }

        public static void b(@NotNull A a11) {
        }

        public static /* synthetic */ void a(A a11, MolocoAd molocoAd, String str, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: onAdShowSuccess");
            }
            if ((i5 & 2) != 0) {
                str = null;
            }
            a11.a(molocoAd, str);
        }
    }

    void a();

    void a(@NotNull com.moloco.sdk.internal.t tVar);

    void a(@NotNull MolocoAd molocoAd, @Nullable String str);

    void b();

    void onAdClicked(@NotNull MolocoAd molocoAd);

    void onAdHidden(@NotNull MolocoAd molocoAd);
}
