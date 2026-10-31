package com.google.android.libraries.places.internal;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
final class zzrw {
    private static final zzpd zza;

    static {
        zzph zzphVarZza = zzpi.zza();
        zzphVarZza.zzb(AbstractJsonLexerKt.STRING, "&quot;");
        zzphVarZza.zzb('\'', "&#39;");
        zzphVarZza.zzb('&', "&amp;");
        zzphVarZza.zzb('<', "&lt;");
        zzphVarZza.zzb('>', "&gt;");
        zza = zzphVarZza.zza();
    }

    public static String zza(String str) {
        return zza.zza(str);
    }
}
