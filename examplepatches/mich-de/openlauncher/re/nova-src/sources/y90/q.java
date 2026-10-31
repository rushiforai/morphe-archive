package y90;

import ba0.w;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;

/* loaded from: classes5.dex */
public final class q implements ea0.a {

    /* renamed from: a, reason: collision with root package name */
    public final char f97092a;

    /* renamed from: b, reason: collision with root package name */
    public int f97093b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedList f97094c = new LinkedList();

    public q(char c11) {
        this.f97092a = c11;
    }

    @Override // ea0.a
    public final int a(d dVar, d dVar2) {
        ea0.a aVar;
        int i5 = dVar.f97023g;
        LinkedList linkedList = this.f97094c;
        Iterator it = linkedList.iterator();
        while (true) {
            if (!it.hasNext()) {
                aVar = (ea0.a) linkedList.getFirst();
                break;
            }
            aVar = (ea0.a) it.next();
            if (aVar.c() <= i5) {
                break;
            }
        }
        return aVar.a(dVar, dVar2);
    }

    @Override // ea0.a
    public final char b() {
        return this.f97092a;
    }

    @Override // ea0.a
    public final int c() {
        return this.f97093b;
    }

    @Override // ea0.a
    public final char d() {
        return this.f97092a;
    }

    @Override // ea0.a
    public final void e(w wVar, w wVar2, int i5) {
        ea0.a aVar;
        LinkedList linkedList = this.f97094c;
        Iterator it = linkedList.iterator();
        while (true) {
            if (!it.hasNext()) {
                aVar = (ea0.a) linkedList.getFirst();
                break;
            } else {
                aVar = (ea0.a) it.next();
                if (aVar.c() <= i5) {
                    break;
                }
            }
        }
        aVar.e(wVar, wVar2, i5);
    }

    public final void f(ea0.a aVar) {
        int iC = aVar.c();
        LinkedList linkedList = this.f97094c;
        ListIterator listIterator = linkedList.listIterator();
        while (listIterator.hasNext()) {
            int iC2 = ((ea0.a) listIterator.next()).c();
            if (iC > iC2) {
                listIterator.previous();
                listIterator.add(aVar);
                return;
            } else if (iC == iC2) {
                throw new IllegalArgumentException("Cannot add two delimiter processors for char '" + this.f97092a + "' and minimum length " + iC);
            }
        }
        linkedList.add(aVar);
        this.f97093b = iC;
    }
}
