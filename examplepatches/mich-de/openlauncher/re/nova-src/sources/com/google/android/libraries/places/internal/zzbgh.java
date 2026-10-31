package com.google.android.libraries.places.internal;

import java.util.ArrayList;

/* loaded from: classes3.dex */
final class zzbgh {
    private ArrayList zza = new ArrayList();
    private volatile zzaze zzb = zzaze.IDLE;

    public final void zza(zzaze zzazeVar) {
        zzmt.zzc(zzazeVar, "newState");
        if (this.zzb == zzazeVar || this.zzb == zzaze.SHUTDOWN) {
            return;
        }
        this.zzb = zzazeVar;
        if (this.zza.isEmpty()) {
            return;
        }
        ArrayList arrayList = this.zza;
        this.zza = new ArrayList();
        if (arrayList.size() <= 0) {
            return;
        }
        throw null;
    }
}
