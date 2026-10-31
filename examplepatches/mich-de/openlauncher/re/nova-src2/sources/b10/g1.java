package b10;

import com.instabridge.mobilesdk.internal.ui.screens.DashboardScreenKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class g1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16684a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f16685b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f16686c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f16687d;

    public /* synthetic */ g1(Object obj, long j11, int i5, int i11) {
        this.f16684a = i11;
        this.f16687d = obj;
        this.f16685b = j11;
        this.f16686c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f16684a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f16686c | 1);
                com.google.android.gms.internal.consent_sdk.e0.l((h1) this.f16687d, this.f16685b, (p1.o) obj, iL);
                return Unit.f71706a;
            default:
                int iIntValue = ((Integer) obj2).intValue();
                return DashboardScreenKt.StatusPill_RPmYEkk$lambda$110((String) this.f16687d, this.f16685b, this.f16686c, (p1.o) obj, iIntValue);
        }
    }
}
