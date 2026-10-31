package jx;

import b.c0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class c implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70399a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.m f70400b;

    public c(int i5, t70.m mVar) {
        this.f70399a = i5;
        this.f70400b = mVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        IllegalStateException illegalStateException = new IllegalStateException(c0.h(this.f70399a, "BluetoothDataManager.getConnectedDevicesFromProfile failed for "));
        int i5 = Result.f71687b;
        this.f70400b.resumeWith(ResultKt.a(illegalStateException));
        return Unit.f71706a;
    }
}
