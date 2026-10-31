package vt;

import com.stripe.android.PaymentConfiguration;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class n0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93088a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w60.a f93089b;

    public /* synthetic */ n0(w60.a aVar, int i5) {
        this.f93088a = i5;
        this.f93089b = aVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f93088a) {
            case 0:
                return ((PaymentConfiguration) this.f93089b.get()).f42440a;
            case 1:
                return ((PaymentConfiguration) this.f93089b.get()).f42441b;
            case 2:
                return ((PaymentConfiguration) this.f93089b.get()).f42440a;
            default:
                return ((PaymentConfiguration) this.f93089b.get()).f42441b;
        }
    }
}
