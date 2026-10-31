package com.fyber.inneractive.sdk.ignite;

import com.fyber.inneractive.sdk.protobuf.e2;
import com.fyber.inneractive.sdk.protobuf.h0;
import com.fyber.inneractive.sdk.protobuf.m2;
import com.fyber.inneractive.sdk.protobuf.n1;
import com.fyber.inneractive.sdk.protobuf.u0;
import com.fyber.inneractive.sdk.protobuf.w;
import com.fyber.inneractive.sdk.protobuf.y0;
import com.fyber.inneractive.sdk.protobuf.z0;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class IgniteResponseOuterClass$IgniteResponse extends z0 implements e2 {
    public static final int CLIENTID_FIELD_NUMBER = 1;
    public static final int CLIENTSECRET_FIELD_NUMBER = 2;
    private static final IgniteResponseOuterClass$IgniteResponse DEFAULT_INSTANCE;
    private static volatile m2 PARSER;
    private int bitField0_;
    private String clientId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String clientSecret_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        IgniteResponseOuterClass$IgniteResponse igniteResponseOuterClass$IgniteResponse = new IgniteResponseOuterClass$IgniteResponse();
        DEFAULT_INSTANCE = igniteResponseOuterClass$IgniteResponse;
        z0.registerDefaultInstance(IgniteResponseOuterClass$IgniteResponse.class, igniteResponseOuterClass$IgniteResponse);
    }

    private IgniteResponseOuterClass$IgniteResponse() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearClientId() {
        this.bitField0_ &= -2;
        this.clientId_ = getDefaultInstance().getClientId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearClientSecret() {
        this.bitField0_ &= -3;
        this.clientSecret_ = getDefaultInstance().getClientSecret();
    }

    public static IgniteResponseOuterClass$IgniteResponse getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static q newBuilder() {
        return (q) DEFAULT_INSTANCE.createBuilder();
    }

    public static IgniteResponseOuterClass$IgniteResponse parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(ByteBuffer byteBuffer) throws n1 {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static m2 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setClientId(String str) {
        str.getClass();
        this.bitField0_ |= 1;
        this.clientId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setClientIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.clientId_ = sVar.f();
        this.bitField0_ |= 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setClientSecret(String str) {
        str.getClass();
        this.bitField0_ |= 2;
        this.clientSecret_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setClientSecretBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.clientSecret_ = sVar.f();
        this.bitField0_ |= 2;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0
    public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
        m2 u0Var;
        switch (p.f28494a[y0Var.ordinal()]) {
            case 1:
                return new IgniteResponseOuterClass$IgniteResponse();
            case 2:
                return new q();
            case 3:
                return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001", new Object[]{"bitField0_", "clientId_", "clientSecret_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                m2 m2Var = PARSER;
                if (m2Var != null) {
                    return m2Var;
                }
                synchronized (IgniteResponseOuterClass$IgniteResponse.class) {
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

    public String getClientId() {
        return this.clientId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getClientIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.clientId_);
    }

    public String getClientSecret() {
        return this.clientSecret_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getClientSecretBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.clientSecret_);
    }

    public boolean hasClientId() {
        return (this.bitField0_ & 1) != 0;
    }

    public boolean hasClientSecret() {
        return (this.bitField0_ & 2) != 0;
    }

    public static q newBuilder(IgniteResponseOuterClass$IgniteResponse igniteResponseOuterClass$IgniteResponse) {
        return (q) DEFAULT_INSTANCE.createBuilder(igniteResponseOuterClass$IgniteResponse);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar) throws n1 {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, sVar);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar, h0 h0Var) throws n1 {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(byte[] bArr) throws n1 {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(byte[] bArr, h0 h0Var) throws n1 {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(InputStream inputStream) throws IOException {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(w wVar) throws IOException {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, wVar);
    }

    public static IgniteResponseOuterClass$IgniteResponse parseFrom(w wVar, h0 h0Var) throws IOException {
        return (IgniteResponseOuterClass$IgniteResponse) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
    }
}
