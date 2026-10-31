package com.google.android.gms.internal.measurement;

import java.io.File;
import java.io.FileInputStream;

/* loaded from: classes3.dex */
public final class ff extends hf implements ef {

    /* renamed from: a, reason: collision with root package name */
    public final File f32541a;

    public ff(FileInputStream fileInputStream, File file) {
        super(fileInputStream);
        this.f32541a = file;
    }

    @Override // com.google.android.gms.internal.measurement.ef
    public final File zza() {
        return this.f32541a;
    }
}
