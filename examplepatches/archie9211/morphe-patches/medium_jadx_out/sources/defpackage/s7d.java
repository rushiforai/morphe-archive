package defpackage;

import java.util.AbstractSet;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s7d {
    public final String a;
    public final Map b;
    public final Set c;
    public final Set d;

    public s7d(String str, Map map, AbstractSet abstractSet, AbstractSet abstractSet2) {
        abstractSet.getClass();
        this.a = str;
        this.b = map;
        this.c = abstractSet;
        this.d = abstractSet2;
    }

    public final boolean equals(Object obj) {
        Set set;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s7d)) {
            return false;
        }
        s7d s7dVar = (s7d) obj;
        if (!this.a.equals(s7dVar.a) || !this.b.equals(s7dVar.b) || !this.c.equals(s7dVar.c)) {
            return false;
        }
        Set set2 = this.d;
        if (set2 == null || (set = s7dVar.d) == null) {
            return true;
        }
        return set2.equals(set);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("\n            |TableInfo {\n            |    name = '");
        sb.append(this.a);
        sb.append("',\n            |    columns = {");
        sb.append(mk7.v(bu1.f1(this.b.values(), new lva(8))));
        sb.append("\n            |    foreignKeys = {");
        sb.append(mk7.v(this.c));
        sb.append("\n            |    indices = {");
        Set set = this.d;
        sb.append(mk7.v(set != null ? bu1.f1(set, new lva(9)) : ey3.a));
        sb.append("\n            |}\n        ");
        return nuc.C(sb.toString());
    }
}
