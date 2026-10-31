package com.google.android.libraries.places.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes3.dex */
final class zzmu extends zzmx {
    final /* synthetic */ zzmv zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzmu(zzmv zzmvVar, zzmy zzmyVar, CharSequence charSequence) {
        super(zzmyVar, charSequence);
        this.zza = zzmvVar;
    }

    @Override // com.google.android.libraries.places.internal.zzmx
    public final int zzc(int i5) {
        return i5 + 1;
    }

    @Override // com.google.android.libraries.places.internal.zzmx
    public final int zzd(int i5) {
        CharSequence charSequence = ((zzmx) this).zzb;
        int length = charSequence.length();
        zzmt.zzb(i5, length, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        while (i5 < length) {
            zzmv zzmvVar = this.zza;
            if (zzmvVar.zza.zza(charSequence.charAt(i5))) {
                return i5;
            }
            i5++;
        }
        return -1;
    }
}
