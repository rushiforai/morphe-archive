package ew;

import b.u4;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* loaded from: classes4.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public static final Set f53055a = kotlin.collections.c.f1(new String[]{"BE", "BR", "CH", "DE", "ES", "ID", "IT", "MX", "NL", "NO", "PL", "RU", "SE"});

    public static final a a(a aVar) {
        a aVar2 = new a(aVar.f53031a, aVar.f53032b, aVar.f53033c, aVar.f53034d, aVar.f53035e, aVar.f53036f, aVar.f53037g);
        String strM = aVar.f53036f;
        if (strM != null) {
            String str = aVar.f53034d;
            if (str != null) {
                strM = u4.m(str, ", ", strM);
            }
            aVar2.f53034d = strM;
        }
        return aVar2;
    }

    public static final d b(k kVar, j jVar) {
        List list = kVar.f53054a;
        Object obj = null;
        if (list == null) {
            return null;
        }
        Iterator it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Object next = it.next();
            if (((d) next).f53042c.contains(jVar.f53052a)) {
                obj = next;
                break;
            }
        }
        return (d) obj;
    }
}
