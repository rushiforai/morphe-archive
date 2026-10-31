package p20;

import java.util.Iterator;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: b, reason: collision with root package name */
    public static final d f82014b = new d();

    /* renamed from: a, reason: collision with root package name */
    public final Map f82015a;

    public e(Map map) {
        this.f82015a = map;
    }

    public final String a() {
        Object obj;
        Iterator it = this.f82015a.entrySet().iterator();
        if (it.hasNext()) {
            Object next = it.next();
            if (it.hasNext()) {
                int iAbs = Math.abs(((Number) ((Map.Entry) next).getKey()).intValue() - 64);
                do {
                    Object next2 = it.next();
                    int iAbs2 = Math.abs(((Number) ((Map.Entry) next2).getKey()).intValue() - 64);
                    if (iAbs > iAbs2) {
                        next = next2;
                        iAbs = iAbs2;
                    }
                } while (it.hasNext());
            }
            obj = next;
        } else {
            obj = null;
        }
        Intrinsics.d(obj);
        return (String) ((Map.Entry) obj).getValue();
    }
}
