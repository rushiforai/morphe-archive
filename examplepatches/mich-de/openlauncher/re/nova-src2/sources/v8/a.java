package v8;

import android.graphics.Bitmap;
import b.c9;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Bitmap f92203a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f92204b;

    public a(Bitmap bitmap, Map map) {
        this.f92203a = bitmap;
        this.f92204b = map;
    }

    public final Bitmap a() {
        return this.f92203a;
    }

    public final Map b() {
        return this.f92204b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f92203a, aVar.f92203a) && Intrinsics.b(this.f92204b, aVar.f92204b);
    }

    public final int hashCode() {
        return this.f92204b.hashCode() + (this.f92203a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Value(bitmap=");
        sb2.append(this.f92203a);
        sb2.append(", extras=");
        return c9.l(sb2, this.f92204b, ')');
    }
}
