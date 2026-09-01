package com.google.android.recaptcha.internal;

import defpackage.cmg;
import defpackage.kxf;
import defpackage.v1g;
import j$.util.Optional;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzf extends Exception {
    /* JADX WARN: Illegal instructions before constructor call */
    public zzf(v1g v1gVar, kxf kxfVar, long j) {
        int i = (((((~1933084303) & 1081172490) | 1598823280) + ((1933084303 & 943317002) | 974030260)) - (-1740098486)) ^ (1578716908 % 62299853);
        Locale locale = Locale.US;
        Object[] objArr = new Object[i];
        objArr[0] = Long.valueOf(v1gVar.zza());
        objArr[1] = Long.valueOf(kxfVar.zza());
        int i2 = (((((~421825361) & 1965217800) | 1712162915) + ((421825361 & 295858312) | 210019829)) - 1704549116) ^ (1336194465 % 831099451);
        Long lValueOf = Long.valueOf(j);
        objArr[i2] = lValueOf;
        super(String.format(locale, cmg.a("bk3t6gFTc30="), objArr));
        Optional.of(kxfVar);
        Optional.of(lValueOf);
    }

    public zzf(v1g v1gVar, Exception exc) {
        super(String.format(Locale.US, cmg.a("bk0="), Long.valueOf(v1gVar.zza())), exc);
        Optional.empty();
        Optional.empty();
    }
}
