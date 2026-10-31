package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
public enum zzbtm {
    HTTP_1_0("http/1.0"),
    HTTP_1_1("http/1.1"),
    SPDY_3("spdy/3.1"),
    HTTP_2("h2");

    private final String zzf;

    zzbtm(String str) {
        this.zzf = str;
    }

    public static zzbtm zza(String str) throws IOException {
        zzbtm zzbtmVar = HTTP_1_0;
        if (str.equals(zzbtmVar.zzf)) {
            return zzbtmVar;
        }
        zzbtm zzbtmVar2 = HTTP_1_1;
        if (str.equals(zzbtmVar2.zzf)) {
            return zzbtmVar2;
        }
        zzbtm zzbtmVar3 = HTTP_2;
        if (str.equals(zzbtmVar3.zzf)) {
            return zzbtmVar3;
        }
        zzbtm zzbtmVar4 = SPDY_3;
        if (str.equals(zzbtmVar4.zzf)) {
            return zzbtmVar4;
        }
        throw new IOException("Unexpected protocol: ".concat(str));
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.zzf;
    }
}
