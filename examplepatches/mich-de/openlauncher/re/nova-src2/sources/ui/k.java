package ui;

import ads_mobile_sdk.bu1;
import ads_mobile_sdk.el;
import kotlin.jvm.internal.Intrinsics;
import ni.v;

/* loaded from: classes.dex */
public interface k {
    default void a(el bannerAd) {
        Intrinsics.g(bannerAd, "bannerAd");
    }

    void b(bu1 bu1Var);

    void onAdFailedToLoad(v vVar);
}
