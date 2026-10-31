package eu;

import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract;
import j.h;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements d {

    /* renamed from: a, reason: collision with root package name */
    public final h f53022a;

    /* renamed from: b, reason: collision with root package name */
    public final String f53023b;

    /* renamed from: c, reason: collision with root package name */
    public final mu.b f53024c;

    public a(h hVar, String str, mu.b bVar) {
        this.f53022a = hVar;
        this.f53023b = str;
        this.f53024c = bVar;
    }

    @Override // eu.d
    public final void a() {
        this.f53022a.b();
    }

    @Override // eu.d
    public final void b(String publishableKey, String str, CollectBankAccountConfiguration collectBankAccountConfiguration, String elementsSessionId, String str2, Integer num, String str3) throws Exception {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(elementsSessionId, "elementsSessionId");
        this.f53022a.a(new CollectBankAccountContract.Args.ForDeferredPaymentIntent(publishableKey, str, collectBankAccountConfiguration, this.f53024c, this.f53023b, elementsSessionId, null, str2, num, str3), null);
    }

    @Override // eu.d
    public final void c(String publishableKey, String str, CollectBankAccountConfiguration collectBankAccountConfiguration, String elementsSessionId, String str2) throws Exception {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(elementsSessionId, "elementsSessionId");
        this.f53022a.a(new CollectBankAccountContract.Args.ForDeferredSetupIntent(publishableKey, str, collectBankAccountConfiguration, this.f53023b, this.f53024c, elementsSessionId, null, str2), null);
    }

    @Override // eu.d
    public final void d(String publishableKey, String str, String clientSecret, CollectBankAccountConfiguration collectBankAccountConfiguration) throws Exception {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(clientSecret, "clientSecret");
        this.f53022a.a(new CollectBankAccountContract.Args.ForPaymentIntent(publishableKey, str, clientSecret, collectBankAccountConfiguration, false, this.f53024c, this.f53023b), null);
    }

    @Override // eu.d
    public final void e(String publishableKey, String str, String clientSecret, CollectBankAccountConfiguration collectBankAccountConfiguration) throws Exception {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(clientSecret, "clientSecret");
        this.f53022a.a(new CollectBankAccountContract.Args.ForSetupIntent(publishableKey, str, clientSecret, collectBankAccountConfiguration, false, this.f53024c, this.f53023b), null);
    }
}
