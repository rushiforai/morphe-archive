package a00;

import b.c0;
import b.c9;
import cl.k0;
import e10.z2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: k, reason: collision with root package name */
    public static final b f59k = new b("Title", "Artist", 1000, false, 304, "Media Player", z2.v(2131231789, "com.teslacoilsw.launcher").toString(), "com.teslacoilsw.launcher", new c(null, null), new a(0));

    /* renamed from: a, reason: collision with root package name */
    public final String f60a;

    /* renamed from: b, reason: collision with root package name */
    public final String f61b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f63d;

    /* renamed from: e, reason: collision with root package name */
    public final long f64e;

    /* renamed from: f, reason: collision with root package name */
    public final String f65f;

    /* renamed from: g, reason: collision with root package name */
    public final String f66g;

    /* renamed from: h, reason: collision with root package name */
    public final String f67h;

    /* renamed from: i, reason: collision with root package name */
    public final c f68i;

    /* renamed from: j, reason: collision with root package name */
    public final Function1 f69j;

    public b(String str, String str2, long j11, boolean z11, long j12, String str3, String str4, String str5, c cVar, Function1 function1) {
        this.f60a = str;
        this.f61b = str2;
        this.f62c = j11;
        this.f63d = z11;
        this.f64e = j12;
        this.f65f = str3;
        this.f66g = str4;
        this.f67h = str5;
        this.f68i = cVar;
        this.f69j = function1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f60a.equals(bVar.f60a) && this.f61b.equals(bVar.f61b) && this.f62c == bVar.f62c && this.f63d == bVar.f63d && k0.q(this.f64e, bVar.f64e) && Intrinsics.b(this.f65f, bVar.f65f) && Intrinsics.b(this.f66g, bVar.f66g) && this.f67h.equals(bVar.f67h) && this.f68i.equals(bVar.f68i) && this.f69j.equals(bVar.f69j);
    }

    public final int hashCode() {
        return this.f69j.hashCode() + ((this.f68i.hashCode() + c0.e(c0.e(c0.e((k0.F(this.f64e) + c9.f(c0.d(c0.e(this.f60a.hashCode() * 31, 31, this.f61b), 31, this.f62c), 31, this.f63d)) * 31, 31, this.f65f), 31, this.f66g), 31, this.f67h)) * 31);
    }

    public final String toString() {
        String strU = k0.U(this.f64e);
        StringBuilder sbW = c0.w("Media(songTitle=", this.f60a, ", songArtist=", this.f61b, ", duration=");
        sbW.append(this.f62c);
        sbW.append(", isPlaying=");
        sbW.append(this.f63d);
        c0.D(sbW, ", controls=", strU, ", appTitle=", this.f65f);
        c0.D(sbW, ", appIconUri=", this.f66g, ", packageName=", this.f67h);
        sbW.append(", activeRoute=");
        sbW.append(this.f68i);
        sbW.append(", getBitmap=");
        sbW.append(this.f69j);
        sbW.append(")");
        return sbW.toString();
    }
}
