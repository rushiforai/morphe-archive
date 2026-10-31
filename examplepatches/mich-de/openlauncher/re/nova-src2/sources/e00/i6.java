package e00;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i6 {

    /* renamed from: a, reason: collision with root package name */
    public final String f50522a;

    /* renamed from: b, reason: collision with root package name */
    public final String f50523b;

    /* renamed from: c, reason: collision with root package name */
    public final String f50524c;

    /* renamed from: d, reason: collision with root package name */
    public final k6 f50525d;

    /* renamed from: e, reason: collision with root package name */
    public final String f50526e;

    /* renamed from: f, reason: collision with root package name */
    public final Function2 f50527f;

    public i6(String str, String str2, String str3, k6 k6Var, String str4, Function2 function2) {
        this.f50522a = str;
        this.f50523b = str2;
        this.f50524c = str3;
        this.f50525d = k6Var;
        this.f50526e = str4;
        this.f50527f = function2;
    }

    public static i6 a(i6 i6Var, k6 k6Var, String str) {
        String str2 = i6Var.f50522a;
        String str3 = i6Var.f50523b;
        String str4 = i6Var.f50524c;
        Function2 function2 = i6Var.f50527f;
        i6Var.getClass();
        return new i6(str2, str3, str4, k6Var, str, function2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i6)) {
            return false;
        }
        i6 i6Var = (i6) obj;
        return Intrinsics.b(this.f50522a, i6Var.f50522a) && Intrinsics.b(this.f50523b, i6Var.f50523b) && Intrinsics.b(this.f50524c, i6Var.f50524c) && this.f50525d == i6Var.f50525d && Intrinsics.b(this.f50526e, i6Var.f50526e) && Intrinsics.b(this.f50527f, i6Var.f50527f);
    }

    public final int hashCode() {
        return this.f50527f.hashCode() + b.c0.e((this.f50525d.hashCode() + b.c0.e(b.c0.e(this.f50522a.hashCode() * 31, 31, this.f50523b), 31, this.f50524c)) * 31, 31, this.f50526e);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("TestCase(id=", this.f50522a, ", name=", this.f50523b, ", group=");
        sbW.append(this.f50524c);
        sbW.append(", status=");
        sbW.append(this.f50525d);
        sbW.append(", message=");
        sbW.append(this.f50526e);
        sbW.append(", run=");
        sbW.append(this.f50527f);
        sbW.append(")");
        return sbW.toString();
    }

    public /* synthetic */ i6(String str, String str2, String str3, Function2 function2) {
        this(str, str2, str3, k6.f50627a, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, function2);
    }
}
