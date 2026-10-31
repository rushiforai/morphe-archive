package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public enum zzaqb implements zzatw {
    PRICE_LEVEL_UNSPECIFIED(0),
    PRICE_LEVEL_FREE(1),
    PRICE_LEVEL_INEXPENSIVE(2),
    PRICE_LEVEL_MODERATE(3),
    PRICE_LEVEL_EXPENSIVE(4),
    PRICE_LEVEL_VERY_EXPENSIVE(5),
    UNRECOGNIZED(-1);

    private static final zzatx zzh = new zzatx() { // from class: com.google.android.libraries.places.internal.zzaqa
    };
    private final int zzj;

    zzaqb(int i5) {
        this.zzj = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(zza());
    }

    public final int zza() {
        if (this != UNRECOGNIZED) {
            return this.zzj;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
