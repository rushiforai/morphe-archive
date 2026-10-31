package com.google.android.libraries.places.internal;

import java.io.Serializable;
import java.util.AbstractSequentialList;
import java.util.List;
import java.util.ListIterator;

/* loaded from: classes3.dex */
final class zzog extends AbstractSequentialList implements Serializable {
    final List zza;
    final zzmd zzb;

    public zzog(List list, zzmd zzmdVar) {
        list.getClass();
        this.zza = list;
        this.zzb = zzmdVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return this.zza.isEmpty();
    }

    @Override // java.util.AbstractSequentialList, java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        return new zzof(this, this.zza.listIterator(i5));
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        this.zza.subList(i5, i11).clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zza.size();
    }
}
