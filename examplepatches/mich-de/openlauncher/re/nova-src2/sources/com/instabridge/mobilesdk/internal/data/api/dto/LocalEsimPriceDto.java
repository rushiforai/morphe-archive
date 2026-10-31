package com.instabridge.mobilesdk.internal.data.api.dto;

import a80.m;
import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b5\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 \\2\u00020\u0001:\u0002[\\BÁ\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\u0003\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b\u0012\b\b\u0002\u0010\r\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u0007\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u0007\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0012\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0014\u001a\u00020\u0007\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u001a\u0010\u001bB¹\u0001\b\u0010\u0012\u0006\u0010\u001c\u001a\u00020\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u000e\u001a\u00020\u0003\u0012\u0006\u0010\u000f\u001a\u00020\u0007\u0012\u0006\u0010\u0010\u001a\u00020\u0007\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\b\u0010\u0013\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0014\u001a\u00020\u0007\u0012\b\u0010\u0015\u001a\u0004\u0018\u00010\u0016\u0012\b\u0010\u0017\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0019\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001d\u001a\u0004\u0018\u00010\u001e¢\u0006\u0004\b\u001a\u0010\u001fJ\t\u0010<\u001a\u00020\u0003HÆ\u0003J\t\u0010=\u001a\u00020\u0005HÆ\u0003J\t\u0010>\u001a\u00020\u0007HÆ\u0003J\t\u0010?\u001a\u00020\u0003HÆ\u0003J\t\u0010@\u001a\u00020\u0003HÆ\u0003J\t\u0010A\u001a\u00020\u000bHÆ\u0003J\t\u0010B\u001a\u00020\u000bHÆ\u0003J\t\u0010C\u001a\u00020\u0005HÆ\u0003J\t\u0010D\u001a\u00020\u0003HÆ\u0003J\t\u0010E\u001a\u00020\u0007HÆ\u0003J\t\u0010F\u001a\u00020\u0007HÆ\u0003J\t\u0010G\u001a\u00020\u0012HÆ\u0003J\t\u0010H\u001a\u00020\u0005HÆ\u0003J\t\u0010I\u001a\u00020\u0007HÆ\u0003J\u000b\u0010J\u001a\u0004\u0018\u00010\u0016HÆ\u0003J\u000b\u0010K\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010L\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010M\u001a\u0004\u0018\u00010\u0005HÆ\u0003JÅ\u0001\u0010N\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\u00032\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\u000b2\b\b\u0002\u0010\r\u001a\u00020\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u00032\b\b\u0002\u0010\u000f\u001a\u00020\u00072\b\b\u0002\u0010\u0010\u001a\u00020\u00072\b\b\u0002\u0010\u0011\u001a\u00020\u00122\b\b\u0002\u0010\u0013\u001a\u00020\u00052\b\b\u0002\u0010\u0014\u001a\u00020\u00072\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010O\u001a\u00020\u00122\b\u0010P\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010Q\u001a\u00020\u0007HÖ\u0001J\t\u0010R\u001a\u00020\u0005HÖ\u0001J%\u0010S\u001a\u00020T2\u0006\u0010U\u001a\u00020\u00002\u0006\u0010V\u001a\u00020W2\u0006\u0010X\u001a\u00020YH\u0001¢\u0006\u0002\bZR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b \u0010!R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u001c\u0010\b\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b&\u0010'\u001a\u0004\b(\u0010!R\u001c\u0010\t\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b)\u0010'\u001a\u0004\b*\u0010!R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b+\u0010,R\u0011\u0010\f\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b-\u0010,R\u0011\u0010\r\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b.\u0010#R\u0011\u0010\u000e\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b/\u0010!R\u0011\u0010\u000f\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b0\u0010%R\u0011\u0010\u0010\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b1\u0010%R\u0011\u0010\u0011\u001a\u00020\u0012¢\u0006\b\n\u0000\u001a\u0004\b2\u00103R\u0011\u0010\u0013\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b4\u0010#R\u0011\u0010\u0014\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b5\u0010%R\u0013\u0010\u0015\u001a\u0004\u0018\u00010\u0016¢\u0006\b\n\u0000\u001a\u0004\b6\u00107R\u0013\u0010\u0017\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b8\u0010#R\u0013\u0010\u0018\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b9\u0010#R\u0013\u0010\u0019\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b:\u0010#R\u0011\u0010;\u001a\u00020\u00128F¢\u0006\u0006\u001a\u0004\b;\u00103¨\u0006]"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/LocalEsimPriceDto;", b.f42142b, "packageId", b.f42142b, "packageName", b.f42142b, "durationHours", b.f42142b, "basePriceCents", "finalPriceCents", "basePriceDecimal", b.f42142b, "finalPriceDecimal", TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, "data", ActionCategory.SMS, ActionCategory.CALL, "subscription", b.f42142b, "interval", "intervalCount", "trial", "Lcom/instabridge/mobilesdk/internal/data/api/dto/TrialDto;", "externalPlanId", "externalPlanType", "externalPlanProvider", "<init>", "(JLjava/lang/String;IJJDDLjava/lang/String;JIIZLjava/lang/String;ILcom/instabridge/mobilesdk/internal/data/api/dto/TrialDto;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJLjava/lang/String;IJJDDLjava/lang/String;JIIZLjava/lang/String;ILcom/instabridge/mobilesdk/internal/data/api/dto/TrialDto;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPackageId", "()J", "getPackageName", "()Ljava/lang/String;", "getDurationHours", "()I", "getBasePriceCents$annotations", "()V", "getBasePriceCents", "getFinalPriceCents$annotations", "getFinalPriceCents", "getBasePriceDecimal", "()D", "getFinalPriceDecimal", "getCurrency", "getData", "getSms", "getCall", "getSubscription", "()Z", "getInterval", "getIntervalCount", "getTrial", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/TrialDto;", "getExternalPlanId", "getExternalPlanType", "getExternalPlanProvider", "isFreeTrial", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "component17", "component18", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class LocalEsimPriceDto {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long basePriceCents;
    private final double basePriceDecimal;
    private final int call;

    @NotNull
    private final String currency;
    private final long data;
    private final int durationHours;

    @Nullable
    private final String externalPlanId;

    @Nullable
    private final String externalPlanProvider;

    @Nullable
    private final String externalPlanType;
    private final long finalPriceCents;
    private final double finalPriceDecimal;

    @NotNull
    private final String interval;
    private final int intervalCount;
    private final long packageId;

    @NotNull
    private final String packageName;
    private final int sms;
    private final boolean subscription;

    @Nullable
    private final TrialDto trial;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/LocalEsimPriceDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/LocalEsimPriceDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<LocalEsimPriceDto> serializer() {
            return LocalEsimPriceDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ LocalEsimPriceDto(int i5, long j11, String str, int i11, long j12, long j13, double d5, double d11, String str2, long j14, int i12, int i13, boolean z11, String str3, int i14, TrialDto trialDto, String str4, String str5, String str6, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, LocalEsimPriceDto$$serializer.INSTANCE.getDescriptor());
        }
        this.packageId = j11;
        if ((i5 & 2) == 0) {
            this.packageName = b.f42142b;
        } else {
            this.packageName = str;
        }
        if ((i5 & 4) == 0) {
            this.durationHours = 0;
        } else {
            this.durationHours = i11;
        }
        if ((i5 & 8) == 0) {
            this.basePriceCents = 0L;
        } else {
            this.basePriceCents = j12;
        }
        if ((i5 & 16) == 0) {
            this.finalPriceCents = 0L;
        } else {
            this.finalPriceCents = j13;
        }
        if ((i5 & 32) == 0) {
            this.basePriceDecimal = 0.0d;
        } else {
            this.basePriceDecimal = d5;
        }
        this.finalPriceDecimal = (i5 & 64) != 0 ? d11 : 0.0d;
        this.currency = (i5 & 128) == 0 ? "USD" : str2;
        this.data = (i5 & 256) != 0 ? j14 : 0L;
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.sms = 0;
        } else {
            this.sms = i12;
        }
        if ((i5 & 1024) == 0) {
            this.call = 0;
        } else {
            this.call = i13;
        }
        if ((i5 & 2048) == 0) {
            this.subscription = false;
        } else {
            this.subscription = z11;
        }
        if ((i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.interval = b.f42142b;
        } else {
            this.interval = str3;
        }
        if ((i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) {
            this.intervalCount = 1;
        } else {
            this.intervalCount = i14;
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            this.trial = null;
        } else {
            this.trial = trialDto;
        }
        if ((32768 & i5) == 0) {
            this.externalPlanId = null;
        } else {
            this.externalPlanId = str4;
        }
        if ((65536 & i5) == 0) {
            this.externalPlanType = null;
        } else {
            this.externalPlanType = str5;
        }
        if ((i5 & SQLiteDatabase.OPEN_SHAREDCACHE) == 0) {
            this.externalPlanProvider = null;
        } else {
            this.externalPlanProvider = str6;
        }
    }

    public static /* synthetic */ LocalEsimPriceDto copy$default(LocalEsimPriceDto localEsimPriceDto, long j11, String str, int i5, long j12, long j13, double d5, double d11, String str2, long j14, int i11, int i12, boolean z11, String str3, int i13, TrialDto trialDto, String str4, String str5, String str6, int i14, Object obj) {
        long j15;
        long j16;
        String str7;
        String str8;
        long j17 = (i14 & 1) != 0 ? localEsimPriceDto.packageId : j11;
        String str9 = (i14 & 2) != 0 ? localEsimPriceDto.packageName : str;
        int i15 = (i14 & 4) != 0 ? localEsimPriceDto.durationHours : i5;
        long j18 = (i14 & 8) != 0 ? localEsimPriceDto.basePriceCents : j12;
        long j19 = (i14 & 16) != 0 ? localEsimPriceDto.finalPriceCents : j13;
        double d12 = (i14 & 32) != 0 ? localEsimPriceDto.basePriceDecimal : d5;
        double d13 = (i14 & 64) != 0 ? localEsimPriceDto.finalPriceDecimal : d11;
        String str10 = (i14 & 128) != 0 ? localEsimPriceDto.currency : str2;
        if ((i14 & 256) != 0) {
            j15 = j17;
            j16 = localEsimPriceDto.data;
        } else {
            j15 = j17;
            j16 = j14;
        }
        long j21 = j16;
        int i16 = (i14 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? localEsimPriceDto.sms : i11;
        int i17 = (i14 & 1024) != 0 ? localEsimPriceDto.call : i12;
        int i18 = i16;
        boolean z12 = (i14 & 2048) != 0 ? localEsimPriceDto.subscription : z11;
        String str11 = (i14 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? localEsimPriceDto.interval : str3;
        int i19 = (i14 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? localEsimPriceDto.intervalCount : i13;
        TrialDto trialDto2 = (i14 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? localEsimPriceDto.trial : trialDto;
        String str12 = (i14 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? localEsimPriceDto.externalPlanId : str4;
        String str13 = (i14 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? localEsimPriceDto.externalPlanType : str5;
        if ((i14 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
            str8 = str13;
            str7 = localEsimPriceDto.externalPlanProvider;
        } else {
            str7 = str6;
            str8 = str13;
        }
        return localEsimPriceDto.copy(j15, str9, i15, j18, j19, d12, d13, str10, j21, i18, i17, z12, str11, i19, trialDto2, str12, str8, str7);
    }

    @SerialName("basePrice")
    public static /* synthetic */ void getBasePriceCents$annotations() {
    }

    @SerialName("finalPrice")
    public static /* synthetic */ void getFinalPriceCents$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(LocalEsimPriceDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeLongElement(serialDesc, 0, self.packageId);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || !Intrinsics.b(self.packageName, b.f42142b)) {
            output.encodeStringElement(serialDesc, 1, self.packageName);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.durationHours != 0) {
            output.encodeIntElement(serialDesc, 2, self.durationHours);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.basePriceCents != 0) {
            output.encodeLongElement(serialDesc, 3, self.basePriceCents);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.finalPriceCents != 0) {
            output.encodeLongElement(serialDesc, 4, self.finalPriceCents);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || Double.compare(self.basePriceDecimal, 0.0d) != 0) {
            output.encodeDoubleElement(serialDesc, 5, self.basePriceDecimal);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || Double.compare(self.finalPriceDecimal, 0.0d) != 0) {
            output.encodeDoubleElement(serialDesc, 6, self.finalPriceDecimal);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || !Intrinsics.b(self.currency, "USD")) {
            output.encodeStringElement(serialDesc, 7, self.currency);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.data != 0) {
            output.encodeLongElement(serialDesc, 8, self.data);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.sms != 0) {
            output.encodeIntElement(serialDesc, 9, self.sms);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || self.call != 0) {
            output.encodeIntElement(serialDesc, 10, self.call);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 11) || self.subscription) {
            output.encodeBooleanElement(serialDesc, 11, self.subscription);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 12) || !Intrinsics.b(self.interval, b.f42142b)) {
            output.encodeStringElement(serialDesc, 12, self.interval);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 13) || self.intervalCount != 1) {
            output.encodeIntElement(serialDesc, 13, self.intervalCount);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 14) || self.trial != null) {
            output.encodeNullableSerializableElement(serialDesc, 14, TrialDto$$serializer.INSTANCE, self.trial);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 15) || self.externalPlanId != null) {
            output.encodeNullableSerializableElement(serialDesc, 15, StringSerializer.INSTANCE, self.externalPlanId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 16) || self.externalPlanType != null) {
            output.encodeNullableSerializableElement(serialDesc, 16, StringSerializer.INSTANCE, self.externalPlanType);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 17) && self.externalPlanProvider == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 17, StringSerializer.INSTANCE, self.externalPlanProvider);
    }

    /* renamed from: component1, reason: from getter */
    public final long getPackageId() {
        return this.packageId;
    }

    /* renamed from: component10, reason: from getter */
    public final int getSms() {
        return this.sms;
    }

    /* renamed from: component11, reason: from getter */
    public final int getCall() {
        return this.call;
    }

    /* renamed from: component12, reason: from getter */
    public final boolean getSubscription() {
        return this.subscription;
    }

    @NotNull
    /* renamed from: component13, reason: from getter */
    public final String getInterval() {
        return this.interval;
    }

    /* renamed from: component14, reason: from getter */
    public final int getIntervalCount() {
        return this.intervalCount;
    }

    @Nullable
    /* renamed from: component15, reason: from getter */
    public final TrialDto getTrial() {
        return this.trial;
    }

    @Nullable
    /* renamed from: component16, reason: from getter */
    public final String getExternalPlanId() {
        return this.externalPlanId;
    }

    @Nullable
    /* renamed from: component17, reason: from getter */
    public final String getExternalPlanType() {
        return this.externalPlanType;
    }

    @Nullable
    /* renamed from: component18, reason: from getter */
    public final String getExternalPlanProvider() {
        return this.externalPlanProvider;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    /* renamed from: component3, reason: from getter */
    public final int getDurationHours() {
        return this.durationHours;
    }

    /* renamed from: component4, reason: from getter */
    public final long getBasePriceCents() {
        return this.basePriceCents;
    }

    /* renamed from: component5, reason: from getter */
    public final long getFinalPriceCents() {
        return this.finalPriceCents;
    }

    /* renamed from: component6, reason: from getter */
    public final double getBasePriceDecimal() {
        return this.basePriceDecimal;
    }

    /* renamed from: component7, reason: from getter */
    public final double getFinalPriceDecimal() {
        return this.finalPriceDecimal;
    }

    @NotNull
    /* renamed from: component8, reason: from getter */
    public final String getCurrency() {
        return this.currency;
    }

    /* renamed from: component9, reason: from getter */
    public final long getData() {
        return this.data;
    }

    @NotNull
    public final LocalEsimPriceDto copy(long packageId, @NotNull String packageName, int durationHours, long basePriceCents, long finalPriceCents, double basePriceDecimal, double finalPriceDecimal, @NotNull String currency, long data, int sms, int call, boolean subscription, @NotNull String interval, int intervalCount, @Nullable TrialDto trial, @Nullable String externalPlanId, @Nullable String externalPlanType, @Nullable String externalPlanProvider) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(currency, "currency");
        Intrinsics.g(interval, "interval");
        return new LocalEsimPriceDto(packageId, packageName, durationHours, basePriceCents, finalPriceCents, basePriceDecimal, finalPriceDecimal, currency, data, sms, call, subscription, interval, intervalCount, trial, externalPlanId, externalPlanType, externalPlanProvider);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LocalEsimPriceDto)) {
            return false;
        }
        LocalEsimPriceDto localEsimPriceDto = (LocalEsimPriceDto) other;
        return this.packageId == localEsimPriceDto.packageId && Intrinsics.b(this.packageName, localEsimPriceDto.packageName) && this.durationHours == localEsimPriceDto.durationHours && this.basePriceCents == localEsimPriceDto.basePriceCents && this.finalPriceCents == localEsimPriceDto.finalPriceCents && Double.compare(this.basePriceDecimal, localEsimPriceDto.basePriceDecimal) == 0 && Double.compare(this.finalPriceDecimal, localEsimPriceDto.finalPriceDecimal) == 0 && Intrinsics.b(this.currency, localEsimPriceDto.currency) && this.data == localEsimPriceDto.data && this.sms == localEsimPriceDto.sms && this.call == localEsimPriceDto.call && this.subscription == localEsimPriceDto.subscription && Intrinsics.b(this.interval, localEsimPriceDto.interval) && this.intervalCount == localEsimPriceDto.intervalCount && Intrinsics.b(this.trial, localEsimPriceDto.trial) && Intrinsics.b(this.externalPlanId, localEsimPriceDto.externalPlanId) && Intrinsics.b(this.externalPlanType, localEsimPriceDto.externalPlanType) && Intrinsics.b(this.externalPlanProvider, localEsimPriceDto.externalPlanProvider);
    }

    public final long getBasePriceCents() {
        return this.basePriceCents;
    }

    public final double getBasePriceDecimal() {
        return this.basePriceDecimal;
    }

    public final int getCall() {
        return this.call;
    }

    @NotNull
    public final String getCurrency() {
        return this.currency;
    }

    public final long getData() {
        return this.data;
    }

    public final int getDurationHours() {
        return this.durationHours;
    }

    @Nullable
    public final String getExternalPlanId() {
        return this.externalPlanId;
    }

    @Nullable
    public final String getExternalPlanProvider() {
        return this.externalPlanProvider;
    }

    @Nullable
    public final String getExternalPlanType() {
        return this.externalPlanType;
    }

    public final long getFinalPriceCents() {
        return this.finalPriceCents;
    }

    public final double getFinalPriceDecimal() {
        return this.finalPriceDecimal;
    }

    @NotNull
    public final String getInterval() {
        return this.interval;
    }

    public final int getIntervalCount() {
        return this.intervalCount;
    }

    public final long getPackageId() {
        return this.packageId;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    public final int getSms() {
        return this.sms;
    }

    public final boolean getSubscription() {
        return this.subscription;
    }

    @Nullable
    public final TrialDto getTrial() {
        return this.trial;
    }

    public int hashCode() {
        int iA = u4.a(this.intervalCount, c0.e(c9.f(u4.a(this.call, u4.a(this.sms, c0.d(c0.e(c9.c(this.finalPriceDecimal, c9.c(this.basePriceDecimal, c0.d(c0.d(u4.a(this.durationHours, c0.e(Long.hashCode(this.packageId) * 31, 31, this.packageName), 31), 31, this.basePriceCents), 31, this.finalPriceCents), 31), 31), 31, this.currency), 31, this.data), 31), 31), 31, this.subscription), 31, this.interval), 31);
        TrialDto trialDto = this.trial;
        int iHashCode = (iA + (trialDto == null ? 0 : trialDto.hashCode())) * 31;
        String str = this.externalPlanId;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.externalPlanType;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.externalPlanProvider;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    public final boolean isFreeTrial() {
        TrialDto trialDto = this.trial;
        return trialDto != null && trialDto.isFreeTrial();
    }

    @NotNull
    public String toString() {
        long j11 = this.packageId;
        String str = this.packageName;
        int i5 = this.durationHours;
        long j12 = this.basePriceCents;
        long j13 = this.finalPriceCents;
        double d5 = this.basePriceDecimal;
        double d11 = this.finalPriceDecimal;
        String str2 = this.currency;
        long j14 = this.data;
        int i11 = this.sms;
        int i12 = this.call;
        boolean z11 = this.subscription;
        String str3 = this.interval;
        int i13 = this.intervalCount;
        TrialDto trialDto = this.trial;
        String str4 = this.externalPlanId;
        String str5 = this.externalPlanType;
        String str6 = this.externalPlanProvider;
        StringBuilder sbL = m.l(j11, "LocalEsimPriceDto(packageId=", ", packageName=", str);
        sbL.append(", durationHours=");
        sbL.append(i5);
        sbL.append(", basePriceCents=");
        sbL.append(j12);
        c0.B(sbL, ", finalPriceCents=", j13, ", basePriceDecimal=");
        sbL.append(d5);
        sbL.append(", finalPriceDecimal=");
        sbL.append(d11);
        sbL.append(", currency=");
        sbL.append(str2);
        sbL.append(", data=");
        sbL.append(j14);
        sbL.append(", sms=");
        sbL.append(i11);
        sbL.append(", call=");
        sbL.append(i12);
        sbL.append(", subscription=");
        sbL.append(z11);
        sbL.append(", interval=");
        sbL.append(str3);
        sbL.append(", intervalCount=");
        sbL.append(i13);
        sbL.append(", trial=");
        sbL.append(trialDto);
        c0.D(sbL, ", externalPlanId=", str4, ", externalPlanType=", str5);
        return c0.r(sbL, ", externalPlanProvider=", str6, ")");
    }

    public LocalEsimPriceDto(long j11, @NotNull String packageName, int i5, long j12, long j13, double d5, double d11, @NotNull String currency, long j14, int i11, int i12, boolean z11, @NotNull String interval, int i13, @Nullable TrialDto trialDto, @Nullable String str, @Nullable String str2, @Nullable String str3) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(currency, "currency");
        Intrinsics.g(interval, "interval");
        this.packageId = j11;
        this.packageName = packageName;
        this.durationHours = i5;
        this.basePriceCents = j12;
        this.finalPriceCents = j13;
        this.basePriceDecimal = d5;
        this.finalPriceDecimal = d11;
        this.currency = currency;
        this.data = j14;
        this.sms = i11;
        this.call = i12;
        this.subscription = z11;
        this.interval = interval;
        this.intervalCount = i13;
        this.trial = trialDto;
        this.externalPlanId = str;
        this.externalPlanType = str2;
        this.externalPlanProvider = str3;
    }

    public /* synthetic */ LocalEsimPriceDto(long j11, String str, int i5, long j12, long j13, double d5, double d11, String str2, long j14, int i11, int i12, boolean z11, String str3, int i13, TrialDto trialDto, String str4, String str5, String str6, int i14, DefaultConstructorMarker defaultConstructorMarker) {
        this(j11, (i14 & 2) != 0 ? b.f42142b : str, (i14 & 4) != 0 ? 0 : i5, (i14 & 8) != 0 ? 0L : j12, (i14 & 16) != 0 ? 0L : j13, (i14 & 32) != 0 ? 0.0d : d5, (i14 & 64) == 0 ? d11 : 0.0d, (i14 & 128) != 0 ? "USD" : str2, (i14 & 256) != 0 ? 0L : j14, (i14 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? 0 : i11, (i14 & 1024) != 0 ? 0 : i12, (i14 & 2048) != 0 ? false : z11, (i14 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? b.f42142b : str3, (i14 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? 1 : i13, (i14 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : trialDto, (32768 & i14) != 0 ? null : str4, (65536 & i14) != 0 ? null : str5, (i14 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? null : str6);
    }
}
