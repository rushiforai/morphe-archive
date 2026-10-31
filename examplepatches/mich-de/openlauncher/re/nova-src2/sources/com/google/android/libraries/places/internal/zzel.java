package com.google.android.libraries.places.internal;

import android.content.Context;
import android.os.WorkSource;
import com.google.android.gms.location.CurrentLocationRequest;
import com.google.android.gms.tasks.Task;
import cz.b;
import fi.e;
import fi.j;
import fi.k;
import fi.n;
import fi.r;
import fi.t;
import java.util.concurrent.TimeUnit;
import nx.l;
import rg.m;
import sg.w;
import uh.a;
import uh.c;

/* loaded from: classes3.dex */
public final class zzel {
    private static final long zza = TimeUnit.SECONDS.toMillis(30);
    private final a zzb;
    private final zzjj zzc;
    private final Context zzd;

    public zzel(Context context, a aVar, zzjj zzjjVar) {
        this.zzd = context;
        this.zzb = aVar;
        this.zzc = zzjjVar;
    }

    public final Task zza(fi.a aVar) {
        int i5;
        long j11 = zza;
        w.a("durationMillis must be greater than 0", j11 > 0);
        if (o4.a.a(this.zzd, "android.permission.ACCESS_FINE_LOCATION") == 0) {
            i5 = 100;
            c.a(100);
        } else {
            i5 = 102;
            c.a(102);
        }
        int i11 = i5;
        final zzjj zzjjVar = this.zzc;
        a aVar2 = this.zzb;
        CurrentLocationRequest currentLocationRequest = new CurrentLocationRequest(60000L, 0, i11, j11, false, 0, null, new WorkSource(null), null);
        oh.a aVar3 = (oh.a) aVar2;
        aVar3.getClass();
        if (aVar != null) {
            w.a("cancellationToken may not be already canceled", !((n) aVar).f55148a.p());
        }
        b bVarB = m.b();
        bVarB.f48575c = new l(currentLocationRequest, aVar, false);
        bVarB.f48574b = 2415;
        t tVarC = aVar3.c(0, bVarB.a());
        if (aVar != null) {
            j jVar = new j(aVar);
            tVarC.h(new r(jVar));
            tVarC = jVar.f55135a;
        }
        final j jVar2 = aVar == null ? new j() : new j(aVar);
        zzjjVar.zza(jVar2, j11, "Location timeout.");
        tVarC.j(new fi.c() { // from class: com.google.android.libraries.places.internal.zzjh
            @Override // fi.c
            public final Object then(Task task) {
                j jVar3 = jVar2;
                Exception excL = task.l();
                if (task.q()) {
                    jVar3.a(task.m());
                } else if (!task.o() && excL != null) {
                    jVar3.f55135a.v(excL);
                }
                return jVar3.f55135a;
            }
        });
        e eVar = new e() { // from class: com.google.android.libraries.places.internal.zzji
            @Override // fi.e
            public final void onComplete(Task task) {
                zzjjVar.zzb(jVar2);
            }
        };
        t tVar = jVar2.f55135a;
        tVar.b(eVar);
        return tVar.k(k.f55136a, new zzek(this));
    }
}
