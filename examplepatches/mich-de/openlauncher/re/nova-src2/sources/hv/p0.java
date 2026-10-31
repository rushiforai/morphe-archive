package hv;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.LinkPaymentDetails;
import com.stripe.android.model.PaymentMethod;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import kotlin.LazyKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p0 implements v4 {
    public static final IdentifierResolvableString F = zg.a.G(2132019987);
    public static final IdentifierResolvableString G = zg.a.G(2132019987);
    public static final IdentifierResolvableString H = zg.a.G(2132019901);
    public final boolean A;
    public final boolean B;
    public final uw.c C;
    public final a70.d D;
    public final uw.c E;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60466b;

    /* renamed from: c, reason: collision with root package name */
    public final ou.j f60467c;

    /* renamed from: d, reason: collision with root package name */
    public final CardBrandFilter f60468d;

    /* renamed from: e, reason: collision with root package name */
    public final ou.m0 f60469e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f60470f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f60471g;

    /* renamed from: h, reason: collision with root package name */
    public final ResolvableString f60472h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f60473i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f60474j;

    /* renamed from: k, reason: collision with root package name */
    public final Object f60475k;

    /* renamed from: l, reason: collision with root package name */
    public final Object f60476l;

    /* renamed from: m, reason: collision with root package name */
    public final Function2 f60477m;
    public final Function1 n;
    public final Function0 o;

    /* renamed from: p, reason: collision with root package name */
    public final d3 f60478p;

    /* renamed from: q, reason: collision with root package name */
    public final y70.d f60479q;

    /* renamed from: r, reason: collision with root package name */
    public final w70.i2 f60480r;

    /* renamed from: s, reason: collision with root package name */
    public final w70.i2 f60481s;

    /* renamed from: t, reason: collision with root package name */
    public final boolean f60482t;

    /* renamed from: u, reason: collision with root package name */
    public final w70.i2 f60483u;

    /* renamed from: v, reason: collision with root package name */
    public final w70.i2 f60484v;

    /* renamed from: w, reason: collision with root package name */
    public final boolean f60485w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f60486x;

    /* renamed from: y, reason: collision with root package name */
    public final IdentifierResolvableString f60487y;

    /* renamed from: z, reason: collision with root package name */
    public final n2 f60488z;

    /* JADX WARN: Removed duplicated region for block: B:38:0x0114  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public p0(boolean z11, boolean z12, ou.j displayableSavedPaymentMethod, CardBrandFilter cardBrandFilter, ou.m0 addressCollectionMode, Set allowedBillingCountries, boolean z13, IdentifierResolvableString identifierResolvableString, boolean z14, boolean z15, Function2 function2, Function3 function3, Function2 setDefaultPaymentMethodExecutor, Function1 function1, Function0 function0) {
        ArrayList arrayList;
        boolean z16;
        PaymentMethod.Card.Networks networks;
        Set set;
        d3 d3Var = new d3();
        Intrinsics.g(displayableSavedPaymentMethod, "displayableSavedPaymentMethod");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(addressCollectionMode, "addressCollectionMode");
        Intrinsics.g(allowedBillingCountries, "allowedBillingCountries");
        Intrinsics.g(setDefaultPaymentMethodExecutor, "setDefaultPaymentMethodExecutor");
        this.f60466b = z12;
        this.f60467c = displayableSavedPaymentMethod;
        this.f60468d = cardBrandFilter;
        this.f60469e = addressCollectionMode;
        this.f60470f = allowedBillingCountries;
        this.f60471g = z13;
        this.f60472h = identifierResolvableString;
        this.f60473i = z14;
        this.f60474j = z15;
        this.f60475k = function2;
        this.f60476l = function3;
        this.f60477m = setDefaultPaymentMethodExecutor;
        this.n = function1;
        this.o = function0;
        this.f60478p = d3Var;
        a80.e eVar = t70.y0.f88884a;
        this.f60479q = t70.k0.a(y70.o.f96819a.plus(t70.m0.d()));
        this.f60480r = w70.u1.c(b());
        this.f60481s = w70.u1.c(q4.f60529b);
        this.f60482t = z14;
        this.f60483u = w70.u1.c(Boolean.valueOf(z14));
        this.f60484v = w70.u1.c(null);
        PaymentMethod.Card card = displayableSavedPaymentMethod.f80905b.f43576h;
        if (card == null || (networks = card.f43616k) == null || (set = networks.f43621a) == null) {
            arrayList = null;
        } else {
            Set<String> set2 = set;
            ArrayList arrayList2 = new ArrayList(b70.c.u0(set2, 10));
            for (String str : set2) {
                ft.b.f55885m.getClass();
                arrayList2.add(b6.b.l(str));
            }
            arrayList = new ArrayList();
            Iterator it = arrayList2.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (this.f60468d.M((ft.b) next)) {
                    arrayList.add(next);
                }
            }
        }
        int i5 = 0;
        int i11 = 1;
        this.f60485w = (arrayList != null ? arrayList.size() : 0) > 1;
        ou.t1 t1Var = this.f60467c.f80906c;
        ou.o1 o1Var = t1Var instanceof ou.o1 ? (ou.o1) t1Var : null;
        if (o1Var != null) {
            PaymentMethod.Card card2 = o1Var.f80949a;
            Integer num = card2.f43609d;
            Integer num2 = card2.f43610e;
            z16 = (num == null || num2 == null || mk.v.J(num.intValue(), num2.intValue())) ? false : true;
        }
        this.f60486x = z16;
        ou.j displayableSavedPaymentMethod2 = this.f60467c;
        v4.f60639a.getClass();
        Integer num3 = 2132019910;
        Intrinsics.g(displayableSavedPaymentMethod2, "displayableSavedPaymentMethod");
        ou.t1 t1Var2 = displayableSavedPaymentMethod2.f80906c;
        if (t1Var2 instanceof ou.q1) {
            num3 = 2132019914;
        } else if (t1Var2 instanceof ou.r1) {
            num3 = 2132019909;
        } else if (!(t1Var2 instanceof ou.o1)) {
            if (t1Var2 instanceof ou.p1) {
                LinkPaymentDetails linkPaymentDetails = displayableSavedPaymentMethod2.f80905b.f43584r;
                if (linkPaymentDetails instanceof LinkPaymentDetails.BankAccount) {
                    num3 = 2132019912;
                } else if (!(linkPaymentDetails instanceof LinkPaymentDetails.Card)) {
                    if (linkPaymentDetails != null) {
                        throw new NoWhenBranchMatchedException();
                    }
                }
            } else if (!t1Var2.equals(ou.s1.f80974a)) {
                throw new NoWhenBranchMatchedException();
            }
            num3 = null;
        }
        this.f60487y = num3 != null ? zg.a.G(num3.intValue()) : null;
        this.f60488z = new n2(!z11, false, false, new f1.z1(26));
        this.A = !this.f60473i;
        this.B = this.f60467c.d(this.f60471g) || (this.f60474j && !this.f60473i);
        uw.c cVarU = ps.v.u(this.f60483u, new j0(this, i5));
        this.C = cVarU;
        this.D = LazyKt.a(new k0(this, i5));
        this.E = ps.v.m(this.f60480r, this.f60481s, this.f60483u, cVarU, this.f60484v, new cu.x(this, i11));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object, kotlin.jvm.functions.Function3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Serializable a(p0 p0Var, ContinuationImpl continuationImpl) {
        o0 o0Var;
        if (continuationImpl instanceof o0) {
            o0Var = (o0) continuationImpl;
            int i5 = o0Var.f60451w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o0Var.f60451w = i5 - Integer.MIN_VALUE;
            } else {
                o0Var = new o0(p0Var, continuationImpl);
            }
        }
        Object objInvoke = o0Var.f60449u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = o0Var.f60451w;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            ou.a aVar = (ou.a) p0Var.f60484v.getValue();
            if (aVar == null) {
                return null;
            }
            ?? r22 = p0Var.f60476l;
            PaymentMethod paymentMethod = p0Var.f60467c.f80905b;
            o0Var.f60448t = p0Var;
            o0Var.f60451w = 1;
            objInvoke = r22.invoke(paymentMethod, aVar, o0Var);
            if (objInvoke == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            p0Var = o0Var.f60448t;
            ResultKt.b(objInvoke);
        }
        Object obj = ((Result) objInvoke).f71688a;
        if (!(obj instanceof Result.Failure)) {
            p0Var.f60484v.j(null);
        }
        return new Result(obj);
    }

    public final IdentifierResolvableString b() {
        ou.j jVar = this.f60467c;
        ou.t1 t1Var = jVar.f80906c;
        ou.o1 o1Var = t1Var instanceof ou.o1 ? (ou.o1) t1Var : null;
        if (o1Var != null) {
            PaymentMethod.Card card = o1Var.f80949a;
            Integer num = card.f43609d;
            Integer num2 = card.f43610e;
            if (num != null && num2 != null && !mk.v.J(num.intValue(), num2.intValue()) && !jVar.d(this.f60471g)) {
                v4.f60639a.getClass();
                return o4.f60463b;
            }
        }
        return null;
    }

    public final void c(vh.a aVar) {
        w70.i2 i2Var;
        Object value;
        boolean zEquals = aVar.equals(s4.f60591f);
        Continuation continuation = null;
        y70.d dVar = this.f60479q;
        if (zEquals) {
            t70.m0.t(dVar, null, null, new h6.c(this, continuation, 6), 3);
            return;
        }
        if (aVar.equals(t4.f60606f)) {
            t70.m0.t(dVar, null, null, new h6.c(this, continuation, 7), 3);
            return;
        }
        if (aVar.equals(r4.f60569f)) {
            ((d0) ((x0) this.D.getValue())).b(v0.f60629a);
        } else {
            if (!(aVar instanceof u4)) {
                throw new NoWhenBranchMatchedException();
            }
            boolean z11 = ((u4) aVar).f60627f;
            do {
                i2Var = this.f60483u;
                value = i2Var.getValue();
                ((Boolean) value).getClass();
            } while (!i2Var.i(value, Boolean.valueOf(z11)));
        }
    }
}
