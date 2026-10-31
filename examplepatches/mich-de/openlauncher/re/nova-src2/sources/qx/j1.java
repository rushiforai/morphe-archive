package qx;

import android.view.View;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j1 {

    /* renamed from: a, reason: collision with root package name */
    public final View f84535a;

    /* renamed from: b, reason: collision with root package name */
    public final r f84536b;

    /* renamed from: c, reason: collision with root package name */
    public final long f84537c;

    public j1(View view, r rVar, long j11) {
        this.f84535a = view;
        this.f84536b = rVar;
        this.f84537c = j11;
    }

    public final boolean a() {
        r rVar = this.f84536b;
        return (rVar.c() || rVar.f84589e) ? false : true;
    }

    public final r b() {
        return this.f84536b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j1)) {
            return false;
        }
        j1 j1Var = (j1) obj;
        return Intrinsics.b(this.f84535a, j1Var.f84535a) && Intrinsics.b(this.f84536b, j1Var.f84536b) && this.f84537c == j1Var.f84537c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f84537c) + ((this.f84536b.hashCode() + (this.f84535a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ShownAd(cachedAdView=");
        sb2.append(this.f84535a);
        sb2.append(", cachedAd=");
        sb2.append(this.f84536b);
        sb2.append(", shownTime=");
        return a2.c.i(this.f84537c, ")", sb2);
    }
}
