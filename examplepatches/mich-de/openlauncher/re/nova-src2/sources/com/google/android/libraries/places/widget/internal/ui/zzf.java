package com.google.android.libraries.places.widget.internal.ui;

import g.s;

/* loaded from: classes3.dex */
final class zzf extends s {
    final /* synthetic */ AutocompleteImplFragment zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzf(AutocompleteImplFragment autocompleteImplFragment, boolean z11) {
        super(true);
        this.zza = autocompleteImplFragment;
    }

    @Override // g.s
    public final void handleOnBackPressed() {
        this.zza.zze.zzj();
    }
}
