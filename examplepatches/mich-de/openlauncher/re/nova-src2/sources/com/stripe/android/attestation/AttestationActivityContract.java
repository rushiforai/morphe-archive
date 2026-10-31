package com.stripe.android.attestation;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import b70.g;
import com.stripe.android.attestation.AttestationActivityResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import vm.d;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0002B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/attestation/AttestationActivityContract;", "Lk/b;", "Lfq/b;", "Lcom/stripe/android/attestation/AttestationActivityResult;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AttestationActivityContract extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        fq.b input = (fq.b) obj;
        Intrinsics.g(input, "input");
        int i5 = AttestationActivity.f42458q;
        Intent intentPutExtra = new Intent(context, (Class<?>) AttestationActivity.class).putExtra("attestation_args", new AttestationArgs(input.f55568a, g.I1(input.f55569b)));
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Bundle extras;
        AttestationActivityResult attestationActivityResult = (intent == null || (extras = intent.getExtras()) == null) ? null : (AttestationActivityResult) d.i(extras, "com.stripe.android.attestation.AttestationActivityContract.extra_result", AttestationActivityResult.class);
        return attestationActivityResult == null ? new AttestationActivityResult.Failed(new IllegalStateException("No result received from AttestationActivity")) : attestationActivityResult;
    }
}
