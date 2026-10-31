package f10;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final String f54219a;

    /* renamed from: b, reason: collision with root package name */
    public final CharSequence f54220b;

    /* renamed from: c, reason: collision with root package name */
    public final CharSequence f54221c;

    /* renamed from: d, reason: collision with root package name */
    public final int f54222d;

    /* renamed from: e, reason: collision with root package name */
    public final Drawable f54223e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f54224f;

    public x(String str, CharSequence charSequence, CharSequence charSequence2, int i5, LayerDrawable layerDrawable, int i11) {
        charSequence2 = (i11 & 4) != 0 ? null : charSequence2;
        i5 = (i11 & 8) != 0 ? 0 : i5;
        layerDrawable = (i11 & 16) != 0 ? null : layerDrawable;
        this.f54219a = str;
        this.f54220b = charSequence;
        this.f54221c = charSequence2;
        this.f54222d = i5;
        this.f54223e = layerDrawable;
        this.f54224f = (layerDrawable == null && i5 == 0) ? false : true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Intrinsics.b(this.f54219a, xVar.f54219a) && Intrinsics.b(this.f54220b, xVar.f54220b) && Intrinsics.b(this.f54221c, xVar.f54221c) && this.f54222d == xVar.f54222d && Intrinsics.b(this.f54223e, xVar.f54223e);
    }

    public final int hashCode() {
        int iHashCode = (this.f54220b.hashCode() + (this.f54219a.hashCode() * 31)) * 31;
        CharSequence charSequence = this.f54221c;
        int iA = u4.a(this.f54222d, (iHashCode + (charSequence == null ? 0 : charSequence.hashCode())) * 31, 31);
        Drawable drawable = this.f54223e;
        return iA + (drawable != null ? drawable.hashCode() : 0);
    }

    public final String toString() {
        return "SummaryListRowEntry(value=" + this.f54219a + ", title=" + ((Object) this.f54220b) + ", summary=" + ((Object) this.f54221c) + ", iconResId=" + this.f54222d + ", iconDrawable=" + this.f54223e + ")";
    }
}
