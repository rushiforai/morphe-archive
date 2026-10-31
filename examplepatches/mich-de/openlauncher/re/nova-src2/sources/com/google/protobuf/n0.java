package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public abstract class n0 extends c {
    private static final int MEMOIZED_SERIALIZED_SIZE_MASK = Integer.MAX_VALUE;
    private static final int MUTABLE_FLAG_MASK = Integer.MIN_VALUE;
    static final int UNINITIALIZED_HASH_CODE = 0;
    static final int UNINITIALIZED_SERIALIZED_SIZE = Integer.MAX_VALUE;
    private static Map<Object, n0> defaultInstanceMap = new ConcurrentHashMap();
    private int memoizedSerializedSize;
    protected g2 unknownFields;

    public n0() {
        this.memoizedHashCode = 0;
        this.memoizedSerializedSize = -1;
        this.unknownFields = g2.f34861f;
    }

    public static l0 access$000(v vVar) {
        vVar.getClass();
        return (l0) vVar;
    }

    public static void b(n0 n0Var) throws InvalidProtocolBufferException {
        if (n0Var == null || n0Var.isInitialized()) {
            return;
        }
        UninitializedMessageException uninitializedMessageExceptionNewUninitializedMessageException = n0Var.newUninitializedMessageException();
        uninitializedMessageExceptionNewUninitializedMessageException.getClass();
        throw new InvalidProtocolBufferException(uninitializedMessageExceptionNewUninitializedMessageException.getMessage());
    }

    public static n0 c(n0 n0Var, InputStream inputStream, y yVar) throws IOException {
        try {
            int i5 = inputStream.read();
            if (i5 == -1) {
                return null;
            }
            p pVarI = p.i(new a(inputStream, p.x(i5, inputStream)));
            n0 partialFrom = parsePartialFrom(n0Var, pVarI, yVar);
            pVarI.a(0);
            return partialFrom;
        } catch (InvalidProtocolBufferException e3) {
            if (e3.f34804a) {
                throw new InvalidProtocolBufferException(e3.getMessage(), e3);
            }
            throw e3;
        } catch (IOException e11) {
            throw new InvalidProtocolBufferException(e11.getMessage(), e11);
        }
    }

    public static n0 d(n0 n0Var, byte[] bArr, int i5, int i11, y yVar) throws InvalidProtocolBufferException {
        if (i11 == 0) {
            return n0Var;
        }
        n0 n0VarNewMutableInstance = n0Var.newMutableInstance();
        try {
            x1 x1Var = x1.f35001c;
            x1Var.getClass();
            b2 b2VarA = x1Var.a(n0VarNewMutableInstance.getClass());
            b2VarA.g(n0VarNewMutableInstance, bArr, i5, i5 + i11, new f(yVar));
            b2VarA.b(n0VarNewMutableInstance);
            return n0VarNewMutableInstance;
        } catch (InvalidProtocolBufferException e3) {
            if (e3.f34804a) {
                throw new InvalidProtocolBufferException(e3.getMessage(), e3);
            }
            throw e3;
        } catch (UninitializedMessageException e11) {
            throw new InvalidProtocolBufferException(e11.getMessage());
        } catch (IOException e12) {
            if (e12.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e12.getCause());
            }
            throw new InvalidProtocolBufferException(e12.getMessage(), e12);
        } catch (IndexOutOfBoundsException unused) {
            throw InvalidProtocolBufferException.g();
        }
    }

    public static p0 emptyBooleanList() {
        return h.e();
    }

    public static q0 emptyDoubleList() {
        return u.e();
    }

    public static u0 emptyFloatList() {
        return d0.e();
    }

    public static v0 emptyIntList() {
        return o0.f34933d;
    }

    public static y0 emptyLongList() {
        return f1.e();
    }

    public static <E> z0 emptyProtobufList() {
        return y1.f35007d;
    }

    public static <T extends n0> T getDefaultInstance(Class<T> cls) throws ClassNotFoundException {
        T t6 = (T) defaultInstanceMap.get(cls);
        if (t6 == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                t6 = (T) defaultInstanceMap.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (t6 != null) {
            return t6;
        }
        T t9 = (T) ((n0) m2.b(cls)).getDefaultInstanceForType();
        if (t9 == null) {
            throw new IllegalStateException();
        }
        defaultInstanceMap.put(cls, t9);
        return t9;
    }

    public static Method getMethodOrDie(Class cls, String str, Class... clsArr) {
        try {
            return cls.getMethod(str, clsArr);
        } catch (NoSuchMethodException e3) {
            throw new RuntimeException("Generated message class \"" + cls.getName() + "\" missing method \"" + str + "\".", e3);
        }
    }

    public static Object invokeOrDie(Method method, Object obj, Object... objArr) {
        try {
            return method.invoke(obj, objArr);
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

    public static v0 mutableCopy(v0 v0Var) {
        int size = v0Var.size();
        int i5 = size == 0 ? 10 : size * 2;
        o0 o0Var = (o0) v0Var;
        if (i5 >= o0Var.f34935c) {
            return new o0(Arrays.copyOf(o0Var.f34934b, i5), o0Var.f34935c, true);
        }
        throw new IllegalArgumentException();
    }

    public static Object newMessageInfo(o1 o1Var, String str, Object[] objArr) {
        return new z1(o1Var, str, objArr);
    }

    public static <ContainingType extends o1, Type> l0 newRepeatedGeneratedExtension(ContainingType containingtype, o1 o1Var, s0 s0Var, int i5, t2 t2Var, boolean z11, Class cls) {
        return new l0(containingtype, Collections.EMPTY_LIST, o1Var, new k0(s0Var, i5, t2Var, true, z11));
    }

    public static <ContainingType extends o1, Type> l0 newSingularGeneratedExtension(ContainingType containingtype, Type type, o1 o1Var, s0 s0Var, int i5, t2 t2Var, Class cls) {
        return new l0(containingtype, type, o1Var, new k0(s0Var, i5, t2Var, false, false));
    }

    public static <T extends n0> T parseDelimitedFrom(T t6, InputStream inputStream) throws InvalidProtocolBufferException {
        T t9 = (T) c(t6, inputStream, y.b());
        b(t9);
        return t9;
    }

    public static <T extends n0> T parseFrom(T t6, ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
        p pVarH;
        if (byteBuffer.hasArray()) {
            pVarH = p.h(byteBuffer.array(), byteBuffer.position() + byteBuffer.arrayOffset(), byteBuffer.remaining(), false);
        } else if (byteBuffer.isDirect() && o.J()) {
            pVarH = new o(byteBuffer, false);
        } else {
            int iRemaining = byteBuffer.remaining();
            byte[] bArr = new byte[iRemaining];
            byteBuffer.duplicate().get(bArr);
            pVarH = p.h(bArr, 0, iRemaining, true);
        }
        T t9 = (T) parseFrom(t6, pVarH, yVar);
        b(t9);
        return t9;
    }

    public static <T extends n0> T parsePartialFrom(T t6, p pVar, y yVar) throws InvalidProtocolBufferException {
        T t9 = (T) t6.newMutableInstance();
        try {
            x1 x1Var = x1.f35001c;
            x1Var.getClass();
            b2 b2VarA = x1Var.a(t9.getClass());
            b2VarA.f(t9, q.a(pVar), yVar);
            b2VarA.b(t9);
            return t9;
        } catch (InvalidProtocolBufferException e3) {
            if (e3.f34804a) {
                throw new InvalidProtocolBufferException(e3.getMessage(), e3);
            }
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
    }

    public static <T extends n0> void registerDefaultInstance(Class<T> cls, T t6) {
        t6.markImmutable();
        defaultInstanceMap.put(cls, t6);
    }

    public Object buildMessageInfo() throws Exception {
        return dynamicMethod(m0.f34903c);
    }

    public void clearMemoizedHashCode() {
        this.memoizedHashCode = 0;
    }

    public void clearMemoizedSerializedSize() {
        setMemoizedSerializedSize(LayoutNode.NotPlacedPlaceOrder);
    }

    public int computeHashCode() {
        x1 x1Var = x1.f35001c;
        x1Var.getClass();
        return x1Var.a(getClass()).h(this);
    }

    public final <MessageType extends n0, BuilderType extends f0> BuilderType createBuilder() {
        return (BuilderType) dynamicMethod(m0.f34905e);
    }

    public Object dynamicMethod(m0 m0Var, Object obj) {
        return dynamicMethod(m0Var, obj, null);
    }

    public abstract Object dynamicMethod(m0 m0Var, Object obj, Object obj2);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        x1 x1Var = x1.f35001c;
        x1Var.getClass();
        return x1Var.a(getClass()).j(this, (n0) obj);
    }

    public int getMemoizedHashCode() {
        return this.memoizedHashCode;
    }

    public int getMemoizedSerializedSize() {
        return this.memoizedSerializedSize & LayoutNode.NotPlacedPlaceOrder;
    }

    public final v1 getParserForType() {
        return (v1) dynamicMethod(m0.f34907g);
    }

    @Override // com.google.protobuf.c
    public int getSerializedSize(b2 b2Var) {
        int i5;
        int i11;
        if (isMutable()) {
            if (b2Var == null) {
                x1 x1Var = x1.f35001c;
                x1Var.getClass();
                i11 = x1Var.a(getClass()).i(this);
            } else {
                i11 = b2Var.i(this);
            }
            if (i11 >= 0) {
                return i11;
            }
            throw new IllegalStateException(b.c0.h(i11, "serialized size must be non-negative, was "));
        }
        if (getMemoizedSerializedSize() != Integer.MAX_VALUE) {
            return getMemoizedSerializedSize();
        }
        if (b2Var == null) {
            x1 x1Var2 = x1.f35001c;
            x1Var2.getClass();
            i5 = x1Var2.a(getClass()).i(this);
        } else {
            i5 = b2Var.i(this);
        }
        setMemoizedSerializedSize(i5);
        return i5;
    }

    public int hashCode() {
        if (isMutable()) {
            return computeHashCode();
        }
        if (hashCodeIsNotMemoized()) {
            setMemoizedHashCode(computeHashCode());
        }
        return getMemoizedHashCode();
    }

    public boolean hashCodeIsNotMemoized() {
        return getMemoizedHashCode() == 0;
    }

    @Override // com.google.protobuf.p1
    public final boolean isInitialized() {
        return isInitialized(this, true);
    }

    public boolean isMutable() {
        return (this.memoizedSerializedSize & Integer.MIN_VALUE) != 0;
    }

    public void makeImmutable() {
        x1 x1Var = x1.f35001c;
        x1Var.getClass();
        x1Var.a(getClass()).b(this);
        markImmutable();
    }

    public void markImmutable() {
        this.memoizedSerializedSize &= LayoutNode.NotPlacedPlaceOrder;
    }

    public void mergeLengthDelimitedField(int i5, l lVar) {
        if (this.unknownFields == g2.f34861f) {
            this.unknownFields = new g2();
        }
        g2 g2Var = this.unknownFields;
        g2Var.a();
        if (i5 == 0) {
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }
        g2Var.f((i5 << 3) | 2, lVar);
    }

    public final void mergeUnknownFields(g2 g2Var) {
        this.unknownFields = g2.e(this.unknownFields, g2Var);
    }

    public void mergeVarintField(int i5, int i11) {
        if (this.unknownFields == g2.f34861f) {
            this.unknownFields = new g2();
        }
        g2 g2Var = this.unknownFields;
        g2Var.a();
        if (i5 == 0) {
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }
        g2Var.f(i5 << 3, Long.valueOf(i11));
    }

    public n0 newMutableInstance() {
        return (n0) dynamicMethod(m0.f34904d);
    }

    public boolean parseUnknownField(int i5, p pVar) throws IOException {
        if ((i5 & 7) == 4) {
            return false;
        }
        if (this.unknownFields == g2.f34861f) {
            this.unknownFields = new g2();
        }
        return this.unknownFields.d(i5, pVar);
    }

    public void setMemoizedHashCode(int i5) {
        this.memoizedHashCode = i5;
    }

    public void setMemoizedSerializedSize(int i5) {
        if (i5 < 0) {
            throw new IllegalStateException(b.c0.h(i5, "serialized size must be non-negative, was "));
        }
        this.memoizedSerializedSize = (i5 & LayoutNode.NotPlacedPlaceOrder) | (this.memoizedSerializedSize & Integer.MIN_VALUE);
    }

    public String toString() {
        String string = super.toString();
        char[] cArr = q1.f34943a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("# ");
        sb2.append(string);
        q1.c(this, sb2, 0);
        return sb2.toString();
    }

    @Override // com.google.protobuf.o1
    public void writeTo(t tVar) throws IOException {
        x1 x1Var = x1.f35001c;
        x1Var.getClass();
        b2 b2VarA = x1Var.a(getClass());
        h1 h1Var = tVar.f34972a;
        if (h1Var == null) {
            h1Var = new h1(tVar);
        }
        b2VarA.e(this, h1Var);
    }

    public static final <T extends n0> boolean isInitialized(T t6, boolean z11) {
        byte bByteValue = ((Byte) t6.dynamicMethod(m0.f34901a)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        x1 x1Var = x1.f35001c;
        x1Var.getClass();
        boolean zC = x1Var.a(t6.getClass()).c(t6);
        if (z11) {
            t6.dynamicMethod(m0.f34902b, zC ? t6 : null);
        }
        return zC;
    }

    public final <MessageType extends n0, BuilderType extends f0> BuilderType createBuilder(MessageType messagetype) {
        return (BuilderType) createBuilder().mergeFrom((n0) messagetype);
    }

    public Object dynamicMethod(m0 m0Var) {
        return dynamicMethod(m0Var, null, null);
    }

    @Override // com.google.protobuf.p1
    public final n0 getDefaultInstanceForType() {
        return (n0) dynamicMethod(m0.f34906f);
    }

    @Override // com.google.protobuf.o1
    public final f0 newBuilderForType() {
        return (f0) dynamicMethod(m0.f34905e);
    }

    @Override // com.google.protobuf.o1
    public final f0 toBuilder() {
        return ((f0) dynamicMethod(m0.f34905e)).mergeFrom(this);
    }

    public static <T extends n0> T parseDelimitedFrom(T t6, InputStream inputStream, y yVar) throws InvalidProtocolBufferException {
        T t9 = (T) c(t6, inputStream, yVar);
        b(t9);
        return t9;
    }

    public static y0 mutableCopy(y0 y0Var) {
        int size = y0Var.size();
        return ((f1) y0Var).m(size == 0 ? 10 : size * 2);
    }

    public static u0 mutableCopy(u0 u0Var) {
        int size = u0Var.size();
        return ((d0) u0Var).m(size == 0 ? 10 : size * 2);
    }

    public static q0 mutableCopy(q0 q0Var) {
        int size = q0Var.size();
        return ((u) q0Var).m(size == 0 ? 10 : size * 2);
    }

    public static <T extends n0> T parseFrom(T t6, ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
        return (T) parseFrom(t6, byteBuffer, y.b());
    }

    public static p0 mutableCopy(p0 p0Var) {
        int size = p0Var.size();
        return ((h) p0Var).m(size == 0 ? 10 : size * 2);
    }

    public static <T extends n0> T parseFrom(T t6, l lVar) throws InvalidProtocolBufferException {
        T t9 = (T) parseFrom(t6, lVar, y.b());
        b(t9);
        return t9;
    }

    public static <E> z0 mutableCopy(z0 z0Var) {
        int size = z0Var.size();
        return z0Var.m(size == 0 ? 10 : size * 2);
    }

    public static <T extends n0> T parseFrom(T t6, l lVar, y yVar) throws InvalidProtocolBufferException {
        p pVarJ = lVar.j();
        T t9 = (T) parsePartialFrom(t6, pVarJ, yVar);
        pVarJ.a(0);
        b(t9);
        return t9;
    }

    public static <T extends n0> T parseFrom(T t6, byte[] bArr) throws InvalidProtocolBufferException {
        T t9 = (T) d(t6, bArr, 0, bArr.length, y.b());
        b(t9);
        return t9;
    }

    public static <T extends n0> T parseFrom(T t6, byte[] bArr, y yVar) throws InvalidProtocolBufferException {
        T t9 = (T) d(t6, bArr, 0, bArr.length, yVar);
        b(t9);
        return t9;
    }

    public static <T extends n0> T parsePartialFrom(T t6, p pVar) throws InvalidProtocolBufferException {
        return (T) parsePartialFrom(t6, pVar, y.b());
    }

    @Override // com.google.protobuf.o1
    public int getSerializedSize() {
        return getSerializedSize(null);
    }

    public static <T extends n0> T parseFrom(T t6, InputStream inputStream) throws InvalidProtocolBufferException {
        T t9 = (T) parsePartialFrom(t6, p.i(inputStream), y.b());
        b(t9);
        return t9;
    }

    public static <T extends n0> T parseFrom(T t6, InputStream inputStream, y yVar) throws InvalidProtocolBufferException {
        T t9 = (T) parsePartialFrom(t6, p.i(inputStream), yVar);
        b(t9);
        return t9;
    }

    public static <T extends n0> T parseFrom(T t6, p pVar) throws InvalidProtocolBufferException {
        return (T) parseFrom(t6, pVar, y.b());
    }

    public static <T extends n0> T parseFrom(T t6, p pVar, y yVar) throws InvalidProtocolBufferException {
        T t9 = (T) parsePartialFrom(t6, pVar, yVar);
        b(t9);
        return t9;
    }
}
