package com.google.android.libraries.places.internal;

import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Task;
import fi.c;
import fi.j;
import fi.t;

/* loaded from: classes3.dex */
final class zzek implements c {
    final /* synthetic */ zzel zza;

    public zzek(zzel zzelVar) {
        this.zza = zzelVar;
    }

    @Override // fi.c
    public final Object then(Task task) throws Exception {
        j jVar = new j();
        if (task.o()) {
            jVar.b(new ApiException(new Status(16, "Location request was cancelled. Please try again.", null, null)));
        } else if (task.l() == null && task.m() == null) {
            jVar.b(new ApiException(new Status(8, "Location unavailable.", null, null)));
        }
        t tVar = jVar.f55135a;
        return tVar.l() != null ? tVar : task;
    }
}
