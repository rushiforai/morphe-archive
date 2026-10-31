package com.moloco.sdk.internal.unity_bridge.internal;

import com.moloco.sdk.internal.unity_bridge.MolocoUnityShowCallback;
import com.moloco.sdk.internal.unity_bridge.internal.a;
import com.moloco.sdk.publisher.MolocoAd;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f38200a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MolocoUnityShowCallback f38201b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ MolocoAd f38202c;

    public /* synthetic */ c(MolocoUnityShowCallback molocoUnityShowCallback, MolocoAd molocoAd, int i5) {
        this.f38200a = i5;
        this.f38201b = molocoUnityShowCallback;
        this.f38202c = molocoAd;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f38200a) {
            case 0:
                a.b.b(this.f38201b, this.f38202c);
                break;
            case 1:
                a.b.a(this.f38201b, this.f38202c);
                break;
            default:
                a.b.c(this.f38201b, this.f38202c);
                break;
        }
    }
}
