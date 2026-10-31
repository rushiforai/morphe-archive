package vk;

import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class r implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ CharSequence f92824a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ cz.b f92825b;

    public r(cz.b bVar, CharSequence charSequence) {
        this.f92825b = bVar;
        this.f92824a = charSequence;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        cz.b bVar = this.f92825b;
        return ((t) bVar.f48576d).w(bVar, this.f92824a);
    }

    public final String toString() {
        ex.a aVarD = ex.a.d();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
        aVarD.b(sb2, this);
        sb2.append(AbstractJsonLexerKt.END_LIST);
        return sb2.toString();
    }
}
