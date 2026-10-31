package com.amplitude.core;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\bf\u0018\u00002\u00020\u0001J\u001c\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\bÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/core/StorageProvider;", b.f42142b, "getStorage", "Lcom/amplitude/core/Storage;", "amplitude", "Lcom/amplitude/core/Amplitude;", "prefix", b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface StorageProvider {
    static /* synthetic */ Storage getStorage$default(StorageProvider storageProvider, Amplitude amplitude, String str, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getStorage");
        }
        if ((i5 & 2) != 0) {
            str = null;
        }
        return storageProvider.getStorage(amplitude, str);
    }

    @NotNull
    Storage getStorage(@NotNull Amplitude amplitude, @Nullable String prefix);
}
