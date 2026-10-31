package rb0;

import g90.k;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

/* loaded from: classes5.dex */
public final class h implements ib0.i {

    /* renamed from: a, reason: collision with root package name */
    public LinkedList f85788a;

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f85789b;

    @Override // ib0.i
    public final boolean a() {
        return this.f85789b;
    }

    @Override // ib0.i
    public final void b() {
        if (this.f85789b) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f85789b) {
                    return;
                }
                this.f85789b = true;
                LinkedList linkedList = this.f85788a;
                ArrayList arrayList = null;
                this.f85788a = null;
                if (linkedList == null) {
                    return;
                }
                Iterator it = linkedList.iterator();
                while (it.hasNext()) {
                    try {
                        ((ib0.i) it.next()).b();
                    } catch (Throwable th2) {
                        if (arrayList == null) {
                            arrayList = new ArrayList();
                        }
                        arrayList.add(th2);
                    }
                }
                k.f0(arrayList);
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public final void c(ib0.i iVar) {
        if (iVar.a()) {
            return;
        }
        if (!this.f85789b) {
            synchronized (this) {
                try {
                    if (!this.f85789b) {
                        LinkedList linkedList = this.f85788a;
                        if (linkedList == null) {
                            linkedList = new LinkedList();
                            this.f85788a = linkedList;
                        }
                        linkedList.add(iVar);
                        return;
                    }
                } finally {
                }
            }
        }
        iVar.b();
    }
}
