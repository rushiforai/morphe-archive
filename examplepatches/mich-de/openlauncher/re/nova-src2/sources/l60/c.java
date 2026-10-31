package l60;

import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final List f74751a;

    public c(List list) {
        this.f74751a = list;
    }

    public final String toString() {
        return fq.c.e(new StringBuilder("Table{rows="), this.f74751a, AbstractJsonLexerKt.END_OBJ);
    }
}
