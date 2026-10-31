package vk;

import java.io.Serializable;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class n implements m, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final List f92821a;

    public n(List list) {
        this.f92821a = list;
    }

    @Override // vk.m
    public final boolean apply(Object obj) {
        int i5 = 0;
        while (true) {
            List list = this.f92821a;
            if (i5 >= list.size()) {
                return true;
            }
            if (!((m) list.get(i5)).apply(obj)) {
                return false;
            }
            i5++;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof n) {
            return this.f92821a.equals(((n) obj).f92821a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f92821a.hashCode() + 306654252;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Predicates.and(");
        boolean z11 = true;
        for (Object obj : this.f92821a) {
            if (!z11) {
                sb2.append(AbstractJsonLexerKt.COMMA);
            }
            sb2.append(obj);
            z11 = false;
        }
        sb2.append(')');
        return sb2.toString();
    }
}
