package x8;

import android.graphics.drawable.Drawable;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e extends l {

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f95299a;

    /* renamed from: b, reason: collision with root package name */
    public final k f95300b;

    /* renamed from: c, reason: collision with root package name */
    public final Throwable f95301c;

    public e(Drawable drawable, k kVar, Throwable th2) {
        this.f95299a = drawable;
        this.f95300b = kVar;
        this.f95301c = th2;
    }

    @Override // x8.l
    public final Drawable a() {
        return this.f95299a;
    }

    @Override // x8.l
    public final k b() {
        return this.f95300b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f95299a, eVar.f95299a) && Intrinsics.b(this.f95300b, eVar.f95300b) && Intrinsics.b(this.f95301c, eVar.f95301c);
    }

    public final int hashCode() {
        Drawable drawable = this.f95299a;
        return this.f95301c.hashCode() + ((this.f95300b.hashCode() + ((drawable != null ? drawable.hashCode() : 0) * 31)) * 31);
    }
}
