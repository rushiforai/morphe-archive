package com.stripe.android.link;

import android.os.Parcelable;
import com.stripe.android.link.LinkPaymentDetails;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.PaymentMethodCreateParams;
import e0.z1;
import fs.h0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class f0 implements es.n {

    /* renamed from: a, reason: collision with root package name */
    public final bu.e f42977a;

    /* renamed from: b, reason: collision with root package name */
    public final i2 f42978b;

    /* renamed from: c, reason: collision with root package name */
    public final uw.c f42979c;

    public f0(bu.e linkComponentFactory) {
        Intrinsics.g(linkComponentFactory, "linkComponentFactory");
        this.f42977a = linkComponentFactory;
        i2 i2VarC = u1.c(null);
        this.f42978b = i2VarC;
        this.f42979c = ps.v.u(ps.v.r(i2VarC, new z1(27)), new z1(28));
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x007b, code lost:
    
        if (r7 == r1) goto L28;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v9, types: [fs.h0] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(LinkConfiguration linkConfiguration, PaymentMethodCreateParams paymentMethodCreateParams, ContinuationImpl continuationImpl) {
        es.c0 c0Var;
        fs.y yVar;
        Object objC;
        Object objR;
        Parcelable parcelable;
        if (continuationImpl instanceof es.c0) {
            c0Var = (es.c0) continuationImpl;
            int i5 = c0Var.f52930x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.f52930x = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new es.c0(this, continuationImpl);
            }
        }
        Object obj = c0Var.f52928v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var.f52930x;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                h0 h0VarA = b(linkConfiguration).a();
                c0Var.f52926t = linkConfiguration;
                c0Var.f52927u = h0VarA;
                c0Var.f52930x = 1;
                yVar = (fs.y) h0VarA;
                objC = yVar.c(paymentMethodCreateParams, c0Var);
                if (objC != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objR = ((Result) obj).f71688a;
                ResultKt.b(objR);
                parcelable = (LinkPaymentDetails) objR;
                int i12 = Result.f71687b;
                return parcelable;
            }
            ?? r72 = c0Var.f52927u;
            LinkConfiguration linkConfiguration2 = c0Var.f52926t;
            ResultKt.b(obj);
            Object obj2 = ((Result) obj).f71688a;
            yVar = r72;
            linkConfiguration = linkConfiguration2;
            objC = obj2;
            int i13 = Result.f71687b;
            if (objC instanceof Result.Failure) {
                return objC;
            }
            LinkPaymentDetails.New r82 = (LinkPaymentDetails.New) objC;
            parcelable = r82;
            if (linkConfiguration.f42902h) {
                c0Var.f52926t = null;
                c0Var.f52927u = null;
                c0Var.f52930x = 2;
                objR = yVar.r(r82, c0Var);
            }
            int i122 = Result.f71687b;
            return parcelable;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    public final bu.f b(LinkConfiguration linkConfiguration) {
        bu.f fVar;
        LinkConfiguration linkConfiguration2;
        i2 i2Var = this.f42978b;
        bu.f fVar2 = (bu.f) i2Var.getValue();
        if (fVar2 != null) {
            switch (fVar2.f18530a) {
                case 0:
                    linkConfiguration2 = fVar2.f18531b;
                    break;
                case 1:
                    linkConfiguration2 = fVar2.f18531b;
                    break;
                default:
                    linkConfiguration2 = fVar2.f18531b;
                    break;
            }
            if (!Intrinsics.b(linkConfiguration2, linkConfiguration)) {
                fVar2 = null;
            }
            if (fVar2 != null) {
                return fVar2;
            }
        }
        bu.e eVar = this.f42977a;
        switch (eVar.f18528a) {
            case 0:
                linkConfiguration.getClass();
                fVar = new bu.f((bu.b) eVar.f18529b, linkConfiguration);
                break;
            case 1:
                linkConfiguration.getClass();
                fVar = new bu.f((vu.m) eVar.f18529b, linkConfiguration);
                break;
            default:
                linkConfiguration.getClass();
                fVar = new bu.f((vu.p) eVar.f18529b, linkConfiguration);
                break;
        }
        i2Var.getClass();
        i2Var.k(null, fVar);
        return fVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(LinkConfiguration linkConfiguration, ContinuationImpl continuationImpl) {
        es.d0 d0Var;
        if (continuationImpl instanceof es.d0) {
            d0Var = (es.d0) continuationImpl;
            int i5 = d0Var.f52935v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d0Var.f52935v = i5 - Integer.MIN_VALUE;
            } else {
                d0Var = new es.d0(this, continuationImpl);
            }
        }
        Object obj = d0Var.f52933t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d0Var.f52935v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        h0 h0VarA = b(linkConfiguration).a();
        d0Var.f52935v = 1;
        Object objI = ((fs.y) h0VarA).i(d0Var);
        return objI == coroutineSingletons ? coroutineSingletons : objI;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(LinkConfiguration linkConfiguration, UserInput userInput, ContinuationImpl continuationImpl) {
        es.e0 e0Var;
        Object objT;
        if (continuationImpl instanceof es.e0) {
            e0Var = (es.e0) continuationImpl;
            int i5 = e0Var.f52943v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e0Var.f52943v = i5 - Integer.MIN_VALUE;
            } else {
                e0Var = new es.e0(this, continuationImpl);
            }
        }
        Object obj = e0Var.f52941t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e0Var.f52943v;
        if (i11 == 0) {
            ResultKt.b(obj);
            h0 h0VarA = b(linkConfiguration).a();
            e0Var.f52943v = 1;
            objT = ((fs.y) h0VarA).t(userInput, e0Var);
            if (objT == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objT = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        if (objT instanceof Result.Failure) {
            return objT;
        }
        return Boolean.TRUE;
    }
}
