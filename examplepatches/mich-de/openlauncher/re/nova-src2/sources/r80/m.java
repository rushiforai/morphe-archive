package r80;

import android.content.Context;
import b.c9;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final Context f85694a;

    /* renamed from: b, reason: collision with root package name */
    public final lm.e f85695b;

    /* renamed from: c, reason: collision with root package name */
    public final vm.c f85696c;

    public m(Context context, lm.e eVar, vm.c cVar) {
        this.f85694a = context;
        this.f85695b = eVar;
        this.f85696c = cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return this.f85694a.equals(mVar.f85694a) && this.f85695b.equals(mVar.f85695b) && this.f85696c.equals(mVar.f85696c);
    }

    public final int hashCode() {
        return this.f85696c.hashCode() + c9.f((this.f85695b.hashCode() + (this.f85694a.hashCode() * 31)) * 31, 31, true);
    }

    public final String toString() {
        return "SesameLiteConfig(context=" + this.f85694a + ", logger=" + this.f85695b + ", ignoreHostPackage=true, userHandleDataSource=" + this.f85696c + ")";
    }
}
