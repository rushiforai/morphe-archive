package com.vungle.ads.fpd;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;

@Metadata(bv = {}, d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\b\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/vungle/ads/fpd/LiftoffGender;", b.f42142b, b.f42142b, "a", "I", "getValue", "()I", "value", "FEMALE", "MALE", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public enum LiftoffGender {
    FEMALE(0),
    MALE(1);


    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final int value;

    LiftoffGender(int i5) {
        this.value = i5;
    }

    public final int getValue() {
        return this.value;
    }
}
