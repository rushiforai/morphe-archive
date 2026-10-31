package ads_mobile_sdk;

import android.graphics.Point;
import android.graphics.Rect;
import b.c0;
import b.k9;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class uw2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f10504a;

    /* renamed from: b, reason: collision with root package name */
    public final int f10505b;

    /* renamed from: c, reason: collision with root package name */
    public final int f10506c;

    /* renamed from: d, reason: collision with root package name */
    public final int f10507d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f10508e;

    /* renamed from: f, reason: collision with root package name */
    public final lu f10509f;

    /* renamed from: g, reason: collision with root package name */
    public final Rect f10510g;

    /* renamed from: h, reason: collision with root package name */
    public final Pair f10511h;

    /* renamed from: i, reason: collision with root package name */
    public final Pair f10512i;

    public uw2(int i5, int i11, int i12, int i13, boolean z11, lu closeButtonPosition, Rect rect, Pair pair, Pair pair2) {
        Intrinsics.g(closeButtonPosition, "closeButtonPosition");
        this.f10504a = i5;
        this.f10505b = i11;
        this.f10506c = i12;
        this.f10507d = i13;
        this.f10508e = z11;
        this.f10509f = closeButtonPosition;
        this.f10510g = rect;
        this.f10511h = pair;
        this.f10512i = pair2;
    }

    public final Point a() {
        Rect rect = this.f10510g;
        int i5 = rect.left + this.f10506c;
        int i11 = rect.top + this.f10507d;
        if (!this.f10508e) {
            Pair pair = this.f10512i;
            int iIntValue = ((Number) pair.f71683a).intValue();
            int iIntValue2 = ((Number) pair.f71684b).intValue();
            int iIntValue3 = ((Number) this.f10511h.f71683a).intValue();
            if (i5 < 0) {
                i5 = 0;
            } else {
                int i12 = this.f10504a;
                if (i5 + i12 > iIntValue3) {
                    i5 = iIntValue3 - i12;
                }
            }
            if (i11 < iIntValue) {
                i11 = iIntValue;
            } else {
                int i13 = this.f10505b;
                if (i11 + i13 > iIntValue2) {
                    i11 = iIntValue2 - i13;
                }
            }
        }
        return new Point(i5, i11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uw2)) {
            return false;
        }
        uw2 uw2Var = (uw2) obj;
        return this.f10504a == uw2Var.f10504a && this.f10505b == uw2Var.f10505b && this.f10506c == uw2Var.f10506c && this.f10507d == uw2Var.f10507d && this.f10508e == uw2Var.f10508e && this.f10509f == uw2Var.f10509f && Intrinsics.b(this.f10510g, uw2Var.f10510g) && Intrinsics.b(this.f10511h, uw2Var.f10511h) && Intrinsics.b(this.f10512i, uw2Var.f10512i);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.f10507d, k9.b(this.f10506c, k9.b(this.f10505b, Integer.hashCode(this.f10504a) * 31)));
        boolean z11 = this.f10508e;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return this.f10512i.hashCode() + ((this.f10511h.hashCode() + ((this.f10510g.hashCode() + ((this.f10509f.hashCode() + ((iB + i5) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbT = c0.t(this.f10504a, "ResizeParams(widthDips=", ", heightDips=", this.f10505b, ", offsetXDips=");
        c0.A(sbT, this.f10506c, ", offsetYDips=", this.f10507d, ", allowOffScreen=");
        sbT.append(this.f10508e);
        sbT.append(", closeButtonPosition=");
        sbT.append(this.f10509f);
        sbT.append(", originalAdPosition=");
        sbT.append(this.f10510g);
        sbT.append(", activityWindowDimensions=");
        sbT.append(this.f10511h);
        sbT.append(", activityVerticalLimits=");
        sbT.append(this.f10512i);
        sbT.append(")");
        return sbT.toString();
    }
}
