package com.google.crypto.tink.shaded.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public abstract class x extends a {
    private static final int MEMOIZED_SERIALIZED_SIZE_MASK = Integer.MAX_VALUE;
    private static final int MUTABLE_FLAG_MASK = Integer.MIN_VALUE;
    static final int UNINITIALIZED_HASH_CODE = 0;
    static final int UNINITIALIZED_SERIALIZED_SIZE = Integer.MAX_VALUE;
    private static Map<Class<?>, x> defaultInstanceMap = new ConcurrentHashMap();
    private int memoizedSerializedSize;
    protected a1 unknownFields;

    public x() {
        this.memoizedHashCode = 0;
        this.memoizedSerializedSize = -1;
        this.unknownFields = a1.f34568f;
    }

    public static x i(Class cls) throws ClassNotFoundException {
        x xVar = defaultInstanceMap.get(cls);
        if (xVar == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                xVar = defaultInstanceMap.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (xVar != null) {
            return xVar;
        }
        x defaultInstanceForType = ((x) g1.b(cls)).getDefaultInstanceForType();
        if (defaultInstanceForType == null) {
            throw new IllegalStateException();
        }
        defaultInstanceMap.put(cls, defaultInstanceForType);
        return defaultInstanceForType;
    }

    public static Object l(Method method, x xVar, Object... objArr) {
        try {
            return method.invoke(xVar, objArr);
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

    public static final boolean m(x xVar, boolean z11) {
        byte bByteValue = ((Byte) xVar.h(1)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        u0 u0Var = u0.f34670c;
        u0Var.getClass();
        boolean zC = u0Var.a(xVar.getClass()).c(xVar);
        if (z11) {
            xVar.h(2);
        }
        return zC;
    }

    public static x r(x xVar, i iVar, p pVar) throws InvalidProtocolBufferException {
        g gVar = (g) iVar;
        byte[] bArr = gVar.f34597d;
        int iJ = gVar.j();
        int size = gVar.size();
        j jVar = new j(bArr, iJ, size, true);
        try {
            jVar.D(size);
            x xVarQ = xVar.q();
            try {
                u0 u0Var = u0.f34670c;
                u0Var.getClass();
                x0 x0VarA = u0Var.a(xVarQ.getClass());
                x0VarA.g(xVarQ, l.a(jVar), pVar);
                x0VarA.b(xVarQ);
                if (jVar.f34616q != 0) {
                    throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
                }
                if (m(xVarQ, true)) {
                    return xVarQ;
                }
                throw new InvalidProtocolBufferException(new UninitializedMessageException().getMessage());
            } catch (InvalidProtocolBufferException e3) {
                throw e3;
            } catch (UninitializedMessageException e11) {
                throw new InvalidProtocolBufferException(e11.getMessage());
            } catch (IOException e12) {
                if (e12.getCause() instanceof InvalidProtocolBufferException) {
                    throw ((InvalidProtocolBufferException) e12.getCause());
                }
                throw new InvalidProtocolBufferException(e12.getMessage(), e12);
            } catch (RuntimeException e13) {
                if (e13.getCause() instanceof InvalidProtocolBufferException) {
                    throw ((InvalidProtocolBufferException) e13.getCause());
                }
                throw e13;
            }
        } catch (InvalidProtocolBufferException e14) {
            throw new IllegalArgumentException(e14);
        }
    }

    public static x s(x xVar, byte[] bArr, p pVar) throws InvalidProtocolBufferException {
        int length = bArr.length;
        if (length != 0) {
            x xVarQ = xVar.q();
            try {
                u0 u0Var = u0.f34670c;
                u0Var.getClass();
                x0 x0VarA = u0Var.a(xVarQ.getClass());
                x0VarA.i(xVarQ, bArr, 0, length, new com.google.android.gms.internal.measurement.q0(pVar));
                x0VarA.b(xVarQ);
                xVar = xVarQ;
            } catch (InvalidProtocolBufferException e3) {
                throw e3;
            } catch (UninitializedMessageException e11) {
                throw new InvalidProtocolBufferException(e11.getMessage());
            } catch (IOException e12) {
                if (e12.getCause() instanceof InvalidProtocolBufferException) {
                    throw ((InvalidProtocolBufferException) e12.getCause());
                }
                throw new InvalidProtocolBufferException(e12.getMessage(), e12);
            } catch (IndexOutOfBoundsException unused) {
                throw InvalidProtocolBufferException.d();
            }
        }
        if (xVar == null || m(xVar, true)) {
            return xVar;
        }
        throw new InvalidProtocolBufferException(new UninitializedMessageException().getMessage());
    }

    public static void t(Class cls, x xVar) {
        xVar.o();
        defaultInstanceMap.put(cls, xVar);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.a
    public final int a(x0 x0Var) {
        int iE;
        int iE2;
        if (n()) {
            if (x0Var == null) {
                u0 u0Var = u0.f34670c;
                u0Var.getClass();
                iE2 = u0Var.a(getClass()).e(this);
            } else {
                iE2 = x0Var.e(this);
            }
            if (iE2 >= 0) {
                return iE2;
            }
            throw new IllegalStateException(b.c0.h(iE2, "serialized size must be non-negative, was "));
        }
        int i5 = this.memoizedSerializedSize;
        if ((i5 & LayoutNode.NotPlacedPlaceOrder) != Integer.MAX_VALUE) {
            return i5 & LayoutNode.NotPlacedPlaceOrder;
        }
        if (x0Var == null) {
            u0 u0Var2 = u0.f34670c;
            u0Var2.getClass();
            iE = u0Var2.a(getClass()).e(this);
        } else {
            iE = x0Var.e(this);
        }
        u(iE);
        return iE;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        u0 u0Var = u0.f34670c;
        u0Var.getClass();
        return u0Var.a(getClass()).h(this, (x) obj);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.a
    public final void f(m mVar) {
        u0 u0Var = u0.f34670c;
        u0Var.getClass();
        u0Var.a(getClass()).f(this, cm.f.y(mVar));
    }

    public final v g() {
        return (v) h(5);
    }

    public abstract Object h(int i5);

    public final int hashCode() {
        if (n()) {
            u0 u0Var = u0.f34670c;
            u0Var.getClass();
            return u0Var.a(getClass()).j(this);
        }
        if (this.memoizedHashCode == 0) {
            u0 u0Var2 = u0.f34670c;
            u0Var2.getClass();
            this.memoizedHashCode = u0Var2.a(getClass()).j(this);
        }
        return this.memoizedHashCode;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.n0
    /* renamed from: j, reason: merged with bridge method [inline-methods] */
    public final x getDefaultInstanceForType() {
        return (x) h(6);
    }

    public final t0 k() {
        return (t0) h(7);
    }

    public final boolean n() {
        return (this.memoizedSerializedSize & Integer.MIN_VALUE) != 0;
    }

    public final void o() {
        this.memoizedSerializedSize &= LayoutNode.NotPlacedPlaceOrder;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.a
    /* renamed from: p, reason: merged with bridge method [inline-methods] */
    public final v c() {
        return (v) h(5);
    }

    public final x q() {
        return (x) h(4);
    }

    public final String toString() {
        return o0.d(this, super.toString());
    }

    public final void u(int i5) {
        if (i5 < 0) {
            throw new IllegalStateException(b.c0.h(i5, "serialized size must be non-negative, was "));
        }
        this.memoizedSerializedSize = (i5 & LayoutNode.NotPlacedPlaceOrder) | (this.memoizedSerializedSize & Integer.MIN_VALUE);
    }
}
