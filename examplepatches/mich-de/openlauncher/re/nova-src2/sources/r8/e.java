package r8;

import android.graphics.drawable.Drawable;
import b.c0;
import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e extends f {

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f85623a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f85624b;

    /* renamed from: c, reason: collision with root package name */
    public final int f85625c;

    public e(int i5, Drawable drawable, boolean z11) {
        this.f85623a = drawable;
        this.f85624b = z11;
        this.f85625c = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f85623a, eVar.f85623a) && this.f85624b == eVar.f85624b && this.f85625c == eVar.f85625c;
    }

    public final int hashCode() {
        return c0.F(this.f85625c) + c9.f(this.f85623a.hashCode() * 31, 31, this.f85624b);
    }
}
