package com.instabridge.ai.chat.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000e\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/chat/model/AnswerReportReason;", b.f42142b, "wireValue", b.f42142b, "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getWireValue", "()Ljava/lang/String;", "SEXUAL", "VIOLENT", "HATEFUL", "HARASSMENT", "SELF_HARM", "DANGEROUS_OR_ILLEGAL", "MISLEADING", "PRIVACY", NativeAdContent.ViewTag.OTHER, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AnswerReportReason {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AnswerReportReason[] $VALUES;

    @NotNull
    private final String wireValue;
    public static final AnswerReportReason SEXUAL = new AnswerReportReason("SEXUAL", 0, "sexual");
    public static final AnswerReportReason VIOLENT = new AnswerReportReason("VIOLENT", 1, "violent");
    public static final AnswerReportReason HATEFUL = new AnswerReportReason("HATEFUL", 2, "hateful");
    public static final AnswerReportReason HARASSMENT = new AnswerReportReason("HARASSMENT", 3, "harassment");
    public static final AnswerReportReason SELF_HARM = new AnswerReportReason("SELF_HARM", 4, "self_harm");
    public static final AnswerReportReason DANGEROUS_OR_ILLEGAL = new AnswerReportReason("DANGEROUS_OR_ILLEGAL", 5, "dangerous_or_illegal");
    public static final AnswerReportReason MISLEADING = new AnswerReportReason("MISLEADING", 6, "misleading");
    public static final AnswerReportReason PRIVACY = new AnswerReportReason("PRIVACY", 7, "privacy");
    public static final AnswerReportReason OTHER = new AnswerReportReason(NativeAdContent.ViewTag.OTHER, 8, InneractiveMediationNameConsts.OTHER);

    private static final /* synthetic */ AnswerReportReason[] $values() {
        return new AnswerReportReason[]{SEXUAL, VIOLENT, HATEFUL, HARASSMENT, SELF_HARM, DANGEROUS_OR_ILLEGAL, MISLEADING, PRIVACY, OTHER};
    }

    static {
        AnswerReportReason[] answerReportReasonArr$values = $values();
        $VALUES = answerReportReasonArr$values;
        $ENTRIES = EnumEntriesKt.a(answerReportReasonArr$values);
    }

    private AnswerReportReason(String str, int i5, String str2) {
        this.wireValue = str2;
    }

    @NotNull
    public static EnumEntries<AnswerReportReason> getEntries() {
        return $ENTRIES;
    }

    public static AnswerReportReason valueOf(String str) {
        return (AnswerReportReason) Enum.valueOf(AnswerReportReason.class, str);
    }

    public static AnswerReportReason[] values() {
        return (AnswerReportReason[]) $VALUES.clone();
    }

    @NotNull
    public final String getWireValue() {
        return this.wireValue;
    }
}
