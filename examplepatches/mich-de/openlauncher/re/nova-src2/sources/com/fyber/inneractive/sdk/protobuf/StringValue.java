package com.fyber.inneractive.sdk.protobuf;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class StringValue extends z0 implements e2 {
    private static final StringValue DEFAULT_INSTANCE;
    private static volatile m2 PARSER = null;
    public static final int VALUE_FIELD_NUMBER = 1;
    private String value_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        StringValue stringValue = new StringValue();
        DEFAULT_INSTANCE = stringValue;
        z0.registerDefaultInstance(StringValue.class, stringValue);
    }

    private StringValue() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearValue() {
        this.value_ = getDefaultInstance().getValue();
    }

    public static StringValue getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static g3 newBuilder() {
        return (g3) DEFAULT_INSTANCE.createBuilder();
    }

    public static StringValue of(String str) {
        g3 g3VarNewBuilder = newBuilder();
        g3VarNewBuilder.c();
        ((StringValue) g3VarNewBuilder.f30901b).setValue(str);
        return (StringValue) g3VarNewBuilder.a();
    }

    public static StringValue parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (StringValue) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static StringValue parseFrom(ByteBuffer byteBuffer) throws n1 {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static m2 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setValue(String str) {
        str.getClass();
        this.value_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setValueBytes(s sVar) throws IllegalArgumentException {
        sVar.getClass();
        b.checkByteStringIsUtf8(sVar);
        this.value_ = sVar.f();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0
    public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
        m2 u0Var;
        switch (f3.f30802a[y0Var.ordinal()]) {
            case 1:
                return new StringValue();
            case 2:
                return new g3();
            case 3:
                return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"value_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                m2 m2Var = PARSER;
                if (m2Var != null) {
                    return m2Var;
                }
                synchronized (StringValue.class) {
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

    public String getValue() {
        return this.value_;
    }

    public s getValueBytes() {
        return s.a(this.value_);
    }

    public static g3 newBuilder(StringValue stringValue) {
        return (g3) DEFAULT_INSTANCE.createBuilder(stringValue);
    }

    public static StringValue parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (StringValue) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static StringValue parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
    }

    public static StringValue parseFrom(s sVar) throws n1 {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, sVar);
    }

    public static StringValue parseFrom(s sVar, h0 h0Var) throws n1 {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
    }

    public static StringValue parseFrom(byte[] bArr) throws n1 {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static StringValue parseFrom(byte[] bArr, h0 h0Var) throws n1 {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
    }

    public static StringValue parseFrom(InputStream inputStream) throws IOException {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static StringValue parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static StringValue parseFrom(w wVar) throws IOException {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, wVar);
    }

    public static StringValue parseFrom(w wVar, h0 h0Var) throws IOException {
        return (StringValue) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
    }
}
