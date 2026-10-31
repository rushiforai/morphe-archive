package s50;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class m implements j {

    /* renamed from: c, reason: collision with root package name */
    public final Map f86692c;

    public m(Map values) {
        Intrinsics.g(values, "values");
        b bVar = new b();
        for (Map.Entry entry : values.entrySet()) {
            String str = (String) entry.getKey();
            List list = (List) entry.getValue();
            int size = list.size();
            ArrayList arrayList = new ArrayList(size);
            for (int i5 = 0; i5 < size; i5++) {
                arrayList.add((String) list.get(i5));
            }
            bVar.put(str, arrayList);
        }
        this.f86692c = bVar;
    }

    @Override // s50.j
    public final Set a() {
        Set setEntrySet = this.f86692c.entrySet();
        Intrinsics.g(setEntrySet, "<this>");
        Set setUnmodifiableSet = Collections.unmodifiableSet(setEntrySet);
        Intrinsics.f(setUnmodifiableSet, "unmodifiableSet(...)");
        return setUnmodifiableSet;
    }

    @Override // s50.j
    public final boolean b() {
        return true;
    }

    @Override // s50.j
    public final void c(Function2 function2) {
        for (Map.Entry entry : this.f86692c.entrySet()) {
            function2.invoke((String) entry.getKey(), (List) entry.getValue());
        }
    }

    @Override // s50.j
    public final String d(String str) {
        List list = (List) this.f86692c.get(str);
        if (list != null) {
            return (String) b70.g.Y0(list);
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        if (true != jVar.b()) {
            return false;
        }
        return a().equals(jVar.a());
    }

    public final int hashCode() {
        Set setA = a();
        return setA.hashCode() + (Boolean.hashCode(true) * 961);
    }

    @Override // s50.j
    public final boolean isEmpty() {
        return this.f86692c.isEmpty();
    }
}
