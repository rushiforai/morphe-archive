package com.google.android.libraries.places.internal;

import java.util.Iterator;

/* loaded from: classes3.dex */
final class zzawr implements Iterator {
    final Iterator zza;
    final /* synthetic */ zzaws zzb;

    public zzawr(zzaws zzawsVar) {
        this.zzb = zzawsVar;
        this.zza = zzawsVar.zza.iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.zza.hasNext();
    }

    @Override // java.util.Iterator
    public final /* bridge */ /* synthetic */ Object next() {
        return (String) this.zza.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
