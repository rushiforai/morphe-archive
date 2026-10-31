package fp;

import cp.a0;
import cp.z;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

/* loaded from: classes4.dex */
public final class a implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55489a;

    public /* synthetic */ a(int i5) {
        this.f55489a = i5;
    }

    @Override // cp.a0
    public final z a(cp.m mVar, jp.a aVar) {
        switch (this.f55489a) {
            case 0:
                Type type = aVar.f69630b;
                boolean z11 = type instanceof GenericArrayType;
                if (!z11 && (!(type instanceof Class) || !((Class) type).isArray())) {
                    return null;
                }
                Type genericComponentType = z11 ? ((GenericArrayType) type).getGenericComponentType() : ((Class) type).getComponentType();
                return new b(mVar, mVar.c(new jp.a(genericComponentType)), ep.i.h(genericComponentType));
            case 1:
                if (aVar.f69629a == Date.class) {
                    return new b(e.f55497b, 2, 2);
                }
                return null;
            case 2:
                Class superclass = aVar.f69629a;
                if (!Enum.class.isAssignableFrom(superclass) || superclass == Enum.class) {
                    return null;
                }
                if (!superclass.isEnum()) {
                    superclass = superclass.getSuperclass();
                }
                return new f(superclass);
            case 3:
                throw new AssertionError("Factory should not be used");
            case 4:
                if (aVar.f69629a == java.sql.Date.class) {
                    return new ip.a(0);
                }
                return null;
            case 5:
                if (aVar.f69629a == Time.class) {
                    return new ip.a(1);
                }
                return null;
            default:
                if (aVar.f69629a != Timestamp.class) {
                    return null;
                }
                mVar.getClass();
                return new ip.a(mVar.c(new jp.a(Date.class)));
        }
    }

    public String toString() {
        switch (this.f55489a) {
            case 1:
                return "DefaultDateTypeAdapter#DEFAULT_STYLE_FACTORY";
            default:
                return super.toString();
        }
    }
}
