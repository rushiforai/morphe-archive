package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes3.dex */
final class zzbsd implements Runnable {
    final /* synthetic */ zzbsf zza;

    public zzbsd(zzbsf zzbsfVar) {
        this.zza = zzbsfVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbsf zzbsfVar = this.zza;
        zzbsfVar.zzs.execute(zzbsfVar.zzx);
        synchronized (this.zza.zzo) {
            this.zza.zzH = LayoutNode.NotPlacedPlaceOrder;
            this.zza.zzad();
        }
    }
}
