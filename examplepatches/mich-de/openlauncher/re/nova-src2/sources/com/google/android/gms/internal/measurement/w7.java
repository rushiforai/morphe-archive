package com.google.android.gms.internal.measurement;

import android.os.Parcel;

/* loaded from: classes.dex */
public final class w7 extends q6 implements h7 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ab.z f33187a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w7(p7 p7Var, ab.z zVar) {
        super("com.google.android.gms.measurement.api.internal.IDynamiteUploadBatchesCallback");
        this.f33187a = zVar;
    }

    @Override // com.google.android.gms.internal.measurement.q6
    public final boolean T(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 != 2) {
            return false;
        }
        zze();
        return true;
    }

    @Override // com.google.android.gms.internal.measurement.h7
    public final void zze() {
        this.f33187a.run();
    }
}
