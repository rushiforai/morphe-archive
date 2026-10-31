package com.google.android.libraries.places.internal;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Task;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.api.net.FetchPlaceResponse;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsResponse;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fi.e;
import h6.f1;
import h6.j0;
import h6.m0;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzln extends f1 {
    private final zzla zza;
    private final zzlq zzb;
    private final zzlr zzc;
    private Runnable zze;
    private final Handler zzd = new Handler(Looper.getMainLooper());
    private final m0 zzf = new m0();

    public zzln(zzla zzlaVar, zzlq zzlqVar, zzlr zzlrVar, zzlm zzlmVar) {
        this.zza = zzlaVar;
        this.zzb = zzlqVar;
        this.zzc = zzlrVar;
    }

    private static Status zzn(Exception exc) {
        return exc instanceof ApiException ? ((ApiException) exc).f31794a : new Status(13, exc.getMessage(), null, null);
    }

    private final void zzo(zzkv zzkvVar) {
        if (zzkvVar.equals(this.zzf.d())) {
            return;
        }
        this.zzf.j(zzkvVar);
    }

    private static boolean zzp(Status status) {
        int i5 = status.f31810f;
        return i5 == 16 || i5 == 9012 || i5 == 9011;
    }

    @Override // h6.f1
    public final void onCleared() {
        try {
            this.zza.zzc();
            this.zzd.removeCallbacks(this.zze);
            this.zzb.zzo();
            this.zzc.zza(this.zzb);
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    public final j0 zza() {
        return this.zzf;
    }

    public final /* synthetic */ void zzb(String str, Task task) {
        if (task.o()) {
            return;
        }
        Exception excL = task.l();
        if (excL == null) {
            this.zzb.zzp();
            List<AutocompletePrediction> autocompletePredictions = ((FindAutocompletePredictionsResponse) task.m()).getAutocompletePredictions();
            if (autocompletePredictions.isEmpty()) {
                zzo(zzkv.zzh(str));
                return;
            } else {
                zzo(zzkv.zzj(autocompletePredictions));
                return;
            }
        }
        this.zzb.zzr();
        Status statusZzn = zzn(excL);
        if (zzp(statusZzn)) {
            zzo(zzkv.zzq(statusZzn));
        } else {
            zzo(zzkv.zzi(str, statusZzn));
        }
    }

    public final /* synthetic */ void zzc(AutocompletePrediction autocompletePrediction, Task task) {
        if (task.o()) {
            return;
        }
        Exception excL = task.l();
        if (excL == null) {
            this.zzb.zzq();
            zzo(zzkv.zzn(((FetchPlaceResponse) task.m()).getPlace()));
            return;
        }
        this.zzb.zzs();
        Status statusZzn = zzn(excL);
        if (zzp(statusZzn)) {
            zzo(zzkv.zzq(statusZzn));
        } else {
            zzo(zzkv.zzm(autocompletePrediction, statusZzn));
        }
    }

    public final /* synthetic */ void zzd(final String str, int i5) {
        this.zza.zzb(str, i5).b(new e() { // from class: com.google.android.libraries.places.internal.zzlj
            @Override // fi.e
            public final void onComplete(Task task) {
                this.zza.zzb(str, task);
            }
        });
    }

    public final void zze(Bundle bundle) {
        if (bundle == null) {
            this.zzf.j(zzkv.zzo());
        }
    }

    public final void zzf(final AutocompletePrediction autocompletePrediction, int i5) {
        this.zzb.zzu(i5);
        Task taskZza = this.zza.zza(autocompletePrediction);
        if (!taskZza.p()) {
            zzo(zzkv.zzg());
        }
        taskZza.b(new e() { // from class: com.google.android.libraries.places.internal.zzli
            @Override // fi.e
            public final void onComplete(Task task) {
                this.zza.zzc(autocompletePrediction, task);
            }
        });
    }

    public final void zzg() {
        this.zzb.zzv();
    }

    public final void zzh() {
        this.zzb.zzl();
    }

    public final void zzi() {
        this.zzb.zzm();
    }

    public final void zzj() {
        this.zzb.zzn();
        zzo(zzkv.zzl());
    }

    public final void zzk() {
        this.zzb.zzw();
        zzm(b.f42142b, 0);
    }

    public final void zzl(String str, int i5) {
        this.zza.zzc();
        zzm(str, i5);
        zzo(zzkv.zzp());
    }

    public final void zzm(final String str, final int i5) {
        this.zzb.zzt(str);
        Runnable runnable = this.zze;
        if (runnable != null) {
            this.zzd.removeCallbacks(runnable);
        }
        if (str.isEmpty()) {
            this.zza.zzc();
            zzo(zzkv.zzk());
        } else {
            Runnable runnable2 = new Runnable() { // from class: com.google.android.libraries.places.internal.zzlk
                @Override // java.lang.Runnable
                public final void run() {
                    this.zza.zzd(str, i5);
                }
            };
            this.zze = runnable2;
            this.zzd.postDelayed(runnable2, 100L);
            zzo(zzkv.zzg());
        }
    }
}
