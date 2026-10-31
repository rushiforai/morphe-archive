package m3;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class d implements Appendable {

    /* renamed from: a, reason: collision with root package name */
    public final StringBuilder f75847a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f75848b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f75849c;

    public d() {
        this.f75847a = new StringBuilder(16);
        this.f75848b = new ArrayList();
        this.f75849c = new ArrayList();
        new ArrayList();
    }

    public final void a(g0 g0Var, int i5, int i11) {
        this.f75849c.add(new c(g0Var, i5, i11, 8));
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence) {
        if (charSequence instanceof g) {
            c((g) charSequence);
            return this;
        }
        this.f75847a.append(charSequence);
        return this;
    }

    public final void b(String str) {
        this.f75847a.append(str);
    }

    public final void c(g gVar) {
        StringBuilder sb2 = this.f75847a;
        int length = sb2.length();
        sb2.append(gVar.f75880b);
        List list = gVar.f75879a;
        if (list != null) {
            int size = list.size();
            for (int i5 = 0; i5 < size; i5++) {
                e eVar = (e) list.get(i5);
                this.f75849c.add(new c(eVar.f75852a, eVar.f75853b + length, eVar.f75854c + length, eVar.f75855d));
            }
        }
    }

    public final void d(Function1 function1) {
        ArrayList arrayList = this.f75849c;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            e eVar = (e) function1.invoke(((c) arrayList.get(i5)).a(Integer.MIN_VALUE));
            arrayList.set(i5, new c(eVar.f75852a, eVar.f75853b, eVar.f75854c, eVar.f75855d));
        }
    }

    public final void e() {
        ArrayList arrayList = this.f75848b;
        if (arrayList.isEmpty()) {
            s3.a.c("Nothing to pop.");
        }
        ((c) arrayList.remove(arrayList.size() - 1)).f75844c = this.f75847a.length();
    }

    public final void f(int i5) {
        ArrayList arrayList = this.f75848b;
        if (i5 >= arrayList.size()) {
            s3.a.c(i5 + " should be less than " + arrayList.size());
        }
        while (arrayList.size() - 1 >= i5) {
            e();
        }
    }

    public final int g(l lVar) {
        c cVar = new c(lVar, this.f75847a.length(), 0, 12);
        this.f75848b.add(cVar);
        this.f75849c.add(cVar);
        return r5.size() - 1;
    }

    public final int h(g0 g0Var) {
        c cVar = new c(g0Var, this.f75847a.length(), 0, 12);
        this.f75848b.add(cVar);
        this.f75849c.add(cVar);
        return r5.size() - 1;
    }

    public final g i() {
        StringBuilder sb2 = this.f75847a;
        String string = sb2.toString();
        ArrayList arrayList = this.f75849c;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            arrayList2.add(((c) arrayList.get(i5)).a(sb2.length()));
        }
        return new g(string, arrayList2);
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence, int i5, int i11) {
        boolean z11 = charSequence instanceof g;
        StringBuilder sb2 = this.f75847a;
        if (z11) {
            g gVar = (g) charSequence;
            int length = sb2.length();
            sb2.append((CharSequence) gVar.f75880b, i5, i11);
            List listA = h.a(gVar, i5, i11, null);
            if (listA != null) {
                int size = listA.size();
                for (int i12 = 0; i12 < size; i12++) {
                    e eVar = (e) listA.get(i12);
                    this.f75849c.add(new c(eVar.f75852a, eVar.f75853b + length, eVar.f75854c + length, eVar.f75855d));
                }
            }
            return this;
        }
        sb2.append(charSequence, i5, i11);
        return this;
    }

    public d(g gVar) {
        this();
        c(gVar);
    }

    @Override // java.lang.Appendable
    public final Appendable append(char c11) {
        this.f75847a.append(c11);
        return this;
    }
}
