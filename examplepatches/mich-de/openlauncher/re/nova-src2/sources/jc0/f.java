package jc0;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.logging.Logger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes5.dex */
public final class f implements x60.b, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final Logger f69443b = Logger.getLogger(f.class.getName());

    /* renamed from: c, reason: collision with root package name */
    public static final f f69444c = new f(dc0.b.f49216c);

    /* renamed from: d, reason: collision with root package name */
    public static final f f69445d = new f('L');

    /* renamed from: e, reason: collision with root package name */
    public static final f f69446e = new f('M');

    /* renamed from: f, reason: collision with root package name */
    public static final f f69447f = new f('T');

    /* renamed from: g, reason: collision with root package name */
    public static final f f69448g = new f('I');

    /* renamed from: h, reason: collision with root package name */
    public static final f f69449h = new f((char) 920);

    /* renamed from: i, reason: collision with root package name */
    public static final f f69450i = new f('N');

    /* renamed from: j, reason: collision with root package name */
    public static final f f69451j = new f('J');

    /* renamed from: a, reason: collision with root package name */
    public final x60.e f69452a;

    public f(char c11) {
        this.f69452a = new b("[" + c11 + AbstractJsonLexerKt.END_LIST, f69444c);
    }

    public final HashMap a() {
        Map mapA = this.f69452a.a();
        if (mapA == null) {
            return null;
        }
        HashMap map = new HashMap();
        for (Map.Entry entry : mapA.entrySet()) {
            map.put(new f((x60.e) entry.getKey()), entry.getValue());
        }
        return map;
    }

    public final x60.b b(x60.b bVar) {
        if (!(bVar instanceof f)) {
            return b(bVar);
        }
        return new f(((dc0.b) this.f69452a).m(((f) bVar).f69452a));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof f) {
            return Objects.equals(this.f69452a, ((f) obj).f69452a);
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hashCode(this.f69452a);
    }

    public final String toString() {
        return ((dc0.b) this.f69452a).toString();
    }

    public f(x60.e eVar) {
        this.f69452a = eVar;
    }
}
