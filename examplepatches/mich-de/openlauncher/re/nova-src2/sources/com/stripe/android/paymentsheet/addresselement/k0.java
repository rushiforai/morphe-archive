package com.stripe.android.paymentsheet.addresselement;

import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract;
import e1.m0;
import h10.y0;
import h6.f1;
import h6.g1;
import java.util.LinkedHashMap;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class k0 extends f1 implements kw.q {

    /* renamed from: a, reason: collision with root package name */
    public final AddressElementActivityContract.Args f44746a;

    /* renamed from: b, reason: collision with root package name */
    public final pu.k0 f44747b;

    /* renamed from: c, reason: collision with root package name */
    public final qu.c f44748c;

    /* renamed from: d, reason: collision with root package name */
    public y0 f44749d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkedHashMap f44750e;

    /* renamed from: f, reason: collision with root package name */
    public final i2 f44751f;

    /* renamed from: g, reason: collision with root package name */
    public LinkedHashMap f44752g;

    /* renamed from: h, reason: collision with root package name */
    public final o1 f44753h;

    /* renamed from: i, reason: collision with root package name */
    public final i2 f44754i;

    /* renamed from: j, reason: collision with root package name */
    public final i2 f44755j;

    /* renamed from: k, reason: collision with root package name */
    public final m0 f44756k;

    /* renamed from: l, reason: collision with root package name */
    public final i f44757l;

    /* renamed from: m, reason: collision with root package name */
    public final i2 f44758m;
    public final i2 n;
    public final i2 o;

    /* renamed from: p, reason: collision with root package name */
    public final i2 f44759p;

    public k0(AddressElementActivityContract.Args args, pu.k0 navigator, qu.c eventReporter) {
        boolean zContains;
        Object i0Var;
        Boolean bool;
        Set set;
        PaymentSheet$Address paymentSheet$Address;
        String str;
        AddressDetails addressDetails;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails;
        Intrinsics.g(navigator, "navigator");
        Intrinsics.g(eventReporter, "eventReporter");
        this.f44746a = args;
        this.f44747b = navigator;
        this.f44748c = eventReporter;
        AddressLauncher$Configuration addressLauncher$Configuration = args.f44687b;
        j jVar = new j(addressLauncher$Configuration);
        AddressDetails addressDetailsE = (addressLauncher$Configuration == null || (paymentSheet$BillingDetails = addressLauncher$Configuration.f44703i) == null) ? null : e(new AddressDetails(paymentSheet$BillingDetails.f44511c, paymentSheet$BillingDetails.f44509a, paymentSheet$BillingDetails.f44512d, 8));
        LinkedHashMap linkedHashMapA = addressDetailsE != null ? jVar.a(addressDetailsE) : null;
        this.f44750e = linkedHashMapA;
        AddressDetails addressDetailsE2 = (addressLauncher$Configuration == null || (addressDetails = addressLauncher$Configuration.f44696b) == null) ? null : e(addressDetails);
        LinkedHashMap linkedHashMapA2 = addressDetailsE2 != null ? jVar.a(addressDetailsE2) : null;
        boolean zB = Intrinsics.b(linkedHashMapA, linkedHashMapA2);
        if (addressLauncher$Configuration == null || linkedHashMapA == null) {
            zContains = false;
        } else if (addressDetailsE == null || (paymentSheet$Address = addressDetailsE.f44679b) == null || (str = paymentSheet$Address.f44448b) == null) {
            zContains = true;
        } else {
            Set set2 = addressLauncher$Configuration.f44697c;
            set2 = set2.isEmpty() ? null : set2;
            zContains = (set2 == null ? cr.e.f47799a : set2).contains(str);
        }
        if (zContains) {
            i0Var = new pu.i0((linkedHashMapA != null && linkedHashMapA2 == null) || zB);
        } else {
            i0Var = pu.h0.f83046a;
        }
        i2 i2VarC = u1.c(i0Var);
        this.f44751f = i2VarC;
        this.f44752g = zB ? null : linkedHashMapA2;
        this.f44753h = new o1(i2VarC);
        i2 i2VarC2 = u1.c(addressDetailsE2 != null ? addressDetailsE2 : addressDetailsE);
        this.f44754i = i2VarC2;
        this.f44755j = i2VarC2;
        this.f44756k = new m0(addressLauncher$Configuration != null ? addressLauncher$Configuration.f44701g : null, (addressLauncher$Configuration == null || (set = addressLauncher$Configuration.f44702h) == null) ? EmptySet.f71734a : set);
        AddressDetails addressDetails2 = (AddressDetails) i2VarC2.getValue();
        this.f44757l = new i(addressDetails2 != null ? pu.b.c(addressDetails2, null) : b70.h.f17594a, addressLauncher$Configuration, this);
        i2 i2VarC3 = u1.c(Boolean.TRUE);
        this.f44758m = i2VarC3;
        this.n = i2VarC3;
        i2 i2VarC4 = u1.c(Boolean.FALSE);
        this.o = i2VarC4;
        this.f44759p = i2VarC4;
        t70.m0.t(g1.f(this), null, null, new i0(this, null), 3);
        t70.m0.t(g1.f(this), null, null, new j0(this, null), 3);
        if (addressDetailsE2 == null || (bool = addressDetailsE2.f44681d) == null) {
            return;
        }
        i2VarC4.k(null, bool);
    }

    @Override // kw.q
    public final void a(y0 y0Var) {
        this.f44749d = y0Var;
    }

    @Override // kw.q
    public final void b(String str) {
        t70.m0.t(g1.f(this), null, null, new pu.q(this, str, null, 3), 3);
    }

    @Override // kw.q
    public final m0 c() {
        return this.f44756k;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final AddressDetails e(AddressDetails addressDetails) {
        Set set;
        AddressLauncher$Configuration addressLauncher$Configuration = this.f44746a.f44687b;
        if (addressLauncher$Configuration == null || (set = addressLauncher$Configuration.f44697c) == null) {
            Set set2 = cr.e.f47799a;
            set = cr.e.f47799a;
        } else {
            if (set.isEmpty()) {
                set = null;
            }
            if (set == null) {
            }
        }
        PaymentSheet$Address paymentSheet$Address = addressDetails.f44679b;
        if ((paymentSheet$Address != null ? paymentSheet$Address.f44448b : null) == null || set.contains(paymentSheet$Address.f44448b)) {
            return addressDetails;
        }
        return null;
    }
}
