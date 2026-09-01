package com.google.protobuf;

import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import defpackage.aq1;
import defpackage.ay0;
import defpackage.b09;
import defpackage.b46;
import defpackage.brb;
import defpackage.cz7;
import defpackage.f21;
import defpackage.f75;
import defpackage.j6f;
import defpackage.jn4;
import defpackage.k74;
import defpackage.ka7;
import defpackage.l70;
import defpackage.lg8;
import defpackage.m56;
import defpackage.n56;
import defpackage.n75;
import defpackage.o1;
import defpackage.p56;
import defpackage.p74;
import defpackage.p75;
import defpackage.q49;
import defpackage.q56;
import defpackage.q75;
import defpackage.qt0;
import defpackage.r1;
import defpackage.r2e;
import defpackage.r56;
import defpackage.s56;
import defpackage.sp1;
import defpackage.ssa;
import defpackage.t56;
import defpackage.t7a;
import defpackage.v7a;
import defpackage.vi3;
import defpackage.ygf;
import defpackage.zm7;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class e extends r1 {
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

    public static p75 access$000(k74 k74Var) {
        k74Var.getClass();
        return (p75) k74Var;
    }

    public static void b(e eVar) throws InvalidProtocolBufferException {
        if (eVar != null && !eVar.isInitialized()) {
            throw new InvalidProtocolBufferException(eVar.newUninitializedMessageException().getMessage());
        }
    }

    public static e c(e eVar, InputStream inputStream, p74 p74Var) throws InvalidProtocolBufferException {
        try {
            int i = inputStream.read();
            if (i == -1) {
                return null;
            }
            sp1 sp1VarF = sp1.f(new o1(inputStream, sp1.s(inputStream, i), 1));
            e partialFrom = parsePartialFrom(eVar, sp1VarF, p74Var);
            sp1VarF.a(0);
            return partialFrom;
        } catch (InvalidProtocolBufferException e) {
            if (e.a) {
                throw new InvalidProtocolBufferException(e.getMessage(), e);
            }
            throw e;
        } catch (IOException e2) {
            throw new InvalidProtocolBufferException(e2.getMessage(), e2);
        }
    }

    public static e d(e eVar, byte[] bArr, int i, int i2, p74 p74Var) throws InvalidProtocolBufferException {
        e eVarNewMutableInstance = eVar.newMutableInstance();
        try {
            t7a t7aVar = t7a.c;
            t7aVar.getClass();
            brb brbVarA = t7aVar.a(eVarNewMutableInstance.getClass());
            brbVarA.j(eVarNewMutableInstance, bArr, i, i + i2, new l70(p74Var));
            brbVarA.b(eVarNewMutableInstance);
            return eVarNewMutableInstance;
        } catch (InvalidProtocolBufferException e) {
            if (e.a) {
                throw new InvalidProtocolBufferException(e.getMessage(), e);
            }
            throw e;
        } catch (UninitializedMessageException e2) {
            throw new InvalidProtocolBufferException(e2.getMessage());
        } catch (IOException e3) {
            if (e3.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e3.getCause());
            }
            throw new InvalidProtocolBufferException(e3.getMessage(), e3);
        } catch (IndexOutOfBoundsException unused) {
            throw InvalidProtocolBufferException.g();
        }
    }

    public static m56 emptyBooleanList() {
        return qt0.d;
    }

    public static n56 emptyDoubleList() {
        return vi3.d;
    }

    public static q56 emptyFloatList() {
        return jn4.d;
    }

    public static r56 emptyIntList() {
        return b46.d;
    }

    public static s56 emptyLongList() {
        return ka7.d;
    }

    public static <E> t56 emptyProtobufList() {
        return v7a.d;
    }

    public static <T extends e> T getDefaultInstance(Class<T> cls) {
        T t = (T) defaultInstanceMap.get(cls);
        if (t == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                t = (T) defaultInstanceMap.get(cls);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException("Class initialization cannot fail.", e);
            }
        }
        if (t != null) {
            return t;
        }
        try {
            T t2 = (T) ((e) r2e.a.allocateInstance(cls)).getDefaultInstanceForType();
            if (t2 != null) {
                defaultInstanceMap.put(cls, t2);
                return t2;
            }
            lg8.d();
            return null;
        } catch (InstantiationException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static Method getMethodOrDie(Class cls, String str, Class... clsArr) {
        try {
            return cls.getMethod(str, clsArr);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException("Generated message class \"" + cls.getName() + "\" missing method \"" + str + "\".", e);
        }
    }

    public static Object invokeOrDie(Method method, Object obj, Object... objArr) {
        try {
            return method.invoke(obj, objArr);
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

    public static final <T extends e> boolean isInitialized(T t, boolean z) {
        byte bByteValue = ((Byte) t.dynamicMethod(q75.GET_MEMOIZED_IS_INITIALIZED)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        t7a t7aVar = t7a.c;
        t7aVar.getClass();
        boolean zC = t7aVar.a(t.getClass()).c(t);
        if (z) {
            t.dynamicMethod(q75.SET_MEMOIZED_IS_INITIALIZED, zC ? t : null);
        }
        return zC;
    }

    public static r56 mutableCopy(r56 r56Var) {
        int i = ((b46) r56Var).c;
        int i2 = i == 0 ? 10 : i * 2;
        b46 b46Var = (b46) r56Var;
        if (i2 >= b46Var.c) {
            return new b46(b46Var.c, Arrays.copyOf(b46Var.b, i2));
        }
        lg8.r();
        return null;
    }

    public static Object newMessageInfo(cz7 cz7Var, String str, Object[] objArr) {
        return new ssa(cz7Var, str, objArr);
    }

    public static <ContainingType extends cz7, Type> p75 newRepeatedGeneratedExtension(ContainingType containingtype, cz7 cz7Var, p56 p56Var, int i, j6f j6fVar, boolean z, Class cls) {
        return new p75(containingtype, Collections.EMPTY_LIST, cz7Var, new n75(i, j6fVar, true, z));
    }

    public static <ContainingType extends cz7, Type> p75 newSingularGeneratedExtension(ContainingType containingtype, Type type, cz7 cz7Var, p56 p56Var, int i, j6f j6fVar, Class cls) {
        return new p75(containingtype, type, cz7Var, new n75(i, j6fVar, false, false));
    }

    public static <T extends e> T parseDelimitedFrom(T t, InputStream inputStream) throws InvalidProtocolBufferException {
        T t2 = (T) c(t, inputStream, p74.a());
        b(t2);
        return t2;
    }

    public static <T extends e> T parseFrom(T t, ByteBuffer byteBuffer, p74 p74Var) throws InvalidProtocolBufferException {
        sp1 sp1VarG;
        if (byteBuffer.hasArray()) {
            sp1VarG = sp1.g(byteBuffer.array(), byteBuffer.position() + byteBuffer.arrayOffset(), byteBuffer.remaining(), false);
        } else if (byteBuffer.isDirect() && r2e.d) {
            sp1VarG = new c(byteBuffer, false);
        } else {
            int iRemaining = byteBuffer.remaining();
            byte[] bArr = new byte[iRemaining];
            byteBuffer.duplicate().get(bArr);
            sp1VarG = sp1.g(bArr, 0, iRemaining, true);
        }
        T t2 = (T) parseFrom(t, sp1VarG, p74Var);
        b(t2);
        return t2;
    }

    public static <T extends e> T parsePartialFrom(T t, sp1 sp1Var, p74 p74Var) throws InvalidProtocolBufferException {
        T t2 = (T) t.newMutableInstance();
        try {
            t7a t7aVar = t7a.c;
            t7aVar.getClass();
            brb brbVarA = t7aVar.a(t2.getClass());
            d dVar = sp1Var.b;
            if (dVar == null) {
                dVar = new d(sp1Var);
            }
            brbVarA.e(t2, dVar, p74Var);
            brbVarA.b(t2);
            return t2;
        } catch (InvalidProtocolBufferException e) {
            if (e.a) {
                throw new InvalidProtocolBufferException(e.getMessage(), e);
            }
            throw e;
        } catch (UninitializedMessageException e2) {
            throw new InvalidProtocolBufferException(e2.getMessage());
        } catch (IOException e3) {
            if (e3.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e3.getCause());
            }
            throw new InvalidProtocolBufferException(e3.getMessage(), e3);
        } catch (RuntimeException e4) {
            if (e4.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e4.getCause());
            }
            throw e4;
        }
    }

    public static <T extends e> void registerDefaultInstance(Class<T> cls, T t) {
        t.markImmutable();
        defaultInstanceMap.put(cls, t);
    }

    public Object buildMessageInfo() {
        return dynamicMethod(q75.BUILD_MESSAGE_INFO);
    }

    public void clearMemoizedHashCode() {
        this.memoizedHashCode = 0;
    }

    public void clearMemoizedSerializedSize() {
        setMemoizedSerializedSize(Integer.MAX_VALUE);
    }

    public int computeHashCode() {
        t7a t7aVar = t7a.c;
        t7aVar.getClass();
        return t7aVar.a(getClass()).f(this);
    }

    public final <MessageType extends e, BuilderType extends f75> BuilderType createBuilder() {
        return (BuilderType) dynamicMethod(q75.NEW_BUILDER);
    }

    public Object dynamicMethod(q75 q75Var, Object obj) {
        return dynamicMethod(q75Var, obj, null);
    }

    public abstract Object dynamicMethod(q75 q75Var, Object obj, Object obj2);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        t7a t7aVar = t7a.c;
        t7aVar.getClass();
        return t7aVar.a(getClass()).h(this, (e) obj);
    }

    @Override // defpackage.ez7
    public final e getDefaultInstanceForType() {
        return (e) dynamicMethod(q75.GET_DEFAULT_INSTANCE);
    }

    public int getMemoizedHashCode() {
        return this.memoizedHashCode;
    }

    public int getMemoizedSerializedSize() {
        return this.memoizedSerializedSize & Integer.MAX_VALUE;
    }

    public final q49 getParserForType() {
        return (q49) dynamicMethod(q75.GET_PARSER);
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

    public boolean isMutable() {
        return (this.memoizedSerializedSize & MUTABLE_FLAG_MASK) != 0;
    }

    public void makeImmutable() {
        t7a t7aVar = t7a.c;
        t7aVar.getClass();
        t7aVar.a(getClass()).b(this);
        markImmutable();
    }

    public void markImmutable() {
        this.memoizedSerializedSize &= Integer.MAX_VALUE;
    }

    public void mergeLengthDelimitedField(int i, f21 f21Var) {
        k kVar = this.unknownFields;
        if (kVar == k.f) {
            kVar = new k();
            this.unknownFields = kVar;
        }
        kVar.a();
        if (i != 0) {
            kVar.f((i << 3) | 2, f21Var);
        } else {
            ay0.e("Zero is not a valid field number.");
        }
    }

    public final void mergeUnknownFields(k kVar) {
        this.unknownFields = k.e(this.unknownFields, kVar);
    }

    public void mergeVarintField(int i, int i2) {
        k kVar = this.unknownFields;
        if (kVar == k.f) {
            kVar = new k();
            this.unknownFields = kVar;
        }
        kVar.a();
        if (i != 0) {
            kVar.f(i << 3, Long.valueOf(i2));
        } else {
            ay0.e("Zero is not a valid field number.");
        }
    }

    @Override // defpackage.cz7
    public final f75 newBuilderForType() {
        return (f75) dynamicMethod(q75.NEW_BUILDER);
    }

    public e newMutableInstance() {
        return (e) dynamicMethod(q75.NEW_MUTABLE_INSTANCE);
    }

    public boolean parseUnknownField(int i, sp1 sp1Var) {
        if ((i & 7) == 4) {
            return false;
        }
        k kVar = this.unknownFields;
        if (kVar == k.f) {
            kVar = new k();
            this.unknownFields = kVar;
        }
        return kVar.d(i, sp1Var);
    }

    public void setMemoizedHashCode(int i) {
        this.memoizedHashCode = i;
    }

    public void setMemoizedSerializedSize(int i) {
        if (i < 0) {
            ygf.f(b09.w(i, "serialized size must be non-negative, was "));
        } else {
            this.memoizedSerializedSize = (i & Integer.MAX_VALUE) | (this.memoizedSerializedSize & MUTABLE_FLAG_MASK);
        }
    }

    public final f75 toBuilder() {
        return ((f75) dynamicMethod(q75.NEW_BUILDER)).mergeFrom(this);
    }

    public String toString() {
        String string = super.toString();
        char[] cArr = f.a;
        StringBuilder sb = new StringBuilder();
        sb.append("# ");
        sb.append(string);
        f.c(this, sb, 0);
        return sb.toString();
    }

    @Override // defpackage.cz7
    public void writeTo(aq1 aq1Var) {
        t7a t7aVar = t7a.c;
        t7aVar.getClass();
        brb brbVarA = t7aVar.a(getClass());
        zm7 zm7Var = aq1Var.a;
        if (zm7Var == null) {
            zm7Var = new zm7(aq1Var);
        }
        brbVarA.i(this, zm7Var);
    }

    @Override // defpackage.r1
    public int getSerializedSize(brb brbVar) {
        int iG;
        int iG2;
        if (isMutable()) {
            if (brbVar == null) {
                t7a t7aVar = t7a.c;
                t7aVar.getClass();
                iG2 = t7aVar.a(getClass()).g(this);
            } else {
                iG2 = brbVar.g(this);
            }
            if (iG2 >= 0) {
                return iG2;
            }
            ygf.f(b09.w(iG2, mBTDfueQiGWRV.lqwFQ));
            return 0;
        }
        if (getMemoizedSerializedSize() != Integer.MAX_VALUE) {
            return getMemoizedSerializedSize();
        }
        if (brbVar == null) {
            t7a t7aVar2 = t7a.c;
            t7aVar2.getClass();
            iG = t7aVar2.a(getClass()).g(this);
        } else {
            iG = brbVar.g(this);
        }
        setMemoizedSerializedSize(iG);
        return iG;
    }

    public Object dynamicMethod(q75 q75Var) {
        return dynamicMethod(q75Var, null, null);
    }

    public final <MessageType extends e, BuilderType extends f75> BuilderType createBuilder(MessageType messagetype) {
        return (BuilderType) createBuilder().mergeFrom((e) messagetype);
    }

    public static <T extends e> T parseDelimitedFrom(T t, InputStream inputStream, p74 p74Var) throws InvalidProtocolBufferException {
        T t2 = (T) c(t, inputStream, p74Var);
        b(t2);
        return t2;
    }

    public static s56 mutableCopy(s56 s56Var) {
        int i = ((ka7) s56Var).c;
        int i2 = i == 0 ? 10 : i * 2;
        ka7 ka7Var = (ka7) s56Var;
        if (i2 >= ka7Var.c) {
            return new ka7(ka7Var.c, Arrays.copyOf(ka7Var.b, i2));
        }
        lg8.r();
        return null;
    }

    public static q56 mutableCopy(q56 q56Var) {
        int i = ((jn4) q56Var).c;
        int i2 = i == 0 ? 10 : i * 2;
        jn4 jn4Var = (jn4) q56Var;
        if (i2 >= jn4Var.c) {
            return new jn4(jn4Var.c, Arrays.copyOf(jn4Var.b, i2));
        }
        lg8.r();
        return null;
    }

    public static n56 mutableCopy(n56 n56Var) {
        int i = ((vi3) n56Var).c;
        int i2 = i == 0 ? 10 : i * 2;
        vi3 vi3Var = (vi3) n56Var;
        if (i2 >= vi3Var.c) {
            return new vi3(vi3Var.c, Arrays.copyOf(vi3Var.b, i2));
        }
        lg8.r();
        return null;
    }

    public final boolean isInitialized() {
        return isInitialized(this, true);
    }

    public static m56 mutableCopy(m56 m56Var) {
        int i = ((qt0) m56Var).c;
        int i2 = i == 0 ? 10 : i * 2;
        qt0 qt0Var = (qt0) m56Var;
        if (i2 >= qt0Var.c) {
            return new qt0(Arrays.copyOf(qt0Var.b, i2), qt0Var.c);
        }
        lg8.r();
        return null;
    }

    public static <E> t56 mutableCopy(t56 t56Var) {
        int size = t56Var.size();
        return t56Var.h(size == 0 ? 10 : size * 2);
    }

    public static <T extends e> T parseFrom(T t, ByteBuffer byteBuffer) {
        return (T) parseFrom(t, byteBuffer, p74.a());
    }

    public static <T extends e> T parseFrom(T t, f21 f21Var) throws InvalidProtocolBufferException {
        T t2 = (T) parseFrom(t, f21Var, p74.a());
        b(t2);
        return t2;
    }

    public static <T extends e> T parseFrom(T t, f21 f21Var, p74 p74Var) throws InvalidProtocolBufferException {
        sp1 sp1VarQ = f21Var.q();
        T t2 = (T) parsePartialFrom(t, sp1VarQ, p74Var);
        sp1VarQ.a(0);
        b(t2);
        return t2;
    }

    public static <T extends e> T parseFrom(T t, byte[] bArr) throws InvalidProtocolBufferException {
        T t2 = (T) d(t, bArr, 0, bArr.length, p74.a());
        b(t2);
        return t2;
    }

    public static <T extends e> T parseFrom(T t, byte[] bArr, p74 p74Var) throws InvalidProtocolBufferException {
        T t2 = (T) d(t, bArr, 0, bArr.length, p74Var);
        b(t2);
        return t2;
    }

    public static <T extends e> T parseFrom(T t, InputStream inputStream) throws InvalidProtocolBufferException {
        T t2 = (T) parsePartialFrom(t, sp1.f(inputStream), p74.a());
        b(t2);
        return t2;
    }

    @Override // defpackage.cz7
    public int getSerializedSize() {
        return getSerializedSize(null);
    }

    public static <T extends e> T parseFrom(T t, InputStream inputStream, p74 p74Var) throws InvalidProtocolBufferException {
        T t2 = (T) parsePartialFrom(t, sp1.f(inputStream), p74Var);
        b(t2);
        return t2;
    }

    public static <T extends e> T parseFrom(T t, sp1 sp1Var) {
        return (T) parseFrom(t, sp1Var, p74.a());
    }

    public static <T extends e> T parseFrom(T t, sp1 sp1Var, p74 p74Var) throws InvalidProtocolBufferException {
        T t2 = (T) parsePartialFrom(t, sp1Var, p74Var);
        b(t2);
        return t2;
    }

    public static <T extends e> T parsePartialFrom(T t, sp1 sp1Var) {
        return (T) parsePartialFrom(t, sp1Var, p74.a());
    }
}
