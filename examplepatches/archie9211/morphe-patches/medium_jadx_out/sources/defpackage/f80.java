package defpackage;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f80 extends jud {
    public static final e80 c = new e80();
    public final Class a;
    public final lud b;

    public f80(ch5 ch5Var, jud judVar, Class cls) {
        this.b = new lud(ch5Var, judVar, cls, 1);
        this.a = cls;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        ArrayList arrayList = new ArrayList();
        gd6Var.f();
        while (gd6Var.hasNext()) {
            arrayList.add(this.b.c.b(gd6Var));
        }
        gd6Var.D();
        int size = arrayList.size();
        Class cls = this.a;
        if (!cls.isPrimitive()) {
            return arrayList.toArray((Object[]) Array.newInstance((Class<?>) cls, size));
        }
        Object objNewInstance = Array.newInstance((Class<?>) cls, size);
        for (int i = 0; i < size; i++) {
            Array.set(objNewInstance, i, arrayList.get(i));
        }
        return objNewInstance;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        if (obj == null) {
            yd6Var.Q();
            return;
        }
        yd6Var.m();
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            this.b.c(yd6Var, Array.get(obj, i));
        }
        yd6Var.D();
    }
}
