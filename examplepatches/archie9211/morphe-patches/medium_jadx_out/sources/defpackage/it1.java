package defpackage;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Map;
import java.util.Properties;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class it1 implements kud {
    public final /* synthetic */ int a;
    public final o72 b;

    public /* synthetic */ it1(o72 o72Var, int i) {
        this.a = i;
        this.b = o72Var;
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        Class cls;
        Type[] actualTypeArguments;
        int i = this.a;
        o72 o72Var = this.b;
        cls = Object.class;
        switch (i) {
            case 0:
                Type typeD = kxdVar.d();
                Class clsC = kxdVar.c();
                if (!Collection.class.isAssignableFrom(clsC)) {
                    return null;
                }
                Type typeO = d46.O(typeD, clsC, Collection.class);
                cls = typeO instanceof ParameterizedType ? ((ParameterizedType) typeO).getActualTypeArguments()[0] : Object.class;
                return new ht1(new lud(ch5Var, ch5Var.d(kxd.b(cls)), cls, 1), 0, o72Var.c(kxdVar, false));
            default:
                Type typeD2 = kxdVar.d();
                Class clsC2 = kxdVar.c();
                if (!Map.class.isAssignableFrom(clsC2)) {
                    return null;
                }
                if (Properties.class.isAssignableFrom(clsC2)) {
                    actualTypeArguments = new Type[]{String.class, String.class};
                } else {
                    Type typeO2 = d46.O(typeD2, clsC2, Map.class);
                    actualTypeArguments = typeO2 instanceof ParameterizedType ? ((ParameterizedType) typeO2).getActualTypeArguments() : new Type[]{cls, cls};
                }
                Type type = actualTypeArguments[0];
                Type type2 = actualTypeArguments[1];
                return new p96(this, new lud(ch5Var, (type == Boolean.TYPE || type == Boolean.class) ? qvd.c : ch5Var.d(kxd.b(type)), type, 1), new lud(ch5Var, ch5Var.d(kxd.b(type2)), type2, 1), o72Var.c(kxdVar, false));
        }
    }
}
