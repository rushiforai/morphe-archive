package aq;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class m extends r {

    /* renamed from: c, reason: collision with root package name */
    public static final f f15499c = new f(2);

    /* renamed from: a, reason: collision with root package name */
    public final r f15500a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f15501b;

    public m(r rVar, int i5) {
        this.f15501b = i5;
        this.f15500a = rVar;
    }

    @Override // aq.r
    public Object a(u uVar) {
        Collection arrayList;
        switch (this.f15501b) {
            case 0:
                arrayList = new ArrayList();
                break;
            default:
                arrayList = new LinkedHashSet();
                break;
        }
        uVar.a();
        while (uVar.f()) {
            arrayList.add(this.f15500a.a(uVar));
        }
        uVar.c();
        return arrayList;
    }

    @Override // aq.r
    public void e(x xVar, Object obj) {
        xVar.a();
        Iterator it = ((Collection) obj).iterator();
        while (it.hasNext()) {
            this.f15500a.e(xVar, it.next());
        }
        ((w) xVar).s(1, 2, AbstractJsonLexerKt.END_LIST);
    }

    public final String toString() {
        return this.f15500a + ".collection()";
    }
}
