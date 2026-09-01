package androidx.datastore.preferences.protobuf;

import defpackage.b09;
import defpackage.crb;
import defpackage.lg8;
import defpackage.r75;
import defpackage.s2e;
import defpackage.u7a;
import defpackage.ygf;
import defpackage.zg7;
import defpackage.zp1;
import j$.util.concurrent.ConcurrentHashMap;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class e extends a {
    private static final int MEMOIZED_SERIALIZED_SIZE_MASK = Integer.MAX_VALUE;
    private static final int MUTABLE_FLAG_MASK = Integer.MIN_VALUE;
    static final int UNINITIALIZED_HASH_CODE = 0;
    static final int UNINITIALIZED_SERIALIZED_SIZE = Integer.MAX_VALUE;
    private static Map<Object, e> defaultInstanceMap = new ConcurrentHashMap();
    private int memoizedSerializedSize;
    protected k unknownFields;

    public e() {
        this.memoizedHashCode = 0;
        this.memoizedSerializedSize = -1;
        this.unknownFields = k.f;
    }

    public static e d(Class cls) {
        e eVar = defaultInstanceMap.get(cls);
        if (eVar == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                eVar = defaultInstanceMap.get(cls);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException("Class initialization cannot fail.", e);
            }
        }
        if (eVar != null) {
            return eVar;
        }
        try {
            e eVar2 = (e) ((e) s2e.a.allocateInstance(cls)).c(r75.GET_DEFAULT_INSTANCE);
            if (eVar2 != null) {
                defaultInstanceMap.put(cls, eVar2);
                return eVar2;
            }
            lg8.d();
            return null;
        } catch (InstantiationException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static Object e(Method method, e eVar, Object... objArr) {
        try {
            return method.invoke(eVar, objArr);
        } catch (IllegalAccessException e) {
            lg8.p("Couldn't use Java reflection to implement protocol message reflection.", e);
            return null;
        } catch (InvocationTargetException e2) {
            Throwable cause = e2.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            if (cause instanceof Error) {
                throw ((Error) cause);
            }
            lg8.p("Unexpected exception thrown by generated accessor method.", cause);
            return null;
        }
    }

    public static final boolean f(e eVar, boolean z) {
        byte bByteValue = ((Byte) eVar.c(r75.GET_MEMOIZED_IS_INITIALIZED)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        u7a u7aVar = u7a.c;
        u7aVar.getClass();
        boolean zC = u7aVar.a(eVar.getClass()).c(eVar);
        if (z) {
            eVar.c(r75.SET_MEMOIZED_IS_INITIALIZED);
        }
        return zC;
    }

    public static void j(Class cls, e eVar) {
        eVar.h();
        defaultInstanceMap.put(cls, eVar);
    }

    @Override // androidx.datastore.preferences.protobuf.a
    public final int a(crb crbVar) {
        int iG;
        int iG2;
        if (g()) {
            if (crbVar == null) {
                u7a u7aVar = u7a.c;
                u7aVar.getClass();
                iG2 = u7aVar.a(getClass()).g(this);
            } else {
                iG2 = crbVar.g(this);
            }
            if (iG2 >= 0) {
                return iG2;
            }
            ygf.f(b09.w(iG2, "serialized size must be non-negative, was "));
            return 0;
        }
        int i = this.memoizedSerializedSize;
        if ((i & Integer.MAX_VALUE) != Integer.MAX_VALUE) {
            return i & Integer.MAX_VALUE;
        }
        if (crbVar == null) {
            u7a u7aVar2 = u7a.c;
            u7aVar2.getClass();
            iG = u7aVar2.a(getClass()).g(this);
        } else {
            iG = crbVar.g(this);
        }
        k(iG);
        return iG;
    }

    @Override // androidx.datastore.preferences.protobuf.a
    public final void b(zp1 zp1Var) {
        u7a u7aVar = u7a.c;
        u7aVar.getClass();
        crb crbVarA = u7aVar.a(getClass());
        zg7 zg7Var = zp1Var.a;
        if (zg7Var == null) {
            zg7Var = new zg7(zp1Var);
        }
        crbVarA.f(this, zg7Var);
    }

    public abstract Object c(r75 r75Var);

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        u7a u7aVar = u7a.c;
        u7aVar.getClass();
        return u7aVar.a(getClass()).i(this, (e) obj);
    }

    public final boolean g() {
        return (this.memoizedSerializedSize & MUTABLE_FLAG_MASK) != 0;
    }

    public final void h() {
        this.memoizedSerializedSize &= Integer.MAX_VALUE;
    }

    public final int hashCode() {
        if (g()) {
            u7a u7aVar = u7a.c;
            u7aVar.getClass();
            return u7aVar.a(getClass()).h(this);
        }
        int i = this.memoizedHashCode;
        if (i != 0) {
            return i;
        }
        u7a u7aVar2 = u7a.c;
        u7aVar2.getClass();
        int iH = u7aVar2.a(getClass()).h(this);
        this.memoizedHashCode = iH;
        return iH;
    }

    public final e i() {
        return (e) c(r75.NEW_MUTABLE_INSTANCE);
    }

    public final void k(int i) {
        if (i < 0) {
            ygf.f(b09.w(i, "serialized size must be non-negative, was "));
        } else {
            this.memoizedSerializedSize = (i & Integer.MAX_VALUE) | (this.memoizedSerializedSize & MUTABLE_FLAG_MASK);
        }
    }

    public final String toString() {
        String string = super.toString();
        char[] cArr = f.a;
        StringBuilder sb = new StringBuilder();
        sb.append("# ");
        sb.append(string);
        f.c(this, sb, 0);
        return sb.toString();
    }
}
