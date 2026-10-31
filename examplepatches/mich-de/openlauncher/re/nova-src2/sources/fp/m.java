package fp;

import b.c0;
import com.nimbusds.jose.shaded.gson.JsonIOException;
import java.lang.reflect.Field;

/* loaded from: classes4.dex */
public final class m extends l {

    /* renamed from: b, reason: collision with root package name */
    public final ep.p f55522b;

    public m(ep.p pVar, n nVar) {
        super(nVar);
        this.f55522b = pVar;
    }

    @Override // fp.l
    public final Object d() {
        return this.f55522b.a();
    }

    @Override // fp.l
    public final Object e(Object obj) {
        return obj;
    }

    @Override // fp.l
    public final void f(Object obj, kp.a aVar, k kVar) throws IllegalAccessException, IllegalArgumentException {
        Field field = kVar.f55514b;
        Object objB = kVar.f55518f.b(aVar);
        if (objB == null && kVar.f55519g) {
            return;
        }
        if (kVar.f55520h) {
            throw new JsonIOException(c0.k("Cannot set value of 'static final' ", hp.c.d(field, false)));
        }
        field.set(obj, objB);
    }
}
