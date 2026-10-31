package com.google.android.libraries.places.widget.internal.ui;

import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;
import com.google.android.libraries.places.R;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.internal.zzkd;

/* loaded from: classes3.dex */
public final class zzt extends s2 {
    private final TextView zza;
    private final TextView zzb;
    private AutocompletePrediction zzc;
    private boolean zzd;

    public zzt(final zzd zzdVar, View view) {
        super(view);
        this.zza = (TextView) view.findViewById(R.id.places_autocomplete_prediction_primary_text);
        this.zzb = (TextView) view.findViewById(R.id.places_autocomplete_prediction_secondary_text);
        this.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.libraries.places.widget.internal.ui.zzs
            @Override // android.view.View.OnClickListener
            public final void onClick(View view2) {
                this.zza.zzc(zzdVar, view2);
            }
        });
    }

    public final void zza(AutocompletePrediction autocompletePrediction, boolean z11) {
        this.zzc = autocompletePrediction;
        this.zzd = z11;
        this.zza.setText(autocompletePrediction.getPrimaryText(new ForegroundColorSpan(this.itemView.getContext().getColor(R.color.places_autocomplete_prediction_primary_text_highlight))));
        TextView textView = this.zzb;
        SpannableString secondaryText = autocompletePrediction.getSecondaryText(null);
        textView.setText(secondaryText);
        if (secondaryText.length() == 0) {
            this.zzb.setVisibility(8);
            this.zza.setGravity(16);
        } else {
            this.zzb.setVisibility(0);
            this.zza.setGravity(80);
        }
    }

    public final boolean zzb() {
        return this.zzd;
    }

    public final /* synthetic */ void zzc(zzd zzdVar, View view) {
        AutocompletePrediction autocompletePrediction = this.zzc;
        if (autocompletePrediction == null) {
            return;
        }
        try {
            zzdVar.zza.zze(autocompletePrediction, getAdapterPosition());
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }
}
