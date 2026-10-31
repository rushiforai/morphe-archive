package com.instabridge.ai.chat.model;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/instabridge/ai/chat/model/FeedbackState;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "LIKED", "DISLIKED", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class FeedbackState {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ FeedbackState[] $VALUES;
    public static final FeedbackState LIKED = new FeedbackState("LIKED", 0);
    public static final FeedbackState DISLIKED = new FeedbackState("DISLIKED", 1);

    private static final /* synthetic */ FeedbackState[] $values() {
        return new FeedbackState[]{LIKED, DISLIKED};
    }

    static {
        FeedbackState[] feedbackStateArr$values = $values();
        $VALUES = feedbackStateArr$values;
        $ENTRIES = EnumEntriesKt.a(feedbackStateArr$values);
    }

    private FeedbackState(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<FeedbackState> getEntries() {
        return $ENTRIES;
    }

    public static FeedbackState valueOf(String str) {
        return (FeedbackState) Enum.valueOf(FeedbackState.class, str);
    }

    public static FeedbackState[] values() {
        return (FeedbackState[]) $VALUES.clone();
    }
}
