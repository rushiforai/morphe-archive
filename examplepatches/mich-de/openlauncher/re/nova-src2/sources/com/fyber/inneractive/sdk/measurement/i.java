package com.fyber.inneractive.sdk.measurement;

/* loaded from: classes3.dex */
public enum i {
    VERIFICATION_RESOURCE_REJECTED(1),
    VERIFICATION_NOT_SUPPORTED(2),
    ERROR_DURING_RESOURCE_LOAD(3);

    int mReason;

    i(int i5) {
        this.mReason = i5;
    }
}
