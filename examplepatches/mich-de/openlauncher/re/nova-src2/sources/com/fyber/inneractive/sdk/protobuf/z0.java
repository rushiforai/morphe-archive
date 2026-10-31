package com.fyber.inneractive.sdk.protobuf;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public abstract class z0 extends b {
    private static Map<Object, z0> defaultInstanceMap = new ConcurrentHashMap();
    protected n3 unknownFields = n3.f30860f;
    protected int memoizedSerializedSize = -1;

    public static z0 a(z0 z0Var) throws n1 {
        if (z0Var == null || z0Var.isInitialized()) {
            return z0Var;
        }
        m3 m3VarNewUninitializedMessageException = z0Var.newUninitializedMessageException();
        m3VarNewUninitializedMessageException.getClass();
        throw new n1(m3VarNewUninitializedMessageException.getMessage());
    }

    public static x0 access$000(e0 e0Var) {
        e0Var.getClass();
        return (x0) e0Var;
    }

    public static b1 emptyBooleanList() {
        return j.f30834d;
    }

    public static c1 emptyDoubleList() {
        return d0.f30782d;
    }

    public static f1 emptyFloatList() {
        return q0.f30875d;
    }

    public static g1 emptyIntList() {
        return a1.f30761d;
    }

    public static j1 emptyLongList() {
        return u1.f30913d;
    }

    public static <E> k1 emptyProtobufList() {
        return q2.f30878d;
    }

    public static <T extends z0> T getDefaultInstance(Class<T> cls) throws ClassNotFoundException {
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
        try {
            T t9 = (T) ((z0) x3.f30953a.allocateInstance(cls)).getDefaultInstanceForType();
            if (t9 == null) {
                throw new IllegalStateException();
            }
            defaultInstanceMap.put(cls, t9);
            return t9;
        } catch (Throwable th2) {
            throw new IllegalStateException(th2);
        }
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

    public static g1 mutableCopy(g1 g1Var) {
        a1 a1Var = (a1) g1Var;
        int i5 = a1Var.f30763c;
        return a1Var.b(i5 == 0 ? 10 : i5 * 2);
    }

    public static Object newMessageInfo(d2 d2Var, String str, Object[] objArr) {
        return new r2(d2Var, str, objArr);
    }

    public static <ContainingType extends d2, Type> x0 newRepeatedGeneratedExtension(ContainingType containingtype, d2 d2Var, e1 e1Var, int i5, j4 j4Var, boolean z11, Class cls) {
        return new x0(containingtype, Collections.EMPTY_LIST, d2Var, new w0(e1Var, i5, j4Var, true, z11));
    }

    public static <ContainingType extends d2, Type> x0 newSingularGeneratedExtension(ContainingType containingtype, Type type, d2 d2Var, e1 e1Var, int i5, j4 j4Var, Class cls) {
        return new x0(containingtype, type, d2Var, new w0(e1Var, i5, j4Var, false, false));
    }

    public static <T extends z0> T parseDelimitedFrom(T t6, InputStream inputStream) throws n1 {
        return (T) a(a(t6, inputStream, h0.a()));
    }

    public static <T extends z0> T parseFrom(T t6, InputStream inputStream) throws n1 {
        w uVar;
        if (inputStream == null) {
            byte[] bArr = l1.f30848b;
            int length = bArr.length;
            uVar = new t(bArr, 0, length, false);
            try {
                uVar.d(length);
            } catch (n1 e3) {
                throw new IllegalArgumentException(e3);
            }
        } else {
            uVar = new u(inputStream);
        }
        return (T) a(parsePartialFrom(t6, uVar, h0.a()));
    }

    public static <T extends z0> T parsePartialFrom(T t6, w wVar, h0 h0Var) throws n1 {
        T t9 = (T) t6.dynamicMethod(y0.NEW_MUTABLE_INSTANCE);
        try {
            p2 p2Var = p2.f30870c;
            p2Var.getClass();
            t2 t2VarA = p2Var.a(t9.getClass());
            x xVar = wVar.f30931d;
            if (xVar == null) {
                xVar = new x(wVar);
            }
            t2VarA.a(t9, xVar, h0Var);
            t2VarA.c(t9);
            return t9;
        } catch (IOException e3) {
            if (e3.getCause() instanceof n1) {
                throw ((n1) e3.getCause());
            }
            throw new n1(e3.getMessage());
        } catch (RuntimeException e11) {
            if (e11.getCause() instanceof n1) {
                throw ((n1) e11.getCause());
            }
            throw e11;
        }
    }

    public static <T extends z0> void registerDefaultInstance(Class<T> cls, T t6) {
        defaultInstanceMap.put(cls, t6);
    }

    public Object buildMessageInfo() throws Exception {
        return dynamicMethod(y0.BUILD_MESSAGE_INFO);
    }

    public final <MessageType extends z0, BuilderType extends t0> BuilderType createBuilder() {
        return (BuilderType) dynamicMethod(y0.NEW_BUILDER);
    }

    public Object dynamicMethod(y0 y0Var, Object obj) {
        return dynamicMethod(y0Var, obj, null);
    }

    public abstract Object dynamicMethod(y0 y0Var, Object obj, Object obj2);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        p2 p2Var = p2.f30870c;
        p2Var.getClass();
        return p2Var.a(getClass()).b(this, (z0) obj);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b
    public int getMemoizedSerializedSize() {
        return this.memoizedSerializedSize;
    }

    public final m2 getParserForType() {
        return (m2) dynamicMethod(y0.GET_PARSER);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.d2
    public int getSerializedSize() {
        if (this.memoizedSerializedSize == -1) {
            p2 p2Var = p2.f30870c;
            p2Var.getClass();
            this.memoizedSerializedSize = p2Var.a(getClass()).b(this);
        }
        return this.memoizedSerializedSize;
    }

    public int hashCode() {
        int i5 = this.memoizedHashCode;
        if (i5 != 0) {
            return i5;
        }
        p2 p2Var = p2.f30870c;
        p2Var.getClass();
        int iD = p2Var.a(getClass()).d(this);
        this.memoizedHashCode = iD;
        return iD;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.e2
    public final boolean isInitialized() {
        return isInitialized(this, true);
    }

    public void makeImmutable() {
        p2 p2Var = p2.f30870c;
        p2Var.getClass();
        p2Var.a(getClass()).c(this);
    }

    public void mergeLengthDelimitedField(int i5, s sVar) {
        if (this.unknownFields == n3.f30860f) {
            this.unknownFields = new n3();
        }
        n3 n3Var = this.unknownFields;
        if (!n3Var.f30865e) {
            throw new UnsupportedOperationException();
        }
        if (i5 == 0) {
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }
        n3Var.a((i5 << 3) | 2, sVar);
    }

    public final void mergeUnknownFields(n3 n3Var) {
        this.unknownFields = n3.a(this.unknownFields, n3Var);
    }

    public void mergeVarintField(int i5, int i11) {
        if (this.unknownFields == n3.f30860f) {
            this.unknownFields = new n3();
        }
        n3 n3Var = this.unknownFields;
        if (!n3Var.f30865e) {
            throw new UnsupportedOperationException();
        }
        if (i5 == 0) {
            throw new IllegalArgumentException("Zero is not a valid field number.");
        }
        n3Var.a(i5 << 3, Long.valueOf(i11));
    }

    public boolean parseUnknownField(int i5, w wVar) throws IOException {
        if ((i5 & 7) == 4) {
            return false;
        }
        if (this.unknownFields == n3.f30860f) {
            this.unknownFields = new n3();
        }
        return this.unknownFields.a(i5, wVar);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b
    public void setMemoizedSerializedSize(int i5) {
        this.memoizedSerializedSize = i5;
    }

    public String toString() {
        String string = super.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("# ");
        sb2.append(string);
        f2.a(this, sb2, 0);
        return sb2.toString();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.d2
    public void writeTo(b0 b0Var) throws IOException {
        p2 p2Var = p2.f30870c;
        p2Var.getClass();
        t2 t2VarA = p2Var.a(getClass());
        c0 c0Var = b0Var.f30770a;
        if (c0Var == null) {
            c0Var = new c0(b0Var);
        }
        t2VarA.a((Object) this, c0Var);
    }

    public static final <T extends z0> boolean isInitialized(T t6, boolean z11) {
        byte bByteValue = ((Byte) t6.dynamicMethod(y0.GET_MEMOIZED_IS_INITIALIZED)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        p2 p2Var = p2.f30870c;
        p2Var.getClass();
        boolean zA = p2Var.a(t6.getClass()).a(t6);
        if (z11) {
            t6.dynamicMethod(y0.SET_MEMOIZED_IS_INITIALIZED, zA ? t6 : null);
        }
        return zA;
    }

    public final <MessageType extends z0, BuilderType extends t0> BuilderType createBuilder(MessageType messagetype) {
        BuilderType buildertype = (BuilderType) createBuilder();
        buildertype.c();
        t0.a(buildertype.f30901b, messagetype);
        return buildertype;
    }

    public Object dynamicMethod(y0 y0Var) {
        return dynamicMethod(y0Var, null, null);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.e2
    public final z0 getDefaultInstanceForType() {
        return (z0) dynamicMethod(y0.GET_DEFAULT_INSTANCE);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.d2
    public final t0 newBuilderForType() {
        return (t0) dynamicMethod(y0.NEW_BUILDER);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.d2
    public final t0 toBuilder() {
        t0 t0Var = (t0) dynamicMethod(y0.NEW_BUILDER);
        t0Var.c();
        t0.a(t0Var.f30901b, this);
        return t0Var;
    }

    public static j1 mutableCopy(j1 j1Var) {
        u1 u1Var = (u1) j1Var;
        int i5 = u1Var.f30915c;
        return u1Var.b(i5 == 0 ? 10 : i5 * 2);
    }

    public static <T extends z0> T parseDelimitedFrom(T t6, InputStream inputStream, h0 h0Var) throws n1 {
        return (T) a(a(t6, inputStream, h0Var));
    }

    public static z0 a(z0 z0Var, InputStream inputStream, h0 h0Var) throws IOException {
        try {
            int i5 = inputStream.read();
            if (i5 == -1) {
                return null;
            }
            if ((i5 & 128) != 0) {
                i5 &= Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                int i11 = 7;
                while (true) {
                    if (i11 < 32) {
                        int i12 = inputStream.read();
                        if (i12 == -1) {
                            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                        }
                        i5 |= (i12 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i11;
                        if ((i12 & 128) == 0) {
                            break;
                        }
                        i11 += 7;
                    } else {
                        while (i11 < 64) {
                            int i13 = inputStream.read();
                            if (i13 == -1) {
                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                            }
                            if ((i13 & 128) != 0) {
                                i11 += 7;
                            }
                        }
                        throw new n1("CodedInputStream encountered a malformed varint.");
                    }
                }
            }
            u uVar = new u(new a(inputStream, i5));
            z0 partialFrom = parsePartialFrom(z0Var, uVar, h0Var);
            uVar.a(0);
            return partialFrom;
        } catch (IOException e3) {
            throw new n1(e3.getMessage());
        }
    }

    public static f1 mutableCopy(f1 f1Var) {
        q0 q0Var = (q0) f1Var;
        int i5 = q0Var.f30877c;
        return q0Var.b(i5 == 0 ? 10 : i5 * 2);
    }

    public static c1 mutableCopy(c1 c1Var) {
        d0 d0Var = (d0) c1Var;
        int i5 = d0Var.f30784c;
        return d0Var.b(i5 == 0 ? 10 : i5 * 2);
    }

    public static <T extends z0> T parseFrom(T t6, InputStream inputStream, h0 h0Var) throws n1 {
        w uVar;
        if (inputStream == null) {
            byte[] bArr = l1.f30848b;
            int length = bArr.length;
            uVar = new t(bArr, 0, length, false);
            try {
                uVar.d(length);
            } catch (n1 e3) {
                throw new IllegalArgumentException(e3);
            }
        } else {
            uVar = new u(inputStream);
        }
        return (T) a(parsePartialFrom(t6, uVar, h0Var));
    }

    public static b1 mutableCopy(b1 b1Var) {
        j jVar = (j) b1Var;
        int i5 = jVar.f30836c;
        return jVar.b(i5 == 0 ? 10 : i5 * 2);
    }

    public static <T extends z0> T parsePartialFrom(T t6, byte[] bArr, int i5, int i11, h0 h0Var) throws n1 {
        T t9 = (T) t6.dynamicMethod(y0.NEW_MUTABLE_INSTANCE);
        try {
            p2 p2Var = p2.f30870c;
            p2Var.getClass();
            t2 t2VarA = p2Var.a(t9.getClass());
            t2VarA.a(t9, bArr, i5, i5 + i11, new f(h0Var));
            t2VarA.c(t9);
            if (t9.memoizedHashCode == 0) {
                return t9;
            }
            throw new RuntimeException();
        } catch (IOException e3) {
            if (e3.getCause() instanceof n1) {
                throw ((n1) e3.getCause());
            }
            throw new n1(e3.getMessage());
        } catch (IndexOutOfBoundsException unused) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }

    public static <E> k1 mutableCopy(k1 k1Var) {
        int size = k1Var.size();
        return k1Var.b(size == 0 ? 10 : size * 2);
    }

    public static <T extends z0> T parseFrom(T t6, ByteBuffer byteBuffer, h0 h0Var) throws n1 {
        t tVar;
        w vVar;
        if (byteBuffer.hasArray()) {
            byte[] bArrArray = byteBuffer.array();
            int iPosition = byteBuffer.position() + byteBuffer.arrayOffset();
            int iRemaining = byteBuffer.remaining();
            tVar = new t(bArrArray, iPosition, iRemaining, false);
            try {
                tVar.d(iRemaining);
            } catch (n1 e3) {
                throw new IllegalArgumentException(e3);
            }
        } else {
            if (byteBuffer.isDirect() && x3.f30956d) {
                vVar = new v(byteBuffer, false);
                return (T) a(parseFrom(t6, vVar, h0Var));
            }
            int iRemaining2 = byteBuffer.remaining();
            byte[] bArr = new byte[iRemaining2];
            byteBuffer.duplicate().get(bArr);
            t tVar2 = new t(bArr, 0, iRemaining2, true);
            try {
                tVar2.d(iRemaining2);
                tVar = tVar2;
            } catch (n1 e11) {
                throw new IllegalArgumentException(e11);
            }
        }
        vVar = tVar;
        return (T) a(parseFrom(t6, vVar, h0Var));
    }

    public static <T extends z0> T parsePartialFrom(T t6, w wVar) throws n1 {
        return (T) parsePartialFrom(t6, wVar, h0.a());
    }

    public static <T extends z0> T parseFrom(T t6, ByteBuffer byteBuffer) throws n1 {
        return (T) parseFrom(t6, byteBuffer, h0.a());
    }

    public static <T extends z0> T parseFrom(T t6, s sVar) throws n1 {
        return (T) a(parseFrom(t6, sVar, h0.a()));
    }

    public static <T extends z0> T parseFrom(T t6, s sVar, h0 h0Var) throws n1 {
        w wVarD = sVar.d();
        z0 partialFrom = parsePartialFrom(t6, wVarD, h0Var);
        wVarD.a(0);
        return (T) a(partialFrom);
    }

    public static <T extends z0> T parseFrom(T t6, byte[] bArr) throws n1 {
        return (T) a(parsePartialFrom(t6, bArr, 0, bArr.length, h0.a()));
    }

    public static <T extends z0> T parseFrom(T t6, byte[] bArr, h0 h0Var) throws n1 {
        return (T) a(parsePartialFrom(t6, bArr, 0, bArr.length, h0Var));
    }

    public static <T extends z0> T parseFrom(T t6, w wVar) throws n1 {
        return (T) parseFrom(t6, wVar, h0.a());
    }

    public static <T extends z0> T parseFrom(T t6, w wVar, h0 h0Var) throws n1 {
        return (T) a(parsePartialFrom(t6, wVar, h0Var));
    }
}
