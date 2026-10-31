package x80;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class h0 {

    /* renamed from: a, reason: collision with root package name */
    public final w f95509a;

    /* renamed from: b, reason: collision with root package name */
    public final String f95510b;

    /* renamed from: c, reason: collision with root package name */
    public final u f95511c;

    /* renamed from: d, reason: collision with root package name */
    public final k0 f95512d;

    /* renamed from: e, reason: collision with root package name */
    public final Map f95513e;

    /* renamed from: f, reason: collision with root package name */
    public g f95514f;

    public h0(w url, String method, u uVar, k0 k0Var, Map map) {
        Intrinsics.g(url, "url");
        Intrinsics.g(method, "method");
        this.f95509a = url;
        this.f95510b = method;
        this.f95511c = uVar;
        this.f95512d = k0Var;
        this.f95513e = map;
    }

    public final g a() {
        g gVar = this.f95514f;
        if (gVar != null) {
            return gVar;
        }
        g gVar2 = g.n;
        g gVarO = w20.h.o(this.f95511c);
        this.f95514f = gVarO;
        return gVarO;
    }

    public final g0 b() {
        g0 g0Var = new g0();
        g0Var.f95508e = new LinkedHashMap();
        g0Var.f95504a = this.f95509a;
        g0Var.f95505b = this.f95510b;
        g0Var.f95507d = this.f95512d;
        Map map = this.f95513e;
        g0Var.f95508e = map.isEmpty() ? new LinkedHashMap() : MapsKt.u0(map);
        g0Var.f95506c = this.f95511c.d();
        return g0Var;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Request{method=");
        sb2.append(this.f95510b);
        sb2.append(", url=");
        sb2.append(this.f95509a);
        u uVar = this.f95511c;
        if (uVar.size() != 0) {
            sb2.append(", headers=[");
            int i5 = 0;
            for (Object obj : uVar) {
                int i11 = i5 + 1;
                if (i5 < 0) {
                    ul.b.e0();
                    throw null;
                }
                Pair pair = (Pair) obj;
                String str = (String) pair.f71683a;
                String str2 = (String) pair.f71684b;
                if (i5 > 0) {
                    sb2.append(", ");
                }
                sb2.append(str);
                sb2.append(AbstractJsonLexerKt.COLON);
                sb2.append(str2);
                i5 = i11;
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
        }
        Map map = this.f95513e;
        if (!map.isEmpty()) {
            sb2.append(", tags=");
            sb2.append(map);
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
        return string;
    }
}
