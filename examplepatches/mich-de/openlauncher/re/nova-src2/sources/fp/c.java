package fp;

import cp.a0;
import cp.z;
import e1.m0;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/* loaded from: classes4.dex */
public final class c implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55495a;

    /* renamed from: b, reason: collision with root package name */
    public final m0 f55496b;

    public /* synthetic */ c(m0 m0Var, int i5) {
        this.f55495a = i5;
        this.f55496b = m0Var;
    }

    @Override // cp.a0
    public final z a(cp.m mVar, jp.a aVar) {
        Class cls;
        Type[] actualTypeArguments;
        int i5 = this.f55495a;
        m0 m0Var = this.f55496b;
        cls = Object.class;
        int i11 = 2;
        switch (i5) {
            case 0:
                Type type = aVar.f69630b;
                Class cls2 = aVar.f69629a;
                if (!Collection.class.isAssignableFrom(cls2)) {
                    return null;
                }
                if (type instanceof WildcardType) {
                    type = ((WildcardType) type).getUpperBounds()[0];
                }
                ep.i.b(Collection.class.isAssignableFrom(cls2));
                Type typeJ = ep.i.j(type, cls2, ep.i.g(type, cls2, Collection.class), new HashMap());
                cls = typeJ instanceof ParameterizedType ? ((ParameterizedType) typeJ).getActualTypeArguments()[0] : Object.class;
                return new b(i11, new f(mVar, mVar.c(new jp.a(cls)), cls), m0Var.e(aVar, false));
            default:
                Type type2 = aVar.f69630b;
                Class cls3 = aVar.f69629a;
                if (!Map.class.isAssignableFrom(cls3)) {
                    return null;
                }
                if (Properties.class.isAssignableFrom(cls3)) {
                    actualTypeArguments = new Type[]{String.class, String.class};
                } else {
                    if (type2 instanceof WildcardType) {
                        type2 = ((WildcardType) type2).getUpperBounds()[0];
                    }
                    ep.i.b(Map.class.isAssignableFrom(cls3));
                    Type typeJ2 = ep.i.j(type2, cls3, ep.i.g(type2, cls3, Map.class), new HashMap());
                    actualTypeArguments = typeJ2 instanceof ParameterizedType ? ((ParameterizedType) typeJ2).getActualTypeArguments() : new Type[]{cls, cls};
                }
                Type type3 = actualTypeArguments[0];
                Type type4 = actualTypeArguments[1];
                return new f(this, new f(mVar, (type3 == Boolean.TYPE || type3 == Boolean.class) ? s.f55544c : mVar.c(new jp.a(type3)), type3), new f(mVar, mVar.c(new jp.a(type4)), type4), m0Var.e(aVar, false));
        }
    }
}
