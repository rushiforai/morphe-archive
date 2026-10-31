package com.google.android.libraries.places.widget.internal.ui;

import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.e2;
import com.google.android.libraries.places.internal.zzkd;

/* loaded from: classes3.dex */
final class zzg extends e2 {
    final /* synthetic */ AutocompleteImplFragment zza;

    public zzg(AutocompleteImplFragment autocompleteImplFragment) {
        this.zza = autocompleteImplFragment;
    }

    @Override // androidx.recyclerview.widget.e2
    public final void onScrollStateChanged(RecyclerView recyclerView, int i5) {
        if (i5 == 1) {
            try {
                this.zza.zze.zzg();
                this.zza.zzg.clearFocus();
            } catch (Error | RuntimeException e3) {
                zzkd.zzb(e3);
                throw e3;
            }
        }
    }
}
