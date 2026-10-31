package fq;

import com.stripe.android.attestation.AttestationActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class a extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f55566j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ AttestationActivity f55567k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(AttestationActivity attestationActivity, int i5) {
        super(0);
        this.f55566j = i5;
        this.f55567k = attestationActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f55566j) {
            case 0:
                return this.f55567k.getViewModelStore();
            default:
                return this.f55567k.getDefaultViewModelCreationExtras();
        }
    }
}
