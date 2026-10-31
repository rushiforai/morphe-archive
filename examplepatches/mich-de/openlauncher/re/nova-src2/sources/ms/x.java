package ms;

import android.app.Application;
import bn.p0;
import c0.b1;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConsumerPaymentDetailsUpdateParams;
import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.StripeIntent;
import e00.j3;
import e00.v3;
import ft.d0;
import ft.w0;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import jt.c1;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kw.s3;
import t70.m0;

/* loaded from: classes4.dex */
public final class x implements z {

    /* renamed from: a, reason: collision with root package name */
    public final jt.b f76707a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f76708b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f76709c;

    /* renamed from: d, reason: collision with root package name */
    public final c1 f76710d;

    /* renamed from: e, reason: collision with root package name */
    public final mv.g f76711e;

    /* renamed from: f, reason: collision with root package name */
    public final CoroutineContext f76712f;

    /* renamed from: g, reason: collision with root package name */
    public final Locale f76713g;

    /* renamed from: h, reason: collision with root package name */
    public final iu.f f76714h;

    /* renamed from: i, reason: collision with root package name */
    public final ar.b f76715i;

    public x(Application application, jt.b requestSurface, Function0 publishableKeyProvider, Function0 stripeAccountIdProvider, c1 stripeRepository, mv.g consumersApiService, CoroutineContext workContext, Locale locale, iu.f errorReporter) {
        Intrinsics.g(application, "application");
        Intrinsics.g(requestSurface, "requestSurface");
        Intrinsics.g(publishableKeyProvider, "publishableKeyProvider");
        Intrinsics.g(stripeAccountIdProvider, "stripeAccountIdProvider");
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(consumersApiService, "consumersApiService");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(errorReporter, "errorReporter");
        this.f76707a = requestSurface;
        this.f76708b = publishableKeyProvider;
        this.f76709c = stripeAccountIdProvider;
        this.f76710d = stripeRepository;
        this.f76711e = consumersApiService;
        this.f76712f = workContext;
        this.f76713g = locale;
        this.f76714h = errorReporter;
        ar.b bVarC = e0.c(application, workContext);
        this.f76715i = bVarC;
        bVarC.a();
    }

    public static final Map a(x xVar, ClientAttributionMetadata clientAttributionMetadata) {
        return k2.o("client_attribution_metadata", clientAttributionMetadata.k0());
    }

