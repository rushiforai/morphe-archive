package com.instabridge.ai.billing;

import a80.d;
import a80.e;
import android.app.Activity;
import android.content.Context;
import android.util.Log;
import b.c0;
import b70.c;
import b70.g;
import com.android.billingclient.api.AcknowledgePurchaseParams;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClientKotlinKt;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.PendingPurchasesParams;
import com.android.billingclient.api.ProductDetails;
import com.android.billingclient.api.ProductDetailsResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.QueryProductDetailsParams;
import com.android.billingclient.api.QueryPurchasesParams;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.instabridge.ai.billing.PurchaseVerifier;
import com.instabridge.ai.chat.data.ConversationApiClient;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import h6.j0;
import h6.m0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.k0;
import t70.y0;
import y70.o;

@Metadata(d1 = {"\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u0000 T2\u00020\u0001:\u0001TB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0007\u001a\u00020\u0006H\u0082@¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0006H\u0082@¢\u0006\u0004\b\t\u0010\bJ\u0018\u0010\f\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\nH\u0082@¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0006H\u0082@¢\u0006\u0004\b\u000e\u0010\bJ\r\u0010\u000f\u001a\u00020\u0006¢\u0006\u0004\b\u000f\u0010\u0010J%\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0013¢\u0006\u0004\b\u0016\u0010\u0017J\u001f\u0010\u0018\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0013¢\u0006\u0004\b\u0018\u0010\u0019J\r\u0010\u001a\u001a\u00020\u0006¢\u0006\u0004\b\u001a\u0010\u0010R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u001bR\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u001c8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR\u001c\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u001f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b!\u0010\"R\u001c\u0010$\u001a\b\u0012\u0004\u0012\u00020#0\u001f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b$\u0010\"R\u0014\u0010&\u001a\u00020%8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b&\u0010'R\u0014\u0010)\u001a\u00020(8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b)\u0010*R\u0014\u0010,\u001a\u00020+8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b,\u0010-R\"\u00101\u001a\u0010\u0012\f\u0012\n 0*\u0004\u0018\u00010/0/0.8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b1\u00102R\u001d\u00104\u001a\b\u0012\u0004\u0012\u00020/038\u0006¢\u0006\f\n\u0004\b4\u00105\u001a\u0004\b4\u00106R\u0018\u00107\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b7\u00108RA\u0010=\u001a!\u0012\u0015\u0012\u0013\u0018\u00010\u0013¢\u0006\f\b:\u0012\b\b;\u0012\u0004\b\b(<\u0012\u0004\u0012\u00020\u0006\u0018\u0001098\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b=\u0010>\u001a\u0004\b?\u0010@\"\u0004\bA\u0010BRT\u0010E\u001a4\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b:\u0012\b\b;\u0012\u0004\b\b(\u0014\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b:\u0012\b\b;\u0012\u0004\b\b(D\u0012\u0004\u0012\u00020\u0006\u0018\u00010C8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\bE\u0010F\u001a\u0004\bG\u0010H\"\u0004\bI\u0010JR\u0014\u0010L\u001a\u00020K8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bL\u0010MR\u0014\u0010O\u001a\u00020N8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bO\u0010PR\u0017\u0010S\u001a\b\u0012\u0004\u0012\u00020 0\u001f8F¢\u0006\u0006\u001a\u0004\bQ\u0010R¨\u0006U"}, d2 = {"Lcom/instabridge/ai/billing/BillingManager;", b.f42142b, "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", b.f42142b, "fetchProducts", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "queryProductDetails", "Lcom/android/billingclient/api/Purchase;", "purchase", "handlePurchase", "(Lcom/android/billingclient/api/Purchase;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "recoverPendingPurchases", "initialize", "()V", "Landroid/app/Activity;", "activity", b.f42142b, "plan", "period", "launchPurchase", "(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V", "getFormattedPrice", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", "destroy", "Landroid/content/Context;", "Lcom/android/billingclient/api/BillingClient;", "billingClient", "Lcom/android/billingclient/api/BillingClient;", b.f42142b, "Lcom/instabridge/ai/billing/BillingProduct;", "products", "Ljava/util/List;", "Lcom/android/billingclient/api/ProductDetails;", "productDetailsList", "Lt70/j0;", "scope", "Lt70/j0;", "Lcom/instabridge/ai/billing/PurchaseVerifier;", "verifier", "Lcom/instabridge/ai/billing/PurchaseVerifier;", "Lcom/instabridge/ai/billing/RejectedTokenStore;", "rejectedTokens", "Lcom/instabridge/ai/billing/RejectedTokenStore;", "Lh6/m0;", b.f42142b, "kotlin.jvm.PlatformType", "_isAvailable", "Lh6/m0;", "Lh6/j0;", "isAvailable", "Lh6/j0;", "()Lh6/j0;", "pendingBasePlanId", "Ljava/lang/String;", "Lkotlin/Function1;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "upgradeUrl", "onFallbackUpgrade", "Lkotlin/jvm/functions/Function1;", "getOnFallbackUpgrade", "()Lkotlin/jvm/functions/Function1;", "setOnFallbackUpgrade", "(Lkotlin/jvm/functions/Function1;)V", "Lkotlin/Function2;", "status", "onSubscriptionChanged", "Lkotlin/jvm/functions/Function2;", "getOnSubscriptionChanged", "()Lkotlin/jvm/functions/Function2;", "setOnSubscriptionChanged", "(Lkotlin/jvm/functions/Function2;)V", "Lcom/android/billingclient/api/PurchasesUpdatedListener;", "purchasesUpdatedListener", "Lcom/android/billingclient/api/PurchasesUpdatedListener;", "Lcom/android/billingclient/api/BillingClientStateListener;", "connectionListener", "Lcom/android/billingclient/api/BillingClientStateListener;", "getAvailablePlans", "()Ljava/util/List;", "availablePlans", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BillingManager {

    @NotNull
    private static final String TAG = "BillingManager";

    @NotNull
    private final m0 _isAvailable;

    @Nullable
    private BillingClient billingClient;

    @NotNull
    private final BillingClientStateListener connectionListener;

    @NotNull
    private final Context context;

    @NotNull
    private final j0 isAvailable;

    @Nullable
    private Function1<? super String, Unit> onFallbackUpgrade;

    @Nullable
    private Function2<? super String, ? super String, Unit> onSubscriptionChanged;

    @Nullable
    private String pendingBasePlanId;

    @NotNull
    private List<ProductDetails> productDetailsList;

    @NotNull
    private List<BillingProduct> products;

    @NotNull
    private final PurchasesUpdatedListener purchasesUpdatedListener;

    @NotNull
    private final RejectedTokenStore rejectedTokens;

    @NotNull
    private final t70.j0 scope;

    @NotNull
    private final PurchaseVerifier verifier;
    public static final int $stable = 8;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.billing.BillingManager", f = "BillingManager.kt", l = {168, TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173}, m = "fetchProducts")
    /* renamed from: com.instabridge.ai.billing.BillingManager$fetchProducts$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
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
            return BillingManager.this.fetchProducts(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.billing.BillingManager", f = "BillingManager.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 231, 239}, m = "handlePurchase")
    /* renamed from: com.instabridge.ai.billing.BillingManager$handlePurchase$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27931 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C27931(Continuation<? super C27931> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return BillingManager.this.handlePurchase(null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.billing.BillingManager$handlePurchase$3", f = "BillingManager.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.billing.BillingManager$handlePurchase$3, reason: invalid class name */
    public static final class AnonymousClass3 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ PurchaseVerifier.VerifyResult $result;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass3(PurchaseVerifier.VerifyResult verifyResult, Continuation<? super AnonymousClass3> continuation) {
            super(2, continuation);
            this.$result = verifyResult;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return BillingManager.this.new AnonymousClass3(this.$result, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            Function2<String, String, Unit> onSubscriptionChanged = BillingManager.this.getOnSubscriptionChanged();
            if (onSubscriptionChanged == null) {
                return null;
            }
            onSubscriptionChanged.invoke(((PurchaseVerifier.VerifyResult.Confirmed) this.$result).getPlan(), ((PurchaseVerifier.VerifyResult.Confirmed) this.$result).getStatus());
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(t70.j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass3) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.billing.BillingManager", f = "BillingManager.kt", l = {192}, m = "queryProductDetails")
    /* renamed from: com.instabridge.ai.billing.BillingManager$queryProductDetails$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27941 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C27941(Continuation<? super C27941> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return BillingManager.this.queryProductDetails(this);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public BillingManager(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.context = context;
        EmptyList emptyList = EmptyList.f71733a;
        this.products = emptyList;
        this.productDetailsList = emptyList;
        e eVar = y0.f88884a;
        this.scope = k0.a(d.f488c.plus(t70.m0.d()));
        this.verifier = new PurchaseVerifier();
        this.rejectedTokens = new RejectedTokenStore(context, null, 2, 0 == true ? 1 : 0);
        m0 m0Var = new m0(0);
        this._isAvailable = m0Var;
        this.isAvailable = m0Var;
        this.purchasesUpdatedListener = new a(this);
        this.connectionListener = new BillingClientStateListener() { // from class: com.instabridge.ai.billing.BillingManager$connectionListener$1
            @Override // com.android.billingclient.api.BillingClientStateListener
            public void onBillingServiceDisconnected() {
                this.this$0._isAvailable.k(Boolean.FALSE);
                Log.w("BillingManager", "Billing service disconnected, scheduling reconnect");
                t70.m0.t(this.this$0.scope, null, null, new BillingManager$connectionListener$1$onBillingServiceDisconnected$1(this.this$0, null), 3);
            }

            @Override // com.android.billingclient.api.BillingClientStateListener
            public void onBillingSetupFinished(BillingResult billingResult) {
                Intrinsics.g(billingResult, "billingResult");
                if (billingResult.getResponseCode() == 0) {
                    this.this$0._isAvailable.k(Boolean.TRUE);
                    t70.m0.t(this.this$0.scope, null, null, new BillingManager$connectionListener$1$onBillingSetupFinished$1(this.this$0, null), 3);
                } else {
                    Log.w("BillingManager", "Billing setup failed: " + billingResult.getDebugMessage());
                    this.this$0._isAvailable.k(Boolean.FALSE);
                }
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0060, code lost:
    
        if (queryProductDetails(r0) == r1) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object fetchProducts(Continuation<? super Unit> continuation) {
        AnonymousClass1 anonymousClass1;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object products = anonymousClass1.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        try {
        } catch (Exception e3) {
            Log.e(TAG, "Failed to fetch products: " + e3.getMessage());
        }
        if (i11 == 0) {
            ResultKt.b(products);
            ConversationApiClient conversationApiClientE = fo.d.e();
            anonymousClass1.label = 1;
            products = conversationApiClientE.getProducts(anonymousClass1);
            if (products == obj) {
            }
            return obj;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(products);
            return Unit.f71706a;
        }
        ResultKt.b(products);
        List<BillingProduct> listFromApiResponse = BillingProduct.INSTANCE.fromApiResponse((String) products);
        this.products = listFromApiResponse;
        if (!listFromApiResponse.isEmpty()) {
            anonymousClass1.label = 2;
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0179 A[Catch: Exception -> 0x0171, TryCatch #2 {Exception -> 0x0171, blocks: (B:71:0x016d, B:76:0x0179, B:79:0x0180, B:81:0x018c, B:83:0x0192, B:62:0x012f, B:64:0x0135, B:66:0x0147, B:68:0x0160, B:58:0x0125), top: B:109:0x0125 }] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x018c A[Catch: Exception -> 0x0171, TryCatch #2 {Exception -> 0x0171, blocks: (B:71:0x016d, B:76:0x0179, B:79:0x0180, B:81:0x018c, B:83:0x0192, B:62:0x012f, B:64:0x0135, B:66:0x0147, B:68:0x0160, B:58:0x0125), top: B:109:0x0125 }] */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0191  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01bb  */
    /* JADX WARN: Type inference failed for: r0v29, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r0v45 */
    /* JADX WARN: Type inference failed for: r0v46 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object handlePurchase(Purchase purchase, Continuation<? super Unit> continuation) {
        C27931 c27931;
        String str;
        String str2;
        String str3;
        BillingResult billingResult;
        Object objVerify$default;
        Purchase purchase2;
        Object next;
        List<BasePlan> basePlans;
        BasePlan basePlan;
        PurchaseVerifier.VerifyResult verifyResult;
        BillingResult billingResult2;
        Object objAcknowledgePurchase;
        String str4;
        ?? r02;
        u70.d dVar;
        AnonymousClass3 anonymousClass3;
        PurchaseVerifier.VerifyResult verifyResult2;
        String str5;
        BillingResult billingResult3;
        BillingResult billingResult4;
        BillingResult billingResult5;
        if (continuation instanceof C27931) {
            c27931 = (C27931) continuation;
            int i5 = c27931.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27931.label = i5 - Integer.MIN_VALUE;
            } else {
                c27931 = new C27931(continuation);
            }
        }
        C27931 c279312 = c27931;
        Object obj = c279312.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c279312.label;
        String str6 = null;
        try {
            try {
            } catch (Exception e3) {
                e = e3;
            }
        } catch (Exception e11) {
            e = e11;
            str6 = TAG;
        }
        if (i11 == 0) {
            ResultKt.b(obj);
            List<String> products = purchase.getProducts();
            Intrinsics.f(products, "getProducts(...)");
            String str7 = (String) g.Y0(products);
            if (str7 == null) {
                return Unit.f71706a;
            }
            String basePlanId = this.pendingBasePlanId;
            if (basePlanId == null) {
                Iterator it = this.products.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (Intrinsics.b(((BillingProduct) next).getProductId(), str7)) {
                        break;
                    }
                }
                BillingProduct billingProduct = (BillingProduct) next;
                basePlanId = (billingProduct == null || (basePlans = billingProduct.getBasePlans()) == null || (basePlan = (BasePlan) g.Y0(basePlans)) == null) ? null : basePlan.getBasePlanId();
                if (basePlanId == null) {
                    return Unit.f71706a;
                }
            }
            String packageName = this.context.getPackageName();
            RejectedTokenStore rejectedTokenStore = this.rejectedTokens;
            String purchaseToken = purchase.getPurchaseToken();
            Intrinsics.f(purchaseToken, "getPurchaseToken(...)");
            String strDenialReason = rejectedTokenStore.denialReason(purchaseToken);
            if (strDenialReason != null) {
                Log.i(TAG, "Skipping verify — token previously rejected (" + strDenialReason + "): " + str7);
                return Unit.f71706a;
            }
            String str8 = basePlanId;
            PurchaseVerifier purchaseVerifier = this.verifier;
            String purchaseToken2 = purchase.getPurchaseToken();
            Intrinsics.f(purchaseToken2, "getPurchaseToken(...)");
            Intrinsics.d(packageName);
            c279312.L$0 = purchase;
            c279312.L$1 = str7;
            c279312.label = 1;
            str = "getPurchaseToken(...)";
            str2 = TAG;
            str3 = str7;
            billingResult = null;
            try {
                objVerify$default = PurchaseVerifier.verify$default(purchaseVerifier, purchaseToken2, str3, str8, packageName, 0, false, c279312, 48, null);
                if (objVerify$default == coroutineSingletons) {
                    return coroutineSingletons;
                }
                purchase2 = purchase;
            } catch (Exception e12) {
                e = e12;
                str6 = str2;
                Log.e(str6, "Failed to verify purchase: " + e.getMessage());
                return Unit.f71706a;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    verifyResult2 = (PurchaseVerifier.VerifyResult) c279312.L$1;
                    str5 = (String) c279312.L$0;
                    ResultKt.b(obj);
                    str4 = TAG;
                    Log.i(str4, "Purchase verified and acknowledged: " + str5 + " -> " + ((PurchaseVerifier.VerifyResult.Confirmed) verifyResult2).getPlan());
                    return Unit.f71706a;
                }
                verifyResult = (PurchaseVerifier.VerifyResult) c279312.L$1;
                String str9 = (String) c279312.L$0;
                ResultKt.b(obj);
                str3 = str9;
                str2 = TAG;
                objAcknowledgePurchase = obj;
                billingResult5 = null;
                billingResult2 = (BillingResult) objAcknowledgePurchase;
                billingResult4 = billingResult5;
                if (billingResult2 == null && billingResult2.getResponseCode() == 0) {
                    billingResult3 = billingResult4;
                    str4 = str2;
                    r02 = billingResult3;
                    e eVar = y0.f88884a;
                    dVar = o.f96819a;
                    anonymousClass3 = new AnonymousClass3(verifyResult, r02);
                    c279312.L$0 = str3;
                    c279312.L$1 = verifyResult;
                    c279312.label = 3;
                    if (t70.m0.y(dVar, anonymousClass3, c279312) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Failed to acknowledge purchase: ");
                sb2.append(billingResult2 != null ? billingResult2.getDebugMessage() : billingResult4);
                str4 = str2;
                Log.w(str4, sb2.toString());
                r02 = billingResult4;
                e eVar2 = y0.f88884a;
                dVar = o.f96819a;
                anonymousClass3 = new AnonymousClass3(verifyResult, r02);
                c279312.L$0 = str3;
                c279312.L$1 = verifyResult;
                c279312.label = 3;
                if (t70.m0.y(dVar, anonymousClass3, c279312) != coroutineSingletons) {
                    verifyResult2 = verifyResult;
                    str5 = str3;
                    Log.i(str4, "Purchase verified and acknowledged: " + str5 + " -> " + ((PurchaseVerifier.VerifyResult.Confirmed) verifyResult2).getPlan());
                    return Unit.f71706a;
                }
                return coroutineSingletons;
            }
            String str10 = (String) c279312.L$1;
            purchase2 = (Purchase) c279312.L$0;
            ResultKt.b(obj);
            str = "getPurchaseToken(...)";
            str2 = TAG;
            str3 = str10;
            objVerify$default = obj;
            billingResult = null;
        }
        verifyResult = (PurchaseVerifier.VerifyResult) objVerify$default;
        if (!(verifyResult instanceof PurchaseVerifier.VerifyResult.Confirmed)) {
            String str11 = str2;
            if (verifyResult instanceof PurchaseVerifier.VerifyResult.StillPending) {
                Log.i(str11, "Purchase still pending after retries — will retry on next launch: " + str3);
            } else if (verifyResult instanceof PurchaseVerifier.VerifyResult.Rejected) {
                RejectedTokenStore rejectedTokenStore2 = this.rejectedTokens;
                String purchaseToken3 = purchase2.getPurchaseToken();
                Intrinsics.f(purchaseToken3, str);
                rejectedTokenStore2.record(purchaseToken3, ((PurchaseVerifier.VerifyResult.Rejected) verifyResult).getDenialReason());
                Log.w(str11, "Purchase rejected by backend (" + ((PurchaseVerifier.VerifyResult.Rejected) verifyResult).getDenialReason() + "): " + str3);
            } else {
                if (!(verifyResult instanceof PurchaseVerifier.VerifyResult.Error)) {
                    throw new NoWhenBranchMatchedException();
                }
                Log.e(str11, "Purchase verify transient error code=" + ((PurchaseVerifier.VerifyResult.Error) verifyResult).getCode() + " body=" + ((PurchaseVerifier.VerifyResult.Error) verifyResult).getBody());
            }
            return Unit.f71706a;
        }
        RejectedTokenStore rejectedTokenStore3 = this.rejectedTokens;
        String purchaseToken4 = purchase2.getPurchaseToken();
        Intrinsics.f(purchaseToken4, str);
        rejectedTokenStore3.clear(purchaseToken4);
        billingResult3 = billingResult;
        if (!purchase2.isAcknowledged()) {
            AcknowledgePurchaseParams acknowledgePurchaseParamsBuild = AcknowledgePurchaseParams.newBuilder().setPurchaseToken(purchase2.getPurchaseToken()).build();
            Intrinsics.f(acknowledgePurchaseParamsBuild, "build(...)");
            BillingClient billingClient = this.billingClient;
            if (billingClient == null) {
                billingResult2 = billingResult;
                billingResult4 = billingResult;
                if (billingResult2 == null) {
                }
                StringBuilder sb22 = new StringBuilder();
                sb22.append("Failed to acknowledge purchase: ");
                sb22.append(billingResult2 != null ? billingResult2.getDebugMessage() : billingResult4);
                str4 = str2;
                Log.w(str4, sb22.toString());
                r02 = billingResult4;
                e eVar22 = y0.f88884a;
                dVar = o.f96819a;
                anonymousClass3 = new AnonymousClass3(verifyResult, r02);
                c279312.L$0 = str3;
                c279312.L$1 = verifyResult;
                c279312.label = 3;
                if (t70.m0.y(dVar, anonymousClass3, c279312) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            c279312.L$0 = str3;
            c279312.L$1 = verifyResult;
            c279312.label = 2;
            objAcknowledgePurchase = BillingClientKotlinKt.acknowledgePurchase(billingClient, acknowledgePurchaseParamsBuild, c279312);
            billingResult5 = billingResult;
            if (objAcknowledgePurchase == coroutineSingletons) {
                return coroutineSingletons;
            }
            billingResult2 = (BillingResult) objAcknowledgePurchase;
            billingResult4 = billingResult5;
            if (billingResult2 == null) {
            }
            StringBuilder sb222 = new StringBuilder();
            sb222.append("Failed to acknowledge purchase: ");
            sb222.append(billingResult2 != null ? billingResult2.getDebugMessage() : billingResult4);
            str4 = str2;
            Log.w(str4, sb222.toString());
            r02 = billingResult4;
            e eVar222 = y0.f88884a;
            dVar = o.f96819a;
            anonymousClass3 = new AnonymousClass3(verifyResult, r02);
            c279312.L$0 = str3;
            c279312.L$1 = verifyResult;
            c279312.label = 3;
            if (t70.m0.y(dVar, anonymousClass3, c279312) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        str4 = str2;
        r02 = billingResult3;
        e eVar2222 = y0.f88884a;
        dVar = o.f96819a;
        anonymousClass3 = new AnonymousClass3(verifyResult, r02);
        c279312.L$0 = str3;
        c279312.L$1 = verifyResult;
        c279312.label = 3;
        if (t70.m0.y(dVar, anonymousClass3, c279312) != coroutineSingletons) {
        }
        return coroutineSingletons;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void purchasesUpdatedListener$lambda$0(BillingManager billingManager, BillingResult billingResult, List list) {
        Intrinsics.g(billingResult, "billingResult");
        int responseCode = billingResult.getResponseCode();
        if (responseCode != 0) {
            if (responseCode != 1) {
                Log.w(TAG, "Purchase failed: " + billingResult.getDebugMessage());
                return;
            }
            return;
        }
        if (list != null) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Purchase purchase = (Purchase) it.next();
                if (purchase.getPurchaseState() == 1) {
                    t70.m0.t(billingManager.scope, null, null, new BillingManager$purchasesUpdatedListener$1$1(billingManager, purchase, null), 3);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object queryProductDetails(Continuation<? super Unit> continuation) {
        C27941 c27941;
        ProductDetailsResult productDetailsResult;
        List<ProductDetails> productDetailsList;
        if (continuation instanceof C27941) {
            c27941 = (C27941) continuation;
            int i5 = c27941.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27941.label = i5 - Integer.MIN_VALUE;
            } else {
                c27941 = new C27941(continuation);
            }
        }
        Object objQueryProductDetails = c27941.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c27941.label;
        if (i11 == 0) {
            ResultKt.b(objQueryProductDetails);
            List<BillingProduct> list = this.products;
            ArrayList arrayList = new ArrayList(c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(QueryProductDetailsParams.Product.newBuilder().setProductId(((BillingProduct) it.next()).getProductId()).setProductType("subs").build());
            }
            QueryProductDetailsParams queryProductDetailsParamsBuild = QueryProductDetailsParams.newBuilder().setProductList(arrayList).build();
            Intrinsics.f(queryProductDetailsParamsBuild, "build(...)");
            BillingClient billingClient = this.billingClient;
            if (billingClient == null) {
                productDetailsResult = null;
                productDetailsList = productDetailsResult != null ? productDetailsResult.getProductDetailsList() : null;
                if (productDetailsList == null) {
                    productDetailsList = EmptyList.f71733a;
                }
                this.productDetailsList = productDetailsList;
                productDetailsList.size();
                return Unit.f71706a;
            }
            c27941.label = 1;
            objQueryProductDetails = BillingClientKotlinKt.queryProductDetails(billingClient, queryProductDetailsParamsBuild, c27941);
            if (objQueryProductDetails == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objQueryProductDetails);
        }
        productDetailsResult = (ProductDetailsResult) objQueryProductDetails;
        if (productDetailsResult != null) {
        }
        if (productDetailsList == null) {
        }
        this.productDetailsList = productDetailsList;
        productDetailsList.size();
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object recoverPendingPurchases(Continuation<? super Unit> continuation) {
        QueryPurchasesParams queryPurchasesParamsBuild = QueryPurchasesParams.newBuilder().setProductType("subs").build();
        Intrinsics.f(queryPurchasesParamsBuild, "build(...)");
        BillingClient billingClient = this.billingClient;
        if (billingClient != null) {
            billingClient.queryPurchasesAsync(queryPurchasesParamsBuild, new a(this));
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void recoverPendingPurchases$lambda$12(BillingManager billingManager, BillingResult billingResult, List purchases) {
        Intrinsics.g(billingResult, "billingResult");
        Intrinsics.g(purchases, "purchases");
        if (billingResult.getResponseCode() == 0) {
            ArrayList arrayList = new ArrayList();
            for (Object obj : purchases) {
                Purchase purchase = (Purchase) obj;
                if (purchase.getPurchaseState() == 1 && !purchase.isAcknowledged()) {
                    arrayList.add(obj);
                }
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                t70.m0.t(billingManager.scope, null, null, new BillingManager$recoverPendingPurchases$2$2(billingManager, (Purchase) it.next(), null), 3);
            }
        }
    }

    public final void destroy() {
        k0.c(this.scope, null);
        BillingClient billingClient = this.billingClient;
        if (billingClient != null) {
            billingClient.endConnection();
        }
    }

    @NotNull
    public final List<BillingProduct> getAvailablePlans() {
        return this.products;
    }

    @Nullable
    public final String getFormattedPrice(@NotNull String plan, @NotNull String period) {
        Object next;
        Object next2;
        Object next3;
        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails;
        Object next4;
        ProductDetails.PricingPhases pricingPhases;
        List<ProductDetails.PricingPhase> pricingPhaseList;
        ProductDetails.PricingPhase pricingPhase;
        Intrinsics.g(plan, "plan");
        Intrinsics.g(period, "period");
        Iterator<T> it = this.products.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((BillingProduct) next).getPlan(), plan)) {
                break;
            }
        }
        BillingProduct billingProduct = (BillingProduct) next;
        if (billingProduct == null) {
            return null;
        }
        Iterator<T> it2 = billingProduct.getBasePlans().iterator();
        while (true) {
            if (!it2.hasNext()) {
                next2 = null;
                break;
            }
            next2 = it2.next();
            if (Intrinsics.b(((BasePlan) next2).getPeriod(), period)) {
                break;
            }
        }
        BasePlan basePlan = (BasePlan) next2;
        if (basePlan == null) {
            return null;
        }
        Iterator<T> it3 = this.productDetailsList.iterator();
        while (true) {
            if (!it3.hasNext()) {
                next3 = null;
                break;
            }
            next3 = it3.next();
            if (Intrinsics.b(((ProductDetails) next3).getProductId(), billingProduct.getProductId())) {
                break;
            }
        }
        ProductDetails productDetails = (ProductDetails) next3;
        if (productDetails != null && (subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails()) != null) {
            Iterator<T> it4 = subscriptionOfferDetails.iterator();
            while (true) {
                if (!it4.hasNext()) {
                    next4 = null;
                    break;
                }
                next4 = it4.next();
                if (Intrinsics.b(((ProductDetails.SubscriptionOfferDetails) next4).getBasePlanId(), basePlan.getBasePlanId())) {
                    break;
                }
            }
            ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) next4;
            if (subscriptionOfferDetails2 != null && (pricingPhases = subscriptionOfferDetails2.getPricingPhases()) != null && (pricingPhaseList = pricingPhases.getPricingPhaseList()) != null && (pricingPhase = (ProductDetails.PricingPhase) g.Y0(pricingPhaseList)) != null) {
                return pricingPhase.getFormattedPrice();
            }
        }
        return null;
    }

    @Nullable
    public final Function1<String, Unit> getOnFallbackUpgrade() {
        return this.onFallbackUpgrade;
    }

    @Nullable
    public final Function2<String, String, Unit> getOnSubscriptionChanged() {
        return this.onSubscriptionChanged;
    }

    public final void initialize() {
        BillingClient billingClientBuild = BillingClient.newBuilder(this.context).setListener(this.purchasesUpdatedListener).enablePendingPurchases(PendingPurchasesParams.newBuilder().enableOneTimeProducts().enablePrepaidPlans().build()).build();
        this.billingClient = billingClientBuild;
        if (billingClientBuild != null) {
            billingClientBuild.startConnection(this.connectionListener);
        }
    }

    @NotNull
    /* renamed from: isAvailable, reason: from getter */
    public final j0 getIsAvailable() {
        return this.isAvailable;
    }

    public final void launchPurchase(@NotNull Activity activity, @NotNull String plan, @NotNull String period) {
        Object next;
        BasePlan basePlan;
        Object next2;
        Object next3;
        List<BasePlan> basePlans;
        Object next4;
        Intrinsics.g(activity, "activity");
        Intrinsics.g(plan, "plan");
        Intrinsics.g(period, "period");
        if (!Intrinsics.b(this._isAvailable.d(), Boolean.TRUE)) {
            strQ = fo.d.j() ? c0.q(new StringBuilder(), fo.d.c().f55438c, "pricing") : null;
            Function1<? super String, Unit> function1 = this.onFallbackUpgrade;
            if (function1 != null) {
                function1.invoke(strQ);
                return;
            }
            return;
        }
        Iterator<T> it = this.products.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            } else {
                next = it.next();
                if (Intrinsics.b(((BillingProduct) next).getPlan(), plan)) {
                    break;
                }
            }
        }
        BillingProduct billingProduct = (BillingProduct) next;
        if (billingProduct == null || (basePlans = billingProduct.getBasePlans()) == null) {
            basePlan = null;
        } else {
            Iterator<T> it2 = basePlans.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next4 = null;
                    break;
                } else {
                    next4 = it2.next();
                    if (Intrinsics.b(((BasePlan) next4).getPeriod(), period)) {
                        break;
                    }
                }
            }
            basePlan = (BasePlan) next4;
        }
        if (billingProduct == null || basePlan == null) {
            Log.w(TAG, c0.n("No product/base plan for plan=", plan, " period=", period, ", falling back to URL"));
            strQ = fo.d.j() ? c0.q(new StringBuilder(), fo.d.c().f55438c, "pricing") : null;
            Function1<? super String, Unit> function12 = this.onFallbackUpgrade;
            if (function12 != null) {
                function12.invoke(strQ);
                return;
            }
            return;
        }
        Iterator<T> it3 = this.productDetailsList.iterator();
        while (true) {
            if (!it3.hasNext()) {
                next2 = null;
                break;
            } else {
                next2 = it3.next();
                if (Intrinsics.b(((ProductDetails) next2).getProductId(), billingProduct.getProductId())) {
                    break;
                }
            }
        }
        ProductDetails productDetails = (ProductDetails) next2;
        if (productDetails == null) {
            Log.w(TAG, "No ProductDetails for " + billingProduct.getProductId() + ", falling back to URL");
            strQ = fo.d.j() ? c0.q(new StringBuilder(), fo.d.c().f55438c, "pricing") : null;
            Function1<? super String, Unit> function13 = this.onFallbackUpgrade;
            if (function13 != null) {
                function13.invoke(strQ);
                return;
            }
            return;
        }
        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails();
        if (subscriptionOfferDetails != null) {
            Iterator<T> it4 = subscriptionOfferDetails.iterator();
            while (true) {
                if (!it4.hasNext()) {
                    next3 = null;
                    break;
                } else {
                    next3 = it4.next();
                    if (Intrinsics.b(((ProductDetails.SubscriptionOfferDetails) next3).getBasePlanId(), basePlan.getBasePlanId())) {
                        break;
                    }
                }
            }
            ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) next3;
            if (subscriptionOfferDetails2 != null) {
                strQ = subscriptionOfferDetails2.getOfferToken();
            }
        }
        this.pendingBasePlanId = basePlan.getBasePlanId();
        BillingFlowParams.Builder builderNewBuilder = BillingFlowParams.newBuilder();
        BillingFlowParams.ProductDetailsParams.Builder productDetails2 = BillingFlowParams.ProductDetailsParams.newBuilder().setProductDetails(productDetails);
        if (strQ != null) {
            productDetails2.setOfferToken(strQ);
        }
        BillingFlowParams billingFlowParamsBuild = builderNewBuilder.setProductDetailsParamsList(ul.b.P(productDetails2.build())).build();
        Intrinsics.f(billingFlowParamsBuild, "build(...)");
        BillingClient billingClient = this.billingClient;
        if (billingClient != null) {
            billingClient.launchBillingFlow(activity, billingFlowParamsBuild);
        }
    }

    public final void setOnFallbackUpgrade(@Nullable Function1<? super String, Unit> function1) {
        this.onFallbackUpgrade = function1;
    }

    public final void setOnSubscriptionChanged(@Nullable Function2<? super String, ? super String, Unit> function2) {
        this.onSubscriptionChanged = function2;
    }
}
