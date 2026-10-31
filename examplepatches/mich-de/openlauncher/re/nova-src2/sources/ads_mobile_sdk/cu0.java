package ads_mobile_sdk;

import b.c0;
import b.x8;
import com.google.android.gms.internal.measurement.q0;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* loaded from: classes.dex */
public abstract class cu0 extends g {
    private static final int MEMOIZED_SERIALIZED_SIZE_MASK = Integer.MAX_VALUE;
    private static final int MUTABLE_FLAG_MASK = Integer.MIN_VALUE;
    private static final ConcurrentMap<Class<?>, Object> parserOrInstanceMap = new ConcurrentHashMap();

    /* renamed from: b, reason: collision with root package name */
    public bm3 f2034b;
    private int memoizedSerializedSize;

    public cu0() {
        this.f3587a = 0;
        this.memoizedSerializedSize = -1;
        this.f2034b = bm3.f1463f;
    }

    public static void a(cu0 cu0Var) {
        if (cu0Var != null && !m1a(cu0Var)) {
            throw new yi1(new zl3().getMessage());
        }
    }

    public abstract Object a(int i5, cu0 cu0Var);

    public final au0 e() {
        return (au0) a(5, (cu0) null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        hn2 hn2Var = hn2.f4463c;
        hn2Var.getClass();
        return hn2Var.a(getClass()).b(this, (cu0) obj);
    }

    public final int hashCode() {
        if (j()) {
            hn2 hn2Var = hn2.f4463c;
            hn2Var.getClass();
            return hn2Var.a(getClass()).d(this);
        }
        if (this.f3587a == 0) {
            hn2 hn2Var2 = hn2.f4463c;
            hn2Var2.getClass();
            this.f3587a = hn2Var2.a(getClass()).d(this);
        }
        return this.f3587a;
    }

    public final b.f5 i() throws ClassNotFoundException {
        Class<?> cls = getClass();
        ConcurrentMap<Class<?>, Object> concurrentMap = parserOrInstanceMap;
        Object obj = concurrentMap.get(cls);
        if (obj == null) {
            a(cls);
            obj = concurrentMap.get(cls);
        }
        if (obj == null) {
            throw new IllegalStateException("Default instance cannot be null.");
        }
        if (obj instanceof b.f5) {
            return (b.f5) obj;
        }
        bu0 bu0Var = new bu0((cu0) obj);
        return concurrentMap.replace(cls, obj, bu0Var) ? bu0Var : (b.f5) concurrentMap.get(cls);
    }

    public final boolean j() {
        return this.memoizedSerializedSize < 0;
    }

    public final void k() {
        hn2 hn2Var = hn2.f4463c;
        hn2Var.getClass();
        hn2Var.a(getClass()).c(this);
        this.memoizedSerializedSize &= Integer.MAX_VALUE;
    }

    public final void l() {
        this.memoizedSerializedSize &= Integer.MAX_VALUE;
    }

    public final au0 n() {
        au0 au0Var = (au0) a(5, (cu0) null);
        au0Var.a(this);
        return au0Var;
    }

    public final String toString() {
        String string = super.toString();
        char[] cArr = np1.f7632a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("# ");
        sb2.append(string);
        np1.a(this, sb2, 0);
        return sb2.toString();
    }

    @Override // ads_mobile_sdk.g
    public final int a(x8 x8Var) {
        int iB;
        int iB2;
        if (j()) {
            if (x8Var == null) {
                hn2 hn2Var = hn2.f4463c;
                hn2Var.getClass();
                iB2 = hn2Var.a(getClass()).b(this);
            } else {
                iB2 = x8Var.b(this);
            }
            if (iB2 >= 0) {
                return iB2;
            }
            throw new IllegalStateException(c0.h(iB2, "serialized size must be non-negative, was "));
        }
        int i5 = this.memoizedSerializedSize & Integer.MAX_VALUE;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        if (x8Var == null) {
            hn2 hn2Var2 = hn2.f4463c;
            hn2Var2.getClass();
            iB = hn2Var2.a(getClass()).b(this);
        } else {
            iB = x8Var.b(this);
        }
        a(iB);
        return iB;
    }

    public static Object a(Method method, cu0 cu0Var, Object... objArr) {
        try {
            return method.invoke(cu0Var, objArr);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException("Couldn't use Java reflection to implement protocol message reflection.", e3);
        } catch (InvocationTargetException e11) {
            Throwable cause = e11.getCause();
            if (!(cause instanceof RuntimeException)) {
                if (cause instanceof Error) {
                    throw ((Error) cause);
                }
                throw new RuntimeException("Unexpected exception thrown by generated accessor method.", cause);
            }
            throw ((RuntimeException) cause);
        }
    }

    /* renamed from: a, reason: collision with other method in class */
    public static final boolean m1a(cu0 cu0Var) {
        Object objA = cu0Var.a(1, (cu0) null);
        if (objA != null) {
            if (objA instanceof Byte) {
                byte bByteValue = ((Byte) objA).byteValue();
                if (bByteValue != 1) {
                    if (bByteValue == 0) {
                        return false;
                    }
                }
            }
            hn2 hn2Var = hn2.f4463c;
            hn2Var.getClass();
            boolean zA = hn2Var.a(cu0Var.getClass()).a(cu0Var);
            cu0Var.a(2, zA ? cu0Var : null);
            return zA;
        }
        return true;
    }

    public static cu0 a(cu0 cu0Var, com.google.crypto.tink.shaded.protobuf.k kVar, nl0 nl0Var) {
        cu0 cu0Var2 = (cu0) cu0Var.a(4, (cu0) null);
        try {
            hn2 hn2Var = hn2.f4463c;
            hn2Var.getClass();
            x8 x8VarA = hn2Var.a(cu0Var2.getClass());
            q1.l0 l0Var = (q1.l0) kVar.f34623c;
            if (l0Var == null) {
                l0Var = new q1.l0(kVar);
            }
            x8VarA.a(cu0Var2, l0Var, nl0Var);
            x8VarA.c(cu0Var2);
            return cu0Var2;
        } catch (yi1 e3) {
            if (e3.f12029a) {
                throw new yi1(e3);
            }
            throw e3;
        } catch (zl3 e11) {
            throw new yi1(e11.getMessage());
        } catch (IOException e12) {
            if (e12.getCause() instanceof yi1) {
                throw ((yi1) e12.getCause());
            }
            throw new yi1(e12);
        } catch (RuntimeException e13) {
            if (e13.getCause() instanceof yi1) {
                throw ((yi1) e13.getCause());
            }
            throw e13;
        }
    }

    public static cu0 a(cu0 cu0Var, byte[] bArr, int i5, nl0 nl0Var) {
        if (i5 == 0) {
            return cu0Var;
        }
        cu0 cu0Var2 = (cu0) cu0Var.a(4, (cu0) null);
        try {
            hn2 hn2Var = hn2.f4463c;
            hn2Var.getClass();
            x8 x8VarA = hn2Var.a(cu0Var2.getClass());
            x8VarA.a(cu0Var2, bArr, 0, i5, new q0(nl0Var));
            x8VarA.c(cu0Var2);
            return cu0Var2;
        } catch (yi1 e3) {
            if (e3.f12029a) {
                throw new yi1(e3);
            }
            throw e3;
        } catch (zl3 e11) {
            throw new yi1(e11.getMessage());
        } catch (IOException e12) {
            if (e12.getCause() instanceof yi1) {
                throw ((yi1) e12.getCause());
            }
            throw new yi1(e12);
        } catch (IndexOutOfBoundsException unused) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }

    public static void a(Class cls, cu0 cu0Var) {
        cu0Var.memoizedSerializedSize &= Integer.MAX_VALUE;
        parserOrInstanceMap.put(cls, cu0Var);
    }

    public final void a(int i5) {
        if (i5 >= 0) {
            this.memoizedSerializedSize = (i5 & Integer.MAX_VALUE) | (this.memoizedSerializedSize & Integer.MIN_VALUE);
            return;
        }
        throw new IllegalStateException(c0.h(i5, "serialized size must be non-negative, was "));
    }

    public final void a(yu yuVar) {
        hn2 hn2Var = hn2.f4463c;
        hn2Var.getClass();
        x8 x8VarA = hn2Var.a(getClass());
        c7 c7Var = yuVar.f12284a;
        if (c7Var == null) {
            c7Var = new c7(yuVar);
        }
        x8VarA.a((Object) this, c7Var);
    }

    public static cu0 a(Class cls) throws ClassNotFoundException {
        ConcurrentMap<Class<?>, Object> concurrentMap = parserOrInstanceMap;
        Object obj = concurrentMap.get(cls);
        if (obj == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                obj = concurrentMap.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (obj == null) {
            obj = ((au0) ((cu0) pm3.a(cls)).a(5, (cu0) null)).f1094a;
            if (obj != null) {
                concurrentMap.put(cls, obj);
            } else {
                throw new IllegalStateException();
            }
        }
        if (obj instanceof cu0) {
            return (cu0) obj;
        }
        return ((bu0) obj).f1559a;
    }
}
