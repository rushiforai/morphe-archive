package com.fyber.inneractive.sdk.protobuf;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class UInt64Value extends z0 implements e2 {
    private static final UInt64Value DEFAULT_INSTANCE;
    private static volatile m2 PARSER = null;
    public static final int VALUE_FIELD_NUMBER = 1;
    private long value_;

    static {
        UInt64Value uInt64Value = new UInt64Value();
        DEFAULT_INSTANCE = uInt64Value;
        z0.registerDefaultInstance(UInt64Value.class, uInt64Value);
    }

    private UInt64Value() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearValue() {
        this.value_ = 0L;
    }

    public static UInt64Value getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static l3 newBuilder() {
        return (l3) DEFAULT_INSTANCE.createBuilder();
    }

    public static UInt64Value of(long j11) {
        l3 l3VarNewBuilder = newBuilder();
        l3VarNewBuilder.c();
        ((UInt64Value) l3VarNewBuilder.f30901b).setValue(j11);
        return (UInt64Value) l3VarNewBuilder.a();
    }

    public static UInt64Value parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (UInt64Value) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static UInt64Value parseFrom(ByteBuffer byteBuffer) throws n1 {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static m2 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setValue(long j11) {
        this.value_ = j11;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0
    public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
        m2 u0Var;
        switch (k3.f30843a[y0Var.ordinal()]) {
            case 1:
                return new UInt64Value();
            case 2:
                return new l3();
            case 3:
                return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u0003", new Object[]{"value_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                m2 m2Var = PARSER;
                if (m2Var != null) {
                    return m2Var;
                }
                synchronized (UInt64Value.class) {
                    try {
                        u0Var = PARSER;
                        if (u0Var == null) {
                            u0Var = new u0();
                            PARSER = u0Var;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return u0Var;
            case 6:
                return (byte) 1;
            case 7:
                return null;
            default:
                throw new UnsupportedOperationException();
        }
    }

    public long getValue() {
        return this.value_;
    }

    public static l3 newBuilder(UInt64Value uInt64Value) {
        return (l3) DEFAULT_INSTANCE.createBuilder(uInt64Value);
    }

    public static UInt64Value parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (UInt64Value) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static UInt64Value parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
    }

    public static UInt64Value parseFrom(s sVar) throws n1 {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, sVar);
    }

    public static UInt64Value parseFrom(s sVar, h0 h0Var) throws n1 {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
    }

    public static UInt64Value parseFrom(byte[] bArr) throws n1 {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static UInt64Value parseFrom(byte[] bArr, h0 h0Var) throws n1 {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
    }

    public static UInt64Value parseFrom(InputStream inputStream) throws IOException {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static UInt64Value parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static UInt64Value parseFrom(w wVar) throws IOException {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, wVar);
    }

    public static UInt64Value parseFrom(w wVar, h0 h0Var) throws IOException {
        return (UInt64Value) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
    }
}
