package u10;

import android.net.Uri;
import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r0 extends e0 {

    /* renamed from: c, reason: collision with root package name */
    public final String f90418c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f90419d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f90420e;

    public r0(String str, Uri uri, ArrayList arrayList) {
        super("SearchMoreCard:".concat(str));
        this.f90418c = str;
        this.f90419d = uri;
        this.f90420e = arrayList;
    }

    @Override // u10.e0
    public final String a() {
        return this.f90418c;
    }

    @Override // u10.e0
    public final Uri b() {
        return this.f90419d;
    }

    @Override // u10.e0
    public final Function0 c() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r0)) {
            return false;
        }
        r0 r0Var = (r0) obj;
        return Intrinsics.b(this.f90418c, r0Var.f90418c) && Intrinsics.b(this.f90419d, r0Var.f90419d) && Intrinsics.b(this.f90420e, r0Var.f90420e);
    }

    public final int hashCode() {
        return this.f90420e.hashCode() + ((this.f90419d.hashCode() + (this.f90418c.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "SearchMoreCard(displayName=" + this.f90418c + ", iconUri=" + this.f90419d + ", actions=" + this.f90420e + ")";
    }
}
