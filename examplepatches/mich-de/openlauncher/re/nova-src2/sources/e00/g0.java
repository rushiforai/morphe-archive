package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class g0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50387a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f50388b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50389c;

    public /* synthetic */ g0(long j11, p1.e1 e1Var, int i5) {
        this.f50387a = i5;
        this.f50388b = j11;
        this.f50389c = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f50387a;
        p1.e1 e1Var = this.f50389c;
        long j11 = this.f50388b;
        switch (i5) {
            case 0:
                e1Var.setValue(new i2.s(j11));
                break;
            case 1:
                com.google.android.gms.internal.consent_sdk.w wVar = h6.f50482a;
                e1Var.setValue(new tz.n(j11));
                break;
            default:
                com.google.android.gms.internal.consent_sdk.w wVar2 = h6.f50482a;
                e1Var.setValue(new tz.n(j11));
                break;
        }
        return Unit.f71706a;
    }
}
