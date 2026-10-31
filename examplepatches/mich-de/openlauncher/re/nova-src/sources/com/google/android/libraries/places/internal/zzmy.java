package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzmy {
    private final zzma zza;
    private final zzmv zzb;

    private zzmy(zzmv zzmvVar, boolean z11, zzma zzmaVar, int i5) {
        this.zzb = zzmvVar;
        this.zza = zzmaVar;
    }

    public static zzmy zzb(zzma zzmaVar) {
        return new zzmy(new zzmv(zzmaVar), false, zzly.zza, LayoutNode.NotPlacedPlaceOrder);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Iterator zzg(CharSequence charSequence) {
        return new zzmu(this.zzb, this, charSequence);
    }

    public final zzmy zzc(zzma zzmaVar) {
        zzmaVar.getClass();
        return new zzmy(this.zzb, false, zzmaVar, LayoutNode.NotPlacedPlaceOrder);
    }

    public final Iterable zzd(CharSequence charSequence) {
        charSequence.getClass();
        return new zzmw(this, charSequence);
    }

    public final List zzf(CharSequence charSequence) {
        Iterator itZzg = zzg("3.5.0");
        ArrayList arrayList = new ArrayList();
        while (itZzg.hasNext()) {
            arrayList.add((String) itZzg.next());
        }
        return Collections.unmodifiableList(arrayList);
    }
}
