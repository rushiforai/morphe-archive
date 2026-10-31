package jr;

import f1.z1;
import hv.n2;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n0 extends q0 {

    /* renamed from: c, reason: collision with root package name */
    public final boolean f69709c;

    public n0(boolean z11) {
        super(false, false);
        this.f69709c = z11;
    }

    @Override // jr.q0
    public final n2 b(Function0 onEditIconPressed) {
        Intrinsics.g(onEditIconPressed, "onEditIconPressed");
        return new n2(!this.f69709c, false, false, new z1(26));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n0) && this.f69709c == ((n0) obj).f69709c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f69709c);
    }

    public final String toString() {
        return a80.m.i("Loading(isLiveMode=", ")", this.f69709c);
    }
}
