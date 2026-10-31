package androidx.datastore.preferences.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public abstract class y extends a {
    private static final int MEMOIZED_SERIALIZED_SIZE_MASK = Integer.MAX_VALUE;
    private static final int MUTABLE_FLAG_MASK = Integer.MIN_VALUE;
    static final int UNINITIALIZED_HASH_CODE = 0;
    static final int UNINITIALIZED_SERIALIZED_SIZE = Integer.MAX_VALUE;
    private static Map<Object, y> defaultInstanceMap = new ConcurrentHashMap();
    private int memoizedSerializedSize;
    protected g1 unknownFields;

    public y() {
        this.memoizedHashCode = 0;
        this.memoizedSerializedSize = -1;
        this.unknownFields = g1.f14318f;
    }

    public static y c(Class cls) throws ClassNotFoundException {
        y yVar = defaultInstanceMap.get(cls);
        if (yVar == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                yVar = defaultInstanceMap.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (yVar != null) {
            return yVar;
        }
        y yVar2 = (y) ((y) n1.d(cls)).b(6);
        if (yVar2 == null) {
            throw new IllegalStateException();
        }
        defaultInstanceMap.put(cls, yVar2);
        return yVar2;
    }

    public static Object d(Method method, y yVar, Object... objArr) {
        try {
            return method.invoke(yVar, objArr);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException("Couldn't use Java reflection to implement protocol message reflection.", e3);
        } catch (InvocationTargetException e11) {
            Throwable cause = e11.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            if (cause instanceof Error) {
                throw ((Error) cause);
            }
            throw new RuntimeException("Unexpected exception thrown by generated accessor method.", cause);
        }
    }

    public static final boolean e(y yVar, boolean z11) {
        byte bByteValue = ((Byte) yVar.b(1)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        w0 w0Var = w0.f14415c;
        w0Var.getClass();
        boolean zC = w0Var.a(yVar.getClass()).c(yVar);
        if (z11) {
            yVar.b(2);
        }
        return zC;
    }

    public static void i(Class cls, y yVar) {
        yVar.g();
        defaultInstanceMap.put(cls, yVar);
    }

    @Override // androidx.datastore.preferences.protobuf.a
    public final int a(z0 z0Var) {
        int iG;
        int iG2;
        if (f()) {
            if (z0Var == null) {
                w0 w0Var = w0.f14415c;
                w0Var.getClass();
                iG2 = w0Var.a(getClass()).g(this);
            } else {
                iG2 = z0Var.g(this);
            }
            if (iG2 >= 0) {
                return iG2;
            }
            throw new IllegalStateException(b.c0.h(iG2, "serialized size must be non-negative, was "));
        }
        int i5 = this.memoizedSerializedSize;
        if ((i5 & LayoutNode.NotPlacedPlaceOrder) != Integer.MAX_VALUE) {
            return i5 & LayoutNode.NotPlacedPlaceOrder;
        }
        if (z0Var == null) {
            w0 w0Var2 = w0.f14415c;
            w0Var2.getClass();
            iG = w0Var2.a(getClass()).g(this);
        } else {
            iG = z0Var.g(this);
        }
        j(iG);
        return iG;
    }

    public abstract Object b(int i5);

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        w0 w0Var = w0.f14415c;
        w0Var.getClass();
        return w0Var.a(getClass()).i(this, (y) obj);
    }

    public final boolean f() {
        return (this.memoizedSerializedSize & Integer.MIN_VALUE) != 0;
    }

    public final void g() {
        this.memoizedSerializedSize &= LayoutNode.NotPlacedPlaceOrder;
    }

    public final y h() {
        return (y) b(4);
    }

    public final int hashCode() {
        if (f()) {
            w0 w0Var = w0.f14415c;
            w0Var.getClass();
            return w0Var.a(getClass()).h(this);
        }
        if (this.memoizedHashCode == 0) {
            w0 w0Var2 = w0.f14415c;
            w0Var2.getClass();
            this.memoizedHashCode = w0Var2.a(getClass()).h(this);
        }
        return this.memoizedHashCode;
    }

    public final void j(int i5) {
        if (i5 < 0) {
            throw new IllegalStateException(b.c0.h(i5, "serialized size must be non-negative, was "));
        }
        this.memoizedSerializedSize = (i5 & LayoutNode.NotPlacedPlaceOrder) | (this.memoizedSerializedSize & Integer.MIN_VALUE);
    }

    public final void k(m mVar) {
        w0 w0Var = w0.f14415c;
        w0Var.getClass();
        z0 z0VarA = w0Var.a(getClass());
        j0 j0Var = mVar.f14355b;
        if (j0Var == null) {
            j0Var = new j0(mVar);
        }
        z0VarA.e(this, j0Var);
    }

    public final String toString() {
        return p0.d(this, super.toString());
    }
}
