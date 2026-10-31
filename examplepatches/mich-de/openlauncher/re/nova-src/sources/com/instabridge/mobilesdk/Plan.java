package com.instabridge.mobilesdk;

import a80.m;
import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b7\b\u0087\b\u0018\u00002\u00020\u0001B¥\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\u0003\u0012\u0006\u0010\f\u001a\u00020\u0003\u0012\u0006\u0010\r\u001a\u00020\u0005\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u000f\u0012\b\b\u0002\u0010\u0012\u001a\u00020\b\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0014\u001a\u00020\b\u0012\b\b\u0002\u0010\u0015\u001a\u00020\b\u0012\b\b\u0002\u0010\u0016\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0017\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019J\t\u0010/\u001a\u00020\u0003HÆ\u0003J\t\u00100\u001a\u00020\u0005HÆ\u0003J\t\u00101\u001a\u00020\u0003HÆ\u0003J\t\u00102\u001a\u00020\bHÆ\u0003J\t\u00103\u001a\u00020\bHÆ\u0003J\t\u00104\u001a\u00020\bHÆ\u0003J\t\u00105\u001a\u00020\u0003HÆ\u0003J\t\u00106\u001a\u00020\u0003HÆ\u0003J\t\u00107\u001a\u00020\u0005HÆ\u0003J\t\u00108\u001a\u00020\u000fHÆ\u0003J\t\u00109\u001a\u00020\u000fHÆ\u0003J\t\u0010:\u001a\u00020\u000fHÆ\u0003J\t\u0010;\u001a\u00020\bHÆ\u0003J\t\u0010<\u001a\u00020\u0003HÆ\u0003J\t\u0010=\u001a\u00020\bHÆ\u0003J\t\u0010>\u001a\u00020\bHÆ\u0003J\t\u0010?\u001a\u00020\u0005HÆ\u0003J\t\u0010@\u001a\u00020\bHÆ\u0003J½\u0001\u0010A\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\b2\b\b\u0002\u0010\u000b\u001a\u00020\u00032\b\b\u0002\u0010\f\u001a\u00020\u00032\b\b\u0002\u0010\r\u001a\u00020\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u000f2\b\b\u0002\u0010\u0011\u001a\u00020\u000f2\b\b\u0002\u0010\u0012\u001a\u00020\b2\b\b\u0002\u0010\u0013\u001a\u00020\u00032\b\b\u0002\u0010\u0014\u001a\u00020\b2\b\b\u0002\u0010\u0015\u001a\u00020\b2\b\b\u0002\u0010\u0016\u001a\u00020\u00052\b\b\u0002\u0010\u0017\u001a\u00020\bHÆ\u0001J\u0013\u0010B\u001a\u00020\u000f2\b\u0010C\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010D\u001a\u00020\bHÖ\u0001J\t\u0010E\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001bR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 R\u0011\u0010\t\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b!\u0010 R\u0011\u0010\n\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010 R\u0011\u0010\u000b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u001bR\u0011\u0010\f\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b$\u0010\u001bR\u0011\u0010\r\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b%\u0010\u001dR\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010&R\u0011\u0010\u0010\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010&R\u0011\u0010\u0011\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b'\u0010&R\u0011\u0010\u0012\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b(\u0010 R\u0011\u0010\u0013\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b)\u0010\u001bR\u0011\u0010\u0014\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b*\u0010 R\u0011\u0010\u0015\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b+\u0010 R\u0011\u0010\u0016\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b,\u0010\u001dR\u0011\u0010\u0017\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b-\u0010 R\u0011\u0010.\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b.\u0010&¨\u0006F"}, d2 = {"Lcom/instabridge/mobilesdk/Plan;", b.f42142b, "packageId", b.f42142b, PendingUpgradeStore.KEY_NAME, b.f42142b, "dataMb", "smsCount", b.f42142b, "callMinutes", "durationHours", "basePriceCents", "finalPriceCents", TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, "isSubscription", b.f42142b, "isFreeTrial", "hasTrial", "trialDurationHours", "trialDataBytes", "trialSmsCount", "trialVoiceMinutes", "interval", "intervalCount", "<init>", "(JLjava/lang/String;JIIIJJLjava/lang/String;ZZZIJIILjava/lang/String;I)V", "getPackageId", "()J", "getName", "()Ljava/lang/String;", "getDataMb", "getSmsCount", "()I", "getCallMinutes", "getDurationHours", "getBasePriceCents", "getFinalPriceCents", "getCurrency", "()Z", "getHasTrial", "getTrialDurationHours", "getTrialDataBytes", "getTrialSmsCount", "getTrialVoiceMinutes", "getInterval", "getIntervalCount", "isFree", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "component17", "component18", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class Plan {
    public static final int $stable = 0;
    private final long basePriceCents;
    private final int callMinutes;

    @NotNull
    private final String currency;
    private final long dataMb;
    private final int durationHours;
    private final long finalPriceCents;
    private final boolean hasTrial;

    @NotNull
    private final String interval;
    private final int intervalCount;
    private final boolean isFreeTrial;
    private final boolean isSubscription;

    @NotNull
    private final String name;
    private final long packageId;
    private final int smsCount;
    private final long trialDataBytes;
    private final int trialDurationHours;
    private final int trialSmsCount;
    private final int trialVoiceMinutes;

    public Plan(long j11, @NotNull String name, long j12, int i5, int i11, int i12, long j13, long j14, @NotNull String currency, boolean z11, boolean z12, boolean z13, int i13, long j15, int i14, int i15, @NotNull String interval, int i16) {
        Intrinsics.g(name, "name");
        Intrinsics.g(currency, "currency");
        Intrinsics.g(interval, "interval");
        this.packageId = j11;
        this.name = name;
        this.dataMb = j12;
        this.smsCount = i5;
        this.callMinutes = i11;
        this.durationHours = i12;
        this.basePriceCents = j13;
        this.finalPriceCents = j14;
        this.currency = currency;
        this.isSubscription = z11;
        this.isFreeTrial = z12;
        this.hasTrial = z13;
        this.trialDurationHours = i13;
        this.trialDataBytes = j15;
        this.trialSmsCount = i14;
        this.trialVoiceMinutes = i15;
        this.interval = interval;
        this.intervalCount = i16;
    }

    public static /* synthetic */ Plan copy$default(Plan plan, long j11, String str, long j12, int i5, int i11, int i12, long j13, long j14, String str2, boolean z11, boolean z12, boolean z13, int i13, long j15, int i14, int i15, String str3, int i16, int i17, Object obj) {
        int i18;
        String str4;
        long j16 = (i17 & 1) != 0 ? plan.packageId : j11;
        String str5 = (i17 & 2) != 0 ? plan.name : str;
        long j17 = (i17 & 4) != 0 ? plan.dataMb : j12;
        int i19 = (i17 & 8) != 0 ? plan.smsCount : i5;
        int i21 = (i17 & 16) != 0 ? plan.callMinutes : i11;
        int i22 = (i17 & 32) != 0 ? plan.durationHours : i12;
        long j18 = (i17 & 64) != 0 ? plan.basePriceCents : j13;
        long j19 = (i17 & 128) != 0 ? plan.finalPriceCents : j14;
        String str6 = (i17 & 256) != 0 ? plan.currency : str2;
        boolean z14 = (i17 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? plan.isSubscription : z11;
        long j21 = j16;
        boolean z15 = (i17 & 1024) != 0 ? plan.isFreeTrial : z12;
        boolean z16 = (i17 & 2048) != 0 ? plan.hasTrial : z13;
        boolean z17 = z15;
        int i23 = (i17 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? plan.trialDurationHours : i13;
        boolean z18 = z16;
        long j22 = (i17 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? plan.trialDataBytes : j15;
        int i24 = (i17 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? plan.trialSmsCount : i14;
        int i25 = (32768 & i17) != 0 ? plan.trialVoiceMinutes : i15;
        String str7 = (i17 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? plan.interval : str3;
        if ((i17 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
            str4 = str7;
            i18 = plan.intervalCount;
        } else {
            i18 = i16;
            str4 = str7;
        }
        return plan.copy(j21, str5, j17, i19, i21, i22, j18, j19, str6, z14, z17, z18, i23, j22, i24, i25, str4, i18);
    }

    /* renamed from: component1, reason: from getter */
    public final long getPackageId() {
        return this.packageId;
    }

    /* renamed from: component10, reason: from getter */
    public final boolean getIsSubscription() {
        return this.isSubscription;
    }

    /* renamed from: component11, reason: from getter */
    public final boolean getIsFreeTrial() {
        return this.isFreeTrial;
    }

    /* renamed from: component12, reason: from getter */
    public final boolean getHasTrial() {
        return this.hasTrial;
    }

    /* renamed from: component13, reason: from getter */
    public final int getTrialDurationHours() {
        return this.trialDurationHours;
    }

    /* renamed from: component14, reason: from getter */
    public final long getTrialDataBytes() {
        return this.trialDataBytes;
    }

    /* renamed from: component15, reason: from getter */
    public final int getTrialSmsCount() {
        return this.trialSmsCount;
    }

    /* renamed from: component16, reason: from getter */
    public final int getTrialVoiceMinutes() {
        return this.trialVoiceMinutes;
    }

    @NotNull
    /* renamed from: component17, reason: from getter */
    public final String getInterval() {
        return this.interval;
    }

    /* renamed from: component18, reason: from getter */
    public final int getIntervalCount() {
        return this.intervalCount;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* renamed from: component3, reason: from getter */
    public final long getDataMb() {
        return this.dataMb;
    }

    /* renamed from: component4, reason: from getter */
    public final int getSmsCount() {
        return this.smsCount;
    }

    /* renamed from: component5, reason: from getter */
    public final int getCallMinutes() {
        return this.callMinutes;
    }

    /* renamed from: component6, reason: from getter */
    public final int getDurationHours() {
        return this.durationHours;
    }

    /* renamed from: component7, reason: from getter */
    public final long getBasePriceCents() {
        return this.basePriceCents;
    }

    /* renamed from: component8, reason: from getter */
    public final long getFinalPriceCents() {
        return this.finalPriceCents;
    }

    @NotNull
    /* renamed from: component9, reason: from getter */
    public final String getCurrency() {
        return this.currency;
    }

    @NotNull
    public final Plan copy(long packageId, @NotNull String name, long dataMb, int smsCount, int callMinutes, int durationHours, long basePriceCents, long finalPriceCents, @NotNull String currency, boolean isSubscription, boolean isFreeTrial, boolean hasTrial, int trialDurationHours, long trialDataBytes, int trialSmsCount, int trialVoiceMinutes, @NotNull String interval, int intervalCount) {
        Intrinsics.g(name, "name");
        Intrinsics.g(currency, "currency");
        Intrinsics.g(interval, "interval");
        return new Plan(packageId, name, dataMb, smsCount, callMinutes, durationHours, basePriceCents, finalPriceCents, currency, isSubscription, isFreeTrial, hasTrial, trialDurationHours, trialDataBytes, trialSmsCount, trialVoiceMinutes, interval, intervalCount);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Plan)) {
            return false;
        }
        Plan plan = (Plan) other;
        return this.packageId == plan.packageId && Intrinsics.b(this.name, plan.name) && this.dataMb == plan.dataMb && this.smsCount == plan.smsCount && this.callMinutes == plan.callMinutes && this.durationHours == plan.durationHours && this.basePriceCents == plan.basePriceCents && this.finalPriceCents == plan.finalPriceCents && Intrinsics.b(this.currency, plan.currency) && this.isSubscription == plan.isSubscription && this.isFreeTrial == plan.isFreeTrial && this.hasTrial == plan.hasTrial && this.trialDurationHours == plan.trialDurationHours && this.trialDataBytes == plan.trialDataBytes && this.trialSmsCount == plan.trialSmsCount && this.trialVoiceMinutes == plan.trialVoiceMinutes && Intrinsics.b(this.interval, plan.interval) && this.intervalCount == plan.intervalCount;
    }

    public final long getBasePriceCents() {
        return this.basePriceCents;
    }

    public final int getCallMinutes() {
        return this.callMinutes;
    }

    @NotNull
    public final String getCurrency() {
        return this.currency;
    }

    public final long getDataMb() {
        return this.dataMb;
    }

    public final int getDurationHours() {
        return this.durationHours;
    }

    public final long getFinalPriceCents() {
        return this.finalPriceCents;
    }

    public final boolean getHasTrial() {
        return this.hasTrial;
    }

    @NotNull
    public final String getInterval() {
        return this.interval;
    }

    public final int getIntervalCount() {
        return this.intervalCount;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    public final long getPackageId() {
        return this.packageId;
    }

    public final int getSmsCount() {
        return this.smsCount;
    }

    public final long getTrialDataBytes() {
        return this.trialDataBytes;
    }

    public final int getTrialDurationHours() {
        return this.trialDurationHours;
    }

    public final int getTrialSmsCount() {
        return this.trialSmsCount;
    }

    public final int getTrialVoiceMinutes() {
        return this.trialVoiceMinutes;
    }

    public int hashCode() {
        return Integer.hashCode(this.intervalCount) + c0.e(u4.a(this.trialVoiceMinutes, u4.a(this.trialSmsCount, c0.d(u4.a(this.trialDurationHours, c9.f(c9.f(c9.f(c0.e(c0.d(c0.d(u4.a(this.durationHours, u4.a(this.callMinutes, u4.a(this.smsCount, c0.d(c0.e(Long.hashCode(this.packageId) * 31, 31, this.name), 31, this.dataMb), 31), 31), 31), 31, this.basePriceCents), 31, this.finalPriceCents), 31, this.currency), 31, this.isSubscription), 31, this.isFreeTrial), 31, this.hasTrial), 31), 31, this.trialDataBytes), 31), 31), 31, this.interval);
    }

    public final boolean isFree() {
        return this.finalPriceCents == 0;
    }

    public final boolean isFreeTrial() {
        return this.isFreeTrial;
    }

    public final boolean isSubscription() {
        return this.isSubscription;
    }

    @NotNull
    public String toString() {
        long j11 = this.packageId;
        String str = this.name;
        long j12 = this.dataMb;
        int i5 = this.smsCount;
        int i11 = this.callMinutes;
        int i12 = this.durationHours;
        long j13 = this.basePriceCents;
        long j14 = this.finalPriceCents;
        String str2 = this.currency;
        boolean z11 = this.isSubscription;
        boolean z12 = this.isFreeTrial;
        boolean z13 = this.hasTrial;
        int i13 = this.trialDurationHours;
        long j15 = this.trialDataBytes;
        int i14 = this.trialSmsCount;
        int i15 = this.trialVoiceMinutes;
        String str3 = this.interval;
        int i16 = this.intervalCount;
        StringBuilder sbL = m.l(j11, "Plan(packageId=", ", name=", str);
        c0.B(sbL, ", dataMb=", j12, ", smsCount=");
        c0.A(sbL, i5, ", callMinutes=", i11, ", durationHours=");
        sbL.append(i12);
        sbL.append(", basePriceCents=");
        sbL.append(j13);
        c0.B(sbL, ", finalPriceCents=", j14, ", currency=");
        m.q(str2, ", isSubscription=", ", isFreeTrial=", sbL, z11);
        m.s(sbL, z12, ", hasTrial=", z13, ", trialDurationHours=");
        sbL.append(i13);
        sbL.append(", trialDataBytes=");
        sbL.append(j15);
        sbL.append(", trialSmsCount=");
        sbL.append(i14);
        sbL.append(", trialVoiceMinutes=");
        sbL.append(i15);
        sbL.append(", interval=");
        sbL.append(str3);
        sbL.append(", intervalCount=");
        sbL.append(i16);
        sbL.append(")");
        return sbL.toString();
    }

    public /* synthetic */ Plan(long j11, String str, long j12, int i5, int i11, int i12, long j13, long j14, String str2, boolean z11, boolean z12, boolean z13, int i13, long j15, int i14, int i15, String str3, int i16, int i17, DefaultConstructorMarker defaultConstructorMarker) {
        this(j11, str, j12, i5, i11, i12, j13, j14, str2, z11, z12, (i17 & 2048) != 0 ? false : z13, (i17 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? 0 : i13, (i17 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? 0L : j15, (i17 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? 0 : i14, (32768 & i17) != 0 ? 0 : i15, (65536 & i17) != 0 ? b.f42142b : str3, (i17 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? 1 : i16);
    }
}
