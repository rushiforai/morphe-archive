package x3;

import h6.c1;
import java.util.ArrayList;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: b, reason: collision with root package name */
    public static final l f95020b = new l(0);

    /* renamed from: c, reason: collision with root package name */
    public static final l f95021c = new l(1);

    /* renamed from: d, reason: collision with root package name */
    public static final l f95022d = new l(2);

    /* renamed from: a, reason: collision with root package name */
    public final int f95023a;

    public l(int i5) {
        this.f95023a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof l) {
            return this.f95023a == ((l) obj).f95023a;
        }
        return false;
    }

    public final int hashCode() {
        return this.f95023a;
    }

    public final String toString() {
        int i5 = this.f95023a;
        if (i5 == 0) {
            return "TextDecoration.None";
        }
        ArrayList arrayList = new ArrayList();
        if ((i5 & 1) != 0) {
            arrayList.add("Underline");
        }
        if ((i5 & 2) != 0) {
            arrayList.add("LineThrough");
        }
        if (arrayList.size() != 1) {
            return c1.t(new StringBuilder("TextDecoration["), a4.b.b(arrayList, ", ", null, 62), AbstractJsonLexerKt.END_LIST);
        }
        return "TextDecoration." + ((String) arrayList.get(0));
    }
}
