package k2;

import androidx.compose.ui.graphics.Canvas;
import kotlin.jvm.internal.Intrinsics;
import y3.n;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public y3.c f70861a;

    /* renamed from: b, reason: collision with root package name */
    public n f70862b;

    /* renamed from: c, reason: collision with root package name */
    public Canvas f70863c;

    /* renamed from: d, reason: collision with root package name */
    public long f70864d;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f70861a, aVar.f70861a) && this.f70862b == aVar.f70862b && Intrinsics.b(this.f70863c, aVar.f70863c) && h2.e.a(this.f70864d, aVar.f70864d);
    }

    public final int hashCode() {
        return Long.hashCode(this.f70864d) + ((this.f70863c.hashCode() + ((this.f70862b.hashCode() + (this.f70861a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "DrawParams(density=" + this.f70861a + ", layoutDirection=" + this.f70862b + ", canvas=" + this.f70863c + ", size=" + ((Object) h2.e.f(this.f70864d)) + ')';
    }
}
