package kotlin.jvm.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: classes4.dex */
public class SpreadBuilder {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f71867a;

    public SpreadBuilder(int i5) {
        this.f71867a = new ArrayList(i5);
    }

    public final void a(Object obj) {
        this.f71867a.add(obj);
    }

    public final void b(Object obj) {
        if (obj == null) {
            return;
        }
        boolean z11 = obj instanceof Object[];
        ArrayList arrayList = this.f71867a;
        if (z11) {
            Object[] objArr = (Object[]) obj;
            if (objArr.length > 0) {
                arrayList.ensureCapacity(arrayList.size() + objArr.length);
                Collections.addAll(arrayList, objArr);
                return;
            }
            return;
        }
        if (obj instanceof Collection) {
            arrayList.addAll((Collection) obj);
            return;
        }
        if (obj instanceof Iterable) {
            Iterator it = ((Iterable) obj).iterator();
            while (it.hasNext()) {
                arrayList.add(it.next());
            }
        } else {
            if (!(obj instanceof Iterator)) {
                throw new UnsupportedOperationException("Don't know how to spread " + obj.getClass());
            }
            Iterator it2 = (Iterator) obj;
            while (it2.hasNext()) {
                arrayList.add(it2.next());
            }
        }
    }
}
