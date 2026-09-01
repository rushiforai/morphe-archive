package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzqh;
import j$.util.Objects;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jcg extends ydg {
    public static final Set g;
    public final fcg a;
    public final ecg b;
    public final hcg c;
    public final gcg d;
    public final bzf e;
    public final qvg f;

    static {
        try {
            g = (Set) new s7g().a();
        } catch (Exception e) {
            throw new zzqh(e);
        }
    }

    public jcg(fcg fcgVar, ecg ecgVar, hcg hcgVar, bzf bzfVar, gcg gcgVar, qvg qvgVar) {
        this.a = fcgVar;
        this.b = ecgVar;
        this.c = hcgVar;
        this.e = bzfVar;
        this.d = gcgVar;
        this.f = qvgVar;
    }

    public static ing b() {
        ing ingVar = new ing();
        ingVar.a = null;
        ingVar.b = null;
        ingVar.c = null;
        ingVar.d = null;
        ingVar.e = gcg.d;
        ingVar.f = null;
        return ingVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.d != gcg.d;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof jcg)) {
            return false;
        }
        jcg jcgVar = (jcg) obj;
        return jcgVar.a == this.a && jcgVar.b == this.b && jcgVar.c == this.c && Objects.equals(jcgVar.e, this.e) && jcgVar.d == this.d && Objects.equals(jcgVar.f, this.f);
    }

    public final int hashCode() {
        return Objects.hash(jcg.class, this.a, this.b, this.c, this.e, this.d, this.f);
    }

    public final String toString() {
        return String.format("EciesParameters(curveType=%s, hashType=%s, pointFormat=%s, demParameters=%s, variant=%s, salt=%s)", this.a, this.b, this.c, this.e, this.d, this.f);
    }
}
