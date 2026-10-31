package ts;

import b.c0;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.ConsentUi;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f89592a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89593b;

    /* renamed from: c, reason: collision with root package name */
    public final String f89594c;

    /* renamed from: d, reason: collision with root package name */
    public final ConsentUi.ConsentPane f89595d;

    /* renamed from: e, reason: collision with root package name */
    public final ResolvableString f89596e;

    public j(String merchantName, String userEmail, String str, ConsentUi.ConsentPane consentPane, ResolvableString resolvableString) {
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(userEmail, "userEmail");
        this.f89592a = merchantName;
        this.f89593b = userEmail;
        this.f89594c = str;
        this.f89595d = consentPane;
        this.f89596e = resolvableString;
    }

    public static j a(j jVar, ResolvableString resolvableString) {
        String merchantName = jVar.f89592a;
        String userEmail = jVar.f89593b;
        String str = jVar.f89594c;
        ConsentUi.ConsentPane consentPane = jVar.f89595d;
        jVar.getClass();
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(userEmail, "userEmail");
        return new j(merchantName, userEmail, str, consentPane, resolvableString);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f89592a, jVar.f89592a) && Intrinsics.b(this.f89593b, jVar.f89593b) && Intrinsics.b(this.f89594c, jVar.f89594c) && Intrinsics.b(this.f89595d, jVar.f89595d) && Intrinsics.b(this.f89596e, jVar.f89596e);
    }

    public final int hashCode() {
        int iE = c0.e(this.f89592a.hashCode() * 31, 31, this.f89593b);
        String str = this.f89594c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        ConsentUi.ConsentPane consentPane = this.f89595d;
        int iHashCode2 = (iHashCode + (consentPane == null ? 0 : consentPane.hashCode())) * 31;
        ResolvableString resolvableString = this.f89596e;
        return iHashCode2 + (resolvableString != null ? resolvableString.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("OAuthConsentViewState(merchantName=", this.f89592a, ", userEmail=", this.f89593b, ", merchantLogoUrl=");
        sbW.append(this.f89594c);
        sbW.append(", consentPane=");
        sbW.append(this.f89595d);
        sbW.append(", errorMessage=");
        sbW.append(this.f89596e);
        sbW.append(")");
        return sbW.toString();
    }
}
