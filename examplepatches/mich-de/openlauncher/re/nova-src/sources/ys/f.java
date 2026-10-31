package ys;

import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;

/* loaded from: classes4.dex */
public abstract class f implements ss.a {

    /* renamed from: a, reason: collision with root package name */
    public final String f97467a;

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierResolvableString f97468b;

    public f(String str, IdentifierResolvableString identifierResolvableString) {
        this.f97467a = str;
        this.f97468b = identifierResolvableString;
    }

    @Override // ss.a
    public final boolean a() {
        return false;
    }

    @Override // ss.a
    public final String b() {
        return this.f97467a;
    }

    @Override // ss.a
    public final ResolvableString getText() {
        return this.f97468b;
    }
}
