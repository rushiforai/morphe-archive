package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class eh extends c3 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f32513b;

    public /* synthetic */ eh(int i5) {
        this.f32513b = i5;
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final /* synthetic */ Object a() {
        switch (this.f32513b) {
            case 0:
                return new fh();
            case 1:
                return new hh();
            case 2:
                return new wh();
            default:
                return new yh();
        }
    }
}
