package eb0;

import java.lang.reflect.Method;
import java.util.Map;

/* loaded from: classes5.dex */
public final class c0 extends w0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f52545d;

    /* renamed from: e, reason: collision with root package name */
    public final Method f52546e;

    /* renamed from: f, reason: collision with root package name */
    public final int f52547f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f52548g;

    public /* synthetic */ c0(Method method, int i5, boolean z11, int i11) {
        this.f52545d = i11;
        this.f52546e = method;
        this.f52547f = i5;
        this.f52548g = z11;
    }

    @Override // eb0.w0
    public final void a(m0 m0Var, Object obj) {
        switch (this.f52545d) {
            case 0:
                Map map = (Map) obj;
                int i5 = this.f52547f;
                Method method = this.f52546e;
                if (map == null) {
                    throw w0.o(method, i5, "Field map was null.", new Object[0]);
                }
                for (Map.Entry entry : map.entrySet()) {
                    String str = (String) entry.getKey();
                    if (str == null) {
                        throw w0.o(method, i5, "Field map contained null key.", new Object[0]);
                    }
                    Object value = entry.getValue();
                    if (value == null) {
                        throw w0.o(method, i5, b.c0.l("Field map contained null value for key '", str, "'."), new Object[0]);
                    }
                    String string = value.toString();
                    if (string == null) {
                        throw w0.o(method, i5, "Field map value '" + value + "' converted to null by " + a.class.getName() + " for key '" + str + "'.", new Object[0]);
                    }
                    m0Var.a(str, string, this.f52548g);
                }
                return;
            case 1:
                Map map2 = (Map) obj;
                int i11 = this.f52547f;
                Method method2 = this.f52546e;
                if (map2 == null) {
                    throw w0.o(method2, i11, "Header map was null.", new Object[0]);
                }
                for (Map.Entry entry2 : map2.entrySet()) {
                    String str2 = (String) entry2.getKey();
                    if (str2 == null) {
                        throw w0.o(method2, i11, "Header map contained null key.", new Object[0]);
                    }
                    Object value2 = entry2.getValue();
                    if (value2 == null) {
                        throw w0.o(method2, i11, b.c0.l("Header map contained null value for key '", str2, "'."), new Object[0]);
                    }
                    m0Var.b(str2, value2.toString(), this.f52548g);
                }
                return;
            default:
                Map map3 = (Map) obj;
                int i12 = this.f52547f;
                Method method3 = this.f52546e;
                if (map3 == null) {
                    throw w0.o(method3, i12, "Query map was null", new Object[0]);
                }
                for (Map.Entry entry3 : map3.entrySet()) {
                    String str3 = (String) entry3.getKey();
                    if (str3 == null) {
                        throw w0.o(method3, i12, "Query map contained null key.", new Object[0]);
                    }
                    Object value3 = entry3.getValue();
                    if (value3 == null) {
                        throw w0.o(method3, i12, b.c0.l("Query map contained null value for key '", str3, "'."), new Object[0]);
                    }
                    String string2 = value3.toString();
                    if (string2 == null) {
                        throw w0.o(method3, i12, "Query map value '" + value3 + "' converted to null by " + a.class.getName() + " for key '" + str3 + "'.", new Object[0]);
                    }
                    m0Var.d(str3, string2, this.f52548g);
                }
                return;
        }
    }
}
