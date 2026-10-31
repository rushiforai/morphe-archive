package gv;

import b.c9;
import b.u4;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z0 {

    /* renamed from: a, reason: collision with root package name */
    public final y0 f58002a;

    /* renamed from: b, reason: collision with root package name */
    public final x0 f58003b;

    /* renamed from: c, reason: collision with root package name */
    public final List f58004c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f58005d;

    /* renamed from: e, reason: collision with root package name */
    public final int f58006e;

    /* renamed from: f, reason: collision with root package name */
    public final CardFundingFilter f58007f;

    /* renamed from: g, reason: collision with root package name */
    public final CardBrandFilter f58008g;

    /* renamed from: h, reason: collision with root package name */
    public final Function0 f58009h;

    /* renamed from: i, reason: collision with root package name */
    public final Function0 f58010i;

    public z0(y0 y0Var, x0 x0Var, List walletsAllowedInHeader, boolean z11, int i5, CardFundingFilter cardFundingFilter, CardBrandFilter cardBrandFilter, Function0 function0, Function0 function02) {
        Intrinsics.g(walletsAllowedInHeader, "walletsAllowedInHeader");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        this.f58002a = y0Var;
        this.f58003b = x0Var;
        this.f58004c = walletsAllowedInHeader;
        this.f58005d = z11;
        this.f58006e = i5;
        this.f58007f = cardFundingFilter;
        this.f58008g = cardBrandFilter;
        this.f58009h = function0;
        this.f58010i = function02;
    }

    public final x0 a(r0 r0Var) {
        int iOrdinal = r0Var.ordinal();
        List list = this.f58004c;
        x0 x0Var = this.f58003b;
        if (iOrdinal == 0) {
            if (x0Var == null || !list.contains(ct.w.f47899c)) {
                return null;
            }
            return x0Var;
        }
        if (iOrdinal != 1) {
            throw new NoWhenBranchMatchedException();
        }
        if (x0Var == null || list.contains(ct.w.f47899c)) {
            return null;
        }
        return x0Var;
    }

    public final y0 b(r0 r0Var) {
        int iOrdinal = r0Var.ordinal();
        List list = this.f58004c;
        y0 y0Var = this.f58002a;
        if (iOrdinal == 0) {
            if (y0Var == null || !list.contains(ct.w.f47900d)) {
                return null;
            }
            return y0Var;
        }
        if (iOrdinal != 1) {
            throw new NoWhenBranchMatchedException();
        }
        if (y0Var == null || list.contains(ct.w.f47900d)) {
            return null;
        }
        return y0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z0)) {
            return false;
        }
        z0 z0Var = (z0) obj;
        return Intrinsics.b(this.f58002a, z0Var.f58002a) && Intrinsics.b(this.f58003b, z0Var.f58003b) && Intrinsics.b(this.f58004c, z0Var.f58004c) && this.f58005d == z0Var.f58005d && this.f58006e == z0Var.f58006e && Intrinsics.b(this.f58007f, z0Var.f58007f) && Intrinsics.b(this.f58008g, z0Var.f58008g) && Intrinsics.b(this.f58009h, z0Var.f58009h) && Intrinsics.b(this.f58010i, z0Var.f58010i);
    }

    public final int hashCode() {
        y0 y0Var = this.f58002a;
        int iHashCode = (y0Var == null ? 0 : y0Var.hashCode()) * 31;
        x0 x0Var = this.f58003b;
        return this.f58010i.hashCode() + ((this.f58009h.hashCode() + ((this.f58008g.hashCode() + ((this.f58007f.hashCode() + u4.a(this.f58006e, c9.f(u4.c((iHashCode + (x0Var != null ? x0Var.hashCode() : 0)) * 31, 31, this.f58004c), 31, this.f58005d), 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "WalletsState(link=" + this.f58002a + ", googlePay=" + this.f58003b + ", walletsAllowedInHeader=" + this.f58004c + ", buttonsEnabled=" + this.f58005d + ", dividerTextResource=" + this.f58006e + ", cardFundingFilter=" + this.f58007f + ", cardBrandFilter=" + this.f58008g + ", onGooglePayPressed=" + this.f58009h + ", onLinkPressed=" + this.f58010i + ")";
    }
}
