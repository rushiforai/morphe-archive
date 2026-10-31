package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzatn implements zzavd {
    private static final zzatn zza = new zzatn();

    private zzatn() {
    }

    public static zzatn zza() {
        return zza;
    }

    @Override // com.google.android.libraries.places.internal.zzavd
    public final zzavc zzb(Class cls) {
        if (!zzatu.class.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
        }
        try {
            return (zzavc) zzatu.zzas(cls.asSubclass(zzatu.class)).zzb(3, null, null);
        } catch (Exception e3) {
            throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzavd
    public final boolean zzc(Class cls) {
        return zzatu.class.isAssignableFrom(cls);
    }
}
