package com.facebook.ads;

import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public interface S2SRewardedVideoAdListener extends RewardedVideoAdListener {
    void onRewardServerFailed();

    void onRewardServerSuccess();
}
