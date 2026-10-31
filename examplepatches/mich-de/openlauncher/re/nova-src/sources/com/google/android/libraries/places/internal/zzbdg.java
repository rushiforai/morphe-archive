package com.google.android.libraries.places.internal;

import java.util.Comparator;

/* loaded from: classes3.dex */
final class zzbdg implements Comparator {
    final /* synthetic */ zzbdh zza;

    public zzbdg(zzbdh zzbdhVar) {
        this.zza = zzbdhVar;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        this.zza.zza(obj);
        this.zza.zza(obj2);
        return obj.getClass().getName().compareTo(obj2.getClass().getName());
    }
}
