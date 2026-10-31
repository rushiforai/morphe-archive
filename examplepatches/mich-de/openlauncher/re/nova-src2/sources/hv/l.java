package hv;

import com.stripe.android.model.Address;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.ui.core.BillingDetailsCollectionConfiguration;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final g1 f60372a;

    /* renamed from: b, reason: collision with root package name */
    public final kw.q2 f60373b;

    /* renamed from: c, reason: collision with root package name */
    public final kw.i2 f60374c;

    /* renamed from: d, reason: collision with root package name */
    public final uw.c f60375d;

    /* renamed from: e, reason: collision with root package name */
    public final w70.m f60376e;

    public l(PaymentMethod.BillingDetails billingDetails, ou.m0 addressCollectionMode, g1 g1Var, boolean z11, boolean z12, Set allowedBillingCountries) {
        kw.q2 q2Var;
        aw.a aVar;
        Intrinsics.g(addressCollectionMode, "addressCollectionMode");
        Intrinsics.g(allowedBillingCountries, "allowedBillingCountries");
        this.f60372a = g1Var;
        iw.p pVar = null;
        if (g1Var == g1.f60271c) {
            IdentifierSpec.Companion.getClass();
            q2Var = new kw.q2(IdentifierSpec.f45364e, new kw.t2(new kw.c1(), billingDetails != null ? billingDetails.f43604c : null, pVar, 4));
        } else {
            q2Var = null;
        }
        this.f60373b = q2Var;
        IdentifierSpec.Companion.getClass();
        IdentifierSpec identifierSpec = IdentifierSpec.f45371l;
        int iOrdinal = addressCollectionMode.ordinal();
        if (iOrdinal == 0) {
            aVar = aw.a.f15701a;
        } else if (iOrdinal == 1) {
            aVar = aw.a.f15702b;
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            aVar = aw.a.f15703c;
        }
        aw.a aVar2 = aVar;
        g1 g1Var2 = g1.f60270b;
        BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration = new BillingDetailsCollectionConfiguration(g1Var == g1Var2, z11, z12, aVar2, 16);
        Address address = billingDetails != null ? billingDetails.f43602a : null;
        cw.p0 p0Var = new cw.p0(identifierSpec, MapsKt.r0(kotlin.collections.c.v0(new Pair[]{g1Var == g1Var2 ? new Pair(IdentifierSpec.f45364e, billingDetails != null ? billingDetails.f43604c : null) : null, new Pair(IdentifierSpec.o, address != null ? address.f43129c : null), new Pair(IdentifierSpec.f45373p, address != null ? address.f43130d : null), new Pair(IdentifierSpec.f45378u, address != null ? address.f43132f : null), new Pair(IdentifierSpec.f45374q, address != null ? address.f43127a : null), new Pair(IdentifierSpec.f45379v, address != null ? address.f43128b : null), new Pair(IdentifierSpec.f45376s, address != null ? address.f43131e : null), z11 ? new Pair(IdentifierSpec.f45372m, billingDetails != null ? billingDetails.f43603b : null) : null, z12 ? new Pair(IdentifierSpec.n, billingDetails != null ? billingDetails.f43605d : null) : null})), allowedBillingCountries, null, null, null, billingDetailsCollectionConfiguration, 8);
        EmptyList emptyList = EmptyList.f71733a;
        this.f60374c = kw.o0.c(p0Var, zg.a.U(2132019728, new Object[0], emptyList));
        uw.c cVar = p0Var.f48258h;
        this.f60375d = cVar;
        cw.u0 u0VarJ = w70.u1.j(q2Var != null ? q2Var.e() : new n8.q(emptyList, 3), p0Var.f48253c.e(), cVar, new cw.u1(this, null, 1));
        a80.e eVar = t70.y0.f88884a;
        this.f60376e = w70.u1.s(u0VarJ, y70.o.f96819a);
    }

    public static final pw.a a(l lVar, List list, IdentifierSpec identifierSpec, Set set) {
        Object next;
        if (!set.contains(identifierSpec)) {
            Iterator it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((Pair) next).f71683a, identifierSpec)) {
                    break;
                }
            }
            Pair pair = (Pair) next;
            if (pair != null) {
                return (pw.a) pair.f71684b;
            }
        }
        return null;
    }
}
