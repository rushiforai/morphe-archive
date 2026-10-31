package xb0;

import g90.k;
import ib0.i;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class c implements i {

    /* renamed from: a, reason: collision with root package name */
    public HashSet f95756a;

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f95757b;

    @Override // ib0.i
    public final boolean a() {
        return this.f95757b;
    }

    @Override // ib0.i
    public final void b() {
        if (this.f95757b) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f95757b) {
                    return;
                }
                this.f95757b = true;
                HashSet hashSet = this.f95756a;
                ArrayList arrayList = null;
                this.f95756a = null;
                if (hashSet == null) {
                    return;
                }
                Iterator it = hashSet.iterator();
                while (it.hasNext()) {
                    try {
                        ((i) it.next()).b();
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

    public final void c(i iVar) {
        if (iVar.a()) {
            return;
        }
        if (!this.f95757b) {
            synchronized (this) {
                try {
                    if (!this.f95757b) {
                        if (this.f95756a == null) {
                            this.f95756a = new HashSet(4);
                        }
                        this.f95756a.add(iVar);
                        return;
                    }
                } finally {
                }
            }
        }
        iVar.b();
    }

    public final void d(i iVar) {
        HashSet hashSet;
        if (this.f95757b) {
            return;
        }
        synchronized (this) {
            if (!this.f95757b && (hashSet = this.f95756a) != null) {
                boolean zRemove = hashSet.remove(iVar);
                if (zRemove) {
                    iVar.b();
                }
            }
        }
    }
}
