package v10;

import android.net.Uri;
import java.util.Date;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f91899a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f91900b;

    /* renamed from: c, reason: collision with root package name */
    public final Date f91901c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f91902d;

    public b(String str, Object obj, Date date, Uri uri) {
        this.f91899a = str;
        this.f91900b = obj;
        this.f91901c = date;
        this.f91902d = uri;
    }

    public final Date a() {
        return this.f91901c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f91899a, bVar.f91899a) && Intrinsics.b(this.f91900b, bVar.f91900b) && Intrinsics.b(this.f91901c, bVar.f91901c) && Intrinsics.b(this.f91902d, bVar.f91902d);
    }

    public final int hashCode() {
        return this.f91902d.hashCode() + ((this.f91901c.hashCode() + ((this.f91900b.hashCode() + (this.f91899a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "CarouselItemData(name=" + this.f91899a + ", thumbnailCoilModel=" + this.f91900b + ", time=" + this.f91901c + ", dataUri=" + this.f91902d + ")";
    }
}
