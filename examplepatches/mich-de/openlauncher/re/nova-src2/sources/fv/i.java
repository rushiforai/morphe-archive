package fv;

import com.stripe.android.PaymentConfiguration;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodUpdateParams;
import com.stripe.android.paymentsheet.repositories.DuplicatePaymentMethodDetachFailureException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import jt.c1;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;
import t70.k0;
import t70.m0;

/* loaded from: classes4.dex */
public final class i implements k {

    /* renamed from: a, reason: collision with root package name */
    public final c1 f56120a;

    /* renamed from: b, reason: collision with root package name */
    public final w60.a f56121b;

    /* renamed from: c, reason: collision with root package name */
    public final xq.c f56122c;

    /* renamed from: d, reason: collision with root package name */
    public final iu.f f56123d;

    /* renamed from: e, reason: collision with root package name */
    public final CoroutineContext f56124e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f56125f;

    public i(c1 stripeRepository, w60.a lazyPaymentConfig, xq.c logger, iu.f errorReporter, CoroutineContext workContext, Set productUsageTokens) {
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(lazyPaymentConfig, "lazyPaymentConfig");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(productUsageTokens, "productUsageTokens");
        this.f56120a = stripeRepository;
        this.f56121b = lazyPaymentConfig;
        this.f56122c = logger;
        this.f56123d = errorReporter;
        this.f56124e = workContext;
        this.f56125f = productUsageTokens;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x004e, code lost:
    
        if (r8 == r0) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0051, code lost:
    
        r10 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x007c, code lost:
    
        if (r8 == r0) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x009a, code lost:
    
        if (r10 == r0) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(j jVar, String str, boolean z11, ContinuationImpl continuationImpl) {
        a aVar;
        Object objT;
        Object objU;
        i iVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f56088x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f56088x = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        a aVar2 = aVar;
        Object obj = aVar2.f56086v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f56088x;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!z11) {
                String str2 = jVar.f56128c;
                String str3 = jVar.f56127b;
                w60.a aVar3 = this.f56121b;
                c1 c1Var = this.f56120a;
                if (str2 != null) {
                    ApiRequest$Options apiRequest$Options = new ApiRequest$Options(str3, ((PaymentConfiguration) aVar3.get()).f42441b, 4);
                    aVar2.f56084t = this;
                    aVar2.f56085u = str;
                    aVar2.f56088x = 2;
                    objU = ((z0) c1Var).u(str2, this.f56125f, str, apiRequest$Options, aVar2);
                } else {
                    ApiRequest$Options apiRequest$Options2 = new ApiRequest$Options(str3, ((PaymentConfiguration) aVar3.get()).f42441b, 4);
                    aVar2.f56084t = this;
                    aVar2.f56085u = str;
                    aVar2.f56088x = 3;
                    objT = ((z0) c1Var).t(apiRequest$Options2, str, this.f56125f, aVar2);
                }
                return coroutineSingletons;
            }
            aVar2.f56084t = this;
            aVar2.f56085u = str;
            aVar2.f56088x = 1;
            objU = b(this, jVar, str, aVar2);
            iVar = this;
        } else {
            if (i11 != 1 && i11 != 2 && i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = aVar2.f56085u;
            iVar = aVar2.f56084t;
            ResultKt.b(obj);
            objT = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objT);
        if (thA != null) {
            iVar.f56122c.b("Failed to detach payment method " + str + ".", thA);
        }
        return objT;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x017f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Type inference failed for: r1v12, types: [t70.j0] */
    /* JADX WARN: Type inference failed for: r21v0, types: [fv.i, fv.k] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(i iVar, j jVar, String str, ContinuationImpl continuationImpl) {
        b bVar;
        y70.d dVarA;
        Object objC;
        k kVar;
        String str2;
        Object next;
        String str3;
        List list;
        j jVar2;
        k kVar2;
        j jVar3 = jVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f56095z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f56095z = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object obj = bVar.f56093x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f56095z;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVarA = k0.a(this.f56124e);
            List listP = ul.b.P(PaymentMethod.Type.f43639i);
            bVar.f56089t = iVar;
            bVar.f56090u = jVar3;
            bVar.f56091v = str;
            bVar.f56092w = dVarA;
            bVar.f56095z = 1;
            objC = iVar.c(jVar3, listP, false, bVar);
            if (objC != coroutineSingletons) {
                kVar = iVar;
                str2 = str;
            }
        }
        if (i11 != 1) {
            if (i11 == 2) {
                ResultKt.b(obj);
                return ((Result) obj).f71688a;
            }
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return ((Result) obj).f71688a;
            }
            list = (List) bVar.f56092w;
            str3 = bVar.f56091v;
            jVar2 = bVar.f56090u;
            kVar2 = bVar.f56089t;
            ResultKt.b(obj);
            if (list.isEmpty()) {
                int i12 = Result.f71687b;
                return ResultKt.a(new DuplicatePaymentMethodDetachFailureException(list));
            }
            bVar.f56089t = null;
            bVar.f56090u = null;
            bVar.f56091v = null;
            bVar.f56092w = null;
            bVar.f56095z = 4;
            Object objA = ((i) kVar2).a(jVar2, str3, false, bVar);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        }
        ?? r12 = (j0) bVar.f56092w;
        String str4 = bVar.f56091v;
        j jVar4 = bVar.f56090u;
        k kVar3 = bVar.f56089t;
        ResultKt.b(obj);
        Object obj2 = ((Result) obj).f71688a;
        dVarA = r12;
        str2 = str4;
        jVar3 = jVar4;
        objC = obj2;
        kVar = kVar3;
        Throwable thA = Result.a(objC);
        if (thA != null) {
            return ResultKt.a(thA);
        }
        List list2 = (List) objC;
        Iterator it = list2.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((PaymentMethod) next).f43569a, str2)) {
                break;
            }
        }
        PaymentMethod paymentMethod = (PaymentMethod) next;
        if (paymentMethod == null) {
            bVar.f56089t = null;
            bVar.f56090u = null;
            bVar.f56091v = null;
            bVar.f56092w = null;
            bVar.f56095z = 2;
            Object objA2 = ((i) kVar).a(jVar3, str2, false, bVar);
            if (objA2 != coroutineSingletons) {
                return objA2;
            }
        } else {
            ArrayList arrayList = new ArrayList();
            for (Object obj3 : list2) {
                PaymentMethod paymentMethod2 = (PaymentMethod) obj3;
                if (paymentMethod2.f43573e == PaymentMethod.Type.f43639i) {
                    PaymentMethod.Card card = paymentMethod2.f43576h;
                    String str5 = card != null ? card.f43611f : null;
                    PaymentMethod.Card card2 = paymentMethod.f43576h;
                    if (Intrinsics.b(str5, card2 != null ? card2.f43611f : null) && !Intrinsics.b(paymentMethod2.f43569a, str2)) {
                        arrayList.add(obj3);
                    }
                }
            }
            ArrayList arrayList2 = new ArrayList();
            ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                j jVar5 = jVar3;
                arrayList3.add(m0.e(dVarA, null, new c0.g((PaymentMethod) it2.next(), kVar, jVar5, arrayList2, null, 2), 3));
                jVar3 = jVar5;
            }
            j jVar6 = jVar3;
            bVar.f56089t = kVar;
            bVar.f56090u = jVar6;
            bVar.f56091v = str2;
            bVar.f56092w = arrayList2;
            bVar.f56095z = 3;
            if (m0.f(arrayList3, bVar) != coroutineSingletons) {
                str3 = str2;
                list = arrayList2;
                jVar2 = jVar6;
                kVar2 = kVar;
                if (list.isEmpty()) {
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(j jVar, List list, boolean z11, ContinuationImpl continuationImpl) {
        c cVar;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f56098v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f56098v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object objY = cVar.f56096t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f56098v;
        if (i11 == 0) {
            ResultKt.b(objY);
            e eVar = new e(list, this, jVar, z11, null);
            cVar.f56098v = 1;
            objY = m0.y(this.f56124e, eVar, cVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(j jVar, ContinuationImpl continuationImpl) {
        f fVar;
        Object objN;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f56111v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f56111v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object obj = fVar.f56109t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f56111v;
        if (i11 == 0) {
            ResultKt.b(obj);
            String str = jVar.f56126a;
            ApiRequest$Options apiRequest$Options = new ApiRequest$Options(jVar.f56127b, ((PaymentConfiguration) this.f56121b.get()).f42441b, 4);
            fVar.f56111v = 1;
            objN = ((z0) this.f56120a).N(apiRequest$Options, str, this.f56125f, fVar);
            if (objN == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objN = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        if (objN instanceof Result.Failure) {
            return null;
        }
        return objN;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(j jVar, String str, ContinuationImpl continuationImpl) {
        g gVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f56114v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f56114v = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object obj = gVar.f56112t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f56114v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        String str2 = jVar.f56126a;
        ApiRequest$Options apiRequest$Options = new ApiRequest$Options(jVar.f56127b, ((PaymentConfiguration) this.f56121b.get()).f42441b, 4);
        gVar.f56114v = 1;
        Object objT = ((z0) this.f56120a).T(apiRequest$Options, str2, str, gVar);
        return objT == coroutineSingletons ? coroutineSingletons : objT;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(j jVar, String str, PaymentMethodUpdateParams.Card card, ContinuationImpl continuationImpl) {
        h hVar;
        Object objX;
        i iVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f56119x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f56119x = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f56117v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f56119x;
        if (i11 == 0) {
            ResultKt.b(obj);
            ApiRequest$Options apiRequest$Options = new ApiRequest$Options(jVar.f56127b, ((PaymentConfiguration) this.f56121b.get()).f42441b, 4);
            hVar.f56115t = this;
            hVar.f56116u = str;
            hVar.f56119x = 1;
            objX = ((z0) this.f56120a).X(str, card, apiRequest$Options, hVar);
            if (objX == coroutineSingletons) {
                return coroutineSingletons;
            }
            iVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = hVar.f56116u;
            iVar = hVar.f56115t;
            ResultKt.b(obj);
            objX = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objX);
        if (thA != null) {
            iVar.f56122c.b("Failed to update payment method " + str + ".", thA);
        }
        return objX;
    }
}
