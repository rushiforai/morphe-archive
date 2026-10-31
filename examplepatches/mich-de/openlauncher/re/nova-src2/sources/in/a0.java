package in;

import com.google.gson.JsonIOException;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f61655a;

    /* renamed from: b, reason: collision with root package name */
    public final Field f61656b;

    /* renamed from: c, reason: collision with root package name */
    public final String f61657c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Method f61658d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ com.google.gson.h0 f61659e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ com.google.gson.h0 f61660f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ boolean f61661g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f61662h;

    public a0(String str, Field field, Method method, com.google.gson.h0 h0Var, com.google.gson.h0 h0Var2, boolean z11, boolean z12) {
        this.f61658d = method;
        this.f61659e = h0Var;
        this.f61660f = h0Var2;
        this.f61661g = z11;
        this.f61662h = z12;
        this.f61655a = str;
        this.f61656b = field;
        this.f61657c = field.getName();
    }

    public final void a(JsonWriter jsonWriter, Object obj) throws IllegalAccessException, IOException, IllegalArgumentException, InvocationTargetException {
        Object objInvoke;
        Method method = this.f61658d;
        if (method != null) {
            try {
                objInvoke = method.invoke(obj, null);
            } catch (InvocationTargetException e3) {
                throw new JsonIOException(b.c0.l("Accessor ", kn.c.d(method, false), " threw exception"), e3.getCause());
            }
        } else {
            objInvoke = this.f61656b.get(obj);
        }
        if (objInvoke == obj) {
            return;
        }
        jsonWriter.name(this.f61655a);
        this.f61659e.c(jsonWriter, objInvoke);
    }
}
