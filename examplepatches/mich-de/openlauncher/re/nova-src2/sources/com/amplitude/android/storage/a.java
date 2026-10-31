package com.amplitude.android.storage;

import com.amplitude.core.Amplitude;
import com.amplitude.core.diagnostics.DiagnosticsClient;
import com.amplitude.core.diagnostics.DiagnosticsClientProvider;
import com.amplitude.core.utilities.FileStorageProvider;
import com.amplitude.core.utilities.InMemoryStorageProvider;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements DiagnosticsClientProvider {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20492a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Amplitude f20493b;

    public /* synthetic */ a(Amplitude amplitude, int i5) {
        this.f20492a = i5;
        this.f20493b = amplitude;
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClientProvider
    public final DiagnosticsClient get() {
        switch (this.f20492a) {
            case 0:
                return AndroidEventsStorageProviderV2.getStorage$lambda$0(this.f20493b);
            case 1:
                return AndroidIdentifyInterceptStorageProviderV2.getStorage$lambda$0(this.f20493b);
            case 2:
                return FileStorageProvider.getStorage$lambda$0(this.f20493b);
            default:
                return InMemoryStorageProvider.getStorage$lambda$0(this.f20493b);
        }
    }
}
