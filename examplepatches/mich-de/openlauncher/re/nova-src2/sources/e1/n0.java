package e1;

import android.view.textclassifier.TextClassification;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f51348a;

    /* renamed from: b, reason: collision with root package name */
    public final long f51349b;

    /* renamed from: c, reason: collision with root package name */
    public final TextClassification f51350c;

    public n0(CharSequence charSequence, long j11, TextClassification textClassification) {
        this.f51348a = charSequence;
        this.f51349b = j11;
        this.f51350c = textClassification;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n0)) {
            return false;
        }
        n0 n0Var = (n0) obj;
        return Intrinsics.b(this.f51348a, n0Var.f51348a) && m3.o0.b(this.f51349b, n0Var.f51349b) && Intrinsics.b(this.f51350c, n0Var.f51350c);
    }

    public final int hashCode() {
        int iHashCode = this.f51348a.hashCode() * 31;
        int i5 = m3.o0.f75945c;
        return this.f51350c.hashCode() + b.c0.d(iHashCode, 31, this.f51349b);
    }

    public final String toString() {
        return "TextClassificationResult(text=" + ((Object) this.f51348a) + ", selection=" + ((Object) m3.o0.h(this.f51349b)) + ", textClassification=" + this.f51350c + ')';
    }
}
