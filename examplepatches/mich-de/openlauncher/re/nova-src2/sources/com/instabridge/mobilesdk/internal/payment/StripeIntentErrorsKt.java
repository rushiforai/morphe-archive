package com.instabridge.mobilesdk.internal.payment;

import android.content.Context;
import com.instabridge.mobilesdk.internal.analytics.IntentError;
import com.instabridge.mobilesdk.internal.data.api.dto.PayIntentResponse;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.f2;
import com.stripe.android.model.s4;
import dq.s;
import dq.x;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a(\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0080@¢\u0006\u0002\u0010\b¨\u0006\t"}, d2 = {"lastAttemptError", "Lcom/instabridge/mobilesdk/internal/analytics/IntentError;", "context", "Landroid/content/Context;", "publishableKey", b.f42142b, "intent", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;", "(Landroid/content/Context;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class StripeIntentErrorsKt {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.payment.StripeIntentErrorsKt", f = "StripeIntentErrors.kt", l = {28, 32}, m = "lastAttemptError")
    /* renamed from: com.instabridge.mobilesdk.internal.payment.StripeIntentErrorsKt$lastAttemptError$1, reason: invalid class name */
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
            return StripeIntentErrorsKt.lastAttemptError(null, null, null, this);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x004d, code lost:
    
        if (r9 == r1) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0074, code lost:
    
        if (r9 == r1) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object lastAttemptError(@NotNull Context context, @NotNull String str, @NotNull PayIntentResponse payIntentResponse, @NotNull Continuation<? super IntentError> continuation) throws StripeException {
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
        Object objB = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(objB);
            s sVar = new s(context, str);
            String paymentIntentClientSecret = payIntentResponse.getPaymentIntentClientSecret();
            if (paymentIntentClientSecret != null) {
                anonymousClass1.label = 1;
                objB = x.a(sVar, paymentIntentClientSecret, null, EmptyList.f71733a, anonymousClass1);
            } else {
                String setupIntentClientSecret = payIntentResponse.getSetupIntentClientSecret();
                if (setupIntentClientSecret != null) {
                    anonymousClass1.label = 2;
                    objB = x.b(sVar, setupIntentClientSecret, null, EmptyList.f71733a, anonymousClass1);
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objB);
            PaymentIntent.Error error = ((PaymentIntent) objB).f43549s;
            if (error != null) {
                String str2 = error.f43557b;
                String str3 = error.f43558c;
                f2 f2Var = error.f43563h;
                return new IntentError(str2, str3, f2Var != null ? f2Var.f44035a : null);
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            SetupIntent.Error error2 = ((SetupIntent) objB).f43775m;
            if (error2 != null) {
                String str4 = error2.f43779a;
                String str5 = error2.f43780b;
                s4 s4Var = error2.f43785g;
                return new IntentError(str4, str5, s4Var != null ? s4Var.f44057a : null);
            }
        }
        return null;
    }
}
