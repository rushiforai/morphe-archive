package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class oc extends t4 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f32930c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oc(String str, int i5) {
        super(str);
        this.f32930c = i5;
    }

    @Override // com.google.android.gms.internal.measurement.t4
    public final f6 a(j8 j8Var, List list) {
        switch (this.f32930c) {
            case 0:
                return f6.Qo;
            case 1:
            case 2:
                return this;
            case 3:
                return new s3(Double.valueOf(0.0d));
            default:
                return f6.Qo;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oc(c10.a aVar) {
        super("internal.remoteConfig");
        this.f32930c = 0;
        this.f33077b.put("getValue", new za(this, aVar));
    }
}
