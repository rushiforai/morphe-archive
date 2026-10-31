package mk;

import android.os.IBinder;
import b.c0;
import java.util.Map;

/* loaded from: classes3.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f76471a;

    /* renamed from: b, reason: collision with root package name */
    public final String f76472b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f76473c;

    /* renamed from: d, reason: collision with root package name */
    public final IBinder f76474d;

    public p(String str, String str2, Map map, IBinder iBinder) {
        this.f76471a = str;
        this.f76472b = str2;
        this.f76473c = map;
        this.f76474d = iBinder;
    }

    public final boolean equals(Object obj) {
        IBinder iBinder;
        if (obj == this) {
            return true;
        }
        if (obj instanceof p) {
            p pVar = (p) obj;
            IBinder iBinder2 = pVar.f76474d;
            if (this.f76471a.equals(pVar.f76471a) && this.f76472b.equals(pVar.f76472b) && this.f76473c.equals(pVar.f76473c) && ((iBinder = this.f76474d) != null ? iBinder.equals(iBinder2) : iBinder2 == null)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = ((((this.f76471a.hashCode() ^ 1000003) * 1000003) ^ this.f76472b.hashCode()) * 1000003) ^ this.f76473c.hashCode();
        IBinder iBinder = this.f76474d;
        return (iHashCode * 1000003) ^ (iBinder == null ? 0 : iBinder.hashCode());
    }

    public final String toString() {
        String string = this.f76473c.toString();
        String strValueOf = String.valueOf(this.f76474d);
        StringBuilder sb2 = new StringBuilder("HsdpPrewarmRequest{targetAppPackageName=");
        sb2.append(this.f76471a);
        sb2.append(", referrer=");
        c0.D(sb2, this.f76472b, ", extraQueryParams=", string, ", windowToken=");
        return c0.q(sb2, strValueOf, "}");
    }
}
