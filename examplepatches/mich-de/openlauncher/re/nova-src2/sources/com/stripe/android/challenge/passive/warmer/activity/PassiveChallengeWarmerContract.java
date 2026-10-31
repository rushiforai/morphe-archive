package com.stripe.android.challenge.passive.warmer.activity;

import android.content.Context;
import android.content.Intent;
import b70.g;
import k.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import mq.c;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0002B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/challenge/passive/warmer/activity/PassiveChallengeWarmerContract;", "Lk/b;", "Lmq/c;", "Lcom/stripe/android/challenge/passive/warmer/activity/PassiveChallengeWarmerCompleted;", "<init>", "()V", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PassiveChallengeWarmerContract extends b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        c input = (c) obj;
        Intrinsics.g(input, "input");
        int i5 = PassiveChallengeWarmerActivity.f42518q;
        Intent intentPutExtra = new Intent(context, (Class<?>) PassiveChallengeWarmerActivity.class).putExtra("passive_challenge_warmer_args", new PassiveChallengeWarmerArgs(input.f76605a, input.f76606b, g.I1(input.f76607c)));
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final /* bridge */ /* synthetic */ Object parseResult(int i5, Intent intent) {
        return PassiveChallengeWarmerCompleted.f42523a;
    }
}
