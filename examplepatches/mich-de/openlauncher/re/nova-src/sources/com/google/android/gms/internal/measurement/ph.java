package com.google.android.gms.internal.measurement;

import java.io.File;

/* loaded from: classes3.dex */
public final class ph extends qh {

    /* renamed from: b, reason: collision with root package name */
    public int f32969b;

    @Override // com.google.android.gms.internal.measurement.qh
    public final String a() {
        return "com/google/android/libraries/phenotype/client/Phlogger".replace('/', '.');
    }

    @Override // com.google.android.gms.internal.measurement.qh
    public final String b() {
        return "logInternal";
    }

    @Override // com.google.android.gms.internal.measurement.qh
    public final int c() {
        return 44;
    }

    @Override // com.google.android.gms.internal.measurement.qh
    public final String d() {
        return "Phlogger.java".substring("Phlogger.java".lastIndexOf(File.separatorChar) + 1);
    }

    @Override // com.google.android.gms.internal.measurement.qh
    public final String e() {
        return "Phlogger.java";
    }

    public final boolean equals(Object obj) {
        return obj instanceof ph;
    }

    public final int hashCode() {
        int i5 = this.f32969b;
        if (i5 != 0) {
            return i5;
        }
        this.f32969b = -1391114360;
        return -1391114360;
    }
}
