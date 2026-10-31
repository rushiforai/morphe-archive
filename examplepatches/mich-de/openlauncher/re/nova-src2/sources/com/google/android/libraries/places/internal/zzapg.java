package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public enum zzapg implements zzatw {
    SECONDARY_HOURS_TYPE_UNSPECIFIED(0),
    DRIVE_THROUGH(1),
    HAPPY_HOUR(2),
    DELIVERY(3),
    TAKEOUT(4),
    KITCHEN(5),
    BREAKFAST(6),
    LUNCH(7),
    DINNER(8),
    BRUNCH(9),
    PICKUP(10),
    ACCESS(11),
    SENIOR_HOURS(12),
    ONLINE_SERVICE_HOURS(13),
    UNRECOGNIZED(-1);

    private static final zzatx zzp = new zzatx() { // from class: com.google.android.libraries.places.internal.zzapf
    };
    private final int zzr;

    zzapg(int i5) {
        this.zzr = i5;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.zzr);
    }
}
