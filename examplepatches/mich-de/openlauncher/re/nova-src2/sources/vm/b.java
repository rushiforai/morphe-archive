package vm;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f92853a;

    /* renamed from: b, reason: collision with root package name */
    public final c f92854b;

    public b(Set set, c cVar) {
        this.f92853a = b(set);
        this.f92854b = cVar;
    }

    public static String b(Set set) {
        StringBuilder sb2 = new StringBuilder();
        Iterator it = set.iterator();
        while (it.hasNext()) {
            a aVar = (a) it.next();
            sb2.append(aVar.f92851a);
            sb2.append('/');
            sb2.append(aVar.f92852b);
            if (it.hasNext()) {
                sb2.append(' ');
            }
        }
        return sb2.toString();
    }

    public final String a() {
        Set setUnmodifiableSet;
        Set setUnmodifiableSet2;
        String str = this.f92853a;
        c cVar = this.f92854b;
        synchronized (((HashSet) cVar.f92857b)) {
            setUnmodifiableSet = Collections.unmodifiableSet((HashSet) cVar.f92857b);
        }
        if (setUnmodifiableSet.isEmpty()) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(' ');
        synchronized (((HashSet) cVar.f92857b)) {
            setUnmodifiableSet2 = Collections.unmodifiableSet((HashSet) cVar.f92857b);
        }
        sb2.append(b(setUnmodifiableSet2));
        return sb2.toString();
    }
}
