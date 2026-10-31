package com.google.android.libraries.places.widget.internal.ui;

import android.text.Editable;
import android.text.TextWatcher;
import com.google.android.libraries.places.internal.zzkd;

/* loaded from: classes3.dex */
final class zzj implements TextWatcher {
    final /* synthetic */ AutocompleteImplFragment zza;

    public /* synthetic */ zzj(AutocompleteImplFragment autocompleteImplFragment, zzi zziVar) {
        this.zza = autocompleteImplFragment;
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        try {
            this.zza.zze.zzm(editable.toString(), this.zza.zzg.getSelectionEnd());
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }
}
