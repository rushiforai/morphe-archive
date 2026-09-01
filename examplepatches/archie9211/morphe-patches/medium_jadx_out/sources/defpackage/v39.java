package defpackage;

import java.lang.reflect.Method;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v39 extends to7 {
    public final /* synthetic */ int e;
    public final Method f;
    public final int g;
    public final boolean h;

    public /* synthetic */ v39(int i, int i2, Method method, boolean z) {
        this.e = i2;
        this.f = method;
        this.g = i;
        this.h = z;
    }

    @Override // defpackage.to7
    public final void h(ubb ubbVar, Object obj) {
        int i = this.e;
        boolean z = this.h;
        Method method = this.f;
        int i2 = this.g;
        switch (i) {
            case 0:
                Map map = (Map) obj;
                if (map == null) {
                    throw vv2.S(method, i2, "Field map was null.", new Object[0]);
                }
                for (Map.Entry entry : map.entrySet()) {
                    String str = (String) entry.getKey();
                    if (str == null) {
                        throw vv2.S(method, i2, "Field map contained null key.", new Object[0]);
                    }
                    Object value = entry.getValue();
                    if (value == null) {
                        throw vv2.S(method, i2, ev6.x("Field map contained null value for key '", str, "'."), new Object[0]);
                    }
                    String string = value.toString();
                    if (string == null) {
                        throw vv2.S(method, i2, "Field map value '" + value + "' converted to null by " + n01.class.getName() + " for key '" + str + "'.", new Object[0]);
                    }
                    ubbVar.a(str, string, z);
                }
                return;
            case 1:
                Map map2 = (Map) obj;
                if (map2 == null) {
                    throw vv2.S(method, i2, "Header map was null.", new Object[0]);
                }
                for (Map.Entry entry2 : map2.entrySet()) {
                    String str2 = (String) entry2.getKey();
                    if (str2 == null) {
                        throw vv2.S(method, i2, "Header map contained null key.", new Object[0]);
                    }
                    Object value2 = entry2.getValue();
                    if (value2 == null) {
                        throw vv2.S(method, i2, ev6.x("Header map contained null value for key '", str2, "'."), new Object[0]);
                    }
                    ubbVar.b(str2, value2.toString(), z);
                }
                return;
            default:
                Map map3 = (Map) obj;
                if (map3 == null) {
                    throw vv2.S(method, i2, "Query map was null", new Object[0]);
                }
                for (Map.Entry entry3 : map3.entrySet()) {
                    String str3 = (String) entry3.getKey();
                    if (str3 == null) {
                        throw vv2.S(method, i2, "Query map contained null key.", new Object[0]);
                    }
                    Object value3 = entry3.getValue();
                    if (value3 == null) {
                        throw vv2.S(method, i2, ev6.x("Query map contained null value for key '", str3, "'."), new Object[0]);
                    }
                    String string2 = value3.toString();
                    if (string2 == null) {
                        throw vv2.S(method, i2, "Query map value '" + value3 + "' converted to null by " + n01.class.getName() + " for key '" + str3 + "'.", new Object[0]);
                    }
                    ubbVar.d(str3, string2, z);
                }
                return;
        }
    }
}
