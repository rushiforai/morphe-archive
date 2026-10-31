package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzrv implements zzru {
    @Override // com.google.android.libraries.places.internal.zzru
    public final StackTraceElement zza(Class cls, int i5) {
        StackTraceElement[] stackTrace = new Throwable().getStackTrace();
        String name = cls.getName();
        int i11 = 3;
        boolean z11 = false;
        while (true) {
            if (i11 >= stackTrace.length) {
                i11 = -1;
                break;
            }
            if (stackTrace[i11].getClassName().equals(name)) {
                z11 = true;
            } else {
                if (z11) {
                    break;
                }
                z11 = false;
            }
            i11++;
        }
        if (i11 != -1) {
            return stackTrace[i11];
        }
        return null;
    }
}
