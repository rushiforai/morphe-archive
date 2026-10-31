package com.google.android.libraries.places.internal;

import java.io.Serializable;
import java.util.Comparator;

/* loaded from: classes3.dex */
final class zznk extends zzoj implements Serializable {
    final Comparator zza;

    public zznk(Comparator comparator) {
        this.zza = comparator;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return this.zza.compare(obj, obj2);
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zznk) {
            return this.zza.equals(((zznk) obj).zza);
        }
        return false;
    }

    public final int hashCode() {
        return this.zza.hashCode();
    }

    public final String toString() {
        return this.zza.toString();
    }
}
