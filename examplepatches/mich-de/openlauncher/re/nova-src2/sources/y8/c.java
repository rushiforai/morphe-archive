package y8;

import android.content.Context;
import android.util.DisplayMetrics;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c implements g {

    /* renamed from: a, reason: collision with root package name */
    public final Context f96841a;

    public c(Context context) {
        this.f96841a = context;
    }

    @Override // y8.g
    public final Object a(m8.h hVar) {
        DisplayMetrics displayMetrics = this.f96841a.getResources().getDisplayMetrics();
        a aVar = new a(Math.max(displayMetrics.widthPixels, displayMetrics.heightPixels));
        return new f(aVar, aVar);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof c) {
            return Intrinsics.b(this.f96841a, ((c) obj).f96841a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f96841a.hashCode();
    }
}
