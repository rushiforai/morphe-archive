package gg;

import android.content.Context;
import android.os.Bundle;
import b.k9;
import bg.c;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Context f57672a;

    /* renamed from: b, reason: collision with root package name */
    public final List f57673b;

    /* renamed from: c, reason: collision with root package name */
    public final Bundle f57674c;

    /* renamed from: d, reason: collision with root package name */
    public final c f57675d;

    public a(Context context, List list, Bundle networkExtras, c cVar) {
        Intrinsics.g(networkExtras, "networkExtras");
        this.f57672a = context;
        this.f57673b = list;
        this.f57674c = networkExtras;
        this.f57675d = cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f57672a, aVar.f57672a) && Intrinsics.b(this.f57673b, aVar.f57673b) && Intrinsics.b(this.f57674c, aVar.f57674c) && Intrinsics.b(this.f57675d, aVar.f57675d);
    }

    public final int hashCode() {
        int iHashCode = (this.f57674c.hashCode() + k9.d(this.f57672a.hashCode() * 31, this.f57673b)) * 31;
        c cVar = this.f57675d;
        return iHashCode + (cVar == null ? 0 : cVar.f17879e.hashCode());
    }

    public final String toString() {
        return "RtbSignalData(context=" + this.f57672a + ", configurations=" + this.f57673b + ", networkExtras=" + this.f57674c + ", adSize=" + this.f57675d + ")";
    }
}
