package io;

import com.instabridge.ai.auth.AiAccessDecision;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class e {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f66523a;

    static {
        int[] iArr = new int[AiAccessDecision.values().length];
        try {
            iArr[AiAccessDecision.Allowed.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[AiAccessDecision.PromptRequired.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[AiAccessDecision.BlockedUnavailable.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        f66523a = iArr;
    }
}
