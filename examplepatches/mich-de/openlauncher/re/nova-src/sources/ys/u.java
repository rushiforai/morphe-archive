package ys;

import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;

/* loaded from: classes4.dex */
public abstract class u implements ss.a {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierResolvableString f97581a;

    /* renamed from: b, reason: collision with root package name */
    public final String f97582b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f97583c;

    public u(IdentifierResolvableString identifierResolvableString, String str, boolean z11) {
        this.f97581a = identifierResolvableString;
        this.f97582b = str;
        this.f97583c = z11;
    }

    @Override // ss.a
    public final boolean a() {
        return this.f97583c;
    }

    @Override // ss.a
    public final String b() {
        return this.f97582b;
    }

    @Override // ss.a
    public ResolvableString getText() {
        return this.f97581a;
    }
}
