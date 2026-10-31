package kw;

import b.c9;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c3 extends d3 {

    /* renamed from: a, reason: collision with root package name */
    public final int f72341a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f72342b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f72343c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f72344d;

    public c3(int i5, Integer num, boolean z11, Function0 function0) {
        this.f72341a = i5;
        this.f72342b = num;
        this.f72343c = z11;
        this.f72344d = function0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c3)) {
            return false;
        }
        c3 c3Var = (c3) obj;
        return this.f72341a == c3Var.f72341a && Intrinsics.b(this.f72342b, c3Var.f72342b) && this.f72343c == c3Var.f72343c && Intrinsics.b(this.f72344d, c3Var.f72344d);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f72341a) * 31;
        Integer num = this.f72342b;
        int iF = c9.f((iHashCode + (num == null ? 0 : num.hashCode())) * 31, 31, this.f72343c);
        Function0 function0 = this.f72344d;
        return iF + (function0 != null ? function0.hashCode() : 0);
    }

    public final String toString() {
        return "Trailing(idRes=" + this.f72341a + ", contentDescription=" + this.f72342b + ", isTintable=" + this.f72343c + ", onClick=" + this.f72344d + ")";
    }

    public /* synthetic */ c3(int i5, boolean z11, n0.w wVar, int i11) {
        this(i5, (Integer) null, z11, (i11 & 8) != 0 ? null : wVar);
    }
}
