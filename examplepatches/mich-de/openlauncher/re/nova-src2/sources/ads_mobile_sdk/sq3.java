package ads_mobile_sdk;

import android.content.Context;
import android.view.ViewGroup;
import b.k9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class sq3 {

    /* renamed from: a, reason: collision with root package name */
    public final ViewGroup.LayoutParams f9644a;

    /* renamed from: b, reason: collision with root package name */
    public final int f9645b;

    /* renamed from: c, reason: collision with root package name */
    public final ViewGroup f9646c;

    /* renamed from: d, reason: collision with root package name */
    public final Context f9647d;

    public sq3(ViewGroup.LayoutParams layoutParams, int i5, ViewGroup viewGroup, Context context) {
        this.f9644a = layoutParams;
        this.f9645b = i5;
        this.f9646c = viewGroup;
        this.f9647d = context;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sq3)) {
            return false;
        }
        sq3 sq3Var = (sq3) obj;
        return Intrinsics.b(this.f9644a, sq3Var.f9644a) && this.f9645b == sq3Var.f9645b && Intrinsics.b(this.f9646c, sq3Var.f9646c) && Intrinsics.b(this.f9647d, sq3Var.f9647d);
    }

    public final int hashCode() {
        return this.f9647d.hashCode() + ((this.f9646c.hashCode() + k9.b(this.f9645b, this.f9644a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "WebViewParentLayoutInfo(layoutParams=" + this.f9644a + ", index=" + this.f9645b + ", parent=" + this.f9646c + ", originalContext=" + this.f9647d + ")";
    }
}
