package y7;

import androidx.work.impl.WorkDatabase;
import java.util.Iterator;
import java.util.UUID;

/* loaded from: classes2.dex */
public final class b extends d {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f96735b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p7.s f96736c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f96737d;

    public /* synthetic */ b(p7.s sVar, Object obj, int i5) {
        this.f96735b = i5;
        this.f96736c = sVar;
        this.f96737d = obj;
    }

    @Override // y7.d
    public final void e() {
        WorkDatabase workDatabase;
        switch (this.f96735b) {
            case 0:
                p7.s sVar = this.f96736c;
                workDatabase = sVar.f82374c;
                workDatabase.beginTransaction();
                try {
                    d.a(((UUID) this.f96737d).toString(), sVar);
                    workDatabase.setTransactionSuccessful();
                    workDatabase.endTransaction();
                    p7.l.b(sVar.f82373b, sVar.f82374c, sVar.f82376e);
                    return;
                } finally {
                    workDatabase.endTransaction();
                }
            default:
                p7.s sVar2 = this.f96736c;
                workDatabase = sVar2.f82374c;
                workDatabase.beginTransaction();
                try {
                    Iterator it = workDatabase.i().k((String) this.f96737d).iterator();
                    while (it.hasNext()) {
                        d.a((String) it.next(), sVar2);
                    }
                    workDatabase.setTransactionSuccessful();
                    workDatabase.endTransaction();
                    p7.l.b(sVar2.f82373b, workDatabase, sVar2.f82376e);
                    return;
                } catch (Throwable th2) {
                    throw th2;
                }
        }
    }
}
