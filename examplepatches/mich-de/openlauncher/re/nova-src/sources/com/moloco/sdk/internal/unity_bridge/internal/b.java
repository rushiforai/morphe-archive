package com.moloco.sdk.internal.unity_bridge.internal;

import com.moloco.sdk.internal.unity_bridge.MolocoUnityLoadCallback;
import com.moloco.sdk.internal.unity_bridge.internal.a;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f38197a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MolocoUnityLoadCallback f38198b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f38199c;

    public /* synthetic */ b(MolocoUnityLoadCallback molocoUnityLoadCallback, String str, int i5) {
        this.f38197a = i5;
        this.f38198b = molocoUnityLoadCallback;
        this.f38199c = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f38197a) {
            case 0:
                a.a(this.f38198b, this.f38199c);
                break;
            default:
                a.C0178a.a(this.f38198b, this.f38199c);
                break;
        }
    }
}
