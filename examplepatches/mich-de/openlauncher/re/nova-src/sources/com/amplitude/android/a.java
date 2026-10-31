package com.amplitude.android;

import com.amplitude.android.network.NetworkTrackingPlugin;
import com.amplitude.core.diagnostics.DiagnosticsClientImpl;
import com.amplitude.core.remoteconfig.RemoteConfigClient;
import java.util.Map;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements RemoteConfigClient.RemoteConfigCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20478a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f20479b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f20478a = i5;
        this.f20479b = obj;
    }

    @Override // com.amplitude.core.remoteconfig.RemoteConfigClient.RemoteConfigCallback
    public final void onUpdate(Map map, RemoteConfigClient.Source source, long j11) {
        switch (this.f20478a) {
            case 0:
                AutocaptureManager._init_$lambda$0((AutocaptureManager) this.f20479b, map, source, j11);
                break;
            case 1:
                NetworkTrackingPlugin.setup$lambda$0((NetworkTrackingPlugin) this.f20479b, map, source, j11);
                break;
            default:
                DiagnosticsClientImpl.remoteConfigCallback$lambda$0((DiagnosticsClientImpl) this.f20479b, map, source, j11);
                break;
        }
    }
}
