package fs;

import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkEventException;
import com.stripe.android.model.ConsumerSessionLookup;
import com.stripe.android.model.ConsumerSessionSignup;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.attestation.AttestationError;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f0 implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final js.a f55766a;

    /* renamed from: b, reason: collision with root package name */
    public final ms.z f55767b;

    /* renamed from: c, reason: collision with root package name */
    public final xw.c f55768c;

    /* renamed from: d, reason: collision with root package name */
    public final iu.f f55769d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkConfiguration f55770e;

    /* renamed from: f, reason: collision with root package name */
    public final String f55771f;

    public f0(js.a linkGate, ms.z linkRepository, xw.c integrityRequestManager, iu.f errorReporter, LinkConfiguration config, String applicationId) {
        Intrinsics.g(linkGate, "linkGate");
        Intrinsics.g(linkRepository, "linkRepository");
        Intrinsics.g(integrityRequestManager, "integrityRequestManager");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(config, "config");
        Intrinsics.g(applicationId, "applicationId");
        this.f55766a = linkGate;
        this.f55767b = linkRepository;
        this.f55768c = integrityRequestManager;
        this.f55769d = errorReporter;
        this.f55770e = config;
        this.f55771f = applicationId;
    }

    public static ft.n a(rs.b0 b0Var) {
        switch (b0Var.ordinal()) {
            case 0:
                return ft.n.f55970b;
            case 1:
                return ft.n.f55971c;
            case 2:
                return ft.n.f55972d;
            case 3:
                return ft.n.f55973e;
            case 4:
                return ft.n.f55974f;
            case 5:
                return ft.n.f55975g;
            case 6:
                return ft.n.f55976h;
            case 7:
                return ft.n.f55977i;
            case 8:
                return ft.n.f55978j;
            case 9:
                return ft.n.f55979k;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, ft.x xVar, String str2, String str3, String str4, List list, ContinuationImpl continuationImpl) {
        a0 a0Var;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.f55729v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.f55729v = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(this, continuationImpl);
            }
        }
        a0 a0Var2 = a0Var;
        Object obj = a0Var2.f55727t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = a0Var2.f55729v;
        if (i11 != 0) {
            if (i11 == 1) {
                ResultKt.b(obj);
                return ((Result) obj).f71688a;
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        boolean z11 = (str == null || xVar == null) ? false : true;
        boolean z12 = str2 != null;
        if (!z11 && !z12) {
            int i12 = Result.f71687b;
            return ResultKt.a(new IllegalArgumentException("Either email+emailSource, linkAuthIntentId, or linkAuthTokenClientSecret must be provided"));
        }
        if (this.f55766a.a()) {
            a0Var2.f55729v = 1;
            Object objC = c(str, xVar, str2, str3, str4, list, a0Var2);
            if (objC != obj2) {
                return objC;
            }
        } else {
            a0Var2.f55729v = 2;
            Object objL = ((ms.x) this.f55767b).l(str, str2, str4, str3, list, a0Var2);
            if (objL != obj2) {
                return objL;
            }
        }
        return obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, ft.x xVar, String str2, String str3, String str4, List list, ContinuationImpl continuationImpl) {
        b0 b0Var;
        f0 f0Var;
        String str5;
        String str6;
        Object objC;
        f0 f0Var2;
        String str7;
        List list2;
        ft.x xVar2;
        String str8;
        f0 f0Var3;
        String str9;
        Object objN;
        Object objA;
        Throwable thA;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.D;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.D = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(this, continuationImpl);
            }
        }
        b0 b0Var2 = b0Var;
        Object obj = b0Var2.B;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var2.D;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                int i12 = Result.f71687b;
                xw.c cVar = this.f55768c;
                b0Var2.f55733t = this;
                b0Var2.f55734u = str;
                b0Var2.f55735v = xVar;
                str5 = str2;
                b0Var2.f55736w = str5;
                b0Var2.f55737x = str3;
                str6 = str4;
                b0Var2.f55738y = str6;
                b0Var2.f55739z = list;
                b0Var2.A = this;
                b0Var2.D = 1;
                objC = ((xw.g) cVar).c(b0Var2);
                if (objC != coroutineSingletons) {
                    f0Var2 = this;
                    str7 = str;
                    list2 = list;
                    xVar2 = xVar;
                    str8 = str3;
                    f0Var3 = f0Var2;
                    ResultKt.b(objC);
                    String str10 = (String) objC;
                    ms.z zVar = f0Var3.f55767b;
                    String str11 = f0Var3.f55771f;
                    b0Var2.f55733t = f0Var2;
                    b0Var2.f55734u = str7;
                    b0Var2.f55735v = null;
                    b0Var2.f55736w = null;
                    b0Var2.f55737x = null;
                    b0Var2.f55738y = null;
                    b0Var2.f55739z = null;
                    b0Var2.A = null;
                    b0Var2.D = 2;
                    str9 = str7;
                    objN = ((ms.x) zVar).n(str9, xVar2, str5, str10, str11, str6, str8, list2, null, b0Var2);
                    if (objN != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th2) {
                th = th2;
                f0Var = this;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                return objA;
            }
        }
        if (i11 == 1) {
            f0Var3 = b0Var2.A;
            List list3 = b0Var2.f55739z;
            String str12 = b0Var2.f55738y;
            String str13 = b0Var2.f55737x;
            String str14 = b0Var2.f55736w;
            ft.x xVar3 = b0Var2.f55735v;
            str7 = b0Var2.f55734u;
            f0 f0Var4 = b0Var2.f55733t;
            try {
                ResultKt.b(obj);
                objC = ((Result) obj).f71688a;
                str6 = str12;
                xVar2 = xVar3;
                list2 = list3;
                f0Var2 = f0Var4;
                str8 = str13;
                str5 = str14;
                try {
                    ResultKt.b(objC);
                    String str102 = (String) objC;
                    ms.z zVar2 = f0Var3.f55767b;
                    String str112 = f0Var3.f55771f;
                    b0Var2.f55733t = f0Var2;
                    b0Var2.f55734u = str7;
                    b0Var2.f55735v = null;
                    b0Var2.f55736w = null;
                    b0Var2.f55737x = null;
                    b0Var2.f55738y = null;
                    b0Var2.f55739z = null;
                    b0Var2.A = null;
                    b0Var2.D = 2;
                    try {
                        str9 = str7;
                        try {
                            objN = ((ms.x) zVar2).n(str9, xVar2, str5, str102, str112, str6, str8, list2, null, b0Var2);
                            if (objN != coroutineSingletons) {
                                str = str9;
                                f0Var = f0Var2;
                                ResultKt.b(objN);
                                objA = (ConsumerSessionLookup) objN;
                                int i14 = Result.f71687b;
                            }
                            return coroutineSingletons;
                        } catch (Throwable th3) {
                            th = th3;
                            str = str9;
                            f0Var = f0Var2;
                            int i132 = Result.f71687b;
                            objA = ResultKt.a(th);
                            thA = Result.a(objA);
                            if (thA != null) {
                            }
                            return objA;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        str9 = str7;
                    }
                } catch (Throwable th5) {
                    th = th5;
                    str9 = str7;
                }
            } catch (Throwable th6) {
                th = th6;
                str = str7;
                f0Var = f0Var4;
                int i1322 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                return objA;
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = b0Var2.f55734u;
            f0Var = b0Var2.f55733t;
            try {
                ResultKt.b(obj);
                objN = ((Result) obj).f71688a;
                ResultKt.b(objN);
                objA = (ConsumerSessionLookup) objN;
                int i142 = Result.f71687b;
            } catch (Throwable th7) {
                th = th7;
                int i13222 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                return objA;
            }
        }
        thA = Result.a(objA);
        if (thA != null) {
            f0Var.f(str != null ? "lookup" : "lookupByAuthIntent", thA);
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00b7 A[Catch: all -> 0x00f0, TryCatch #0 {all -> 0x00f0, blocks: (B:30:0x0099, B:32:0x00b7, B:34:0x00bd), top: B:51:0x0099 }] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(String str, String str2, String str3, String str4, String str5, rs.b0 b0Var, ContinuationImpl continuationImpl) {
        c0 c0Var;
        f0 f0Var;
        String str6;
        String str7;
        String str8;
        String str9;
        rs.b0 b0Var2;
        Object objC;
        f0 f0Var2;
        String str10;
        f0 f0Var3;
        Object objO;
        Object objA;
        Throwable thA;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i5 = c0Var.D;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.D = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(this, continuationImpl);
            }
        }
        c0 c0Var2 = c0Var;
        Object obj = c0Var2.B;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var2.D;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                int i12 = Result.f71687b;
                xw.c cVar = this.f55768c;
                c0Var2.f55744t = this;
                c0Var2.f55745u = str;
                str6 = str2;
                c0Var2.f55746v = str6;
                str7 = str3;
                c0Var2.f55747w = str7;
                str8 = str4;
                c0Var2.f55748x = str8;
                str9 = str5;
                c0Var2.f55749y = str9;
                b0Var2 = b0Var;
                c0Var2.f55750z = b0Var2;
                c0Var2.A = this;
                c0Var2.D = 1;
                objC = ((xw.g) cVar).c(c0Var2);
                if (objC != coroutineSingletons) {
                    f0Var2 = this;
                    str10 = str;
                    f0Var3 = f0Var2;
                    ResultKt.b(objC);
                    String str11 = (String) objC;
                    ms.z zVar = f0Var3.f55767b;
                    LinkConfiguration linkConfiguration = f0Var3.f55770e;
                    ft.n nVarA = a(b0Var2);
                    String str12 = f0Var3.f55771f;
                    StripeIntent stripeIntent = linkConfiguration.f42895a;
                    Intrinsics.g(stripeIntent, "<this>");
                    if (!(stripeIntent instanceof PaymentIntent)) {
                    }
                    String strO = ps.e0.o(linkConfiguration.f42895a);
                    c0Var2.f55744t = f0Var2;
                    c0Var2.f55745u = null;
                    c0Var2.f55746v = null;
                    c0Var2.f55747w = null;
                    c0Var2.f55748x = null;
                    c0Var2.f55749y = null;
                    c0Var2.f55750z = null;
                    c0Var2.A = null;
                    c0Var2.D = 2;
                    objO = ((ms.x) zVar).o(str9, str10, str6, str7, str8, nVarA, l, strO, str11, str12, c0Var2);
                    if (objO != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th2) {
                th = th2;
                f0Var = this;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                return objA;
            }
        }
        if (i11 == 1) {
            f0Var3 = c0Var2.A;
            rs.b0 b0Var3 = c0Var2.f55750z;
            String str13 = c0Var2.f55749y;
            String str14 = c0Var2.f55748x;
            String str15 = c0Var2.f55747w;
            String str16 = c0Var2.f55746v;
            String str17 = c0Var2.f55745u;
            f0 f0Var4 = c0Var2.f55744t;
            try {
                ResultKt.b(obj);
                objC = ((Result) obj).f71688a;
                b0Var2 = b0Var3;
                str10 = str17;
                str9 = str13;
                str6 = str16;
                str8 = str14;
                str7 = str15;
                f0Var2 = f0Var4;
                try {
                    ResultKt.b(objC);
                    String str112 = (String) objC;
                    ms.z zVar2 = f0Var3.f55767b;
                    LinkConfiguration linkConfiguration2 = f0Var3.f55770e;
                    ft.n nVarA2 = a(b0Var2);
                    String str122 = f0Var3.f55771f;
                    StripeIntent stripeIntent2 = linkConfiguration2.f42895a;
                    Intrinsics.g(stripeIntent2, "<this>");
                    Long l9 = !(stripeIntent2 instanceof PaymentIntent) ? ((PaymentIntent) stripeIntent2).f43535c : null;
                    String strO2 = ps.e0.o(linkConfiguration2.f42895a);
                    c0Var2.f55744t = f0Var2;
                    c0Var2.f55745u = null;
                    c0Var2.f55746v = null;
                    c0Var2.f55747w = null;
                    c0Var2.f55748x = null;
                    c0Var2.f55749y = null;
                    c0Var2.f55750z = null;
                    c0Var2.A = null;
                    c0Var2.D = 2;
                    objO = ((ms.x) zVar2).o(str9, str10, str6, str7, str8, nVarA2, l9, strO2, str112, str122, c0Var2);
                    if (objO != coroutineSingletons) {
                        f0Var = f0Var2;
                        ResultKt.b(objO);
                        objA = (ConsumerSessionSignup) objO;
                        int i14 = Result.f71687b;
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    f0Var = f0Var2;
                    int i132 = Result.f71687b;
                    objA = ResultKt.a(th);
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    return objA;
                }
            } catch (Throwable th4) {
                th = th4;
                f0Var = f0Var4;
                int i1322 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                return objA;
            }
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        f0Var = c0Var2.f55744t;
        try {
            ResultKt.b(obj);
            objO = ((Result) obj).f71688a;
            ResultKt.b(objO);
            objA = (ConsumerSessionSignup) objO;
            int i142 = Result.f71687b;
        } catch (Throwable th5) {
            th = th5;
            int i13222 = Result.f71687b;
            objA = ResultKt.a(th);
            thA = Result.a(objA);
            if (thA != null) {
            }
            return objA;
        }
        thA = Result.a(objA);
        if (thA != null) {
            f0Var.f("signup", thA);
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(String str, List list, ContinuationImpl continuationImpl) {
        d0 d0Var;
        if (continuationImpl instanceof d0) {
            d0Var = (d0) continuationImpl;
            int i5 = d0Var.f55756v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d0Var.f55756v = i5 - Integer.MIN_VALUE;
            } else {
                d0Var = new d0(this, continuationImpl);
            }
        }
        Object obj = d0Var.f55754t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d0Var.f55756v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        d0Var.f55756v = 1;
        Object objQ = ((ms.x) this.f55767b).q(this.f55771f, str, list, d0Var);
        return objQ == coroutineSingletons ? coroutineSingletons : objQ;
    }

    public final void f(String str, Throwable th2) {
        iu.c cVar;
        if (vh.a.C(th2)) {
            cVar = iu.c.n;
        } else if (!(th2 instanceof AttestationError)) {
            return;
        } else {
            cVar = iu.c.f68062m;
        }
        this.f55769d.a(cVar, new LinkEventException(th2), a80.m.n("operation", str));
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(String str, String str2, String str3, String str4, String str5, rs.b0 b0Var, ContinuationImpl continuationImpl) {
        e0 e0Var;
        if (continuationImpl instanceof e0) {
            e0Var = (e0) continuationImpl;
            int i5 = e0Var.f55762v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e0Var.f55762v = i5 - Integer.MIN_VALUE;
            } else {
                e0Var = new e0(this, continuationImpl);
            }
        }
        e0 e0Var2 = e0Var;
        Object obj = e0Var2.f55760t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = e0Var2.f55762v;
        if (i11 != 0) {
            if (i11 != 1 && i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        if (this.f55766a.a()) {
            e0Var2.f55762v = 1;
            Object objD = d(str, str2, str3, str4, str5, b0Var, e0Var2);
            if (objD != obj2) {
                return objD;
            }
        } else {
            ft.n nVarA = a(b0Var);
            e0Var2.f55762v = 2;
            Object objD2 = ((ms.x) this.f55767b).d(str, str2, str3, str4, str5, nVarA, e0Var2);
            if (objD2 != obj2) {
                return objD2;
            }
        }
        return obj2;
    }
}
