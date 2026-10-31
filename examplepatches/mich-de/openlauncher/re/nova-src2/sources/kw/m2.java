package kw;

import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class m2 implements k2 {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f72492a;

    public m2(IdentifierSpec identifier) {
        Intrinsics.g(identifier, "identifier");
        this.f72492a = identifier;
    }

    @Override // kw.k2
    public final IdentifierSpec b() {
        return this.f72492a;
    }
}
