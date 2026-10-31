package com.fyber.inneractive.sdk.protobuf;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class UInt32Value extends z0 implements e2 {
    private static final UInt32Value DEFAULT_INSTANCE;
    private static volatile m2 PARSER = null;
    public static final int VALUE_FIELD_NUMBER = 1;
    private int value_;

    static {
        UInt32Value uInt32Value = new UInt32Value();
        DEFAULT_INSTANCE = uInt32Value;
        z0.registerDefaultInstance(UInt32Value.class, uInt32Value);
    }

    private UInt32Value() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearValue() {
        this.value_ = 0;
    }

    public static UInt32Value getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static j3 newBuilder() {
        return (j3) DEFAULT_INSTANCE.createBuilder();
    }

    public static UInt32Value of(int i5) {
        j3 j3VarNewBuilder = newBuilder();
        j3VarNewBuilder.c();
        ((UInt32Value) j3VarNewBuilder.f30901b).setValue(i5);
        return (UInt32Value) j3VarNewBuilder.a();
    }

    public static UInt32Value parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (UInt32Value) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static UInt32Value parseFrom(ByteBuffer byteBuffer) throws n1 {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static m2 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setValue(int i5) {
        this.value_ = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0
    public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
        m2 u0Var;
        switch (i3.f30833a[y0Var.ordinal()]) {
            case 1:
                return new UInt32Value();
            case 2:
                return new j3();
            case 3:
                return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000b", new Object[]{"value_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                m2 m2Var = PARSER;
                if (m2Var != null) {
                    return m2Var;
                }
                synchronized (UInt32Value.class) {
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

    public int getValue() {
        return this.value_;
    }

    public static j3 newBuilder(UInt32Value uInt32Value) {
        return (j3) DEFAULT_INSTANCE.createBuilder(uInt32Value);
    }

    public static UInt32Value parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (UInt32Value) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static UInt32Value parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
    }

    public static UInt32Value parseFrom(s sVar) throws n1 {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, sVar);
    }

    public static UInt32Value parseFrom(s sVar, h0 h0Var) throws n1 {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
    }

    public static UInt32Value parseFrom(byte[] bArr) throws n1 {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static UInt32Value parseFrom(byte[] bArr, h0 h0Var) throws n1 {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
    }

    public static UInt32Value parseFrom(InputStream inputStream) throws IOException {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static UInt32Value parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static UInt32Value parseFrom(w wVar) throws IOException {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, wVar);
    }

    public static UInt32Value parseFrom(w wVar, h0 h0Var) throws IOException {
        return (UInt32Value) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
    }
}
