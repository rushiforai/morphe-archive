package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzati {
    private static final zzatg zza = new zzath();
    private static final zzatg zzb;

    static {
        zzatg zzatgVar = null;
        try {
            zzatgVar = (zzatg) Class.forName("com.google.protobuf.ExtensionSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        zzb = zzatgVar;
    }

    public static zzatg zza() {
        zzatg zzatgVar = zzb;
        if (zzatgVar != null) {
            return zzatgVar;
        }
        throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
    }

    public static zzatg zzb() {
        return zza;
    }
}
