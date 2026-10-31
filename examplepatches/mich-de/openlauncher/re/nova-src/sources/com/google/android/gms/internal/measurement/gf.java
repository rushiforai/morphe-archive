package com.google.android.gms.internal.measurement;

import java.io.File;
import java.io.FileOutputStream;

/* loaded from: classes3.dex */
public final class gf extends jf implements ef {

    /* renamed from: a, reason: collision with root package name */
    public final FileOutputStream f32576a;

    /* renamed from: b, reason: collision with root package name */
    public final File f32577b;

    public gf(FileOutputStream fileOutputStream, File file) {
        super(fileOutputStream);
        this.f32576a = fileOutputStream;
        this.f32577b = file;
    }

    @Override // com.google.android.gms.internal.measurement.ef
    public final File zza() {
        return this.f32577b;
    }
}
