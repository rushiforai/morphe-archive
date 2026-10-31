package com.instabridge.mobilesdk;

import ab.e0;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.telephony.euicc.EuiccManager;
import b.c0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.consent_sdk.h5;
import com.instabridge.mobilesdk.internal.ServiceGraph;
import com.instabridge.mobilesdk.internal.analytics.Events;
import com.instabridge.mobilesdk.internal.auth.BrandSigninApi;
import com.instabridge.mobilesdk.internal.auth.BrandSigninRequest;
import com.instabridge.mobilesdk.internal.auth.ClientSignInRequest;
import com.instabridge.mobilesdk.internal.auth.ClientSignInResponse;
import com.instabridge.mobilesdk.internal.auth.SignedInStore;
import com.instabridge.mobilesdk.internal.data.api.dto.JourneyResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.OfferClaimedInfo;
import com.instabridge.mobilesdk.internal.data.repo.JourneyRepository;
import com.instabridge.mobilesdk.internal.data.repo.MobileEligibility;
import com.instabridge.mobilesdk.internal.data.repo.PurchasedPackagesRepository;
import com.instabridge.mobilesdk.internal.eligibility.CountryDetector;
import com.instabridge.mobilesdk.internal.ui.MobileFlowActivity;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import eb0.p0;
import h6.c1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÇ\u0002\u0018\u00002\u00020\u0001:\u0001AB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rJ\u000e\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\u0007J\r\u0010\u0018\u001a\u00020\u0007H\u0000¢\u0006\u0002\b\u0019J\r\u0010\u001a\u001a\u0004\u0018\u00010\u001b¢\u0006\u0002\u0010\u001cJ\u0010\u0010 \u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0010\u0010!\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0016\u0010\"\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000bH\u0086@¢\u0006\u0002\u0010#J8\u0010$\u001a\u00020%2\u0006\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010&\u001a\u00020'2\n\b\u0002\u0010(\u001a\u0004\u0018\u00010)2\b\b\u0002\u0010*\u001a\u00020\u00072\b\b\u0002\u0010+\u001a\u00020\u0007J\u0010\u0010,\u001a\u0004\u0018\u00010)H\u0086@¢\u0006\u0002\u0010-J\u0010\u0010.\u001a\u0004\u0018\u00010/H\u0086@¢\u0006\u0002\u0010-J\u000e\u00100\u001a\u0004\u0018\u000101*\u00020\u001fH\u0002J\u000e\u00102\u001a\u00020\u0007H\u0086@¢\u0006\u0002\u0010-J.\u00103\u001a\u0002042\u0006\u00105\u001a\u00020\u001f2\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u001f2\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u001fH\u0086@¢\u0006\u0002\u00108J\u0014\u00109\u001a\b\u0012\u0004\u0012\u00020;0:H\u0086@¢\u0006\u0002\u0010-J\f\u0010<\u001a\u00020\u0007*\u00020\u0005H\u0002J\u0010\u0010=\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000bH\u0002J\r\u0010?\u001a\u00020\u0005H\u0000¢\u0006\u0002\b@R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u000e\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0012\u001a\u00020\u00138F¢\u0006\u0006\u001a\u0004\b\u0014\u0010\u0015R\u0014\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u001f0\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010>\u001a\u00020\u001bX\u0082T¢\u0006\u0002\n\u0000¨\u0006B"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdk;", b.f42142b, "<init>", "()V", "graph", "Lcom/instabridge/mobilesdk/internal/ServiceGraph;", "analyticsConsentGranted", b.f42142b, "initialize", b.f42142b, "context", "Landroid/content/Context;", "config", "Lcom/instabridge/mobilesdk/MobileSdkConfig;", "brand", "Lcom/instabridge/mobilesdk/Brand;", "getBrand", "()Lcom/instabridge/mobilesdk/Brand;", "theme", "Lcom/instabridge/mobilesdk/MobileSdkTheme;", "getTheme", "()Lcom/instabridge/mobilesdk/MobileSdkTheme;", "setAnalyticsConsent", "granted", "isAnalyticsConsentGranted", "isAnalyticsConsentGranted$mobile_sdk_release", "signedInUserId", b.f42142b, "()Ljava/lang/Long;", "SUPPORTED_COUNTRIES", b.f42142b, b.f42142b, "isEligibleForMobile", "isTravelEsimSupported", "isOfferAvailable", "(Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "createIntent", "Landroid/content/Intent;", "mode", "Lcom/instabridge/mobilesdk/MobileFlowMode;", "journeyState", "Lcom/instabridge/mobilesdk/JourneyState;", "localPlanOfferable", "travelOfferable", "fetchJourneyState", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "fetchJourneyResult", "Lcom/instabridge/mobilesdk/JourneyResult;", "toClaimedProvider", "Lcom/instabridge/mobilesdk/ClaimedProvider;", "isOnboarded", "signInWithGoogleToken", "Lcom/instabridge/mobilesdk/MobileSdk$SignInResult;", "idToken", ActionCategory.EMAIL, "displayName", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getPurchasedPackages", b.f42142b, "Lcom/instabridge/mobilesdk/PurchasedPackage;", "locallyInstalled", "hasCarrierPrivileges", "ESIM_INSTALL_GRACE_MILLIS", "requireGraph", "requireGraph$mobile_sdk_release", "SignInResult", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class MobileSdk {
    private static final long ESIM_INSTALL_GRACE_MILLIS = 3600000;
    private static volatile boolean analyticsConsentGranted;

    @Nullable
    private static ServiceGraph graph;

    @NotNull
    public static final MobileSdk INSTANCE = new MobileSdk();

    @NotNull
    private static final Set<String> SUPPORTED_COUNTRIES = e0.U("US");
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdk$SignInResult;", b.f42142b, "Success", "Failure", "Lcom/instabridge/mobilesdk/MobileSdk$SignInResult$Failure;", "Lcom/instabridge/mobilesdk/MobileSdk$SignInResult$Success;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface SignInResult {

        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdk$SignInResult$Failure;", "Lcom/instabridge/mobilesdk/MobileSdk$SignInResult;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Failure implements SignInResult {
            public static final int $stable = 0;

            @NotNull
            private final String message;

            public Failure(@NotNull String message) {
                Intrinsics.g(message, "message");
                this.message = message;
            }

            public static /* synthetic */ Failure copy$default(Failure failure, String str, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = failure.message;
                }
                return failure.copy(str);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getMessage() {
                return this.message;
            }

            @NotNull
            public final Failure copy(@NotNull String message) {
                Intrinsics.g(message, "message");
                return new Failure(message);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Failure) && Intrinsics.b(this.message, ((Failure) other).message);
            }

            @NotNull
            public final String getMessage() {
                return this.message;
            }

            public int hashCode() {
                return this.message.hashCode();
            }

            @NotNull
            public String toString() {
                return c0.l("Failure(message=", this.message, ")");
            }
        }

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdk$SignInResult$Success;", "Lcom/instabridge/mobilesdk/MobileSdk$SignInResult;", "userId", b.f42142b, "<init>", "(J)V", "getUserId", "()J", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Success implements SignInResult {
            public static final int $stable = 0;
            private final long userId;

            public Success(long j11) {
                this.userId = j11;
            }

            public static /* synthetic */ Success copy$default(Success success, long j11, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    j11 = success.userId;
                }
                return success.copy(j11);
            }

            /* renamed from: component1, reason: from getter */
            public final long getUserId() {
                return this.userId;
            }

            @NotNull
            public final Success copy(long userId) {
                return new Success(userId);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Success) && this.userId == ((Success) other).userId;
            }

            public final long getUserId() {
                return this.userId;
            }

            public int hashCode() {
                return Long.hashCode(this.userId);
            }

            @NotNull
            public String toString() {
                return c1.o(this.userId, "Success(userId=", ")");
            }
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.MobileSdk", f = "MobileSdk.kt", l = {Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE}, m = "fetchJourneyResult")
    /* renamed from: com.instabridge.mobilesdk.MobileSdk$fetchJourneyResult$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileSdk.this.fetchJourneyResult(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.MobileSdk", f = "MobileSdk.kt", l = {290}, m = "fetchJourneyState")
    /* renamed from: com.instabridge.mobilesdk.MobileSdk$fetchJourneyState$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28621 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28621(Continuation<? super C28621> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileSdk.this.fetchJourneyState(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.MobileSdk", f = "MobileSdk.kt", l = {450}, m = "getPurchasedPackages")
    /* renamed from: com.instabridge.mobilesdk.MobileSdk$getPurchasedPackages$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28631 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28631(Continuation<? super C28631> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileSdk.this.getPurchasedPackages(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.MobileSdk", f = "MobileSdk.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE}, m = "isOfferAvailable")
    /* renamed from: com.instabridge.mobilesdk.MobileSdk$isOfferAvailable$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28641 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28641(Continuation<? super C28641> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileSdk.this.isOfferAvailable(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.MobileSdk", f = "MobileSdk.kt", l = {335}, m = "isOnboarded")
    /* renamed from: com.instabridge.mobilesdk.MobileSdk$isOnboarded$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28651 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28651(Continuation<? super C28651> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileSdk.this.isOnboarded(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.MobileSdk", f = "MobileSdk.kt", l = {392, TTAdConstant.VIDEO_INFO_CODE}, m = "signInWithGoogleToken")
    /* renamed from: com.instabridge.mobilesdk.MobileSdk$signInWithGoogleToken$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28661 extends ContinuationImpl {
        long J$0;
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        int label;
        /* synthetic */ Object result;

        public C28661(Continuation<? super C28661> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileSdk.this.signInWithGoogleToken(null, null, null, this);
        }
    }

    private MobileSdk() {
    }

    public static /* synthetic */ Intent createIntent$default(MobileSdk mobileSdk, Context context, MobileFlowMode mobileFlowMode, JourneyState journeyState, boolean z11, boolean z12, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            mobileFlowMode = MobileFlowMode.BASE;
        }
        MobileFlowMode mobileFlowMode2 = mobileFlowMode;
        if ((i5 & 4) != 0) {
            journeyState = null;
        }
        return mobileSdk.createIntent(context, mobileFlowMode2, journeyState, (i5 & 8) != 0 ? true : z11, (i5 & 16) != 0 ? true : z12);
    }

    private final boolean hasCarrierPrivileges(Context context) {
        Object systemService = context.getSystemService("phone");
        TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
        if (telephonyManager == null) {
            return false;
        }
        return telephonyManager.hasCarrierPrivileges();
    }

    @JvmStatic
    public static final boolean isTravelEsimSupported(@NotNull Context context) {
        EuiccManager euiccManagerE;
        Intrinsics.g(context, "context");
        return Build.VERSION.SDK_INT >= 28 && (euiccManagerE = h5.e(context.getSystemService(h5.r()))) != null && euiccManagerE.isEnabled();
    }

    private final boolean locallyInstalled(ServiceGraph serviceGraph) {
        if (!serviceGraph.getEsimInstallStore().isInstalled()) {
            return false;
        }
        if (serviceGraph.getConfig().getDebug() || System.currentTimeMillis() - serviceGraph.getEsimInstallStore().installedAtMillis() < 3600000 || hasCarrierPrivileges(serviceGraph.getAppContext())) {
            return true;
        }
        serviceGraph.getEsimInstallStore().clear();
        return false;
    }

    public static /* synthetic */ Object signInWithGoogleToken$default(MobileSdk mobileSdk, String str, String str2, String str3, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        if ((i5 & 4) != 0) {
            str3 = null;
        }
        return mobileSdk.signInWithGoogleToken(str, str2, str3, continuation);
    }

    private final ClaimedProvider toClaimedProvider(String str) {
        Brand next;
        if (k.U0(str)) {
            str = null;
        }
        if (str == null) {
            return null;
        }
        Iterator<Brand> it = Brand.getEntries().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (j.B0(next.name(), str, true)) {
                break;
            }
        }
        Brand brand = next;
        if (brand == null) {
            return null;
        }
        return new ClaimedProvider(brand.getServerPackage(), brand.getDisplayName());
    }

    @NotNull
    public final Intent createIntent(@NotNull Context context, @NotNull MobileFlowMode mode, @Nullable JourneyState journeyState, boolean localPlanOfferable, boolean travelOfferable) {
        Intrinsics.g(context, "context");
        Intrinsics.g(mode, "mode");
        if (graph == null) {
            throw new IllegalStateException("MobileSdk.initialize(...) must be called before createIntent(...)");
        }
        Intent intentPutExtra = new Intent(context, (Class<?>) MobileFlowActivity.class).putExtra(MobileFlowContract.EXTRA_MODE, mode.name()).putExtra(MobileFlowContract.EXTRA_LOCAL_PLAN_OFFERABLE, localPlanOfferable).putExtra(MobileFlowContract.EXTRA_TRAVEL_OFFERABLE, travelOfferable);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        if (journeyState != null) {
            intentPutExtra.putExtra(MobileFlowContract.EXTRA_JOURNEY_STATE, journeyState.name());
        }
        return intentPutExtra;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object fetchJourneyResult(@NotNull Continuation<? super JourneyResult> continuation) {
        AnonymousClass1 anonymousClass1;
        Object objM191getJourneygIAlus$default;
        MobileSdk mobileSdk;
        JourneyState state;
        String claimedProvider;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object obj = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        ClaimedProvider claimedProvider2 = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            ServiceGraph serviceGraphRequireGraph$mobile_sdk_release = requireGraph$mobile_sdk_release();
            if (locallyInstalled(serviceGraphRequireGraph$mobile_sdk_release)) {
                return new JourneyResult(JourneyState.EsimInstalled, null);
            }
            JourneyRepository journeyRepository = serviceGraphRequireGraph$mobile_sdk_release.getJourneyRepository();
            anonymousClass1.L$0 = this;
            anonymousClass1.label = 1;
            objM191getJourneygIAlus$default = JourneyRepository.m191getJourneygIAlus$default(journeyRepository, null, anonymousClass1, 1, null);
            if (objM191getJourneygIAlus$default == coroutineSingletons) {
                return coroutineSingletons;
            }
            mobileSdk = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mobileSdk = (MobileSdk) anonymousClass1.L$0;
            ResultKt.b(obj);
            objM191getJourneygIAlus$default = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        if (objM191getJourneygIAlus$default instanceof Result.Failure) {
            objM191getJourneygIAlus$default = null;
        }
        JourneyResponse journeyResponse = (JourneyResponse) objM191getJourneygIAlus$default;
        if (journeyResponse == null || (state = journeyResponse.getState()) == null) {
            return null;
        }
        OfferClaimedInfo offerClaimed = journeyResponse.getOfferClaimed();
        if (offerClaimed != null && (claimedProvider = offerClaimed.getClaimedProvider()) != null) {
            claimedProvider2 = mobileSdk.toClaimedProvider(claimedProvider);
        }
        return new JourneyResult(state, claimedProvider2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object fetchJourneyState(@NotNull Continuation<? super JourneyState> continuation) {
        C28621 c28621;
        if (continuation instanceof C28621) {
            c28621 = (C28621) continuation;
            int i5 = c28621.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28621.label = i5 - Integer.MIN_VALUE;
            } else {
                c28621 = new C28621(continuation);
            }
        }
        Object objFetchJourneyResult = c28621.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28621.label;
        if (i11 == 0) {
            ResultKt.b(objFetchJourneyResult);
            c28621.label = 1;
            objFetchJourneyResult = fetchJourneyResult(c28621);
            if (objFetchJourneyResult == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objFetchJourneyResult);
        }
        JourneyResult journeyResult = (JourneyResult) objFetchJourneyResult;
        if (journeyResult != null) {
            return journeyResult.getState();
        }
        return null;
    }

    @NotNull
    public final Brand getBrand() {
        return requireGraph$mobile_sdk_release().getConfig().getBrand();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object getPurchasedPackages(@NotNull Continuation<? super List<PurchasedPackage>> continuation) {
        C28631 c28631;
        Object objM196getPackagesIoAF18A;
        if (continuation instanceof C28631) {
            c28631 = (C28631) continuation;
            int i5 = c28631.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28631.label = i5 - Integer.MIN_VALUE;
            } else {
                c28631 = new C28631(continuation);
            }
        }
        Object obj = c28631.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28631.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            PurchasedPackagesRepository purchasedPackagesRepository = requireGraph$mobile_sdk_release().getPurchasedPackagesRepository();
            c28631.label = 1;
            objM196getPackagesIoAF18A = purchasedPackagesRepository.m196getPackagesIoAF18A(c28631);
            if (objM196getPackagesIoAF18A == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objM196getPackagesIoAF18A = ((Result) obj).f71688a;
        }
        if (Result.a(objM196getPackagesIoAF18A) != null) {
            objM196getPackagesIoAF18A = EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : (Iterable) objM196getPackagesIoAF18A) {
            if (!((PurchasedPackage) obj2).isTravel()) {
                arrayList.add(obj2);
            }
        }
        return arrayList;
    }

    @NotNull
    public final MobileSdkTheme getTheme() {
        return requireGraph$mobile_sdk_release().getConfig().getTheme();
    }

    public final void initialize(@NotNull Context context, @NotNull MobileSdkConfig config) {
        Intrinsics.g(context, "context");
        Intrinsics.g(config, "config");
        ServiceGraph.Companion companion = ServiceGraph.INSTANCE;
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        graph = companion.create(applicationContext, config);
    }

    public final boolean isAnalyticsConsentGranted$mobile_sdk_release() {
        return analyticsConsentGranted;
    }

    public final boolean isEligibleForMobile(@NotNull Context context) {
        EuiccManager euiccManagerE;
        Intrinsics.g(context, "context");
        return Build.VERSION.SDK_INT >= 28 && SUPPORTED_COUNTRIES.contains(CountryDetector.INSTANCE.getCountryCode(context)) && (euiccManagerE = h5.e(context.getSystemService(h5.r()))) != null && euiccManagerE.isEnabled();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object isOfferAvailable(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28641 c28641;
        ServiceGraph serviceGraphRequireGraph$mobile_sdk_release;
        if (continuation instanceof C28641) {
            c28641 = (C28641) continuation;
            int i5 = c28641.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28641.label = i5 - Integer.MIN_VALUE;
            } else {
                c28641 = new C28641(continuation);
            }
        }
        Object objResolveEligibility = c28641.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28641.label;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objResolveEligibility);
            if (!isEligibleForMobile(context)) {
                return Boolean.FALSE;
            }
            serviceGraphRequireGraph$mobile_sdk_release = requireGraph$mobile_sdk_release();
            if (locallyInstalled(serviceGraphRequireGraph$mobile_sdk_release)) {
                return Boolean.TRUE;
            }
            JourneyRepository journeyRepository = serviceGraphRequireGraph$mobile_sdk_release.getJourneyRepository();
            c28641.L$0 = serviceGraphRequireGraph$mobile_sdk_release;
            c28641.label = 1;
            objResolveEligibility = journeyRepository.resolveEligibility(c28641);
            if (objResolveEligibility == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            serviceGraphRequireGraph$mobile_sdk_release = (ServiceGraph) c28641.L$0;
            ResultKt.b(objResolveEligibility);
        }
        MobileEligibility mobileEligibility = (MobileEligibility) objResolveEligibility;
        if (!Intrinsics.b(mobileEligibility, MobileEligibility.Eligible.INSTANCE)) {
            z11 = false;
            if (mobileEligibility instanceof MobileEligibility.Ineligible) {
                serviceGraphRequireGraph$mobile_sdk_release.getAnalytics().track(Events.ELIGIBILITY_FAILURE, b70.k.e0(new Pair("reason", ((MobileEligibility.Ineligible) mobileEligibility).getReason())));
            } else if (!Intrinsics.b(mobileEligibility, MobileEligibility.Unknown.INSTANCE)) {
                throw new NoWhenBranchMatchedException();
            }
        }
        return Boolean.valueOf(z11);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object isOnboarded(@NotNull Continuation<? super Boolean> continuation) {
        C28651 c28651;
        if (continuation instanceof C28651) {
            c28651 = (C28651) continuation;
            int i5 = c28651.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28651.label = i5 - Integer.MIN_VALUE;
            } else {
                c28651 = new C28651(continuation);
            }
        }
        Object objFetchJourneyState = c28651.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28651.label;
        if (i11 == 0) {
            ResultKt.b(objFetchJourneyState);
            c28651.label = 1;
            objFetchJourneyState = fetchJourneyState(c28651);
            if (objFetchJourneyState == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objFetchJourneyState);
        }
        JourneyState journeyState = (JourneyState) objFetchJourneyState;
        return Boolean.valueOf(journeyState != null && journeyState.isOnboarded());
    }

    @NotNull
    public final ServiceGraph requireGraph$mobile_sdk_release() {
        ServiceGraph serviceGraph = graph;
        if (serviceGraph != null) {
            return serviceGraph;
        }
        throw new IllegalStateException("MobileSdk.initialize(...) must be called before using the SDK");
    }

    public final void setAnalyticsConsent(boolean granted) {
        analyticsConsentGranted = granted;
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x01b9  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object signInWithGoogleToken(@NotNull String str, @Nullable String str2, @Nullable String str3, @NotNull Continuation<? super SignInResult> continuation) {
        C28661 c28661;
        ServiceGraph serviceGraphRequireGraph$mobile_sdk_release;
        String str4;
        String str5;
        BrandSigninApi brandSigninApi;
        ClientSignInRequest clientSignInRequest;
        ServiceGraph serviceGraph;
        String str6;
        String str7;
        Object objA;
        String str8;
        String str9;
        String str10;
        Throwable thA;
        String str11;
        long j11;
        String str12;
        long j12;
        String str13;
        String str14;
        String str15;
        ServiceGraph serviceGraph2;
        long j13;
        BrandSigninApi brandSigninApi2;
        String str16;
        String str17 = str;
        if (continuation instanceof C28661) {
            c28661 = (C28661) continuation;
            int i5 = c28661.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28661.label = i5 - Integer.MIN_VALUE;
            } else {
                c28661 = new C28661(continuation);
            }
        }
        Object objClientSignin = c28661.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28661.label;
        if (i11 == 0) {
            ResultKt.b(objClientSignin);
            serviceGraphRequireGraph$mobile_sdk_release = requireGraph$mobile_sdk_release();
            try {
                int i12 = Result.f71687b;
                brandSigninApi = serviceGraphRequireGraph$mobile_sdk_release.getBrandSigninApi();
                clientSignInRequest = new ClientSignInRequest("google", str17);
                c28661.L$0 = this;
                c28661.L$1 = str17;
                str4 = str2;
                try {
                    c28661.L$2 = str4;
                    str5 = str3;
                } catch (Throwable th2) {
                    th = th2;
                    str5 = str3;
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th);
                    String str18 = str5;
                    str8 = str17;
                    str9 = str18;
                    str10 = str4;
                    thA = Result.a(objA);
                    if (thA == null) {
                    }
                }
            } catch (Throwable th3) {
                th = th3;
                str4 = str2;
            }
            try {
                c28661.L$3 = str5;
                c28661.L$4 = serviceGraphRequireGraph$mobile_sdk_release;
                c28661.label = 1;
                objClientSignin = brandSigninApi.clientSignin(clientSignInRequest, c28661);
            } catch (Throwable th4) {
                th = th4;
                int i132 = Result.f71687b;
                objA = ResultKt.a(th);
                String str182 = str5;
                str8 = str17;
                str9 = str182;
                str10 = str4;
                thA = Result.a(objA);
                if (thA == null) {
                }
            }
            if (objClientSignin != coroutineSingletons) {
                serviceGraph = serviceGraphRequireGraph$mobile_sdk_release;
                str6 = str4;
                str7 = str5;
                objA = (p0) objClientSignin;
                int i14 = Result.f71687b;
                str8 = str17;
                str9 = str7;
                str10 = str6;
                serviceGraphRequireGraph$mobile_sdk_release = serviceGraph;
                thA = Result.a(objA);
                if (thA == null) {
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ServiceGraph serviceGraph3 = (ServiceGraph) c28661.L$4;
            str7 = (String) c28661.L$3;
            str6 = (String) c28661.L$2;
            String str19 = (String) c28661.L$1;
            try {
                ResultKt.b(objClientSignin);
                serviceGraph = serviceGraph3;
                str17 = str19;
                try {
                    objA = (p0) objClientSignin;
                    int i142 = Result.f71687b;
                    str8 = str17;
                    str9 = str7;
                    str10 = str6;
                    serviceGraphRequireGraph$mobile_sdk_release = serviceGraph;
                } catch (Throwable th5) {
                    th = th5;
                    str5 = str7;
                    str4 = str6;
                    serviceGraphRequireGraph$mobile_sdk_release = serviceGraph;
                    int i1322 = Result.f71687b;
                    objA = ResultKt.a(th);
                    String str1822 = str5;
                    str8 = str17;
                    str9 = str1822;
                    str10 = str4;
                    thA = Result.a(objA);
                    if (thA == null) {
                    }
                }
            } catch (Throwable th6) {
                th = th6;
                str5 = str7;
                str4 = str6;
                serviceGraphRequireGraph$mobile_sdk_release = serviceGraph3;
                str17 = str19;
                int i13222 = Result.f71687b;
                objA = ResultKt.a(th);
                String str18222 = str5;
                str8 = str17;
                str9 = str18222;
                str10 = str4;
                thA = Result.a(objA);
                if (thA == null) {
                }
            }
            thA = Result.a(objA);
            if (thA == null) {
                String message = thA.getMessage();
                if (message == null) {
                    message = "client/signin network error";
                }
                return new SignInResult.Failure(message);
            }
            p0 p0Var = (p0) objA;
            if (!p0Var.f52631a.c()) {
                return new SignInResult.Failure(c0.h(p0Var.f52631a.f95556d, "client/signin returned HTTP "));
            }
            ClientSignInResponse clientSignInResponse = (ClientSignInResponse) p0Var.f52632b;
            if (clientSignInResponse == null) {
                return new SignInResult.Failure("client/signin returned empty body");
            }
            String token = clientSignInResponse.getToken();
            if (k.U0(token)) {
                token = null;
            }
            if (token == null) {
                return new SignInResult.Failure("client/signin returned empty token");
            }
            long userId = clientSignInResponse.getUserId();
            String existingBrandUid = clientSignInResponse.getExistingBrandUid();
            String str20 = (existingBrandUid == null && (existingBrandUid = serviceGraphRequireGraph$mobile_sdk_release.getConfig().getBrandUid()) == null) ? str10 : existingBrandUid;
            String brandApiKey = serviceGraphRequireGraph$mobile_sdk_release.getConfig().getBrandApiKey();
            if (brandApiKey != null && !k.U0(brandApiKey) && str20 != null && !k.U0(str20)) {
                try {
                    brandSigninApi2 = serviceGraphRequireGraph$mobile_sdk_release.getBrandSigninApi();
                    str16 = token;
                } catch (Throwable th7) {
                    th = th7;
                    str12 = token;
                }
                try {
                    str12 = str16;
                    try {
                        BrandSigninRequest brandSigninRequest = new BrandSigninRequest(str20, "google", str8, (String) null, str10, (String) null, 40, (DefaultConstructorMarker) null);
                        c28661.L$0 = str10;
                        c28661.L$1 = str9;
                        c28661.L$2 = serviceGraphRequireGraph$mobile_sdk_release;
                        c28661.L$3 = str12;
                        c28661.L$4 = null;
                        j12 = userId;
                        try {
                            c28661.J$0 = j12;
                            c28661.label = 2;
                            objClientSignin = brandSigninApi2.signin(brandSigninRequest, c28661);
                        } catch (Throwable th8) {
                            th = th8;
                            str13 = str9;
                            str14 = str12;
                            str15 = str10;
                            serviceGraph2 = serviceGraphRequireGraph$mobile_sdk_release;
                            j13 = j12;
                            int i15 = Result.f71687b;
                            ResultKt.a(th);
                            String str21 = str13;
                            str11 = str14;
                            str9 = str21;
                            str10 = str15;
                            j11 = j13;
                            serviceGraphRequireGraph$mobile_sdk_release = serviceGraph2;
                            serviceGraphRequireGraph$mobile_sdk_release.getSignedInStore().markSignedIn(str10, str9, str11, new Long(j11));
                            serviceGraphRequireGraph$mobile_sdk_release.getConfig().getEventListener().onSignedIn(j11);
                            return new SignInResult.Success(j11);
                        }
                    } catch (Throwable th9) {
                        th = th9;
                        j12 = userId;
                    }
                } catch (Throwable th10) {
                    th = th10;
                    str12 = str16;
                    j12 = userId;
                    str13 = str9;
                    str14 = str12;
                    str15 = str10;
                    serviceGraph2 = serviceGraphRequireGraph$mobile_sdk_release;
                    j13 = j12;
                    int i152 = Result.f71687b;
                    ResultKt.a(th);
                    String str212 = str13;
                    str11 = str14;
                    str9 = str212;
                    str10 = str15;
                    j11 = j13;
                    serviceGraphRequireGraph$mobile_sdk_release = serviceGraph2;
                    serviceGraphRequireGraph$mobile_sdk_release.getSignedInStore().markSignedIn(str10, str9, str11, new Long(j11));
                    serviceGraphRequireGraph$mobile_sdk_release.getConfig().getEventListener().onSignedIn(j11);
                    return new SignInResult.Success(j11);
                }
                if (objClientSignin != coroutineSingletons) {
                    str13 = str9;
                    str14 = str12;
                    str15 = str10;
                    serviceGraph2 = serviceGraphRequireGraph$mobile_sdk_release;
                    j13 = j12;
                    int i16 = Result.f71687b;
                    String str2122 = str13;
                    str11 = str14;
                    str9 = str2122;
                    str10 = str15;
                    j11 = j13;
                    serviceGraphRequireGraph$mobile_sdk_release = serviceGraph2;
                }
                return coroutineSingletons;
            }
            str11 = token;
            j11 = userId;
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j13 = c28661.J$0;
            str14 = (String) c28661.L$3;
            serviceGraph2 = (ServiceGraph) c28661.L$2;
            str13 = (String) c28661.L$1;
            str15 = (String) c28661.L$0;
            try {
                ResultKt.b(objClientSignin);
                int i162 = Result.f71687b;
            } catch (Throwable th11) {
                th = th11;
                int i1522 = Result.f71687b;
                ResultKt.a(th);
                String str21222 = str13;
                str11 = str14;
                str9 = str21222;
                str10 = str15;
                j11 = j13;
                serviceGraphRequireGraph$mobile_sdk_release = serviceGraph2;
                serviceGraphRequireGraph$mobile_sdk_release.getSignedInStore().markSignedIn(str10, str9, str11, new Long(j11));
                serviceGraphRequireGraph$mobile_sdk_release.getConfig().getEventListener().onSignedIn(j11);
                return new SignInResult.Success(j11);
            }
            String str212222 = str13;
            str11 = str14;
            str9 = str212222;
            str10 = str15;
            j11 = j13;
            serviceGraphRequireGraph$mobile_sdk_release = serviceGraph2;
        }
        serviceGraphRequireGraph$mobile_sdk_release.getSignedInStore().markSignedIn(str10, str9, str11, new Long(j11));
        serviceGraphRequireGraph$mobile_sdk_release.getConfig().getEventListener().onSignedIn(j11);
        return new SignInResult.Success(j11);
    }

    @Nullable
    public final Long signedInUserId() {
        SignedInStore signedInStore;
        ServiceGraph serviceGraph = graph;
        if (serviceGraph == null || (signedInStore = serviceGraph.getSignedInStore()) == null) {
            return null;
        }
        return signedInStore.userId();
    }
}
