package com.moloco.sdk;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.c;
import com.google.protobuf.f0;
import com.google.protobuf.g0;
import com.google.protobuf.j;
import com.google.protobuf.l;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.o1;
import com.google.protobuf.p;
import com.google.protobuf.p1;
import com.google.protobuf.r0;
import com.google.protobuf.s0;
import com.google.protobuf.t0;
import com.google.protobuf.v1;
import com.google.protobuf.y;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class BidToken {

    /* renamed from: com.moloco.sdk.BidToken$1, reason: invalid class name */
    /* loaded from: classes.dex */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke;

        static {
            int[] iArr = new int[m0.values().length];
            $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke = iArr;
            try {
                iArr[3] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[4] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[2] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[5] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[6] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[0] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[1] = 7;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    public static final class BidTokenRequestV2 extends n0 implements BidTokenRequestV2OrBuilder {
        public static final int BID_TOKEN_COMPONENTS_FIELD_NUMBER = 2;
        private static final BidTokenRequestV2 DEFAULT_INSTANCE;
        private static volatile v1 PARSER;
        private BidTokenComponents bidTokenComponents_;

        public static final class BidTokenComponents extends n0 implements BidTokenComponentsOrBuilder {
            private static final BidTokenComponents DEFAULT_INSTANCE;
            public static final int IDFV_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int PRIVACY_FIELD_NUMBER = 2;
            private int bitField0_;
            private String idfv_ = b.f42142b;
            private Privacy privacy_;

            public static final class Builder extends f0 implements BidTokenComponentsOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearIdfv() {
                    copyOnWrite();
                    ((BidTokenComponents) this.instance).clearIdfv();
                    return this;
                }

                public Builder clearPrivacy() {
                    copyOnWrite();
                    ((BidTokenComponents) this.instance).clearPrivacy();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
                public String getIdfv() {
                    return ((BidTokenComponents) this.instance).getIdfv();
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
                public l getIdfvBytes() {
                    return ((BidTokenComponents) this.instance).getIdfvBytes();
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
                public Privacy getPrivacy() {
                    return ((BidTokenComponents) this.instance).getPrivacy();
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
                public boolean hasIdfv() {
                    return ((BidTokenComponents) this.instance).hasIdfv();
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
                public boolean hasPrivacy() {
                    return ((BidTokenComponents) this.instance).hasPrivacy();
                }

                public Builder mergePrivacy(Privacy privacy) {
                    copyOnWrite();
                    ((BidTokenComponents) this.instance).mergePrivacy(privacy);
                    return this;
                }

                public Builder setIdfv(String str) {
                    copyOnWrite();
                    ((BidTokenComponents) this.instance).setIdfv(str);
                    return this;
                }

                public Builder setIdfvBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((BidTokenComponents) this.instance).setIdfvBytes(lVar);
                    return this;
                }

                public Builder setPrivacy(Privacy privacy) {
                    copyOnWrite();
                    ((BidTokenComponents) this.instance).setPrivacy(privacy);
                    return this;
                }

                private Builder() {
                    super(BidTokenComponents.DEFAULT_INSTANCE);
                }

                public Builder setPrivacy(Privacy.Builder builder) {
                    copyOnWrite();
                    ((BidTokenComponents) this.instance).setPrivacy((Privacy) builder.build());
                    return this;
                }
            }

            public static final class Privacy extends n0 implements PrivacyOrBuilder {
                public static final int CCPA_FIELD_NUMBER = 1;
                public static final int COPPA_FIELD_NUMBER = 3;
                private static final Privacy DEFAULT_INSTANCE;
                public static final int GDPR_FIELD_NUMBER = 2;
                private static volatile v1 PARSER = null;
                public static final int TCF_CONSENT_STRING_FIELD_NUMBER = 5;
                public static final int US_PRIVACY_FIELD_NUMBER = 4;
                private int bitField0_;
                private boolean ccpa_;
                private boolean coppa_;
                private boolean gdpr_;
                private String usPrivacy_ = b.f42142b;
                private String tcfConsentString_ = b.f42142b;

                public static final class Builder extends f0 implements PrivacyOrBuilder {
                    public /* synthetic */ Builder(int i5) {
                        this();
                    }

                    public Builder clearCcpa() {
                        copyOnWrite();
                        ((Privacy) this.instance).clearCcpa();
                        return this;
                    }

                    public Builder clearCoppa() {
                        copyOnWrite();
                        ((Privacy) this.instance).clearCoppa();
                        return this;
                    }

                    public Builder clearGdpr() {
                        copyOnWrite();
                        ((Privacy) this.instance).clearGdpr();
                        return this;
                    }

                    public Builder clearTcfConsentString() {
                        copyOnWrite();
                        ((Privacy) this.instance).clearTcfConsentString();
                        return this;
                    }

                    public Builder clearUsPrivacy() {
                        copyOnWrite();
                        ((Privacy) this.instance).clearUsPrivacy();
                        return this;
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean getCcpa() {
                        return ((Privacy) this.instance).getCcpa();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean getCoppa() {
                        return ((Privacy) this.instance).getCoppa();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean getGdpr() {
                        return ((Privacy) this.instance).getGdpr();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public String getTcfConsentString() {
                        return ((Privacy) this.instance).getTcfConsentString();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public l getTcfConsentStringBytes() {
                        return ((Privacy) this.instance).getTcfConsentStringBytes();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public String getUsPrivacy() {
                        return ((Privacy) this.instance).getUsPrivacy();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public l getUsPrivacyBytes() {
                        return ((Privacy) this.instance).getUsPrivacyBytes();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean hasCcpa() {
                        return ((Privacy) this.instance).hasCcpa();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean hasCoppa() {
                        return ((Privacy) this.instance).hasCoppa();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean hasGdpr() {
                        return ((Privacy) this.instance).hasGdpr();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean hasTcfConsentString() {
                        return ((Privacy) this.instance).hasTcfConsentString();
                    }

                    @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                    public boolean hasUsPrivacy() {
                        return ((Privacy) this.instance).hasUsPrivacy();
                    }

                    public Builder setCcpa(boolean z11) {
                        copyOnWrite();
                        ((Privacy) this.instance).setCcpa(z11);
                        return this;
                    }

                    public Builder setCoppa(boolean z11) {
                        copyOnWrite();
                        ((Privacy) this.instance).setCoppa(z11);
                        return this;
                    }

                    public Builder setGdpr(boolean z11) {
                        copyOnWrite();
                        ((Privacy) this.instance).setGdpr(z11);
                        return this;
                    }

                    public Builder setTcfConsentString(String str) {
                        copyOnWrite();
                        ((Privacy) this.instance).setTcfConsentString(str);
                        return this;
                    }

                    public Builder setTcfConsentStringBytes(l lVar) throws IllegalArgumentException {
                        copyOnWrite();
                        ((Privacy) this.instance).setTcfConsentStringBytes(lVar);
                        return this;
                    }

                    public Builder setUsPrivacy(String str) {
                        copyOnWrite();
                        ((Privacy) this.instance).setUsPrivacy(str);
                        return this;
                    }

                    public Builder setUsPrivacyBytes(l lVar) throws IllegalArgumentException {
                        copyOnWrite();
                        ((Privacy) this.instance).setUsPrivacyBytes(lVar);
                        return this;
                    }

                    private Builder() {
                        super(Privacy.DEFAULT_INSTANCE);
                    }
                }

                static {
                    Privacy privacy = new Privacy();
                    DEFAULT_INSTANCE = privacy;
                    n0.registerDefaultInstance(Privacy.class, privacy);
                }

                private Privacy() {
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearCcpa() {
                    this.bitField0_ &= -2;
                    this.ccpa_ = false;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearCoppa() {
                    this.bitField0_ &= -5;
                    this.coppa_ = false;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearGdpr() {
                    this.bitField0_ &= -3;
                    this.gdpr_ = false;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearTcfConsentString() {
                    this.bitField0_ &= -17;
                    this.tcfConsentString_ = getDefaultInstance().getTcfConsentString();
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearUsPrivacy() {
                    this.bitField0_ &= -9;
                    this.usPrivacy_ = getDefaultInstance().getUsPrivacy();
                }

                public static Privacy getDefaultInstance() {
                    return DEFAULT_INSTANCE;
                }

                public static Builder newBuilder() {
                    return (Builder) DEFAULT_INSTANCE.createBuilder();
                }

                public static Privacy parseDelimitedFrom(InputStream inputStream) throws IOException {
                    return (Privacy) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static Privacy parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
                }

                public static v1 parser() {
                    return DEFAULT_INSTANCE.getParserForType();
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setCcpa(boolean z11) {
                    this.bitField0_ |= 1;
                    this.ccpa_ = z11;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setCoppa(boolean z11) {
                    this.bitField0_ |= 4;
                    this.coppa_ = z11;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setGdpr(boolean z11) {
                    this.bitField0_ |= 2;
                    this.gdpr_ = z11;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setTcfConsentString(String str) {
                    str.getClass();
                    this.bitField0_ |= 16;
                    this.tcfConsentString_ = str;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setTcfConsentStringBytes(l lVar) throws IllegalArgumentException {
                    c.checkByteStringIsUtf8(lVar);
                    this.tcfConsentString_ = lVar.o();
                    this.bitField0_ |= 16;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setUsPrivacy(String str) {
                    str.getClass();
                    this.bitField0_ |= 8;
                    this.usPrivacy_ = str;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setUsPrivacyBytes(l lVar) throws IllegalArgumentException {
                    c.checkByteStringIsUtf8(lVar);
                    this.usPrivacy_ = lVar.o();
                    this.bitField0_ |= 8;
                }

                @Override // com.google.protobuf.n0
                public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                    v1 g0Var;
                    switch (m0Var.ordinal()) {
                        case 0:
                            return (byte) 1;
                        case 1:
                            return null;
                        case 2:
                            return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004ለ\u0003\u0005ለ\u0004", new Object[]{"bitField0_", "ccpa_", "gdpr_", "coppa_", "usPrivacy_", "tcfConsentString_"});
                        case 3:
                            return new Privacy();
                        case 4:
                            return new Builder(0);
                        case 5:
                            return DEFAULT_INSTANCE;
                        case 6:
                            v1 v1Var = PARSER;
                            if (v1Var != null) {
                                return v1Var;
                            }
                            synchronized (Privacy.class) {
                                try {
                                    g0Var = PARSER;
                                    if (g0Var == null) {
                                        g0Var = new g0();
                                        PARSER = g0Var;
                                    }
                                } catch (Throwable th2) {
                                    throw th2;
                                }
                            }
                            return g0Var;
                        default:
                            throw new UnsupportedOperationException();
                    }
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean getCcpa() {
                    return this.ccpa_;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean getCoppa() {
                    return this.coppa_;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean getGdpr() {
                    return this.gdpr_;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public String getTcfConsentString() {
                    return this.tcfConsentString_;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public l getTcfConsentStringBytes() {
                    return l.f(this.tcfConsentString_);
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public String getUsPrivacy() {
                    return this.usPrivacy_;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public l getUsPrivacyBytes() {
                    return l.f(this.usPrivacy_);
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean hasCcpa() {
                    return (this.bitField0_ & 1) != 0;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean hasCoppa() {
                    return (this.bitField0_ & 4) != 0;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean hasGdpr() {
                    return (this.bitField0_ & 2) != 0;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean hasTcfConsentString() {
                    return (this.bitField0_ & 16) != 0;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponents.PrivacyOrBuilder
                public boolean hasUsPrivacy() {
                    return (this.bitField0_ & 8) != 0;
                }

                public static Builder newBuilder(Privacy privacy) {
                    return (Builder) DEFAULT_INSTANCE.createBuilder(privacy);
                }

                public static Privacy parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                    return (Privacy) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static Privacy parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
                }

                public static Privacy parseFrom(l lVar) throws InvalidProtocolBufferException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, lVar);
                }

                public static Privacy parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
                }

                public static Privacy parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, bArr);
                }

                public static Privacy parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
                }

                public static Privacy parseFrom(InputStream inputStream) throws IOException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static Privacy parseFrom(InputStream inputStream, y yVar) throws IOException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static Privacy parseFrom(p pVar) throws IOException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, pVar);
                }

                public static Privacy parseFrom(p pVar, y yVar) throws IOException {
                    return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
                }
            }

            public interface PrivacyOrBuilder extends p1 {
                boolean getCcpa();

                boolean getCoppa();

                @Override // com.google.protobuf.p1
                /* synthetic */ o1 getDefaultInstanceForType();

                boolean getGdpr();

                String getTcfConsentString();

                l getTcfConsentStringBytes();

                String getUsPrivacy();

                l getUsPrivacyBytes();

                boolean hasCcpa();

                boolean hasCoppa();

                boolean hasGdpr();

                boolean hasTcfConsentString();

                boolean hasUsPrivacy();

                @Override // com.google.protobuf.p1
                /* synthetic */ boolean isInitialized();
            }

            static {
                BidTokenComponents bidTokenComponents = new BidTokenComponents();
                DEFAULT_INSTANCE = bidTokenComponents;
                n0.registerDefaultInstance(BidTokenComponents.class, bidTokenComponents);
            }

            private BidTokenComponents() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearIdfv() {
                this.bitField0_ &= -2;
                this.idfv_ = getDefaultInstance().getIdfv();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearPrivacy() {
                this.privacy_ = null;
            }

            public static BidTokenComponents getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergePrivacy(Privacy privacy) {
                privacy.getClass();
                Privacy privacy2 = this.privacy_;
                if (privacy2 == null || privacy2 == Privacy.getDefaultInstance()) {
                    this.privacy_ = privacy;
                } else {
                    this.privacy_ = (Privacy) ((Privacy.Builder) Privacy.newBuilder(this.privacy_).mergeFrom((n0) privacy)).buildPartial();
                }
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static BidTokenComponents parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (BidTokenComponents) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static BidTokenComponents parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setIdfv(String str) {
                str.getClass();
                this.bitField0_ |= 1;
                this.idfv_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setIdfvBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.idfv_ = lVar.o();
                this.bitField0_ |= 1;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setPrivacy(Privacy privacy) {
                privacy.getClass();
                this.privacy_ = privacy;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ለ\u0000\u0002\t", new Object[]{"bitField0_", "idfv_", "privacy_"});
                    case 3:
                        return new BidTokenComponents();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (BidTokenComponents.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
            public String getIdfv() {
                return this.idfv_;
            }

            @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
            public l getIdfvBytes() {
                return l.f(this.idfv_);
            }

            @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
            public Privacy getPrivacy() {
                Privacy privacy = this.privacy_;
                return privacy == null ? Privacy.getDefaultInstance() : privacy;
            }

            @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
            public boolean hasIdfv() {
                return (this.bitField0_ & 1) != 0;
            }

            @Override // com.moloco.sdk.BidToken.BidTokenRequestV2.BidTokenComponentsOrBuilder
            public boolean hasPrivacy() {
                return this.privacy_ != null;
            }

            public static Builder newBuilder(BidTokenComponents bidTokenComponents) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(bidTokenComponents);
            }

            public static BidTokenComponents parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (BidTokenComponents) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static BidTokenComponents parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static BidTokenComponents parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static BidTokenComponents parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static BidTokenComponents parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static BidTokenComponents parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static BidTokenComponents parseFrom(InputStream inputStream) throws IOException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static BidTokenComponents parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static BidTokenComponents parseFrom(p pVar) throws IOException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static BidTokenComponents parseFrom(p pVar, y yVar) throws IOException {
                return (BidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface BidTokenComponentsOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getIdfv();

            l getIdfvBytes();

            BidTokenComponents.Privacy getPrivacy();

            boolean hasIdfv();

            boolean hasPrivacy();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Builder extends f0 implements BidTokenRequestV2OrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearBidTokenComponents() {
                copyOnWrite();
                ((BidTokenRequestV2) this.instance).clearBidTokenComponents();
                return this;
            }

            @Override // com.moloco.sdk.BidToken.BidTokenRequestV2OrBuilder
            public BidTokenComponents getBidTokenComponents() {
                return ((BidTokenRequestV2) this.instance).getBidTokenComponents();
            }

            @Override // com.moloco.sdk.BidToken.BidTokenRequestV2OrBuilder
            public boolean hasBidTokenComponents() {
                return ((BidTokenRequestV2) this.instance).hasBidTokenComponents();
            }

            public Builder mergeBidTokenComponents(BidTokenComponents bidTokenComponents) {
                copyOnWrite();
                ((BidTokenRequestV2) this.instance).mergeBidTokenComponents(bidTokenComponents);
                return this;
            }

            public Builder setBidTokenComponents(BidTokenComponents bidTokenComponents) {
                copyOnWrite();
                ((BidTokenRequestV2) this.instance).setBidTokenComponents(bidTokenComponents);
                return this;
            }

            private Builder() {
                super(BidTokenRequestV2.DEFAULT_INSTANCE);
            }

            public Builder setBidTokenComponents(BidTokenComponents.Builder builder) {
                copyOnWrite();
                ((BidTokenRequestV2) this.instance).setBidTokenComponents((BidTokenComponents) builder.build());
                return this;
            }
        }

        static {
            BidTokenRequestV2 bidTokenRequestV2 = new BidTokenRequestV2();
            DEFAULT_INSTANCE = bidTokenRequestV2;
            n0.registerDefaultInstance(BidTokenRequestV2.class, bidTokenRequestV2);
        }

        private BidTokenRequestV2() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearBidTokenComponents() {
            this.bidTokenComponents_ = null;
        }

        public static BidTokenRequestV2 getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeBidTokenComponents(BidTokenComponents bidTokenComponents) {
            bidTokenComponents.getClass();
            BidTokenComponents bidTokenComponents2 = this.bidTokenComponents_;
            if (bidTokenComponents2 == null || bidTokenComponents2 == BidTokenComponents.getDefaultInstance()) {
                this.bidTokenComponents_ = bidTokenComponents;
            } else {
                this.bidTokenComponents_ = (BidTokenComponents) ((BidTokenComponents.Builder) BidTokenComponents.newBuilder(this.bidTokenComponents_).mergeFrom((n0) bidTokenComponents)).buildPartial();
            }
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static BidTokenRequestV2 parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (BidTokenRequestV2) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenRequestV2 parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBidTokenComponents(BidTokenComponents bidTokenComponents) {
            bidTokenComponents.getClass();
            this.bidTokenComponents_ = bidTokenComponents;
        }

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0002\u0002\u0001\u0000\u0000\u0000\u0002\t", new Object[]{"bidTokenComponents_"});
                case 3:
                    return new BidTokenRequestV2();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (BidTokenRequestV2.class) {
                        try {
                            g0Var = PARSER;
                            if (g0Var == null) {
                                g0Var = new g0();
                                PARSER = g0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return g0Var;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        @Override // com.moloco.sdk.BidToken.BidTokenRequestV2OrBuilder
        public BidTokenComponents getBidTokenComponents() {
            BidTokenComponents bidTokenComponents = this.bidTokenComponents_;
            return bidTokenComponents == null ? BidTokenComponents.getDefaultInstance() : bidTokenComponents;
        }

        @Override // com.moloco.sdk.BidToken.BidTokenRequestV2OrBuilder
        public boolean hasBidTokenComponents() {
            return this.bidTokenComponents_ != null;
        }

        public static Builder newBuilder(BidTokenRequestV2 bidTokenRequestV2) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(bidTokenRequestV2);
        }

        public static BidTokenRequestV2 parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenRequestV2) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenRequestV2 parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static BidTokenRequestV2 parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static BidTokenRequestV2 parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static BidTokenRequestV2 parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static BidTokenRequestV2 parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static BidTokenRequestV2 parseFrom(InputStream inputStream) throws IOException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenRequestV2 parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenRequestV2 parseFrom(p pVar) throws IOException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static BidTokenRequestV2 parseFrom(p pVar, y yVar) throws IOException {
            return (BidTokenRequestV2) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface BidTokenRequestV2OrBuilder extends p1 {
        BidTokenRequestV2.BidTokenComponents getBidTokenComponents();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        boolean hasBidTokenComponents();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    /* loaded from: classes.dex */
    public static final class BidTokenRequestV3 extends n0 implements BidTokenRequestV3OrBuilder {
        private static final BidTokenRequestV3 DEFAULT_INSTANCE;
        private static volatile v1 PARSER;

        public static final class Builder extends f0 implements BidTokenRequestV3OrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            private Builder() {
                super(BidTokenRequestV3.DEFAULT_INSTANCE);
            }
        }

        static {
            BidTokenRequestV3 bidTokenRequestV3 = new BidTokenRequestV3();
            DEFAULT_INSTANCE = bidTokenRequestV3;
            n0.registerDefaultInstance(BidTokenRequestV3.class, bidTokenRequestV3);
        }

        private BidTokenRequestV3() {
        }

        public static BidTokenRequestV3 getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static BidTokenRequestV3 parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (BidTokenRequestV3) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenRequestV3 parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0000", null);
                case 3:
                    return new BidTokenRequestV3();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (BidTokenRequestV3.class) {
                        try {
                            g0Var = PARSER;
                            if (g0Var == null) {
                                g0Var = new g0();
                                PARSER = g0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return g0Var;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        public static Builder newBuilder(BidTokenRequestV3 bidTokenRequestV3) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(bidTokenRequestV3);
        }

        public static BidTokenRequestV3 parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenRequestV3) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenRequestV3 parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static BidTokenRequestV3 parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static BidTokenRequestV3 parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static BidTokenRequestV3 parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static BidTokenRequestV3 parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static BidTokenRequestV3 parseFrom(InputStream inputStream) throws IOException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenRequestV3 parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenRequestV3 parseFrom(p pVar) throws IOException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static BidTokenRequestV3 parseFrom(p pVar, y yVar) throws IOException {
            return (BidTokenRequestV3) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface BidTokenRequestV3OrBuilder extends p1 {
        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    public static final class BidTokenResponseV2 extends n0 implements BidTokenResponseV2OrBuilder {
        public static final int BID_TOKEN_FIELD_NUMBER = 1;
        private static final BidTokenResponseV2 DEFAULT_INSTANCE;
        private static volatile v1 PARSER;
        private String bidToken_ = b.f42142b;

        public static final class Builder extends f0 implements BidTokenResponseV2OrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearBidToken() {
                copyOnWrite();
                ((BidTokenResponseV2) this.instance).clearBidToken();
                return this;
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV2OrBuilder
            public String getBidToken() {
                return ((BidTokenResponseV2) this.instance).getBidToken();
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV2OrBuilder
            public l getBidTokenBytes() {
                return ((BidTokenResponseV2) this.instance).getBidTokenBytes();
            }

            public Builder setBidToken(String str) {
                copyOnWrite();
                ((BidTokenResponseV2) this.instance).setBidToken(str);
                return this;
            }

            public Builder setBidTokenBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((BidTokenResponseV2) this.instance).setBidTokenBytes(lVar);
                return this;
            }

            private Builder() {
                super(BidTokenResponseV2.DEFAULT_INSTANCE);
            }
        }

        static {
            BidTokenResponseV2 bidTokenResponseV2 = new BidTokenResponseV2();
            DEFAULT_INSTANCE = bidTokenResponseV2;
            n0.registerDefaultInstance(BidTokenResponseV2.class, bidTokenResponseV2);
        }

        private BidTokenResponseV2() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearBidToken() {
            this.bidToken_ = getDefaultInstance().getBidToken();
        }

        public static BidTokenResponseV2 getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static BidTokenResponseV2 parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (BidTokenResponseV2) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenResponseV2 parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBidToken(String str) {
            str.getClass();
            this.bidToken_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBidTokenBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.bidToken_ = lVar.o();
        }

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"bidToken_"});
                case 3:
                    return new BidTokenResponseV2();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (BidTokenResponseV2.class) {
                        try {
                            g0Var = PARSER;
                            if (g0Var == null) {
                                g0Var = new g0();
                                PARSER = g0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return g0Var;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV2OrBuilder
        public String getBidToken() {
            return this.bidToken_;
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV2OrBuilder
        public l getBidTokenBytes() {
            return l.f(this.bidToken_);
        }

        public static Builder newBuilder(BidTokenResponseV2 bidTokenResponseV2) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(bidTokenResponseV2);
        }

        public static BidTokenResponseV2 parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenResponseV2) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenResponseV2 parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static BidTokenResponseV2 parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static BidTokenResponseV2 parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static BidTokenResponseV2 parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static BidTokenResponseV2 parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static BidTokenResponseV2 parseFrom(InputStream inputStream) throws IOException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenResponseV2 parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenResponseV2 parseFrom(p pVar) throws IOException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static BidTokenResponseV2 parseFrom(p pVar, y yVar) throws IOException {
            return (BidTokenResponseV2) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface BidTokenResponseV2OrBuilder extends p1 {
        String getBidToken();

        l getBidTokenBytes();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    /* loaded from: classes.dex */
    public static final class BidTokenResponseV3 extends n0 implements BidTokenResponseV3OrBuilder {
        public static final int BID_TOKEN_FIELD_NUMBER = 1;
        public static final int CLIENT_TOKEN_CONFIGS_FIELD_NUMBER = 3;
        private static final BidTokenResponseV3 DEFAULT_INSTANCE;
        private static volatile v1 PARSER = null;
        public static final int PK_FIELD_NUMBER = 2;
        private ClientTokenConfigs clientTokenConfigs_;
        private String bidToken_ = b.f42142b;
        private String pk_ = b.f42142b;

        public static final class Builder extends f0 implements BidTokenResponseV3OrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearBidToken() {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).clearBidToken();
                return this;
            }

            public Builder clearClientTokenConfigs() {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).clearClientTokenConfigs();
                return this;
            }

            public Builder clearPk() {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).clearPk();
                return this;
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
            public String getBidToken() {
                return ((BidTokenResponseV3) this.instance).getBidToken();
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
            public l getBidTokenBytes() {
                return ((BidTokenResponseV3) this.instance).getBidTokenBytes();
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
            public ClientTokenConfigs getClientTokenConfigs() {
                return ((BidTokenResponseV3) this.instance).getClientTokenConfigs();
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
            public String getPk() {
                return ((BidTokenResponseV3) this.instance).getPk();
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
            public l getPkBytes() {
                return ((BidTokenResponseV3) this.instance).getPkBytes();
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
            public boolean hasClientTokenConfigs() {
                return ((BidTokenResponseV3) this.instance).hasClientTokenConfigs();
            }

            public Builder mergeClientTokenConfigs(ClientTokenConfigs clientTokenConfigs) {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).mergeClientTokenConfigs(clientTokenConfigs);
                return this;
            }

            public Builder setBidToken(String str) {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).setBidToken(str);
                return this;
            }

            public Builder setBidTokenBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).setBidTokenBytes(lVar);
                return this;
            }

            public Builder setClientTokenConfigs(ClientTokenConfigs clientTokenConfigs) {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).setClientTokenConfigs(clientTokenConfigs);
                return this;
            }

            public Builder setPk(String str) {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).setPk(str);
                return this;
            }

            public Builder setPkBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).setPkBytes(lVar);
                return this;
            }

            private Builder() {
                super(BidTokenResponseV3.DEFAULT_INSTANCE);
            }

            public Builder setClientTokenConfigs(ClientTokenConfigs.Builder builder) {
                copyOnWrite();
                ((BidTokenResponseV3) this.instance).setClientTokenConfigs((ClientTokenConfigs) builder.build());
                return this;
            }
        }

        public static final class ClientTokenConfigs extends n0 implements ClientTokenConfigsOrBuilder {
            private static final ClientTokenConfigs DEFAULT_INSTANCE;
            public static final int ENABLE_DBT_FIELD_NUMBER = 1;
            private static volatile v1 PARSER;
            private boolean enableDbt_;

            public static final class Builder extends f0 implements ClientTokenConfigsOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearEnableDbt() {
                    copyOnWrite();
                    ((ClientTokenConfigs) this.instance).clearEnableDbt();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.BidTokenResponseV3.ClientTokenConfigsOrBuilder
                public boolean getEnableDbt() {
                    return ((ClientTokenConfigs) this.instance).getEnableDbt();
                }

                public Builder setEnableDbt(boolean z11) {
                    copyOnWrite();
                    ((ClientTokenConfigs) this.instance).setEnableDbt(z11);
                    return this;
                }

                private Builder() {
                    super(ClientTokenConfigs.DEFAULT_INSTANCE);
                }
            }

            static {
                ClientTokenConfigs clientTokenConfigs = new ClientTokenConfigs();
                DEFAULT_INSTANCE = clientTokenConfigs;
                n0.registerDefaultInstance(ClientTokenConfigs.class, clientTokenConfigs);
            }

            private ClientTokenConfigs() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearEnableDbt() {
                this.enableDbt_ = false;
            }

            public static ClientTokenConfigs getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ClientTokenConfigs parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ClientTokenConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ClientTokenConfigs parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setEnableDbt(boolean z11) {
                this.enableDbt_ = z11;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u0007", new Object[]{"enableDbt_"});
                    case 3:
                        return new ClientTokenConfigs();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ClientTokenConfigs.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.BidTokenResponseV3.ClientTokenConfigsOrBuilder
            public boolean getEnableDbt() {
                return this.enableDbt_;
            }

            public static Builder newBuilder(ClientTokenConfigs clientTokenConfigs) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(clientTokenConfigs);
            }

            public static ClientTokenConfigs parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ClientTokenConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ClientTokenConfigs parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ClientTokenConfigs parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static ClientTokenConfigs parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ClientTokenConfigs parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ClientTokenConfigs parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ClientTokenConfigs parseFrom(InputStream inputStream) throws IOException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ClientTokenConfigs parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ClientTokenConfigs parseFrom(p pVar) throws IOException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ClientTokenConfigs parseFrom(p pVar, y yVar) throws IOException {
                return (ClientTokenConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface ClientTokenConfigsOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getEnableDbt();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        static {
            BidTokenResponseV3 bidTokenResponseV3 = new BidTokenResponseV3();
            DEFAULT_INSTANCE = bidTokenResponseV3;
            n0.registerDefaultInstance(BidTokenResponseV3.class, bidTokenResponseV3);
        }

        private BidTokenResponseV3() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearBidToken() {
            this.bidToken_ = getDefaultInstance().getBidToken();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearClientTokenConfigs() {
            this.clientTokenConfigs_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPk() {
            this.pk_ = getDefaultInstance().getPk();
        }

        public static BidTokenResponseV3 getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeClientTokenConfigs(ClientTokenConfigs clientTokenConfigs) {
            clientTokenConfigs.getClass();
            ClientTokenConfigs clientTokenConfigs2 = this.clientTokenConfigs_;
            if (clientTokenConfigs2 == null || clientTokenConfigs2 == ClientTokenConfigs.getDefaultInstance()) {
                this.clientTokenConfigs_ = clientTokenConfigs;
            } else {
                this.clientTokenConfigs_ = (ClientTokenConfigs) ((ClientTokenConfigs.Builder) ClientTokenConfigs.newBuilder(this.clientTokenConfigs_).mergeFrom((n0) clientTokenConfigs)).buildPartial();
            }
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static BidTokenResponseV3 parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (BidTokenResponseV3) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenResponseV3 parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBidToken(String str) {
            str.getClass();
            this.bidToken_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBidTokenBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.bidToken_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setClientTokenConfigs(ClientTokenConfigs clientTokenConfigs) {
            clientTokenConfigs.getClass();
            this.clientTokenConfigs_ = clientTokenConfigs;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPk(String str) {
            str.getClass();
            this.pk_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPkBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.pk_ = lVar.o();
        }

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003\t", new Object[]{"bidToken_", "pk_", "clientTokenConfigs_"});
                case 3:
                    return new BidTokenResponseV3();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (BidTokenResponseV3.class) {
                        try {
                            g0Var = PARSER;
                            if (g0Var == null) {
                                g0Var = new g0();
                                PARSER = g0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return g0Var;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
        public String getBidToken() {
            return this.bidToken_;
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
        public l getBidTokenBytes() {
            return l.f(this.bidToken_);
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
        public ClientTokenConfigs getClientTokenConfigs() {
            ClientTokenConfigs clientTokenConfigs = this.clientTokenConfigs_;
            return clientTokenConfigs == null ? ClientTokenConfigs.getDefaultInstance() : clientTokenConfigs;
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
        public String getPk() {
            return this.pk_;
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
        public l getPkBytes() {
            return l.f(this.pk_);
        }

        @Override // com.moloco.sdk.BidToken.BidTokenResponseV3OrBuilder
        public boolean hasClientTokenConfigs() {
            return this.clientTokenConfigs_ != null;
        }

        public static Builder newBuilder(BidTokenResponseV3 bidTokenResponseV3) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(bidTokenResponseV3);
        }

        public static BidTokenResponseV3 parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenResponseV3) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenResponseV3 parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static BidTokenResponseV3 parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static BidTokenResponseV3 parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static BidTokenResponseV3 parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static BidTokenResponseV3 parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static BidTokenResponseV3 parseFrom(InputStream inputStream) throws IOException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static BidTokenResponseV3 parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static BidTokenResponseV3 parseFrom(p pVar) throws IOException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static BidTokenResponseV3 parseFrom(p pVar, y yVar) throws IOException {
            return (BidTokenResponseV3) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface BidTokenResponseV3OrBuilder extends p1 {
        String getBidToken();

        l getBidTokenBytes();

        BidTokenResponseV3.ClientTokenConfigs getClientTokenConfigs();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        String getPk();

        l getPkBytes();

        boolean hasClientTokenConfigs();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    /* loaded from: classes.dex */
    public static final class ClientBidToken extends n0 implements ClientBidTokenOrBuilder {
        private static final ClientBidToken DEFAULT_INSTANCE;
        public static final int ES_FIELD_NUMBER = 1;
        private static volatile v1 PARSER = null;
        public static final int PAYLOAD_FIELD_NUMBER = 2;
        private l es_;
        private l payload_;

        public static final class Builder extends f0 implements ClientBidTokenOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearEs() {
                copyOnWrite();
                ((ClientBidToken) this.instance).clearEs();
                return this;
            }

            public Builder clearPayload() {
                copyOnWrite();
                ((ClientBidToken) this.instance).clearPayload();
                return this;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenOrBuilder
            public l getEs() {
                return ((ClientBidToken) this.instance).getEs();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenOrBuilder
            public l getPayload() {
                return ((ClientBidToken) this.instance).getPayload();
            }

            public Builder setEs(l lVar) {
                copyOnWrite();
                ((ClientBidToken) this.instance).setEs(lVar);
                return this;
            }

            public Builder setPayload(l lVar) {
                copyOnWrite();
                ((ClientBidToken) this.instance).setPayload(lVar);
                return this;
            }

            private Builder() {
                super(ClientBidToken.DEFAULT_INSTANCE);
            }
        }

        static {
            ClientBidToken clientBidToken = new ClientBidToken();
            DEFAULT_INSTANCE = clientBidToken;
            n0.registerDefaultInstance(ClientBidToken.class, clientBidToken);
        }

        private ClientBidToken() {
            j jVar = l.f34884b;
            this.es_ = jVar;
            this.payload_ = jVar;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearEs() {
            this.es_ = getDefaultInstance().getEs();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPayload() {
            this.payload_ = getDefaultInstance().getPayload();
        }

        public static ClientBidToken getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static ClientBidToken parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (ClientBidToken) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ClientBidToken parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEs(l lVar) {
            lVar.getClass();
            this.es_ = lVar;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPayload(l lVar) {
            lVar.getClass();
            this.payload_ = lVar;
        }

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\n\u0002\n", new Object[]{"es_", "payload_"});
                case 3:
                    return new ClientBidToken();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (ClientBidToken.class) {
                        try {
                            g0Var = PARSER;
                            if (g0Var == null) {
                                g0Var = new g0();
                                PARSER = g0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return g0Var;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenOrBuilder
        public l getEs() {
            return this.es_;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenOrBuilder
        public l getPayload() {
            return this.payload_;
        }

        public static Builder newBuilder(ClientBidToken clientBidToken) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(clientBidToken);
        }

        public static ClientBidToken parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (ClientBidToken) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ClientBidToken parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static ClientBidToken parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static ClientBidToken parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static ClientBidToken parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static ClientBidToken parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static ClientBidToken parseFrom(InputStream inputStream) throws IOException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ClientBidToken parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ClientBidToken parseFrom(p pVar) throws IOException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static ClientBidToken parseFrom(p pVar, y yVar) throws IOException {
            return (ClientBidToken) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public static final class ClientBidTokenComponents extends n0 implements ClientBidTokenComponentsOrBuilder {
        public static final int ACCESSIBILITY_INFO_FIELD_NUMBER = 11;
        public static final int AD_INFO_FIELD_NUMBER = 8;
        public static final int AUDIO_INFO_FIELD_NUMBER = 10;
        public static final int BATTERY_INFO_FIELD_NUMBER = 9;
        private static final ClientBidTokenComponents DEFAULT_INSTANCE;
        public static final int DEVICE_FIELD_NUMBER = 3;
        public static final int DIR_INFO_FIELD_NUMBER = 6;
        public static final int IDFV_FIELD_NUMBER = 1;
        public static final int IMP_LVL_REV_DATA_FIELD_NUMBER = 12;
        public static final int INFO_FIELD_NUMBER = 4;
        public static final int MEMORY_INFO_FIELD_NUMBER = 5;
        public static final int NETWORK_INFO_FIELD_NUMBER = 7;
        private static volatile v1 PARSER = null;
        public static final int PRIVACY_FIELD_NUMBER = 2;
        public static final int TEST_CONFIG_FIELD_NUMBER = 13;
        private AccessibilityInfo accessibilityInfo_;
        private AdvertisingInfo adInfo_;
        private AudioInfo audioInfo_;
        private BatteryInfo batteryInfo_;
        private int bitField0_;
        private Device device_;
        private DirInfo dirInfo_;
        private String idfv_ = b.f42142b;
        private ImpLvlRevData impLvlRevData_;
        private SdkInfo info_;
        private MemoryInfo memoryInfo_;
        private NetworkInfo networkInfo_;
        private Privacy privacy_;
        private TestConfig testConfig_;

        public static final class AccessibilityInfo extends n0 implements AccessibilityInfoOrBuilder {
            public static final int ACCESSIBILITY_CAPTIONING_ENABLED_FIELD_NUMBER = 1;
            public static final int ACCESSIBILITY_LARGE_POINTER_ICON_FIELD_NUMBER = 2;
            private static final AccessibilityInfo DEFAULT_INSTANCE;
            public static final int FONT_SCALE_FIELD_NUMBER = 4;
            private static volatile v1 PARSER = null;
            public static final int REDUCE_BRIGHT_COLORS_ACTIVATED_FIELD_NUMBER = 3;
            private boolean accessibilityCaptioningEnabled_;
            private boolean accessibilityLargePointerIcon_;
            private int bitField0_;
            private float fontScale_;
            private boolean reduceBrightColorsActivated_;

            public static final class Builder extends f0 implements AccessibilityInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearAccessibilityCaptioningEnabled() {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).clearAccessibilityCaptioningEnabled();
                    return this;
                }

                public Builder clearAccessibilityLargePointerIcon() {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).clearAccessibilityLargePointerIcon();
                    return this;
                }

                public Builder clearFontScale() {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).clearFontScale();
                    return this;
                }

                public Builder clearReduceBrightColorsActivated() {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).clearReduceBrightColorsActivated();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public boolean getAccessibilityCaptioningEnabled() {
                    return ((AccessibilityInfo) this.instance).getAccessibilityCaptioningEnabled();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public boolean getAccessibilityLargePointerIcon() {
                    return ((AccessibilityInfo) this.instance).getAccessibilityLargePointerIcon();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public float getFontScale() {
                    return ((AccessibilityInfo) this.instance).getFontScale();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public boolean getReduceBrightColorsActivated() {
                    return ((AccessibilityInfo) this.instance).getReduceBrightColorsActivated();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public boolean hasAccessibilityCaptioningEnabled() {
                    return ((AccessibilityInfo) this.instance).hasAccessibilityCaptioningEnabled();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public boolean hasAccessibilityLargePointerIcon() {
                    return ((AccessibilityInfo) this.instance).hasAccessibilityLargePointerIcon();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public boolean hasFontScale() {
                    return ((AccessibilityInfo) this.instance).hasFontScale();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
                public boolean hasReduceBrightColorsActivated() {
                    return ((AccessibilityInfo) this.instance).hasReduceBrightColorsActivated();
                }

                public Builder setAccessibilityCaptioningEnabled(boolean z11) {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).setAccessibilityCaptioningEnabled(z11);
                    return this;
                }

                public Builder setAccessibilityLargePointerIcon(boolean z11) {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).setAccessibilityLargePointerIcon(z11);
                    return this;
                }

                public Builder setFontScale(float f11) {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).setFontScale(f11);
                    return this;
                }

                public Builder setReduceBrightColorsActivated(boolean z11) {
                    copyOnWrite();
                    ((AccessibilityInfo) this.instance).setReduceBrightColorsActivated(z11);
                    return this;
                }

                private Builder() {
                    super(AccessibilityInfo.DEFAULT_INSTANCE);
                }
            }

            static {
                AccessibilityInfo accessibilityInfo = new AccessibilityInfo();
                DEFAULT_INSTANCE = accessibilityInfo;
                n0.registerDefaultInstance(AccessibilityInfo.class, accessibilityInfo);
            }

            private AccessibilityInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearAccessibilityCaptioningEnabled() {
                this.bitField0_ &= -2;
                this.accessibilityCaptioningEnabled_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearAccessibilityLargePointerIcon() {
                this.bitField0_ &= -3;
                this.accessibilityLargePointerIcon_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearFontScale() {
                this.bitField0_ &= -9;
                this.fontScale_ = 0.0f;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearReduceBrightColorsActivated() {
                this.bitField0_ &= -5;
                this.reduceBrightColorsActivated_ = false;
            }

            public static AccessibilityInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static AccessibilityInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AccessibilityInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AccessibilityInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAccessibilityCaptioningEnabled(boolean z11) {
                this.bitField0_ |= 1;
                this.accessibilityCaptioningEnabled_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAccessibilityLargePointerIcon(boolean z11) {
                this.bitField0_ |= 2;
                this.accessibilityLargePointerIcon_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setFontScale(float f11) {
                this.bitField0_ |= 8;
                this.fontScale_ = f11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setReduceBrightColorsActivated(boolean z11) {
                this.bitField0_ |= 4;
                this.reduceBrightColorsActivated_ = z11;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004ခ\u0003", new Object[]{"bitField0_", "accessibilityCaptioningEnabled_", "accessibilityLargePointerIcon_", "reduceBrightColorsActivated_", "fontScale_"});
                    case 3:
                        return new AccessibilityInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (AccessibilityInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public boolean getAccessibilityCaptioningEnabled() {
                return this.accessibilityCaptioningEnabled_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public boolean getAccessibilityLargePointerIcon() {
                return this.accessibilityLargePointerIcon_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public float getFontScale() {
                return this.fontScale_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public boolean getReduceBrightColorsActivated() {
                return this.reduceBrightColorsActivated_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public boolean hasAccessibilityCaptioningEnabled() {
                return (this.bitField0_ & 1) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public boolean hasAccessibilityLargePointerIcon() {
                return (this.bitField0_ & 2) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public boolean hasFontScale() {
                return (this.bitField0_ & 8) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AccessibilityInfoOrBuilder
            public boolean hasReduceBrightColorsActivated() {
                return (this.bitField0_ & 4) != 0;
            }

            public static Builder newBuilder(AccessibilityInfo accessibilityInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(accessibilityInfo);
            }

            public static AccessibilityInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (AccessibilityInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AccessibilityInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static AccessibilityInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static AccessibilityInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static AccessibilityInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static AccessibilityInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static AccessibilityInfo parseFrom(InputStream inputStream) throws IOException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AccessibilityInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AccessibilityInfo parseFrom(p pVar) throws IOException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static AccessibilityInfo parseFrom(p pVar, y yVar) throws IOException {
                return (AccessibilityInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface AccessibilityInfoOrBuilder extends p1 {
            boolean getAccessibilityCaptioningEnabled();

            boolean getAccessibilityLargePointerIcon();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            float getFontScale();

            boolean getReduceBrightColorsActivated();

            boolean hasAccessibilityCaptioningEnabled();

            boolean hasAccessibilityLargePointerIcon();

            boolean hasFontScale();

            boolean hasReduceBrightColorsActivated();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class AdvertisingInfo extends n0 implements AdvertisingInfoOrBuilder {
            private static final AdvertisingInfo DEFAULT_INSTANCE;
            public static final int DNT_FIELD_NUMBER = 2;
            public static final int ID_FIELD_NUMBER = 1;
            private static volatile v1 PARSER;
            private int bitField0_;
            private boolean dnt_;
            private String id_ = b.f42142b;

            public static final class Builder extends f0 implements AdvertisingInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearDnt() {
                    copyOnWrite();
                    ((AdvertisingInfo) this.instance).clearDnt();
                    return this;
                }

                public Builder clearId() {
                    copyOnWrite();
                    ((AdvertisingInfo) this.instance).clearId();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
                public boolean getDnt() {
                    return ((AdvertisingInfo) this.instance).getDnt();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
                public String getId() {
                    return ((AdvertisingInfo) this.instance).getId();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
                public l getIdBytes() {
                    return ((AdvertisingInfo) this.instance).getIdBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
                public boolean hasDnt() {
                    return ((AdvertisingInfo) this.instance).hasDnt();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
                public boolean hasId() {
                    return ((AdvertisingInfo) this.instance).hasId();
                }

                public Builder setDnt(boolean z11) {
                    copyOnWrite();
                    ((AdvertisingInfo) this.instance).setDnt(z11);
                    return this;
                }

                public Builder setId(String str) {
                    copyOnWrite();
                    ((AdvertisingInfo) this.instance).setId(str);
                    return this;
                }

                public Builder setIdBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((AdvertisingInfo) this.instance).setIdBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(AdvertisingInfo.DEFAULT_INSTANCE);
                }
            }

            static {
                AdvertisingInfo advertisingInfo = new AdvertisingInfo();
                DEFAULT_INSTANCE = advertisingInfo;
                n0.registerDefaultInstance(AdvertisingInfo.class, advertisingInfo);
            }

            private AdvertisingInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearDnt() {
                this.bitField0_ &= -3;
                this.dnt_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearId() {
                this.bitField0_ &= -2;
                this.id_ = getDefaultInstance().getId();
            }

            public static AdvertisingInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static AdvertisingInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AdvertisingInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AdvertisingInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setDnt(boolean z11) {
                this.bitField0_ |= 2;
                this.dnt_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setId(String str) {
                str.getClass();
                this.bitField0_ |= 1;
                this.id_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setIdBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.id_ = lVar.o();
                this.bitField0_ |= 1;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ለ\u0000\u0002ဇ\u0001", new Object[]{"bitField0_", "id_", "dnt_"});
                    case 3:
                        return new AdvertisingInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (AdvertisingInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
            public boolean getDnt() {
                return this.dnt_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
            public String getId() {
                return this.id_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
            public l getIdBytes() {
                return l.f(this.id_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
            public boolean hasDnt() {
                return (this.bitField0_ & 2) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AdvertisingInfoOrBuilder
            public boolean hasId() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(AdvertisingInfo advertisingInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(advertisingInfo);
            }

            public static AdvertisingInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (AdvertisingInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AdvertisingInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static AdvertisingInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static AdvertisingInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static AdvertisingInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static AdvertisingInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static AdvertisingInfo parseFrom(InputStream inputStream) throws IOException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AdvertisingInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AdvertisingInfo parseFrom(p pVar) throws IOException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static AdvertisingInfo parseFrom(p pVar, y yVar) throws IOException {
                return (AdvertisingInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface AdvertisingInfoOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getDnt();

            String getId();

            l getIdBytes();

            boolean hasDnt();

            boolean hasId();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class AudioInfo extends n0 implements AudioInfoOrBuilder {
            private static final AudioInfo DEFAULT_INSTANCE;
            public static final int MUTE_SWITCH_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int VOL_FIELD_NUMBER = 2;
            private int bitField0_;
            private int muteSwitch_;
            private int vol_;

            public static final class Builder extends f0 implements AudioInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearMuteSwitch() {
                    copyOnWrite();
                    ((AudioInfo) this.instance).clearMuteSwitch();
                    return this;
                }

                public Builder clearVol() {
                    copyOnWrite();
                    ((AudioInfo) this.instance).clearVol();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
                public MuteSwitchState getMuteSwitch() {
                    return ((AudioInfo) this.instance).getMuteSwitch();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
                public int getMuteSwitchValue() {
                    return ((AudioInfo) this.instance).getMuteSwitchValue();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
                public int getVol() {
                    return ((AudioInfo) this.instance).getVol();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
                public boolean hasMuteSwitch() {
                    return ((AudioInfo) this.instance).hasMuteSwitch();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
                public boolean hasVol() {
                    return ((AudioInfo) this.instance).hasVol();
                }

                public Builder setMuteSwitch(MuteSwitchState muteSwitchState) {
                    copyOnWrite();
                    ((AudioInfo) this.instance).setMuteSwitch(muteSwitchState);
                    return this;
                }

                public Builder setMuteSwitchValue(int i5) {
                    copyOnWrite();
                    ((AudioInfo) this.instance).setMuteSwitchValue(i5);
                    return this;
                }

                public Builder setVol(int i5) {
                    copyOnWrite();
                    ((AudioInfo) this.instance).setVol(i5);
                    return this;
                }

                private Builder() {
                    super(AudioInfo.DEFAULT_INSTANCE);
                }
            }

            public enum MuteSwitchState implements r0 {
                SILENT(0),
                VIBRATE(1),
                NORMAL(2),
                UNRECOGNIZED(-1);

                public static final int NORMAL_VALUE = 2;
                public static final int SILENT_VALUE = 0;
                public static final int VIBRATE_VALUE = 1;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfo.MuteSwitchState.1
                    @Override // com.google.protobuf.s0
                    public MuteSwitchState findValueByNumber(int i5) {
                        return MuteSwitchState.forNumber(i5);
                    }
                };
                private final int value;

                /* loaded from: classes3.dex */
                public static final class MuteSwitchStateVerifier implements t0 {
                    static final t0 INSTANCE = new MuteSwitchStateVerifier();

                    private MuteSwitchStateVerifier() {
                    }

                    @Override // com.google.protobuf.t0
                    public boolean isInRange(int i5) {
                        return MuteSwitchState.forNumber(i5) != null;
                    }
                }

                MuteSwitchState(int i5) {
                    this.value = i5;
                }

                public static MuteSwitchState forNumber(int i5) {
                    if (i5 == 0) {
                        return SILENT;
                    }
                    if (i5 == 1) {
                        return VIBRATE;
                    }
                    if (i5 != 2) {
                        return null;
                    }
                    return NORMAL;
                }

                public static s0 internalGetValueMap() {
                    return internalValueMap;
                }

                public static t0 internalGetVerifier() {
                    return MuteSwitchStateVerifier.INSTANCE;
                }

                @Override // com.google.protobuf.r0
                public final int getNumber() {
                    if (this != UNRECOGNIZED) {
                        return this.value;
                    }
                    throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                }

                @Deprecated
                public static MuteSwitchState valueOf(int i5) {
                    return forNumber(i5);
                }
            }

            static {
                AudioInfo audioInfo = new AudioInfo();
                DEFAULT_INSTANCE = audioInfo;
                n0.registerDefaultInstance(AudioInfo.class, audioInfo);
            }

            private AudioInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMuteSwitch() {
                this.bitField0_ &= -2;
                this.muteSwitch_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearVol() {
                this.bitField0_ &= -3;
                this.vol_ = 0;
            }

            public static AudioInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static AudioInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AudioInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AudioInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMuteSwitch(MuteSwitchState muteSwitchState) {
                this.muteSwitch_ = muteSwitchState.getNumber();
                this.bitField0_ |= 1;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMuteSwitchValue(int i5) {
                this.bitField0_ |= 1;
                this.muteSwitch_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setVol(int i5) {
                this.bitField0_ |= 2;
                this.vol_ = i5;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဌ\u0000\u0002ဋ\u0001", new Object[]{"bitField0_", "muteSwitch_", "vol_"});
                    case 3:
                        return new AudioInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (AudioInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
            public MuteSwitchState getMuteSwitch() {
                MuteSwitchState muteSwitchStateForNumber = MuteSwitchState.forNumber(this.muteSwitch_);
                return muteSwitchStateForNumber == null ? MuteSwitchState.UNRECOGNIZED : muteSwitchStateForNumber;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
            public int getMuteSwitchValue() {
                return this.muteSwitch_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
            public int getVol() {
                return this.vol_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
            public boolean hasMuteSwitch() {
                return (this.bitField0_ & 1) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.AudioInfoOrBuilder
            public boolean hasVol() {
                return (this.bitField0_ & 2) != 0;
            }

            public static Builder newBuilder(AudioInfo audioInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(audioInfo);
            }

            public static AudioInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (AudioInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AudioInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static AudioInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static AudioInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static AudioInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static AudioInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static AudioInfo parseFrom(InputStream inputStream) throws IOException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AudioInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AudioInfo parseFrom(p pVar) throws IOException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static AudioInfo parseFrom(p pVar, y yVar) throws IOException {
                return (AudioInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface AudioInfoOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            AudioInfo.MuteSwitchState getMuteSwitch();

            int getMuteSwitchValue();

            int getVol();

            boolean hasMuteSwitch();

            boolean hasVol();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class BatteryInfo extends n0 implements BatteryInfoOrBuilder {
            public static final int BATTERY_STATUS_FIELD_NUMBER = 2;
            private static final BatteryInfo DEFAULT_INSTANCE;
            public static final int LOW_POW_MODE_FIELD_NUMBER = 3;
            public static final int MAX_BATTERY_LEVEL_FIELD_NUMBER = 1;
            private static volatile v1 PARSER;
            private int batteryStatus_;
            private int bitField0_;
            private boolean lowPowMode_;
            private int maxBatteryLevel_;

            public enum BatteryStatus implements r0 {
                UNKNOWN(0),
                CHARGING(1),
                DISCHARGING(2),
                NOT_CHARGING(3),
                FULL(4),
                UNRECOGNIZED(-1);

                public static final int CHARGING_VALUE = 1;
                public static final int DISCHARGING_VALUE = 2;
                public static final int FULL_VALUE = 4;
                public static final int NOT_CHARGING_VALUE = 3;
                public static final int UNKNOWN_VALUE = 0;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfo.BatteryStatus.1
                    @Override // com.google.protobuf.s0
                    public BatteryStatus findValueByNumber(int i5) {
                        return BatteryStatus.forNumber(i5);
                    }
                };
                private final int value;

                /* loaded from: classes3.dex */
                public static final class BatteryStatusVerifier implements t0 {
                    static final t0 INSTANCE = new BatteryStatusVerifier();

                    private BatteryStatusVerifier() {
                    }

                    @Override // com.google.protobuf.t0
                    public boolean isInRange(int i5) {
                        return BatteryStatus.forNumber(i5) != null;
                    }
                }

                BatteryStatus(int i5) {
                    this.value = i5;
                }

                public static BatteryStatus forNumber(int i5) {
                    if (i5 == 0) {
                        return UNKNOWN;
                    }
                    if (i5 == 1) {
                        return CHARGING;
                    }
                    if (i5 == 2) {
                        return DISCHARGING;
                    }
                    if (i5 == 3) {
                        return NOT_CHARGING;
                    }
                    if (i5 != 4) {
                        return null;
                    }
                    return FULL;
                }

                public static s0 internalGetValueMap() {
                    return internalValueMap;
                }

                public static t0 internalGetVerifier() {
                    return BatteryStatusVerifier.INSTANCE;
                }

                @Override // com.google.protobuf.r0
                public final int getNumber() {
                    if (this != UNRECOGNIZED) {
                        return this.value;
                    }
                    throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                }

                @Deprecated
                public static BatteryStatus valueOf(int i5) {
                    return forNumber(i5);
                }
            }

            public static final class Builder extends f0 implements BatteryInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearBatteryStatus() {
                    copyOnWrite();
                    ((BatteryInfo) this.instance).clearBatteryStatus();
                    return this;
                }

                public Builder clearLowPowMode() {
                    copyOnWrite();
                    ((BatteryInfo) this.instance).clearLowPowMode();
                    return this;
                }

                public Builder clearMaxBatteryLevel() {
                    copyOnWrite();
                    ((BatteryInfo) this.instance).clearMaxBatteryLevel();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
                public BatteryStatus getBatteryStatus() {
                    return ((BatteryInfo) this.instance).getBatteryStatus();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
                public int getBatteryStatusValue() {
                    return ((BatteryInfo) this.instance).getBatteryStatusValue();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
                public boolean getLowPowMode() {
                    return ((BatteryInfo) this.instance).getLowPowMode();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
                public int getMaxBatteryLevel() {
                    return ((BatteryInfo) this.instance).getMaxBatteryLevel();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
                public boolean hasBatteryStatus() {
                    return ((BatteryInfo) this.instance).hasBatteryStatus();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
                public boolean hasLowPowMode() {
                    return ((BatteryInfo) this.instance).hasLowPowMode();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
                public boolean hasMaxBatteryLevel() {
                    return ((BatteryInfo) this.instance).hasMaxBatteryLevel();
                }

                public Builder setBatteryStatus(BatteryStatus batteryStatus) {
                    copyOnWrite();
                    ((BatteryInfo) this.instance).setBatteryStatus(batteryStatus);
                    return this;
                }

                public Builder setBatteryStatusValue(int i5) {
                    copyOnWrite();
                    ((BatteryInfo) this.instance).setBatteryStatusValue(i5);
                    return this;
                }

                public Builder setLowPowMode(boolean z11) {
                    copyOnWrite();
                    ((BatteryInfo) this.instance).setLowPowMode(z11);
                    return this;
                }

                public Builder setMaxBatteryLevel(int i5) {
                    copyOnWrite();
                    ((BatteryInfo) this.instance).setMaxBatteryLevel(i5);
                    return this;
                }

                private Builder() {
                    super(BatteryInfo.DEFAULT_INSTANCE);
                }
            }

            static {
                BatteryInfo batteryInfo = new BatteryInfo();
                DEFAULT_INSTANCE = batteryInfo;
                n0.registerDefaultInstance(BatteryInfo.class, batteryInfo);
            }

            private BatteryInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearBatteryStatus() {
                this.bitField0_ &= -3;
                this.batteryStatus_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLowPowMode() {
                this.bitField0_ &= -5;
                this.lowPowMode_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMaxBatteryLevel() {
                this.bitField0_ &= -2;
                this.maxBatteryLevel_ = 0;
            }

            public static BatteryInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static BatteryInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (BatteryInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static BatteryInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBatteryStatus(BatteryStatus batteryStatus) {
                this.batteryStatus_ = batteryStatus.getNumber();
                this.bitField0_ |= 2;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBatteryStatusValue(int i5) {
                this.bitField0_ |= 2;
                this.batteryStatus_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLowPowMode(boolean z11) {
                this.bitField0_ |= 4;
                this.lowPowMode_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMaxBatteryLevel(int i5) {
                this.bitField0_ |= 1;
                this.maxBatteryLevel_ = i5;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဋ\u0000\u0002ဌ\u0001\u0003ဇ\u0002", new Object[]{"bitField0_", "maxBatteryLevel_", "batteryStatus_", "lowPowMode_"});
                    case 3:
                        return new BatteryInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (BatteryInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
            public BatteryStatus getBatteryStatus() {
                BatteryStatus batteryStatusForNumber = BatteryStatus.forNumber(this.batteryStatus_);
                return batteryStatusForNumber == null ? BatteryStatus.UNRECOGNIZED : batteryStatusForNumber;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
            public int getBatteryStatusValue() {
                return this.batteryStatus_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
            public boolean getLowPowMode() {
                return this.lowPowMode_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
            public int getMaxBatteryLevel() {
                return this.maxBatteryLevel_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
            public boolean hasBatteryStatus() {
                return (this.bitField0_ & 2) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
            public boolean hasLowPowMode() {
                return (this.bitField0_ & 4) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.BatteryInfoOrBuilder
            public boolean hasMaxBatteryLevel() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(BatteryInfo batteryInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(batteryInfo);
            }

            public static BatteryInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (BatteryInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static BatteryInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static BatteryInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static BatteryInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static BatteryInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static BatteryInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static BatteryInfo parseFrom(InputStream inputStream) throws IOException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static BatteryInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static BatteryInfo parseFrom(p pVar) throws IOException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static BatteryInfo parseFrom(p pVar, y yVar) throws IOException {
                return (BatteryInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface BatteryInfoOrBuilder extends p1 {
            BatteryInfo.BatteryStatus getBatteryStatus();

            int getBatteryStatusValue();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getLowPowMode();

            int getMaxBatteryLevel();

            boolean hasBatteryStatus();

            boolean hasLowPowMode();

            boolean hasMaxBatteryLevel();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Builder extends f0 implements ClientBidTokenComponentsOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearAccessibilityInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearAccessibilityInfo();
                return this;
            }

            public Builder clearAdInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearAdInfo();
                return this;
            }

            public Builder clearAudioInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearAudioInfo();
                return this;
            }

            public Builder clearBatteryInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearBatteryInfo();
                return this;
            }

            public Builder clearDevice() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearDevice();
                return this;
            }

            public Builder clearDirInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearDirInfo();
                return this;
            }

            public Builder clearIdfv() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearIdfv();
                return this;
            }

            public Builder clearImpLvlRevData() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearImpLvlRevData();
                return this;
            }

            public Builder clearInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearInfo();
                return this;
            }

            public Builder clearMemoryInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearMemoryInfo();
                return this;
            }

            public Builder clearNetworkInfo() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearNetworkInfo();
                return this;
            }

            public Builder clearPrivacy() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearPrivacy();
                return this;
            }

            public Builder clearTestConfig() {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).clearTestConfig();
                return this;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public AccessibilityInfo getAccessibilityInfo() {
                return ((ClientBidTokenComponents) this.instance).getAccessibilityInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public AdvertisingInfo getAdInfo() {
                return ((ClientBidTokenComponents) this.instance).getAdInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public AudioInfo getAudioInfo() {
                return ((ClientBidTokenComponents) this.instance).getAudioInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public BatteryInfo getBatteryInfo() {
                return ((ClientBidTokenComponents) this.instance).getBatteryInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public Device getDevice() {
                return ((ClientBidTokenComponents) this.instance).getDevice();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public DirInfo getDirInfo() {
                return ((ClientBidTokenComponents) this.instance).getDirInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public String getIdfv() {
                return ((ClientBidTokenComponents) this.instance).getIdfv();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public l getIdfvBytes() {
                return ((ClientBidTokenComponents) this.instance).getIdfvBytes();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public ImpLvlRevData getImpLvlRevData() {
                return ((ClientBidTokenComponents) this.instance).getImpLvlRevData();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public SdkInfo getInfo() {
                return ((ClientBidTokenComponents) this.instance).getInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public MemoryInfo getMemoryInfo() {
                return ((ClientBidTokenComponents) this.instance).getMemoryInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public NetworkInfo getNetworkInfo() {
                return ((ClientBidTokenComponents) this.instance).getNetworkInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public Privacy getPrivacy() {
                return ((ClientBidTokenComponents) this.instance).getPrivacy();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public TestConfig getTestConfig() {
                return ((ClientBidTokenComponents) this.instance).getTestConfig();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasAccessibilityInfo() {
                return ((ClientBidTokenComponents) this.instance).hasAccessibilityInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasAdInfo() {
                return ((ClientBidTokenComponents) this.instance).hasAdInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasAudioInfo() {
                return ((ClientBidTokenComponents) this.instance).hasAudioInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasBatteryInfo() {
                return ((ClientBidTokenComponents) this.instance).hasBatteryInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasDevice() {
                return ((ClientBidTokenComponents) this.instance).hasDevice();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasDirInfo() {
                return ((ClientBidTokenComponents) this.instance).hasDirInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasIdfv() {
                return ((ClientBidTokenComponents) this.instance).hasIdfv();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasImpLvlRevData() {
                return ((ClientBidTokenComponents) this.instance).hasImpLvlRevData();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasInfo() {
                return ((ClientBidTokenComponents) this.instance).hasInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasMemoryInfo() {
                return ((ClientBidTokenComponents) this.instance).hasMemoryInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasNetworkInfo() {
                return ((ClientBidTokenComponents) this.instance).hasNetworkInfo();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasPrivacy() {
                return ((ClientBidTokenComponents) this.instance).hasPrivacy();
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
            public boolean hasTestConfig() {
                return ((ClientBidTokenComponents) this.instance).hasTestConfig();
            }

            public Builder mergeAccessibilityInfo(AccessibilityInfo accessibilityInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeAccessibilityInfo(accessibilityInfo);
                return this;
            }

            public Builder mergeAdInfo(AdvertisingInfo advertisingInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeAdInfo(advertisingInfo);
                return this;
            }

            public Builder mergeAudioInfo(AudioInfo audioInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeAudioInfo(audioInfo);
                return this;
            }

            public Builder mergeBatteryInfo(BatteryInfo batteryInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeBatteryInfo(batteryInfo);
                return this;
            }

            public Builder mergeDevice(Device device) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeDevice(device);
                return this;
            }

            public Builder mergeDirInfo(DirInfo dirInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeDirInfo(dirInfo);
                return this;
            }

            public Builder mergeImpLvlRevData(ImpLvlRevData impLvlRevData) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeImpLvlRevData(impLvlRevData);
                return this;
            }

            public Builder mergeInfo(SdkInfo sdkInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeInfo(sdkInfo);
                return this;
            }

            public Builder mergeMemoryInfo(MemoryInfo memoryInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeMemoryInfo(memoryInfo);
                return this;
            }

            public Builder mergeNetworkInfo(NetworkInfo networkInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeNetworkInfo(networkInfo);
                return this;
            }

            public Builder mergePrivacy(Privacy privacy) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergePrivacy(privacy);
                return this;
            }

            public Builder mergeTestConfig(TestConfig testConfig) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).mergeTestConfig(testConfig);
                return this;
            }

            public Builder setAccessibilityInfo(AccessibilityInfo accessibilityInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setAccessibilityInfo(accessibilityInfo);
                return this;
            }

            public Builder setAdInfo(AdvertisingInfo advertisingInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setAdInfo(advertisingInfo);
                return this;
            }

            public Builder setAudioInfo(AudioInfo audioInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setAudioInfo(audioInfo);
                return this;
            }

            public Builder setBatteryInfo(BatteryInfo batteryInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setBatteryInfo(batteryInfo);
                return this;
            }

            public Builder setDevice(Device device) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setDevice(device);
                return this;
            }

            public Builder setDirInfo(DirInfo dirInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setDirInfo(dirInfo);
                return this;
            }

            public Builder setIdfv(String str) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setIdfv(str);
                return this;
            }

            public Builder setIdfvBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setIdfvBytes(lVar);
                return this;
            }

            public Builder setImpLvlRevData(ImpLvlRevData impLvlRevData) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setImpLvlRevData(impLvlRevData);
                return this;
            }

            public Builder setInfo(SdkInfo sdkInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setInfo(sdkInfo);
                return this;
            }

            public Builder setMemoryInfo(MemoryInfo memoryInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setMemoryInfo(memoryInfo);
                return this;
            }

            public Builder setNetworkInfo(NetworkInfo networkInfo) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setNetworkInfo(networkInfo);
                return this;
            }

            public Builder setPrivacy(Privacy privacy) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setPrivacy(privacy);
                return this;
            }

            public Builder setTestConfig(TestConfig testConfig) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setTestConfig(testConfig);
                return this;
            }

            private Builder() {
                super(ClientBidTokenComponents.DEFAULT_INSTANCE);
            }

            public Builder setAccessibilityInfo(AccessibilityInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setAccessibilityInfo((AccessibilityInfo) builder.build());
                return this;
            }

            public Builder setAdInfo(AdvertisingInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setAdInfo((AdvertisingInfo) builder.build());
                return this;
            }

            public Builder setAudioInfo(AudioInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setAudioInfo((AudioInfo) builder.build());
                return this;
            }

            public Builder setBatteryInfo(BatteryInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setBatteryInfo((BatteryInfo) builder.build());
                return this;
            }

            public Builder setDevice(Device.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setDevice((Device) builder.build());
                return this;
            }

            public Builder setDirInfo(DirInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setDirInfo((DirInfo) builder.build());
                return this;
            }

            public Builder setImpLvlRevData(ImpLvlRevData.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setImpLvlRevData((ImpLvlRevData) builder.build());
                return this;
            }

            public Builder setInfo(SdkInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setInfo((SdkInfo) builder.build());
                return this;
            }

            public Builder setMemoryInfo(MemoryInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setMemoryInfo((MemoryInfo) builder.build());
                return this;
            }

            public Builder setNetworkInfo(NetworkInfo.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setNetworkInfo((NetworkInfo) builder.build());
                return this;
            }

            public Builder setPrivacy(Privacy.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setPrivacy((Privacy) builder.build());
                return this;
            }

            public Builder setTestConfig(TestConfig.Builder builder) {
                copyOnWrite();
                ((ClientBidTokenComponents) this.instance).setTestConfig((TestConfig) builder.build());
                return this;
            }
        }

        public static final class Device extends n0 implements DeviceOrBuilder {
            public static final int BRAND_FIELD_NUMBER = 23;
            public static final int CARRIER_FIELD_NUMBER = 6;
            public static final int DBT_FIELD_NUMBER = 15;
            private static final Device DEFAULT_INSTANCE;
            public static final int DEVICETYPE_FIELD_NUMBER = 7;
            public static final int GEO_FIELD_NUMBER = 9;
            public static final int HARDWARE_FIELD_NUMBER = 22;
            public static final int HAS_GY_FIELD_NUMBER = 17;
            public static final int HWV_FIELD_NUMBER = 5;
            public static final int H_FIELD_NUMBER = 11;
            public static final int JS_FIELD_NUMBER = 8;
            public static final int KB_LOC_FIELD_NUMBER = 18;
            public static final int LANGUAGE_FIELD_NUMBER = 1;
            public static final int LOCALE_FIELD_NUMBER = 19;
            public static final int MAKE_FIELD_NUMBER = 3;
            public static final int MODEL_FIELD_NUMBER = 4;
            public static final int ORTN_FIELD_NUMBER = 16;
            public static final int OSV_FIELD_NUMBER = 2;
            public static final int OS_FIELD_NUMBER = 14;
            private static volatile v1 PARSER = null;
            public static final int PPI_FIELD_NUMBER = 12;
            public static final int PXRATIO_FIELD_NUMBER = 13;
            public static final int W_FIELD_NUMBER = 10;
            public static final int XDPI_FIELD_NUMBER = 20;
            public static final int YDPI_FIELD_NUMBER = 21;
            private int bitField0_;
            private long dbt_;
            private int devicetype_;
            private Geo geo_;
            private int h_;
            private boolean hasGy_;
            private int js_;
            private int ortn_;
            private int ppi_;
            private double pxratio_;
            private int w_;
            private float xdpi_;
            private float ydpi_;
            private String language_ = b.f42142b;
            private String osv_ = b.f42142b;
            private String make_ = b.f42142b;
            private String model_ = b.f42142b;
            private String hwv_ = b.f42142b;
            private String carrier_ = b.f42142b;
            private String os_ = b.f42142b;
            private String kbLoc_ = b.f42142b;
            private String locale_ = b.f42142b;
            private String hardware_ = b.f42142b;
            private String brand_ = b.f42142b;

            public static final class Builder extends f0 implements DeviceOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearBrand() {
                    copyOnWrite();
                    ((Device) this.instance).clearBrand();
                    return this;
                }

                public Builder clearCarrier() {
                    copyOnWrite();
                    ((Device) this.instance).clearCarrier();
                    return this;
                }

                public Builder clearDbt() {
                    copyOnWrite();
                    ((Device) this.instance).clearDbt();
                    return this;
                }

                public Builder clearDevicetype() {
                    copyOnWrite();
                    ((Device) this.instance).clearDevicetype();
                    return this;
                }

                public Builder clearGeo() {
                    copyOnWrite();
                    ((Device) this.instance).clearGeo();
                    return this;
                }

                public Builder clearH() {
                    copyOnWrite();
                    ((Device) this.instance).clearH();
                    return this;
                }

                public Builder clearHardware() {
                    copyOnWrite();
                    ((Device) this.instance).clearHardware();
                    return this;
                }

                public Builder clearHasGy() {
                    copyOnWrite();
                    ((Device) this.instance).clearHasGy();
                    return this;
                }

                public Builder clearHwv() {
                    copyOnWrite();
                    ((Device) this.instance).clearHwv();
                    return this;
                }

                public Builder clearJs() {
                    copyOnWrite();
                    ((Device) this.instance).clearJs();
                    return this;
                }

                public Builder clearKbLoc() {
                    copyOnWrite();
                    ((Device) this.instance).clearKbLoc();
                    return this;
                }

                public Builder clearLanguage() {
                    copyOnWrite();
                    ((Device) this.instance).clearLanguage();
                    return this;
                }

                public Builder clearLocale() {
                    copyOnWrite();
                    ((Device) this.instance).clearLocale();
                    return this;
                }

                public Builder clearMake() {
                    copyOnWrite();
                    ((Device) this.instance).clearMake();
                    return this;
                }

                public Builder clearModel() {
                    copyOnWrite();
                    ((Device) this.instance).clearModel();
                    return this;
                }

                public Builder clearOrtn() {
                    copyOnWrite();
                    ((Device) this.instance).clearOrtn();
                    return this;
                }

                public Builder clearOs() {
                    copyOnWrite();
                    ((Device) this.instance).clearOs();
                    return this;
                }

                public Builder clearOsv() {
                    copyOnWrite();
                    ((Device) this.instance).clearOsv();
                    return this;
                }

                public Builder clearPpi() {
                    copyOnWrite();
                    ((Device) this.instance).clearPpi();
                    return this;
                }

                public Builder clearPxratio() {
                    copyOnWrite();
                    ((Device) this.instance).clearPxratio();
                    return this;
                }

                public Builder clearW() {
                    copyOnWrite();
                    ((Device) this.instance).clearW();
                    return this;
                }

                public Builder clearXdpi() {
                    copyOnWrite();
                    ((Device) this.instance).clearXdpi();
                    return this;
                }

                public Builder clearYdpi() {
                    copyOnWrite();
                    ((Device) this.instance).clearYdpi();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getBrand() {
                    return ((Device) this.instance).getBrand();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getBrandBytes() {
                    return ((Device) this.instance).getBrandBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getCarrier() {
                    return ((Device) this.instance).getCarrier();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getCarrierBytes() {
                    return ((Device) this.instance).getCarrierBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public long getDbt() {
                    return ((Device) this.instance).getDbt();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public int getDevicetype() {
                    return ((Device) this.instance).getDevicetype();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public Geo getGeo() {
                    return ((Device) this.instance).getGeo();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public int getH() {
                    return ((Device) this.instance).getH();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getHardware() {
                    return ((Device) this.instance).getHardware();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getHardwareBytes() {
                    return ((Device) this.instance).getHardwareBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean getHasGy() {
                    return ((Device) this.instance).getHasGy();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getHwv() {
                    return ((Device) this.instance).getHwv();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getHwvBytes() {
                    return ((Device) this.instance).getHwvBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public int getJs() {
                    return ((Device) this.instance).getJs();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getKbLoc() {
                    return ((Device) this.instance).getKbLoc();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getKbLocBytes() {
                    return ((Device) this.instance).getKbLocBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getLanguage() {
                    return ((Device) this.instance).getLanguage();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getLanguageBytes() {
                    return ((Device) this.instance).getLanguageBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getLocale() {
                    return ((Device) this.instance).getLocale();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getLocaleBytes() {
                    return ((Device) this.instance).getLocaleBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getMake() {
                    return ((Device) this.instance).getMake();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getMakeBytes() {
                    return ((Device) this.instance).getMakeBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getModel() {
                    return ((Device) this.instance).getModel();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getModelBytes() {
                    return ((Device) this.instance).getModelBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public Orientation getOrtn() {
                    return ((Device) this.instance).getOrtn();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public int getOrtnValue() {
                    return ((Device) this.instance).getOrtnValue();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getOs() {
                    return ((Device) this.instance).getOs();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getOsBytes() {
                    return ((Device) this.instance).getOsBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public String getOsv() {
                    return ((Device) this.instance).getOsv();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public l getOsvBytes() {
                    return ((Device) this.instance).getOsvBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public int getPpi() {
                    return ((Device) this.instance).getPpi();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public double getPxratio() {
                    return ((Device) this.instance).getPxratio();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public int getW() {
                    return ((Device) this.instance).getW();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public float getXdpi() {
                    return ((Device) this.instance).getXdpi();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public float getYdpi() {
                    return ((Device) this.instance).getYdpi();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasBrand() {
                    return ((Device) this.instance).hasBrand();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasCarrier() {
                    return ((Device) this.instance).hasCarrier();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasDbt() {
                    return ((Device) this.instance).hasDbt();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasDevicetype() {
                    return ((Device) this.instance).hasDevicetype();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasGeo() {
                    return ((Device) this.instance).hasGeo();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasH() {
                    return ((Device) this.instance).hasH();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasHardware() {
                    return ((Device) this.instance).hasHardware();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasHasGy() {
                    return ((Device) this.instance).hasHasGy();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasHwv() {
                    return ((Device) this.instance).hasHwv();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasJs() {
                    return ((Device) this.instance).hasJs();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasKbLoc() {
                    return ((Device) this.instance).hasKbLoc();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasLanguage() {
                    return ((Device) this.instance).hasLanguage();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasLocale() {
                    return ((Device) this.instance).hasLocale();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasMake() {
                    return ((Device) this.instance).hasMake();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasModel() {
                    return ((Device) this.instance).hasModel();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasOrtn() {
                    return ((Device) this.instance).hasOrtn();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasOs() {
                    return ((Device) this.instance).hasOs();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasOsv() {
                    return ((Device) this.instance).hasOsv();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasPpi() {
                    return ((Device) this.instance).hasPpi();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasPxratio() {
                    return ((Device) this.instance).hasPxratio();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasW() {
                    return ((Device) this.instance).hasW();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasXdpi() {
                    return ((Device) this.instance).hasXdpi();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
                public boolean hasYdpi() {
                    return ((Device) this.instance).hasYdpi();
                }

                public Builder mergeGeo(Geo geo) {
                    copyOnWrite();
                    ((Device) this.instance).mergeGeo(geo);
                    return this;
                }

                public Builder setBrand(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setBrand(str);
                    return this;
                }

                public Builder setBrandBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setBrandBytes(lVar);
                    return this;
                }

                public Builder setCarrier(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setCarrier(str);
                    return this;
                }

                public Builder setCarrierBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setCarrierBytes(lVar);
                    return this;
                }

                public Builder setDbt(long j11) {
                    copyOnWrite();
                    ((Device) this.instance).setDbt(j11);
                    return this;
                }

                public Builder setDevicetype(int i5) {
                    copyOnWrite();
                    ((Device) this.instance).setDevicetype(i5);
                    return this;
                }

                public Builder setGeo(Geo geo) {
                    copyOnWrite();
                    ((Device) this.instance).setGeo(geo);
                    return this;
                }

                public Builder setH(int i5) {
                    copyOnWrite();
                    ((Device) this.instance).setH(i5);
                    return this;
                }

                public Builder setHardware(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setHardware(str);
                    return this;
                }

                public Builder setHardwareBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setHardwareBytes(lVar);
                    return this;
                }

                public Builder setHasGy(boolean z11) {
                    copyOnWrite();
                    ((Device) this.instance).setHasGy(z11);
                    return this;
                }

                public Builder setHwv(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setHwv(str);
                    return this;
                }

                public Builder setHwvBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setHwvBytes(lVar);
                    return this;
                }

                public Builder setJs(int i5) {
                    copyOnWrite();
                    ((Device) this.instance).setJs(i5);
                    return this;
                }

                public Builder setKbLoc(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setKbLoc(str);
                    return this;
                }

                public Builder setKbLocBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setKbLocBytes(lVar);
                    return this;
                }

                public Builder setLanguage(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setLanguage(str);
                    return this;
                }

                public Builder setLanguageBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setLanguageBytes(lVar);
                    return this;
                }

                public Builder setLocale(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setLocale(str);
                    return this;
                }

                public Builder setLocaleBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setLocaleBytes(lVar);
                    return this;
                }

                public Builder setMake(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setMake(str);
                    return this;
                }

                public Builder setMakeBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setMakeBytes(lVar);
                    return this;
                }

                public Builder setModel(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setModel(str);
                    return this;
                }

                public Builder setModelBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setModelBytes(lVar);
                    return this;
                }

                public Builder setOrtn(Orientation orientation) {
                    copyOnWrite();
                    ((Device) this.instance).setOrtn(orientation);
                    return this;
                }

                public Builder setOrtnValue(int i5) {
                    copyOnWrite();
                    ((Device) this.instance).setOrtnValue(i5);
                    return this;
                }

                public Builder setOs(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setOs(str);
                    return this;
                }

                public Builder setOsBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setOsBytes(lVar);
                    return this;
                }

                public Builder setOsv(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setOsv(str);
                    return this;
                }

                public Builder setOsvBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setOsvBytes(lVar);
                    return this;
                }

                public Builder setPpi(int i5) {
                    copyOnWrite();
                    ((Device) this.instance).setPpi(i5);
                    return this;
                }

                public Builder setPxratio(double d5) {
                    copyOnWrite();
                    ((Device) this.instance).setPxratio(d5);
                    return this;
                }

                public Builder setW(int i5) {
                    copyOnWrite();
                    ((Device) this.instance).setW(i5);
                    return this;
                }

                public Builder setXdpi(float f11) {
                    copyOnWrite();
                    ((Device) this.instance).setXdpi(f11);
                    return this;
                }

                public Builder setYdpi(float f11) {
                    copyOnWrite();
                    ((Device) this.instance).setYdpi(f11);
                    return this;
                }

                private Builder() {
                    super(Device.DEFAULT_INSTANCE);
                }

                public Builder setGeo(Geo.Builder builder) {
                    copyOnWrite();
                    ((Device) this.instance).setGeo((Geo) builder.build());
                    return this;
                }
            }

            public enum Orientation implements r0 {
                UNKNOWN(0),
                PORTRAIT(1),
                LANDSCAPE(2),
                UNRECOGNIZED(-1);

                public static final int LANDSCAPE_VALUE = 2;
                public static final int PORTRAIT_VALUE = 1;
                public static final int UNKNOWN_VALUE = 0;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.BidToken.ClientBidTokenComponents.Device.Orientation.1
                    @Override // com.google.protobuf.s0
                    public Orientation findValueByNumber(int i5) {
                        return Orientation.forNumber(i5);
                    }
                };
                private final int value;

                /* loaded from: classes3.dex */
                public static final class OrientationVerifier implements t0 {
                    static final t0 INSTANCE = new OrientationVerifier();

                    private OrientationVerifier() {
                    }

                    @Override // com.google.protobuf.t0
                    public boolean isInRange(int i5) {
                        return Orientation.forNumber(i5) != null;
                    }
                }

                Orientation(int i5) {
                    this.value = i5;
                }

                public static Orientation forNumber(int i5) {
                    if (i5 == 0) {
                        return UNKNOWN;
                    }
                    if (i5 == 1) {
                        return PORTRAIT;
                    }
                    if (i5 != 2) {
                        return null;
                    }
                    return LANDSCAPE;
                }

                public static s0 internalGetValueMap() {
                    return internalValueMap;
                }

                public static t0 internalGetVerifier() {
                    return OrientationVerifier.INSTANCE;
                }

                @Override // com.google.protobuf.r0
                public final int getNumber() {
                    if (this != UNRECOGNIZED) {
                        return this.value;
                    }
                    throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                }

                @Deprecated
                public static Orientation valueOf(int i5) {
                    return forNumber(i5);
                }
            }

            static {
                Device device = new Device();
                DEFAULT_INSTANCE = device;
                n0.registerDefaultInstance(Device.class, device);
            }

            private Device() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearBrand() {
                this.bitField0_ &= -4194305;
                this.brand_ = getDefaultInstance().getBrand();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCarrier() {
                this.bitField0_ &= -33;
                this.carrier_ = getDefaultInstance().getCarrier();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearDbt() {
                this.bitField0_ &= -16385;
                this.dbt_ = 0L;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearDevicetype() {
                this.bitField0_ &= -65;
                this.devicetype_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearGeo() {
                this.geo_ = null;
                this.bitField0_ &= -257;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearH() {
                this.bitField0_ &= -1025;
                this.h_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearHardware() {
                this.bitField0_ &= -2097153;
                this.hardware_ = getDefaultInstance().getHardware();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearHasGy() {
                this.bitField0_ &= -65537;
                this.hasGy_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearHwv() {
                this.bitField0_ &= -17;
                this.hwv_ = getDefaultInstance().getHwv();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearJs() {
                this.bitField0_ &= -129;
                this.js_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearKbLoc() {
                this.bitField0_ &= -131073;
                this.kbLoc_ = getDefaultInstance().getKbLoc();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLanguage() {
                this.bitField0_ &= -2;
                this.language_ = getDefaultInstance().getLanguage();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLocale() {
                this.bitField0_ &= -262145;
                this.locale_ = getDefaultInstance().getLocale();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMake() {
                this.bitField0_ &= -5;
                this.make_ = getDefaultInstance().getMake();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearModel() {
                this.bitField0_ &= -9;
                this.model_ = getDefaultInstance().getModel();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearOrtn() {
                this.bitField0_ &= -32769;
                this.ortn_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearOs() {
                this.bitField0_ &= -8193;
                this.os_ = getDefaultInstance().getOs();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearOsv() {
                this.bitField0_ &= -3;
                this.osv_ = getDefaultInstance().getOsv();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearPpi() {
                this.bitField0_ &= -2049;
                this.ppi_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearPxratio() {
                this.bitField0_ &= -4097;
                this.pxratio_ = 0.0d;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearW() {
                this.bitField0_ &= -513;
                this.w_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearXdpi() {
                this.bitField0_ &= -524289;
                this.xdpi_ = 0.0f;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearYdpi() {
                this.bitField0_ &= -1048577;
                this.ydpi_ = 0.0f;
            }

            public static Device getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeGeo(Geo geo) {
                geo.getClass();
                Geo geo2 = this.geo_;
                if (geo2 == null || geo2 == Geo.getDefaultInstance()) {
                    this.geo_ = geo;
                } else {
                    this.geo_ = (Geo) ((Geo.Builder) Geo.newBuilder(this.geo_).mergeFrom((n0) geo)).buildPartial();
                }
                this.bitField0_ |= 256;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static Device parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Device) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Device parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBrand(String str) {
                str.getClass();
                this.bitField0_ |= 4194304;
                this.brand_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBrandBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.brand_ = lVar.o();
                this.bitField0_ |= 4194304;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCarrier(String str) {
                str.getClass();
                this.bitField0_ |= 32;
                this.carrier_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCarrierBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.carrier_ = lVar.o();
                this.bitField0_ |= 32;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setDbt(long j11) {
                this.bitField0_ |= ReaderJsonLexerKt.BATCH_SIZE;
                this.dbt_ = j11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setDevicetype(int i5) {
                this.bitField0_ |= 64;
                this.devicetype_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setGeo(Geo geo) {
                geo.getClass();
                this.geo_ = geo;
                this.bitField0_ |= 256;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setH(int i5) {
                this.bitField0_ |= 1024;
                this.h_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setHardware(String str) {
                str.getClass();
                this.bitField0_ |= 2097152;
                this.hardware_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setHardwareBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.hardware_ = lVar.o();
                this.bitField0_ |= 2097152;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setHasGy(boolean z11) {
                this.bitField0_ |= SQLiteDatabase.OPEN_FULLMUTEX;
                this.hasGy_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setHwv(String str) {
                str.getClass();
                this.bitField0_ |= 16;
                this.hwv_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setHwvBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.hwv_ = lVar.o();
                this.bitField0_ |= 16;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setJs(int i5) {
                this.bitField0_ |= 128;
                this.js_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setKbLoc(String str) {
                str.getClass();
                this.bitField0_ |= SQLiteDatabase.OPEN_SHAREDCACHE;
                this.kbLoc_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setKbLocBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.kbLoc_ = lVar.o();
                this.bitField0_ |= SQLiteDatabase.OPEN_SHAREDCACHE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLanguage(String str) {
                str.getClass();
                this.bitField0_ |= 1;
                this.language_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLanguageBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.language_ = lVar.o();
                this.bitField0_ |= 1;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLocale(String str) {
                str.getClass();
                this.bitField0_ |= SQLiteDatabase.OPEN_PRIVATECACHE;
                this.locale_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLocaleBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.locale_ = lVar.o();
                this.bitField0_ |= SQLiteDatabase.OPEN_PRIVATECACHE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMake(String str) {
                str.getClass();
                this.bitField0_ |= 4;
                this.make_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMakeBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.make_ = lVar.o();
                this.bitField0_ |= 4;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setModel(String str) {
                str.getClass();
                this.bitField0_ |= 8;
                this.model_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setModelBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.model_ = lVar.o();
                this.bitField0_ |= 8;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOrtn(Orientation orientation) {
                this.ortn_ = orientation.getNumber();
                this.bitField0_ |= SQLiteDatabase.OPEN_NOMUTEX;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOrtnValue(int i5) {
                this.bitField0_ |= SQLiteDatabase.OPEN_NOMUTEX;
                this.ortn_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOs(String str) {
                str.getClass();
                this.bitField0_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                this.os_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOsBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.os_ = lVar.o();
                this.bitField0_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOsv(String str) {
                str.getClass();
                this.bitField0_ |= 2;
                this.osv_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOsvBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.osv_ = lVar.o();
                this.bitField0_ |= 2;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setPpi(int i5) {
                this.bitField0_ |= 2048;
                this.ppi_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setPxratio(double d5) {
                this.bitField0_ |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                this.pxratio_ = d5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setW(int i5) {
                this.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
                this.w_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setXdpi(float f11) {
                this.bitField0_ |= 524288;
                this.xdpi_ = f11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setYdpi(float f11) {
                this.bitField0_ |= 1048576;
                this.ydpi_ = f11;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0017\u0000\u0001\u0001\u0017\u0017\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004ለ\u0003\u0005ለ\u0004\u0006ለ\u0005\u0007ဋ\u0006\bဋ\u0007\tဉ\b\nဋ\t\u000bဋ\n\fဋ\u000b\rက\f\u000eለ\r\u000fဃ\u000e\u0010ဌ\u000f\u0011ဇ\u0010\u0012ለ\u0011\u0013ለ\u0012\u0014ခ\u0013\u0015ခ\u0014\u0016ለ\u0015\u0017ለ\u0016", new Object[]{"bitField0_", "language_", "osv_", "make_", "model_", "hwv_", "carrier_", "devicetype_", "js_", "geo_", "w_", "h_", "ppi_", "pxratio_", "os_", "dbt_", "ortn_", "hasGy_", "kbLoc_", "locale_", "xdpi_", "ydpi_", "hardware_", "brand_"});
                    case 3:
                        return new Device();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (Device.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getBrand() {
                return this.brand_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getBrandBytes() {
                return l.f(this.brand_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getCarrier() {
                return this.carrier_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getCarrierBytes() {
                return l.f(this.carrier_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public long getDbt() {
                return this.dbt_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public int getDevicetype() {
                return this.devicetype_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public Geo getGeo() {
                Geo geo = this.geo_;
                return geo == null ? Geo.getDefaultInstance() : geo;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public int getH() {
                return this.h_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getHardware() {
                return this.hardware_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getHardwareBytes() {
                return l.f(this.hardware_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean getHasGy() {
                return this.hasGy_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getHwv() {
                return this.hwv_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getHwvBytes() {
                return l.f(this.hwv_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public int getJs() {
                return this.js_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getKbLoc() {
                return this.kbLoc_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getKbLocBytes() {
                return l.f(this.kbLoc_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getLanguage() {
                return this.language_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getLanguageBytes() {
                return l.f(this.language_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getLocale() {
                return this.locale_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getLocaleBytes() {
                return l.f(this.locale_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getMake() {
                return this.make_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getMakeBytes() {
                return l.f(this.make_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getModel() {
                return this.model_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getModelBytes() {
                return l.f(this.model_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public Orientation getOrtn() {
                Orientation orientationForNumber = Orientation.forNumber(this.ortn_);
                return orientationForNumber == null ? Orientation.UNRECOGNIZED : orientationForNumber;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public int getOrtnValue() {
                return this.ortn_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getOs() {
                return this.os_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getOsBytes() {
                return l.f(this.os_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public String getOsv() {
                return this.osv_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public l getOsvBytes() {
                return l.f(this.osv_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public int getPpi() {
                return this.ppi_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public double getPxratio() {
                return this.pxratio_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public int getW() {
                return this.w_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public float getXdpi() {
                return this.xdpi_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public float getYdpi() {
                return this.ydpi_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasBrand() {
                return (this.bitField0_ & 4194304) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasCarrier() {
                return (this.bitField0_ & 32) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasDbt() {
                return (this.bitField0_ & ReaderJsonLexerKt.BATCH_SIZE) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasDevicetype() {
                return (this.bitField0_ & 64) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasGeo() {
                return (this.bitField0_ & 256) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasH() {
                return (this.bitField0_ & 1024) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasHardware() {
                return (this.bitField0_ & 2097152) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasHasGy() {
                return (this.bitField0_ & SQLiteDatabase.OPEN_FULLMUTEX) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasHwv() {
                return (this.bitField0_ & 16) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasJs() {
                return (this.bitField0_ & 128) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasKbLoc() {
                return (this.bitField0_ & SQLiteDatabase.OPEN_SHAREDCACHE) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasLanguage() {
                return (this.bitField0_ & 1) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasLocale() {
                return (this.bitField0_ & SQLiteDatabase.OPEN_PRIVATECACHE) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasMake() {
                return (this.bitField0_ & 4) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasModel() {
                return (this.bitField0_ & 8) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasOrtn() {
                return (this.bitField0_ & SQLiteDatabase.OPEN_NOMUTEX) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasOs() {
                return (this.bitField0_ & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasOsv() {
                return (this.bitField0_ & 2) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasPpi() {
                return (this.bitField0_ & 2048) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasPxratio() {
                return (this.bitField0_ & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasW() {
                return (this.bitField0_ & EventBridgeChannel.QUEUE_CAPACITY) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasXdpi() {
                return (this.bitField0_ & 524288) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DeviceOrBuilder
            public boolean hasYdpi() {
                return (this.bitField0_ & 1048576) != 0;
            }

            public static Builder newBuilder(Device device) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(device);
            }

            public static Device parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (Device) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Device parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static Device parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static Device parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static Device parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static Device parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static Device parseFrom(InputStream inputStream) throws IOException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Device parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Device parseFrom(p pVar) throws IOException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static Device parseFrom(p pVar, y yVar) throws IOException {
                return (Device) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface DeviceOrBuilder extends p1 {
            String getBrand();

            l getBrandBytes();

            String getCarrier();

            l getCarrierBytes();

            long getDbt();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            int getDevicetype();

            Geo getGeo();

            int getH();

            String getHardware();

            l getHardwareBytes();

            boolean getHasGy();

            String getHwv();

            l getHwvBytes();

            int getJs();

            String getKbLoc();

            l getKbLocBytes();

            String getLanguage();

            l getLanguageBytes();

            String getLocale();

            l getLocaleBytes();

            String getMake();

            l getMakeBytes();

            String getModel();

            l getModelBytes();

            Device.Orientation getOrtn();

            int getOrtnValue();

            String getOs();

            l getOsBytes();

            String getOsv();

            l getOsvBytes();

            int getPpi();

            double getPxratio();

            int getW();

            float getXdpi();

            float getYdpi();

            boolean hasBrand();

            boolean hasCarrier();

            boolean hasDbt();

            boolean hasDevicetype();

            boolean hasGeo();

            boolean hasH();

            boolean hasHardware();

            boolean hasHasGy();

            boolean hasHwv();

            boolean hasJs();

            boolean hasKbLoc();

            boolean hasLanguage();

            boolean hasLocale();

            boolean hasMake();

            boolean hasModel();

            boolean hasOrtn();

            boolean hasOs();

            boolean hasOsv();

            boolean hasPpi();

            boolean hasPxratio();

            boolean hasW();

            boolean hasXdpi();

            boolean hasYdpi();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class DirInfo extends n0 implements DirInfoOrBuilder {
            private static final DirInfo DEFAULT_INSTANCE;
            public static final int DSIZE_BYTES_FIELD_NUMBER = 1;
            private static volatile v1 PARSER;
            private int bitField0_;
            private long dsizeBytes_;

            public static final class Builder extends f0 implements DirInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearDsizeBytes() {
                    copyOnWrite();
                    ((DirInfo) this.instance).clearDsizeBytes();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DirInfoOrBuilder
                public long getDsizeBytes() {
                    return ((DirInfo) this.instance).getDsizeBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DirInfoOrBuilder
                public boolean hasDsizeBytes() {
                    return ((DirInfo) this.instance).hasDsizeBytes();
                }

                public Builder setDsizeBytes(long j11) {
                    copyOnWrite();
                    ((DirInfo) this.instance).setDsizeBytes(j11);
                    return this;
                }

                private Builder() {
                    super(DirInfo.DEFAULT_INSTANCE);
                }
            }

            static {
                DirInfo dirInfo = new DirInfo();
                DEFAULT_INSTANCE = dirInfo;
                n0.registerDefaultInstance(DirInfo.class, dirInfo);
            }

            private DirInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearDsizeBytes() {
                this.bitField0_ &= -2;
                this.dsizeBytes_ = 0L;
            }

            public static DirInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static DirInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (DirInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static DirInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setDsizeBytes(long j11) {
                this.bitField0_ |= 1;
                this.dsizeBytes_ = j11;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဃ\u0000", new Object[]{"bitField0_", "dsizeBytes_"});
                    case 3:
                        return new DirInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (DirInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DirInfoOrBuilder
            public long getDsizeBytes() {
                return this.dsizeBytes_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.DirInfoOrBuilder
            public boolean hasDsizeBytes() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(DirInfo dirInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(dirInfo);
            }

            public static DirInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (DirInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static DirInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static DirInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static DirInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static DirInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static DirInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static DirInfo parseFrom(InputStream inputStream) throws IOException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static DirInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static DirInfo parseFrom(p pVar) throws IOException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static DirInfo parseFrom(p pVar, y yVar) throws IOException {
                return (DirInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface DirInfoOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            long getDsizeBytes();

            boolean hasDsizeBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Geo extends n0 implements GeoOrBuilder {
            private static final Geo DEFAULT_INSTANCE;
            private static volatile v1 PARSER = null;
            public static final int UTCOFFSET_FIELD_NUMBER = 1;
            private int bitField0_;
            private int utcoffset_;

            public static final class Builder extends f0 implements GeoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearUtcoffset() {
                    copyOnWrite();
                    ((Geo) this.instance).clearUtcoffset();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.GeoOrBuilder
                public int getUtcoffset() {
                    return ((Geo) this.instance).getUtcoffset();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.GeoOrBuilder
                public boolean hasUtcoffset() {
                    return ((Geo) this.instance).hasUtcoffset();
                }

                public Builder setUtcoffset(int i5) {
                    copyOnWrite();
                    ((Geo) this.instance).setUtcoffset(i5);
                    return this;
                }

                private Builder() {
                    super(Geo.DEFAULT_INSTANCE);
                }
            }

            static {
                Geo geo = new Geo();
                DEFAULT_INSTANCE = geo;
                n0.registerDefaultInstance(Geo.class, geo);
            }

            private Geo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearUtcoffset() {
                this.bitField0_ &= -2;
                this.utcoffset_ = 0;
            }

            public static Geo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static Geo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Geo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Geo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUtcoffset(int i5) {
                this.bitField0_ |= 1;
                this.utcoffset_ = i5;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001င\u0000", new Object[]{"bitField0_", "utcoffset_"});
                    case 3:
                        return new Geo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (Geo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.GeoOrBuilder
            public int getUtcoffset() {
                return this.utcoffset_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.GeoOrBuilder
            public boolean hasUtcoffset() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(Geo geo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(geo);
            }

            public static Geo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (Geo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Geo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static Geo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static Geo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static Geo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static Geo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static Geo parseFrom(InputStream inputStream) throws IOException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Geo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Geo parseFrom(p pVar) throws IOException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static Geo parseFrom(p pVar, y yVar) throws IOException {
                return (Geo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface GeoOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            int getUtcoffset();

            boolean hasUtcoffset();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class ImpLvlRevData extends n0 implements ImpLvlRevDataOrBuilder {
            private static final ImpLvlRevData DEFAULT_INSTANCE;
            public static final int IMP_COUNTS_FIELD_NUMBER = 4;
            public static final int LAST_IMP_TS_FIELD_NUMBER = 2;
            private static volatile v1 PARSER = null;
            public static final int SESSION_ID_FIELD_NUMBER = 1;
            public static final int SESSION_START_TS_FIELD_NUMBER = 3;
            private ImpCounts impCounts_;
            private long lastImpTs_;
            private String sessionId_ = b.f42142b;
            private long sessionStartTs_;

            /* loaded from: classes3.dex */
            public static final class Builder extends f0 implements ImpLvlRevDataOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearImpCounts() {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).clearImpCounts();
                    return this;
                }

                public Builder clearLastImpTs() {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).clearLastImpTs();
                    return this;
                }

                public Builder clearSessionId() {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).clearSessionId();
                    return this;
                }

                public Builder clearSessionStartTs() {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).clearSessionStartTs();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
                public ImpCounts getImpCounts() {
                    return ((ImpLvlRevData) this.instance).getImpCounts();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
                public long getLastImpTs() {
                    return ((ImpLvlRevData) this.instance).getLastImpTs();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
                public String getSessionId() {
                    return ((ImpLvlRevData) this.instance).getSessionId();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
                public l getSessionIdBytes() {
                    return ((ImpLvlRevData) this.instance).getSessionIdBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
                public long getSessionStartTs() {
                    return ((ImpLvlRevData) this.instance).getSessionStartTs();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
                public boolean hasImpCounts() {
                    return ((ImpLvlRevData) this.instance).hasImpCounts();
                }

                public Builder mergeImpCounts(ImpCounts impCounts) {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).mergeImpCounts(impCounts);
                    return this;
                }

                public Builder setImpCounts(ImpCounts impCounts) {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).setImpCounts(impCounts);
                    return this;
                }

                public Builder setLastImpTs(long j11) {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).setLastImpTs(j11);
                    return this;
                }

                public Builder setSessionId(String str) {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).setSessionId(str);
                    return this;
                }

                public Builder setSessionIdBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).setSessionIdBytes(lVar);
                    return this;
                }

                public Builder setSessionStartTs(long j11) {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).setSessionStartTs(j11);
                    return this;
                }

                private Builder() {
                    super(ImpLvlRevData.DEFAULT_INSTANCE);
                }

                public Builder setImpCounts(ImpCounts.Builder builder) {
                    copyOnWrite();
                    ((ImpLvlRevData) this.instance).setImpCounts((ImpCounts) builder.build());
                    return this;
                }
            }

            /* loaded from: classes3.dex */
            public static final class ImpCounts extends n0 implements ImpCountsOrBuilder {
                public static final int BANNER_FIELD_NUMBER = 4;
                private static final ImpCounts DEFAULT_INSTANCE;
                public static final int INTERSTITIAL_FIELD_NUMBER = 1;
                public static final int MREC_FIELD_NUMBER = 3;
                public static final int NATIVE_FIELD_NUMBER = 5;
                private static volatile v1 PARSER = null;
                public static final int REWARDED_FIELD_NUMBER = 2;
                private int banner_;
                private int interstitial_;
                private int mrec_;
                private int native_;
                private int rewarded_;

                public static final class Builder extends f0 implements ImpCountsOrBuilder {
                    public /* synthetic */ Builder(int i5) {
                        this();
                    }

                    public Builder clearBanner() {
                        copyOnWrite();
                        ((ImpCounts) this.instance).clearBanner();
                        return this;
                    }

                    public Builder clearInterstitial() {
                        copyOnWrite();
                        ((ImpCounts) this.instance).clearInterstitial();
                        return this;
                    }

                    public Builder clearMrec() {
                        copyOnWrite();
                        ((ImpCounts) this.instance).clearMrec();
                        return this;
                    }

                    public Builder clearNative() {
                        copyOnWrite();
                        ((ImpCounts) this.instance).clearNative();
                        return this;
                    }

                    public Builder clearRewarded() {
                        copyOnWrite();
                        ((ImpCounts) this.instance).clearRewarded();
                        return this;
                    }

                    @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                    public int getBanner() {
                        return ((ImpCounts) this.instance).getBanner();
                    }

                    @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                    public int getInterstitial() {
                        return ((ImpCounts) this.instance).getInterstitial();
                    }

                    @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                    public int getMrec() {
                        return ((ImpCounts) this.instance).getMrec();
                    }

                    @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                    public int getNative() {
                        return ((ImpCounts) this.instance).getNative();
                    }

                    @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                    public int getRewarded() {
                        return ((ImpCounts) this.instance).getRewarded();
                    }

                    public Builder setBanner(int i5) {
                        copyOnWrite();
                        ((ImpCounts) this.instance).setBanner(i5);
                        return this;
                    }

                    public Builder setInterstitial(int i5) {
                        copyOnWrite();
                        ((ImpCounts) this.instance).setInterstitial(i5);
                        return this;
                    }

                    public Builder setMrec(int i5) {
                        copyOnWrite();
                        ((ImpCounts) this.instance).setMrec(i5);
                        return this;
                    }

                    public Builder setNative(int i5) {
                        copyOnWrite();
                        ((ImpCounts) this.instance).setNative(i5);
                        return this;
                    }

                    public Builder setRewarded(int i5) {
                        copyOnWrite();
                        ((ImpCounts) this.instance).setRewarded(i5);
                        return this;
                    }

                    private Builder() {
                        super(ImpCounts.DEFAULT_INSTANCE);
                    }
                }

                static {
                    ImpCounts impCounts = new ImpCounts();
                    DEFAULT_INSTANCE = impCounts;
                    n0.registerDefaultInstance(ImpCounts.class, impCounts);
                }

                private ImpCounts() {
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearBanner() {
                    this.banner_ = 0;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearInterstitial() {
                    this.interstitial_ = 0;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearMrec() {
                    this.mrec_ = 0;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearNative() {
                    this.native_ = 0;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearRewarded() {
                    this.rewarded_ = 0;
                }

                public static ImpCounts getDefaultInstance() {
                    return DEFAULT_INSTANCE;
                }

                public static Builder newBuilder() {
                    return (Builder) DEFAULT_INSTANCE.createBuilder();
                }

                public static ImpCounts parseDelimitedFrom(InputStream inputStream) throws IOException {
                    return (ImpCounts) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static ImpCounts parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
                }

                public static v1 parser() {
                    return DEFAULT_INSTANCE.getParserForType();
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setBanner(int i5) {
                    this.banner_ = i5;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setInterstitial(int i5) {
                    this.interstitial_ = i5;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setMrec(int i5) {
                    this.mrec_ = i5;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setNative(int i5) {
                    this.native_ = i5;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setRewarded(int i5) {
                    this.rewarded_ = i5;
                }

                @Override // com.google.protobuf.n0
                public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                    v1 g0Var;
                    switch (m0Var.ordinal()) {
                        case 0:
                            return (byte) 1;
                        case 1:
                            return null;
                        case 2:
                            return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0005\u0000\u0000\u0001\u0005\u0005\u0000\u0000\u0000\u0001\u0004\u0002\u0004\u0003\u0004\u0004\u0004\u0005\u0004", new Object[]{"interstitial_", "rewarded_", "mrec_", "banner_", "native_"});
                        case 3:
                            return new ImpCounts();
                        case 4:
                            return new Builder(0);
                        case 5:
                            return DEFAULT_INSTANCE;
                        case 6:
                            v1 v1Var = PARSER;
                            if (v1Var != null) {
                                return v1Var;
                            }
                            synchronized (ImpCounts.class) {
                                try {
                                    g0Var = PARSER;
                                    if (g0Var == null) {
                                        g0Var = new g0();
                                        PARSER = g0Var;
                                    }
                                } catch (Throwable th2) {
                                    throw th2;
                                }
                            }
                            return g0Var;
                        default:
                            throw new UnsupportedOperationException();
                    }
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                public int getBanner() {
                    return this.banner_;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                public int getInterstitial() {
                    return this.interstitial_;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                public int getMrec() {
                    return this.mrec_;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                public int getNative() {
                    return this.native_;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevData.ImpCountsOrBuilder
                public int getRewarded() {
                    return this.rewarded_;
                }

                public static Builder newBuilder(ImpCounts impCounts) {
                    return (Builder) DEFAULT_INSTANCE.createBuilder(impCounts);
                }

                public static ImpCounts parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                    return (ImpCounts) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static ImpCounts parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
                }

                public static ImpCounts parseFrom(l lVar) throws InvalidProtocolBufferException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, lVar);
                }

                public static ImpCounts parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
                }

                public static ImpCounts parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, bArr);
                }

                public static ImpCounts parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
                }

                public static ImpCounts parseFrom(InputStream inputStream) throws IOException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static ImpCounts parseFrom(InputStream inputStream, y yVar) throws IOException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static ImpCounts parseFrom(p pVar) throws IOException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, pVar);
                }

                public static ImpCounts parseFrom(p pVar, y yVar) throws IOException {
                    return (ImpCounts) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
                }
            }

            /* loaded from: classes3.dex */
            public interface ImpCountsOrBuilder extends p1 {
                int getBanner();

                @Override // com.google.protobuf.p1
                /* synthetic */ o1 getDefaultInstanceForType();

                int getInterstitial();

                int getMrec();

                int getNative();

                int getRewarded();

                @Override // com.google.protobuf.p1
                /* synthetic */ boolean isInitialized();
            }

            static {
                ImpLvlRevData impLvlRevData = new ImpLvlRevData();
                DEFAULT_INSTANCE = impLvlRevData;
                n0.registerDefaultInstance(ImpLvlRevData.class, impLvlRevData);
            }

            private ImpLvlRevData() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearImpCounts() {
                this.impCounts_ = null;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLastImpTs() {
                this.lastImpTs_ = 0L;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearSessionId() {
                this.sessionId_ = getDefaultInstance().getSessionId();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearSessionStartTs() {
                this.sessionStartTs_ = 0L;
            }

            public static ImpLvlRevData getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeImpCounts(ImpCounts impCounts) {
                impCounts.getClass();
                ImpCounts impCounts2 = this.impCounts_;
                if (impCounts2 == null || impCounts2 == ImpCounts.getDefaultInstance()) {
                    this.impCounts_ = impCounts;
                } else {
                    this.impCounts_ = (ImpCounts) ((ImpCounts.Builder) ImpCounts.newBuilder(this.impCounts_).mergeFrom((n0) impCounts)).buildPartial();
                }
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ImpLvlRevData parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ImpLvlRevData) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ImpLvlRevData parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setImpCounts(ImpCounts impCounts) {
                impCounts.getClass();
                this.impCounts_ = impCounts;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLastImpTs(long j11) {
                this.lastImpTs_ = j11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setSessionId(String str) {
                str.getClass();
                this.sessionId_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setSessionIdBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.sessionId_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setSessionStartTs(long j11) {
                this.sessionStartTs_ = j11;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȉ\u0002\u0002\u0003\u0002\u0004\t", new Object[]{"sessionId_", "lastImpTs_", "sessionStartTs_", "impCounts_"});
                    case 3:
                        return new ImpLvlRevData();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ImpLvlRevData.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
            public ImpCounts getImpCounts() {
                ImpCounts impCounts = this.impCounts_;
                return impCounts == null ? ImpCounts.getDefaultInstance() : impCounts;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
            public long getLastImpTs() {
                return this.lastImpTs_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
            public String getSessionId() {
                return this.sessionId_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
            public l getSessionIdBytes() {
                return l.f(this.sessionId_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
            public long getSessionStartTs() {
                return this.sessionStartTs_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.ImpLvlRevDataOrBuilder
            public boolean hasImpCounts() {
                return this.impCounts_ != null;
            }

            public static Builder newBuilder(ImpLvlRevData impLvlRevData) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(impLvlRevData);
            }

            public static ImpLvlRevData parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ImpLvlRevData) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ImpLvlRevData parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ImpLvlRevData parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static ImpLvlRevData parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ImpLvlRevData parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ImpLvlRevData parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ImpLvlRevData parseFrom(InputStream inputStream) throws IOException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ImpLvlRevData parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ImpLvlRevData parseFrom(p pVar) throws IOException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ImpLvlRevData parseFrom(p pVar, y yVar) throws IOException {
                return (ImpLvlRevData) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface ImpLvlRevDataOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            ImpLvlRevData.ImpCounts getImpCounts();

            long getLastImpTs();

            String getSessionId();

            l getSessionIdBytes();

            long getSessionStartTs();

            boolean hasImpCounts();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class MemoryInfo extends n0 implements MemoryInfoOrBuilder {
            private static final MemoryInfo DEFAULT_INSTANCE;
            public static final int LOW_MEM_FIELD_NUMBER = 1;
            public static final int LOW_MEM_THRESHOLD_BYTES_FIELD_NUMBER = 2;
            private static volatile v1 PARSER = null;
            public static final int TOTAL_MEM_BYTES_FIELD_NUMBER = 3;
            private int bitField0_;
            private long lowMemThresholdBytes_;
            private boolean lowMem_;
            private long totalMemBytes_;

            public static final class Builder extends f0 implements MemoryInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearLowMem() {
                    copyOnWrite();
                    ((MemoryInfo) this.instance).clearLowMem();
                    return this;
                }

                public Builder clearLowMemThresholdBytes() {
                    copyOnWrite();
                    ((MemoryInfo) this.instance).clearLowMemThresholdBytes();
                    return this;
                }

                public Builder clearTotalMemBytes() {
                    copyOnWrite();
                    ((MemoryInfo) this.instance).clearTotalMemBytes();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
                public boolean getLowMem() {
                    return ((MemoryInfo) this.instance).getLowMem();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
                public long getLowMemThresholdBytes() {
                    return ((MemoryInfo) this.instance).getLowMemThresholdBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
                public long getTotalMemBytes() {
                    return ((MemoryInfo) this.instance).getTotalMemBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
                public boolean hasLowMem() {
                    return ((MemoryInfo) this.instance).hasLowMem();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
                public boolean hasLowMemThresholdBytes() {
                    return ((MemoryInfo) this.instance).hasLowMemThresholdBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
                public boolean hasTotalMemBytes() {
                    return ((MemoryInfo) this.instance).hasTotalMemBytes();
                }

                public Builder setLowMem(boolean z11) {
                    copyOnWrite();
                    ((MemoryInfo) this.instance).setLowMem(z11);
                    return this;
                }

                public Builder setLowMemThresholdBytes(long j11) {
                    copyOnWrite();
                    ((MemoryInfo) this.instance).setLowMemThresholdBytes(j11);
                    return this;
                }

                public Builder setTotalMemBytes(long j11) {
                    copyOnWrite();
                    ((MemoryInfo) this.instance).setTotalMemBytes(j11);
                    return this;
                }

                private Builder() {
                    super(MemoryInfo.DEFAULT_INSTANCE);
                }
            }

            static {
                MemoryInfo memoryInfo = new MemoryInfo();
                DEFAULT_INSTANCE = memoryInfo;
                n0.registerDefaultInstance(MemoryInfo.class, memoryInfo);
            }

            private MemoryInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLowMem() {
                this.bitField0_ &= -2;
                this.lowMem_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLowMemThresholdBytes() {
                this.bitField0_ &= -3;
                this.lowMemThresholdBytes_ = 0L;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearTotalMemBytes() {
                this.bitField0_ &= -5;
                this.totalMemBytes_ = 0L;
            }

            public static MemoryInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static MemoryInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (MemoryInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static MemoryInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLowMem(boolean z11) {
                this.bitField0_ |= 1;
                this.lowMem_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLowMemThresholdBytes(long j11) {
                this.bitField0_ |= 2;
                this.lowMemThresholdBytes_ = j11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setTotalMemBytes(long j11) {
                this.bitField0_ |= 4;
                this.totalMemBytes_ = j11;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဃ\u0001\u0003ဃ\u0002", new Object[]{"bitField0_", "lowMem_", "lowMemThresholdBytes_", "totalMemBytes_"});
                    case 3:
                        return new MemoryInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (MemoryInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
            public boolean getLowMem() {
                return this.lowMem_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
            public long getLowMemThresholdBytes() {
                return this.lowMemThresholdBytes_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
            public long getTotalMemBytes() {
                return this.totalMemBytes_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
            public boolean hasLowMem() {
                return (this.bitField0_ & 1) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
            public boolean hasLowMemThresholdBytes() {
                return (this.bitField0_ & 2) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.MemoryInfoOrBuilder
            public boolean hasTotalMemBytes() {
                return (this.bitField0_ & 4) != 0;
            }

            public static Builder newBuilder(MemoryInfo memoryInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(memoryInfo);
            }

            public static MemoryInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (MemoryInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static MemoryInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static MemoryInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static MemoryInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static MemoryInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static MemoryInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static MemoryInfo parseFrom(InputStream inputStream) throws IOException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static MemoryInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static MemoryInfo parseFrom(p pVar) throws IOException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static MemoryInfo parseFrom(p pVar, y yVar) throws IOException {
                return (MemoryInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface MemoryInfoOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getLowMem();

            long getLowMemThresholdBytes();

            long getTotalMemBytes();

            boolean hasLowMem();

            boolean hasLowMemThresholdBytes();

            boolean hasTotalMemBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class NetworkInfo extends n0 implements NetworkInfoOrBuilder {
            private static final NetworkInfo DEFAULT_INSTANCE;
            public static final int MCC_FIELD_NUMBER = 3;
            public static final int MNC_FIELD_NUMBER = 4;
            private static volatile v1 PARSER = null;
            public static final int RESTRICTED_FIELD_NUMBER = 2;
            public static final int TYPE_FIELD_NUMBER = 1;
            private int bitField0_;
            private int mcc_;
            private int mnc_;
            private boolean restricted_;
            private int type_;

            public static final class Builder extends f0 implements NetworkInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearMcc() {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).clearMcc();
                    return this;
                }

                public Builder clearMnc() {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).clearMnc();
                    return this;
                }

                public Builder clearRestricted() {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).clearRestricted();
                    return this;
                }

                public Builder clearType() {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).clearType();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public int getMcc() {
                    return ((NetworkInfo) this.instance).getMcc();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public int getMnc() {
                    return ((NetworkInfo) this.instance).getMnc();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public boolean getRestricted() {
                    return ((NetworkInfo) this.instance).getRestricted();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public ConnectionType getType() {
                    return ((NetworkInfo) this.instance).getType();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public int getTypeValue() {
                    return ((NetworkInfo) this.instance).getTypeValue();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public boolean hasMcc() {
                    return ((NetworkInfo) this.instance).hasMcc();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public boolean hasMnc() {
                    return ((NetworkInfo) this.instance).hasMnc();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public boolean hasRestricted() {
                    return ((NetworkInfo) this.instance).hasRestricted();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
                public boolean hasType() {
                    return ((NetworkInfo) this.instance).hasType();
                }

                public Builder setMcc(int i5) {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).setMcc(i5);
                    return this;
                }

                public Builder setMnc(int i5) {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).setMnc(i5);
                    return this;
                }

                public Builder setRestricted(boolean z11) {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).setRestricted(z11);
                    return this;
                }

                public Builder setType(ConnectionType connectionType) {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).setType(connectionType);
                    return this;
                }

                public Builder setTypeValue(int i5) {
                    copyOnWrite();
                    ((NetworkInfo) this.instance).setTypeValue(i5);
                    return this;
                }

                private Builder() {
                    super(NetworkInfo.DEFAULT_INSTANCE);
                }
            }

            public enum ConnectionType implements r0 {
                UNKNOWN(0),
                WIFI(1),
                CELLULAR(2),
                NO_NETWORK(3),
                UNRECOGNIZED(-1);

                public static final int CELLULAR_VALUE = 2;
                public static final int NO_NETWORK_VALUE = 3;
                public static final int UNKNOWN_VALUE = 0;
                public static final int WIFI_VALUE = 1;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfo.ConnectionType.1
                    @Override // com.google.protobuf.s0
                    public ConnectionType findValueByNumber(int i5) {
                        return ConnectionType.forNumber(i5);
                    }
                };
                private final int value;

                /* loaded from: classes3.dex */
                public static final class ConnectionTypeVerifier implements t0 {
                    static final t0 INSTANCE = new ConnectionTypeVerifier();

                    private ConnectionTypeVerifier() {
                    }

                    @Override // com.google.protobuf.t0
                    public boolean isInRange(int i5) {
                        return ConnectionType.forNumber(i5) != null;
                    }
                }

                ConnectionType(int i5) {
                    this.value = i5;
                }

                public static ConnectionType forNumber(int i5) {
                    if (i5 == 0) {
                        return UNKNOWN;
                    }
                    if (i5 == 1) {
                        return WIFI;
                    }
                    if (i5 == 2) {
                        return CELLULAR;
                    }
                    if (i5 != 3) {
                        return null;
                    }
                    return NO_NETWORK;
                }

                public static s0 internalGetValueMap() {
                    return internalValueMap;
                }

                public static t0 internalGetVerifier() {
                    return ConnectionTypeVerifier.INSTANCE;
                }

                @Override // com.google.protobuf.r0
                public final int getNumber() {
                    if (this != UNRECOGNIZED) {
                        return this.value;
                    }
                    throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                }

                @Deprecated
                public static ConnectionType valueOf(int i5) {
                    return forNumber(i5);
                }
            }

            static {
                NetworkInfo networkInfo = new NetworkInfo();
                DEFAULT_INSTANCE = networkInfo;
                n0.registerDefaultInstance(NetworkInfo.class, networkInfo);
            }

            private NetworkInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMcc() {
                this.bitField0_ &= -5;
                this.mcc_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMnc() {
                this.bitField0_ &= -9;
                this.mnc_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearRestricted() {
                this.bitField0_ &= -3;
                this.restricted_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearType() {
                this.bitField0_ &= -2;
                this.type_ = 0;
            }

            public static NetworkInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static NetworkInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (NetworkInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static NetworkInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMcc(int i5) {
                this.bitField0_ |= 4;
                this.mcc_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMnc(int i5) {
                this.bitField0_ |= 8;
                this.mnc_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setRestricted(boolean z11) {
                this.bitField0_ |= 2;
                this.restricted_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setType(ConnectionType connectionType) {
                this.type_ = connectionType.getNumber();
                this.bitField0_ |= 1;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setTypeValue(int i5) {
                this.bitField0_ |= 1;
                this.type_ = i5;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဌ\u0000\u0002ဇ\u0001\u0003ဋ\u0002\u0004ဋ\u0003", new Object[]{"bitField0_", "type_", "restricted_", "mcc_", "mnc_"});
                    case 3:
                        return new NetworkInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (NetworkInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public int getMcc() {
                return this.mcc_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public int getMnc() {
                return this.mnc_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public boolean getRestricted() {
                return this.restricted_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public ConnectionType getType() {
                ConnectionType connectionTypeForNumber = ConnectionType.forNumber(this.type_);
                return connectionTypeForNumber == null ? ConnectionType.UNRECOGNIZED : connectionTypeForNumber;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public int getTypeValue() {
                return this.type_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public boolean hasMcc() {
                return (this.bitField0_ & 4) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public boolean hasMnc() {
                return (this.bitField0_ & 8) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public boolean hasRestricted() {
                return (this.bitField0_ & 2) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.NetworkInfoOrBuilder
            public boolean hasType() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(NetworkInfo networkInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(networkInfo);
            }

            public static NetworkInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (NetworkInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static NetworkInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static NetworkInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static NetworkInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static NetworkInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static NetworkInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static NetworkInfo parseFrom(InputStream inputStream) throws IOException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static NetworkInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static NetworkInfo parseFrom(p pVar) throws IOException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static NetworkInfo parseFrom(p pVar, y yVar) throws IOException {
                return (NetworkInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface NetworkInfoOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            int getMcc();

            int getMnc();

            boolean getRestricted();

            NetworkInfo.ConnectionType getType();

            int getTypeValue();

            boolean hasMcc();

            boolean hasMnc();

            boolean hasRestricted();

            boolean hasType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Privacy extends n0 implements PrivacyOrBuilder {
            public static final int CCPA_FIELD_NUMBER = 1;
            public static final int COPPA_FIELD_NUMBER = 3;
            private static final Privacy DEFAULT_INSTANCE;
            public static final int GDPR_FIELD_NUMBER = 2;
            private static volatile v1 PARSER = null;
            public static final int TCF_CONSENT_STRING_FIELD_NUMBER = 5;
            public static final int US_PRIVACY_FIELD_NUMBER = 4;
            private int bitField0_;
            private boolean ccpa_;
            private boolean coppa_;
            private boolean gdpr_;
            private String usPrivacy_ = b.f42142b;
            private String tcfConsentString_ = b.f42142b;

            public static final class Builder extends f0 implements PrivacyOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearCcpa() {
                    copyOnWrite();
                    ((Privacy) this.instance).clearCcpa();
                    return this;
                }

                public Builder clearCoppa() {
                    copyOnWrite();
                    ((Privacy) this.instance).clearCoppa();
                    return this;
                }

                public Builder clearGdpr() {
                    copyOnWrite();
                    ((Privacy) this.instance).clearGdpr();
                    return this;
                }

                public Builder clearTcfConsentString() {
                    copyOnWrite();
                    ((Privacy) this.instance).clearTcfConsentString();
                    return this;
                }

                public Builder clearUsPrivacy() {
                    copyOnWrite();
                    ((Privacy) this.instance).clearUsPrivacy();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean getCcpa() {
                    return ((Privacy) this.instance).getCcpa();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean getCoppa() {
                    return ((Privacy) this.instance).getCoppa();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean getGdpr() {
                    return ((Privacy) this.instance).getGdpr();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public String getTcfConsentString() {
                    return ((Privacy) this.instance).getTcfConsentString();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public l getTcfConsentStringBytes() {
                    return ((Privacy) this.instance).getTcfConsentStringBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public String getUsPrivacy() {
                    return ((Privacy) this.instance).getUsPrivacy();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public l getUsPrivacyBytes() {
                    return ((Privacy) this.instance).getUsPrivacyBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean hasCcpa() {
                    return ((Privacy) this.instance).hasCcpa();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean hasCoppa() {
                    return ((Privacy) this.instance).hasCoppa();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean hasGdpr() {
                    return ((Privacy) this.instance).hasGdpr();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean hasTcfConsentString() {
                    return ((Privacy) this.instance).hasTcfConsentString();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
                public boolean hasUsPrivacy() {
                    return ((Privacy) this.instance).hasUsPrivacy();
                }

                public Builder setCcpa(boolean z11) {
                    copyOnWrite();
                    ((Privacy) this.instance).setCcpa(z11);
                    return this;
                }

                public Builder setCoppa(boolean z11) {
                    copyOnWrite();
                    ((Privacy) this.instance).setCoppa(z11);
                    return this;
                }

                public Builder setGdpr(boolean z11) {
                    copyOnWrite();
                    ((Privacy) this.instance).setGdpr(z11);
                    return this;
                }

                public Builder setTcfConsentString(String str) {
                    copyOnWrite();
                    ((Privacy) this.instance).setTcfConsentString(str);
                    return this;
                }

                public Builder setTcfConsentStringBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Privacy) this.instance).setTcfConsentStringBytes(lVar);
                    return this;
                }

                public Builder setUsPrivacy(String str) {
                    copyOnWrite();
                    ((Privacy) this.instance).setUsPrivacy(str);
                    return this;
                }

                public Builder setUsPrivacyBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Privacy) this.instance).setUsPrivacyBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(Privacy.DEFAULT_INSTANCE);
                }
            }

            static {
                Privacy privacy = new Privacy();
                DEFAULT_INSTANCE = privacy;
                n0.registerDefaultInstance(Privacy.class, privacy);
            }

            private Privacy() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCcpa() {
                this.bitField0_ &= -2;
                this.ccpa_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCoppa() {
                this.bitField0_ &= -5;
                this.coppa_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearGdpr() {
                this.bitField0_ &= -3;
                this.gdpr_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearTcfConsentString() {
                this.bitField0_ &= -17;
                this.tcfConsentString_ = getDefaultInstance().getTcfConsentString();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearUsPrivacy() {
                this.bitField0_ &= -9;
                this.usPrivacy_ = getDefaultInstance().getUsPrivacy();
            }

            public static Privacy getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static Privacy parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Privacy) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Privacy parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCcpa(boolean z11) {
                this.bitField0_ |= 1;
                this.ccpa_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCoppa(boolean z11) {
                this.bitField0_ |= 4;
                this.coppa_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setGdpr(boolean z11) {
                this.bitField0_ |= 2;
                this.gdpr_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setTcfConsentString(String str) {
                str.getClass();
                this.bitField0_ |= 16;
                this.tcfConsentString_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setTcfConsentStringBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.tcfConsentString_ = lVar.o();
                this.bitField0_ |= 16;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUsPrivacy(String str) {
                str.getClass();
                this.bitField0_ |= 8;
                this.usPrivacy_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUsPrivacyBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.usPrivacy_ = lVar.o();
                this.bitField0_ |= 8;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004ለ\u0003\u0005ለ\u0004", new Object[]{"bitField0_", "ccpa_", "gdpr_", "coppa_", "usPrivacy_", "tcfConsentString_"});
                    case 3:
                        return new Privacy();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (Privacy.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean getCcpa() {
                return this.ccpa_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean getCoppa() {
                return this.coppa_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean getGdpr() {
                return this.gdpr_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public String getTcfConsentString() {
                return this.tcfConsentString_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public l getTcfConsentStringBytes() {
                return l.f(this.tcfConsentString_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public String getUsPrivacy() {
                return this.usPrivacy_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public l getUsPrivacyBytes() {
                return l.f(this.usPrivacy_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean hasCcpa() {
                return (this.bitField0_ & 1) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean hasCoppa() {
                return (this.bitField0_ & 4) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean hasGdpr() {
                return (this.bitField0_ & 2) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean hasTcfConsentString() {
                return (this.bitField0_ & 16) != 0;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.PrivacyOrBuilder
            public boolean hasUsPrivacy() {
                return (this.bitField0_ & 8) != 0;
            }

            public static Builder newBuilder(Privacy privacy) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(privacy);
            }

            public static Privacy parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (Privacy) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Privacy parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static Privacy parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static Privacy parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static Privacy parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static Privacy parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static Privacy parseFrom(InputStream inputStream) throws IOException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Privacy parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Privacy parseFrom(p pVar) throws IOException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static Privacy parseFrom(p pVar, y yVar) throws IOException {
                return (Privacy) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface PrivacyOrBuilder extends p1 {
            boolean getCcpa();

            boolean getCoppa();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getGdpr();

            String getTcfConsentString();

            l getTcfConsentStringBytes();

            String getUsPrivacy();

            l getUsPrivacyBytes();

            boolean hasCcpa();

            boolean hasCoppa();

            boolean hasGdpr();

            boolean hasTcfConsentString();

            boolean hasUsPrivacy();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class SdkInfo extends n0 implements SdkInfoOrBuilder {
            private static final SdkInfo DEFAULT_INSTANCE;
            public static final int INITIALIZED_FIELD_NUMBER = 1;
            private static volatile v1 PARSER;
            private int bitField0_;
            private boolean initialized_;

            public static final class Builder extends f0 implements SdkInfoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearInitialized() {
                    copyOnWrite();
                    ((SdkInfo) this.instance).clearInitialized();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.SdkInfoOrBuilder
                public boolean getInitialized() {
                    return ((SdkInfo) this.instance).getInitialized();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.SdkInfoOrBuilder
                public boolean hasInitialized() {
                    return ((SdkInfo) this.instance).hasInitialized();
                }

                public Builder setInitialized(boolean z11) {
                    copyOnWrite();
                    ((SdkInfo) this.instance).setInitialized(z11);
                    return this;
                }

                private Builder() {
                    super(SdkInfo.DEFAULT_INSTANCE);
                }
            }

            static {
                SdkInfo sdkInfo = new SdkInfo();
                DEFAULT_INSTANCE = sdkInfo;
                n0.registerDefaultInstance(SdkInfo.class, sdkInfo);
            }

            private SdkInfo() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearInitialized() {
                this.bitField0_ &= -2;
                this.initialized_ = false;
            }

            public static SdkInfo getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static SdkInfo parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (SdkInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static SdkInfo parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setInitialized(boolean z11) {
                this.bitField0_ |= 1;
                this.initialized_ = z11;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဇ\u0000", new Object[]{"bitField0_", "initialized_"});
                    case 3:
                        return new SdkInfo();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (SdkInfo.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.SdkInfoOrBuilder
            public boolean getInitialized() {
                return this.initialized_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.SdkInfoOrBuilder
            public boolean hasInitialized() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(SdkInfo sdkInfo) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(sdkInfo);
            }

            public static SdkInfo parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (SdkInfo) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static SdkInfo parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static SdkInfo parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static SdkInfo parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static SdkInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static SdkInfo parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static SdkInfo parseFrom(InputStream inputStream) throws IOException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static SdkInfo parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static SdkInfo parseFrom(p pVar) throws IOException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static SdkInfo parseFrom(p pVar, y yVar) throws IOException {
                return (SdkInfo) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface SdkInfoOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getInitialized();

            boolean hasInitialized();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        /* loaded from: classes3.dex */
        public static final class TestConfig extends n0 implements TestConfigOrBuilder {
            private static final TestConfig DEFAULT_INSTANCE;
            public static final int JSON_CONFIG_FIELD_NUMBER = 1;
            private static volatile v1 PARSER;
            private int bitField0_;
            private String jsonConfig_ = b.f42142b;

            public static final class Builder extends f0 implements TestConfigOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearJsonConfig() {
                    copyOnWrite();
                    ((TestConfig) this.instance).clearJsonConfig();
                    return this;
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.TestConfigOrBuilder
                public String getJsonConfig() {
                    return ((TestConfig) this.instance).getJsonConfig();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.TestConfigOrBuilder
                public l getJsonConfigBytes() {
                    return ((TestConfig) this.instance).getJsonConfigBytes();
                }

                @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.TestConfigOrBuilder
                public boolean hasJsonConfig() {
                    return ((TestConfig) this.instance).hasJsonConfig();
                }

                public Builder setJsonConfig(String str) {
                    copyOnWrite();
                    ((TestConfig) this.instance).setJsonConfig(str);
                    return this;
                }

                public Builder setJsonConfigBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((TestConfig) this.instance).setJsonConfigBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(TestConfig.DEFAULT_INSTANCE);
                }
            }

            static {
                TestConfig testConfig = new TestConfig();
                DEFAULT_INSTANCE = testConfig;
                n0.registerDefaultInstance(TestConfig.class, testConfig);
            }

            private TestConfig() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearJsonConfig() {
                this.bitField0_ &= -2;
                this.jsonConfig_ = getDefaultInstance().getJsonConfig();
            }

            public static TestConfig getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static TestConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (TestConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static TestConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setJsonConfig(String str) {
                str.getClass();
                this.bitField0_ |= 1;
                this.jsonConfig_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setJsonConfigBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.jsonConfig_ = lVar.o();
                this.bitField0_ |= 1;
            }

            @Override // com.google.protobuf.n0
            public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
                v1 g0Var;
                switch (m0Var.ordinal()) {
                    case 0:
                        return (byte) 1;
                    case 1:
                        return null;
                    case 2:
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ለ\u0000", new Object[]{"bitField0_", "jsonConfig_"});
                    case 3:
                        return new TestConfig();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (TestConfig.class) {
                            try {
                                g0Var = PARSER;
                                if (g0Var == null) {
                                    g0Var = new g0();
                                    PARSER = g0Var;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                        return g0Var;
                    default:
                        throw new UnsupportedOperationException();
                }
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.TestConfigOrBuilder
            public String getJsonConfig() {
                return this.jsonConfig_;
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.TestConfigOrBuilder
            public l getJsonConfigBytes() {
                return l.f(this.jsonConfig_);
            }

            @Override // com.moloco.sdk.BidToken.ClientBidTokenComponents.TestConfigOrBuilder
            public boolean hasJsonConfig() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(TestConfig testConfig) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(testConfig);
            }

            public static TestConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (TestConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static TestConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static TestConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static TestConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static TestConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static TestConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static TestConfig parseFrom(InputStream inputStream) throws IOException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static TestConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static TestConfig parseFrom(p pVar) throws IOException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static TestConfig parseFrom(p pVar, y yVar) throws IOException {
                return (TestConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        /* loaded from: classes3.dex */
        public interface TestConfigOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getJsonConfig();

            l getJsonConfigBytes();

            boolean hasJsonConfig();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        static {
            ClientBidTokenComponents clientBidTokenComponents = new ClientBidTokenComponents();
            DEFAULT_INSTANCE = clientBidTokenComponents;
            n0.registerDefaultInstance(ClientBidTokenComponents.class, clientBidTokenComponents);
        }

        private ClientBidTokenComponents() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAccessibilityInfo() {
            this.accessibilityInfo_ = null;
            this.bitField0_ &= -257;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAdInfo() {
            this.adInfo_ = null;
            this.bitField0_ &= -33;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAudioInfo() {
            this.audioInfo_ = null;
            this.bitField0_ &= -129;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearBatteryInfo() {
            this.batteryInfo_ = null;
            this.bitField0_ &= -65;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearDevice() {
            this.device_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearDirInfo() {
            this.dirInfo_ = null;
            this.bitField0_ &= -9;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearIdfv() {
            this.bitField0_ &= -2;
            this.idfv_ = getDefaultInstance().getIdfv();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearImpLvlRevData() {
            this.impLvlRevData_ = null;
            this.bitField0_ &= -513;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearInfo() {
            this.info_ = null;
            this.bitField0_ &= -3;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearMemoryInfo() {
            this.memoryInfo_ = null;
            this.bitField0_ &= -5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearNetworkInfo() {
            this.networkInfo_ = null;
            this.bitField0_ &= -17;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPrivacy() {
            this.privacy_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearTestConfig() {
            this.testConfig_ = null;
            this.bitField0_ &= -1025;
        }

        public static ClientBidTokenComponents getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeAccessibilityInfo(AccessibilityInfo accessibilityInfo) {
            accessibilityInfo.getClass();
            AccessibilityInfo accessibilityInfo2 = this.accessibilityInfo_;
            if (accessibilityInfo2 == null || accessibilityInfo2 == AccessibilityInfo.getDefaultInstance()) {
                this.accessibilityInfo_ = accessibilityInfo;
            } else {
                this.accessibilityInfo_ = (AccessibilityInfo) ((AccessibilityInfo.Builder) AccessibilityInfo.newBuilder(this.accessibilityInfo_).mergeFrom((n0) accessibilityInfo)).buildPartial();
            }
            this.bitField0_ |= 256;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeAdInfo(AdvertisingInfo advertisingInfo) {
            advertisingInfo.getClass();
            AdvertisingInfo advertisingInfo2 = this.adInfo_;
            if (advertisingInfo2 == null || advertisingInfo2 == AdvertisingInfo.getDefaultInstance()) {
                this.adInfo_ = advertisingInfo;
            } else {
                this.adInfo_ = (AdvertisingInfo) ((AdvertisingInfo.Builder) AdvertisingInfo.newBuilder(this.adInfo_).mergeFrom((n0) advertisingInfo)).buildPartial();
            }
            this.bitField0_ |= 32;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeAudioInfo(AudioInfo audioInfo) {
            audioInfo.getClass();
            AudioInfo audioInfo2 = this.audioInfo_;
            if (audioInfo2 == null || audioInfo2 == AudioInfo.getDefaultInstance()) {
                this.audioInfo_ = audioInfo;
            } else {
                this.audioInfo_ = (AudioInfo) ((AudioInfo.Builder) AudioInfo.newBuilder(this.audioInfo_).mergeFrom((n0) audioInfo)).buildPartial();
            }
            this.bitField0_ |= 128;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeBatteryInfo(BatteryInfo batteryInfo) {
            batteryInfo.getClass();
            BatteryInfo batteryInfo2 = this.batteryInfo_;
            if (batteryInfo2 == null || batteryInfo2 == BatteryInfo.getDefaultInstance()) {
                this.batteryInfo_ = batteryInfo;
            } else {
                this.batteryInfo_ = (BatteryInfo) ((BatteryInfo.Builder) BatteryInfo.newBuilder(this.batteryInfo_).mergeFrom((n0) batteryInfo)).buildPartial();
            }
            this.bitField0_ |= 64;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeDevice(Device device) {
            device.getClass();
            Device device2 = this.device_;
            if (device2 == null || device2 == Device.getDefaultInstance()) {
                this.device_ = device;
            } else {
                this.device_ = (Device) ((Device.Builder) Device.newBuilder(this.device_).mergeFrom((n0) device)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeDirInfo(DirInfo dirInfo) {
            dirInfo.getClass();
            DirInfo dirInfo2 = this.dirInfo_;
            if (dirInfo2 == null || dirInfo2 == DirInfo.getDefaultInstance()) {
                this.dirInfo_ = dirInfo;
            } else {
                this.dirInfo_ = (DirInfo) ((DirInfo.Builder) DirInfo.newBuilder(this.dirInfo_).mergeFrom((n0) dirInfo)).buildPartial();
            }
            this.bitField0_ |= 8;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeImpLvlRevData(ImpLvlRevData impLvlRevData) {
            impLvlRevData.getClass();
            ImpLvlRevData impLvlRevData2 = this.impLvlRevData_;
            if (impLvlRevData2 == null || impLvlRevData2 == ImpLvlRevData.getDefaultInstance()) {
                this.impLvlRevData_ = impLvlRevData;
            } else {
                this.impLvlRevData_ = (ImpLvlRevData) ((ImpLvlRevData.Builder) ImpLvlRevData.newBuilder(this.impLvlRevData_).mergeFrom((n0) impLvlRevData)).buildPartial();
            }
            this.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeInfo(SdkInfo sdkInfo) {
            sdkInfo.getClass();
            SdkInfo sdkInfo2 = this.info_;
            if (sdkInfo2 == null || sdkInfo2 == SdkInfo.getDefaultInstance()) {
                this.info_ = sdkInfo;
            } else {
                this.info_ = (SdkInfo) ((SdkInfo.Builder) SdkInfo.newBuilder(this.info_).mergeFrom((n0) sdkInfo)).buildPartial();
            }
            this.bitField0_ |= 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeMemoryInfo(MemoryInfo memoryInfo) {
            memoryInfo.getClass();
            MemoryInfo memoryInfo2 = this.memoryInfo_;
            if (memoryInfo2 == null || memoryInfo2 == MemoryInfo.getDefaultInstance()) {
                this.memoryInfo_ = memoryInfo;
            } else {
                this.memoryInfo_ = (MemoryInfo) ((MemoryInfo.Builder) MemoryInfo.newBuilder(this.memoryInfo_).mergeFrom((n0) memoryInfo)).buildPartial();
            }
            this.bitField0_ |= 4;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeNetworkInfo(NetworkInfo networkInfo) {
            networkInfo.getClass();
            NetworkInfo networkInfo2 = this.networkInfo_;
            if (networkInfo2 == null || networkInfo2 == NetworkInfo.getDefaultInstance()) {
                this.networkInfo_ = networkInfo;
            } else {
                this.networkInfo_ = (NetworkInfo) ((NetworkInfo.Builder) NetworkInfo.newBuilder(this.networkInfo_).mergeFrom((n0) networkInfo)).buildPartial();
            }
            this.bitField0_ |= 16;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergePrivacy(Privacy privacy) {
            privacy.getClass();
            Privacy privacy2 = this.privacy_;
            if (privacy2 == null || privacy2 == Privacy.getDefaultInstance()) {
                this.privacy_ = privacy;
            } else {
                this.privacy_ = (Privacy) ((Privacy.Builder) Privacy.newBuilder(this.privacy_).mergeFrom((n0) privacy)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeTestConfig(TestConfig testConfig) {
            testConfig.getClass();
            TestConfig testConfig2 = this.testConfig_;
            if (testConfig2 == null || testConfig2 == TestConfig.getDefaultInstance()) {
                this.testConfig_ = testConfig;
            } else {
                this.testConfig_ = (TestConfig) ((TestConfig.Builder) TestConfig.newBuilder(this.testConfig_).mergeFrom((n0) testConfig)).buildPartial();
            }
            this.bitField0_ |= 1024;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static ClientBidTokenComponents parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (ClientBidTokenComponents) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ClientBidTokenComponents parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAccessibilityInfo(AccessibilityInfo accessibilityInfo) {
            accessibilityInfo.getClass();
            this.accessibilityInfo_ = accessibilityInfo;
            this.bitField0_ |= 256;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdInfo(AdvertisingInfo advertisingInfo) {
            advertisingInfo.getClass();
            this.adInfo_ = advertisingInfo;
            this.bitField0_ |= 32;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAudioInfo(AudioInfo audioInfo) {
            audioInfo.getClass();
            this.audioInfo_ = audioInfo;
            this.bitField0_ |= 128;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBatteryInfo(BatteryInfo batteryInfo) {
            batteryInfo.getClass();
            this.batteryInfo_ = batteryInfo;
            this.bitField0_ |= 64;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setDevice(Device device) {
            device.getClass();
            this.device_ = device;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setDirInfo(DirInfo dirInfo) {
            dirInfo.getClass();
            this.dirInfo_ = dirInfo;
            this.bitField0_ |= 8;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIdfv(String str) {
            str.getClass();
            this.bitField0_ |= 1;
            this.idfv_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIdfvBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.idfv_ = lVar.o();
            this.bitField0_ |= 1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setImpLvlRevData(ImpLvlRevData impLvlRevData) {
            impLvlRevData.getClass();
            this.impLvlRevData_ = impLvlRevData;
            this.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setInfo(SdkInfo sdkInfo) {
            sdkInfo.getClass();
            this.info_ = sdkInfo;
            this.bitField0_ |= 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setMemoryInfo(MemoryInfo memoryInfo) {
            memoryInfo.getClass();
            this.memoryInfo_ = memoryInfo;
            this.bitField0_ |= 4;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setNetworkInfo(NetworkInfo networkInfo) {
            networkInfo.getClass();
            this.networkInfo_ = networkInfo;
            this.bitField0_ |= 16;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPrivacy(Privacy privacy) {
            privacy.getClass();
            this.privacy_ = privacy;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setTestConfig(TestConfig testConfig) {
            testConfig.getClass();
            this.testConfig_ = testConfig;
            this.bitField0_ |= 1024;
        }

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\r\u0000\u0001\u0001\r\r\u0000\u0000\u0000\u0001ለ\u0000\u0002\t\u0003\t\u0004ဉ\u0001\u0005ဉ\u0002\u0006ဉ\u0003\u0007ဉ\u0004\bဉ\u0005\tဉ\u0006\nဉ\u0007\u000bဉ\b\fဉ\t\rဉ\n", new Object[]{"bitField0_", "idfv_", "privacy_", "device_", "info_", "memoryInfo_", "dirInfo_", "networkInfo_", "adInfo_", "batteryInfo_", "audioInfo_", "accessibilityInfo_", "impLvlRevData_", "testConfig_"});
                case 3:
                    return new ClientBidTokenComponents();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (ClientBidTokenComponents.class) {
                        try {
                            g0Var = PARSER;
                            if (g0Var == null) {
                                g0Var = new g0();
                                PARSER = g0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return g0Var;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public AccessibilityInfo getAccessibilityInfo() {
            AccessibilityInfo accessibilityInfo = this.accessibilityInfo_;
            return accessibilityInfo == null ? AccessibilityInfo.getDefaultInstance() : accessibilityInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public AdvertisingInfo getAdInfo() {
            AdvertisingInfo advertisingInfo = this.adInfo_;
            return advertisingInfo == null ? AdvertisingInfo.getDefaultInstance() : advertisingInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public AudioInfo getAudioInfo() {
            AudioInfo audioInfo = this.audioInfo_;
            return audioInfo == null ? AudioInfo.getDefaultInstance() : audioInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public BatteryInfo getBatteryInfo() {
            BatteryInfo batteryInfo = this.batteryInfo_;
            return batteryInfo == null ? BatteryInfo.getDefaultInstance() : batteryInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public Device getDevice() {
            Device device = this.device_;
            return device == null ? Device.getDefaultInstance() : device;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public DirInfo getDirInfo() {
            DirInfo dirInfo = this.dirInfo_;
            return dirInfo == null ? DirInfo.getDefaultInstance() : dirInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public String getIdfv() {
            return this.idfv_;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public l getIdfvBytes() {
            return l.f(this.idfv_);
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public ImpLvlRevData getImpLvlRevData() {
            ImpLvlRevData impLvlRevData = this.impLvlRevData_;
            return impLvlRevData == null ? ImpLvlRevData.getDefaultInstance() : impLvlRevData;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public SdkInfo getInfo() {
            SdkInfo sdkInfo = this.info_;
            return sdkInfo == null ? SdkInfo.getDefaultInstance() : sdkInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public MemoryInfo getMemoryInfo() {
            MemoryInfo memoryInfo = this.memoryInfo_;
            return memoryInfo == null ? MemoryInfo.getDefaultInstance() : memoryInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public NetworkInfo getNetworkInfo() {
            NetworkInfo networkInfo = this.networkInfo_;
            return networkInfo == null ? NetworkInfo.getDefaultInstance() : networkInfo;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public Privacy getPrivacy() {
            Privacy privacy = this.privacy_;
            return privacy == null ? Privacy.getDefaultInstance() : privacy;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public TestConfig getTestConfig() {
            TestConfig testConfig = this.testConfig_;
            return testConfig == null ? TestConfig.getDefaultInstance() : testConfig;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasAccessibilityInfo() {
            return (this.bitField0_ & 256) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasAdInfo() {
            return (this.bitField0_ & 32) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasAudioInfo() {
            return (this.bitField0_ & 128) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasBatteryInfo() {
            return (this.bitField0_ & 64) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasDevice() {
            return this.device_ != null;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasDirInfo() {
            return (this.bitField0_ & 8) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasIdfv() {
            return (this.bitField0_ & 1) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasImpLvlRevData() {
            return (this.bitField0_ & EventBridgeChannel.QUEUE_CAPACITY) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasInfo() {
            return (this.bitField0_ & 2) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasMemoryInfo() {
            return (this.bitField0_ & 4) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasNetworkInfo() {
            return (this.bitField0_ & 16) != 0;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasPrivacy() {
            return this.privacy_ != null;
        }

        @Override // com.moloco.sdk.BidToken.ClientBidTokenComponentsOrBuilder
        public boolean hasTestConfig() {
            return (this.bitField0_ & 1024) != 0;
        }

        public static Builder newBuilder(ClientBidTokenComponents clientBidTokenComponents) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(clientBidTokenComponents);
        }

        public static ClientBidTokenComponents parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (ClientBidTokenComponents) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ClientBidTokenComponents parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static ClientBidTokenComponents parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static ClientBidTokenComponents parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static ClientBidTokenComponents parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static ClientBidTokenComponents parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static ClientBidTokenComponents parseFrom(InputStream inputStream) throws IOException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ClientBidTokenComponents parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ClientBidTokenComponents parseFrom(p pVar) throws IOException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static ClientBidTokenComponents parseFrom(p pVar, y yVar) throws IOException {
            return (ClientBidTokenComponents) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface ClientBidTokenComponentsOrBuilder extends p1 {
        ClientBidTokenComponents.AccessibilityInfo getAccessibilityInfo();

        ClientBidTokenComponents.AdvertisingInfo getAdInfo();

        ClientBidTokenComponents.AudioInfo getAudioInfo();

        ClientBidTokenComponents.BatteryInfo getBatteryInfo();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        ClientBidTokenComponents.Device getDevice();

        ClientBidTokenComponents.DirInfo getDirInfo();

        String getIdfv();

        l getIdfvBytes();

        ClientBidTokenComponents.ImpLvlRevData getImpLvlRevData();

        ClientBidTokenComponents.SdkInfo getInfo();

        ClientBidTokenComponents.MemoryInfo getMemoryInfo();

        ClientBidTokenComponents.NetworkInfo getNetworkInfo();

        ClientBidTokenComponents.Privacy getPrivacy();

        ClientBidTokenComponents.TestConfig getTestConfig();

        boolean hasAccessibilityInfo();

        boolean hasAdInfo();

        boolean hasAudioInfo();

        boolean hasBatteryInfo();

        boolean hasDevice();

        boolean hasDirInfo();

        boolean hasIdfv();

        boolean hasImpLvlRevData();

        boolean hasInfo();

        boolean hasMemoryInfo();

        boolean hasNetworkInfo();

        boolean hasPrivacy();

        boolean hasTestConfig();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    /* loaded from: classes.dex */
    public interface ClientBidTokenOrBuilder extends p1 {
        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        l getEs();

        l getPayload();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    private BidToken() {
    }

    public static void registerAllExtensions(y yVar) {
    }
}
