package defpackage;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jn1 extends hlg {
    public final /* synthetic */ int o = 0;
    public final /* synthetic */ Class p;
    public final /* synthetic */ AccessibleObject q;

    public jn1(Constructor constructor, Class cls) {
        this.q = constructor;
        this.p = cls;
    }

    @Override // defpackage.hlg
    public final Object J() {
        int i = this.o;
        AccessibleObject accessibleObject = this.q;
        switch (i) {
            case 0:
                return ((Constructor) accessibleObject).newInstance(null);
            default:
                return ((Method) accessibleObject).invoke(null, this.p, Object.class);
        }
    }

    public final String toString() {
        int i = this.o;
        Class cls = this.p;
        switch (i) {
        }
        return cls.getName();
    }

    public jn1(Method method, Class cls) {
        this.q = method;
        this.p = cls;
    }
}
