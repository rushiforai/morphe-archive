package fp;

import b.c0;
import com.nimbusds.jose.shaded.gson.JsonIOException;
import cp.z;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final String f55513a;

    /* renamed from: b, reason: collision with root package name */
    public final Field f55514b;

    /* renamed from: c, reason: collision with root package name */
    public final String f55515c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Method f55516d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ z f55517e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ z f55518f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ boolean f55519g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f55520h;

    public k(String str, Field field, Method method, z zVar, z zVar2, boolean z11, boolean z12) {
        this.f55516d = method;
        this.f55517e = zVar;
        this.f55518f = zVar2;
        this.f55519g = z11;
        this.f55520h = z12;
        this.f55513a = str;
        this.f55514b = field;
        this.f55515c = field.getName();
    }

    public final void a(kp.b bVar, Object obj) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Object objInvoke;
        Method method = this.f55516d;
        if (method != null) {
            try {
                objInvoke = method.invoke(obj, null);
            } catch (InvocationTargetException e3) {
                throw new JsonIOException(c0.l("Accessor ", hp.c.d(method, false), " threw exception"), e3.getCause());
            }
        } else {
            objInvoke = this.f55514b.get(obj);
        }
        if (objInvoke == obj) {
            return;
        }
        bVar.h(this.f55513a);
        this.f55517e.c(bVar, objInvoke);
    }
}
