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
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u000f\n\u0002\u0010 \n\u0002\bL\b\u0087\b\u0018\u0000 j2\u00020\u0001:\u0001jB\u0093\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n\u0012\b\b\u0002\u0010\f\u001a\u00020\n\u0012\b\b\u0002\u0010\r\u001a\u00020\n\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0015\u001a\u00020\u000f\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0017\u001a\u00020\u000f\u0012\b\b\u0002\u0010\u0018\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0019\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u001a\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u001b\u001a\u00020\n\u0012\b\b\u0002\u0010\u001c\u001a\u00020\n\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u0005\u0012\u000e\b\u0002\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00050\u001f¢\u0006\u0004\b \u0010!J\u0010\u0010I\u001a\u00020\u000f2\b\u0010J\u001a\u0004\u0018\u00010\u0005J\t\u0010L\u001a\u00020\u0003HÆ\u0003J\t\u0010M\u001a\u00020\u0005HÆ\u0003J\u000b\u0010N\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010O\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010P\u001a\u00020\u0003HÆ\u0003J\t\u0010Q\u001a\u00020\nHÆ\u0003J\t\u0010R\u001a\u00020\nHÆ\u0003J\t\u0010S\u001a\u00020\nHÆ\u0003J\t\u0010T\u001a\u00020\nHÆ\u0003J\t\u0010U\u001a\u00020\u000fHÆ\u0003J\t\u0010V\u001a\u00020\u0003HÆ\u0003J\u000b\u0010W\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010X\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010Y\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010Z\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010[\u001a\u00020\u000fHÆ\u0003J\u000b\u0010\\\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010]\u001a\u00020\u000fHÆ\u0003J\t\u0010^\u001a\u00020\u0003HÆ\u0003J\t\u0010_\u001a\u00020\u0003HÆ\u0003J\t\u0010`\u001a\u00020\u0003HÆ\u0003J\t\u0010a\u001a\u00020\nHÆ\u0003J\t\u0010b\u001a\u00020\nHÆ\u0003J\u000b\u0010c\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000f\u0010d\u001a\b\u0012\u0004\u0012\u00020\u00050\u001fHÆ\u0003J\u0099\u0002\u0010e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\n2\b\b\u0002\u0010\f\u001a\u00020\n2\b\b\u0002\u0010\r\u001a\u00020\n2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0015\u001a\u00020\u000f2\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0017\u001a\u00020\u000f2\b\b\u0002\u0010\u0018\u001a\u00020\u00032\b\b\u0002\u0010\u0019\u001a\u00020\u00032\b\b\u0002\u0010\u001a\u001a\u00020\u00032\b\b\u0002\u0010\u001b\u001a\u00020\n2\b\b\u0002\u0010\u001c\u001a\u00020\n2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u00052\u000e\b\u0002\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00050\u001fHÆ\u0001J\u0013\u0010f\u001a\u00020\u000f2\b\u0010g\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010h\u001a\u00020\nHÖ\u0001J\t\u0010i\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b&\u0010%R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b'\u0010%R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b(\u0010#R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b)\u0010*R\u0011\u0010\u000b\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b+\u0010*R\u0011\u0010\f\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b,\u0010*R\u0011\u0010\r\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b-\u0010*R\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010.R\u0011\u0010\u0010\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b/\u0010#R\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b0\u0010%R\u0013\u0010\u0012\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b1\u0010%R\u0013\u0010\u0013\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b2\u0010%R\u0013\u0010\u0014\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b3\u0010%R\u0011\u0010\u0015\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010.R\u0013\u0010\u0016\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b4\u0010%R\u0011\u0010\u0017\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010.R\u0011\u0010\u0018\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b5\u0010#R\u0011\u0010\u0019\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b6\u0010#R\u0011\u0010\u001a\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b7\u0010#R\u0011\u0010\u001b\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b8\u0010*R\u0011\u0010\u001c\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b9\u0010*R\u0013\u0010\u001d\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b:\u0010%R\u0017\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00050\u001f¢\u0006\b\n\u0000\u001a\u0004\b;\u0010<R\u0011\u0010=\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b=\u0010.R\u0011\u0010>\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b>\u0010.R\u0011\u0010?\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b@\u0010*R\u0011\u0010A\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\bA\u0010.R\u0011\u0010B\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\bB\u0010.R\u0011\u0010C\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\bC\u0010.R\u0014\u0010D\u001a\u00020\u000f8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bE\u0010.R\u0013\u0010F\u001a\u0004\u0018\u00010\u00058F¢\u0006\u0006\u001a\u0004\bG\u0010%R\u0011\u0010H\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\bH\u0010.R\u0011\u0010K\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\bK\u0010.¨\u0006k"}, d2 = {"Lcom/instabridge/mobilesdk/PurchasedPackage;", b.f42142b, "packageId", b.f42142b, PendingUpgradeStore.KEY_NAME, b.f42142b, TTConst.TRACK_TYPE, "externalPlanType", "dataMb", "durationHours", b.f42142b, "billingCycleMonths", "callMinutes", "smsCount", "isPremium", b.f42142b, "purchaseId", "purchaseDate", "startDate", "expirationDate", "regionCode", "isSubscriptionCancelled", "subscriptionEndDate", "isPending", "consumedDataBytes", "totalDataBytes", "availableDataBytes", "consumedCallMinutes", "consumedSmsCount", com.amplitude.core.events.Plan.AMP_PLAN_SOURCE, "coveredCountryCodes", b.f42142b, "<init>", "(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIIIZJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ZJJJIILjava/lang/String;Ljava/util/List;)V", "getPackageId", "()J", "getName", "()Ljava/lang/String;", "getType", "getExternalPlanType", "getDataMb", "getDurationHours", "()I", "getBillingCycleMonths", "getCallMinutes", "getSmsCount", "()Z", "getPurchaseId", "getPurchaseDate", "getStartDate", "getExpirationDate", "getRegionCode", "getSubscriptionEndDate", "getConsumedDataBytes", "getTotalDataBytes", "getAvailableDataBytes", "getConsumedCallMinutes", "getConsumedSmsCount", "getSource", "getCoveredCountryCodes", "()Ljava/util/List;", "isBooster", "isFree", "effectiveBillingCycleMonths", "getEffectiveBillingCycleMonths", "isMultiMonthCycle", "isTrial", "isFreeTrial", "hasTrialMarker", "getHasTrialMarker", "accessEndDate", "getAccessEndDate", "isTravel", "coversCountry", "countryCode", "isLocalSim", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "component17", "component18", "component19", "component20", "component21", "component22", "component23", "component24", "component25", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final /* data */ class PurchasedPackage {

    @Deprecated
    @NotNull
    public static final String SOURCE_LOCAL_SIM_TRIAL = "local_sim_trial";

    @Deprecated
    @NotNull
    public static final String TYPE_LOCAL_SIM = "local_sim";
    private final long availableDataBytes;
    private final int billingCycleMonths;
    private final int callMinutes;
    private final int consumedCallMinutes;
    private final long consumedDataBytes;
    private final int consumedSmsCount;

    @NotNull
    private final List<String> coveredCountryCodes;
    private final long dataMb;
    private final int durationHours;

    @Nullable
    private final String expirationDate;

    @Nullable
    private final String externalPlanType;
    private final boolean isPending;
    private final boolean isPremium;
    private final boolean isSubscriptionCancelled;

    @NotNull
    private final String name;
    private final long packageId;

    @Nullable
    private final String purchaseDate;
    private final long purchaseId;

    @Nullable
    private final String regionCode;
    private final int smsCount;

    @Nullable
    private final String source;

    @Nullable
    private final String startDate;

    @Nullable
    private final String subscriptionEndDate;
    private final long totalDataBytes;

    @Nullable
    private final String type;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/PurchasedPackage$Companion;", b.f42142b, "<init>", "()V", "SOURCE_LOCAL_SIM_TRIAL", b.f42142b, "TYPE_LOCAL_SIM", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public PurchasedPackage(long j11, @NotNull String name, @Nullable String str, @Nullable String str2, long j12, int i5, int i11, int i12, int i13, boolean z11, long j13, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable String str6, boolean z12, @Nullable String str7, boolean z13, long j14, long j15, long j16, int i14, int i15, @Nullable String str8, @NotNull List<String> coveredCountryCodes) {
        Intrinsics.g(name, "name");
        Intrinsics.g(coveredCountryCodes, "coveredCountryCodes");
        this.packageId = j11;
        this.name = name;
        this.type = str;
        this.externalPlanType = str2;
        this.dataMb = j12;
        this.durationHours = i5;
        this.billingCycleMonths = i11;
        this.callMinutes = i12;
        this.smsCount = i13;
        this.isPremium = z11;
        this.purchaseId = j13;
        this.purchaseDate = str3;
        this.startDate = str4;
        this.expirationDate = str5;
        this.regionCode = str6;
        this.isSubscriptionCancelled = z12;
        this.subscriptionEndDate = str7;
        this.isPending = z13;
        this.consumedDataBytes = j14;
        this.totalDataBytes = j15;
        this.availableDataBytes = j16;
        this.consumedCallMinutes = i14;
        this.consumedSmsCount = i15;
        this.source = str8;
        this.coveredCountryCodes = coveredCountryCodes;
    }

    public static /* synthetic */ PurchasedPackage copy$default(PurchasedPackage purchasedPackage, long j11, String str, String str2, String str3, long j12, int i5, int i11, int i12, int i13, boolean z11, long j13, String str4, String str5, String str6, String str7, boolean z12, String str8, boolean z13, long j14, long j15, long j16, int i14, int i15, String str9, List list, int i16, Object obj) {
        List list2;
        String str10;
        long j17 = (i16 & 1) != 0 ? purchasedPackage.packageId : j11;
        String str11 = (i16 & 2) != 0 ? purchasedPackage.name : str;
        String str12 = (i16 & 4) != 0 ? purchasedPackage.type : str2;
        String str13 = (i16 & 8) != 0 ? purchasedPackage.externalPlanType : str3;
        long j18 = (i16 & 16) != 0 ? purchasedPackage.dataMb : j12;
        int i17 = (i16 & 32) != 0 ? purchasedPackage.durationHours : i5;
        int i18 = (i16 & 64) != 0 ? purchasedPackage.billingCycleMonths : i11;
        int i19 = (i16 & 128) != 0 ? purchasedPackage.callMinutes : i12;
        int i21 = (i16 & 256) != 0 ? purchasedPackage.smsCount : i13;
        boolean z14 = (i16 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? purchasedPackage.isPremium : z11;
        long j19 = (i16 & 1024) != 0 ? purchasedPackage.purchaseId : j13;
        long j21 = j17;
        String str14 = (i16 & 2048) != 0 ? purchasedPackage.purchaseDate : str4;
        String str15 = (i16 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? purchasedPackage.startDate : str5;
        String str16 = str14;
        String str17 = (i16 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? purchasedPackage.expirationDate : str6;
        String str18 = (i16 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? purchasedPackage.regionCode : str7;
        boolean z15 = (i16 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? purchasedPackage.isSubscriptionCancelled : z12;
        String str19 = (i16 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? purchasedPackage.subscriptionEndDate : str8;
        boolean z16 = (i16 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? purchasedPackage.isPending : z13;
        String str20 = str18;
        long j22 = (i16 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? purchasedPackage.consumedDataBytes : j14;
        long j23 = (i16 & 524288) != 0 ? purchasedPackage.totalDataBytes : j15;
        long j24 = (i16 & 1048576) != 0 ? purchasedPackage.availableDataBytes : j16;
        int i22 = (i16 & 2097152) != 0 ? purchasedPackage.consumedCallMinutes : i14;
        int i23 = (i16 & 4194304) != 0 ? purchasedPackage.consumedSmsCount : i15;
        int i24 = i22;
        String str21 = (i16 & 8388608) != 0 ? purchasedPackage.source : str9;
        if ((i16 & 16777216) != 0) {
            str10 = str21;
            list2 = purchasedPackage.coveredCountryCodes;
        } else {
            list2 = list;
            str10 = str21;
        }
        return purchasedPackage.copy(j21, str11, str12, str13, j18, i17, i18, i19, i21, z14, j19, str16, str15, str17, str20, z15, str19, z16, j22, j23, j24, i24, i23, str10, list2);
    }

    private final boolean getHasTrialMarker() {
        return isTrial() || r70.k.K0(this.name, "trial", true) || j.B0(this.source, SOURCE_LOCAL_SIM_TRIAL, true);
    }

    /* renamed from: component1, reason: from getter */
    public final long getPackageId() {
        return this.packageId;
    }

    /* renamed from: component10, reason: from getter */
    public final boolean getIsPremium() {
        return this.isPremium;
    }

    /* renamed from: component11, reason: from getter */
    public final long getPurchaseId() {
        return this.purchaseId;
    }

    @Nullable
    /* renamed from: component12, reason: from getter */
    public final String getPurchaseDate() {
        return this.purchaseDate;
    }

    @Nullable
    /* renamed from: component13, reason: from getter */
    public final String getStartDate() {
        return this.startDate;
    }

    @Nullable
    /* renamed from: component14, reason: from getter */
    public final String getExpirationDate() {
        return this.expirationDate;
    }

    @Nullable
    /* renamed from: component15, reason: from getter */
    public final String getRegionCode() {
        return this.regionCode;
    }

    /* renamed from: component16, reason: from getter */
    public final boolean getIsSubscriptionCancelled() {
        return this.isSubscriptionCancelled;
    }

    @Nullable
    /* renamed from: component17, reason: from getter */
    public final String getSubscriptionEndDate() {
        return this.subscriptionEndDate;
    }

    /* renamed from: component18, reason: from getter */
    public final boolean getIsPending() {
        return this.isPending;
    }

    /* renamed from: component19, reason: from getter */
    public final long getConsumedDataBytes() {
        return this.consumedDataBytes;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* renamed from: component20, reason: from getter */
    public final long getTotalDataBytes() {
        return this.totalDataBytes;
    }

    /* renamed from: component21, reason: from getter */
    public final long getAvailableDataBytes() {
        return this.availableDataBytes;
    }

    /* renamed from: component22, reason: from getter */
    public final int getConsumedCallMinutes() {
        return this.consumedCallMinutes;
    }

    /* renamed from: component23, reason: from getter */
    public final int getConsumedSmsCount() {
        return this.consumedSmsCount;
    }

    @Nullable
    /* renamed from: component24, reason: from getter */
    public final String getSource() {
        return this.source;
    }

    @NotNull
    public final List<String> component25() {
        return this.coveredCountryCodes;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getExternalPlanType() {
        return this.externalPlanType;
    }

    /* renamed from: component5, reason: from getter */
    public final long getDataMb() {
        return this.dataMb;
    }

    /* renamed from: component6, reason: from getter */
    public final int getDurationHours() {
        return this.durationHours;
    }

    /* renamed from: component7, reason: from getter */
    public final int getBillingCycleMonths() {
        return this.billingCycleMonths;
    }

    /* renamed from: component8, reason: from getter */
    public final int getCallMinutes() {
        return this.callMinutes;
    }

    /* renamed from: component9, reason: from getter */
    public final int getSmsCount() {
        return this.smsCount;
    }

    @NotNull
    public final PurchasedPackage copy(long packageId, @NotNull String name, @Nullable String type, @Nullable String externalPlanType, long dataMb, int durationHours, int billingCycleMonths, int callMinutes, int smsCount, boolean isPremium, long purchaseId, @Nullable String purchaseDate, @Nullable String startDate, @Nullable String expirationDate, @Nullable String regionCode, boolean isSubscriptionCancelled, @Nullable String subscriptionEndDate, boolean isPending, long consumedDataBytes, long totalDataBytes, long availableDataBytes, int consumedCallMinutes, int consumedSmsCount, @Nullable String source, @NotNull List<String> coveredCountryCodes) {
        Intrinsics.g(name, "name");
        Intrinsics.g(coveredCountryCodes, "coveredCountryCodes");
        return new PurchasedPackage(packageId, name, type, externalPlanType, dataMb, durationHours, billingCycleMonths, callMinutes, smsCount, isPremium, purchaseId, purchaseDate, startDate, expirationDate, regionCode, isSubscriptionCancelled, subscriptionEndDate, isPending, consumedDataBytes, totalDataBytes, availableDataBytes, consumedCallMinutes, consumedSmsCount, source, coveredCountryCodes);
    }

    public final boolean coversCountry(@Nullable String countryCode) {
        String string;
        String string2;
        if (countryCode != null && (string = r70.k.u1(countryCode).toString()) != null) {
            if (r70.k.U0(string)) {
                string = null;
            }
            if (string != null) {
                String str = this.regionCode;
                if (str != null && (string2 = r70.k.u1(str).toString()) != null && string2.equalsIgnoreCase(string)) {
                    return true;
                }
                List<String> list = this.coveredCountryCodes;
                if ((list instanceof Collection) && list.isEmpty()) {
                    return false;
                }
                Iterator<T> it = list.iterator();
                while (it.hasNext()) {
                    if (j.B0(r70.k.u1((String) it.next()).toString(), string, true)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PurchasedPackage)) {
            return false;
        }
        PurchasedPackage purchasedPackage = (PurchasedPackage) other;
        return this.packageId == purchasedPackage.packageId && Intrinsics.b(this.name, purchasedPackage.name) && Intrinsics.b(this.type, purchasedPackage.type) && Intrinsics.b(this.externalPlanType, purchasedPackage.externalPlanType) && this.dataMb == purchasedPackage.dataMb && this.durationHours == purchasedPackage.durationHours && this.billingCycleMonths == purchasedPackage.billingCycleMonths && this.callMinutes == purchasedPackage.callMinutes && this.smsCount == purchasedPackage.smsCount && this.isPremium == purchasedPackage.isPremium && this.purchaseId == purchasedPackage.purchaseId && Intrinsics.b(this.purchaseDate, purchasedPackage.purchaseDate) && Intrinsics.b(this.startDate, purchasedPackage.startDate) && Intrinsics.b(this.expirationDate, purchasedPackage.expirationDate) && Intrinsics.b(this.regionCode, purchasedPackage.regionCode) && this.isSubscriptionCancelled == purchasedPackage.isSubscriptionCancelled && Intrinsics.b(this.subscriptionEndDate, purchasedPackage.subscriptionEndDate) && this.isPending == purchasedPackage.isPending && this.consumedDataBytes == purchasedPackage.consumedDataBytes && this.totalDataBytes == purchasedPackage.totalDataBytes && this.availableDataBytes == purchasedPackage.availableDataBytes && this.consumedCallMinutes == purchasedPackage.consumedCallMinutes && this.consumedSmsCount == purchasedPackage.consumedSmsCount && Intrinsics.b(this.source, purchasedPackage.source) && Intrinsics.b(this.coveredCountryCodes, purchasedPackage.coveredCountryCodes);
    }

    @Nullable
    public final String getAccessEndDate() {
        String str = this.subscriptionEndDate;
        return str == null ? this.expirationDate : str;
    }

    public final long getAvailableDataBytes() {
        return this.availableDataBytes;
    }

    public final int getBillingCycleMonths() {
        return this.billingCycleMonths;
    }

    public final int getCallMinutes() {
        return this.callMinutes;
    }

    public final int getConsumedCallMinutes() {
        return this.consumedCallMinutes;
    }

    public final long getConsumedDataBytes() {
        return this.consumedDataBytes;
    }

    public final int getConsumedSmsCount() {
        return this.consumedSmsCount;
    }

    @NotNull
    public final List<String> getCoveredCountryCodes() {
        return this.coveredCountryCodes;
    }

    public final long getDataMb() {
        return this.dataMb;
    }

    public final int getDurationHours() {
        return this.durationHours;
    }

    public final int getEffectiveBillingCycleMonths() {
        int i5 = this.billingCycleMonths;
        return i5 > 1 ? i5 : Math.max(1, this.durationHours / 720);
    }

    @Nullable
    public final String getExpirationDate() {
        return this.expirationDate;
    }

    @Nullable
    public final String getExternalPlanType() {
        return this.externalPlanType;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    public final long getPackageId() {
        return this.packageId;
    }

    @Nullable
    public final String getPurchaseDate() {
        return this.purchaseDate;
    }

    public final long getPurchaseId() {
        return this.purchaseId;
    }

    @Nullable
    public final String getRegionCode() {
        return this.regionCode;
    }

    public final int getSmsCount() {
        return this.smsCount;
    }

    @Nullable
    public final String getSource() {
        return this.source;
    }

    @Nullable
    public final String getStartDate() {
        return this.startDate;
    }

    @Nullable
    public final String getSubscriptionEndDate() {
        return this.subscriptionEndDate;
    }

    public final long getTotalDataBytes() {
        return this.totalDataBytes;
    }

    @Nullable
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iE = c0.e(Long.hashCode(this.packageId) * 31, 31, this.name);
        String str = this.type;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.externalPlanType;
        int iD = c0.d(c9.f(u4.a(this.smsCount, u4.a(this.callMinutes, u4.a(this.billingCycleMonths, u4.a(this.durationHours, c0.d((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.dataMb), 31), 31), 31), 31), 31, this.isPremium), 31, this.purchaseId);
        String str3 = this.purchaseDate;
        int iHashCode2 = (iD + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.startDate;
        int iHashCode3 = (iHashCode2 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.expirationDate;
        int iHashCode4 = (iHashCode3 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.regionCode;
        int iF = c9.f((iHashCode4 + (str6 == null ? 0 : str6.hashCode())) * 31, 31, this.isSubscriptionCancelled);
        String str7 = this.subscriptionEndDate;
        int iA = u4.a(this.consumedSmsCount, u4.a(this.consumedCallMinutes, c0.d(c0.d(c0.d(c9.f((iF + (str7 == null ? 0 : str7.hashCode())) * 31, 31, this.isPending), 31, this.consumedDataBytes), 31, this.totalDataBytes), 31, this.availableDataBytes), 31), 31);
        String str8 = this.source;
        return this.coveredCountryCodes.hashCode() + ((iA + (str8 != null ? str8.hashCode() : 0)) * 31);
    }

    public final boolean isBooster() {
        String str = this.externalPlanType;
        return str != null && str.equalsIgnoreCase("booster");
    }

    public final boolean isFree() {
        return (isBooster() || this.isPremium || r70.k.K0(this.name, "pro", true)) ? false : true;
    }

    public final boolean isFreeTrial() {
        return !isBooster() && getHasTrialMarker();
    }

    public final boolean isLocalSim() {
        return !isTravel();
    }

    public final boolean isMultiMonthCycle() {
        return !isBooster() && getEffectiveBillingCycleMonths() > 1;
    }

    public final boolean isPending() {
        return this.isPending;
    }

    public final boolean isPremium() {
        return this.isPremium;
    }

    public final boolean isSubscriptionCancelled() {
        return this.isSubscriptionCancelled;
    }

    public final boolean isTravel() {
        String str = this.type;
        return (str == null || j.B0(str, TYPE_LOCAL_SIM, true)) ? false : true;
    }

    public final boolean isTrial() {
        int i5;
        return !isBooster() && 1 <= (i5 = this.durationHours) && i5 < 720;
    }

    @NotNull
    public String toString() {
        long j11 = this.packageId;
        String str = this.name;
        String str2 = this.type;
        String str3 = this.externalPlanType;
        long j12 = this.dataMb;
        int i5 = this.durationHours;
        int i11 = this.billingCycleMonths;
        int i12 = this.callMinutes;
        int i13 = this.smsCount;
        boolean z11 = this.isPremium;
        long j13 = this.purchaseId;
        String str4 = this.purchaseDate;
        String str5 = this.startDate;
        String str6 = this.expirationDate;
        String str7 = this.regionCode;
        boolean z12 = this.isSubscriptionCancelled;
        String str8 = this.subscriptionEndDate;
        boolean z13 = this.isPending;
        long j14 = this.consumedDataBytes;
        long j15 = this.totalDataBytes;
        long j16 = this.availableDataBytes;
        int i14 = this.consumedCallMinutes;
        int i15 = this.consumedSmsCount;
        String str9 = this.source;
        List<String> list = this.coveredCountryCodes;
        StringBuilder sbL = m.l(j11, "PurchasedPackage(packageId=", ", name=", str);
        c0.D(sbL, ", type=", str2, ", externalPlanType=", str3);
        c0.B(sbL, ", dataMb=", j12, ", durationHours=");
        c0.A(sbL, i5, ", billingCycleMonths=", i11, ", callMinutes=");
        c0.A(sbL, i12, ", smsCount=", i13, ", isPremium=");
        sbL.append(z11);
        sbL.append(", purchaseId=");
        sbL.append(j13);
        c0.D(sbL, ", purchaseDate=", str4, ", startDate=", str5);
        c0.D(sbL, ", expirationDate=", str6, ", regionCode=", str7);
        sbL.append(", isSubscriptionCancelled=");
        sbL.append(z12);
        sbL.append(", subscriptionEndDate=");
        sbL.append(str8);
        sbL.append(", isPending=");
        sbL.append(z13);
        sbL.append(", consumedDataBytes=");
        sbL.append(j14);
        c0.B(sbL, ", totalDataBytes=", j15, ", availableDataBytes=");
        sbL.append(j16);
        sbL.append(", consumedCallMinutes=");
        sbL.append(i14);
        sbL.append(", consumedSmsCount=");
        sbL.append(i15);
        sbL.append(", source=");
        sbL.append(str9);
        sbL.append(", coveredCountryCodes=");
        sbL.append(list);
        sbL.append(")");
        return sbL.toString();
    }

    public PurchasedPackage(long j11, String str, String str2, String str3, long j12, int i5, int i11, int i12, int i13, boolean z11, long j13, String str4, String str5, String str6, String str7, boolean z12, String str8, boolean z13, long j14, long j15, long j16, int i14, int i15, String str9, List list, int i16, DefaultConstructorMarker defaultConstructorMarker) {
        this(j11, str, (i16 & 4) != 0 ? null : str2, (i16 & 8) != 0 ? null : str3, (i16 & 16) != 0 ? 0L : j12, (i16 & 32) != 0 ? 0 : i5, (i16 & 64) != 0 ? 1 : i11, (i16 & 128) != 0 ? 0 : i12, (i16 & 256) != 0 ? 0 : i13, (i16 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? false : z11, (i16 & 1024) != 0 ? 0L : j13, (i16 & 2048) != 0 ? null : str4, (i16 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : str5, (i16 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : str6, (i16 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : str7, (32768 & i16) != 0 ? false : z12, (65536 & i16) != 0 ? null : str8, (131072 & i16) != 0 ? false : z13, (262144 & i16) != 0 ? 0L : j14, (524288 & i16) != 0 ? 0L : j15, (1048576 & i16) != 0 ? 0L : j16, (2097152 & i16) != 0 ? 0 : i14, (4194304 & i16) != 0 ? 0 : i15, (8388608 & i16) != 0 ? null : str9, (i16 & 16777216) != 0 ? EmptyList.f71733a : list);
    }
}
