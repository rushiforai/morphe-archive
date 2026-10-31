package bb;

import android.content.Context;
import android.os.UserHandle;
import b10.r0;
import b70.k;
import bm.t;
import bn.m0;
import bn.n0;
import bn.o;
import c0.a0;
import cm.l;
import com.amplitude.core.events.Plan;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.google.firebase.concurrent.ExecutorsRegistrar;
import com.google.firebase.crashlytics.FirebaseCrashlytics;
import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;
import com.google.firebase.crashlytics.internal.send.DataTransportCrashlyticsReportSender;
import com.google.firebase.datatransport.TransportRegistrar;
import com.google.firebase.sessions.FirebaseSessionsRegistrar;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import cv.y;
import cy.d0;
import e10.t0;
import e10.y2;
import el.g;
import fa.p;
import fa.x;
import fi.f;
import fl.c0;
import fl.d;
import fl.e0;
import fl.f0;
import fl.m;
import fl.v;
import java.security.GeneralSecurityException;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.ScheduledExecutorService;
import kl.g0;
import kl.l0;
import kl.q0;
import kl.s;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import n30.c;
import o9.z1;
import pl.i1;
import pl.j1;
import pl.v1;
import pl.w1;
import qd.e;
import tx.r;
import ya.z;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements z, nm.a, e, bm.e, a0, f, PurchasesUpdatedListener, z1, c, ba.f, l0, g0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17789a;

    public /* synthetic */ a(int i5) {
        this.f17789a = i5;
    }

    @Override // ba.f
    public void a(HashSet hashSet, UserHandle userHandle) {
    }

    @Override // qd.e
    public Object apply(Object obj) {
        switch (this.f17789a) {
            case 2:
                m0 m0Var = (m0) obj;
                String strF = n0.f18252b.f(m0Var);
                Intrinsics.f(strF, "encode(...)");
                m0Var.getClass();
                o oVar = o.f18253b;
                byte[] bytes = strF.getBytes(Charsets.f72000b);
                Intrinsics.f(bytes, "getBytes(...)");
                return bytes;
            default:
                return DataTransportCrashlyticsReportSender.lambda$static$0((CrashlyticsReport) obj);
        }
    }

    @Override // c0.a0
    public float b(float f11) {
        return f11;
    }

    @Override // o9.z1
    public void c(p pVar) {
        pVar.F();
        pVar.M();
    }

    @Override // kl.g0
    public q0 d(g gVar) {
        c0 c0Var = (c0) gVar;
        i1 i1VarC = j1.C();
        i1VarC.g("type.googleapis.com/google.crypto.tink.KmsAeadKey");
        v1 v1VarY = w1.y();
        v1VarY.f(c0Var.f55296a);
        i1VarC.h(((w1) v1VarY.a()).e());
        i1VarC.f(e0.a(c0Var.f55297b));
        return q0.c((j1) i1VarC.a());
    }

    @Override // kl.l0
    public Object e(bh.g gVar) throws GeneralSecurityException {
        switch (this.f17789a) {
            case 21:
                return d.c((s) gVar);
            case 22:
                return sl.c.a((fl.f) gVar);
            case 23:
                return sl.b.a((m) gVar);
            case 24:
                return sl.c.b((fl.p) gVar);
            case 25:
                return hl.a.a((fl.s) gVar);
            case 26:
                v vVar = (v) gVar;
                return gl.g.c() ? gl.g.a(vVar) : sl.c.c(vVar);
            case 27:
                el.e.a(((fl.a0) gVar).f55281c.f55296a);
                throw null;
            default:
                el.e.a(((f0) gVar).f55310c.f55314b);
                throw null;
        }
    }

    @Override // n30.c
    public boolean f() {
        return ((t0) y2.f51877a.u().l()).f51823c;
    }

    @Override // ya.z
    public Object g(Context context) {
        switch (this.f17789a) {
            case 0:
                return new b(context);
            default:
                return new x(context);
        }
    }

    @Override // nm.a
    public void h(nm.c cVar) {
    }

    @Override // fi.f
    public void i(Exception exc) {
        FirebaseCrashlytics.lambda$init$0(exc);
    }

    @Override // com.android.billingclient.api.PurchasesUpdatedListener
    public void onPurchasesUpdated(BillingResult billingResult, List list) {
        y70.d dVar = d0.f48443b;
        d0 d0Var = d0.f48442a;
        int responseCode = billingResult.getResponseCode();
        Continuation continuation = null;
        if (responseCode == 0) {
            if (list != null) {
                t70.m0.t(dVar, null, null, new y(list, continuation, 2), 3);
                return;
            }
            return;
        }
        if (responseCode == 1) {
            zy.c cVar = zy.c.f98823a;
            zy.c.i("subscription_flow_canceled", d0.N(d0Var, null, null, 3));
            return;
        }
        if (responseCode != 7) {
            zy.c cVar2 = zy.c.f98823a;
            zy.c.i("subscription_flow_error", d0.N(d0Var, null, k.e0(new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, Integer.valueOf(billingResult.getResponseCode()))), 1));
            return;
        }
        Pair pair = new Pair(Plan.AMP_PLAN_SOURCE, d0.f48452k);
        String str = d0.f48453l;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Pair pair2 = new Pair("tier", d0.e(str));
        String str2 = d0.f48453l;
        if (str2 == null) {
            str2 = "unknown";
        }
        r.i("ai_billing_item_owned", MapsKt.j0(pair, pair2, new Pair("product_id", str2), new Pair("response_code", Integer.valueOf(billingResult.getResponseCode()))));
        String str3 = d0.f48453l;
        if (str3 == null || !d0.L(str3)) {
            d0.E();
        } else {
            t70.m0.t(dVar, null, null, new r0(6), 3);
        }
    }

    @Override // bm.e
    public Object q(t tVar) {
        switch (this.f17789a) {
            case 4:
                return FirebaseSessionsRegistrar.getComponents$lambda$0(tVar);
            case 5:
                return FirebaseSessionsRegistrar.getComponents$lambda$1(tVar);
            case 6:
            case 11:
            case 12:
            case 13:
            default:
                return TransportRegistrar.lambda$getComponents$2(tVar);
            case 7:
                return (ScheduledExecutorService) ExecutorsRegistrar.f34689a.get();
            case 8:
                return (ScheduledExecutorService) ExecutorsRegistrar.f34691c.get();
            case 9:
                return (ScheduledExecutorService) ExecutorsRegistrar.f34690b.get();
            case 10:
                bm.m mVar = ExecutorsRegistrar.f34689a;
                return l.f20128a;
            case 14:
                return TransportRegistrar.lambda$getComponents$0(tVar);
            case 15:
                return TransportRegistrar.lambda$getComponents$1(tVar);
        }
    }

    public /* synthetic */ a(bn.m mVar) {
        this.f17789a = 2;
    }
}
