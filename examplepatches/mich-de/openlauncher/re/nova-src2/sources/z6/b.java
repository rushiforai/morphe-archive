package z6;

import b.c0;
import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f98256a;

    /* renamed from: b, reason: collision with root package name */
    public final String f98257b;

    /* renamed from: c, reason: collision with root package name */
    public final String f98258c;

    /* renamed from: d, reason: collision with root package name */
    public final List f98259d;

    /* renamed from: e, reason: collision with root package name */
    public final List f98260e;

    public b(String str, String str2, List columnNames, String str3, List referenceColumnNames) {
        Intrinsics.g(columnNames, "columnNames");
        Intrinsics.g(referenceColumnNames, "referenceColumnNames");
        this.f98256a = str;
        this.f98257b = str2;
        this.f98258c = str3;
        this.f98259d = columnNames;
        this.f98260e = referenceColumnNames;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (Intrinsics.b(this.f98256a, bVar.f98256a) && Intrinsics.b(this.f98257b, bVar.f98257b) && Intrinsics.b(this.f98258c, bVar.f98258c) && Intrinsics.b(this.f98259d, bVar.f98259d)) {
            return Intrinsics.b(this.f98260e, bVar.f98260e);
        }
        return false;
    }

    public final int hashCode() {
        return this.f98260e.hashCode() + u4.c(c0.e(c0.e(this.f98256a.hashCode() * 31, 31, this.f98257b), 31, this.f98258c), 31, this.f98259d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ForeignKey{referenceTable='");
        sb2.append(this.f98256a);
        sb2.append("', onDelete='");
        sb2.append(this.f98257b);
        sb2.append(" +', onUpdate='");
        sb2.append(this.f98258c);
        sb2.append("', columnNames=");
        sb2.append(this.f98259d);
        sb2.append(", referenceColumnNames=");
        return fq.c.e(sb2, this.f98260e, AbstractJsonLexerKt.END_OBJ);
    }
}
