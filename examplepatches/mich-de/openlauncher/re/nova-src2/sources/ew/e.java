package ew;

import android.text.SpannableString;
import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final SpannableString f53043a;

    /* renamed from: b, reason: collision with root package name */
    public final SpannableString f53044b;

    /* renamed from: c, reason: collision with root package name */
    public final String f53045c;

    public e(SpannableString spannableString, SpannableString spannableString2, String str) {
        this.f53043a = spannableString;
        this.f53044b = spannableString2;
        this.f53045c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f53043a, eVar.f53043a) && Intrinsics.b(this.f53044b, eVar.f53044b) && Intrinsics.b(this.f53045c, eVar.f53045c);
    }

    public final int hashCode() {
        return this.f53045c.hashCode() + ((this.f53044b.hashCode() + (this.f53043a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AutocompletePrediction(primaryText=");
        sb2.append((Object) this.f53043a);
        sb2.append(", secondaryText=");
        sb2.append((Object) this.f53044b);
        sb2.append(", placeId=");
        return c0.q(sb2, this.f53045c, ")");
    }
}
