package com.instabridge.mobilesdk;

import a80.m;
import android.content.Context;
import androidx.recyclerview.widget.u1;
import b.c0;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.api.AnalyticsSink;
import com.instabridge.mobilesdk.api.FlowEventListener;
import com.instabridge.mobilesdk.api.PlanFilter;
import com.instabridge.mobilesdk.api.RemoteConfigProvider;
import com.instabridge.mobilesdk.api.TokenProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b9\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001Bé\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r\u0012\u0016\b\u0002\u0010\u0010\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u0018\u001a\u00020\u0019\u0012\b\b\u0002\u0010\u001a\u001a\u00020\u001b\u0012\b\b\u0002\u0010\u001c\u001a\u00020\u001d\u0012\b\b\u0002\u0010\u001e\u001a\u00020\u001f\u0012\b\b\u0002\u0010 \u001a\u00020!\u0012\b\b\u0002\u0010\"\u001a\u00020\t¢\u0006\u0004\b#\u0010$J\t\u0010D\u001a\u00020\u0003HÆ\u0003J\t\u0010E\u001a\u00020\u0005HÆ\u0003J\u000b\u0010F\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0011\u0010G\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\bHÆ\u0003J\u000b\u0010H\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010I\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010J\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010K\u001a\u0004\u0018\u00010\rHÆ\u0003J\u0017\u0010L\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u0011HÆ\u0003J\u000b\u0010M\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010N\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010O\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010P\u001a\u0004\u0018\u00010\rHÆ\u0003J\t\u0010Q\u001a\u00020\u0019HÆ\u0003J\t\u0010R\u001a\u00020\u001bHÆ\u0003J\t\u0010S\u001a\u00020\u001dHÆ\u0003J\t\u0010T\u001a\u00020\u001fHÆ\u0003J\t\u0010U\u001a\u00020!HÆ\u0003J\t\u0010V\u001a\u00020\tHÆ\u0003Jï\u0001\u0010W\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r2\u0016\b\u0002\u0010\u0010\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u00112\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u0018\u001a\u00020\u00192\b\b\u0002\u0010\u001a\u001a\u00020\u001b2\b\b\u0002\u0010\u001c\u001a\u00020\u001d2\b\b\u0002\u0010\u001e\u001a\u00020\u001f2\b\b\u0002\u0010 \u001a\u00020!2\b\b\u0002\u0010\"\u001a\u00020\tHÆ\u0001J\u0013\u0010X\u001a\u00020\t2\b\u0010Y\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010Z\u001a\u00020[HÖ\u0001J\t\u0010\\\u001a\u00020\rHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b%\u0010&R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b'\u0010(R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b)\u0010(R\u0019\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b*\u0010+R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b,\u0010-R\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b.\u0010/R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b0\u0010/R\u0013\u0010\u000f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b1\u0010/R\u001f\u0010\u0010\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u0011¢\u0006\b\n\u0000\u001a\u0004\b2\u00103R\u0013\u0010\u0014\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b4\u0010/R\u0013\u0010\u0015\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b5\u0010/R\u0013\u0010\u0016\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b6\u0010/R\u0013\u0010\u0017\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b7\u0010/R\u0011\u0010\u0018\u001a\u00020\u0019¢\u0006\b\n\u0000\u001a\u0004\b8\u00109R\u0011\u0010\u001a\u001a\u00020\u001b¢\u0006\b\n\u0000\u001a\u0004\b:\u0010;R\u0011\u0010\u001c\u001a\u00020\u001d¢\u0006\b\n\u0000\u001a\u0004\b<\u0010=R\u0011\u0010\u001e\u001a\u00020\u001f¢\u0006\b\n\u0000\u001a\u0004\b>\u0010?R\u0011\u0010 \u001a\u00020!¢\u0006\b\n\u0000\u001a\u0004\b@\u0010AR\u0011\u0010\"\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\bB\u0010C¨\u0006]"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdkConfig;", b.f42142b, "brand", "Lcom/instabridge/mobilesdk/Brand;", "theme", "Lcom/instabridge/mobilesdk/MobileSdkTheme;", "darkTheme", "darkModeProvider", "Lkotlin/Function0;", b.f42142b, "fontAssets", "Lcom/instabridge/mobilesdk/MobileSdkFonts;", "googleWebClientId", b.f42142b, "privacyPolicyUrl", "supportUrl", "onContactSupport", "Lkotlin/Function1;", "Landroid/content/Context;", b.f42142b, "googlePlacesApiKey", "brandUid", "brandApiKey", "stripePublishableKey", "analytics", "Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "tokenProvider", "Lcom/instabridge/mobilesdk/api/TokenProvider;", "planFilter", "Lcom/instabridge/mobilesdk/api/PlanFilter;", "eventListener", "Lcom/instabridge/mobilesdk/api/FlowEventListener;", "remoteConfig", "Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;", "debug", "<init>", "(Lcom/instabridge/mobilesdk/Brand;Lcom/instabridge/mobilesdk/MobileSdkTheme;Lcom/instabridge/mobilesdk/MobileSdkTheme;Lkotlin/jvm/functions/Function0;Lcom/instabridge/mobilesdk/MobileSdkFonts;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/api/AnalyticsSink;Lcom/instabridge/mobilesdk/api/TokenProvider;Lcom/instabridge/mobilesdk/api/PlanFilter;Lcom/instabridge/mobilesdk/api/FlowEventListener;Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;Z)V", "getBrand", "()Lcom/instabridge/mobilesdk/Brand;", "getTheme", "()Lcom/instabridge/mobilesdk/MobileSdkTheme;", "getDarkTheme", "getDarkModeProvider", "()Lkotlin/jvm/functions/Function0;", "getFontAssets", "()Lcom/instabridge/mobilesdk/MobileSdkFonts;", "getGoogleWebClientId", "()Ljava/lang/String;", "getPrivacyPolicyUrl", "getSupportUrl", "getOnContactSupport", "()Lkotlin/jvm/functions/Function1;", "getGooglePlacesApiKey", "getBrandUid", "getBrandApiKey", "getStripePublishableKey", "getAnalytics", "()Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "getTokenProvider", "()Lcom/instabridge/mobilesdk/api/TokenProvider;", "getPlanFilter", "()Lcom/instabridge/mobilesdk/api/PlanFilter;", "getEventListener", "()Lcom/instabridge/mobilesdk/api/FlowEventListener;", "getRemoteConfig", "()Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;", "getDebug", "()Z", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "component17", "component18", "component19", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class MobileSdkConfig {
    public static final int $stable = 0;

    @NotNull
    private final AnalyticsSink analytics;

    @NotNull
    private final Brand brand;

    @Nullable
    private final String brandApiKey;

    @Nullable
    private final String brandUid;

    @Nullable
    private final Function0<Boolean> darkModeProvider;

    @Nullable
    private final MobileSdkTheme darkTheme;
    private final boolean debug;

    @NotNull
    private final FlowEventListener eventListener;

    @Nullable
    private final MobileSdkFonts fontAssets;

    @Nullable
    private final String googlePlacesApiKey;

    @Nullable
    private final String googleWebClientId;

    @Nullable
    private final Function1<Context, Unit> onContactSupport;

    @NotNull
    private final PlanFilter planFilter;

    @Nullable
    private final String privacyPolicyUrl;

    @NotNull
    private final RemoteConfigProvider remoteConfig;

    @Nullable
    private final String stripePublishableKey;

    @Nullable
    private final String supportUrl;

    @NotNull
    private final MobileSdkTheme theme;

    @NotNull
    private final TokenProvider tokenProvider;

    /* JADX WARN: Multi-variable type inference failed */
    public MobileSdkConfig(@NotNull Brand brand, @NotNull MobileSdkTheme theme, @Nullable MobileSdkTheme mobileSdkTheme, @Nullable Function0<Boolean> function0, @Nullable MobileSdkFonts mobileSdkFonts, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable Function1<? super Context, Unit> function1, @Nullable String str4, @Nullable String str5, @Nullable String str6, @Nullable String str7, @NotNull AnalyticsSink analytics, @NotNull TokenProvider tokenProvider, @NotNull PlanFilter planFilter, @NotNull FlowEventListener eventListener, @NotNull RemoteConfigProvider remoteConfig, boolean z11) {
        Intrinsics.g(brand, "brand");
        Intrinsics.g(theme, "theme");
        Intrinsics.g(analytics, "analytics");
        Intrinsics.g(tokenProvider, "tokenProvider");
        Intrinsics.g(planFilter, "planFilter");
        Intrinsics.g(eventListener, "eventListener");
        Intrinsics.g(remoteConfig, "remoteConfig");
        this.brand = brand;
        this.theme = theme;
        this.darkTheme = mobileSdkTheme;
        this.darkModeProvider = function0;
        this.fontAssets = mobileSdkFonts;
        this.googleWebClientId = str;
        this.privacyPolicyUrl = str2;
        this.supportUrl = str3;
        this.onContactSupport = function1;
        this.googlePlacesApiKey = str4;
        this.brandUid = str5;
        this.brandApiKey = str6;
        this.stripePublishableKey = str7;
        this.analytics = analytics;
        this.tokenProvider = tokenProvider;
        this.planFilter = planFilter;
        this.eventListener = eventListener;
        this.remoteConfig = remoteConfig;
        this.debug = z11;
    }

    public static /* synthetic */ MobileSdkConfig copy$default(MobileSdkConfig mobileSdkConfig, Brand brand, MobileSdkTheme mobileSdkTheme, MobileSdkTheme mobileSdkTheme2, Function0 function0, MobileSdkFonts mobileSdkFonts, String str, String str2, String str3, Function1 function1, String str4, String str5, String str6, String str7, AnalyticsSink analyticsSink, TokenProvider tokenProvider, PlanFilter planFilter, FlowEventListener flowEventListener, RemoteConfigProvider remoteConfigProvider, boolean z11, int i5, Object obj) {
        boolean z12;
        RemoteConfigProvider remoteConfigProvider2;
        Brand brand2 = (i5 & 1) != 0 ? mobileSdkConfig.brand : brand;
        MobileSdkTheme mobileSdkTheme3 = (i5 & 2) != 0 ? mobileSdkConfig.theme : mobileSdkTheme;
        MobileSdkTheme mobileSdkTheme4 = (i5 & 4) != 0 ? mobileSdkConfig.darkTheme : mobileSdkTheme2;
        Function0 function02 = (i5 & 8) != 0 ? mobileSdkConfig.darkModeProvider : function0;
        MobileSdkFonts mobileSdkFonts2 = (i5 & 16) != 0 ? mobileSdkConfig.fontAssets : mobileSdkFonts;
        String str8 = (i5 & 32) != 0 ? mobileSdkConfig.googleWebClientId : str;
        String str9 = (i5 & 64) != 0 ? mobileSdkConfig.privacyPolicyUrl : str2;
        String str10 = (i5 & 128) != 0 ? mobileSdkConfig.supportUrl : str3;
        Function1 function12 = (i5 & 256) != 0 ? mobileSdkConfig.onContactSupport : function1;
        String str11 = (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? mobileSdkConfig.googlePlacesApiKey : str4;
        String str12 = (i5 & 1024) != 0 ? mobileSdkConfig.brandUid : str5;
        String str13 = (i5 & 2048) != 0 ? mobileSdkConfig.brandApiKey : str6;
        String str14 = (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? mobileSdkConfig.stripePublishableKey : str7;
        AnalyticsSink analyticsSink2 = (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? mobileSdkConfig.analytics : analyticsSink;
        Brand brand3 = brand2;
        TokenProvider tokenProvider2 = (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? mobileSdkConfig.tokenProvider : tokenProvider;
        PlanFilter planFilter2 = (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? mobileSdkConfig.planFilter : planFilter;
        FlowEventListener flowEventListener2 = (i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? mobileSdkConfig.eventListener : flowEventListener;
        RemoteConfigProvider remoteConfigProvider3 = (i5 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? mobileSdkConfig.remoteConfig : remoteConfigProvider;
        if ((i5 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0) {
            remoteConfigProvider2 = remoteConfigProvider3;
            z12 = mobileSdkConfig.debug;
        } else {
            z12 = z11;
            remoteConfigProvider2 = remoteConfigProvider3;
        }
        return mobileSdkConfig.copy(brand3, mobileSdkTheme3, mobileSdkTheme4, function02, mobileSdkFonts2, str8, str9, str10, function12, str11, str12, str13, str14, analyticsSink2, tokenProvider2, planFilter2, flowEventListener2, remoteConfigProvider2, z12);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final Brand getBrand() {
        return this.brand;
    }

    @Nullable
    /* renamed from: component10, reason: from getter */
    public final String getGooglePlacesApiKey() {
        return this.googlePlacesApiKey;
    }

    @Nullable
    /* renamed from: component11, reason: from getter */
    public final String getBrandUid() {
        return this.brandUid;
    }

    @Nullable
    /* renamed from: component12, reason: from getter */
    public final String getBrandApiKey() {
        return this.brandApiKey;
    }

    @Nullable
    /* renamed from: component13, reason: from getter */
    public final String getStripePublishableKey() {
        return this.stripePublishableKey;
    }

    @NotNull
    /* renamed from: component14, reason: from getter */
    public final AnalyticsSink getAnalytics() {
        return this.analytics;
    }

    @NotNull
    /* renamed from: component15, reason: from getter */
    public final TokenProvider getTokenProvider() {
        return this.tokenProvider;
    }

    @NotNull
    /* renamed from: component16, reason: from getter */
    public final PlanFilter getPlanFilter() {
        return this.planFilter;
    }

    @NotNull
    /* renamed from: component17, reason: from getter */
    public final FlowEventListener getEventListener() {
        return this.eventListener;
    }

    @NotNull
    /* renamed from: component18, reason: from getter */
    public final RemoteConfigProvider getRemoteConfig() {
        return this.remoteConfig;
    }

    /* renamed from: component19, reason: from getter */
    public final boolean getDebug() {
        return this.debug;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final MobileSdkTheme getTheme() {
        return this.theme;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final MobileSdkTheme getDarkTheme() {
        return this.darkTheme;
    }

    @Nullable
    public final Function0<Boolean> component4() {
        return this.darkModeProvider;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final MobileSdkFonts getFontAssets() {
        return this.fontAssets;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getGoogleWebClientId() {
        return this.googleWebClientId;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getPrivacyPolicyUrl() {
        return this.privacyPolicyUrl;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final String getSupportUrl() {
        return this.supportUrl;
    }

    @Nullable
    public final Function1<Context, Unit> component9() {
        return this.onContactSupport;
    }

    @NotNull
    public final MobileSdkConfig copy(@NotNull Brand brand, @NotNull MobileSdkTheme theme, @Nullable MobileSdkTheme darkTheme, @Nullable Function0<Boolean> darkModeProvider, @Nullable MobileSdkFonts fontAssets, @Nullable String googleWebClientId, @Nullable String privacyPolicyUrl, @Nullable String supportUrl, @Nullable Function1<? super Context, Unit> onContactSupport, @Nullable String googlePlacesApiKey, @Nullable String brandUid, @Nullable String brandApiKey, @Nullable String stripePublishableKey, @NotNull AnalyticsSink analytics, @NotNull TokenProvider tokenProvider, @NotNull PlanFilter planFilter, @NotNull FlowEventListener eventListener, @NotNull RemoteConfigProvider remoteConfig, boolean debug) {
        Intrinsics.g(brand, "brand");
        Intrinsics.g(theme, "theme");
        Intrinsics.g(analytics, "analytics");
        Intrinsics.g(tokenProvider, "tokenProvider");
        Intrinsics.g(planFilter, "planFilter");
        Intrinsics.g(eventListener, "eventListener");
        Intrinsics.g(remoteConfig, "remoteConfig");
        return new MobileSdkConfig(brand, theme, darkTheme, darkModeProvider, fontAssets, googleWebClientId, privacyPolicyUrl, supportUrl, onContactSupport, googlePlacesApiKey, brandUid, brandApiKey, stripePublishableKey, analytics, tokenProvider, planFilter, eventListener, remoteConfig, debug);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MobileSdkConfig)) {
            return false;
        }
        MobileSdkConfig mobileSdkConfig = (MobileSdkConfig) other;
        return this.brand == mobileSdkConfig.brand && Intrinsics.b(this.theme, mobileSdkConfig.theme) && Intrinsics.b(this.darkTheme, mobileSdkConfig.darkTheme) && Intrinsics.b(this.darkModeProvider, mobileSdkConfig.darkModeProvider) && Intrinsics.b(this.fontAssets, mobileSdkConfig.fontAssets) && Intrinsics.b(this.googleWebClientId, mobileSdkConfig.googleWebClientId) && Intrinsics.b(this.privacyPolicyUrl, mobileSdkConfig.privacyPolicyUrl) && Intrinsics.b(this.supportUrl, mobileSdkConfig.supportUrl) && Intrinsics.b(this.onContactSupport, mobileSdkConfig.onContactSupport) && Intrinsics.b(this.googlePlacesApiKey, mobileSdkConfig.googlePlacesApiKey) && Intrinsics.b(this.brandUid, mobileSdkConfig.brandUid) && Intrinsics.b(this.brandApiKey, mobileSdkConfig.brandApiKey) && Intrinsics.b(this.stripePublishableKey, mobileSdkConfig.stripePublishableKey) && Intrinsics.b(this.analytics, mobileSdkConfig.analytics) && Intrinsics.b(this.tokenProvider, mobileSdkConfig.tokenProvider) && Intrinsics.b(this.planFilter, mobileSdkConfig.planFilter) && Intrinsics.b(this.eventListener, mobileSdkConfig.eventListener) && Intrinsics.b(this.remoteConfig, mobileSdkConfig.remoteConfig) && this.debug == mobileSdkConfig.debug;
    }

    @NotNull
    public final AnalyticsSink getAnalytics() {
        return this.analytics;
    }

    @NotNull
    public final Brand getBrand() {
        return this.brand;
    }

    @Nullable
    public final String getBrandApiKey() {
        return this.brandApiKey;
    }

    @Nullable
    public final String getBrandUid() {
        return this.brandUid;
    }

    @Nullable
    public final Function0<Boolean> getDarkModeProvider() {
        return this.darkModeProvider;
    }

    @Nullable
    public final MobileSdkTheme getDarkTheme() {
        return this.darkTheme;
    }

    public final boolean getDebug() {
        return this.debug;
    }

    @NotNull
    public final FlowEventListener getEventListener() {
        return this.eventListener;
    }

    @Nullable
    public final MobileSdkFonts getFontAssets() {
        return this.fontAssets;
    }

    @Nullable
    public final String getGooglePlacesApiKey() {
        return this.googlePlacesApiKey;
    }

    @Nullable
    public final String getGoogleWebClientId() {
        return this.googleWebClientId;
    }

    @Nullable
    public final Function1<Context, Unit> getOnContactSupport() {
        return this.onContactSupport;
    }

    @NotNull
    public final PlanFilter getPlanFilter() {
        return this.planFilter;
    }

    @Nullable
    public final String getPrivacyPolicyUrl() {
        return this.privacyPolicyUrl;
    }

    @NotNull
    public final RemoteConfigProvider getRemoteConfig() {
        return this.remoteConfig;
    }

    @Nullable
    public final String getStripePublishableKey() {
        return this.stripePublishableKey;
    }

    @Nullable
    public final String getSupportUrl() {
        return this.supportUrl;
    }

    @NotNull
    public final MobileSdkTheme getTheme() {
        return this.theme;
    }

    @NotNull
    public final TokenProvider getTokenProvider() {
        return this.tokenProvider;
    }

    public int hashCode() {
        int iHashCode = (this.theme.hashCode() + (this.brand.hashCode() * 31)) * 31;
        MobileSdkTheme mobileSdkTheme = this.darkTheme;
        int iHashCode2 = (iHashCode + (mobileSdkTheme == null ? 0 : mobileSdkTheme.hashCode())) * 31;
        Function0<Boolean> function0 = this.darkModeProvider;
        int iHashCode3 = (iHashCode2 + (function0 == null ? 0 : function0.hashCode())) * 31;
        MobileSdkFonts mobileSdkFonts = this.fontAssets;
        int iHashCode4 = (iHashCode3 + (mobileSdkFonts == null ? 0 : mobileSdkFonts.hashCode())) * 31;
        String str = this.googleWebClientId;
        int iHashCode5 = (iHashCode4 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.privacyPolicyUrl;
        int iHashCode6 = (iHashCode5 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.supportUrl;
        int iHashCode7 = (iHashCode6 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Function1<Context, Unit> function1 = this.onContactSupport;
        int iHashCode8 = (iHashCode7 + (function1 == null ? 0 : function1.hashCode())) * 31;
        String str4 = this.googlePlacesApiKey;
        int iHashCode9 = (iHashCode8 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.brandUid;
        int iHashCode10 = (iHashCode9 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.brandApiKey;
        int iHashCode11 = (iHashCode10 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.stripePublishableKey;
        return Boolean.hashCode(this.debug) + ((this.remoteConfig.hashCode() + ((this.eventListener.hashCode() + ((this.planFilter.hashCode() + ((this.tokenProvider.hashCode() + ((this.analytics.hashCode() + ((iHashCode11 + (str7 != null ? str7.hashCode() : 0)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    @NotNull
    public String toString() {
        Brand brand = this.brand;
        MobileSdkTheme mobileSdkTheme = this.theme;
        MobileSdkTheme mobileSdkTheme2 = this.darkTheme;
        Function0<Boolean> function0 = this.darkModeProvider;
        MobileSdkFonts mobileSdkFonts = this.fontAssets;
        String str = this.googleWebClientId;
        String str2 = this.privacyPolicyUrl;
        String str3 = this.supportUrl;
        Function1<Context, Unit> function1 = this.onContactSupport;
        String str4 = this.googlePlacesApiKey;
        String str5 = this.brandUid;
        String str6 = this.brandApiKey;
        String str7 = this.stripePublishableKey;
        AnalyticsSink analyticsSink = this.analytics;
        TokenProvider tokenProvider = this.tokenProvider;
        PlanFilter planFilter = this.planFilter;
        FlowEventListener flowEventListener = this.eventListener;
        RemoteConfigProvider remoteConfigProvider = this.remoteConfig;
        boolean z11 = this.debug;
        StringBuilder sb2 = new StringBuilder("MobileSdkConfig(brand=");
        sb2.append(brand);
        sb2.append(", theme=");
        sb2.append(mobileSdkTheme);
        sb2.append(", darkTheme=");
        sb2.append(mobileSdkTheme2);
        sb2.append(", darkModeProvider=");
        sb2.append(function0);
        sb2.append(", fontAssets=");
        sb2.append(mobileSdkFonts);
        sb2.append(", googleWebClientId=");
        sb2.append(str);
        sb2.append(", privacyPolicyUrl=");
        c0.D(sb2, str2, ", supportUrl=", str3, ", onContactSupport=");
        sb2.append(function1);
        sb2.append(", googlePlacesApiKey=");
        sb2.append(str4);
        sb2.append(", brandUid=");
        c0.D(sb2, str5, ", brandApiKey=", str6, ", stripePublishableKey=");
        sb2.append(str7);
        sb2.append(", analytics=");
        sb2.append(analyticsSink);
        sb2.append(", tokenProvider=");
        sb2.append(tokenProvider);
        sb2.append(", planFilter=");
        sb2.append(planFilter);
        sb2.append(", eventListener=");
        sb2.append(flowEventListener);
        sb2.append(", remoteConfig=");
        sb2.append(remoteConfigProvider);
        sb2.append(", debug=");
        return m.k(sb2, z11, ")");
    }

    public /* synthetic */ MobileSdkConfig(Brand brand, MobileSdkTheme mobileSdkTheme, MobileSdkTheme mobileSdkTheme2, Function0 function0, MobileSdkFonts mobileSdkFonts, String str, String str2, String str3, Function1 function1, String str4, String str5, String str6, String str7, AnalyticsSink analyticsSink, TokenProvider tokenProvider, PlanFilter planFilter, FlowEventListener flowEventListener, RemoteConfigProvider remoteConfigProvider, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(brand, mobileSdkTheme, (i5 & 4) != 0 ? null : mobileSdkTheme2, (i5 & 8) != 0 ? null : function0, (i5 & 16) != 0 ? null : mobileSdkFonts, (i5 & 32) != 0 ? null : str, (i5 & 64) != 0 ? null : str2, (i5 & 128) != 0 ? null : str3, (i5 & 256) != 0 ? null : function1, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : str4, (i5 & 1024) != 0 ? null : str5, (i5 & 2048) != 0 ? null : str6, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : str7, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? AnalyticsSink.INSTANCE.getNoop() : analyticsSink, (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? new TokenProvider() { // from class: com.instabridge.mobilesdk.MobileSdkConfig.1
            @Override // com.instabridge.mobilesdk.api.TokenProvider
            public final Object getToken(Continuation<? super String> continuation) {
                return null;
            }
        } : tokenProvider, (32768 & i5) != 0 ? PlanFilter.INSTANCE.getIdentity() : planFilter, (65536 & i5) != 0 ? FlowEventListener.INSTANCE.getNoop() : flowEventListener, (131072 & i5) != 0 ? RemoteConfigProvider.INSTANCE.getEmpty() : remoteConfigProvider, (i5 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? false : z11);
    }
}
