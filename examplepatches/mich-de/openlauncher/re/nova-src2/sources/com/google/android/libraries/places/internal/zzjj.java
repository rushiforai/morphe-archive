package com.google.android.libraries.places.internal;

import android.os.Handler;
import android.os.HandlerThread;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import fi.j;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zzjj {
    private final zzjf zza;
    private final Map zzb = new HashMap();

    public zzjj(zzjf zzjfVar) {
        this.zza = zzjfVar;
    }

    public final boolean zza(final j jVar, long j11, String str) {
        if (this.zzb.containsKey(jVar)) {
            return false;
        }
        HandlerThread handlerThread = new HandlerThread("timeoutHandlerThread");
        handlerThread.start();
        this.zzb.put(jVar, handlerThread);
        final String str2 = "Location timeout.";
        return new Handler(handlerThread.getLooper()).postDelayed(new Runnable(str2) { // from class: com.google.android.libraries.places.internal.zzjg
            public final /* synthetic */ String zzb = "Location timeout.";

            @Override // java.lang.Runnable
            public final void run() {
                this.zza.b(new ApiException(new Status(15, this.zzb, null, null)));
            }
        }, j11);
    }

    public final boolean zzb(j jVar) {
        HandlerThread handlerThread = (HandlerThread) this.zzb.remove(jVar);
        if (handlerThread == null) {
            return false;
        }
        return handlerThread.quit();
    }
}
