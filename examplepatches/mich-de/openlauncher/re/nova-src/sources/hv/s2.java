package hv;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s2 {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f60581a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60582b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f60583c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f60584d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f60585e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f60586f;

    public s2(ResolvableString resolvableString, boolean z11, Function0 function0, Function0 function02, boolean z12, boolean z13) {
        this.f60581a = resolvableString;
        this.f60582b = z11;
        this.f60583c = function0;
        this.f60584d = function02;
        this.f60585e = z12;
        this.f60586f = z13;
    }

    public static s2 a(s2 s2Var, boolean z11) {
        ResolvableString resolvableString = s2Var.f60581a;
        boolean z12 = s2Var.f60582b;
        Function0 function0 = s2Var.f60583c;
        Function0 function02 = s2Var.f60584d;
        boolean z13 = s2Var.f60586f;
        s2Var.getClass();
        return new s2(resolvableString, z12, function0, function02, z11, z13);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s2)) {
            return false;
        }
        s2 s2Var = (s2) obj;
        return Intrinsics.b(this.f60581a, s2Var.f60581a) && this.f60582b == s2Var.f60582b && Intrinsics.b(this.f60583c, s2Var.f60583c) && Intrinsics.b(this.f60584d, s2Var.f60584d) && this.f60585e == s2Var.f60585e && this.f60586f == s2Var.f60586f;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f60586f) + c9.f((this.f60584d.hashCode() + ((this.f60583c.hashCode() + c9.f(this.f60581a.hashCode() * 31, 31, this.f60582b)) * 31)) * 31, 31, this.f60585e);
    }

    public final String toString() {
        return "UIState(label=" + this.f60581a + ", canClickWhileDisabled=" + this.f60582b + ", onClick=" + this.f60583c + ", onDisabledClick=" + this.f60584d + ", enabled=" + this.f60585e + ", lockVisible=" + this.f60586f + ")";
    }
}
