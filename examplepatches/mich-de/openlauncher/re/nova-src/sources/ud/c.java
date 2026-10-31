package ud;

import android.content.Context;
import b.c0;

/* loaded from: classes.dex */
public final class c extends d {

    /* renamed from: a, reason: collision with root package name */
    public final Context f90795a;

    /* renamed from: b, reason: collision with root package name */
    public final de.a f90796b;

    /* renamed from: c, reason: collision with root package name */
    public final de.a f90797c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90798d;

    public c(Context context, de.a aVar, de.a aVar2, String str) {
        if (context == null) {
            throw new NullPointerException("Null applicationContext");
        }
        this.f90795a = context;
        if (aVar == null) {
            throw new NullPointerException("Null wallClock");
        }
        this.f90796b = aVar;
        if (aVar2 == null) {
            throw new NullPointerException("Null monotonicClock");
        }
        this.f90797c = aVar2;
        if (str == null) {
            throw new NullPointerException("Null backendName");
        }
        this.f90798d = str;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof d) {
            c cVar = (c) ((d) obj);
            if (this.f90795a.equals(cVar.f90795a) && this.f90796b.equals(cVar.f90796b) && this.f90797c.equals(cVar.f90797c) && this.f90798d.equals(cVar.f90798d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((((((this.f90795a.hashCode() ^ 1000003) * 1000003) ^ this.f90796b.hashCode()) * 1000003) ^ this.f90797c.hashCode()) * 1000003) ^ this.f90798d.hashCode();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CreationContext{applicationContext=");
        sb2.append(this.f90795a);
        sb2.append(", wallClock=");
        sb2.append(this.f90796b);
        sb2.append(", monotonicClock=");
        sb2.append(this.f90797c);
        sb2.append(", backendName=");
        return c0.q(sb2, this.f90798d, "}");
    }
}
