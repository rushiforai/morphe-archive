package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public enum zzbdj {
    OK(0),
    CANCELLED(1),
    UNKNOWN(2),
    INVALID_ARGUMENT(3),
    DEADLINE_EXCEEDED(4),
    NOT_FOUND(5),
    ALREADY_EXISTS(6),
    PERMISSION_DENIED(7),
    RESOURCE_EXHAUSTED(8),
    FAILED_PRECONDITION(9),
    ABORTED(10),
    OUT_OF_RANGE(11),
    UNIMPLEMENTED(12),
    INTERNAL(13),
    UNAVAILABLE(14),
    DATA_LOSS(15),
    UNAUTHENTICATED(16);

    private final int zzs;
    private final byte[] zzt;

    zzbdj(int i5) {
        this.zzs = i5;
        this.zzt = Integer.toString(i5).getBytes(zzmb.zza);
    }

    public final int zza() {
        return this.zzs;
    }

    public final zzbdo zzb() {
        return (zzbdo) zzbdo.zzt.get(this.zzs);
    }
}
