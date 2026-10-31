package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzavm {
    private static final zzavl zza;
    private static final zzavl zzb;

    static {
        zzavl zzavlVar = null;
        try {
            zzavlVar = (zzavl) Class.forName("com.google.protobuf.NewInstanceSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        zza = zzavlVar;
        zzb = new zzavl();
    }

    public static zzavl zza() {
        return zza;
    }

    public static zzavl zzb() {
        return zzb;
    }
}