    public final ApiRequest$Options b() {
        return new ApiRequest$Options((String) this.f76708b.invoke(), (String) this.f76709c.invoke(), 4);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, String str2, Boolean bool, ContinuationImpl continuationImpl) {
        a aVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f76627v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f76627v = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        a aVar2 = aVar;
        Object objA = aVar2.f76625t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f76627v;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                int i12 = Result.f71687b;
                mv.g gVar = this.f76711e;
                String str3 = this.f76707a.f69758a;
                w0[] w0VarArr = w0.f56067a;
                ApiRequest$Options apiRequest$OptionsB = b();
                aVar2.f76627v = 1;
                objA = gVar.a(str2, str, str3, bool, apiRequest$OptionsB, aVar2);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
            }
            if (objA == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            ConsumerSession consumerSession = (ConsumerSession) objA;
            int i13 = Result.f71687b;
            return consumerSession;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(String str, String str2, String str3, String str4, String str5, ft.n nVar, ContinuationImpl continuationImpl) throws Throwable {
        b bVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f76630v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f76630v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        b bVar2 = bVar;
        Object objY = bVar2.f76628t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar2.f76630v;
        if (i11 == 0) {
            ResultKt.b(objY);
            j3 j3Var = new j3(this, str, str2, str3, str4, str5, nVar, (Continuation) null);
            bVar2.f76630v = 1;
            objY = m0.y(this.f76712f, j3Var, bVar2);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(String str, String str2, String str3, ClientAttributionMetadata clientAttributionMetadata, ContinuationImpl continuationImpl) {
        c cVar;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f76633v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f76633v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        c cVar2 = cVar;
        Object objY = cVar2.f76631t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar2.f76633v;
        if (i11 == 0) {
            ResultKt.b(objY);
            d dVar = new d(this, str3, str, str2, clientAttributionMetadata, null);
            cVar2.f76633v = 1;
            objY = m0.y(this.f76712f, dVar, cVar2);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(PaymentMethodCreateParams paymentMethodCreateParams, String str, String str2, ClientAttributionMetadata clientAttributionMetadata, ContinuationImpl continuationImpl) {
        e eVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f76642v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f76642v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        e eVar2 = eVar;
        Object objY = eVar2.f76640t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar2.f76642v;
        if (i11 == 0) {
            ResultKt.b(objY);
            f fVar = new f(clientAttributionMetadata, paymentMethodCreateParams, str2, str, null, this);
            eVar2.f76642v = 1;
            objY = m0.y(this.f76712f, fVar, eVar2);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(String str, StripeIntent stripeIntent, d0 d0Var, ContinuationImpl continuationImpl) {
        g gVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f76651v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f76651v = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        g gVar2 = gVar;
        Object obj = gVar2.f76649t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar2.f76651v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        String f43539g = stripeIntent.getF43539g();
        String str2 = this.f76707a.f69758a;
        ApiRequest$Options apiRequest$OptionsB = b();
        gVar2.f76651v = 1;
        Object objB = this.f76711e.b(str, f43539g, d0Var, str2, apiRequest$OptionsB, gVar2);
        return objB == coroutineSingletons ? coroutineSingletons : objB;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(String str, String str2, ContinuationImpl continuationImpl) {
        h hVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f76654v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f76654v = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f76652t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f76654v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        ApiRequest$Options apiRequest$OptionsB = b();
        hVar.f76654v = 1;
        Object objS = ((z0) this.f76710d).s(apiRequest$OptionsB, str2, str, hVar);
        return objS == coroutineSingletons ? coroutineSingletons : objS;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(Set set, String str, ContinuationImpl continuationImpl) {
        i iVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f76657v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f76657v = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object obj = iVar.f76655t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f76657v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        ApiRequest$Options apiRequest$OptionsB = b();
        iVar.f76657v = 1;
        Object objD = ((z0) this.f76710d).D(apiRequest$OptionsB, str, set, iVar);
        return objD == coroutineSingletons ? coroutineSingletons : objD;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(String str, ContinuationImpl continuationImpl) {
        j jVar;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f76660v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f76660v = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        Object obj = jVar.f76658t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f76660v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        ApiRequest$Options apiRequest$OptionsB = b();
        jVar.f76660v = 1;
        Object objE = ((z0) this.f76710d).E(str, apiRequest$OptionsB, jVar);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(String str, String str2, ContinuationImpl continuationImpl) throws Throwable {
        k kVar;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f76663v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f76663v = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object objY = kVar.f76661t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f76663v;
        if (i11 == 0) {
            ResultKt.b(objY);
            s3 s3Var = new s3(this, str, str2, (Continuation) null, 9);
            kVar.f76663v = 1;
            objY = m0.y(this.f76712f, s3Var, kVar);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object l(String str, String str2, String str3, String str4, List list, ContinuationImpl continuationImpl) throws Throwable {
        l lVar;
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.f76666v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f76666v = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, continuationImpl);
            }
        }
        l lVar2 = lVar;
        Object objY = lVar2.f76664t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar2.f76666v;
        if (i11 == 0) {
            ResultKt.b(objY);
            j3 j3Var = new j3(this, str, str2, str3, list, str4, null);
            lVar2.f76666v = 1;
            objY = m0.y(this.f76712f, j3Var, lVar2);
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
    public final Object m(String str, String str2, ContinuationImpl continuationImpl) throws Throwable {
        m mVar;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f76669v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f76669v = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object objY = mVar.f76667t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f76669v;
        if (i11 == 0) {
            ResultKt.b(objY);
            androidx.room.p pVar = new androidx.room.p(this, str, str2, (Continuation) null, 27);
            mVar.f76669v = 1;
            objY = m0.y(this.f76712f, pVar, mVar);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object n(String str, ft.x xVar, String str2, String str3, String str4, String str5, String str6, List list, String str7, ContinuationImpl continuationImpl) throws Throwable {
        n nVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f76672v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f76672v = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        n nVar2 = nVar;
        Object objY = nVar2.f76670t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar2.f76672v;
        if (i11 == 0) {
            ResultKt.b(objY);
            o oVar = new o(this, str, xVar, str2, str3, str4, list, str5, str6, str7, null);
            nVar2.f76672v = 1;
            objY = m0.y(this.f76712f, oVar, nVar2);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object o(String str, String str2, String str3, String str4, String str5, ft.n nVar, Long l9, String str6, String str7, String str8, ContinuationImpl continuationImpl) throws Throwable {
        p pVar;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i5 = pVar.f76682v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pVar.f76682v = i5 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        p pVar2 = pVar;
        Object objY = pVar2.f76680t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pVar2.f76682v;
        if (i11 == 0) {
            ResultKt.b(objY);
            o oVar = new o(this, str2, str3, str4, str5, str, l9, str6, nVar, str7, str8, null);
            pVar2.f76682v = 1;
            objY = m0.y(this.f76712f, oVar, pVar2);
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
    public final Object p(String str, ContinuationImpl continuationImpl, boolean z11) {
        q qVar;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f76685v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f76685v = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(this, continuationImpl);
            }
        }
        Object objY = qVar.f76683t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar.f76685v;
        if (i11 == 0) {
            ResultKt.b(objY);
            v3 v3Var = new v3(this, str, z11, (Continuation) null);
            qVar.f76685v = 1;
            objY = m0.y(this.f76712f, v3Var, qVar);
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
    public final Object q(String str, String str2, List list, ContinuationImpl continuationImpl) throws Throwable {
        r rVar;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.f76688v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f76688v = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(this, continuationImpl);
            }
        }
        Object objY = rVar.f76686t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f76688v;
        if (i11 == 0) {
            ResultKt.b(objY);
            b1 b1Var = new b1(this, str, str2, list, (Continuation) null, 14);
            rVar.f76688v = 1;
            objY = m0.y(this.f76712f, b1Var, rVar);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object r(PaymentMethodCreateParams paymentMethodCreateParams, String str, String str2, ClientAttributionMetadata clientAttributionMetadata, ContinuationImpl continuationImpl) throws Throwable {
        s sVar;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i5 = sVar.f76691v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f76691v = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(this, continuationImpl);
            }
        }
        s sVar2 = sVar;
        Object objY = sVar2.f76689t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sVar2.f76691v;
        if (i11 == 0) {
            ResultKt.b(objY);
            t tVar = new t(clientAttributionMetadata, paymentMethodCreateParams, str2, str, null, this);
            sVar2.f76691v = 1;
            objY = m0.y(this.f76712f, tVar, sVar2);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object s(String str, String str2, String str3, String str4, String str5, String str6, ClientAttributionMetadata clientAttributionMetadata, ContinuationImpl continuationImpl) throws Throwable {
        u uVar;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f76700v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f76700v = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(this, continuationImpl);
            }
        }
        u uVar2 = uVar;
        Object objY = uVar2.f76698t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar2.f76700v;
        if (i11 == 0) {
            ResultKt.b(objY);
            p0 p0Var = new p0(this, str5, str6, clientAttributionMetadata, str, str2, str3, str4, null, 4);
            uVar2.f76700v = 1;
            objY = m0.y(this.f76712f, p0Var, uVar2);
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

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object t(String str, ContinuationImpl continuationImpl, boolean z11) {
        v vVar;
        if (continuationImpl instanceof v) {
            vVar = (v) continuationImpl;
            int i5 = vVar.f76703v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f76703v = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(this, continuationImpl);
            }
        }
        v vVar2 = vVar;
        Object objK = vVar2.f76701t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vVar2.f76703v;
        try {
            if (i11 == 0) {
                ResultKt.b(objK);
                int i12 = Result.f71687b;
                mv.g gVar = this.f76711e;
                Locale locale = this.f76713g;
                if (locale == null) {
                    locale = Locale.US;
                }
                Locale locale2 = locale;
                Intrinsics.d(locale2);
                String str2 = this.f76707a.f69758a;
                w0[] w0VarArr = w0.f56067a;
                ApiRequest$Options apiRequest$OptionsB = b();
                vVar2.f76703v = 1;
                objK = gVar.k(str, locale2, str2, apiRequest$OptionsB, z11, vVar2);
                if (objK == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objK);
            }
            if (objK == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            ConsumerSession consumerSession = (ConsumerSession) objK;
            int i13 = Result.f71687b;
            return consumerSession;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object u(ConsumerPaymentDetailsUpdateParams consumerPaymentDetailsUpdateParams, String str, ContinuationImpl continuationImpl) {
        w wVar;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f76706v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f76706v = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(this, continuationImpl);
            }
        }
        Object obj = wVar.f76704t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f76706v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        ApiRequest$Options apiRequest$OptionsB = b();
        wVar.f76706v = 1;
        Object objW = ((z0) this.f76710d).W(str, consumerPaymentDetailsUpdateParams, apiRequest$OptionsB, wVar);
        return objW == coroutineSingletons ? coroutineSingletons : objW;
    }
}
