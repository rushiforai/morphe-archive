package com.amplitude.android.internal.gestures;

import android.view.View;
import p40.f;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20482a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f20483b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f20482a = i5;
        this.f20483b = obj;
    }

    @Override // p40.f
    public final void a(View view, boolean z11) {
        switch (this.f20482a) {
            case 0:
                WindowCallbackManager.rootViewsChangedListener$lambda$1((WindowCallbackManager) this.f20483b, view, z11);
                break;
            default:
                com.amplitude.android.sessionreplay.a.a((com.amplitude.android.sessionreplay.a) this.f20483b, view, z11);
                break;
        }
    }
}
