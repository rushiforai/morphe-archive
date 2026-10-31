package com.instabridge.mobilesdk.internal.payment;

import a5.i;
import android.app.ActivityOptions;
import com.instabridge.mobilesdk.internal.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.stripe.android.paymentsheet.PaymentSheet$Configuration;
import com.stripe.android.paymentsheet.PaymentSheetResult;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract;
import com.stripe.android.paymentsheet.addresselement.AddressLauncher$Configuration;
import com.stripe.android.paymentsheet.addresselement.AddressLauncherResult;
import com.stripe.android.paymentsheet.addresselement.m;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import g.o;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import n4.c;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ou.a1;
import t70.m0;
import t70.r;
import t70.s;
import w70.l1;
import w70.u1;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0001\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB\u0019\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\"\u0010\f\u001a\u0004\u0018\u00010\u000b2\u000e\b\u0004\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\bH\u0082H¢\u0006\u0004\b\f\u0010\rJ\"\u0010\u0012\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0086@¢\u0006\u0004\b\u0012\u0010\u0013J\"\u0010\u0014\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0086@¢\u0006\u0004\b\u0014\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u000bH\u0086@¢\u0006\u0004\b\u0015\u0010\u0016J\"\u0010\u001a\u001a\u0004\u0018\u00010\u00192\u0006\u0010\u0017\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0018H\u0086@¢\u0006\u0004\b\u001a\u0010\u001bR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u001cR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001d¨\u0006\u001f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/payment/StripePaymentSheetHost;", b.f42142b, "Lou/a1;", "paymentSheet", "Lcom/stripe/android/paymentsheet/addresselement/m;", "addressLauncher", "<init>", "(Lou/a1;Lcom/stripe/android/paymentsheet/addresselement/m;)V", "Lkotlin/Function0;", b.f42142b, "launchSheet", "Lcom/stripe/android/paymentsheet/PaymentSheetResult;", "present", "(Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", b.f42142b, "clientSecret", "Lcom/stripe/android/paymentsheet/PaymentSheet$Configuration;", "configuration", "presentWithPaymentIntent", "(Ljava/lang/String;Lcom/stripe/android/paymentsheet/PaymentSheet$Configuration;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "presentWithSetupIntent", "awaitPaymentResult", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "publishableKey", "Lcom/stripe/android/paymentsheet/addresselement/AddressLauncher$Configuration;", "Lcom/stripe/android/paymentsheet/addresselement/AddressDetails;", "presentAddress", "(Ljava/lang/String;Lcom/stripe/android/paymentsheet/addresselement/AddressLauncher$Configuration;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lou/a1;", "Lcom/stripe/android/paymentsheet/addresselement/m;", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class StripePaymentSheetHost {

    @Nullable
    private static r addressPending;
    private static volatile boolean awaitingResult;

    @NotNull
    private final m addressLauncher;

    @NotNull
    private final a1 paymentSheet;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @NotNull
    private static final l1 paymentResults = u1.b(1, 1, null, 4);

    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0005\u0010\u0006J\u0015\u0010\n\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\n\u0010\u000bR\u0016\u0010\f\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\f\u0010\rR\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0011R\u001e\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u00128\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0014\u0010\u0015¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/internal/payment/StripePaymentSheetHost$Companion;", b.f42142b, "<init>", "()V", b.f42142b, "isAwaitingResult", "()Z", "Lg/o;", "activity", "Lcom/instabridge/mobilesdk/internal/payment/StripePaymentSheetHost;", "register", "(Lg/o;)Lcom/instabridge/mobilesdk/internal/payment/StripePaymentSheetHost;", "awaitingResult", "Z", "Lw70/l1;", "Lcom/stripe/android/paymentsheet/PaymentSheetResult;", "paymentResults", "Lw70/l1;", "Lt70/r;", "Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult;", "addressPending", "Lt70/r;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void register$lambda$0(PaymentSheetResult result) {
            Intrinsics.g(result, "result");
            StripePaymentSheetHost.paymentResults.c(result);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void register$lambda$1(AddressLauncherResult result) {
            Intrinsics.g(result, "result");
            r rVar = StripePaymentSheetHost.addressPending;
            if (rVar != null) {
                ((s) rVar).X(result);
            }
            StripePaymentSheetHost.addressPending = null;
        }

        public final boolean isAwaitingResult() {
            return StripePaymentSheetHost.awaitingResult;
        }

        @NotNull
        public final StripePaymentSheetHost register(@NotNull o activity) {
            Intrinsics.g(activity, "activity");
            return new StripePaymentSheetHost(new a1(activity, new i(8)), new m(activity, new i(9)), null);
        }

        private Companion() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost", f = "StripePaymentSheetHost.kt", l = {61}, m = "awaitPaymentResult")
    /* renamed from: com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost$awaitPaymentResult$1, reason: invalid class name */
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
            return StripePaymentSheetHost.this.awaitPaymentResult(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost", f = "StripePaymentSheetHost.kt", l = {111}, m = "presentAddress")
    /* renamed from: com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost$presentAddress$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28691 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28691(Continuation<? super C28691> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return StripePaymentSheetHost.this.presentAddress(null, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost", f = "StripePaymentSheetHost.kt", l = {187}, m = "presentWithPaymentIntent")
    /* renamed from: com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost$presentWithPaymentIntent$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28701 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28701(Continuation<? super C28701> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return StripePaymentSheetHost.this.presentWithPaymentIntent(null, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost", f = "StripePaymentSheetHost.kt", l = {187}, m = "presentWithSetupIntent")
    /* renamed from: com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost$presentWithSetupIntent$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28711 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28711(Continuation<? super C28711> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return StripePaymentSheetHost.this.presentWithSetupIntent(null, null, this);
        }
    }

    public /* synthetic */ StripePaymentSheetHost(a1 a1Var, m mVar, DefaultConstructorMarker defaultConstructorMarker) {
        this(a1Var, mVar);
    }

    private final Object present(Function0<Unit> function0, Continuation<? super PaymentSheetResult> continuation) {
        l1 l1Var = paymentResults;
        l1Var.d();
        awaitingResult = true;
        try {
            function0.invoke();
            PaymentSheetResult paymentSheetResult = (PaymentSheetResult) u1.o(l1Var, continuation);
            awaitingResult = false;
            return paymentSheetResult;
        } catch (Throwable th2) {
            awaitingResult = false;
            Logger.INSTANCE.e("Stripe present threw before delivering a result", th2);
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object awaitPaymentResult(@NotNull Continuation<? super PaymentSheetResult> continuation) {
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
        Object objO = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(objO);
            l1 l1Var = paymentResults;
            anonymousClass1.label = 1;
            objO = u1.o(l1Var, anonymousClass1);
            if (objO == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objO);
        }
        PaymentSheetResult paymentSheetResult = (PaymentSheetResult) objO;
        awaitingResult = false;
        return paymentSheetResult;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object presentAddress(@NotNull String publishableKey, @NotNull AddressLauncher$Configuration configuration, @NotNull Continuation<? super AddressDetails> continuation) {
        C28691 c28691;
        if (continuation instanceof C28691) {
            c28691 = (C28691) continuation;
            int i5 = c28691.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28691.label = i5 - Integer.MIN_VALUE;
            } else {
                c28691 = new C28691(continuation);
            }
        }
        Object objL = c28691.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28691.label;
        if (i11 == 0) {
            ResultKt.b(objL);
            addressPending = m0.b();
            m mVar = this.addressLauncher;
            mVar.getClass();
            Intrinsics.g(publishableKey, "publishableKey");
            Intrinsics.g(configuration, "configuration");
            mVar.f44761b.a(new AddressElementActivityContract.Args(publishableKey, configuration), new c(ActivityOptions.makeCustomAnimation(mVar.f44760a.getApplicationContext(), 2130772049, 2130772050)));
            r rVar = addressPending;
            Intrinsics.d(rVar);
            c28691.label = 1;
            objL = rVar.l(c28691);
            if (objL == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objL);
        }
        AddressLauncherResult addressLauncherResult = (AddressLauncherResult) objL;
        if (addressLauncherResult instanceof AddressLauncherResult.Succeeded) {
            return ((AddressLauncherResult.Succeeded) addressLauncherResult).f44705a;
        }
        if (addressLauncherResult instanceof AddressLauncherResult.Canceled) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object presentWithPaymentIntent(@NotNull String paymentIntentClientSecret, @NotNull PaymentSheet$Configuration paymentSheet$Configuration, @NotNull Continuation<? super PaymentSheetResult> continuation) {
        C28701 c28701;
        if (continuation instanceof C28701) {
            c28701 = (C28701) continuation;
            int i5 = c28701.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28701.label = i5 - Integer.MIN_VALUE;
            } else {
                c28701 = new C28701(continuation);
            }
        }
        Object objO = c28701.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28701.label;
        if (i11 == 0) {
            ResultKt.b(objO);
            l1 l1Var = paymentResults;
            l1Var.d();
            awaitingResult = true;
            try {
                a1 a1Var = this.paymentSheet;
                a1Var.getClass();
                Intrinsics.g(paymentIntentClientSecret, "paymentIntentClientSecret");
                a1Var.f80792a.a(new PaymentElementLoader$InitializationMode.PaymentIntent(paymentIntentClientSecret), paymentSheet$Configuration);
                c28701.label = 1;
                objO = u1.o(l1Var, c28701);
                if (objO == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } catch (Throwable th2) {
                awaitingResult = false;
                Logger.INSTANCE.e("Stripe present threw before delivering a result", th2);
                return null;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objO);
        }
        PaymentSheetResult paymentSheetResult = (PaymentSheetResult) objO;
        awaitingResult = false;
        return paymentSheetResult;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object presentWithSetupIntent(@NotNull String setupIntentClientSecret, @NotNull PaymentSheet$Configuration paymentSheet$Configuration, @NotNull Continuation<? super PaymentSheetResult> continuation) {
        C28711 c28711;
        if (continuation instanceof C28711) {
            c28711 = (C28711) continuation;
            int i5 = c28711.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28711.label = i5 - Integer.MIN_VALUE;
            } else {
                c28711 = new C28711(continuation);
            }
        }
        Object objO = c28711.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28711.label;
        if (i11 == 0) {
            ResultKt.b(objO);
            l1 l1Var = paymentResults;
            l1Var.d();
            awaitingResult = true;
            try {
                a1 a1Var = this.paymentSheet;
                a1Var.getClass();
                Intrinsics.g(setupIntentClientSecret, "setupIntentClientSecret");
                a1Var.f80792a.a(new PaymentElementLoader$InitializationMode.SetupIntent(setupIntentClientSecret), paymentSheet$Configuration);
                c28711.label = 1;
                objO = u1.o(l1Var, c28711);
                if (objO == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } catch (Throwable th2) {
                awaitingResult = false;
                Logger.INSTANCE.e("Stripe present threw before delivering a result", th2);
                return null;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objO);
        }
        PaymentSheetResult paymentSheetResult = (PaymentSheetResult) objO;
        awaitingResult = false;
        return paymentSheetResult;
    }

    private StripePaymentSheetHost(a1 a1Var, m mVar) {
        this.paymentSheet = a1Var;
        this.addressLauncher = mVar;
    }
}
