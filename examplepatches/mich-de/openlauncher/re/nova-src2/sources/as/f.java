package as;

import android.content.Context;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$Config;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentelement.EmbeddedPaymentElement$Configuration;
import fr.n0;
import fs.h0;
import java.util.Set;
import jt.c1;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import ou.g2;
import t70.j0;

/* loaded from: classes4.dex */
public final class f implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15600a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.h f15601b;

    /* renamed from: c, reason: collision with root package name */
    public final s40.h f15602c;

    /* renamed from: d, reason: collision with root package name */
    public final s40.h f15603d;

    /* renamed from: e, reason: collision with root package name */
    public final s40.h f15604e;

    /* renamed from: f, reason: collision with root package name */
    public final s40.h f15605f;

    /* renamed from: g, reason: collision with root package name */
    public final s40.h f15606g;

    public /* synthetic */ f(s40.h hVar, s40.h hVar2, s40.h hVar3, s40.h hVar4, s40.h hVar5, s40.h hVar6, int i5) {
        this.f15600a = i5;
        this.f15601b = hVar;
        this.f15602c = hVar2;
        this.f15603d = hVar3;
        this.f15604e = hVar4;
        this.f15605f = hVar5;
        this.f15606g = hVar6;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f15600a) {
            case 0:
                Context context = (Context) this.f15601b.get();
                GooglePayPaymentMethodLauncher$Config googlePayConfig = (GooglePayPaymentMethodLauncher$Config) this.f15602c.get();
                xq.c logger = (xq.c) this.f15603d.get();
                iu.f errorReporter = (iu.f) this.f15604e.get();
                CardBrandFilter cardBrandFilter = (CardBrandFilter) this.f15605f.get();
                CardFundingFilter cardFundingFilter = (CardFundingFilter) this.f15606g.get();
                Intrinsics.g(context, "context");
                Intrinsics.g(googlePayConfig, "googlePayConfig");
                Intrinsics.g(logger, "logger");
                Intrinsics.g(errorReporter, "errorReporter");
                Intrinsics.g(cardBrandFilter, "cardBrandFilter");
                Intrinsics.g(cardFundingFilter, "cardFundingFilter");
                Context applicationContext = context.getApplicationContext();
                Intrinsics.f(applicationContext, "getApplicationContext(...)");
                return new e(applicationContext, googlePayConfig.f42794a, t2.c.p(googlePayConfig.f42798e), googlePayConfig.f42799f, googlePayConfig.f42800g, new g(context), errorReporter, logger, cardBrandFilter, cardFundingFilter, googlePayConfig.f42801h);
            case 1:
                return new bu.i((PaymentMethodMetadata) this.f15601b.get(), (au.i) this.f15602c.get(), (EmbeddedPaymentElement$Configuration) this.f15603d.get(), (bu.b0) this.f15604e.get(), (ru.d) this.f15605f.get(), (j0) this.f15606g.get());
            case 2:
                return new cu.c((PaymentMethodMetadata) this.f15601b.get(), (ou.c) this.f15602c.get(), (au.i) this.f15603d.get(), (g2) this.f15604e.get(), (ru.d) this.f15605f.get(), this.f15606g);
            case 3:
                return new cu.g(this.f15601b, (PaymentMethodMetadata) this.f15602c.get(), (ou.c) this.f15603d.get(), (au.i) this.f15604e.get(), (ru.d) this.f15605f.get(), this.f15606g);
            case 4:
                return new fv.i((c1) this.f15601b.get(), this.f15602c, (xq.c) this.f15603d.get(), (iu.f) this.f15604e.get(), (CoroutineContext) this.f15605f.get(), (Set) this.f15606g.get());
            case 5:
                return new gs.b((fr.l) this.f15601b.get(), (jt.a) this.f15602c.get(), (iu.f) this.f15603d.get(), (CoroutineContext) this.f15604e.get(), (xq.c) this.f15605f.get(), (ir.c) this.f15606g.get());
            case 6:
                return new hs.b((js.a) this.f15601b.get(), (xw.c) this.f15602c.get(), (h0) this.f15603d.get(), (LinkConfiguration) this.f15604e.get(), (iu.f) this.f15605f.get(), (CoroutineContext) this.f15606g.get());
            default:
                return new ku.d((c1) this.f15601b.get(), (fr.l) this.f15602c.get(), (jt.a) this.f15603d.get(), (n0) this.f15604e.get(), (xq.c) this.f15605f.get(), (CoroutineContext) this.f15606g.get());
        }
    }
}
