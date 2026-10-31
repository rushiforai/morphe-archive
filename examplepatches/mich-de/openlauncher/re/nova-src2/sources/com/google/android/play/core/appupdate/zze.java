package com.google.android.play.core.appupdate;

import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import fi.j;

/* loaded from: classes3.dex */
final class zze extends ResultReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ j f34546a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zze(Handler handler, j jVar) {
        super(handler);
        this.f34546a = jVar;
    }

    @Override // android.os.ResultReceiver
    public final void onReceiveResult(int i5, Bundle bundle) {
        j jVar = this.f34546a;
        if (i5 == 1) {
            jVar.c(-1);
        } else if (i5 != 2) {
            jVar.c(1);
        } else {
            jVar.c(0);
        }
    }
}
