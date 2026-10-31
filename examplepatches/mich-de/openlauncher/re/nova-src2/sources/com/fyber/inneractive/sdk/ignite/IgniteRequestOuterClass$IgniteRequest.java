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
public final class IgniteRequestOuterClass$IgniteRequest extends z0 implements e2 {
    public static final int APPID_FIELD_NUMBER = 1;
    public static final int APPSIGNATURE_FIELD_NUMBER = 3;
    public static final int BUNDLE_FIELD_NUMBER = 2;
    private static final IgniteRequestOuterClass$IgniteRequest DEFAULT_INSTANCE;
    public static final int IGNITEPACKAGENAME_FIELD_NUMBER = 4;
    public static final int IGNITEVERSIONNAME_FIELD_NUMBER = 5;
    private static volatile m2 PARSER = null;
    public static final int SDKVERSION_FIELD_NUMBER = 6;
    private int bitField0_;
    private String appId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String bundle_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appSignature_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String ignitePackageName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String igniteVersionName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String sdkVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        IgniteRequestOuterClass$IgniteRequest igniteRequestOuterClass$IgniteRequest = new IgniteRequestOuterClass$IgniteRequest();
        DEFAULT_INSTANCE = igniteRequestOuterClass$IgniteRequest;
        z0.registerDefaultInstance(IgniteRequestOuterClass$IgniteRequest.class, igniteRequestOuterClass$IgniteRequest);
    }

    private IgniteRequestOuterClass$IgniteRequest() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAppId() {
        this.bitField0_ &= -2;
        this.appId_ = getDefaultInstance().getAppId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAppSignature() {
        this.bitField0_ &= -5;
        this.appSignature_ = getDefaultInstance().getAppSignature();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearBundle() {
        this.bitField0_ &= -3;
        this.bundle_ = getDefaultInstance().getBundle();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearIgnitePackageName() {
        this.bitField0_ &= -9;
        this.ignitePackageName_ = getDefaultInstance().getIgnitePackageName();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearIgniteVersionName() {
        this.bitField0_ &= -17;
        this.igniteVersionName_ = getDefaultInstance().getIgniteVersionName();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSdkVersion() {
        this.bitField0_ &= -33;
        this.sdkVersion_ = getDefaultInstance().getSdkVersion();
    }

    public static IgniteRequestOuterClass$IgniteRequest getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static o newBuilder() {
        return (o) DEFAULT_INSTANCE.createBuilder();
    }

    public static IgniteRequestOuterClass$IgniteRequest parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(ByteBuffer byteBuffer) throws n1 {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static m2 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAppId(String str) {
        str.getClass();
        this.bitField0_ |= 1;
        this.appId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAppIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.appId_ = sVar.f();
        this.bitField0_ |= 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAppSignature(String str) {
        str.getClass();
        this.bitField0_ |= 4;
        this.appSignature_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAppSignatureBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.appSignature_ = sVar.f();
        this.bitField0_ |= 4;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBundle(String str) {
        str.getClass();
        this.bitField0_ |= 2;
        this.bundle_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBundleBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.bundle_ = sVar.f();
        this.bitField0_ |= 2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgnitePackageName(String str) {
        str.getClass();
        this.bitField0_ |= 8;
        this.ignitePackageName_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgnitePackageNameBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.ignitePackageName_ = sVar.f();
        this.bitField0_ |= 8;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteVersionName(String str) {
        str.getClass();
        this.bitField0_ |= 16;
        this.igniteVersionName_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteVersionNameBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.igniteVersionName_ = sVar.f();
        this.bitField0_ |= 16;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSdkVersion(String str) {
        str.getClass();
        this.bitField0_ |= 32;
        this.sdkVersion_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSdkVersionBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.sdkVersion_ = sVar.f();
        this.bitField0_ |= 32;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0
    public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
        m2 u0Var;
        switch (n.f28493a[y0Var.ordinal()]) {
            case 1:
                return new IgniteRequestOuterClass$IgniteRequest();
            case 2:
                return new o();
            case 3:
                return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004ለ\u0003\u0005ለ\u0004\u0006ለ\u0005", new Object[]{"bitField0_", "appId_", "bundle_", "appSignature_", "ignitePackageName_", "igniteVersionName_", "sdkVersion_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                m2 m2Var = PARSER;
                if (m2Var != null) {
                    return m2Var;
                }
                synchronized (IgniteRequestOuterClass$IgniteRequest.class) {
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

    public String getAppId() {
        return this.appId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAppIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.appId_);
    }

    public String getAppSignature() {
        return this.appSignature_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAppSignatureBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.appSignature_);
    }

    public String getBundle() {
        return this.bundle_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getBundleBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.bundle_);
    }

    public String getIgnitePackageName() {
        return this.ignitePackageName_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getIgnitePackageNameBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.ignitePackageName_);
    }

    public String getIgniteVersionName() {
        return this.igniteVersionName_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getIgniteVersionNameBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.igniteVersionName_);
    }

    public String getSdkVersion() {
        return this.sdkVersion_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getSdkVersionBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.sdkVersion_);
    }

    public boolean hasAppId() {
        return (this.bitField0_ & 1) != 0;
    }

    public boolean hasAppSignature() {
        return (this.bitField0_ & 4) != 0;
    }

    public boolean hasBundle() {
        return (this.bitField0_ & 2) != 0;
    }

    public boolean hasIgnitePackageName() {
        return (this.bitField0_ & 8) != 0;
    }

    public boolean hasIgniteVersionName() {
        return (this.bitField0_ & 16) != 0;
    }

    public boolean hasSdkVersion() {
        return (this.bitField0_ & 32) != 0;
    }

    public static o newBuilder(IgniteRequestOuterClass$IgniteRequest igniteRequestOuterClass$IgniteRequest) {
        return (o) DEFAULT_INSTANCE.createBuilder(igniteRequestOuterClass$IgniteRequest);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar) throws n1 {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, sVar);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar, h0 h0Var) throws n1 {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(byte[] bArr) throws n1 {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(byte[] bArr, h0 h0Var) throws n1 {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(InputStream inputStream) throws IOException {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(w wVar) throws IOException {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, wVar);
    }

    public static IgniteRequestOuterClass$IgniteRequest parseFrom(w wVar, h0 h0Var) throws IOException {
        return (IgniteRequestOuterClass$IgniteRequest) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
    }
}
