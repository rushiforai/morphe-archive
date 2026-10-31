package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public enum zzaov implements zzatw {
    BUSINESS_STATUS_UNSPECIFIED(0),
    OPERATIONAL(1),
    CLOSED_TEMPORARILY(2),
    CLOSED_PERMANENTLY(3),
    FUTURE_OPENING(4),
    UNRECOGNIZED(-1);

    private static final zzatx zzg = new zzatx() { // from class: com.google.android.libraries.places.internal.zzaou
    };
    private final int zzi;

    zzaov(int i5) {
        this.zzi = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.zzi);
    }
}
