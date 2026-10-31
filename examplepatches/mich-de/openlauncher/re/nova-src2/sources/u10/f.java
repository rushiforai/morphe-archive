package u10;

import android.net.Uri;
import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f extends e0 {

    /* renamed from: c, reason: collision with root package name */
    public final String f90374c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f90375d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f90376e;

    public f(String str, Uri uri, ArrayList arrayList) {
        super("GridCard:".concat(str));
        this.f90374c = str;
        this.f90375d = uri;
        this.f90376e = arrayList;
    }

    @Override // u10.e0
    public final String a() {
        return this.f90374c;
    }

    @Override // u10.e0
    public final Uri b() {
        return this.f90375d;
    }

    @Override // u10.e0
    public final Function0 c() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f90374c, fVar.f90374c) && Intrinsics.b(this.f90375d, fVar.f90375d) && Intrinsics.b(this.f90376e, fVar.f90376e);
    }

    public final int hashCode() {
        return this.f90376e.hashCode() + ((this.f90375d.hashCode() + (this.f90374c.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "AppGridCard(displayName=" + this.f90374c + ", iconUri=" + this.f90375d + ", actions=" + this.f90376e + ")";
    }
}
