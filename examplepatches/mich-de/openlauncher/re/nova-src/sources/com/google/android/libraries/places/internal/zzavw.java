package com.google.android.libraries.places.internal;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzavw extends zzawg {
    public zzavw(int i5) {
        super(i5, null);
    }

    @Override // com.google.android.libraries.places.internal.zzawg
    public final void zza() {
        if (!zzj()) {
            for (int i5 = 0; i5 < zzb(); i5++) {
                Map.Entry entryZzg = zzg(i5);
                if (((zzatj) entryZzg.getKey()).zzg()) {
                    entryZzg.setValue(Collections.unmodifiableList((List) entryZzg.getValue()));
                }
            }
            for (Map.Entry entry : zzc()) {
                if (((zzatj) entry.getKey()).zzg()) {
                    entry.setValue(Collections.unmodifiableList((List) entry.getValue()));
                }
            }
        }
        super.zza();
    }
}
