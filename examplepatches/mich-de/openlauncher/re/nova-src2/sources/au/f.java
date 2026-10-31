package au;

import com.stripe.android.PaymentConfiguration;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class f implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15681a;

    /* renamed from: b, reason: collision with root package name */
    public final e f15682b;

    public /* synthetic */ f(e eVar, int i5) {
        this.f15681a = i5;
        this.f15682b = eVar;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f15681a) {
            case 0:
                final int i5 = 0;
                final e eVar = this.f15682b;
                return new Function0() { // from class: au.a
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        switch (i5) {
                            case 0:
                                return ((PaymentConfiguration) eVar.get()).f42440a;
                            default:
                                return ((PaymentConfiguration) eVar.get()).f42441b;
                        }
                    }
                };
            default:
                final int i11 = 1;
                final e eVar2 = this.f15682b;
                return new Function0() { // from class: au.a
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        switch (i11) {
                            case 0:
                                return ((PaymentConfiguration) eVar2.get()).f42440a;
                            default:
                                return ((PaymentConfiguration) eVar2.get()).f42441b;
                        }
                    }
                };
        }
    }
}
