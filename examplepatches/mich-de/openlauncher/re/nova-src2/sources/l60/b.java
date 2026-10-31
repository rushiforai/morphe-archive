package l60;

import java.util.ArrayList;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f74749a;

    /* renamed from: b, reason: collision with root package name */
    public final List f74750b;

    public b(ArrayList arrayList, boolean z11) {
        this.f74749a = z11;
        this.f74750b = arrayList;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Row{isHeader=");
        sb2.append(this.f74749a);
        sb2.append(", columns=");
        return fq.c.e(sb2, this.f74750b, AbstractJsonLexerKt.END_OBJ);
    }
}
