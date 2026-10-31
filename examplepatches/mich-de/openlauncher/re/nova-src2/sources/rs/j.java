package rs;

import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.stripe.android.link.ui.inline.UserInput;
import h6.c1;
import java.util.List;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final UserInput f86186a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86187b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f86188c;

    /* renamed from: d, reason: collision with root package name */
    public final List f86189d;

    /* renamed from: e, reason: collision with root package name */
    public final Set f86190e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f86191f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f86192g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f86193h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f86194i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f86195j;

    /* renamed from: k, reason: collision with root package name */
    public final vs.g f86196k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f86197l;

    public j(UserInput userInput, String merchantName, a0 a0Var, List fields, Set prefillEligibleFields, boolean z11, boolean z12, boolean z13, boolean z14, boolean z15, vs.g signUpState, boolean z16) {
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(fields, "fields");
        Intrinsics.g(prefillEligibleFields, "prefillEligibleFields");
        Intrinsics.g(signUpState, "signUpState");
        this.f86186a = userInput;
        this.f86187b = merchantName;
        this.f86188c = a0Var;
        this.f86189d = fields;
        this.f86190e = prefillEligibleFields;
        this.f86191f = z11;
        this.f86192g = z12;
        this.f86193h = z13;
        this.f86194i = z14;
        this.f86195j = z15;
        this.f86196k = signUpState;
        this.f86197l = z16;
    }

    public static j a(j jVar, UserInput userInput, boolean z11, boolean z12, vs.g gVar, int i5) {
        UserInput userInput2 = (i5 & 1) != 0 ? jVar.f86186a : userInput;
        String merchantName = jVar.f86187b;
        a0 a0Var = jVar.f86188c;
        List fields = jVar.f86189d;
        Set prefillEligibleFields = jVar.f86190e;
        boolean z13 = jVar.f86191f;
        boolean z14 = jVar.f86192g;
        boolean z15 = (i5 & 128) != 0 ? jVar.f86193h : true;
        boolean z16 = (i5 & 256) != 0 ? jVar.f86194i : z11;
        boolean z17 = (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? jVar.f86195j : z12;
        vs.g signUpState = (i5 & 1024) != 0 ? jVar.f86196k : gVar;
        boolean z18 = (i5 & 2048) != 0 ? jVar.f86197l : true;
        jVar.getClass();
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(fields, "fields");
        Intrinsics.g(prefillEligibleFields, "prefillEligibleFields");
        Intrinsics.g(signUpState, "signUpState");
        return new j(userInput2, merchantName, a0Var, fields, prefillEligibleFields, z13, z14, z15, z16, z17, signUpState, z18);
    }

    public final boolean b() {
        if (this.f86195j) {
            return false;
        }
        a0 a0Var = this.f86188c;
        int i5 = a0Var == null ? -1 : i.f86185a[a0Var.ordinal()];
        if (i5 != -1) {
            UserInput userInput = this.f86186a;
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                boolean z11 = this.f86192g;
                boolean z12 = this.f86194i;
                return z11 ? userInput != null && z12 : this.f86191f ? userInput != null : z12;
            }
            if (userInput != null) {
                return true;
            }
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
        return Intrinsics.b(this.f86186a, jVar.f86186a) && Intrinsics.b(this.f86187b, jVar.f86187b) && this.f86188c == jVar.f86188c && Intrinsics.b(this.f86189d, jVar.f86189d) && Intrinsics.b(this.f86190e, jVar.f86190e) && this.f86191f == jVar.f86191f && this.f86192g == jVar.f86192g && this.f86193h == jVar.f86193h && this.f86194i == jVar.f86194i && this.f86195j == jVar.f86195j && this.f86196k == jVar.f86196k && this.f86197l == jVar.f86197l;
    }

    public final int hashCode() {
        UserInput userInput = this.f86186a;
        int iE = c0.e((userInput == null ? 0 : userInput.hashCode()) * 31, 31, this.f86187b);
        a0 a0Var = this.f86188c;
        return Boolean.hashCode(this.f86197l) + ((this.f86196k.hashCode() + c9.f(c9.f(c9.f(c9.f(c9.f(c1.k(this.f86190e, u4.c((iE + (a0Var != null ? a0Var.hashCode() : 0)) * 31, 31, this.f86189d), 31), 31, this.f86191f), 31, this.f86192g), 31, this.f86193h), 31, this.f86194i), 31, this.f86195j)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("InlineSignupViewState(userInput=");
        sb2.append(this.f86186a);
        sb2.append(", merchantName=");
        sb2.append(this.f86187b);
        sb2.append(", signupMode=");
        sb2.append(this.f86188c);
        sb2.append(", fields=");
        sb2.append(this.f86189d);
        sb2.append(", prefillEligibleFields=");
        sb2.append(this.f86190e);
        sb2.append(", allowsDefaultOptIn=");
        sb2.append(this.f86191f);
        sb2.append(", linkSignUpOptInFeatureEnabled=");
        a80.m.s(sb2, this.f86192g, ", didAskToChangeSignupDetails=", this.f86193h, ", isExpanded=");
        a80.m.s(sb2, this.f86194i, ", apiFailed=", this.f86195j, ", signUpState=");
        sb2.append(this.f86196k);
        sb2.append(", userHasInteracted=");
        sb2.append(this.f86197l);
        sb2.append(")");
        return sb2.toString();
    }
}
