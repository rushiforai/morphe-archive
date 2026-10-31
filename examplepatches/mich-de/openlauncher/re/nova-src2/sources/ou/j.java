package ou;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.core.strings.StaticResolvableString;
import com.stripe.android.model.LinkPaymentDetails;
import com.stripe.android.model.PaymentMethod;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f80904a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethod f80905b;

    /* renamed from: c, reason: collision with root package name */
    public final t1 f80906c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f80907d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f80908e;

    public j(ResolvableString resolvableString, PaymentMethod paymentMethod, t1 t1Var, boolean z11, boolean z12) {
        this.f80904a = resolvableString;
        this.f80905b = paymentMethod;
        this.f80906c = t1Var;
        this.f80907d = z11;
        this.f80908e = z12;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String a() {
        ft.b bVar;
        ft.b bVarL;
        t1 t1Var = this.f80906c;
        if (t1Var instanceof o1) {
            PaymentMethod.Card card = ((o1) t1Var).f80949a;
            String str = card.f43617l;
            if (str != null) {
                ft.b.f55885m.getClass();
                bVarL = b6.b.l(str);
                if (bVarL == null) {
                    bVarL = card.f43606a;
                }
            }
            return bVarL.f55898b;
        }
        if (t1Var instanceof p1) {
            LinkPaymentDetails linkPaymentDetails = ((p1) t1Var).f80956a;
            LinkPaymentDetails.Card card2 = linkPaymentDetails instanceof LinkPaymentDetails.Card ? (LinkPaymentDetails.Card) linkPaymentDetails : null;
            if (card2 != null && (bVar = card2.f43514e) != null) {
                return bVar.f55898b;
            }
        } else if (!(t1Var instanceof r1) && !(t1Var instanceof q1) && !(t1Var instanceof s1)) {
            throw new NoWhenBranchMatchedException();
        }
        return null;
    }

    public final boolean b() {
        Set set;
        t1 t1Var = this.f80906c;
        if (t1Var instanceof o1) {
            PaymentMethod.Card.Networks networks = ((o1) t1Var).f80949a.f43616k;
            return this.f80907d && (networks != null && (set = networks.f43621a) != null && set.size() > 1);
        }
        if ((t1Var instanceof q1) || (t1Var instanceof r1) || (t1Var instanceof p1) || Intrinsics.b(t1Var, s1.f80974a)) {
            return false;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final ResolvableString c() {
        t1 t1Var = this.f80906c;
        if (t1Var instanceof o1) {
            return zg.a.U(2132019740, new Object[]{a(), ((o1) t1Var).f80949a.f43613h}, EmptyList.f71733a);
        }
        if (t1Var instanceof q1) {
            return zg.a.U(2132019713, new Object[]{((q1) t1Var).f80965a.f43636e}, EmptyList.f71733a);
        }
        if (t1Var instanceof r1) {
            return zg.a.U(2132019713, new Object[]{((r1) t1Var).f80971a.f43665e}, EmptyList.f71733a);
        }
        if (!(t1Var instanceof p1)) {
            if (t1Var instanceof s1) {
                return new StaticResolvableString(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, kotlin.collections.c.b1(new Object[0]));
            }
            throw new NoWhenBranchMatchedException();
        }
        LinkPaymentDetails linkPaymentDetails = ((p1) t1Var).f80956a;
        if (linkPaymentDetails instanceof LinkPaymentDetails.BankAccount) {
            return zg.a.U(2132019713, new Object[]{((LinkPaymentDetails.BankAccount) linkPaymentDetails).f43509b}, EmptyList.f71733a);
        }
        if (linkPaymentDetails instanceof LinkPaymentDetails.Card) {
            return zg.a.U(2132019740, new Object[]{a(), ((LinkPaymentDetails.Card) linkPaymentDetails).f43513d}, EmptyList.f71733a);
        }
        throw new NoWhenBranchMatchedException();
    }

    public final boolean d(boolean z11) {
        t1 t1Var = this.f80906c;
        if (t1Var instanceof o1) {
            if (z11) {
                return true;
            }
            PaymentMethod.Card card = ((o1) t1Var).f80949a;
            Integer num = card.f43609d;
            Integer num2 = card.f43610e;
            if ((num == null || num2 == null || mk.v.J(num.intValue(), num2.intValue())) && b()) {
                return true;
            }
        } else if (!(t1Var instanceof q1) && !(t1Var instanceof r1) && !(t1Var instanceof p1) && !t1Var.equals(s1.f80974a)) {
            throw new NoWhenBranchMatchedException();
        }
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f80904a, jVar.f80904a) && Intrinsics.b(this.f80905b, jVar.f80905b) && Intrinsics.b(this.f80906c, jVar.f80906c) && this.f80907d == jVar.f80907d && this.f80908e == jVar.f80908e;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f80908e) + c9.f((this.f80906c.hashCode() + ((this.f80905b.hashCode() + (this.f80904a.hashCode() * 31)) * 31)) * 31, 31, this.f80907d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DisplayableSavedPaymentMethod(displayName=");
        sb2.append(this.f80904a);
        sb2.append(", paymentMethod=");
        sb2.append(this.f80905b);
        sb2.append(", savedPaymentMethod=");
        sb2.append(this.f80906c);
        sb2.append(", isCbcEligible=");
        sb2.append(this.f80907d);
        sb2.append(", shouldShowDefaultBadge=");
        return a80.m.k(sb2, this.f80908e, ")");
    }
}
