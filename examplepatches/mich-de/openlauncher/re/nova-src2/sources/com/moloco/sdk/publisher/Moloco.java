package com.moloco.sdk.publisher;

import a2.k;
import android.content.Context;
import b70.g;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.BuildConfig;
import com.moloco.sdk.Init;
import com.moloco.sdk.acm.AndroidClientMetrics;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.InitConfig;
import com.moloco.sdk.acm.UpdateConfig;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.publisher.C2940b;
import com.moloco.sdk.internal.publisher.C2941c;
import com.moloco.sdk.internal.publisher.y;
import com.moloco.sdk.internal.services.bidtoken.h;
import com.moloco.sdk.internal.services.bidtoken.i;
import com.moloco.sdk.internal.services.init.j;
import com.moloco.sdk.internal.services.init.n;
import com.moloco.sdk.internal.x;
import com.moloco.sdk.publisher.BannerAdSize;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.init.MolocoInitParams;
import com.moloco.sdk.service_locator.a;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.r1;

@Metadata(d1 = {"\u0000Ü\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010!\n\u0002\b\u0005\n\u0002\u0010#\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\"\n\u0002\b\u0007\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0003¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0007\u001a\u00020\u0004H\u0081@¢\u0006\u0004\b\u0005\u0010\u0006J#\u0010\f\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\nH\u0007¢\u0006\u0004\b\f\u0010\rJ\u0017\u0010\u000e\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ'\u0010\u0015\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u0014H\u0007¢\u0006\u0004\b\u0015\u0010\u0016Jk\u0010#\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172>\u0010\"\u001a:\u0012\u0015\u0012\u0013\u0018\u00010\u001b¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(\u001e\u0012\u0015\u0012\u0013\u0018\u00010\u001f¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00040\u001aj\u0002`!H\u0007¢\u0006\u0004\b#\u0010$Jk\u0010%\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172>\u0010\"\u001a:\u0012\u0015\u0012\u0013\u0018\u00010\u001b¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(\u001e\u0012\u0015\u0012\u0013\u0018\u00010\u001f¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00040\u001aj\u0002`!H\u0007¢\u0006\u0004\b%\u0010$Js\u0010(\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010'\u001a\u00020&2\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172>\u0010\"\u001a:\u0012\u0015\u0012\u0013\u0018\u00010\u001b¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(\u001e\u0012\u0015\u0012\u0013\u0018\u00010\u001f¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00040\u001aj\u0002`!H\u0007¢\u0006\u0004\b(\u0010)Jk\u0010*\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172>\u0010\"\u001a:\u0012\u0015\u0012\u0013\u0018\u00010\u001b¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(\u001e\u0012\u0015\u0012\u0013\u0018\u00010\u001f¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00040\u001aj\u0002`!H\u0007¢\u0006\u0004\b*\u0010$Jk\u0010.\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172>\u0010\"\u001a:\u0012\u0015\u0012\u0013\u0018\u00010+¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(,\u0012\u0015\u0012\u0013\u0018\u00010\u001f¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00040\u001aj\u0002`-H\u0007¢\u0006\u0004\b.\u0010$Jk\u00102\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172>\u0010\"\u001a:\u0012\u0015\u0012\u0013\u0018\u00010/¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(0\u0012\u0015\u0012\u0013\u0018\u00010\u001f¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00040\u001aj\u0002`1H\u0007¢\u0006\u0004\b2\u0010$Jk\u00106\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172>\u0010\"\u001a:\u0012\u0015\u0012\u0013\u0018\u000103¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(4\u0012\u0015\u0012\u0013\u0018\u00010\u001f¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00040\u001aj\u0002`5H\u0007¢\u0006\u0004\b6\u0010$J\u0017\u00109\u001a\u00020\u00042\u0006\u00108\u001a\u000207H\u0002¢\u0006\u0004\b9\u0010:J\u0010\u0010;\u001a\u00020\u0004H\u0082@¢\u0006\u0004\b;\u0010\u0006J\u0017\u0010=\u001a\u00020\u00042\u0006\u0010<\u001a\u00020\bH\u0002¢\u0006\u0004\b=\u0010\u000fJ\u000f\u0010>\u001a\u00020\u0004H\u0002¢\u0006\u0004\b>\u0010\u0003J\u0017\u0010A\u001a\u00020@2\u0006\u0010?\u001a\u00020\u0017H\u0002¢\u0006\u0004\bA\u0010BR2\u0010E\u001a\u0014\u0012\u0004\u0012\u00020\u0017\u0012\n\u0012\b\u0012\u0004\u0012\u00020\n0D0C8\u0000X\u0081\u0004¢\u0006\u0012\n\u0004\bE\u0010F\u0012\u0004\bI\u0010\u0003\u001a\u0004\bG\u0010HR\u001a\u0010K\u001a\b\u0012\u0004\u0012\u00020\u00170J8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bK\u0010LR\u001b\u0010R\u001a\u00020M8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\bN\u0010O\u001a\u0004\bP\u0010QR\u001b\u0010W\u001a\u00020S8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\bT\u0010O\u001a\u0004\bU\u0010VR\u001b\u0010\\\u001a\u00020X8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\bY\u0010O\u001a\u0004\bZ\u0010[R\u001b\u0010a\u001a\u00020]8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b^\u0010O\u001a\u0004\b_\u0010`R*\u0010c\u001a\u0004\u0018\u00010b8\u0006@\u0006X\u0087\u000e¢\u0006\u0018\n\u0004\bc\u0010d\u0012\u0004\bi\u0010\u0003\u001a\u0004\be\u0010f\"\u0004\bg\u0010hR*\u0010<\u001a\u0004\u0018\u00010\b8\u0006@\u0006X\u0087\u000e¢\u0006\u0018\n\u0004\b<\u0010j\u0012\u0004\bn\u0010\u0003\u001a\u0004\bk\u0010l\"\u0004\bm\u0010\u000fR\u0016\u0010q\u001a\u0004\u0018\u00010\u00178@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bo\u0010pR\u001a\u0010u\u001a\b\u0012\u0004\u0012\u00020\u00170r8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bs\u0010tR\u001a\u0010v\u001a\u00020@8FX\u0087\u0004¢\u0006\f\u0012\u0004\bx\u0010\u0003\u001a\u0004\bv\u0010w¨\u0006y"}, d2 = {"Lcom/moloco/sdk/publisher/Moloco;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "clearState$moloco_sdk_release", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "clearState", "Lcom/moloco/sdk/publisher/init/MolocoInitParams;", "initParam", "Lcom/moloco/sdk/publisher/MolocoInitializationListener;", "listener", "initialize", "(Lcom/moloco/sdk/publisher/init/MolocoInitParams;Lcom/moloco/sdk/publisher/MolocoInitializationListener;)V", "logMolocoInfo", "(Lcom/moloco/sdk/publisher/init/MolocoInitParams;)V", "Lcom/moloco/sdk/publisher/MediationInfo;", "mediationInfo", "Landroid/content/Context;", "context", "Lcom/moloco/sdk/publisher/MolocoBidTokenListener;", "getBidToken", "(Lcom/moloco/sdk/publisher/MediationInfo;Landroid/content/Context;Lcom/moloco/sdk/publisher/MolocoBidTokenListener;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "adUnitId", "watermarkString", "Lkotlin/Function2;", "Lcom/moloco/sdk/publisher/Banner;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "banner", "Lcom/moloco/sdk/publisher/MolocoAdError$AdCreateError;", "error", "Lcom/moloco/sdk/publisher/CreateBannerCallback;", "callback", "createBanner", "(Lcom/moloco/sdk/publisher/MediationInfo;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V", "createBannerTablet", "Lcom/moloco/sdk/publisher/BannerAdSize;", "size", "createMolocoBanner", "(Lcom/moloco/sdk/publisher/MediationInfo;Ljava/lang/String;Lcom/moloco/sdk/publisher/BannerAdSize;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V", "createMREC", "Lcom/moloco/sdk/publisher/NativeAd;", "nativeAd", "Lcom/moloco/sdk/publisher/CreateNativeAdCallback;", "createNativeAd", "Lcom/moloco/sdk/publisher/InterstitialAd;", "interstitialAd", "Lcom/moloco/sdk/publisher/CreateInterstitialAdCallback;", "createInterstitial", "Lcom/moloco/sdk/publisher/RewardedInterstitialAd;", "rewardedInterstitialAd", "Lcom/moloco/sdk/publisher/CreateRewardedInterstitialAdCallback;", "createRewardedInterstitial", "Lcom/moloco/sdk/Init$SDKInitResponse;", "sdkInitResponse", "processInitConfigs", "(Lcom/moloco/sdk/Init$SDKInitResponse;)V", "updateAndroidClientMetricsOnInitSuccess", "initParams", "initializeAndroidClientMetrics", "initializeILRD", "mediationName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "shouldInitializeILRD", "(Ljava/lang/String;)Z", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "pendingInitByMediator", "Ljava/util/Map;", "getPendingInitByMediator$moloco_sdk_release", "()Ljava/util/Map;", "getPendingInitByMediator$moloco_sdk_release$annotations", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "_failedMediations", "Ljava/util/Set;", "Lcom/moloco/sdk/internal/publisher/x;", "initializationHandler$delegate", "Lkotlin/Lazy;", "getInitializationHandler", "()Lcom/moloco/sdk/internal/publisher/x;", "initializationHandler", "Lcom/moloco/sdk/internal/services/bidtoken/h;", "bidTokenHandler$delegate", "getBidTokenHandler", "()Lcom/moloco/sdk/internal/services/bidtoken/h;", "bidTokenHandler", "Lcom/moloco/sdk/internal/publisher/b;", "adCreator$delegate", "getAdCreator", "()Lcom/moloco/sdk/internal/publisher/b;", "adCreator", "Lt70/j0;", "scope$delegate", "getScope", "()Lt70/j0;", "scope", "Lt70/r1;", "initJob", "Lt70/r1;", "getInitJob", "()Lt70/r1;", "setInitJob", "(Lt70/r1;)V", "getInitJob$annotations", "Lcom/moloco/sdk/publisher/init/MolocoInitParams;", "getInitParams", "()Lcom/moloco/sdk/publisher/init/MolocoInitParams;", "setInitParams", "getInitParams$annotations", "getAppKey$moloco_sdk_release", "()Ljava/lang/String;", "appKey", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getFailedMediations$moloco_sdk_release", "()Ljava/util/Set;", "failedMediations", "isInitialized", "()Z", "isInitialized$annotations", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@SourceDebugExtension
/* loaded from: classes.dex */
public final class Moloco {

    @Nullable
    private static r1 initJob;

    @Nullable
    private static MolocoInitParams initParams;

    @NotNull
    public static final Moloco INSTANCE = new Moloco();

    @NotNull
    private static final Map<String, List<MolocoInitializationListener>> pendingInitByMediator = new LinkedHashMap();

    @NotNull
    private static final Set<String> _failedMediations = new LinkedHashSet();

    /* renamed from: initializationHandler$delegate, reason: from kotlin metadata */
    @NotNull
    private static final Lazy initializationHandler = LazyKt.a(new k(15));

    /* renamed from: bidTokenHandler$delegate, reason: from kotlin metadata */
    @NotNull
    private static final Lazy bidTokenHandler = LazyKt.a(new k(16));

    /* renamed from: adCreator$delegate, reason: from kotlin metadata */
    @NotNull
    private static final Lazy adCreator = LazyKt.a(new k(17));

    /* renamed from: scope$delegate, reason: from kotlin metadata */
    @NotNull
    private static final Lazy scope = LazyKt.a(new k(18));
    public static final int $stable = 8;

    @Metadata(k = 3, mv = {2, 0, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[Init.SDKInitResponse.SupportedNetworks.values().length];
            try {
                iArr[Init.SDKInitResponse.SupportedNetworks.LEVEL_PLAY.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$createBanner$1", f = "Moloco.kt", l = {249}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$createBanner$1, reason: invalid class name */
    /* loaded from: classes4.dex */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $adUnitId;
        final /* synthetic */ Function2<Banner, MolocoAdError.AdCreateError, Unit> $callback;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ String $watermarkString;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public AnonymousClass1(MediationInfo mediationInfo, String str, String str2, Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> function2, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$mediationInfo = mediationInfo;
            this.$adUnitId = str;
            this.$watermarkString = str2;
            this.$callback = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.$mediationInfo, this.$adUnitId, this.$watermarkString, this.$callback, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objA;
            Pair pair;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(this.$mediationInfo.getName());
                C2940b adCreator = Moloco.INSTANCE.getAdCreator();
                String name = this.$mediationInfo.getName();
                String str = this.$adUnitId;
                String str2 = this.$watermarkString;
                this.label = 1;
                objA = adCreator.a(name, str, metricsRecorderCreate, str2, this);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objA = obj;
            }
            x xVar = (x) objA;
            if (xVar instanceof x.b) {
                pair = new Pair(((x.b) xVar).a(), null);
            } else {
                if (!(xVar instanceof x.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                pair = new Pair(null, ((x.a) xVar).a());
            }
            Banner banner = (Banner) pair.f71683a;
            MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) pair.f71684b;
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            StringBuilder sb2 = new StringBuilder("Banner for adUnitId: ");
            sb2.append(this.$adUnitId);
            sb2.append(" has error: ");
            sb2.append(banner == null);
            MolocoLogger.info$default(molocoLogger, "Moloco", sb2.toString(), null, false, 12, null);
            this.$callback.invoke(banner, adCreateError);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$createBannerTablet$1", f = "Moloco.kt", l = {280}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$createBannerTablet$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes4.dex */
    public static final class C29641 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $adUnitId;
        final /* synthetic */ Function2<Banner, MolocoAdError.AdCreateError, Unit> $callback;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ String $watermarkString;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C29641(MediationInfo mediationInfo, String str, String str2, Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> function2, Continuation<? super C29641> continuation) {
            super(2, continuation);
            this.$mediationInfo = mediationInfo;
            this.$adUnitId = str;
            this.$watermarkString = str2;
            this.$callback = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C29641(this.$mediationInfo, this.$adUnitId, this.$watermarkString, this.$callback, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objB;
            Pair pair;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(this.$mediationInfo.getName());
                C2940b adCreator = Moloco.INSTANCE.getAdCreator();
                String name = this.$mediationInfo.getName();
                String str = this.$adUnitId;
                String str2 = this.$watermarkString;
                this.label = 1;
                objB = adCreator.b(name, str, metricsRecorderCreate, str2, this);
                if (objB == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objB = obj;
            }
            x xVar = (x) objB;
            if (xVar instanceof x.b) {
                pair = new Pair(((x.b) xVar).a(), null);
            } else {
                if (!(xVar instanceof x.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                pair = new Pair(null, ((x.a) xVar).a());
            }
            Banner banner = (Banner) pair.f71683a;
            MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) pair.f71684b;
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            StringBuilder sb2 = new StringBuilder("Banner for adUnitId: ");
            sb2.append(this.$adUnitId);
            sb2.append(" has error: ");
            sb2.append(banner == null);
            MolocoLogger.info$default(molocoLogger, "Moloco", sb2.toString(), null, false, 12, null);
            this.$callback.invoke(banner, adCreateError);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29641) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$createInterstitial$1", f = "Moloco.kt", l = {422}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$createInterstitial$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes4.dex */
    public static final class C29651 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $adUnitId;
        final /* synthetic */ Function2<InterstitialAd, MolocoAdError.AdCreateError, Unit> $callback;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ String $watermarkString;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C29651(MediationInfo mediationInfo, String str, String str2, Function2<? super InterstitialAd, ? super MolocoAdError.AdCreateError, Unit> function2, Continuation<? super C29651> continuation) {
            super(2, continuation);
            this.$mediationInfo = mediationInfo;
            this.$adUnitId = str;
            this.$watermarkString = str2;
            this.$callback = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C29651(this.$mediationInfo, this.$adUnitId, this.$watermarkString, this.$callback, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objC;
            Pair pair;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(this.$mediationInfo.getName());
                C2940b adCreator = Moloco.INSTANCE.getAdCreator();
                String name = this.$mediationInfo.getName();
                String str = this.$adUnitId;
                String str2 = this.$watermarkString;
                this.label = 1;
                objC = adCreator.c(name, str, metricsRecorderCreate, str2, this);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objC = obj;
            }
            x xVar = (x) objC;
            if (xVar instanceof x.b) {
                pair = new Pair(((x.b) xVar).a(), null);
            } else {
                if (!(xVar instanceof x.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                pair = new Pair(null, ((x.a) xVar).a());
            }
            InterstitialAd interstitialAd = (InterstitialAd) pair.f71683a;
            MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) pair.f71684b;
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            StringBuilder sb2 = new StringBuilder("Interstitial for adUnitId: ");
            sb2.append(this.$adUnitId);
            sb2.append(" has error: ");
            sb2.append(interstitialAd == null);
            MolocoLogger.info$default(molocoLogger, "Moloco", sb2.toString(), null, false, 12, null);
            this.$callback.invoke(interstitialAd, adCreateError);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29651) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$createMREC$1", f = "Moloco.kt", l = {361}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$createMREC$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes4.dex */
    public static final class C29661 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $adUnitId;
        final /* synthetic */ Function2<Banner, MolocoAdError.AdCreateError, Unit> $callback;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ String $watermarkString;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C29661(MediationInfo mediationInfo, String str, String str2, Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> function2, Continuation<? super C29661> continuation) {
            super(2, continuation);
            this.$mediationInfo = mediationInfo;
            this.$adUnitId = str;
            this.$watermarkString = str2;
            this.$callback = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C29661(this.$mediationInfo, this.$adUnitId, this.$watermarkString, this.$callback, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objD;
            Pair pair;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(this.$mediationInfo.getName());
                C2940b adCreator = Moloco.INSTANCE.getAdCreator();
                String name = this.$mediationInfo.getName();
                String str = this.$adUnitId;
                String str2 = this.$watermarkString;
                this.label = 1;
                objD = adCreator.d(name, str, metricsRecorderCreate, str2, this);
                if (objD == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objD = obj;
            }
            x xVar = (x) objD;
            if (xVar instanceof x.b) {
                pair = new Pair(((x.b) xVar).a(), null);
            } else {
                if (!(xVar instanceof x.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                pair = new Pair(null, ((x.a) xVar).a());
            }
            Banner banner = (Banner) pair.f71683a;
            MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) pair.f71684b;
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            StringBuilder sb2 = new StringBuilder("MREC for adUnitId: ");
            sb2.append(this.$adUnitId);
            sb2.append(" has error: ");
            sb2.append(banner == null);
            MolocoLogger.info$default(molocoLogger, "Moloco", sb2.toString(), null, false, 12, null);
            this.$callback.invoke(banner, adCreateError);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29661) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$createMolocoBanner$1", f = "Moloco.kt", l = {326, 327, 328, 329, 330}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$createMolocoBanner$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes4.dex */
    public static final class C29671 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $adUnitId;
        final /* synthetic */ Function2<Banner, MolocoAdError.AdCreateError, Unit> $callback;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ BannerAdSize $size;
        final /* synthetic */ String $watermarkString;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C29671(MediationInfo mediationInfo, BannerAdSize bannerAdSize, String str, String str2, Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> function2, Continuation<? super C29671> continuation) {
            super(2, continuation);
            this.$mediationInfo = mediationInfo;
            this.$size = bannerAdSize;
            this.$adUnitId = str;
            this.$watermarkString = str2;
            this.$callback = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C29671(this.$mediationInfo, this.$size, this.$adUnitId, this.$watermarkString, this.$callback, continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:19:0x0073, code lost:
        
            if (r0 == r7) goto L44;
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x009d, code lost:
        
            if (r0 == r7) goto L44;
         */
        /* JADX WARN: Code restructure failed: missing block: B:31:0x00c6, code lost:
        
            if (r0 == r7) goto L44;
         */
        /* JADX WARN: Code restructure failed: missing block: B:37:0x00f7, code lost:
        
            if (r0 == r7) goto L44;
         */
        /* JADX WARN: Code restructure failed: missing block: B:43:0x0126, code lost:
        
            if (r0 == r7) goto L44;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            Object objB;
            Object objA;
            Object objD;
            Object objB2;
            Object objA2;
            x xVar;
            Pair pair;
            C29671 c29671 = this;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = c29671.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(c29671.$mediationInfo.getName());
                BannerAdSize bannerAdSize = c29671.$size;
                if (Intrinsics.b(bannerAdSize, BannerAdSize.Standard.INSTANCE)) {
                    C2940b adCreator = Moloco.INSTANCE.getAdCreator();
                    String name = c29671.$mediationInfo.getName();
                    String str = c29671.$adUnitId;
                    String str2 = c29671.$watermarkString;
                    c29671.label = 1;
                    objA2 = adCreator.a(name, str, metricsRecorderCreate, str2, c29671);
                } else if (Intrinsics.b(bannerAdSize, BannerAdSize.Tablet.INSTANCE)) {
                    C2940b adCreator2 = Moloco.INSTANCE.getAdCreator();
                    String name2 = c29671.$mediationInfo.getName();
                    String str3 = c29671.$adUnitId;
                    String str4 = c29671.$watermarkString;
                    c29671.label = 2;
                    objB2 = adCreator2.b(name2, str3, metricsRecorderCreate, str4, c29671);
                } else if (Intrinsics.b(bannerAdSize, BannerAdSize.MREC.INSTANCE)) {
                    C2940b adCreator3 = Moloco.INSTANCE.getAdCreator();
                    String name3 = c29671.$mediationInfo.getName();
                    String str5 = c29671.$adUnitId;
                    String str6 = c29671.$watermarkString;
                    c29671.label = 3;
                    objD = adCreator3.d(name3, str5, metricsRecorderCreate, str6, c29671);
                } else if (bannerAdSize instanceof BannerAdSize.InlineAdaptive) {
                    C2940b adCreator4 = Moloco.INSTANCE.getAdCreator();
                    String name4 = c29671.$mediationInfo.getName();
                    Integer availableWidth = ((BannerAdSize.InlineAdaptive) c29671.$size).getAvailableWidth();
                    String str7 = c29671.$adUnitId;
                    String str8 = c29671.$watermarkString;
                    c29671.label = 4;
                    objA = adCreator4.a(name4, availableWidth, str7, metricsRecorderCreate, str8, c29671);
                    c29671 = c29671;
                } else {
                    if (!(bannerAdSize instanceof BannerAdSize.AnchoredAdaptive)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    C2940b adCreator5 = Moloco.INSTANCE.getAdCreator();
                    String name5 = c29671.$mediationInfo.getName();
                    Integer availableWidth2 = ((BannerAdSize.AnchoredAdaptive) c29671.$size).getAvailableWidth();
                    String str9 = c29671.$adUnitId;
                    String str10 = c29671.$watermarkString;
                    c29671.label = 5;
                    objB = adCreator5.b(name5, availableWidth2, str9, metricsRecorderCreate, str10, c29671);
                    c29671 = c29671;
                }
                return coroutineSingletons;
            }
            if (i5 == 1) {
                ResultKt.b(obj);
                objA2 = obj;
                xVar = (x) objA2;
            } else if (i5 == 2) {
                ResultKt.b(obj);
                objB2 = obj;
                xVar = (x) objB2;
            } else if (i5 == 3) {
                ResultKt.b(obj);
                objD = obj;
                xVar = (x) objD;
            } else if (i5 == 4) {
                ResultKt.b(obj);
                objA = obj;
                xVar = (x) objA;
            } else {
                if (i5 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objB = obj;
                xVar = (x) objB;
            }
            if (xVar instanceof x.b) {
                pair = new Pair(((x.b) xVar).a(), null);
            } else {
                if (!(xVar instanceof x.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                pair = new Pair(null, ((x.a) xVar).a());
            }
            Banner banner = (Banner) pair.f71683a;
            MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) pair.f71684b;
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            StringBuilder sb2 = new StringBuilder("Moloco banner for adUnitId: ");
            sb2.append(c29671.$adUnitId);
            sb2.append(" has error: ");
            sb2.append(banner == null);
            MolocoLogger.info$default(molocoLogger, "Moloco", sb2.toString(), null, false, 12, null);
            c29671.$callback.invoke(banner, adCreateError);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29671) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$createNativeAd$1", f = "Moloco.kt", l = {393}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$createNativeAd$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes4.dex */
    public static final class C29681 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $adUnitId;
        final /* synthetic */ Function2<NativeAd, MolocoAdError.AdCreateError, Unit> $callback;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ String $watermarkString;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C29681(MediationInfo mediationInfo, String str, String str2, Function2<? super NativeAd, ? super MolocoAdError.AdCreateError, Unit> function2, Continuation<? super C29681> continuation) {
            super(2, continuation);
            this.$mediationInfo = mediationInfo;
            this.$adUnitId = str;
            this.$watermarkString = str2;
            this.$callback = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C29681(this.$mediationInfo, this.$adUnitId, this.$watermarkString, this.$callback, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objE;
            Pair pair;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(this.$mediationInfo.getName());
                C2940b adCreator = Moloco.INSTANCE.getAdCreator();
                String name = this.$mediationInfo.getName();
                String str = this.$adUnitId;
                String str2 = this.$watermarkString;
                this.label = 1;
                objE = adCreator.e(name, str, metricsRecorderCreate, str2, this);
                if (objE == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objE = obj;
            }
            x xVar = (x) objE;
            if (xVar instanceof x.b) {
                pair = new Pair(((x.b) xVar).a(), null);
            } else {
                if (!(xVar instanceof x.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                pair = new Pair(null, ((x.a) xVar).a());
            }
            NativeAd nativeAd = (NativeAd) pair.f71683a;
            MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) pair.f71684b;
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            StringBuilder sb2 = new StringBuilder("Native Ad for adUnitId: ");
            sb2.append(this.$adUnitId);
            sb2.append(" has error: ");
            sb2.append(nativeAd == null);
            MolocoLogger.info$default(molocoLogger, "Moloco", sb2.toString(), null, false, 12, null);
            this.$callback.invoke(nativeAd, adCreateError);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29681) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$createRewardedInterstitial$1", f = "Moloco.kt", l = {452}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$createRewardedInterstitial$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes4.dex */
    public static final class C29691 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $adUnitId;
        final /* synthetic */ Function2<RewardedInterstitialAd, MolocoAdError.AdCreateError, Unit> $callback;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ String $watermarkString;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C29691(MediationInfo mediationInfo, String str, String str2, Function2<? super RewardedInterstitialAd, ? super MolocoAdError.AdCreateError, Unit> function2, Continuation<? super C29691> continuation) {
            super(2, continuation);
            this.$mediationInfo = mediationInfo;
            this.$adUnitId = str;
            this.$watermarkString = str2;
            this.$callback = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C29691(this.$mediationInfo, this.$adUnitId, this.$watermarkString, this.$callback, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objF;
            Pair pair;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(this.$mediationInfo.getName());
                C2940b adCreator = Moloco.INSTANCE.getAdCreator();
                String name = this.$mediationInfo.getName();
                String str = this.$adUnitId;
                String str2 = this.$watermarkString;
                this.label = 1;
                objF = adCreator.f(name, str, metricsRecorderCreate, str2, this);
                if (objF == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objF = obj;
            }
            x xVar = (x) objF;
            if (xVar instanceof x.b) {
                pair = new Pair(((x.b) xVar).a(), null);
            } else {
                if (!(xVar instanceof x.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                pair = new Pair(null, ((x.a) xVar).a());
            }
            RewardedInterstitialAd rewardedInterstitialAd = (RewardedInterstitialAd) pair.f71683a;
            MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) pair.f71684b;
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            StringBuilder sb2 = new StringBuilder("Rewarded for adUnitId: ");
            sb2.append(this.$adUnitId);
            sb2.append(" has error: ");
            sb2.append(rewardedInterstitialAd == null);
            MolocoLogger.info$default(molocoLogger, "Moloco", sb2.toString(), null, false, 12, null);
            this.$callback.invoke(rewardedInterstitialAd, adCreateError);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29691) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$getBidToken$1", f = "Moloco.kt", l = {Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.publisher.Moloco$getBidToken$1, reason: invalid class name and case insensitive filesystem */
    public static final class C29701 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ MolocoBidTokenListener $listener;
        final /* synthetic */ MediationInfo $mediationInfo;
        final /* synthetic */ MetricsRecorder $metricsRecorder;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C29701(MetricsRecorder metricsRecorder, MediationInfo mediationInfo, MolocoBidTokenListener molocoBidTokenListener, Continuation<? super C29701> continuation) {
            super(2, continuation);
            this.$metricsRecorder = metricsRecorder;
            this.$mediationInfo = mediationInfo;
            this.$listener = molocoBidTokenListener;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C29701(this.$metricsRecorder, this.$mediationInfo, this.$listener, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "Handling bid token request", null, false, 12, null);
                h bidTokenHandler = Moloco.INSTANCE.getBidTokenHandler();
                MetricsRecorder metricsRecorder = this.$metricsRecorder;
                MediationInfo mediationInfo = this.$mediationInfo;
                MolocoBidTokenListener molocoBidTokenListener = this.$listener;
                this.label = 1;
                if (bidTokenHandler.a(metricsRecorder, mediationInfo, molocoBidTokenListener, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29701) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 0, 0})
    @DebugMetadata(c = "com.moloco.sdk.publisher.Moloco$initialize$2", f = "Moloco.kt", l = {149, 151, 174}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.publisher.Moloco$initialize$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ MolocoInitParams $initParam;
        final /* synthetic */ MolocoInitializationListener $listener;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass2(MolocoInitParams molocoInitParams, MolocoInitializationListener molocoInitializationListener, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$initParam = molocoInitParams;
            this.$listener = molocoInitializationListener;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.$initParam, this.$listener, continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:38:0x012f, code lost:
        
            if (r1.updateAndroidClientMetricsOnInitSuccess(r12) == r0) goto L39;
         */
        /* JADX WARN: Removed duplicated region for block: B:20:0x00a0  */
        /* JADX WARN: Removed duplicated region for block: B:35:0x0107  */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            AnonymousClass2 anonymousClass2;
            x xVar;
            ArrayList arrayListV0;
            ArrayList arrayListV02;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            boolean z11 = true;
            if (i5 == 0) {
                ResultKt.b(obj);
                MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "launched the scope to initialize sdk with thread name: " + Thread.currentThread().getName() + " and dispatcher DispatcherProvider().IO", null, false, 12, null);
                com.moloco.sdk.internal.error.crash.a aVarB = a.d.f38287a.b();
                this.label = 1;
                if (aVarB.a(this) == coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 == 1) {
                ResultKt.b(obj);
            } else {
                if (i5 != 2) {
                    if (i5 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    anonymousClass2 = this;
                    Moloco moloco = Moloco.INSTANCE;
                    MolocoInitParams molocoInitParams = anonymousClass2.$initParam;
                    synchronized (moloco) {
                        LinkedHashSet linkedHashSet = new LinkedHashSet();
                        linkedHashSet.add(molocoInitParams.getMediationInfo().getName());
                        linkedHashSet.addAll(moloco.getPendingInitByMediator$moloco_sdk_release().keySet());
                        if (!linkedHashSet.isEmpty()) {
                            Iterator it = linkedHashSet.iterator();
                            while (it.hasNext()) {
                                if (Moloco.INSTANCE.shouldInitializeILRD((String) it.next())) {
                                    break;
                                }
                            }
                        }
                        z11 = false;
                    }
                    if (z11) {
                        Moloco.INSTANCE.initializeILRD();
                    }
                    MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "Moloco SDK initialization success", null, false, 12, null);
                    Moloco moloco2 = Moloco.INSTANCE;
                    synchronized (moloco2) {
                        arrayListV02 = b70.c.v0(moloco2.getPendingInitByMediator$moloco_sdk_release().values());
                        moloco2.getPendingInitByMediator$moloco_sdk_release().clear();
                    }
                    MolocoInitStatus molocoInitStatusB = com.moloco.sdk.internal.publisher.x.f37516f.b();
                    MolocoInitializationListener molocoInitializationListener = anonymousClass2.$listener;
                    if (molocoInitializationListener != null) {
                        y.a(molocoInitializationListener, molocoInitStatusB);
                    }
                    Iterator it2 = arrayListV02.iterator();
                    while (it2.hasNext()) {
                        y.a((MolocoInitializationListener) it2.next(), molocoInitStatusB);
                    }
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                anonymousClass2 = this;
                xVar = (x) obj;
                if (!(xVar instanceof x.a)) {
                    Moloco._failedMediations.add(anonymousClass2.$initParam.getMediationInfo().getName());
                    MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "Moloco SDK initialization failed", null, false, 12, null);
                    Moloco moloco3 = Moloco.INSTANCE;
                    synchronized (moloco3) {
                        arrayListV0 = b70.c.v0(moloco3.getPendingInitByMediator$moloco_sdk_release().values());
                        moloco3.getPendingInitByMediator$moloco_sdk_release().clear();
                    }
                    MolocoInitStatus molocoInitStatusA = com.moloco.sdk.internal.publisher.x.f37516f.a(((j) ((x.a) xVar).a()).toString());
                    MolocoInitializationListener molocoInitializationListener2 = anonymousClass2.$listener;
                    if (molocoInitializationListener2 != null) {
                        y.a(molocoInitializationListener2, molocoInitStatusA);
                    }
                    Iterator it3 = arrayListV0.iterator();
                    while (it3.hasNext()) {
                        y.a((MolocoInitializationListener) it3.next(), molocoInitStatusA);
                    }
                    return Unit.f71706a;
                }
                if (!(xVar instanceof x.b)) {
                    throw new NoWhenBranchMatchedException();
                }
                Moloco._failedMediations.remove(anonymousClass2.$initParam.getMediationInfo().getName());
                Moloco moloco4 = Moloco.INSTANCE;
                moloco4.processInitConfigs((Init.SDKInitResponse) ((x.b) xVar).a());
                anonymousClass2.label = 3;
            }
            Moloco moloco5 = Moloco.INSTANCE;
            moloco5.initializeAndroidClientMetrics(this.$initParam);
            com.moloco.sdk.internal.publisher.x initializationHandler = moloco5.getInitializationHandler();
            String appKey = this.$initParam.getAppKey();
            MediationInfo mediationInfo = this.$initParam.getMediationInfo();
            n nVarC = a.f.f38299a.c();
            MetricsRecorder metricsRecorderCreate = MetricsRecorder.INSTANCE.create(this.$initParam.getMediationInfo().getName());
            this.label = 2;
            anonymousClass2 = this;
            obj = initializationHandler.a(appKey, mediationInfo, nVarC, metricsRecorderCreate, anonymousClass2);
            if (obj != coroutineSingletons) {
                xVar = (x) obj;
                if (!(xVar instanceof x.a)) {
                }
            }
            return coroutineSingletons;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    private Moloco() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final C2940b adCreator_delegate$lambda$9() {
        return new C2940b(INSTANCE.getInitializationHandler().d(), a.h.f38309a.i(), new C2941c(null, 0L, 3, null), new Moloco$adCreator$2$1(null));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final i bidTokenHandler_delegate$lambda$8() {
        return new i(com.moloco.sdk.internal.services.bidtoken.n.a(), INSTANCE.getInitializationHandler(), a.h.f38309a.i());
    }

    @JvmStatic
    public static final void createBanner(@NotNull MediationInfo mediationInfo, @NotNull String adUnitId, @Nullable String watermarkString, @NotNull Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> callback) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(callback, "callback");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Creating banner async for adUnitId: " + adUnitId, null, false, 12, null);
        m0.t(INSTANCE.getScope(), null, null, new AnonymousClass1(mediationInfo, adUnitId, watermarkString, callback, null), 3);
    }

    public static /* synthetic */ void createBanner$default(MediationInfo mediationInfo, String str, String str2, Function2 function2, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = null;
        }
        createBanner(mediationInfo, str, str2, function2);
    }

    @JvmStatic
    public static final void createBannerTablet(@NotNull MediationInfo mediationInfo, @NotNull String adUnitId, @Nullable String watermarkString, @NotNull Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> callback) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(callback, "callback");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Creating banner tablet async for adUnitId: " + adUnitId, null, false, 12, null);
        m0.t(INSTANCE.getScope(), null, null, new C29641(mediationInfo, adUnitId, watermarkString, callback, null), 3);
    }

    public static /* synthetic */ void createBannerTablet$default(MediationInfo mediationInfo, String str, String str2, Function2 function2, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = null;
        }
        createBannerTablet(mediationInfo, str, str2, function2);
    }

    @JvmStatic
    public static final void createInterstitial(@NotNull MediationInfo mediationInfo, @NotNull String adUnitId, @Nullable String watermarkString, @NotNull Function2<? super InterstitialAd, ? super MolocoAdError.AdCreateError, Unit> callback) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(callback, "callback");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Creating interstitial ad for mediation async for adUnitId: " + adUnitId, null, false, 12, null);
        m0.t(INSTANCE.getScope(), null, null, new C29651(mediationInfo, adUnitId, watermarkString, callback, null), 3);
    }

    public static /* synthetic */ void createInterstitial$default(MediationInfo mediationInfo, String str, String str2, Function2 function2, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = null;
        }
        createInterstitial(mediationInfo, str, str2, function2);
    }

    @JvmStatic
    public static final void createMREC(@NotNull MediationInfo mediationInfo, @NotNull String adUnitId, @Nullable String watermarkString, @NotNull Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> callback) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(callback, "callback");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Creating banner MREC async for adUnitId: " + adUnitId, null, false, 12, null);
        m0.t(INSTANCE.getScope(), null, null, new C29661(mediationInfo, adUnitId, watermarkString, callback, null), 3);
    }

    public static /* synthetic */ void createMREC$default(MediationInfo mediationInfo, String str, String str2, Function2 function2, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = null;
        }
        createMREC(mediationInfo, str, str2, function2);
    }

    @JvmStatic
    public static final void createMolocoBanner(@NotNull MediationInfo mediationInfo, @NotNull String adUnitId, @NotNull BannerAdSize size, @Nullable String watermarkString, @NotNull Function2<? super Banner, ? super MolocoAdError.AdCreateError, Unit> callback) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(size, "size");
        Intrinsics.g(callback, "callback");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Creating Moloco banner async for adUnitId: " + adUnitId + ", size: " + size, null, false, 12, null);
        m0.t(INSTANCE.getScope(), null, null, new C29671(mediationInfo, size, adUnitId, watermarkString, callback, null), 3);
    }

    public static /* synthetic */ void createMolocoBanner$default(MediationInfo mediationInfo, String str, BannerAdSize bannerAdSize, String str2, Function2 function2, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            str2 = null;
        }
        createMolocoBanner(mediationInfo, str, bannerAdSize, str2, function2);
    }

    @JvmStatic
    public static final void createNativeAd(@NotNull MediationInfo mediationInfo, @NotNull String adUnitId, @Nullable String watermarkString, @NotNull Function2<? super NativeAd, ? super MolocoAdError.AdCreateError, Unit> callback) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(callback, "callback");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Creating native ad for mediation async for adUnitId: " + adUnitId, null, false, 12, null);
        m0.t(INSTANCE.getScope(), null, null, new C29681(mediationInfo, adUnitId, watermarkString, callback, null), 3);
    }

    public static /* synthetic */ void createNativeAd$default(MediationInfo mediationInfo, String str, String str2, Function2 function2, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = null;
        }
        createNativeAd(mediationInfo, str, str2, function2);
    }

    @JvmStatic
    public static final void createRewardedInterstitial(@NotNull MediationInfo mediationInfo, @NotNull String adUnitId, @Nullable String watermarkString, @NotNull Function2<? super RewardedInterstitialAd, ? super MolocoAdError.AdCreateError, Unit> callback) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(callback, "callback");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Creating rewarded ad for mediation async for adUnitId: " + adUnitId, null, false, 12, null);
        m0.t(INSTANCE.getScope(), null, null, new C29691(mediationInfo, adUnitId, watermarkString, callback, null), 3);
    }

    public static /* synthetic */ void createRewardedInterstitial$default(MediationInfo mediationInfo, String str, String str2, Function2 function2, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = null;
        }
        createRewardedInterstitial(mediationInfo, str, str2, function2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final C2940b getAdCreator() {
        return (C2940b) adCreator.getValue();
    }

    @JvmStatic
    public static final void getBidToken(@NotNull MediationInfo mediationInfo, @NotNull Context context, @NotNull MolocoBidTokenListener listener) {
        Intrinsics.g(mediationInfo, "mediationInfo");
        Intrinsics.g(context, "context");
        Intrinsics.g(listener, "listener");
        com.moloco.sdk.internal.android_context.b.a(context);
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "[Thread id: " + Thread.currentThread().getId() + ", name: " + Thread.currentThread().getName() + "] Fetching bid token", null, false, 12, null);
        m0.t(com.moloco.sdk.internal.scheduling.c.f37576a.b(), null, null, new C29701(MetricsRecorder.INSTANCE.create(mediationInfo.getName()), mediationInfo, listener, null), 3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final h getBidTokenHandler() {
        return (h) bidTokenHandler.getValue();
    }

    public static /* synthetic */ void getInitJob$annotations() {
    }

    public static /* synthetic */ void getInitParams$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final com.moloco.sdk.internal.publisher.x getInitializationHandler() {
        return (com.moloco.sdk.internal.publisher.x) initializationHandler.getValue();
    }

    public static /* synthetic */ void getPendingInitByMediator$moloco_sdk_release$annotations() {
    }

    private final j0 getScope() {
        return (j0) scope.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final com.moloco.sdk.internal.publisher.x initializationHandler_delegate$lambda$7() {
        return new com.moloco.sdk.internal.publisher.x(a.h.f38309a.i());
    }

    @JvmStatic
    @JvmOverloads
    public static final void initialize(@NotNull MolocoInitParams initParam) {
        Intrinsics.g(initParam, "initParam");
        initialize$default(initParam, null, 2, null);
    }

    public static /* synthetic */ void initialize$default(MolocoInitParams molocoInitParams, MolocoInitializationListener molocoInitializationListener, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            molocoInitializationListener = null;
        }
        initialize(molocoInitParams, molocoInitializationListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void initializeAndroidClientMetrics(MolocoInitParams initParams2) {
        if (!getInitializationHandler().c()) {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, "Moloco", "ACM cannot be initialized as Moloco SDK cannot be initialized", null, false, 12, null);
            return;
        }
        com.moloco.sdk.internal.configs.a aVarC = com.moloco.sdk.internal.configs.b.c();
        AndroidClientMetrics androidClientMetrics = AndroidClientMetrics.INSTANCE;
        String appKey = initParams2.getAppKey();
        String strD = aVarC.d();
        Context appContext = initParams2.getAppContext();
        long jC = aVarC.c();
        Pair pair = new Pair(com.moloco.sdk.acm.b.f36017e, initParams2.getAppKey());
        a.e eVar = a.e.f38290a;
        AndroidClientMetrics.initialize$default(androidClientMetrics, new InitConfig(appKey, strD, appContext, jC, MapsKt.j0(pair, new Pair(com.moloco.sdk.acm.b.f36018f, eVar.h().invoke().b()), new Pair(com.moloco.sdk.acm.b.f36019g, eVar.h().invoke().c()), new Pair(com.moloco.sdk.acm.b.f36020h, BuildConfig.SDK_VERSION_NAME), new Pair(com.moloco.sdk.acm.b.f36016d, eVar.l().invoke().w()), new Pair(com.moloco.sdk.acm.b.f36015c, eVar.l().invoke().x()))), null, 2, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void initializeILRD() {
        Init.SDKInitResponse sDKInitResponseE = getInitializationHandler().e();
        if (sDKInitResponseE == null) {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, "Moloco", "ILRD cannot be initialized as Moloco SDK is not initialized", null, false, 12, null);
            return;
        }
        Throwable thA = Result.a(a.b.f38277a.g().b(sDKInitResponseE));
        if (thA != null) {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", fq.c.f(thA, new StringBuilder("ILRD initialization failed. ")), null, false, 12, null);
        }
    }

    public static final boolean isInitialized() {
        return INSTANCE.getInitializationHandler().d().getValue() == Initialization.SUCCESS;
    }

    @JvmStatic
    public static /* synthetic */ void isInitialized$annotations() {
    }

    private final void logMolocoInfo(MolocoInitParams initParam) {
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        MolocoLogger.info$default(molocoLogger, "Moloco", "=====================================", null, false, 12, null);
        MolocoLogger.info$default(molocoLogger, "Moloco", "Moloco SDK initializing", null, false, 12, null);
        MolocoLogger.info$default(molocoLogger, "Moloco", "SDK Version: 4.11.1", null, false, 12, null);
        MolocoLogger.info$default(molocoLogger, "Moloco", "Mediation: " + initParam.getMediationInfo().getName(), null, false, 12, null);
        MolocoLogger.info$default(molocoLogger, "Moloco", "isInitialized: " + isInitialized(), null, false, 12, null);
        MolocoLogger.info$default(molocoLogger, "Moloco", "=====================================", null, false, 12, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void processInitConfigs(Init.SDKInitResponse sdkInitResponse) {
        if (sdkInitResponse.hasEventCollectionConfig()) {
            Init.SDKInitResponse.EventCollectionConfig eventCollectionConfig = sdkInitResponse.getEventCollectionConfig();
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            MolocoLogger.debug$default(molocoLogger, "Moloco", "Init response has eventCollectionConfig", false, 4, null);
            MolocoLogger.debug$default(molocoLogger, "Moloco", "eventCollectionConfig:", false, 4, null);
            MolocoLogger.debug$default(molocoLogger, "Moloco", "eventCollectionEnabled: " + eventCollectionConfig.getEventCollectionEnabled(), false, 4, null);
            MolocoLogger.debug$default(molocoLogger, "Moloco", "mrefCollectionEnabled: " + eventCollectionConfig.getMrefCollectionEnabled(), false, 4, null);
            MolocoLogger.debug$default(molocoLogger, "Moloco", "appFgUrl: " + eventCollectionConfig.getAppForegroundTrackingUrl(), false, 4, null);
            MolocoLogger.debug$default(molocoLogger, "Moloco", "appBgUrl: " + eventCollectionConfig.getAppBackgroundTrackingUrl(), false, 4, null);
            com.moloco.sdk.xenoss.sdkdevkit.android.core.services.c cVarC = a.k.f38325a.c();
            boolean eventCollectionEnabled = eventCollectionConfig.getEventCollectionEnabled();
            boolean mrefCollectionEnabled = eventCollectionConfig.getMrefCollectionEnabled();
            String appForegroundTrackingUrl = eventCollectionConfig.getAppForegroundTrackingUrl();
            Intrinsics.f(appForegroundTrackingUrl, "getAppForegroundTrackingUrl(...)");
            String appBackgroundTrackingUrl = eventCollectionConfig.getAppBackgroundTrackingUrl();
            Intrinsics.f(appBackgroundTrackingUrl, "getAppBackgroundTrackingUrl(...)");
            cVarC.a(eventCollectionEnabled, mrefCollectionEnabled, appForegroundTrackingUrl, appBackgroundTrackingUrl);
            if (eventCollectionConfig.getEventCollectionEnabled()) {
                a.b.f38277a.e().a();
            }
        } else {
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, "Moloco", "Init response does not have eventCollectionConfig", false, 4, null);
        }
        a.c.f38284a.b().a(sdkInitResponse);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean shouldInitializeILRD(String mediationName) {
        Init.SDKInitResponse.ILRDConfig ilrdConfig;
        List<Init.SDKInitResponse.SupportedNetworks> supportedNetworksList;
        Init.SDKInitResponse sDKInitResponseE = getInitializationHandler().e();
        if (sDKInitResponseE == null || (ilrdConfig = sDKInitResponseE.getIlrdConfig()) == null || (supportedNetworksList = ilrdConfig.getSupportedNetworksList()) == null) {
            return false;
        }
        ArrayList arrayList = new ArrayList(b70.c.u0(supportedNetworksList, 10));
        for (Init.SDKInitResponse.SupportedNetworks supportedNetworks : supportedNetworksList) {
            String lowerCase = ((supportedNetworks == null ? -1 : WhenMappings.$EnumSwitchMapping$0[supportedNetworks.ordinal()]) == 1 ? "LevelPlay" : supportedNetworks.name()).toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            arrayList.add(lowerCase);
        }
        String lowerCase2 = mediationName.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        return arrayList.contains(lowerCase2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object updateAndroidClientMetricsOnInitSuccess(Continuation<? super Unit> continuation) {
        Object objUpdateConfig = AndroidClientMetrics.INSTANCE.updateConfig(new UpdateConfig(((com.moloco.sdk.internal.configs.a) a.c.f38284a.b().a(com.moloco.sdk.internal.configs.a.class, com.moloco.sdk.internal.configs.b.c())).d(), new Long(r0.c())), continuation);
        return objUpdateConfig == CoroutineSingletons.f71806a ? objUpdateConfig : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0058, code lost:
    
        if (t70.m0.i(r13, r0) == r1) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x006f, code lost:
    
        if (r13.b(r0) == r1) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0071, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object clearState$moloco_sdk_release(@NotNull Continuation<? super Unit> continuation) {
        Moloco$clearState$1 moloco$clearState$1;
        Moloco moloco;
        if (continuation instanceof Moloco$clearState$1) {
            moloco$clearState$1 = (Moloco$clearState$1) continuation;
            int i5 = moloco$clearState$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                moloco$clearState$1.label = i5 - Integer.MIN_VALUE;
            } else {
                moloco$clearState$1 = new Moloco$clearState$1(this, continuation);
            }
        }
        Object obj = moloco$clearState$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = moloco$clearState$1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, "Moloco", "clearState() unit testing function called", false, 4, null);
            initParams = null;
            r1 r1Var = initJob;
            if (r1Var != null) {
                moloco$clearState$1.L$0 = this;
                moloco$clearState$1.label = 1;
            }
            moloco = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            moloco = (Moloco) moloco$clearState$1.L$0;
            ResultKt.b(obj);
        }
        initJob = null;
        pendingInitByMediator.clear();
        com.moloco.sdk.internal.publisher.x initializationHandler2 = moloco.getInitializationHandler();
        moloco$clearState$1.L$0 = null;
        moloco$clearState$1.label = 2;
    }

    @Nullable
    public final String getAppKey$moloco_sdk_release() {
        MolocoInitParams molocoInitParams = initParams;
        if (molocoInitParams != null) {
            return molocoInitParams.getAppKey();
        }
        return null;
    }

    @NotNull
    public final Set<String> getFailedMediations$moloco_sdk_release() {
        return g.N1(_failedMediations);
    }

    @Nullable
    public final r1 getInitJob() {
        return initJob;
    }

    @Nullable
    public final MolocoInitParams getInitParams() {
        return initParams;
    }

    @NotNull
    public final Map<String, List<MolocoInitializationListener>> getPendingInitByMediator$moloco_sdk_release() {
        return pendingInitByMediator;
    }

    public final void setInitJob(@Nullable r1 r1Var) {
        initJob = r1Var;
    }

    public final void setInitParams(@Nullable MolocoInitParams molocoInitParams) {
        initParams = molocoInitParams;
    }

    @JvmStatic
    @JvmOverloads
    public static final synchronized void initialize(@NotNull MolocoInitParams initParam, @Nullable MolocoInitializationListener listener) {
        try {
            Intrinsics.g(initParam, "initParam");
            Moloco moloco = INSTANCE;
            moloco.logMolocoInfo(initParam);
            if (initParam.getAppKey().length() == 0) {
                throw new IllegalArgumentException("Moloco SDK initialized with empty appKey");
            }
            if (isInitialized()) {
                if (Intrinsics.b(initParam.getAppKey(), moloco.getAppKey$moloco_sdk_release())) {
                    MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "Already initialized. Returning and notifying listener", null, false, 12, null);
                    if (moloco.shouldInitializeILRD(initParam.getMediationInfo().getName())) {
                        moloco.initializeILRD();
                    }
                    if (listener != null) {
                        y.a(listener, com.moloco.sdk.internal.publisher.x.f37516f.a());
                    }
                } else {
                    MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "Already initialized but with different appKey. Returning error and notifying listener", null, false, 12, null);
                    _failedMediations.add(initParam.getMediationInfo().getName());
                    MetricsRecorder.INSTANCE.create(initParam.getMediationInfo().getName()).recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36271i.c()));
                    if (listener != null) {
                        y.a(listener, com.moloco.sdk.internal.publisher.x.f37516f.a(com.moloco.sdk.internal.publisher.x.f37521k));
                    }
                }
                return;
            }
            synchronized (moloco) {
                try {
                    r1 r1Var = initJob;
                    if (r1Var == null || !r1Var.b()) {
                        Unit unit = Unit.f71706a;
                        initParams = initParam;
                        com.moloco.sdk.internal.android_context.b.a(initParam.getAppContext());
                        initJob = m0.t(k0.a(com.moloco.sdk.internal.scheduling.b.a().getIo()), null, null, new AnonymousClass2(initParam, listener, null), 3);
                        return;
                    }
                    String appKey = initParam.getAppKey();
                    MolocoInitParams molocoInitParams = initParams;
                    if (!Intrinsics.b(appKey, molocoInitParams != null ? molocoInitParams.getAppKey() : null)) {
                        MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "Init Job active with different appKey. Notifying listener and avoiding init", null, false, 12, null);
                        _failedMediations.add(initParam.getMediationInfo().getName());
                        MetricsRecorder.INSTANCE.create(initParam.getMediationInfo().getName()).recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36271i.c()));
                        if (listener != null) {
                            y.a(listener, com.moloco.sdk.internal.publisher.x.f37516f.a(com.moloco.sdk.internal.publisher.x.f37522l));
                        }
                        return;
                    }
                    MolocoLogger.info$default(MolocoLogger.INSTANCE, "Moloco", "Init Job active with same appKey. Queuing listener and returning for mediator: " + initParam.getMediationInfo().getName(), null, false, 12, null);
                    String name = initParam.getMediationInfo().getName();
                    Map<String, List<MolocoInitializationListener>> map = pendingInitByMediator;
                    List<MolocoInitializationListener> arrayList = map.get(name);
                    if (arrayList == null) {
                        arrayList = new ArrayList<>();
                        map.put(name, arrayList);
                    }
                    List<MolocoInitializationListener> list = arrayList;
                    if (listener != null) {
                        list.add(listener);
                    }
                } finally {
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
