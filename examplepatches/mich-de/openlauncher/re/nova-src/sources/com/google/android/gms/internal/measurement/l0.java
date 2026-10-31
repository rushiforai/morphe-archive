package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public enum l0 implements q1 {
    UNKNOWN(0),
    SHARED_PREFS(1),
    CONTENT_PROVIDER(2),
    FILE(6),
    TIKTOK(4),
    DEVICE_CONFIG(5),
    PROCESS_STABLE_CONTENT_PROVIDER(3);


    /* renamed from: a, reason: collision with root package name */
    public final int f32760a;

    l0(int i5) {
        this.f32760a = i5;
    }

    public static l0 a(int i5) {
        switch (i5) {
            case 0:
                return UNKNOWN;
            case 1:
                return SHARED_PREFS;
            case 2:
                return CONTENT_PROVIDER;
            case 3:
                return PROCESS_STABLE_CONTENT_PROVIDER;
            case 4:
                return TIKTOK;
            case 5:
                return DEVICE_CONFIG;
            case 6:
                return FILE;
            default:
                return null;
        }
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.f32760a);
    }

    @Override // com.google.android.gms.internal.measurement.q1
    public final int zza() {
        return this.f32760a;
    }
}
