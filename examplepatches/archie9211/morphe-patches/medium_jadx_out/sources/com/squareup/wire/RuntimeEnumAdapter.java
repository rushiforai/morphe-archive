package com.squareup.wire;

import com.squareup.wire.WireEnum;
import com.squareup.wire.internal.Internal;
import defpackage.g76;
import defpackage.gy2;
import defpackage.n1b;
import defpackage.wg6;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\u0018\u0000 \u0017*\b\b\u0000\u0010\u0001*\u00020\u00022\b\u0012\u0004\u0012\u0002H\u00010\u0003:\u0001\u0017B\u001f\b\u0000\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tB\u0017\b\u0016\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0005¢\u0006\u0004\b\b\u0010\nJ\b\u0010\r\u001a\u00020\fH\u0002J\u0015\u0010\u000e\u001a\u00028\u00002\u0006\u0010\u000f\u001a\u00020\u0010H\u0014¢\u0006\u0002\u0010\u0011J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0096\u0002J\b\u0010\u0016\u001a\u00020\u0010H\u0016R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lcom/squareup/wire/RuntimeEnumAdapter;", "E", "Lcom/squareup/wire/WireEnum;", "Lcom/squareup/wire/EnumAdapter;", "javaType", "Ljava/lang/Class;", "syntax", "Lcom/squareup/wire/Syntax;", "<init>", "(Ljava/lang/Class;Lcom/squareup/wire/Syntax;)V", "(Ljava/lang/Class;)V", "fromValueMethod", "Ljava/lang/reflect/Method;", "getFromValueMethod", "fromValue", "value", "", "(I)Lcom/squareup/wire/WireEnum;", "equals", "", "other", "", "hashCode", "Companion", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class RuntimeEnumAdapter<E extends WireEnum> extends EnumAdapter<E> {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private Method fromValueMethod;
    private final Class<E> javaType;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RuntimeEnumAdapter(Class<E> cls, Syntax syntax) {
        super(n1b.a.b(cls), syntax, Internal.getIdentityOrNull(cls));
        cls.getClass();
        syntax.getClass();
        this.javaType = cls;
    }

    public static final <E extends WireEnum> RuntimeEnumAdapter<E> create(Class<E> cls) {
        return INSTANCE.create(cls);
    }

    private final Method getFromValueMethod() throws NoSuchMethodException {
        Method method = this.fromValueMethod;
        if (method != null) {
            return method;
        }
        Method method2 = this.javaType.getMethod("fromValue", Integer.TYPE);
        this.fromValueMethod = method2;
        method2.getClass();
        return method2;
    }

    public final boolean equals(Object other) {
        return (other instanceof RuntimeEnumAdapter) && g76.L(((RuntimeEnumAdapter) other).getType(), getType());
    }

    @Override // com.squareup.wire.EnumAdapter
    public final E fromValue(int value) throws IllegalAccessException, InvocationTargetException {
        Object objInvoke = getFromValueMethod().invoke(null, Integer.valueOf(value));
        objInvoke.getClass();
        return (E) objInvoke;
    }

    public final int hashCode() {
        wg6 type = getType();
        if (type != null) {
            return type.hashCode();
        }
        return 0;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J&\u0010\u0004\u001a\b\u0012\u0004\u0012\u0002H\u00060\u0005\"\b\b\u0001\u0010\u0006*\u00020\u00072\f\u0010\b\u001a\b\u0012\u0004\u0012\u0002H\u00060\tH\u0007¨\u0006\n"}, d2 = {"Lcom/squareup/wire/RuntimeEnumAdapter$Companion;", "", "<init>", "()V", "create", "Lcom/squareup/wire/RuntimeEnumAdapter;", "E", "Lcom/squareup/wire/WireEnum;", "enumType", "Ljava/lang/Class;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final <E extends WireEnum> RuntimeEnumAdapter<E> create(Class<E> enumType) {
            enumType.getClass();
            return new RuntimeEnumAdapter<>(enumType, ProtoAdapter.INSTANCE.get(enumType).getSyntax());
        }

        public Companion(gy2 gy2Var) {
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public RuntimeEnumAdapter(Class<E> cls) {
        this(cls, Syntax.PROTO_2);
        cls.getClass();
    }
}
