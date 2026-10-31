package com.google.android.libraries.places.widget.internal.ui;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.recyclerview.widget.b1;
import com.google.android.libraries.places.R;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.internal.zzkd;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzr extends b1 {
    private int zza;
    private boolean zzb;
    private final zzd zzc;

    public zzr(zzd zzdVar) {
        super(new zzq(null));
        this.zzb = true;
        this.zzc = zzdVar;
    }

    @Override // androidx.recyclerview.widget.b1
    public final void submitList(List list) {
        try {
            int size = 0;
            this.zzb = (this.zza != 0 || list == null || list.isEmpty()) ? false : true;
            if (list != null) {
                size = list.size();
            }
            this.zza = size;
            super.submitList(list);
        } catch (Error e3) {
            e = e3;
            zzkd.zzb(e);
            throw e;
        } catch (RuntimeException e11) {
            e = e11;
            zzkd.zzb(e);
            throw e;
        }
    }

    @Override // androidx.recyclerview.widget.m1
    /* renamed from: zza, reason: merged with bridge method [inline-methods] */
    public final zzt onCreateViewHolder(ViewGroup viewGroup, int i5) {
        try {
            return new zzt(this.zzc, LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.places_autocomplete_prediction, viewGroup, false));
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    @Override // androidx.recyclerview.widget.m1
    /* renamed from: zzb, reason: merged with bridge method [inline-methods] */
    public final void onBindViewHolder(zzt zztVar, int i5) {
        try {
            zztVar.zza((AutocompletePrediction) getItem(i5), this.zzb);
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }
}
