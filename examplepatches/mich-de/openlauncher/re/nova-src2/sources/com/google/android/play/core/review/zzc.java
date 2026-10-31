package com.google.android.play.core.review;

import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import fi.j;

/* loaded from: classes3.dex */
final class zzc extends ResultReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ j f34563a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzc(Handler handler, j jVar) {
        super(handler);
        this.f34563a = jVar;
    }

    @Override // android.os.ResultReceiver
    public final void onReceiveResult(int i5, Bundle bundle) {
        this.f34563a.c(null);
    }
}
