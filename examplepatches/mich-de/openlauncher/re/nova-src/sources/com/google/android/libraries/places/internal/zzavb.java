package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzavb {
    private static final zzava zza;
    private static final zzava zzb;

    static {
        zzava zzavaVar = null;
        try {
            zzavaVar = (zzava) Class.forName("com.google.protobuf.MapFieldSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        zza = zzavaVar;
        zzb = new zzava();
    }

    public static zzava zza() {
        return zza;
    }

    public static zzava zzb() {
        return zzb;
    }
}
