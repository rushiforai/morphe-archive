package ads_mobile_sdk;

import android.graphics.Rect;
import b.k9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class qo3 {

    /* renamed from: a, reason: collision with root package name */
    public final so3 f8762a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f8763b;

    /* renamed from: c, reason: collision with root package name */
    public final int f8764c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f8765d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f8766e;

    /* renamed from: f, reason: collision with root package name */
    public final Rect f8767f;

    /* renamed from: g, reason: collision with root package name */
    public final Rect f8768g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f8769h;

    /* renamed from: i, reason: collision with root package name */
    public final Rect f8770i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f8771j;

    /* renamed from: k, reason: collision with root package name */
    public final Rect f8772k;

    public qo3(so3 so3Var, boolean z11, int i5, Rect rect, boolean z12, Rect rect2, Rect rect3, boolean z13, Rect rect4, boolean z14, Rect rect5) {
        this.f8762a = so3Var;
        this.f8763b = z11;
        this.f8764c = i5;
        this.f8765d = rect;
        this.f8766e = z12;
        this.f8767f = rect2;
        this.f8768g = rect3;
        this.f8769h = z13;
        this.f8770i = rect4;
        this.f8771j = z14;
        this.f8772k = rect5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qo3)) {
            return false;
        }
        qo3 qo3Var = (qo3) obj;
        return this.f8762a == qo3Var.f8762a && this.f8763b == qo3Var.f8763b && this.f8764c == qo3Var.f8764c && Intrinsics.b(this.f8765d, qo3Var.f8765d) && this.f8766e == qo3Var.f8766e && Intrinsics.b(this.f8767f, qo3Var.f8767f) && Intrinsics.b(this.f8768g, qo3Var.f8768g) && this.f8769h == qo3Var.f8769h && Intrinsics.b(this.f8770i, qo3Var.f8770i) && this.f8771j == qo3Var.f8771j && Intrinsics.b(this.f8772k, qo3Var.f8772k);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.f8762a.hashCode() * 31;
        boolean z11 = this.f8763b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iHashCode2 = (this.f8765d.hashCode() + k9.b(this.f8764c, (iHashCode + i5) * 31)) * 31;
        boolean z12 = this.f8766e;
        int i11 = z12;
        if (z12 != 0) {
            i11 = 1;
        }
        int iHashCode3 = (this.f8768g.hashCode() + ((this.f8767f.hashCode() + ((iHashCode2 + i11) * 31)) * 31)) * 31;
        boolean z13 = this.f8769h;
        int i12 = z13;
        if (z13 != 0) {
            i12 = 1;
        }
        int iHashCode4 = (this.f8770i.hashCode() + ((iHashCode3 + i12) * 31)) * 31;
        boolean z14 = this.f8771j;
        return this.f8772k.hashCode() + ((iHashCode4 + (z14 ? 1 : z14 ? 1 : 0)) * 31);
    }

    public final String toString() {
        return "ViewabilityEvent(viewabilityUpdateEvent=" + this.f8762a + ", isVisible=" + this.f8763b + ", windowVisibility=" + this.f8764c + ", adPosition=" + this.f8765d + ", isAttachedToWindow=" + this.f8766e + ", screenPosition=" + this.f8767f + ", globalVisibleBox=" + this.f8768g + ", globalVisibleBoxVisible=" + this.f8769h + ", localVisibleBox=" + this.f8770i + ", localVisibleBoxVisible=" + this.f8771j + ", hitRect=" + this.f8772k + ")";
    }
}
