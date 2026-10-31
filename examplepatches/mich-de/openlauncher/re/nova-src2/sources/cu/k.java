package cu;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import java.util.Set;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class k implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47948a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.h f47949b;

    /* renamed from: c, reason: collision with root package name */
    public final s40.h f47950c;

    /* renamed from: d, reason: collision with root package name */
    public final s40.h f47951d;

    /* renamed from: e, reason: collision with root package name */
    public final s40.d f47952e;

    public /* synthetic */ k(int i5, s40.d dVar, s40.h hVar, s40.h hVar2, s40.h hVar3) {
        this.f47948a = i5;
        this.f47949b = hVar;
        this.f47950c = hVar2;
        this.f47951d = hVar3;
        this.f47952e = dVar;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f47948a) {
            case 0:
                return new j((ou.c) this.f47949b.get(), (PaymentMethodMetadata) this.f47950c.get(), (i) this.f47951d.get(), (h) ((as.f) this.f47952e).get());
            default:
                return new com.stripe.android.payments.core.authentication.threeds2.a((dq.k) this.f47949b.get(), ((Boolean) ((s40.e) this.f47950c).f86659a).booleanValue(), (Function0) ((s40.e) this.f47951d).f86659a, (Set) ((s40.e) this.f47952e).f86659a);
        }
    }
}
