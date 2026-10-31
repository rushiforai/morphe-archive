package com.instabridge.ai.context.collectors;

import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.proactive.AiDatabase;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b2\b\u0087\b\u0018\u0000 G2\u00020\u0001:\u0001GB\u00ad\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\u0006\u0012\b\b\u0002\u0010\n\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0006\u0012\b\b\u0002\u0010\f\u001a\u00020\b\u0012\b\b\u0002\u0010\r\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0006\u0012\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00030\u0010\u0012\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00030\u0010\u0012\b\b\u0002\u0010\u0012\u001a\u00020\u0013\u0012\b\b\u0002\u0010\u0014\u001a\u00020\b\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\t\u00102\u001a\u00020\u0003HÆ\u0003J\u000b\u00103\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u00104\u001a\u00020\u0006HÆ\u0003J\t\u00105\u001a\u00020\bHÆ\u0003J\t\u00106\u001a\u00020\u0006HÆ\u0003J\t\u00107\u001a\u00020\u0006HÆ\u0003J\t\u00108\u001a\u00020\u0006HÆ\u0003J\t\u00109\u001a\u00020\bHÆ\u0003J\t\u0010:\u001a\u00020\u0006HÆ\u0003J\u0010\u0010;\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010&J\u000f\u0010<\u001a\b\u0012\u0004\u0012\u00020\u00030\u0010HÆ\u0003J\u000f\u0010=\u001a\b\u0012\u0004\u0012\u00020\u00030\u0010HÆ\u0003J\t\u0010>\u001a\u00020\u0013HÆ\u0003J\t\u0010?\u001a\u00020\bHÆ\u0003J\u000b\u0010@\u001a\u0004\u0018\u00010\u0016HÆ\u0003J¶\u0001\u0010A\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\u00062\b\b\u0002\u0010\n\u001a\u00020\u00062\b\b\u0002\u0010\u000b\u001a\u00020\u00062\b\b\u0002\u0010\f\u001a\u00020\b2\b\b\u0002\u0010\r\u001a\u00020\u00062\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00062\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00030\u00102\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00030\u00102\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\b2\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0016HÆ\u0001¢\u0006\u0002\u0010BJ\u0013\u0010C\u001a\u00020\b2\b\u0010D\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010E\u001a\u00020\u0006HÖ\u0001J\t\u0010F\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001aR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001aR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0011\u0010\t\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u001dR\u0011\u0010\n\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u001dR\u0011\u0010\u000b\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u001dR\u0011\u0010\f\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u001fR\u0011\u0010\r\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b$\u0010\u001dR\u0015\u0010\u000e\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010'\u001a\u0004\b%\u0010&R\u0017\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00030\u0010¢\u0006\b\n\u0000\u001a\u0004\b(\u0010)R\u0017\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00030\u0010¢\u0006\b\n\u0000\u001a\u0004\b*\u0010)R\u0011\u0010\u0012\u001a\u00020\u0013¢\u0006\b\n\u0000\u001a\u0004\b+\u0010,R\u0011\u0010\u0014\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u001fR\u0013\u0010\u0015\u001a\u0004\u0018\u00010\u0016¢\u0006\b\n\u0000\u001a\u0004\b-\u0010.R\u0011\u0010/\u001a\u00020\b8F¢\u0006\u0006\u001a\u0004\b/\u0010\u001fR\u0011\u00100\u001a\u00020\b8F¢\u0006\u0006\u001a\u0004\b1\u0010\u001f¨\u0006H"}, d2 = {"Lcom/instabridge/ai/context/collectors/ContactEntry;", b.f42142b, PendingUpgradeStore.KEY_NAME, b.f42142b, "nickname", AiDatabase.COL_INSIGHT_SCORE, b.f42142b, "starred", b.f42142b, "callCount", "smsCount", "timesContacted", "hasPhoto", "phoneCount", "lastContactDaysAgo", "phoneNumbers", b.f42142b, "emails", "contactId", b.f42142b, "isFrequent", "lastMessage", "Lcom/instabridge/ai/context/collectors/RecentMessage;", "<init>", "(Ljava/lang/String;Ljava/lang/String;IZIIIZILjava/lang/Integer;Ljava/util/List;Ljava/util/List;JZLcom/instabridge/ai/context/collectors/RecentMessage;)V", "getName", "()Ljava/lang/String;", "getNickname", "getScore", "()I", "getStarred", "()Z", "getCallCount", "getSmsCount", "getTimesContacted", "getHasPhoto", "getPhoneCount", "getLastContactDaysAgo", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getPhoneNumbers", "()Ljava/util/List;", "getEmails", "getContactId", "()J", "getLastMessage", "()Lcom/instabridge/ai/context/collectors/RecentMessage;", "isCloseContact", "canMessage", "getCanMessage", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "copy", "(Ljava/lang/String;Ljava/lang/String;IZIIIZILjava/lang/Integer;Ljava/util/List;Ljava/util/List;JZLcom/instabridge/ai/context/collectors/RecentMessage;)Lcom/instabridge/ai/context/collectors/ContactEntry;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ContactEntry {
    public static final int CLOSE_CONTACT_THRESHOLD = 40;
    private final int callCount;
    private final long contactId;

    @NotNull
    private final List<String> emails;
    private final boolean hasPhoto;
    private final boolean isFrequent;

    @Nullable
    private final Integer lastContactDaysAgo;

    @Nullable
    private final RecentMessage lastMessage;

    @NotNull
    private final String name;

    @Nullable
    private final String nickname;
    private final int phoneCount;

    @NotNull
    private final List<String> phoneNumbers;
    private final int score;
    private final int smsCount;
    private final boolean starred;
    private final int timesContacted;
    public static final int $stable = 8;

    public ContactEntry(@NotNull String name, @Nullable String str, int i5, boolean z11, int i11, int i12, int i13, boolean z12, int i14, @Nullable Integer num, @NotNull List<String> phoneNumbers, @NotNull List<String> emails, long j11, boolean z13, @Nullable RecentMessage recentMessage) {
        Intrinsics.g(name, "name");
        Intrinsics.g(phoneNumbers, "phoneNumbers");
        Intrinsics.g(emails, "emails");
        this.name = name;
        this.nickname = str;
        this.score = i5;
        this.starred = z11;
        this.callCount = i11;
        this.smsCount = i12;
        this.timesContacted = i13;
        this.hasPhoto = z12;
        this.phoneCount = i14;
        this.lastContactDaysAgo = num;
        this.phoneNumbers = phoneNumbers;
        this.emails = emails;
        this.contactId = j11;
        this.isFrequent = z13;
        this.lastMessage = recentMessage;
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @Nullable
    /* renamed from: component10, reason: from getter */
    public final Integer getLastContactDaysAgo() {
        return this.lastContactDaysAgo;
    }

    @NotNull
    public final List<String> component11() {
        return this.phoneNumbers;
    }

    @NotNull
    public final List<String> component12() {
        return this.emails;
    }

    /* renamed from: component13, reason: from getter */
    public final long getContactId() {
        return this.contactId;
    }

    /* renamed from: component14, reason: from getter */
    public final boolean getIsFrequent() {
        return this.isFrequent;
    }

    @Nullable
    /* renamed from: component15, reason: from getter */
    public final RecentMessage getLastMessage() {
        return this.lastMessage;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getNickname() {
        return this.nickname;
    }

    /* renamed from: component3, reason: from getter */
    public final int getScore() {
        return this.score;
    }

    /* renamed from: component4, reason: from getter */
    public final boolean getStarred() {
        return this.starred;
    }

    /* renamed from: component5, reason: from getter */
    public final int getCallCount() {
        return this.callCount;
    }

    /* renamed from: component6, reason: from getter */
    public final int getSmsCount() {
        return this.smsCount;
    }

    /* renamed from: component7, reason: from getter */
    public final int getTimesContacted() {
        return this.timesContacted;
    }

    /* renamed from: component8, reason: from getter */
    public final boolean getHasPhoto() {
        return this.hasPhoto;
    }

    /* renamed from: component9, reason: from getter */
    public final int getPhoneCount() {
        return this.phoneCount;
    }

    @NotNull
    public final ContactEntry copy(@NotNull String name, @Nullable String nickname, int score, boolean starred, int callCount, int smsCount, int timesContacted, boolean hasPhoto, int phoneCount, @Nullable Integer lastContactDaysAgo, @NotNull List<String> phoneNumbers, @NotNull List<String> emails, long contactId, boolean isFrequent, @Nullable RecentMessage lastMessage) {
        Intrinsics.g(name, "name");
        Intrinsics.g(phoneNumbers, "phoneNumbers");
        Intrinsics.g(emails, "emails");
        return new ContactEntry(name, nickname, score, starred, callCount, smsCount, timesContacted, hasPhoto, phoneCount, lastContactDaysAgo, phoneNumbers, emails, contactId, isFrequent, lastMessage);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ContactEntry)) {
            return false;
        }
        ContactEntry contactEntry = (ContactEntry) other;
        return Intrinsics.b(this.name, contactEntry.name) && Intrinsics.b(this.nickname, contactEntry.nickname) && this.score == contactEntry.score && this.starred == contactEntry.starred && this.callCount == contactEntry.callCount && this.smsCount == contactEntry.smsCount && this.timesContacted == contactEntry.timesContacted && this.hasPhoto == contactEntry.hasPhoto && this.phoneCount == contactEntry.phoneCount && Intrinsics.b(this.lastContactDaysAgo, contactEntry.lastContactDaysAgo) && Intrinsics.b(this.phoneNumbers, contactEntry.phoneNumbers) && Intrinsics.b(this.emails, contactEntry.emails) && this.contactId == contactEntry.contactId && this.isFrequent == contactEntry.isFrequent && Intrinsics.b(this.lastMessage, contactEntry.lastMessage);
    }

    public final int getCallCount() {
        return this.callCount;
    }

    public final boolean getCanMessage() {
        return (this.phoneNumbers.isEmpty() && this.emails.isEmpty()) ? false : true;
    }

    public final long getContactId() {
        return this.contactId;
    }

    @NotNull
    public final List<String> getEmails() {
        return this.emails;
    }

    public final boolean getHasPhoto() {
        return this.hasPhoto;
    }

    @Nullable
    public final Integer getLastContactDaysAgo() {
        return this.lastContactDaysAgo;
    }

    @Nullable
    public final RecentMessage getLastMessage() {
        return this.lastMessage;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    @Nullable
    public final String getNickname() {
        return this.nickname;
    }

    public final int getPhoneCount() {
        return this.phoneCount;
    }

    @NotNull
    public final List<String> getPhoneNumbers() {
        return this.phoneNumbers;
    }

    public final int getScore() {
        return this.score;
    }

    public final int getSmsCount() {
        return this.smsCount;
    }

    public final boolean getStarred() {
        return this.starred;
    }

    public final int getTimesContacted() {
        return this.timesContacted;
    }

    public int hashCode() {
        int iHashCode = this.name.hashCode() * 31;
        String str = this.nickname;
        int iA = u4.a(this.phoneCount, c9.f(u4.a(this.timesContacted, u4.a(this.smsCount, u4.a(this.callCount, c9.f(u4.a(this.score, (iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31), 31, this.starred), 31), 31), 31), 31, this.hasPhoto), 31);
        Integer num = this.lastContactDaysAgo;
        int iF = c9.f(c0.d(u4.c(u4.c((iA + (num == null ? 0 : num.hashCode())) * 31, 31, this.phoneNumbers), 31, this.emails), 31, this.contactId), 31, this.isFrequent);
        RecentMessage recentMessage = this.lastMessage;
        return iF + (recentMessage != null ? recentMessage.hashCode() : 0);
    }

    public final boolean isCloseContact() {
        return this.score >= 40;
    }

    public final boolean isFrequent() {
        return this.isFrequent;
    }

    @NotNull
    public String toString() {
        return "ContactEntry(name=" + this.name + ", nickname=" + this.nickname + ", score=" + this.score + ", starred=" + this.starred + ", callCount=" + this.callCount + ", smsCount=" + this.smsCount + ", timesContacted=" + this.timesContacted + ", hasPhoto=" + this.hasPhoto + ", phoneCount=" + this.phoneCount + ", lastContactDaysAgo=" + this.lastContactDaysAgo + ", phoneNumbers=" + this.phoneNumbers + ", emails=" + this.emails + ", contactId=" + this.contactId + ", isFrequent=" + this.isFrequent + ", lastMessage=" + this.lastMessage + ')';
    }

    public ContactEntry(String str, String str2, int i5, boolean z11, int i11, int i12, int i13, boolean z12, int i14, Integer num, List list, List list2, long j11, boolean z13, RecentMessage recentMessage, int i15, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i15 & 2) != 0 ? null : str2, (i15 & 4) != 0 ? 0 : i5, (i15 & 8) != 0 ? false : z11, (i15 & 16) != 0 ? 0 : i11, (i15 & 32) != 0 ? 0 : i12, (i15 & 64) != 0 ? 0 : i13, (i15 & 128) != 0 ? false : z12, (i15 & 256) != 0 ? 0 : i14, (i15 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : num, (i15 & 1024) != 0 ? EmptyList.f71733a : list, (i15 & 2048) != 0 ? EmptyList.f71733a : list2, (i15 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? 0L : j11, (i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0 ? z13 : false, (i15 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : recentMessage);
    }
}
