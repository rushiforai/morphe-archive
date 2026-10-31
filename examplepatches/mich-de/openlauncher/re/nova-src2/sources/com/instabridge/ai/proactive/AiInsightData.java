package com.instabridge.ai.proactive;

import androidx.recyclerview.widget.u1;
import aq.o;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b2\b\u0087\b\u0018\u00002\u00020\u0001B\u00ad\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0003\u0010\u0004\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0003\u0010\t\u001a\u00020\n\u0012\n\b\u0003\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0003\u0010\f\u001a\u00020\r\u0012\b\b\u0003\u0010\u000e\u001a\u00020\u000f\u0012\n\b\u0003\u0010\u0010\u001a\u0004\u0018\u00010\u0001\u0012\n\b\u0003\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0003\u0010\u0012\u001a\u00020\u000f\u0012\b\b\u0003\u0010\u0013\u001a\u00020\u0003\u0012\b\b\u0003\u0010\u0014\u001a\u00020\u0015\u0012\n\b\u0003\u0010\u0016\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0003\u0010\u0017\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\u0018\u0010\u0019J\t\u00102\u001a\u00020\u0003HÆ\u0003J\t\u00103\u001a\u00020\u0003HÆ\u0003J\u000f\u00104\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J\u000b\u00105\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u00106\u001a\u00020\nHÆ\u0003J\u000b\u00107\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u00108\u001a\u00020\rHÆ\u0003J\t\u00109\u001a\u00020\u000fHÆ\u0003J\u000b\u0010:\u001a\u0004\u0018\u00010\u0001HÆ\u0003J\u000b\u0010;\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010<\u001a\u00020\u000fHÆ\u0003J\t\u0010=\u001a\u00020\u0003HÆ\u0003J\t\u0010>\u001a\u00020\u0015HÆ\u0003J\u0010\u0010?\u001a\u0004\u0018\u00010\u000fHÆ\u0003¢\u0006\u0002\u0010/J\u0010\u0010@\u001a\u0004\u0018\u00010\u000fHÆ\u0003¢\u0006\u0002\u0010/J¶\u0001\u0010A\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u00032\b\b\u0003\u0010\t\u001a\u00020\n2\n\b\u0003\u0010\u000b\u001a\u0004\u0018\u00010\u00032\b\b\u0003\u0010\f\u001a\u00020\r2\b\b\u0003\u0010\u000e\u001a\u00020\u000f2\n\b\u0003\u0010\u0010\u001a\u0004\u0018\u00010\u00012\n\b\u0003\u0010\u0011\u001a\u0004\u0018\u00010\u00032\b\b\u0003\u0010\u0012\u001a\u00020\u000f2\b\b\u0003\u0010\u0013\u001a\u00020\u00032\b\b\u0003\u0010\u0014\u001a\u00020\u00152\n\b\u0003\u0010\u0016\u001a\u0004\u0018\u00010\u000f2\n\b\u0003\u0010\u0017\u001a\u0004\u0018\u00010\u000fHÆ\u0001¢\u0006\u0002\u0010BJ\u0013\u0010C\u001a\u00020\u00152\b\u0010D\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010E\u001a\u00020\u000fHÖ\u0001J\t\u0010F\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010\u001bR\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b \u0010!R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u001bR\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b#\u0010$R\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b%\u0010&R\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u0001¢\u0006\b\n\u0000\u001a\u0004\b'\u0010(R\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b)\u0010\u001bR\u0011\u0010\u0012\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b*\u0010&R\u0011\u0010\u0013\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b+\u0010\u001bR\u0011\u0010\u0014\u001a\u00020\u0015¢\u0006\b\n\u0000\u001a\u0004\b,\u0010-R\u0015\u0010\u0016\u001a\u0004\u0018\u00010\u000f¢\u0006\n\n\u0002\u00100\u001a\u0004\b.\u0010/R\u0015\u0010\u0017\u001a\u0004\u0018\u00010\u000f¢\u0006\n\n\u0002\u00100\u001a\u0004\b1\u0010/¨\u0006G"}, d2 = {"Lcom/instabridge/ai/proactive/AiInsightData;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "chipText", "actions", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/proactive/AiInsightAction;", "preloadedResponse", "budgetTier", "Lcom/instabridge/ai/proactive/AiBudgetTier;", "chatPrompt", "fetchedAt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, AiDatabase.COL_INSIGHT_SCORE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "expiresAtRaw", "eventDate", AiDatabase.COL_INSIGHT_CAT, "emoji", "notify", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "sensitivity", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/instabridge/ai/proactive/AiBudgetTier;Ljava/lang/String;JILjava/lang/Object;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/Integer;Ljava/lang/Integer;)V", "getText", "()Ljava/lang/String;", "getChipText", "getActions", "()Ljava/util/List;", "getPreloadedResponse", "getBudgetTier", "()Lcom/instabridge/ai/proactive/AiBudgetTier;", "getChatPrompt", "getFetchedAt", "()J", "getScore", "()I", "getExpiresAtRaw", "()Ljava/lang/Object;", "getEventDate", "getCat", "getEmoji", "getNotify", "()Z", "getValue", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getSensitivity", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/instabridge/ai/proactive/AiBudgetTier;Ljava/lang/String;JILjava/lang/Object;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/Integer;Ljava/lang/Integer;)Lcom/instabridge/ai/proactive/AiInsightData;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AiInsightData {
    public static final int $stable = 8;

    @NotNull
    private final List<AiInsightAction> actions;

    @NotNull
    private final AiBudgetTier budgetTier;
    private final int cat;

    @Nullable
    private final String chatPrompt;

    @NotNull
    private final String chipText;

    @NotNull
    private final String emoji;

    @Nullable
    private final String eventDate;

    @Nullable
    private final Object expiresAtRaw;
    private final long fetchedAt;
    private final boolean notify;

    @Nullable
    private final String preloadedResponse;
    private final int score;

    @Nullable
    private final Integer sensitivity;

    @NotNull
    private final String text;

    @Nullable
    private final Integer value;

    public AiInsightData(@NotNull String text, @o(name = "chip_text") @NotNull String chipText, @NotNull List<AiInsightAction> actions, @o(name = "preloaded_response") @Nullable String str, @o(name = "budget_tier") @NotNull AiBudgetTier budgetTier, @o(name = "chat_prompt") @Nullable String str2, @o(name = "fetched_at") long j11, @o(name = AiDatabase.COL_INSIGHT_SCORE) @ScoreJson int i5, @o(name = "expires_at") @Nullable Object obj, @o(name = "event_date") @Nullable String str3, @o(name = AiDatabase.COL_INSIGHT_CAT) int i11, @o(name = "emoji") @NotNull String emoji, @o(name = "notify") boolean z11, @o(name = "value") @Nullable Integer num, @o(name = "sensitivity") @Nullable Integer num2) {
        Intrinsics.g(text, "text");
        Intrinsics.g(chipText, "chipText");
        Intrinsics.g(actions, "actions");
        Intrinsics.g(budgetTier, "budgetTier");
        Intrinsics.g(emoji, "emoji");
        this.text = text;
        this.chipText = chipText;
        this.actions = actions;
        this.preloadedResponse = str;
        this.budgetTier = budgetTier;
        this.chatPrompt = str2;
        this.fetchedAt = j11;
        this.score = i5;
        this.expiresAtRaw = obj;
        this.eventDate = str3;
        this.cat = i11;
        this.emoji = emoji;
        this.notify = z11;
        this.value = num;
        this.sensitivity = num2;
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getText() {
        return this.text;
    }

    @Nullable
    /* renamed from: component10, reason: from getter */
    public final String getEventDate() {
        return this.eventDate;
    }

    /* renamed from: component11, reason: from getter */
    public final int getCat() {
        return this.cat;
    }

    @NotNull
    /* renamed from: component12, reason: from getter */
    public final String getEmoji() {
        return this.emoji;
    }

    /* renamed from: component13, reason: from getter */
    public final boolean getNotify() {
        return this.notify;
    }

    @Nullable
    /* renamed from: component14, reason: from getter */
    public final Integer getValue() {
        return this.value;
    }

    @Nullable
    /* renamed from: component15, reason: from getter */
    public final Integer getSensitivity() {
        return this.sensitivity;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getChipText() {
        return this.chipText;
    }

    @NotNull
    public final List<AiInsightAction> component3() {
        return this.actions;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getPreloadedResponse() {
        return this.preloadedResponse;
    }

    @NotNull
    /* renamed from: component5, reason: from getter */
    public final AiBudgetTier getBudgetTier() {
        return this.budgetTier;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getChatPrompt() {
        return this.chatPrompt;
    }

    /* renamed from: component7, reason: from getter */
    public final long getFetchedAt() {
        return this.fetchedAt;
    }

    /* renamed from: component8, reason: from getter */
    public final int getScore() {
        return this.score;
    }

    @Nullable
    /* renamed from: component9, reason: from getter */
    public final Object getExpiresAtRaw() {
        return this.expiresAtRaw;
    }

    @NotNull
    public final AiInsightData copy(@NotNull String text, @o(name = "chip_text") @NotNull String chipText, @NotNull List<AiInsightAction> actions, @o(name = "preloaded_response") @Nullable String preloadedResponse, @o(name = "budget_tier") @NotNull AiBudgetTier budgetTier, @o(name = "chat_prompt") @Nullable String chatPrompt, @o(name = "fetched_at") long fetchedAt, @o(name = AiDatabase.COL_INSIGHT_SCORE) @ScoreJson int score, @o(name = "expires_at") @Nullable Object expiresAtRaw, @o(name = "event_date") @Nullable String eventDate, @o(name = AiDatabase.COL_INSIGHT_CAT) int cat, @o(name = "emoji") @NotNull String emoji, @o(name = "notify") boolean notify, @o(name = "value") @Nullable Integer value, @o(name = "sensitivity") @Nullable Integer sensitivity) {
        Intrinsics.g(text, "text");
        Intrinsics.g(chipText, "chipText");
        Intrinsics.g(actions, "actions");
        Intrinsics.g(budgetTier, "budgetTier");
        Intrinsics.g(emoji, "emoji");
        return new AiInsightData(text, chipText, actions, preloadedResponse, budgetTier, chatPrompt, fetchedAt, score, expiresAtRaw, eventDate, cat, emoji, notify, value, sensitivity);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AiInsightData)) {
            return false;
        }
        AiInsightData aiInsightData = (AiInsightData) other;
        return Intrinsics.b(this.text, aiInsightData.text) && Intrinsics.b(this.chipText, aiInsightData.chipText) && Intrinsics.b(this.actions, aiInsightData.actions) && Intrinsics.b(this.preloadedResponse, aiInsightData.preloadedResponse) && this.budgetTier == aiInsightData.budgetTier && Intrinsics.b(this.chatPrompt, aiInsightData.chatPrompt) && this.fetchedAt == aiInsightData.fetchedAt && this.score == aiInsightData.score && Intrinsics.b(this.expiresAtRaw, aiInsightData.expiresAtRaw) && Intrinsics.b(this.eventDate, aiInsightData.eventDate) && this.cat == aiInsightData.cat && Intrinsics.b(this.emoji, aiInsightData.emoji) && this.notify == aiInsightData.notify && Intrinsics.b(this.value, aiInsightData.value) && Intrinsics.b(this.sensitivity, aiInsightData.sensitivity);
    }

    @NotNull
    public final List<AiInsightAction> getActions() {
        return this.actions;
    }

    @NotNull
    public final AiBudgetTier getBudgetTier() {
        return this.budgetTier;
    }

    public final int getCat() {
        return this.cat;
    }

    @Nullable
    public final String getChatPrompt() {
        return this.chatPrompt;
    }

    @NotNull
    public final String getChipText() {
        return this.chipText;
    }

    @NotNull
    public final String getEmoji() {
        return this.emoji;
    }

    @Nullable
    public final String getEventDate() {
        return this.eventDate;
    }

    @Nullable
    public final Object getExpiresAtRaw() {
        return this.expiresAtRaw;
    }

    public final long getFetchedAt() {
        return this.fetchedAt;
    }

    public final boolean getNotify() {
        return this.notify;
    }

    @Nullable
    public final String getPreloadedResponse() {
        return this.preloadedResponse;
    }

    public final int getScore() {
        return this.score;
    }

    @Nullable
    public final Integer getSensitivity() {
        return this.sensitivity;
    }

    @NotNull
    public final String getText() {
        return this.text;
    }

    @Nullable
    public final Integer getValue() {
        return this.value;
    }

    public int hashCode() {
        int iC = u4.c(c0.e(this.text.hashCode() * 31, 31, this.chipText), 31, this.actions);
        String str = this.preloadedResponse;
        int iHashCode = (this.budgetTier.hashCode() + ((iC + (str == null ? 0 : str.hashCode())) * 31)) * 31;
        String str2 = this.chatPrompt;
        int iA = u4.a(this.score, c0.d((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.fetchedAt), 31);
        Object obj = this.expiresAtRaw;
        int iHashCode2 = (iA + (obj == null ? 0 : obj.hashCode())) * 31;
        String str3 = this.eventDate;
        int iF = c9.f(c0.e(u4.a(this.cat, (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31, 31), 31, this.emoji), 31, this.notify);
        Integer num = this.value;
        int iHashCode3 = (iF + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.sensitivity;
        return iHashCode3 + (num2 != null ? num2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AiInsightData(text=");
        sb2.append(this.text);
        sb2.append(", chipText=");
        sb2.append(this.chipText);
        sb2.append(", actions=");
        sb2.append(this.actions);
        sb2.append(", preloadedResponse=");
        sb2.append(this.preloadedResponse);
        sb2.append(", budgetTier=");
        sb2.append(this.budgetTier);
        sb2.append(", chatPrompt=");
        sb2.append(this.chatPrompt);
        sb2.append(", fetchedAt=");
        sb2.append(this.fetchedAt);
        sb2.append(", score=");
        sb2.append(this.score);
        sb2.append(", expiresAtRaw=");
        sb2.append(this.expiresAtRaw);
        sb2.append(", eventDate=");
        sb2.append(this.eventDate);
        sb2.append(", cat=");
        sb2.append(this.cat);
        sb2.append(", emoji=");
        sb2.append(this.emoji);
        sb2.append(", notify=");
        sb2.append(this.notify);
        sb2.append(", value=");
        sb2.append(this.value);
        sb2.append(", sensitivity=");
        return a2.c.o(sb2, this.sensitivity, ')');
    }

    public AiInsightData(String str, String str2, List list, String str3, AiBudgetTier aiBudgetTier, String str4, long j11, int i5, Object obj, String str5, int i11, String str6, boolean z11, Integer num, Integer num2, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i12 & 2) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2, (i12 & 4) != 0 ? EmptyList.f71733a : list, (i12 & 8) != 0 ? null : str3, (i12 & 16) != 0 ? AiBudgetTier.T0 : aiBudgetTier, (i12 & 32) != 0 ? null : str4, (i12 & 64) != 0 ? System.currentTimeMillis() : j11, (i12 & 128) != 0 ? 50 : i5, (i12 & 256) != 0 ? null : obj, (i12 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : str5, (i12 & 1024) != 0 ? 0 : i11, (i12 & 2048) != 0 ? "✨" : str6, (i12 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0 ? z11 : false, (i12 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : num, (i12 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : num2);
    }
}
