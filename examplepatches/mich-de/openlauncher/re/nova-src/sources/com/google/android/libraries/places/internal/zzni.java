package com.google.android.libraries.places.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
abstract class zzni extends zzoy {
    private final int zza;
    private int zzb;

    public zzni(int i5, int i11) {
        zzmt.zzb(i11, i5, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        this.zza = i5;
        this.zzb = i11;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        return this.zzb < this.zza;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.zzb > 0;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.zzb;
        this.zzb = i5 + 1;
        return zza(i5);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.zzb;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.zzb - 1;
        this.zzb = i5;
        return zza(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.zzb - 1;
    }

    public abstract Object zza(int i5);
}
