package defpackage;

import com.google.gson.JsonIOException;
import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d2b extends c2b {
    public final km8 b;

    public d2b(km8 km8Var, e2b e2bVar) {
        super(e2bVar);
        this.b = km8Var;
    }

    @Override // defpackage.c2b
    public final Object d() {
        return this.b.g();
    }

    @Override // defpackage.c2b
    public final void f(Object obj, gd6 gd6Var, b2b b2bVar) throws IllegalAccessException {
        Field field = b2bVar.b;
        Object objB = b2bVar.g.b(gd6Var);
        if (objB == null && b2bVar.h) {
            return;
        }
        if (b2bVar.d) {
            g2b.b(obj, field);
        } else if (b2bVar.i) {
            throw new JsonIOException("Cannot set value of 'static final' ".concat(w1b.d(field, false)));
        }
        field.set(obj, objB);
    }

    @Override // defpackage.c2b
    public final Object e(Object obj) {
        return obj;
    }
}
