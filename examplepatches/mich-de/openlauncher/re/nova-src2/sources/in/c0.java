package in;

import com.google.gson.JsonIOException;
import com.google.gson.stream.JsonReader;
import java.lang.reflect.Field;

/* loaded from: classes.dex */
public final class c0 extends b0 {

    /* renamed from: b, reason: collision with root package name */
    public final hn.p f61670b;

    public c0(hn.p pVar, d0 d0Var) {
        super(d0Var);
        this.f61670b = pVar;
    }

    @Override // in.b0
    public final Object d() {
        return this.f61670b.a();
    }

    @Override // in.b0
    public final Object e(Object obj) {
        return obj;
    }

    @Override // in.b0
    public final void f(Object obj, JsonReader jsonReader, a0 a0Var) throws IllegalAccessException, IllegalArgumentException {
        Field field = a0Var.f61656b;
        Object objB = a0Var.f61660f.b(jsonReader);
        if (objB == null && a0Var.f61661g) {
            return;
        }
        if (a0Var.f61662h) {
            throw new JsonIOException(b.c0.k("Cannot set value of 'static final' ", kn.c.d(field, false)));
        }
        field.set(obj, objB);
    }
}
