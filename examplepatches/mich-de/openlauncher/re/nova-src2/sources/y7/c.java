package y7;

import androidx.work.impl.WorkDatabase;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class c extends d {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p7.s f96738b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f96739c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f96740d;

    public c(String str, p7.s sVar, boolean z11) {
        this.f96738b = sVar;
        this.f96739c = str;
        this.f96740d = z11;
    }

    @Override // y7.d
    public final void e() {
        p7.s sVar = this.f96738b;
        WorkDatabase workDatabase = sVar.f82374c;
        workDatabase.beginTransaction();
        try {
            Iterator it = workDatabase.i().j(this.f96739c).iterator();
            while (it.hasNext()) {
                d.a((String) it.next(), sVar);
            }
            workDatabase.setTransactionSuccessful();
            workDatabase.endTransaction();
            if (this.f96740d) {
                p7.l.b(sVar.f82373b, sVar.f82374c, sVar.f82376e);
            }
        } catch (Throwable th2) {
            workDatabase.endTransaction();
            throw th2;
        }
    }
}
