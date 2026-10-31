package com.instabridge.ai.chat.ui;

import kotlin.Metadata;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\b2\b\u0010\t\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\nR\u0012\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0006¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/chat/ui/ProgressSequenceGuard;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "lastSequence", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/lang/Long;", "shouldAccept", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sequence", "(Ljava/lang/Long;)Z", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ProgressSequenceGuard {
    public static final int $stable = 8;

    @Nullable
    private Long lastSequence;

    public final boolean shouldAccept(@Nullable Long sequence) {
        if (sequence == null) {
            return true;
        }
        Long l9 = this.lastSequence;
        if (l9 != null && sequence.longValue() <= l9.longValue()) {
            return false;
        }
        this.lastSequence = sequence;
        return true;
    }
}
