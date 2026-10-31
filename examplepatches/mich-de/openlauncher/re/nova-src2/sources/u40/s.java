package u40;

import android.net.Uri;
import b.c0;
import io.branch.engage.sesame_lite.internal.IdHash;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final IdHash f90619a;

    /* renamed from: b, reason: collision with root package name */
    public final String f90620b;

    /* renamed from: c, reason: collision with root package name */
    public final long f90621c;

    /* renamed from: d, reason: collision with root package name */
    public final a f90622d;

    /* renamed from: e, reason: collision with root package name */
    public final String f90623e;

    /* renamed from: f, reason: collision with root package name */
    public final Uri f90624f;

    /* renamed from: g, reason: collision with root package name */
    public final long[] f90625g;

    /* renamed from: h, reason: collision with root package name */
    public final long[] f90626h;

    /* renamed from: i, reason: collision with root package name */
    public final q f90627i;

    public s(IdHash idHash, String str, long j11, a type, String label, Uri uri, long[] jArr, long[] jArr2, q qVar) {
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(type, "type");
        Intrinsics.g(label, "label");
        this.f90619a = idHash;
        this.f90620b = str;
        this.f90621c = j11;
        this.f90622d = type;
        this.f90623e = label;
        this.f90624f = uri;
        this.f90625g = jArr;
        this.f90626h = jArr2;
        this.f90627i = qVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return Intrinsics.b(this.f90619a, sVar.f90619a) && Intrinsics.b(this.f90620b, sVar.f90620b) && this.f90621c == sVar.f90621c && this.f90622d == sVar.f90622d && Intrinsics.b(this.f90623e, sVar.f90623e) && Intrinsics.b(this.f90624f, sVar.f90624f) && Intrinsics.b(this.f90625g, sVar.f90625g) && Intrinsics.b(this.f90626h, sVar.f90626h) && Intrinsics.b(this.f90627i, sVar.f90627i);
    }

    public final int hashCode() {
        int iHashCode = this.f90619a.hashCode() * 31;
        String str = this.f90620b;
        int iE = c0.e((this.f90622d.hashCode() + c0.d((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f90621c)) * 31, 31, this.f90623e);
        Uri uri = this.f90624f;
        return this.f90627i.hashCode() + ((Arrays.hashCode(this.f90626h) + ((Arrays.hashCode(this.f90625g) + ((iE + (uri != null ? uri.hashCode() : 0)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "ShortcutAction(idHash=" + this.f90619a + ", packageName=" + this.f90620b + ", userSerial=" + this.f90621c + ", type=" + this.f90622d + ", label=" + this.f90623e + ", iconUri=" + this.f90624f + ", searchTimes=" + Arrays.toString(this.f90625g) + ", usageTimes=" + Arrays.toString(this.f90626h) + ", openParams=" + this.f90627i + ')';
    }
}
