package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import java.util.List;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface l {

    public static final class a {
        public static /* synthetic */ void a(l lVar, List list, x xVar, Integer num, String str, List list2, com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, a.AbstractC0299a.f fVar, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: trackClick");
            }
            if ((i5 & 2) != 0) {
                xVar = null;
            }
            if ((i5 & 4) != 0) {
                num = null;
            }
            if ((i5 & 8) != 0) {
                str = null;
            }
            lVar.a(list, xVar, num, str, list2, aVar, fVar);
        }

        public static /* synthetic */ void a(l lVar, List list, x xVar, Integer num, String str, int i5, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: track");
            }
            if ((i5 & 2) != 0) {
                xVar = null;
            }
            if ((i5 & 4) != 0) {
                num = null;
            }
            if ((i5 & 8) != 0) {
                str = null;
            }
            lVar.a(list, xVar, num, str);
        }
    }

    void a(@NotNull List<String> list, @Nullable x xVar, @Nullable Integer num, @Nullable String str);

    void a(@NotNull List<String> list, @Nullable x xVar, @Nullable Integer num, @Nullable String str, @NotNull List<a.AbstractC0299a.c> list2, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, @NotNull a.AbstractC0299a.f fVar);
}
