package com.amplitude.core.utilities;

import com.amplitude.core.Amplitude;
import com.amplitude.core.Storage;
import com.amplitude.core.StorageProvider;
import com.amplitude.core.diagnostics.DiagnosticsClient;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u001a\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0016¨\u0006\t"}, d2 = {"Lcom/amplitude/core/utilities/InMemoryStorageProvider;", "Lcom/amplitude/core/StorageProvider;", "()V", "getStorage", "Lcom/amplitude/core/Storage;", "amplitude", "Lcom/amplitude/core/Amplitude;", "prefix", b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class InMemoryStorageProvider implements StorageProvider {
    /* JADX INFO: Access modifiers changed from: private */
    public static final DiagnosticsClient getStorage$lambda$0(Amplitude amplitude) {
        Intrinsics.g(amplitude, "$amplitude");
        return amplitude.getDiagnosticsClient();
    }

    @Override // com.amplitude.core.StorageProvider
    @NotNull
    public Storage getStorage(@NotNull Amplitude amplitude, @Nullable String prefix) {
        Intrinsics.g(amplitude, "amplitude");
        return new InMemoryStorage(new com.amplitude.android.storage.a(amplitude, 3));
    }
}
