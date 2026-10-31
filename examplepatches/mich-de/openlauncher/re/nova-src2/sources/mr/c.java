package mr;

import as.h;
import com.stripe.android.PaymentConfiguration;
import kotlin.jvm.functions.Function0;
import s40.d;

/* loaded from: classes4.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76623a;

    /* renamed from: b, reason: collision with root package name */
    public final h f76624b;

    public /* synthetic */ c(h hVar, int i5) {
        this.f76623a = i5;
        this.f76624b = hVar;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f76623a) {
            case 0:
                final int i5 = 1;
                final h hVar = this.f76624b;
                return new Function0() { // from class: mr.a
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        switch (i5) {
                            case 0:
                                return ((PaymentConfiguration) hVar.get()).f42441b;
                            default:
                                return ((PaymentConfiguration) hVar.get()).f42440a;
                        }
                    }
                };
            default:
                final int i11 = 0;
                final h hVar2 = this.f76624b;
                return new Function0() { // from class: mr.a
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        switch (i11) {
                            case 0:
                                return ((PaymentConfiguration) hVar2.get()).f42441b;
                            default:
                                return ((PaymentConfiguration) hVar2.get()).f42440a;
                        }
                    }
                };
        }
    }
}
