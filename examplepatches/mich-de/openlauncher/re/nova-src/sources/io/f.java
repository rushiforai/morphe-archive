package io;

import com.instabridge.ai.auth.AiConsentErrorCategory;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class f {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f66524a;

    static {
        int[] iArr = new int[AiConsentErrorCategory.values().length];
        try {
            iArr[AiConsentErrorCategory.NETWORK.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[AiConsentErrorCategory.UNAVAILABLE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        f66524a = iArr;
    }
}
