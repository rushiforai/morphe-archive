package o8;

import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final BitmapDrawable f79695a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f79696b;

    public e(BitmapDrawable bitmapDrawable, boolean z11) {
        this.f79695a = bitmapDrawable;
        this.f79696b = z11;
    }

    public final Drawable a() {
        return this.f79695a;
    }

    public final boolean b() {
        return this.f79696b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f79695a.equals(eVar.f79695a) && this.f79696b == eVar.f79696b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f79696b) + (this.f79695a.hashCode() * 31);
    }
}
