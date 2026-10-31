package com.stripe.android.challenge.passive;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import b70.g;
import com.stripe.android.challenge.passive.PassiveChallengeActivityResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import vm.d;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0002B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/challenge/passive/PassiveChallengeActivityContract;", "Lk/b;", "Lkq/c;", "Lcom/stripe/android/challenge/passive/PassiveChallengeActivityResult;", "<init>", "()V", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PassiveChallengeActivityContract extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        kq.c input = (kq.c) obj;
        Intrinsics.g(input, "input");
        int i5 = PassiveChallengeActivity.f42506q;
        Intent intentPutExtra = new Intent(context, (Class<?>) PassiveChallengeActivity.class).putExtra("passive_challenge_args", new PassiveChallengeArgs(input.f72117a, input.f72118b, g.I1(input.f72119c)));
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Bundle extras;
        PassiveChallengeActivityResult passiveChallengeActivityResult = (intent == null || (extras = intent.getExtras()) == null) ? null : (PassiveChallengeActivityResult) d.i(extras, "com.stripe.android.challenge.PassiveChallengeActivityContract.extra_result", PassiveChallengeActivityResult.class);
        return passiveChallengeActivityResult == null ? new PassiveChallengeActivityResult.Failed(new Throwable("No result")) : passiveChallengeActivityResult;
    }
}
