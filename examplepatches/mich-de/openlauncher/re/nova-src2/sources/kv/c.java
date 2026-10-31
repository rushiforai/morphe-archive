package kv;

import c0.g0;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.ElementsSession;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$Configuration;
import com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext;
import com.stripe.android.paymentsheet.addresselement.f0;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import cu.x;
import cw.n1;
import e1.m0;
import ft.u;
import fv.k;
import h6.f1;
import h6.g1;
import h6.u0;
import hq.m;
import j00.k0;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import l1.g4;
import nx.l;
import oq.h;
import ou.g2;
import ou.q;
import ou.t;
import ou.v0;
import ou.w;
import ps.v;
import pu.j;
import pu.o;
import t70.y0;
import w70.i2;
import w70.o1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public abstract class c extends f1 {
    public final g2 A;
    public final uw.c B;

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Configuration f72266a;

    /* renamed from: b, reason: collision with root package name */
    public final ru.d f72267b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f72268c;

    /* renamed from: d, reason: collision with root package name */
    public final u0 f72269d;

    /* renamed from: e, reason: collision with root package name */
    public final q f72270e;

    /* renamed from: f, reason: collision with root package name */
    public final m f72271f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f72272g;

    /* renamed from: h, reason: collision with root package name */
    public final b6.b f72273h;

    /* renamed from: i, reason: collision with root package name */
    public final EventReporter$Mode f72274i;

    /* renamed from: j, reason: collision with root package name */
    public final f0 f72275j;

    /* renamed from: k, reason: collision with root package name */
    public final i2 f72276k;

    /* renamed from: l, reason: collision with root package name */
    public final i2 f72277l;

    /* renamed from: m, reason: collision with root package name */
    public final xu.f f72278m;
    public final l n;
    public final t1 o;

    /* renamed from: p, reason: collision with root package name */
    public final o1 f72279p;

    /* renamed from: q, reason: collision with root package name */
    public final o1 f72280q;

    /* renamed from: r, reason: collision with root package name */
    public final i2 f72281r;

    /* renamed from: s, reason: collision with root package name */
    public final i2 f72282s;

    /* renamed from: t, reason: collision with root package name */
    public final t f72283t;

    /* renamed from: u, reason: collision with root package name */
    public final i2 f72284u;

    /* renamed from: v, reason: collision with root package name */
    public final i2 f72285v;

    /* renamed from: w, reason: collision with root package name */
    public final i2 f72286w;

    /* renamed from: x, reason: collision with root package name */
    public final i2 f72287x;

    /* renamed from: y, reason: collision with root package name */
    public final ru.f f72288y;

    /* renamed from: z, reason: collision with root package name */
    public final ou.c f72289z;

    public c(PaymentSheet$Configuration config, ru.d eventReporter, k customerRepository, CoroutineContext workContext, u0 savedStateHandle, q linkHandler, m cardAccountRangeRepositoryFactory, boolean z11, b6.b tapToAddCollectionHandler, EventReporter$Mode mode) {
        Intrinsics.g(config, "config");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(customerRepository, "customerRepository");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(linkHandler, "linkHandler");
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(tapToAddCollectionHandler, "tapToAddCollectionHandler");
        Intrinsics.g(mode, "mode");
        this.f72266a = config;
        this.f72267b = eventReporter;
        this.f72268c = workContext;
        this.f72269d = savedStateHandle;
        this.f72270e = linkHandler;
        this.f72271f = cardAccountRangeRepositoryFactory;
        this.f72272g = z11;
        this.f72273h = tapToAddCollectionHandler;
        this.f72274i = mode;
        f0 f0Var = new f0(new AutocompleteAppearanceContext.PaymentElement(config.f44551h));
        this.f72275j = f0Var;
        i2 i2VarC = u1.c(null);
        this.f72276k = i2VarC;
        this.f72277l = i2VarC;
        xu.f fVar = new xu.f(g1.f(this), xu.m.f96372a, true, new jv.e(this, 3));
        this.f72278m = fVar;
        this.n = new l((o) f0Var, new m0(config.f44563v, j.f83050a));
        this.o = u1.b(0, 0, null, 7);
        o1 o1VarB = savedStateHandle.b(null, "selection");
        this.f72279p = o1VarB;
        o1 o1VarB2 = savedStateHandle.b(Boolean.FALSE, "processing");
        this.f72280q = o1VarB2;
        this.f72281r = u1.c(null);
        this.f72282s = u1.c(null);
        this.f72283t = new t(g1.f(this), o1VarB, config.f44544a, new a(this, 2), new a(this, 3));
        i2 i2VarC2 = u1.c(new n1(new bh.k(2), v.y(ft.b.f55894x), 4));
        this.f72284u = i2VarC2;
        this.f72285v = i2VarC2;
        i2 i2VarC3 = u1.c(Boolean.TRUE);
        this.f72286w = i2VarC3;
        this.f72287x = i2VarC3;
        m6.a aVarF = g1.f(this);
        a aVar = new a(this, 0);
        uw.c cVar = fVar.f96342g;
        this.f72288y = new ru.f(savedStateHandle, eventReporter, cVar, aVarF, aVar);
        ou.c cVar2 = new ou.c(v.u(i2VarC, new nq.a(9)), savedStateHandle, o1VarB);
        this.f72289z = cVar2;
        m6.a aVarF2 = g1.f(this);
        a80.e eVar = y0.f88884a;
        g2 g2Var = new g2(i2VarC, eventReporter, aVarF2, workContext, y70.o.f96819a, customerRepository, o1VarB, new iv.c(1, this, c.class, "updateSelection", "updateSelection(Lcom/stripe/android/paymentsheet/model/PaymentSelection;)V", 0, 16), cVar2, new g0(this, null, 6), new o00.d(7), new x(this, 4), linkHandler.f80959c, !z11);
        Continuation continuation = null;
        t70.m0.t(g1.f(this), null, null, new g4(this, g2Var, continuation, 20), 3);
        this.A = g2Var;
        byte b11 = 0;
        this.B = v.j(o1VarB2, v.r(cVar, new kotlinx.serialization.protobuf.schema.d(3)), new k0(4, b11));
        t70.m0.t(g1.f(this), null, null, new b(this, continuation, b11), 3);
    }

    public abstract void e();

    public abstract w70.g2 f();

    public final String g() {
        String strD;
        ou.x xVarH = h();
        if (xVarH != null && (strD = xVarH.d()) != null) {
            return strD;
        }
        Object value = this.f72277l.getValue();
        Intrinsics.d(value);
        return (String) b70.g.W0(((PaymentMethodMetadata) value).f0());
    }

    public abstract ou.x h();

    public final v0 i() {
        v0 v0Var;
        PaymentMethodMetadata paymentMethodMetadata;
        String str;
        v0 v0Var2 = this.f72266a.o;
        PaymentMethodMetadata paymentMethodMetadata2 = (PaymentMethodMetadata) this.f72277l.getValue();
        ElementsSession.ExperimentsData experimentsData = paymentMethodMetadata2 != null ? paymentMethodMetadata2.J : null;
        if (paymentMethodMetadata2 != null && experimentsData != null) {
            Map map = experimentsData.f43432b;
            if (v0Var2 == v0.f80993c) {
                for (u experiment : ul.b.Q(u.f56042e, u.f56043f, u.f56044g)) {
                    String str2 = (String) map.get(experiment);
                    if (str2 != null) {
                        boolean z11 = !((Collection) this.f72289z.f80805c.f91586b.invoke()).isEmpty();
                        Intrinsics.g(experiment, "experiment");
                        EventReporter$Mode mode = this.f72274i;
                        Intrinsics.g(mode, "mode");
                        String str3 = experimentsData.f43431a;
                        ArrayList arrayListS = paymentMethodMetadata2.S();
                        ArrayList arrayList = new ArrayList(b70.c.u0(arrayListS, 10));
                        Iterator it = arrayListS.iterator();
                        while (it.hasNext()) {
                            arrayList.add(((bt.g) it.next()).f18480a);
                        }
                        boolean z12 = paymentMethodMetadata2.f43106q;
                        boolean z13 = paymentMethodMetadata2.L != null;
                        int iOrdinal = mode.ordinal();
                        if (iOrdinal == 0) {
                            str = "paymentsheet";
                        } else if (iOrdinal == 1) {
                            str = "flowcontroller";
                        } else {
                            if (iOrdinal != 2) {
                                throw new NoWhenBranchMatchedException();
                            }
                            str = "embedded";
                        }
                        v0Var = v0Var2;
                        paymentMethodMetadata = paymentMethodMetadata2;
                        ((ru.a) this.f72267b).k(new h(experiment, str3, str2, MapsKt.m0(MapsKt.j0(new Pair("displayed_payment_method_types", b70.g.f1(arrayList, ",", null, null, 0, null, 62)), new Pair("displayed_payment_method_types_including_wallets", b70.g.f1(b70.g.U0(b70.g.u1(b70.g.u1(arrayList, z12 ? "google_pay" : null), z13 ? "link" : null)), ",", null, null, 0, null, 62)), new Pair("in_app_elements_integration_type", str)), b70.k.e0(new Pair("has_saved_payment_method", String.valueOf(z11))))));
                    } else {
                        v0Var = v0Var2;
                        paymentMethodMetadata = paymentMethodMetadata2;
                    }
                    v0Var2 = v0Var;
                    paymentMethodMetadata2 = paymentMethodMetadata;
                }
                v0 v0Var3 = v0Var2;
                String str4 = (String) map.get(u.f56044g);
                return str4 != null ? str4.equals("control") ? v0.f80992b : str4.equals("treatment") ? v0.f80991a : v0Var3 : v0Var3;
            }
        }
        return v0Var2;
    }

    public abstract uw.c j();

    public abstract w70.g2 k();

    public abstract w70.g2 l();

    public final void m() {
        if (((Boolean) this.f72280q.f93973a.getValue()).booleanValue()) {
            return;
        }
        xu.f fVar = this.f72278m;
        if (fVar.a()) {
            fVar.b();
        } else {
            q();
        }
    }

    public abstract void n(PaymentSelection paymentSelection);

    public abstract void o(ResolvableString resolvableString);

    @Override // h6.f1
    public final void onCleared() {
        super.onCleared();
        r(null);
        this.f72269d.d("selection", null);
    }

    public abstract void q();

    public abstract void r(ou.x xVar);

    public final void t(PaymentSelection paymentSelection) {
        ft.b bVar;
        if (paymentSelection instanceof PaymentSelection.New) {
            r(new w((PaymentSelection.New) paymentSelection));
        } else if (paymentSelection instanceof PaymentSelection.CustomPaymentMethod) {
            r(new ou.u((PaymentSelection.CustomPaymentMethod) paymentSelection));
        } else if (paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) {
            r(new ou.v((PaymentSelection.ExternalPaymentMethod) paymentSelection));
        }
        this.f72269d.d("selection", paymentSelection);
        if (paymentSelection instanceof PaymentSelection.Saved) {
            PaymentMethod paymentMethod = ((PaymentSelection.Saved) paymentSelection).f44846a;
            if (paymentMethod.f43573e == PaymentMethod.Type.f43639i) {
                bh.k kVar = new bh.k(2);
                PaymentMethod.Card card = paymentMethod.f43576h;
                if (card == null || (bVar = card.f43606a) == null) {
                    bVar = ft.b.f55894x;
                }
                n1 n1Var = new n1(kVar, v.y(bVar), 4);
                i2 i2Var = this.f72284u;
                i2Var.getClass();
                i2Var.k(null, n1Var);
                t70.m0.t(g1.f(this), null, null, new b(this, null, 1), 3);
            }
        }
        e();
    }
}
