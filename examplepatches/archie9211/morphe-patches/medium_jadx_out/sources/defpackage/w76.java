package defpackage;

import j$.util.DesugarCollections;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w76 {
    public final Class a;
    public final Object b;
    public final Method c;
    public final List d;

    public w76(Class cls, Object obj, Method method, ArrayList arrayList) {
        this.a = cls;
        this.b = obj;
        this.c = method;
        this.d = DesugarCollections.unmodifiableList(arrayList);
    }

    public final String toString() {
        return String.format("%s.%s() %s", this.a.getName(), this.c.getName(), this.d);
    }
}
