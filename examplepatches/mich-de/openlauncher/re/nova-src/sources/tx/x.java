package tx;

import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final TextView f90053a;

    /* renamed from: b, reason: collision with root package name */
    public final ImageView f90054b;

    /* renamed from: c, reason: collision with root package name */
    public final ImageView f90055c;

    /* renamed from: d, reason: collision with root package name */
    public final LinearLayout f90056d;

    public x(TextView textView, ImageView imageView, ImageView imageView2, LinearLayout linearLayout) {
        this.f90053a = textView;
        this.f90054b = imageView;
        this.f90055c = imageView2;
        this.f90056d = linearLayout;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Intrinsics.b(this.f90053a, xVar.f90053a) && Intrinsics.b(this.f90054b, xVar.f90054b) && Intrinsics.b(this.f90055c, xVar.f90055c) && Intrinsics.b(this.f90056d, xVar.f90056d);
    }

    public final int hashCode() {
        return this.f90056d.hashCode() + ((this.f90055c.hashCode() + ((this.f90054b.hashCode() + (this.f90053a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "ModelChipRefs(text=" + this.f90053a + ", icon=" + this.f90054b + ", chevron=" + this.f90055c + ", container=" + this.f90056d + ")";
    }
}
