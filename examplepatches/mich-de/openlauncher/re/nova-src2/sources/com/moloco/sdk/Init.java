package com.moloco.sdk;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.c;
import com.google.protobuf.d;
import com.google.protobuf.f0;
import com.google.protobuf.g0;
import com.google.protobuf.l;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.o0;
import com.google.protobuf.o1;
import com.google.protobuf.p;
import com.google.protobuf.p1;
import com.google.protobuf.r0;
import com.google.protobuf.s0;
import com.google.protobuf.t0;
import com.google.protobuf.v0;
import com.google.protobuf.v1;
import com.google.protobuf.w0;
import com.google.protobuf.x0;
import com.google.protobuf.y;
import com.google.protobuf.z0;
import com.moloco.sdk.ConfigsOuterClass;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class Init {

    /* renamed from: com.moloco.sdk.Init$1, reason: invalid class name */
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

    /* loaded from: classes.dex */
    public static final class SDKInitResponse extends n0 implements SDKInitResponseOrBuilder {
        public static final int AD_SERVER_URL_FIELD_NUMBER = 6;
        public static final int AD_UNITS_FIELD_NUMBER = 4;
        public static final int APP_ID_FIELD_NUMBER = 1;
        public static final int BID_TOKEN_CONFIG_FIELD_NUMBER = 12;
        public static final int CONFIGS_FIELD_NUMBER = 16;
        public static final int COUNTRY_ISO2_CODE_FIELD_NUMBER = 7;
        public static final int COUNTRY_ISO3_CODE_FIELD_NUMBER = 3;
        public static final int CRASH_REPORTING_CONFIG_FIELD_NUMBER = 15;
        private static final SDKInitResponse DEFAULT_INSTANCE;
        public static final int DIRECT_ADS_CONFIG_FIELD_NUMBER = 18;
        public static final int EVENT_COLLECTION_CONFIG_FIELD_NUMBER = 11;
        public static final int EXPERIMENTAL_FEATURE_FLAGS_FIELD_NUMBER = 13;
        public static final int GEO_FIELD_NUMBER = 10;
        public static final int ILRD_CONFIG_FIELD_NUMBER = 17;
        public static final int OPERATIONAL_METRICS_CONFIG_FIELD_NUMBER = 14;
        private static volatile v1 PARSER = null;
        public static final int PLATFORM_ID_FIELD_NUMBER = 8;
        public static final int PUBLISHER_ID_FIELD_NUMBER = 2;
        public static final int RESOLVED_REGION_FIELD_NUMBER = 5;
        public static final int VERIFY_BANNER_VISIBLE_FIELD_NUMBER = 9;
        private BidTokenConfig bidTokenConfig_;
        private ConfigsOuterClass.Configs configs_;
        private CrashReportingConfig crashReportingConfig_;
        private DirectAdsConfig directAdsConfig_;
        private EventCollectionConfig eventCollectionConfig_;
        private Geo geo_;
        private ILRDConfig ilrdConfig_;
        private OperationalMetricsConfig operationalMetricsConfig_;
        private int resolvedRegion_;
        private boolean verifyBannerVisible_;
        private String appId_ = b.f42142b;
        private String publisherId_ = b.f42142b;
        private String countryIso3Code_ = b.f42142b;
        private z0 adUnits_ = n0.emptyProtobufList();
        private String adServerUrl_ = b.f42142b;
        private String countryIso2Code_ = b.f42142b;
        private String platformId_ = b.f42142b;
        private z0 experimentalFeatureFlags_ = n0.emptyProtobufList();

        public static final class AdUnit extends n0 implements AdUnitOrBuilder {
            public static final int AD_FREQUENCY_FIELD_NUMBER = 3;
            public static final int BID_FLOOR_FIELD_NUMBER = 4;
            private static final AdUnit DEFAULT_INSTANCE;
            public static final int ID_FIELD_NUMBER = 1;
            public static final int NAME_FIELD_NUMBER = 5;
            public static final int NATIVE_FIELD_NUMBER = 6;
            private static volatile v1 PARSER = null;
            public static final int TYPE_FIELD_NUMBER = 2;
            private int adFrequency_;
            private float bidFloor_;
            private String id_ = b.f42142b;
            private String name_ = b.f42142b;
            private Native native_;
            private int type_;

            public static final class Builder extends f0 implements AdUnitOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearAdFrequency() {
                    copyOnWrite();
                    ((AdUnit) this.instance).clearAdFrequency();
                    return this;
                }

                public Builder clearBidFloor() {
                    copyOnWrite();
                    ((AdUnit) this.instance).clearBidFloor();
                    return this;
                }

                public Builder clearId() {
                    copyOnWrite();
                    ((AdUnit) this.instance).clearId();
                    return this;
                }

                public Builder clearName() {
                    copyOnWrite();
                    ((AdUnit) this.instance).clearName();
                    return this;
                }

                public Builder clearNative() {
                    copyOnWrite();
                    ((AdUnit) this.instance).clearNative();
                    return this;
                }

                public Builder clearType() {
                    copyOnWrite();
                    ((AdUnit) this.instance).clearType();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public int getAdFrequency() {
                    return ((AdUnit) this.instance).getAdFrequency();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public float getBidFloor() {
                    return ((AdUnit) this.instance).getBidFloor();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public String getId() {
                    return ((AdUnit) this.instance).getId();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public l getIdBytes() {
                    return ((AdUnit) this.instance).getIdBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public String getName() {
                    return ((AdUnit) this.instance).getName();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public l getNameBytes() {
                    return ((AdUnit) this.instance).getNameBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public Native getNative() {
                    return ((AdUnit) this.instance).getNative();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public InventoryType getType() {
                    return ((AdUnit) this.instance).getType();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public int getTypeValue() {
                    return ((AdUnit) this.instance).getTypeValue();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
                public boolean hasNative() {
                    return ((AdUnit) this.instance).hasNative();
                }

                public Builder mergeNative(Native r22) {
                    copyOnWrite();
                    ((AdUnit) this.instance).mergeNative(r22);
                    return this;
                }

                public Builder setAdFrequency(int i5) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setAdFrequency(i5);
                    return this;
                }

                public Builder setBidFloor(float f11) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setBidFloor(f11);
                    return this;
                }

                public Builder setId(String str) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setId(str);
                    return this;
                }

                public Builder setIdBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((AdUnit) this.instance).setIdBytes(lVar);
                    return this;
                }

                public Builder setName(String str) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setName(str);
                    return this;
                }

                public Builder setNameBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((AdUnit) this.instance).setNameBytes(lVar);
                    return this;
                }

                public Builder setNative(Native r22) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setNative(r22);
                    return this;
                }

                public Builder setType(InventoryType inventoryType) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setType(inventoryType);
                    return this;
                }

                public Builder setTypeValue(int i5) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setTypeValue(i5);
                    return this;
                }

                private Builder() {
                    super(AdUnit.DEFAULT_INSTANCE);
                }

                public Builder setNative(Native.Builder builder) {
                    copyOnWrite();
                    ((AdUnit) this.instance).setNative((Native) builder.build());
                    return this;
                }
            }

            /* loaded from: classes3.dex */
            public enum InventoryType implements r0 {
                INVALID(0),
                BANNER(1),
                INTERSTITIAL(2),
                NATIVE(3),
                REWARD_VIDEO(4),
                MREC(6),
                UNRECOGNIZED(-1);

                public static final int BANNER_VALUE = 1;
                public static final int INTERSTITIAL_VALUE = 2;
                public static final int INVALID_VALUE = 0;
                public static final int MREC_VALUE = 6;
                public static final int NATIVE_VALUE = 3;
                public static final int REWARD_VIDEO_VALUE = 4;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.Init.SDKInitResponse.AdUnit.InventoryType.1
                    @Override // com.google.protobuf.s0
                    public InventoryType findValueByNumber(int i5) {
                        return InventoryType.forNumber(i5);
                    }
                };
                private final int value;

                public static final class InventoryTypeVerifier implements t0 {
                    static final t0 INSTANCE = new InventoryTypeVerifier();

                    private InventoryTypeVerifier() {
                    }

                    @Override // com.google.protobuf.t0
                    public boolean isInRange(int i5) {
                        return InventoryType.forNumber(i5) != null;
                    }
                }

                InventoryType(int i5) {
                    this.value = i5;
                }

                public static InventoryType forNumber(int i5) {
                    if (i5 == 0) {
                        return INVALID;
                    }
                    if (i5 == 1) {
                        return BANNER;
                    }
                    if (i5 == 2) {
                        return INTERSTITIAL;
                    }
                    if (i5 == 3) {
                        return NATIVE;
                    }
                    if (i5 == 4) {
                        return REWARD_VIDEO;
                    }
                    if (i5 != 6) {
                        return null;
                    }
                    return MREC;
                }

                public static s0 internalGetValueMap() {
                    return internalValueMap;
                }

                public static t0 internalGetVerifier() {
                    return InventoryTypeVerifier.INSTANCE;
                }

                @Override // com.google.protobuf.r0
                public final int getNumber() {
                    if (this != UNRECOGNIZED) {
                        return this.value;
                    }
                    throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                }

                @Deprecated
                public static InventoryType valueOf(int i5) {
                    return forNumber(i5);
                }
            }

            public static final class Native extends n0 implements NativeOrBuilder {
                private static final Native DEFAULT_INSTANCE;
                private static volatile v1 PARSER = null;
                public static final int TYPE_FIELD_NUMBER = 1;
                private int type_;

                /* loaded from: classes3.dex */
                public static final class Builder extends f0 implements NativeOrBuilder {
                    public /* synthetic */ Builder(int i5) {
                        this();
                    }

                    public Builder clearType() {
                        copyOnWrite();
                        ((Native) this.instance).clearType();
                        return this;
                    }

                    @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnit.NativeOrBuilder
                    public Type getType() {
                        return ((Native) this.instance).getType();
                    }

                    @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnit.NativeOrBuilder
                    public int getTypeValue() {
                        return ((Native) this.instance).getTypeValue();
                    }

                    public Builder setType(Type type) {
                        copyOnWrite();
                        ((Native) this.instance).setType(type);
                        return this;
                    }

                    public Builder setTypeValue(int i5) {
                        copyOnWrite();
                        ((Native) this.instance).setTypeValue(i5);
                        return this;
                    }

                    private Builder() {
                        super(Native.DEFAULT_INSTANCE);
                    }
                }

                /* loaded from: classes3.dex */
                public enum Type implements r0 {
                    UNKNOWN_TYPE(0),
                    LOGO(1),
                    IMAGE(2),
                    VIDEO(3),
                    UNRECOGNIZED(-1);

                    public static final int IMAGE_VALUE = 2;
                    public static final int LOGO_VALUE = 1;
                    public static final int UNKNOWN_TYPE_VALUE = 0;
                    public static final int VIDEO_VALUE = 3;
                    private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.Init.SDKInitResponse.AdUnit.Native.Type.1
                        @Override // com.google.protobuf.s0
                        public Type findValueByNumber(int i5) {
                            return Type.forNumber(i5);
                        }
                    };
                    private final int value;

                    public static final class TypeVerifier implements t0 {
                        static final t0 INSTANCE = new TypeVerifier();

                        private TypeVerifier() {
                        }

                        @Override // com.google.protobuf.t0
                        public boolean isInRange(int i5) {
                            return Type.forNumber(i5) != null;
                        }
                    }

                    Type(int i5) {
                        this.value = i5;
                    }

                    public static Type forNumber(int i5) {
                        if (i5 == 0) {
                            return UNKNOWN_TYPE;
                        }
                        if (i5 == 1) {
                            return LOGO;
                        }
                        if (i5 == 2) {
                            return IMAGE;
                        }
                        if (i5 != 3) {
                            return null;
                        }
                        return VIDEO;
                    }

                    public static s0 internalGetValueMap() {
                        return internalValueMap;
                    }

                    public static t0 internalGetVerifier() {
                        return TypeVerifier.INSTANCE;
                    }

                    @Override // com.google.protobuf.r0
                    public final int getNumber() {
                        if (this != UNRECOGNIZED) {
                            return this.value;
                        }
                        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                    }

                    @Deprecated
                    public static Type valueOf(int i5) {
                        return forNumber(i5);
                    }
                }

                static {
                    Native r02 = new Native();
                    DEFAULT_INSTANCE = r02;
                    n0.registerDefaultInstance(Native.class, r02);
                }

                private Native() {
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearType() {
                    this.type_ = 0;
                }

                public static Native getDefaultInstance() {
                    return DEFAULT_INSTANCE;
                }

                public static Builder newBuilder() {
                    return (Builder) DEFAULT_INSTANCE.createBuilder();
                }

                public static Native parseDelimitedFrom(InputStream inputStream) throws IOException {
                    return (Native) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static Native parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
                }

                public static v1 parser() {
                    return DEFAULT_INSTANCE.getParserForType();
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setType(Type type) {
                    this.type_ = type.getNumber();
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setTypeValue(int i5) {
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
                            return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\f", new Object[]{"type_"});
                        case 3:
                            return new Native();
                        case 4:
                            return new Builder(0);
                        case 5:
                            return DEFAULT_INSTANCE;
                        case 6:
                            v1 v1Var = PARSER;
                            if (v1Var != null) {
                                return v1Var;
                            }
                            synchronized (Native.class) {
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

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnit.NativeOrBuilder
                public Type getType() {
                    Type typeForNumber = Type.forNumber(this.type_);
                    return typeForNumber == null ? Type.UNRECOGNIZED : typeForNumber;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnit.NativeOrBuilder
                public int getTypeValue() {
                    return this.type_;
                }

                public static Builder newBuilder(Native r12) {
                    return (Builder) DEFAULT_INSTANCE.createBuilder(r12);
                }

                public static Native parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                    return (Native) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static Native parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
                }

                public static Native parseFrom(l lVar) throws InvalidProtocolBufferException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, lVar);
                }

                public static Native parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
                }

                public static Native parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, bArr);
                }

                public static Native parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
                }

                public static Native parseFrom(InputStream inputStream) throws IOException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static Native parseFrom(InputStream inputStream, y yVar) throws IOException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static Native parseFrom(p pVar) throws IOException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, pVar);
                }

                public static Native parseFrom(p pVar, y yVar) throws IOException {
                    return (Native) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
                }
            }

            public interface NativeOrBuilder extends p1 {
                @Override // com.google.protobuf.p1
                /* synthetic */ o1 getDefaultInstanceForType();

                Native.Type getType();

                int getTypeValue();

                @Override // com.google.protobuf.p1
                /* synthetic */ boolean isInitialized();
            }

            static {
                AdUnit adUnit = new AdUnit();
                DEFAULT_INSTANCE = adUnit;
                n0.registerDefaultInstance(AdUnit.class, adUnit);
            }

            private AdUnit() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearAdFrequency() {
                this.adFrequency_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearBidFloor() {
                this.bidFloor_ = 0.0f;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearId() {
                this.id_ = getDefaultInstance().getId();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearName() {
                this.name_ = getDefaultInstance().getName();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearNative() {
                this.native_ = null;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearType() {
                this.type_ = 0;
            }

            public static AdUnit getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeNative(Native r32) {
                r32.getClass();
                Native r02 = this.native_;
                if (r02 == null || r02 == Native.getDefaultInstance()) {
                    this.native_ = r32;
                } else {
                    this.native_ = (Native) ((Native.Builder) Native.newBuilder(this.native_).mergeFrom((n0) r32)).buildPartial();
                }
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static AdUnit parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AdUnit) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AdUnit parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAdFrequency(int i5) {
                this.adFrequency_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBidFloor(float f11) {
                this.bidFloor_ = f11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setId(String str) {
                str.getClass();
                this.id_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setIdBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.id_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setName(String str) {
                str.getClass();
                this.name_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setNameBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.name_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setNative(Native r12) {
                r12.getClass();
                this.native_ = r12;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setType(InventoryType inventoryType) {
                this.type_ = inventoryType.getNumber();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setTypeValue(int i5) {
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0006\u0000\u0000\u0001\u0006\u0006\u0000\u0000\u0000\u0001Ȉ\u0002\f\u0003\u0004\u0004\u0001\u0005Ȉ\u0006\t", new Object[]{"id_", "type_", "adFrequency_", "bidFloor_", "name_", "native_"});
                    case 3:
                        return new AdUnit();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (AdUnit.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public int getAdFrequency() {
                return this.adFrequency_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public float getBidFloor() {
                return this.bidFloor_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public String getId() {
                return this.id_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public l getIdBytes() {
                return l.f(this.id_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public String getName() {
                return this.name_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public l getNameBytes() {
                return l.f(this.name_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public Native getNative() {
                Native r02 = this.native_;
                return r02 == null ? Native.getDefaultInstance() : r02;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public InventoryType getType() {
                InventoryType inventoryTypeForNumber = InventoryType.forNumber(this.type_);
                return inventoryTypeForNumber == null ? InventoryType.UNRECOGNIZED : inventoryTypeForNumber;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public int getTypeValue() {
                return this.type_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.AdUnitOrBuilder
            public boolean hasNative() {
                return this.native_ != null;
            }

            public static Builder newBuilder(AdUnit adUnit) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(adUnit);
            }

            public static AdUnit parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (AdUnit) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AdUnit parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static AdUnit parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static AdUnit parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static AdUnit parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static AdUnit parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static AdUnit parseFrom(InputStream inputStream) throws IOException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AdUnit parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AdUnit parseFrom(p pVar) throws IOException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static AdUnit parseFrom(p pVar, y yVar) throws IOException {
                return (AdUnit) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface AdUnitOrBuilder extends p1 {
            int getAdFrequency();

            float getBidFloor();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getId();

            l getIdBytes();

            String getName();

            l getNameBytes();

            AdUnit.Native getNative();

            AdUnit.InventoryType getType();

            int getTypeValue();

            boolean hasNative();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class BidTokenConfig extends n0 implements BidTokenConfigOrBuilder {
            public static final int BID_TOKEN_URL_FIELD_NUMBER = 2;
            private static final BidTokenConfig DEFAULT_INSTANCE;
            private static volatile v1 PARSER;
            private String bidTokenUrl_ = b.f42142b;

            /* loaded from: classes3.dex */
            public static final class Builder extends f0 implements BidTokenConfigOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearBidTokenUrl() {
                    copyOnWrite();
                    ((BidTokenConfig) this.instance).clearBidTokenUrl();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.BidTokenConfigOrBuilder
                public String getBidTokenUrl() {
                    return ((BidTokenConfig) this.instance).getBidTokenUrl();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.BidTokenConfigOrBuilder
                public l getBidTokenUrlBytes() {
                    return ((BidTokenConfig) this.instance).getBidTokenUrlBytes();
                }

                public Builder setBidTokenUrl(String str) {
                    copyOnWrite();
                    ((BidTokenConfig) this.instance).setBidTokenUrl(str);
                    return this;
                }

                public Builder setBidTokenUrlBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((BidTokenConfig) this.instance).setBidTokenUrlBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(BidTokenConfig.DEFAULT_INSTANCE);
                }
            }

            static {
                BidTokenConfig bidTokenConfig = new BidTokenConfig();
                DEFAULT_INSTANCE = bidTokenConfig;
                n0.registerDefaultInstance(BidTokenConfig.class, bidTokenConfig);
            }

            private BidTokenConfig() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearBidTokenUrl() {
                this.bidTokenUrl_ = getDefaultInstance().getBidTokenUrl();
            }

            public static BidTokenConfig getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static BidTokenConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (BidTokenConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static BidTokenConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBidTokenUrl(String str) {
                str.getClass();
                this.bidTokenUrl_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBidTokenUrlBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.bidTokenUrl_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0002\u0002\u0001\u0000\u0000\u0000\u0002Ȉ", new Object[]{"bidTokenUrl_"});
                    case 3:
                        return new BidTokenConfig();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (BidTokenConfig.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.BidTokenConfigOrBuilder
            public String getBidTokenUrl() {
                return this.bidTokenUrl_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.BidTokenConfigOrBuilder
            public l getBidTokenUrlBytes() {
                return l.f(this.bidTokenUrl_);
            }

            public static Builder newBuilder(BidTokenConfig bidTokenConfig) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(bidTokenConfig);
            }

            public static BidTokenConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (BidTokenConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static BidTokenConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static BidTokenConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static BidTokenConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static BidTokenConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static BidTokenConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static BidTokenConfig parseFrom(InputStream inputStream) throws IOException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static BidTokenConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static BidTokenConfig parseFrom(p pVar) throws IOException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static BidTokenConfig parseFrom(p pVar, y yVar) throws IOException {
                return (BidTokenConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface BidTokenConfigOrBuilder extends p1 {
            String getBidTokenUrl();

            l getBidTokenUrlBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Builder extends f0 implements SDKInitResponseOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder addAdUnits(AdUnit adUnit) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addAdUnits(adUnit);
                return this;
            }

            public Builder addAllAdUnits(Iterable<? extends AdUnit> iterable) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addAllAdUnits(iterable);
                return this;
            }

            public Builder addAllExperimentalFeatureFlags(Iterable<? extends ExperimentalFeatureFlag> iterable) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addAllExperimentalFeatureFlags(iterable);
                return this;
            }

            public Builder addExperimentalFeatureFlags(ExperimentalFeatureFlag experimentalFeatureFlag) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addExperimentalFeatureFlags(experimentalFeatureFlag);
                return this;
            }

            public Builder clearAdServerUrl() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearAdServerUrl();
                return this;
            }

            public Builder clearAdUnits() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearAdUnits();
                return this;
            }

            public Builder clearAppId() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearAppId();
                return this;
            }

            public Builder clearBidTokenConfig() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearBidTokenConfig();
                return this;
            }

            public Builder clearConfigs() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearConfigs();
                return this;
            }

            public Builder clearCountryIso2Code() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearCountryIso2Code();
                return this;
            }

            public Builder clearCountryIso3Code() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearCountryIso3Code();
                return this;
            }

            public Builder clearCrashReportingConfig() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearCrashReportingConfig();
                return this;
            }

            public Builder clearDirectAdsConfig() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearDirectAdsConfig();
                return this;
            }

            public Builder clearEventCollectionConfig() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearEventCollectionConfig();
                return this;
            }

            public Builder clearExperimentalFeatureFlags() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearExperimentalFeatureFlags();
                return this;
            }

            public Builder clearGeo() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearGeo();
                return this;
            }

            public Builder clearIlrdConfig() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearIlrdConfig();
                return this;
            }

            public Builder clearOperationalMetricsConfig() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearOperationalMetricsConfig();
                return this;
            }

            public Builder clearPlatformId() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearPlatformId();
                return this;
            }

            public Builder clearPublisherId() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearPublisherId();
                return this;
            }

            public Builder clearResolvedRegion() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearResolvedRegion();
                return this;
            }

            public Builder clearVerifyBannerVisible() {
                copyOnWrite();
                ((SDKInitResponse) this.instance).clearVerifyBannerVisible();
                return this;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public String getAdServerUrl() {
                return ((SDKInitResponse) this.instance).getAdServerUrl();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public l getAdServerUrlBytes() {
                return ((SDKInitResponse) this.instance).getAdServerUrlBytes();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public AdUnit getAdUnits(int i5) {
                return ((SDKInitResponse) this.instance).getAdUnits(i5);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public int getAdUnitsCount() {
                return ((SDKInitResponse) this.instance).getAdUnitsCount();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public List<AdUnit> getAdUnitsList() {
                return Collections.unmodifiableList(((SDKInitResponse) this.instance).getAdUnitsList());
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public String getAppId() {
                return ((SDKInitResponse) this.instance).getAppId();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public l getAppIdBytes() {
                return ((SDKInitResponse) this.instance).getAppIdBytes();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public BidTokenConfig getBidTokenConfig() {
                return ((SDKInitResponse) this.instance).getBidTokenConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public ConfigsOuterClass.Configs getConfigs() {
                return ((SDKInitResponse) this.instance).getConfigs();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public String getCountryIso2Code() {
                return ((SDKInitResponse) this.instance).getCountryIso2Code();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public l getCountryIso2CodeBytes() {
                return ((SDKInitResponse) this.instance).getCountryIso2CodeBytes();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public String getCountryIso3Code() {
                return ((SDKInitResponse) this.instance).getCountryIso3Code();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public l getCountryIso3CodeBytes() {
                return ((SDKInitResponse) this.instance).getCountryIso3CodeBytes();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public CrashReportingConfig getCrashReportingConfig() {
                return ((SDKInitResponse) this.instance).getCrashReportingConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public DirectAdsConfig getDirectAdsConfig() {
                return ((SDKInitResponse) this.instance).getDirectAdsConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public EventCollectionConfig getEventCollectionConfig() {
                return ((SDKInitResponse) this.instance).getEventCollectionConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public ExperimentalFeatureFlag getExperimentalFeatureFlags(int i5) {
                return ((SDKInitResponse) this.instance).getExperimentalFeatureFlags(i5);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public int getExperimentalFeatureFlagsCount() {
                return ((SDKInitResponse) this.instance).getExperimentalFeatureFlagsCount();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public List<ExperimentalFeatureFlag> getExperimentalFeatureFlagsList() {
                return Collections.unmodifiableList(((SDKInitResponse) this.instance).getExperimentalFeatureFlagsList());
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public Geo getGeo() {
                return ((SDKInitResponse) this.instance).getGeo();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public ILRDConfig getIlrdConfig() {
                return ((SDKInitResponse) this.instance).getIlrdConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public OperationalMetricsConfig getOperationalMetricsConfig() {
                return ((SDKInitResponse) this.instance).getOperationalMetricsConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public String getPlatformId() {
                return ((SDKInitResponse) this.instance).getPlatformId();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public l getPlatformIdBytes() {
                return ((SDKInitResponse) this.instance).getPlatformIdBytes();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public String getPublisherId() {
                return ((SDKInitResponse) this.instance).getPublisherId();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public l getPublisherIdBytes() {
                return ((SDKInitResponse) this.instance).getPublisherIdBytes();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public Region getResolvedRegion() {
                return ((SDKInitResponse) this.instance).getResolvedRegion();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public int getResolvedRegionValue() {
                return ((SDKInitResponse) this.instance).getResolvedRegionValue();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean getVerifyBannerVisible() {
                return ((SDKInitResponse) this.instance).getVerifyBannerVisible();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasBidTokenConfig() {
                return ((SDKInitResponse) this.instance).hasBidTokenConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasConfigs() {
                return ((SDKInitResponse) this.instance).hasConfigs();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasCrashReportingConfig() {
                return ((SDKInitResponse) this.instance).hasCrashReportingConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasDirectAdsConfig() {
                return ((SDKInitResponse) this.instance).hasDirectAdsConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasEventCollectionConfig() {
                return ((SDKInitResponse) this.instance).hasEventCollectionConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasGeo() {
                return ((SDKInitResponse) this.instance).hasGeo();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasIlrdConfig() {
                return ((SDKInitResponse) this.instance).hasIlrdConfig();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
            public boolean hasOperationalMetricsConfig() {
                return ((SDKInitResponse) this.instance).hasOperationalMetricsConfig();
            }

            public Builder mergeBidTokenConfig(BidTokenConfig bidTokenConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeBidTokenConfig(bidTokenConfig);
                return this;
            }

            public Builder mergeConfigs(ConfigsOuterClass.Configs configs) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeConfigs(configs);
                return this;
            }

            public Builder mergeCrashReportingConfig(CrashReportingConfig crashReportingConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeCrashReportingConfig(crashReportingConfig);
                return this;
            }

            public Builder mergeDirectAdsConfig(DirectAdsConfig directAdsConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeDirectAdsConfig(directAdsConfig);
                return this;
            }

            public Builder mergeEventCollectionConfig(EventCollectionConfig eventCollectionConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeEventCollectionConfig(eventCollectionConfig);
                return this;
            }

            public Builder mergeGeo(Geo geo) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeGeo(geo);
                return this;
            }

            public Builder mergeIlrdConfig(ILRDConfig iLRDConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeIlrdConfig(iLRDConfig);
                return this;
            }

            public Builder mergeOperationalMetricsConfig(OperationalMetricsConfig operationalMetricsConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).mergeOperationalMetricsConfig(operationalMetricsConfig);
                return this;
            }

            public Builder removeAdUnits(int i5) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).removeAdUnits(i5);
                return this;
            }

            public Builder removeExperimentalFeatureFlags(int i5) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).removeExperimentalFeatureFlags(i5);
                return this;
            }

            public Builder setAdServerUrl(String str) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setAdServerUrl(str);
                return this;
            }

            public Builder setAdServerUrlBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setAdServerUrlBytes(lVar);
                return this;
            }

            public Builder setAdUnits(int i5, AdUnit adUnit) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setAdUnits(i5, adUnit);
                return this;
            }

            public Builder setAppId(String str) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setAppId(str);
                return this;
            }

            public Builder setAppIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setAppIdBytes(lVar);
                return this;
            }

            public Builder setBidTokenConfig(BidTokenConfig bidTokenConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setBidTokenConfig(bidTokenConfig);
                return this;
            }

            public Builder setConfigs(ConfigsOuterClass.Configs configs) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setConfigs(configs);
                return this;
            }

            public Builder setCountryIso2Code(String str) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setCountryIso2Code(str);
                return this;
            }

            public Builder setCountryIso2CodeBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setCountryIso2CodeBytes(lVar);
                return this;
            }

            public Builder setCountryIso3Code(String str) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setCountryIso3Code(str);
                return this;
            }

            public Builder setCountryIso3CodeBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setCountryIso3CodeBytes(lVar);
                return this;
            }

            public Builder setCrashReportingConfig(CrashReportingConfig crashReportingConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setCrashReportingConfig(crashReportingConfig);
                return this;
            }

            public Builder setDirectAdsConfig(DirectAdsConfig directAdsConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setDirectAdsConfig(directAdsConfig);
                return this;
            }

            public Builder setEventCollectionConfig(EventCollectionConfig eventCollectionConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setEventCollectionConfig(eventCollectionConfig);
                return this;
            }

            public Builder setExperimentalFeatureFlags(int i5, ExperimentalFeatureFlag experimentalFeatureFlag) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setExperimentalFeatureFlags(i5, experimentalFeatureFlag);
                return this;
            }

            public Builder setGeo(Geo geo) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setGeo(geo);
                return this;
            }

            public Builder setIlrdConfig(ILRDConfig iLRDConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setIlrdConfig(iLRDConfig);
                return this;
            }

            public Builder setOperationalMetricsConfig(OperationalMetricsConfig operationalMetricsConfig) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setOperationalMetricsConfig(operationalMetricsConfig);
                return this;
            }

            public Builder setPlatformId(String str) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setPlatformId(str);
                return this;
            }

            public Builder setPlatformIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setPlatformIdBytes(lVar);
                return this;
            }

            public Builder setPublisherId(String str) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setPublisherId(str);
                return this;
            }

            public Builder setPublisherIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setPublisherIdBytes(lVar);
                return this;
            }

            public Builder setResolvedRegion(Region region) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setResolvedRegion(region);
                return this;
            }

            public Builder setResolvedRegionValue(int i5) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setResolvedRegionValue(i5);
                return this;
            }

            public Builder setVerifyBannerVisible(boolean z11) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setVerifyBannerVisible(z11);
                return this;
            }

            private Builder() {
                super(SDKInitResponse.DEFAULT_INSTANCE);
            }

            public Builder addAdUnits(int i5, AdUnit adUnit) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addAdUnits(i5, adUnit);
                return this;
            }

            public Builder addExperimentalFeatureFlags(int i5, ExperimentalFeatureFlag experimentalFeatureFlag) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addExperimentalFeatureFlags(i5, experimentalFeatureFlag);
                return this;
            }

            public Builder setAdUnits(int i5, AdUnit.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setAdUnits(i5, (AdUnit) builder.build());
                return this;
            }

            public Builder setBidTokenConfig(BidTokenConfig.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setBidTokenConfig((BidTokenConfig) builder.build());
                return this;
            }

            public Builder setConfigs(ConfigsOuterClass.Configs.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setConfigs((ConfigsOuterClass.Configs) builder.build());
                return this;
            }

            public Builder setCrashReportingConfig(CrashReportingConfig.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setCrashReportingConfig((CrashReportingConfig) builder.build());
                return this;
            }

            public Builder setDirectAdsConfig(DirectAdsConfig.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setDirectAdsConfig((DirectAdsConfig) builder.build());
                return this;
            }

            public Builder setEventCollectionConfig(EventCollectionConfig.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setEventCollectionConfig((EventCollectionConfig) builder.build());
                return this;
            }

            public Builder setExperimentalFeatureFlags(int i5, ExperimentalFeatureFlag.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setExperimentalFeatureFlags(i5, (ExperimentalFeatureFlag) builder.build());
                return this;
            }

            public Builder setGeo(Geo.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setGeo((Geo) builder.build());
                return this;
            }

            public Builder setIlrdConfig(ILRDConfig.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setIlrdConfig((ILRDConfig) builder.build());
                return this;
            }

            public Builder setOperationalMetricsConfig(OperationalMetricsConfig.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).setOperationalMetricsConfig((OperationalMetricsConfig) builder.build());
                return this;
            }

            public Builder addAdUnits(AdUnit.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addAdUnits((AdUnit) builder.build());
                return this;
            }

            public Builder addExperimentalFeatureFlags(ExperimentalFeatureFlag.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addExperimentalFeatureFlags((ExperimentalFeatureFlag) builder.build());
                return this;
            }

            public Builder addAdUnits(int i5, AdUnit.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addAdUnits(i5, (AdUnit) builder.build());
                return this;
            }

            public Builder addExperimentalFeatureFlags(int i5, ExperimentalFeatureFlag.Builder builder) {
                copyOnWrite();
                ((SDKInitResponse) this.instance).addExperimentalFeatureFlags(i5, (ExperimentalFeatureFlag) builder.build());
                return this;
            }
        }

        public static final class CrashReportingConfig extends n0 implements CrashReportingConfigOrBuilder {
            private static final CrashReportingConfig DEFAULT_INSTANCE;
            public static final int ENABLED_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int URL_FIELD_NUMBER = 2;
            private boolean enabled_;
            private String url_ = b.f42142b;

            /* loaded from: classes3.dex */
            public static final class Builder extends f0 implements CrashReportingConfigOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearEnabled() {
                    copyOnWrite();
                    ((CrashReportingConfig) this.instance).clearEnabled();
                    return this;
                }

                public Builder clearUrl() {
                    copyOnWrite();
                    ((CrashReportingConfig) this.instance).clearUrl();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.CrashReportingConfigOrBuilder
                public boolean getEnabled() {
                    return ((CrashReportingConfig) this.instance).getEnabled();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.CrashReportingConfigOrBuilder
                public String getUrl() {
                    return ((CrashReportingConfig) this.instance).getUrl();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.CrashReportingConfigOrBuilder
                public l getUrlBytes() {
                    return ((CrashReportingConfig) this.instance).getUrlBytes();
                }

                public Builder setEnabled(boolean z11) {
                    copyOnWrite();
                    ((CrashReportingConfig) this.instance).setEnabled(z11);
                    return this;
                }

                public Builder setUrl(String str) {
                    copyOnWrite();
                    ((CrashReportingConfig) this.instance).setUrl(str);
                    return this;
                }

                public Builder setUrlBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((CrashReportingConfig) this.instance).setUrlBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(CrashReportingConfig.DEFAULT_INSTANCE);
                }
            }

            static {
                CrashReportingConfig crashReportingConfig = new CrashReportingConfig();
                DEFAULT_INSTANCE = crashReportingConfig;
                n0.registerDefaultInstance(CrashReportingConfig.class, crashReportingConfig);
            }

            private CrashReportingConfig() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearEnabled() {
                this.enabled_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearUrl() {
                this.url_ = getDefaultInstance().getUrl();
            }

            public static CrashReportingConfig getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static CrashReportingConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (CrashReportingConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static CrashReportingConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setEnabled(boolean z11) {
                this.enabled_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUrl(String str) {
                str.getClass();
                this.url_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUrlBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.url_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0007\u0002Ȉ", new Object[]{"enabled_", "url_"});
                    case 3:
                        return new CrashReportingConfig();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (CrashReportingConfig.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.CrashReportingConfigOrBuilder
            public boolean getEnabled() {
                return this.enabled_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.CrashReportingConfigOrBuilder
            public String getUrl() {
                return this.url_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.CrashReportingConfigOrBuilder
            public l getUrlBytes() {
                return l.f(this.url_);
            }

            public static Builder newBuilder(CrashReportingConfig crashReportingConfig) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(crashReportingConfig);
            }

            public static CrashReportingConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (CrashReportingConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static CrashReportingConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static CrashReportingConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static CrashReportingConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static CrashReportingConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static CrashReportingConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static CrashReportingConfig parseFrom(InputStream inputStream) throws IOException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static CrashReportingConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static CrashReportingConfig parseFrom(p pVar) throws IOException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static CrashReportingConfig parseFrom(p pVar, y yVar) throws IOException {
                return (CrashReportingConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface CrashReportingConfigOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getEnabled();

            String getUrl();

            l getUrlBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class DirectAdsConfig extends n0 implements DirectAdsConfigOrBuilder {
            private static final DirectAdsConfig DEFAULT_INSTANCE;
            private static volatile v1 PARSER = null;
            public static final int URL_FIELD_NUMBER = 1;
            private String url_ = b.f42142b;

            /* loaded from: classes3.dex */
            public static final class Builder extends f0 implements DirectAdsConfigOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearUrl() {
                    copyOnWrite();
                    ((DirectAdsConfig) this.instance).clearUrl();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.DirectAdsConfigOrBuilder
                public String getUrl() {
                    return ((DirectAdsConfig) this.instance).getUrl();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.DirectAdsConfigOrBuilder
                public l getUrlBytes() {
                    return ((DirectAdsConfig) this.instance).getUrlBytes();
                }

                public Builder setUrl(String str) {
                    copyOnWrite();
                    ((DirectAdsConfig) this.instance).setUrl(str);
                    return this;
                }

                public Builder setUrlBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((DirectAdsConfig) this.instance).setUrlBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(DirectAdsConfig.DEFAULT_INSTANCE);
                }
            }

            static {
                DirectAdsConfig directAdsConfig = new DirectAdsConfig();
                DEFAULT_INSTANCE = directAdsConfig;
                n0.registerDefaultInstance(DirectAdsConfig.class, directAdsConfig);
            }

            private DirectAdsConfig() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearUrl() {
                this.url_ = getDefaultInstance().getUrl();
            }

            public static DirectAdsConfig getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static DirectAdsConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (DirectAdsConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static DirectAdsConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUrl(String str) {
                str.getClass();
                this.url_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUrlBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.url_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"url_"});
                    case 3:
                        return new DirectAdsConfig();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (DirectAdsConfig.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.DirectAdsConfigOrBuilder
            public String getUrl() {
                return this.url_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.DirectAdsConfigOrBuilder
            public l getUrlBytes() {
                return l.f(this.url_);
            }

            public static Builder newBuilder(DirectAdsConfig directAdsConfig) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(directAdsConfig);
            }

            public static DirectAdsConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (DirectAdsConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static DirectAdsConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static DirectAdsConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static DirectAdsConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static DirectAdsConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static DirectAdsConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static DirectAdsConfig parseFrom(InputStream inputStream) throws IOException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static DirectAdsConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static DirectAdsConfig parseFrom(p pVar) throws IOException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static DirectAdsConfig parseFrom(p pVar, y yVar) throws IOException {
                return (DirectAdsConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface DirectAdsConfigOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getUrl();

            l getUrlBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class EventCollectionConfig extends n0 implements EventCollectionConfigOrBuilder {
            public static final int APP_BACKGROUND_TRACKING_URL_FIELD_NUMBER = 3;
            public static final int APP_FOREGROUND_TRACKING_URL_FIELD_NUMBER = 4;
            private static final EventCollectionConfig DEFAULT_INSTANCE;
            public static final int EVENT_COLLECTION_ENABLED_FIELD_NUMBER = 1;
            public static final int MREF_COLLECTION_ENABLED_FIELD_NUMBER = 2;
            private static volatile v1 PARSER;
            private String appBackgroundTrackingUrl_ = b.f42142b;
            private String appForegroundTrackingUrl_ = b.f42142b;
            private boolean eventCollectionEnabled_;
            private boolean mrefCollectionEnabled_;

            public static final class Builder extends f0 implements EventCollectionConfigOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearAppBackgroundTrackingUrl() {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).clearAppBackgroundTrackingUrl();
                    return this;
                }

                public Builder clearAppForegroundTrackingUrl() {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).clearAppForegroundTrackingUrl();
                    return this;
                }

                public Builder clearEventCollectionEnabled() {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).clearEventCollectionEnabled();
                    return this;
                }

                public Builder clearMrefCollectionEnabled() {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).clearMrefCollectionEnabled();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
                public String getAppBackgroundTrackingUrl() {
                    return ((EventCollectionConfig) this.instance).getAppBackgroundTrackingUrl();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
                public l getAppBackgroundTrackingUrlBytes() {
                    return ((EventCollectionConfig) this.instance).getAppBackgroundTrackingUrlBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
                public String getAppForegroundTrackingUrl() {
                    return ((EventCollectionConfig) this.instance).getAppForegroundTrackingUrl();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
                public l getAppForegroundTrackingUrlBytes() {
                    return ((EventCollectionConfig) this.instance).getAppForegroundTrackingUrlBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
                public boolean getEventCollectionEnabled() {
                    return ((EventCollectionConfig) this.instance).getEventCollectionEnabled();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
                public boolean getMrefCollectionEnabled() {
                    return ((EventCollectionConfig) this.instance).getMrefCollectionEnabled();
                }

                public Builder setAppBackgroundTrackingUrl(String str) {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).setAppBackgroundTrackingUrl(str);
                    return this;
                }

                public Builder setAppBackgroundTrackingUrlBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).setAppBackgroundTrackingUrlBytes(lVar);
                    return this;
                }

                public Builder setAppForegroundTrackingUrl(String str) {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).setAppForegroundTrackingUrl(str);
                    return this;
                }

                public Builder setAppForegroundTrackingUrlBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).setAppForegroundTrackingUrlBytes(lVar);
                    return this;
                }

                public Builder setEventCollectionEnabled(boolean z11) {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).setEventCollectionEnabled(z11);
                    return this;
                }

                public Builder setMrefCollectionEnabled(boolean z11) {
                    copyOnWrite();
                    ((EventCollectionConfig) this.instance).setMrefCollectionEnabled(z11);
                    return this;
                }

                private Builder() {
                    super(EventCollectionConfig.DEFAULT_INSTANCE);
                }
            }

            static {
                EventCollectionConfig eventCollectionConfig = new EventCollectionConfig();
                DEFAULT_INSTANCE = eventCollectionConfig;
                n0.registerDefaultInstance(EventCollectionConfig.class, eventCollectionConfig);
            }

            private EventCollectionConfig() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearAppBackgroundTrackingUrl() {
                this.appBackgroundTrackingUrl_ = getDefaultInstance().getAppBackgroundTrackingUrl();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearAppForegroundTrackingUrl() {
                this.appForegroundTrackingUrl_ = getDefaultInstance().getAppForegroundTrackingUrl();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearEventCollectionEnabled() {
                this.eventCollectionEnabled_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMrefCollectionEnabled() {
                this.mrefCollectionEnabled_ = false;
            }

            public static EventCollectionConfig getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static EventCollectionConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (EventCollectionConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static EventCollectionConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAppBackgroundTrackingUrl(String str) {
                str.getClass();
                this.appBackgroundTrackingUrl_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAppBackgroundTrackingUrlBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.appBackgroundTrackingUrl_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAppForegroundTrackingUrl(String str) {
                str.getClass();
                this.appForegroundTrackingUrl_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAppForegroundTrackingUrlBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.appForegroundTrackingUrl_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setEventCollectionEnabled(boolean z11) {
                this.eventCollectionEnabled_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMrefCollectionEnabled(boolean z11) {
                this.mrefCollectionEnabled_ = z11;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u0007\u0002\u0007\u0003Ȉ\u0004Ȉ", new Object[]{"eventCollectionEnabled_", "mrefCollectionEnabled_", "appBackgroundTrackingUrl_", "appForegroundTrackingUrl_"});
                    case 3:
                        return new EventCollectionConfig();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (EventCollectionConfig.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
            public String getAppBackgroundTrackingUrl() {
                return this.appBackgroundTrackingUrl_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
            public l getAppBackgroundTrackingUrlBytes() {
                return l.f(this.appBackgroundTrackingUrl_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
            public String getAppForegroundTrackingUrl() {
                return this.appForegroundTrackingUrl_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
            public l getAppForegroundTrackingUrlBytes() {
                return l.f(this.appForegroundTrackingUrl_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
            public boolean getEventCollectionEnabled() {
                return this.eventCollectionEnabled_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.EventCollectionConfigOrBuilder
            public boolean getMrefCollectionEnabled() {
                return this.mrefCollectionEnabled_;
            }

            public static Builder newBuilder(EventCollectionConfig eventCollectionConfig) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(eventCollectionConfig);
            }

            public static EventCollectionConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (EventCollectionConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static EventCollectionConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static EventCollectionConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static EventCollectionConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static EventCollectionConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static EventCollectionConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static EventCollectionConfig parseFrom(InputStream inputStream) throws IOException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static EventCollectionConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static EventCollectionConfig parseFrom(p pVar) throws IOException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static EventCollectionConfig parseFrom(p pVar, y yVar) throws IOException {
                return (EventCollectionConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface EventCollectionConfigOrBuilder extends p1 {
            String getAppBackgroundTrackingUrl();

            l getAppBackgroundTrackingUrlBytes();

            String getAppForegroundTrackingUrl();

            l getAppForegroundTrackingUrlBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getEventCollectionEnabled();

            boolean getMrefCollectionEnabled();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class ExperimentalFeatureFlag extends n0 implements ExperimentalFeatureFlagOrBuilder {
            private static final ExperimentalFeatureFlag DEFAULT_INSTANCE;
            public static final int NAME_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int VALUE_FIELD_NUMBER = 2;
            private String name_ = b.f42142b;
            private String value_ = b.f42142b;

            public static final class Builder extends f0 implements ExperimentalFeatureFlagOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearName() {
                    copyOnWrite();
                    ((ExperimentalFeatureFlag) this.instance).clearName();
                    return this;
                }

                public Builder clearValue() {
                    copyOnWrite();
                    ((ExperimentalFeatureFlag) this.instance).clearValue();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
                public String getName() {
                    return ((ExperimentalFeatureFlag) this.instance).getName();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
                public l getNameBytes() {
                    return ((ExperimentalFeatureFlag) this.instance).getNameBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
                public String getValue() {
                    return ((ExperimentalFeatureFlag) this.instance).getValue();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
                public l getValueBytes() {
                    return ((ExperimentalFeatureFlag) this.instance).getValueBytes();
                }

                public Builder setName(String str) {
                    copyOnWrite();
                    ((ExperimentalFeatureFlag) this.instance).setName(str);
                    return this;
                }

                public Builder setNameBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((ExperimentalFeatureFlag) this.instance).setNameBytes(lVar);
                    return this;
                }

                public Builder setValue(String str) {
                    copyOnWrite();
                    ((ExperimentalFeatureFlag) this.instance).setValue(str);
                    return this;
                }

                public Builder setValueBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((ExperimentalFeatureFlag) this.instance).setValueBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(ExperimentalFeatureFlag.DEFAULT_INSTANCE);
                }
            }

            static {
                ExperimentalFeatureFlag experimentalFeatureFlag = new ExperimentalFeatureFlag();
                DEFAULT_INSTANCE = experimentalFeatureFlag;
                n0.registerDefaultInstance(ExperimentalFeatureFlag.class, experimentalFeatureFlag);
            }

            private ExperimentalFeatureFlag() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearName() {
                this.name_ = getDefaultInstance().getName();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearValue() {
                this.value_ = getDefaultInstance().getValue();
            }

            public static ExperimentalFeatureFlag getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ExperimentalFeatureFlag parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ExperimentalFeatureFlag) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ExperimentalFeatureFlag parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setName(String str) {
                str.getClass();
                this.name_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setNameBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.name_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setValue(String str) {
                str.getClass();
                this.value_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setValueBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.value_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ", new Object[]{"name_", "value_"});
                    case 3:
                        return new ExperimentalFeatureFlag();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ExperimentalFeatureFlag.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
            public String getName() {
                return this.name_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
            public l getNameBytes() {
                return l.f(this.name_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
            public String getValue() {
                return this.value_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ExperimentalFeatureFlagOrBuilder
            public l getValueBytes() {
                return l.f(this.value_);
            }

            public static Builder newBuilder(ExperimentalFeatureFlag experimentalFeatureFlag) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(experimentalFeatureFlag);
            }

            public static ExperimentalFeatureFlag parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ExperimentalFeatureFlag) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ExperimentalFeatureFlag parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ExperimentalFeatureFlag parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static ExperimentalFeatureFlag parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ExperimentalFeatureFlag parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ExperimentalFeatureFlag parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ExperimentalFeatureFlag parseFrom(InputStream inputStream) throws IOException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ExperimentalFeatureFlag parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ExperimentalFeatureFlag parseFrom(p pVar) throws IOException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ExperimentalFeatureFlag parseFrom(p pVar, y yVar) throws IOException {
                return (ExperimentalFeatureFlag) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface ExperimentalFeatureFlagOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getName();

            l getNameBytes();

            String getValue();

            l getValueBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Geo extends n0 implements GeoOrBuilder {
            public static final int CITY_FIELD_NUMBER = 6;
            public static final int COUNTRY_ISO2_CODE_FIELD_NUMBER = 2;
            public static final int COUNTRY_ISO3_CODE_FIELD_NUMBER = 1;
            private static final Geo DEFAULT_INSTANCE;
            public static final int LATITUDE_FIELD_NUMBER = 3;
            public static final int LONGITUDE_FIELD_NUMBER = 4;
            private static volatile v1 PARSER = null;
            public static final int REGION_FIELD_NUMBER = 7;
            public static final int ZIP_CODE_FIELD_NUMBER = 5;
            private float latitude_;
            private float longitude_;
            private String countryIso3Code_ = b.f42142b;
            private String countryIso2Code_ = b.f42142b;
            private String zipCode_ = b.f42142b;
            private String city_ = b.f42142b;
            private String region_ = b.f42142b;

            public static final class Builder extends f0 implements GeoOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearCity() {
                    copyOnWrite();
                    ((Geo) this.instance).clearCity();
                    return this;
                }

                public Builder clearCountryIso2Code() {
                    copyOnWrite();
                    ((Geo) this.instance).clearCountryIso2Code();
                    return this;
                }

                public Builder clearCountryIso3Code() {
                    copyOnWrite();
                    ((Geo) this.instance).clearCountryIso3Code();
                    return this;
                }

                public Builder clearLatitude() {
                    copyOnWrite();
                    ((Geo) this.instance).clearLatitude();
                    return this;
                }

                public Builder clearLongitude() {
                    copyOnWrite();
                    ((Geo) this.instance).clearLongitude();
                    return this;
                }

                public Builder clearRegion() {
                    copyOnWrite();
                    ((Geo) this.instance).clearRegion();
                    return this;
                }

                public Builder clearZipCode() {
                    copyOnWrite();
                    ((Geo) this.instance).clearZipCode();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public String getCity() {
                    return ((Geo) this.instance).getCity();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public l getCityBytes() {
                    return ((Geo) this.instance).getCityBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public String getCountryIso2Code() {
                    return ((Geo) this.instance).getCountryIso2Code();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public l getCountryIso2CodeBytes() {
                    return ((Geo) this.instance).getCountryIso2CodeBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public String getCountryIso3Code() {
                    return ((Geo) this.instance).getCountryIso3Code();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public l getCountryIso3CodeBytes() {
                    return ((Geo) this.instance).getCountryIso3CodeBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public float getLatitude() {
                    return ((Geo) this.instance).getLatitude();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public float getLongitude() {
                    return ((Geo) this.instance).getLongitude();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public String getRegion() {
                    return ((Geo) this.instance).getRegion();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public l getRegionBytes() {
                    return ((Geo) this.instance).getRegionBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public String getZipCode() {
                    return ((Geo) this.instance).getZipCode();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
                public l getZipCodeBytes() {
                    return ((Geo) this.instance).getZipCodeBytes();
                }

                public Builder setCity(String str) {
                    copyOnWrite();
                    ((Geo) this.instance).setCity(str);
                    return this;
                }

                public Builder setCityBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Geo) this.instance).setCityBytes(lVar);
                    return this;
                }

                public Builder setCountryIso2Code(String str) {
                    copyOnWrite();
                    ((Geo) this.instance).setCountryIso2Code(str);
                    return this;
                }

                public Builder setCountryIso2CodeBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Geo) this.instance).setCountryIso2CodeBytes(lVar);
                    return this;
                }

                public Builder setCountryIso3Code(String str) {
                    copyOnWrite();
                    ((Geo) this.instance).setCountryIso3Code(str);
                    return this;
                }

                public Builder setCountryIso3CodeBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Geo) this.instance).setCountryIso3CodeBytes(lVar);
                    return this;
                }

                public Builder setLatitude(float f11) {
                    copyOnWrite();
                    ((Geo) this.instance).setLatitude(f11);
                    return this;
                }

                public Builder setLongitude(float f11) {
                    copyOnWrite();
                    ((Geo) this.instance).setLongitude(f11);
                    return this;
                }

                public Builder setRegion(String str) {
                    copyOnWrite();
                    ((Geo) this.instance).setRegion(str);
                    return this;
                }

                public Builder setRegionBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Geo) this.instance).setRegionBytes(lVar);
                    return this;
                }

                public Builder setZipCode(String str) {
                    copyOnWrite();
                    ((Geo) this.instance).setZipCode(str);
                    return this;
                }

                public Builder setZipCodeBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Geo) this.instance).setZipCodeBytes(lVar);
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
            public void clearCity() {
                this.city_ = getDefaultInstance().getCity();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCountryIso2Code() {
                this.countryIso2Code_ = getDefaultInstance().getCountryIso2Code();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCountryIso3Code() {
                this.countryIso3Code_ = getDefaultInstance().getCountryIso3Code();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLatitude() {
                this.latitude_ = 0.0f;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearLongitude() {
                this.longitude_ = 0.0f;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearRegion() {
                this.region_ = getDefaultInstance().getRegion();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearZipCode() {
                this.zipCode_ = getDefaultInstance().getZipCode();
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
            public void setCity(String str) {
                str.getClass();
                this.city_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCityBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.city_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCountryIso2Code(String str) {
                str.getClass();
                this.countryIso2Code_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCountryIso2CodeBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.countryIso2Code_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCountryIso3Code(String str) {
                str.getClass();
                this.countryIso3Code_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCountryIso3CodeBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.countryIso3Code_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLatitude(float f11) {
                this.latitude_ = f11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setLongitude(float f11) {
                this.longitude_ = f11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setRegion(String str) {
                str.getClass();
                this.region_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setRegionBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.region_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setZipCode(String str) {
                str.getClass();
                this.zipCode_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setZipCodeBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.zipCode_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003\u0001\u0004\u0001\u0005Ȉ\u0006Ȉ\u0007Ȉ", new Object[]{"countryIso3Code_", "countryIso2Code_", "latitude_", "longitude_", "zipCode_", "city_", "region_"});
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public String getCity() {
                return this.city_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public l getCityBytes() {
                return l.f(this.city_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public String getCountryIso2Code() {
                return this.countryIso2Code_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public l getCountryIso2CodeBytes() {
                return l.f(this.countryIso2Code_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public String getCountryIso3Code() {
                return this.countryIso3Code_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public l getCountryIso3CodeBytes() {
                return l.f(this.countryIso3Code_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public float getLatitude() {
                return this.latitude_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public float getLongitude() {
                return this.longitude_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public String getRegion() {
                return this.region_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public l getRegionBytes() {
                return l.f(this.region_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public String getZipCode() {
                return this.zipCode_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.GeoOrBuilder
            public l getZipCodeBytes() {
                return l.f(this.zipCode_);
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
            String getCity();

            l getCityBytes();

            String getCountryIso2Code();

            l getCountryIso2CodeBytes();

            String getCountryIso3Code();

            l getCountryIso3CodeBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            float getLatitude();

            float getLongitude();

            String getRegion();

            l getRegionBytes();

            String getZipCode();

            l getZipCodeBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class ILRDConfig extends n0 implements ILRDConfigOrBuilder {
            private static final ILRDConfig DEFAULT_INSTANCE;
            public static final int ENABLED_FIELD_NUMBER = 1;
            public static final int MAX_BATCH_SIZE_FIELD_NUMBER = 5;
            public static final int MAX_SESSION_LEN_FIELD_NUMBER = 6;
            private static volatile v1 PARSER = null;
            public static final int RAW_IMP_URL_FIELD_NUMBER = 2;
            public static final int RETRY_COUNT_FIELD_NUMBER = 4;
            public static final int SESSION_EXP_FIELD_NUMBER = 3;
            public static final int SUPPORTED_NETWORKS_FIELD_NUMBER = 8;
            public static final int UPLOAD_INTERVAL_FIELD_NUMBER = 7;
            private static final w0 supportedNetworks_converter_ = new w0() { // from class: com.moloco.sdk.Init.SDKInitResponse.ILRDConfig.1
                @Override // com.google.protobuf.w0
                public SupportedNetworks convert(Integer num) {
                    SupportedNetworks supportedNetworksForNumber = SupportedNetworks.forNumber(num.intValue());
                    return supportedNetworksForNumber == null ? SupportedNetworks.UNRECOGNIZED : supportedNetworksForNumber;
                }
            };
            private boolean enabled_;
            private int maxBatchSize_;
            private int maxSessionLen_;
            private int retryCount_;
            private int sessionExp_;
            private int supportedNetworksMemoizedSerializedSize;
            private int uploadInterval_;
            private String rawImpUrl_ = b.f42142b;
            private v0 supportedNetworks_ = n0.emptyIntList();

            public static final class Builder extends f0 implements ILRDConfigOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder addAllSupportedNetworks(Iterable<? extends SupportedNetworks> iterable) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).addAllSupportedNetworks(iterable);
                    return this;
                }

                public Builder addAllSupportedNetworksValue(Iterable<Integer> iterable) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).addAllSupportedNetworksValue(iterable);
                    return this;
                }

                public Builder addSupportedNetworks(SupportedNetworks supportedNetworks) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).addSupportedNetworks(supportedNetworks);
                    return this;
                }

                public Builder addSupportedNetworksValue(int i5) {
                    ((ILRDConfig) this.instance).addSupportedNetworksValue(i5);
                    return this;
                }

                public Builder clearEnabled() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearEnabled();
                    return this;
                }

                public Builder clearMaxBatchSize() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearMaxBatchSize();
                    return this;
                }

                public Builder clearMaxSessionLen() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearMaxSessionLen();
                    return this;
                }

                public Builder clearRawImpUrl() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearRawImpUrl();
                    return this;
                }

                public Builder clearRetryCount() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearRetryCount();
                    return this;
                }

                public Builder clearSessionExp() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearSessionExp();
                    return this;
                }

                public Builder clearSupportedNetworks() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearSupportedNetworks();
                    return this;
                }

                public Builder clearUploadInterval() {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).clearUploadInterval();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public boolean getEnabled() {
                    return ((ILRDConfig) this.instance).getEnabled();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public int getMaxBatchSize() {
                    return ((ILRDConfig) this.instance).getMaxBatchSize();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public int getMaxSessionLen() {
                    return ((ILRDConfig) this.instance).getMaxSessionLen();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public String getRawImpUrl() {
                    return ((ILRDConfig) this.instance).getRawImpUrl();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public l getRawImpUrlBytes() {
                    return ((ILRDConfig) this.instance).getRawImpUrlBytes();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public int getRetryCount() {
                    return ((ILRDConfig) this.instance).getRetryCount();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public int getSessionExp() {
                    return ((ILRDConfig) this.instance).getSessionExp();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public SupportedNetworks getSupportedNetworks(int i5) {
                    return ((ILRDConfig) this.instance).getSupportedNetworks(i5);
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public int getSupportedNetworksCount() {
                    return ((ILRDConfig) this.instance).getSupportedNetworksCount();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public List<SupportedNetworks> getSupportedNetworksList() {
                    return ((ILRDConfig) this.instance).getSupportedNetworksList();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public int getSupportedNetworksValue(int i5) {
                    return ((ILRDConfig) this.instance).getSupportedNetworksValue(i5);
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public List<Integer> getSupportedNetworksValueList() {
                    return Collections.unmodifiableList(((ILRDConfig) this.instance).getSupportedNetworksValueList());
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
                public int getUploadInterval() {
                    return ((ILRDConfig) this.instance).getUploadInterval();
                }

                public Builder setEnabled(boolean z11) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setEnabled(z11);
                    return this;
                }

                public Builder setMaxBatchSize(int i5) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setMaxBatchSize(i5);
                    return this;
                }

                public Builder setMaxSessionLen(int i5) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setMaxSessionLen(i5);
                    return this;
                }

                public Builder setRawImpUrl(String str) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setRawImpUrl(str);
                    return this;
                }

                public Builder setRawImpUrlBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setRawImpUrlBytes(lVar);
                    return this;
                }

                public Builder setRetryCount(int i5) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setRetryCount(i5);
                    return this;
                }

                public Builder setSessionExp(int i5) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setSessionExp(i5);
                    return this;
                }

                public Builder setSupportedNetworks(int i5, SupportedNetworks supportedNetworks) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setSupportedNetworks(i5, supportedNetworks);
                    return this;
                }

                public Builder setSupportedNetworksValue(int i5, int i11) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setSupportedNetworksValue(i5, i11);
                    return this;
                }

                public Builder setUploadInterval(int i5) {
                    copyOnWrite();
                    ((ILRDConfig) this.instance).setUploadInterval(i5);
                    return this;
                }

                private Builder() {
                    super(ILRDConfig.DEFAULT_INSTANCE);
                }
            }

            static {
                ILRDConfig iLRDConfig = new ILRDConfig();
                DEFAULT_INSTANCE = iLRDConfig;
                n0.registerDefaultInstance(ILRDConfig.class, iLRDConfig);
            }

            private ILRDConfig() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addAllSupportedNetworks(Iterable<? extends SupportedNetworks> iterable) {
                ensureSupportedNetworksIsMutable();
                for (SupportedNetworks supportedNetworks : iterable) {
                    ((o0) this.supportedNetworks_).d(supportedNetworks.getNumber());
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addAllSupportedNetworksValue(Iterable<Integer> iterable) {
                ensureSupportedNetworksIsMutable();
                Iterator<Integer> it = iterable.iterator();
                while (it.hasNext()) {
                    ((o0) this.supportedNetworks_).d(it.next().intValue());
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addSupportedNetworks(SupportedNetworks supportedNetworks) {
                supportedNetworks.getClass();
                ensureSupportedNetworksIsMutable();
                ((o0) this.supportedNetworks_).d(supportedNetworks.getNumber());
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addSupportedNetworksValue(int i5) {
                ensureSupportedNetworksIsMutable();
                ((o0) this.supportedNetworks_).d(i5);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearEnabled() {
                this.enabled_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMaxBatchSize() {
                this.maxBatchSize_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMaxSessionLen() {
                this.maxSessionLen_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearRawImpUrl() {
                this.rawImpUrl_ = getDefaultInstance().getRawImpUrl();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearRetryCount() {
                this.retryCount_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearSessionExp() {
                this.sessionExp_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearSupportedNetworks() {
                this.supportedNetworks_ = n0.emptyIntList();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearUploadInterval() {
                this.uploadInterval_ = 0;
            }

            /* JADX WARN: Multi-variable type inference failed */
            private void ensureSupportedNetworksIsMutable() {
                v0 v0Var = this.supportedNetworks_;
                if (((d) v0Var).f34834a) {
                    return;
                }
                this.supportedNetworks_ = n0.mutableCopy(v0Var);
            }

            public static ILRDConfig getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ILRDConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ILRDConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ILRDConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setEnabled(boolean z11) {
                this.enabled_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMaxBatchSize(int i5) {
                this.maxBatchSize_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMaxSessionLen(int i5) {
                this.maxSessionLen_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setRawImpUrl(String str) {
                str.getClass();
                this.rawImpUrl_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setRawImpUrlBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.rawImpUrl_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setRetryCount(int i5) {
                this.retryCount_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setSessionExp(int i5) {
                this.sessionExp_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setSupportedNetworks(int i5, SupportedNetworks supportedNetworks) {
                supportedNetworks.getClass();
                ensureSupportedNetworksIsMutable();
                ((o0) this.supportedNetworks_).g(i5, supportedNetworks.getNumber());
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setSupportedNetworksValue(int i5, int i11) {
                ensureSupportedNetworksIsMutable();
                ((o0) this.supportedNetworks_).g(i5, i11);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUploadInterval(int i5) {
                this.uploadInterval_ = i5;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\b\u0000\u0000\u0001\b\b\u0000\u0001\u0000\u0001\u0007\u0002Ȉ\u0003\u0004\u0004\u0004\u0005\u0004\u0006\u0004\u0007\u0004\b,", new Object[]{"enabled_", "rawImpUrl_", "sessionExp_", "retryCount_", "maxBatchSize_", "maxSessionLen_", "uploadInterval_", "supportedNetworks_"});
                    case 3:
                        return new ILRDConfig();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ILRDConfig.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public boolean getEnabled() {
                return this.enabled_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public int getMaxBatchSize() {
                return this.maxBatchSize_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public int getMaxSessionLen() {
                return this.maxSessionLen_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public String getRawImpUrl() {
                return this.rawImpUrl_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public l getRawImpUrlBytes() {
                return l.f(this.rawImpUrl_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public int getRetryCount() {
                return this.retryCount_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public int getSessionExp() {
                return this.sessionExp_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public SupportedNetworks getSupportedNetworks(int i5) {
                SupportedNetworks supportedNetworksForNumber = SupportedNetworks.forNumber(((o0) this.supportedNetworks_).f(i5));
                return supportedNetworksForNumber == null ? SupportedNetworks.UNRECOGNIZED : supportedNetworksForNumber;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public int getSupportedNetworksCount() {
                return this.supportedNetworks_.size();
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public List<SupportedNetworks> getSupportedNetworksList() {
                return new x0(this.supportedNetworks_, supportedNetworks_converter_);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public int getSupportedNetworksValue(int i5) {
                return ((o0) this.supportedNetworks_).f(i5);
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public List<Integer> getSupportedNetworksValueList() {
                return this.supportedNetworks_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.ILRDConfigOrBuilder
            public int getUploadInterval() {
                return this.uploadInterval_;
            }

            public static Builder newBuilder(ILRDConfig iLRDConfig) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(iLRDConfig);
            }

            public static ILRDConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ILRDConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ILRDConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ILRDConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static ILRDConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ILRDConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ILRDConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ILRDConfig parseFrom(InputStream inputStream) throws IOException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ILRDConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ILRDConfig parseFrom(p pVar) throws IOException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ILRDConfig parseFrom(p pVar, y yVar) throws IOException {
                return (ILRDConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface ILRDConfigOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getEnabled();

            int getMaxBatchSize();

            int getMaxSessionLen();

            String getRawImpUrl();

            l getRawImpUrlBytes();

            int getRetryCount();

            int getSessionExp();

            SupportedNetworks getSupportedNetworks(int i5);

            int getSupportedNetworksCount();

            List<SupportedNetworks> getSupportedNetworksList();

            int getSupportedNetworksValue(int i5);

            List<Integer> getSupportedNetworksValueList();

            int getUploadInterval();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class OperationalMetricsConfig extends n0 implements OperationalMetricsConfigOrBuilder {
            private static final OperationalMetricsConfig DEFAULT_INSTANCE;
            public static final int ENABLED_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int POLLING_INTERVAL_SECONDS_FIELD_NUMBER = 3;
            public static final int URL_FIELD_NUMBER = 2;
            private boolean enabled_;
            private int pollingIntervalSeconds_;
            private String url_ = b.f42142b;

            public static final class Builder extends f0 implements OperationalMetricsConfigOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearEnabled() {
                    copyOnWrite();
                    ((OperationalMetricsConfig) this.instance).clearEnabled();
                    return this;
                }

                public Builder clearPollingIntervalSeconds() {
                    copyOnWrite();
                    ((OperationalMetricsConfig) this.instance).clearPollingIntervalSeconds();
                    return this;
                }

                public Builder clearUrl() {
                    copyOnWrite();
                    ((OperationalMetricsConfig) this.instance).clearUrl();
                    return this;
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
                public boolean getEnabled() {
                    return ((OperationalMetricsConfig) this.instance).getEnabled();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
                public int getPollingIntervalSeconds() {
                    return ((OperationalMetricsConfig) this.instance).getPollingIntervalSeconds();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
                public String getUrl() {
                    return ((OperationalMetricsConfig) this.instance).getUrl();
                }

                @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
                public l getUrlBytes() {
                    return ((OperationalMetricsConfig) this.instance).getUrlBytes();
                }

                public Builder setEnabled(boolean z11) {
                    copyOnWrite();
                    ((OperationalMetricsConfig) this.instance).setEnabled(z11);
                    return this;
                }

                public Builder setPollingIntervalSeconds(int i5) {
                    copyOnWrite();
                    ((OperationalMetricsConfig) this.instance).setPollingIntervalSeconds(i5);
                    return this;
                }

                public Builder setUrl(String str) {
                    copyOnWrite();
                    ((OperationalMetricsConfig) this.instance).setUrl(str);
                    return this;
                }

                public Builder setUrlBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((OperationalMetricsConfig) this.instance).setUrlBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(OperationalMetricsConfig.DEFAULT_INSTANCE);
                }
            }

            static {
                OperationalMetricsConfig operationalMetricsConfig = new OperationalMetricsConfig();
                DEFAULT_INSTANCE = operationalMetricsConfig;
                n0.registerDefaultInstance(OperationalMetricsConfig.class, operationalMetricsConfig);
            }

            private OperationalMetricsConfig() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearEnabled() {
                this.enabled_ = false;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearPollingIntervalSeconds() {
                this.pollingIntervalSeconds_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearUrl() {
                this.url_ = getDefaultInstance().getUrl();
            }

            public static OperationalMetricsConfig getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static OperationalMetricsConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (OperationalMetricsConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static OperationalMetricsConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setEnabled(boolean z11) {
                this.enabled_ = z11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setPollingIntervalSeconds(int i5) {
                this.pollingIntervalSeconds_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUrl(String str) {
                str.getClass();
                this.url_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setUrlBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.url_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u0007\u0002Ȉ\u0003\u0004", new Object[]{"enabled_", "url_", "pollingIntervalSeconds_"});
                    case 3:
                        return new OperationalMetricsConfig();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (OperationalMetricsConfig.class) {
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

            @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
            public boolean getEnabled() {
                return this.enabled_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
            public int getPollingIntervalSeconds() {
                return this.pollingIntervalSeconds_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
            public String getUrl() {
                return this.url_;
            }

            @Override // com.moloco.sdk.Init.SDKInitResponse.OperationalMetricsConfigOrBuilder
            public l getUrlBytes() {
                return l.f(this.url_);
            }

            public static Builder newBuilder(OperationalMetricsConfig operationalMetricsConfig) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(operationalMetricsConfig);
            }

            public static OperationalMetricsConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (OperationalMetricsConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static OperationalMetricsConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static OperationalMetricsConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static OperationalMetricsConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static OperationalMetricsConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static OperationalMetricsConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static OperationalMetricsConfig parseFrom(InputStream inputStream) throws IOException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static OperationalMetricsConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static OperationalMetricsConfig parseFrom(p pVar) throws IOException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static OperationalMetricsConfig parseFrom(p pVar, y yVar) throws IOException {
                return (OperationalMetricsConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface OperationalMetricsConfigOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean getEnabled();

            int getPollingIntervalSeconds();

            String getUrl();

            l getUrlBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        /* loaded from: classes3.dex */
        public enum Region implements r0 {
            UNKNOWN_REGION(0),
            US(1),
            ASIA(2),
            EU(3),
            LOCAL(4),
            UNIT(5),
            INDIA(6),
            UNRECOGNIZED(-1);

            public static final int ASIA_VALUE = 2;
            public static final int EU_VALUE = 3;
            public static final int INDIA_VALUE = 6;
            public static final int LOCAL_VALUE = 4;
            public static final int UNIT_VALUE = 5;
            public static final int UNKNOWN_REGION_VALUE = 0;
            public static final int US_VALUE = 1;
            private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.Init.SDKInitResponse.Region.1
                @Override // com.google.protobuf.s0
                public Region findValueByNumber(int i5) {
                    return Region.forNumber(i5);
                }
            };
            private final int value;

            public static final class RegionVerifier implements t0 {
                static final t0 INSTANCE = new RegionVerifier();

                private RegionVerifier() {
                }

                @Override // com.google.protobuf.t0
                public boolean isInRange(int i5) {
                    return Region.forNumber(i5) != null;
                }
            }

            Region(int i5) {
                this.value = i5;
            }

            public static Region forNumber(int i5) {
                switch (i5) {
                    case 0:
                        return UNKNOWN_REGION;
                    case 1:
                        return US;
                    case 2:
                        return ASIA;
                    case 3:
                        return EU;
                    case 4:
                        return LOCAL;
                    case 5:
                        return UNIT;
                    case 6:
                        return INDIA;
                    default:
                        return null;
                }
            }

            public static s0 internalGetValueMap() {
                return internalValueMap;
            }

            public static t0 internalGetVerifier() {
                return RegionVerifier.INSTANCE;
            }

            @Override // com.google.protobuf.r0
            public final int getNumber() {
                if (this != UNRECOGNIZED) {
                    return this.value;
                }
                throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
            }

            @Deprecated
            public static Region valueOf(int i5) {
                return forNumber(i5);
            }
        }

        public enum SupportedNetworks implements r0 {
            UNKNOWN(0),
            MAX(1),
            LEVEL_PLAY(2),
            UNRECOGNIZED(-1);

            public static final int LEVEL_PLAY_VALUE = 2;
            public static final int MAX_VALUE = 1;
            public static final int UNKNOWN_VALUE = 0;
            private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.Init.SDKInitResponse.SupportedNetworks.1
                @Override // com.google.protobuf.s0
                public SupportedNetworks findValueByNumber(int i5) {
                    return SupportedNetworks.forNumber(i5);
                }
            };
            private final int value;

            /* loaded from: classes3.dex */
            public static final class SupportedNetworksVerifier implements t0 {
                static final t0 INSTANCE = new SupportedNetworksVerifier();

                private SupportedNetworksVerifier() {
                }

                @Override // com.google.protobuf.t0
                public boolean isInRange(int i5) {
                    return SupportedNetworks.forNumber(i5) != null;
                }
            }

            SupportedNetworks(int i5) {
                this.value = i5;
            }

            public static SupportedNetworks forNumber(int i5) {
                if (i5 == 0) {
                    return UNKNOWN;
                }
                if (i5 == 1) {
                    return MAX;
                }
                if (i5 != 2) {
                    return null;
                }
                return LEVEL_PLAY;
            }

            public static s0 internalGetValueMap() {
                return internalValueMap;
            }

            public static t0 internalGetVerifier() {
                return SupportedNetworksVerifier.INSTANCE;
            }

            @Override // com.google.protobuf.r0
            public final int getNumber() {
                if (this != UNRECOGNIZED) {
                    return this.value;
                }
                throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
            }

            @Deprecated
            public static SupportedNetworks valueOf(int i5) {
                return forNumber(i5);
            }
        }

        static {
            SDKInitResponse sDKInitResponse = new SDKInitResponse();
            DEFAULT_INSTANCE = sDKInitResponse;
            n0.registerDefaultInstance(SDKInitResponse.class, sDKInitResponse);
        }

        private SDKInitResponse() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addAdUnits(AdUnit adUnit) {
            adUnit.getClass();
            ensureAdUnitsIsMutable();
            this.adUnits_.add(adUnit);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addAllAdUnits(Iterable<? extends AdUnit> iterable) {
            ensureAdUnitsIsMutable();
            c.addAll(iterable, this.adUnits_);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addAllExperimentalFeatureFlags(Iterable<? extends ExperimentalFeatureFlag> iterable) {
            ensureExperimentalFeatureFlagsIsMutable();
            c.addAll(iterable, this.experimentalFeatureFlags_);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addExperimentalFeatureFlags(ExperimentalFeatureFlag experimentalFeatureFlag) {
            experimentalFeatureFlag.getClass();
            ensureExperimentalFeatureFlagsIsMutable();
            this.experimentalFeatureFlags_.add(experimentalFeatureFlag);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAdServerUrl() {
            this.adServerUrl_ = getDefaultInstance().getAdServerUrl();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAdUnits() {
            this.adUnits_ = n0.emptyProtobufList();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAppId() {
            this.appId_ = getDefaultInstance().getAppId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearBidTokenConfig() {
            this.bidTokenConfig_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearConfigs() {
            this.configs_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCountryIso2Code() {
            this.countryIso2Code_ = getDefaultInstance().getCountryIso2Code();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCountryIso3Code() {
            this.countryIso3Code_ = getDefaultInstance().getCountryIso3Code();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCrashReportingConfig() {
            this.crashReportingConfig_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearDirectAdsConfig() {
            this.directAdsConfig_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearEventCollectionConfig() {
            this.eventCollectionConfig_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearExperimentalFeatureFlags() {
            this.experimentalFeatureFlags_ = n0.emptyProtobufList();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearGeo() {
            this.geo_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearIlrdConfig() {
            this.ilrdConfig_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearOperationalMetricsConfig() {
            this.operationalMetricsConfig_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPlatformId() {
            this.platformId_ = getDefaultInstance().getPlatformId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPublisherId() {
            this.publisherId_ = getDefaultInstance().getPublisherId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearResolvedRegion() {
            this.resolvedRegion_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearVerifyBannerVisible() {
            this.verifyBannerVisible_ = false;
        }

        private void ensureAdUnitsIsMutable() {
            z0 z0Var = this.adUnits_;
            if (((d) z0Var).f34834a) {
                return;
            }
            this.adUnits_ = n0.mutableCopy(z0Var);
        }

        private void ensureExperimentalFeatureFlagsIsMutable() {
            z0 z0Var = this.experimentalFeatureFlags_;
            if (((d) z0Var).f34834a) {
                return;
            }
            this.experimentalFeatureFlags_ = n0.mutableCopy(z0Var);
        }

        public static SDKInitResponse getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeBidTokenConfig(BidTokenConfig bidTokenConfig) {
            bidTokenConfig.getClass();
            BidTokenConfig bidTokenConfig2 = this.bidTokenConfig_;
            if (bidTokenConfig2 == null || bidTokenConfig2 == BidTokenConfig.getDefaultInstance()) {
                this.bidTokenConfig_ = bidTokenConfig;
            } else {
                this.bidTokenConfig_ = (BidTokenConfig) ((BidTokenConfig.Builder) BidTokenConfig.newBuilder(this.bidTokenConfig_).mergeFrom((n0) bidTokenConfig)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeConfigs(ConfigsOuterClass.Configs configs) {
            configs.getClass();
            ConfigsOuterClass.Configs configs2 = this.configs_;
            if (configs2 == null || configs2 == ConfigsOuterClass.Configs.getDefaultInstance()) {
                this.configs_ = configs;
            } else {
                this.configs_ = (ConfigsOuterClass.Configs) ((ConfigsOuterClass.Configs.Builder) ConfigsOuterClass.Configs.newBuilder(this.configs_).mergeFrom((n0) configs)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeCrashReportingConfig(CrashReportingConfig crashReportingConfig) {
            crashReportingConfig.getClass();
            CrashReportingConfig crashReportingConfig2 = this.crashReportingConfig_;
            if (crashReportingConfig2 == null || crashReportingConfig2 == CrashReportingConfig.getDefaultInstance()) {
                this.crashReportingConfig_ = crashReportingConfig;
            } else {
                this.crashReportingConfig_ = (CrashReportingConfig) ((CrashReportingConfig.Builder) CrashReportingConfig.newBuilder(this.crashReportingConfig_).mergeFrom((n0) crashReportingConfig)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeDirectAdsConfig(DirectAdsConfig directAdsConfig) {
            directAdsConfig.getClass();
            DirectAdsConfig directAdsConfig2 = this.directAdsConfig_;
            if (directAdsConfig2 == null || directAdsConfig2 == DirectAdsConfig.getDefaultInstance()) {
                this.directAdsConfig_ = directAdsConfig;
            } else {
                this.directAdsConfig_ = (DirectAdsConfig) ((DirectAdsConfig.Builder) DirectAdsConfig.newBuilder(this.directAdsConfig_).mergeFrom((n0) directAdsConfig)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeEventCollectionConfig(EventCollectionConfig eventCollectionConfig) {
            eventCollectionConfig.getClass();
            EventCollectionConfig eventCollectionConfig2 = this.eventCollectionConfig_;
            if (eventCollectionConfig2 == null || eventCollectionConfig2 == EventCollectionConfig.getDefaultInstance()) {
                this.eventCollectionConfig_ = eventCollectionConfig;
            } else {
                this.eventCollectionConfig_ = (EventCollectionConfig) ((EventCollectionConfig.Builder) EventCollectionConfig.newBuilder(this.eventCollectionConfig_).mergeFrom((n0) eventCollectionConfig)).buildPartial();
            }
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
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeIlrdConfig(ILRDConfig iLRDConfig) {
            iLRDConfig.getClass();
            ILRDConfig iLRDConfig2 = this.ilrdConfig_;
            if (iLRDConfig2 == null || iLRDConfig2 == ILRDConfig.getDefaultInstance()) {
                this.ilrdConfig_ = iLRDConfig;
            } else {
                this.ilrdConfig_ = (ILRDConfig) ((ILRDConfig.Builder) ILRDConfig.newBuilder(this.ilrdConfig_).mergeFrom((n0) iLRDConfig)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeOperationalMetricsConfig(OperationalMetricsConfig operationalMetricsConfig) {
            operationalMetricsConfig.getClass();
            OperationalMetricsConfig operationalMetricsConfig2 = this.operationalMetricsConfig_;
            if (operationalMetricsConfig2 == null || operationalMetricsConfig2 == OperationalMetricsConfig.getDefaultInstance()) {
                this.operationalMetricsConfig_ = operationalMetricsConfig;
            } else {
                this.operationalMetricsConfig_ = (OperationalMetricsConfig) ((OperationalMetricsConfig.Builder) OperationalMetricsConfig.newBuilder(this.operationalMetricsConfig_).mergeFrom((n0) operationalMetricsConfig)).buildPartial();
            }
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static SDKInitResponse parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (SDKInitResponse) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitResponse parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void removeAdUnits(int i5) {
            ensureAdUnitsIsMutable();
            this.adUnits_.remove(i5);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void removeExperimentalFeatureFlags(int i5) {
            ensureExperimentalFeatureFlagsIsMutable();
            this.experimentalFeatureFlags_.remove(i5);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdServerUrl(String str) {
            str.getClass();
            this.adServerUrl_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdServerUrlBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.adServerUrl_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdUnits(int i5, AdUnit adUnit) {
            adUnit.getClass();
            ensureAdUnitsIsMutable();
            this.adUnits_.set(i5, adUnit);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAppId(String str) {
            str.getClass();
            this.appId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAppIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.appId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBidTokenConfig(BidTokenConfig bidTokenConfig) {
            bidTokenConfig.getClass();
            this.bidTokenConfig_ = bidTokenConfig;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setConfigs(ConfigsOuterClass.Configs configs) {
            configs.getClass();
            this.configs_ = configs;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryIso2Code(String str) {
            str.getClass();
            this.countryIso2Code_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryIso2CodeBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.countryIso2Code_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryIso3Code(String str) {
            str.getClass();
            this.countryIso3Code_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryIso3CodeBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.countryIso3Code_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCrashReportingConfig(CrashReportingConfig crashReportingConfig) {
            crashReportingConfig.getClass();
            this.crashReportingConfig_ = crashReportingConfig;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setDirectAdsConfig(DirectAdsConfig directAdsConfig) {
            directAdsConfig.getClass();
            this.directAdsConfig_ = directAdsConfig;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEventCollectionConfig(EventCollectionConfig eventCollectionConfig) {
            eventCollectionConfig.getClass();
            this.eventCollectionConfig_ = eventCollectionConfig;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setExperimentalFeatureFlags(int i5, ExperimentalFeatureFlag experimentalFeatureFlag) {
            experimentalFeatureFlag.getClass();
            ensureExperimentalFeatureFlagsIsMutable();
            this.experimentalFeatureFlags_.set(i5, experimentalFeatureFlag);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setGeo(Geo geo) {
            geo.getClass();
            this.geo_ = geo;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIlrdConfig(ILRDConfig iLRDConfig) {
            iLRDConfig.getClass();
            this.ilrdConfig_ = iLRDConfig;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setOperationalMetricsConfig(OperationalMetricsConfig operationalMetricsConfig) {
            operationalMetricsConfig.getClass();
            this.operationalMetricsConfig_ = operationalMetricsConfig;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPlatformId(String str) {
            str.getClass();
            this.platformId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPlatformIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.platformId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPublisherId(String str) {
            str.getClass();
            this.publisherId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPublisherIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.publisherId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setResolvedRegion(Region region) {
            this.resolvedRegion_ = region.getNumber();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setResolvedRegionValue(int i5) {
            this.resolvedRegion_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setVerifyBannerVisible(boolean z11) {
            this.verifyBannerVisible_ = z11;
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0012\u0000\u0000\u0001\u0012\u0012\u0000\u0002\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004\u001b\u0005\f\u0006Ȉ\u0007Ȉ\bȈ\t\u0007\n\t\u000b\t\f\t\r\u001b\u000e\t\u000f\t\u0010\t\u0011\t\u0012\t", new Object[]{"appId_", "publisherId_", "countryIso3Code_", "adUnits_", AdUnit.class, "resolvedRegion_", "adServerUrl_", "countryIso2Code_", "platformId_", "verifyBannerVisible_", "geo_", "eventCollectionConfig_", "bidTokenConfig_", "experimentalFeatureFlags_", ExperimentalFeatureFlag.class, "operationalMetricsConfig_", "crashReportingConfig_", "configs_", "ilrdConfig_", "directAdsConfig_"});
                case 3:
                    return new SDKInitResponse();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (SDKInitResponse.class) {
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

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public String getAdServerUrl() {
            return this.adServerUrl_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public l getAdServerUrlBytes() {
            return l.f(this.adServerUrl_);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public AdUnit getAdUnits(int i5) {
            return (AdUnit) this.adUnits_.get(i5);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public int getAdUnitsCount() {
            return this.adUnits_.size();
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public List<AdUnit> getAdUnitsList() {
            return this.adUnits_;
        }

        public AdUnitOrBuilder getAdUnitsOrBuilder(int i5) {
            return (AdUnitOrBuilder) this.adUnits_.get(i5);
        }

        public List<? extends AdUnitOrBuilder> getAdUnitsOrBuilderList() {
            return this.adUnits_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public String getAppId() {
            return this.appId_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public l getAppIdBytes() {
            return l.f(this.appId_);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public BidTokenConfig getBidTokenConfig() {
            BidTokenConfig bidTokenConfig = this.bidTokenConfig_;
            return bidTokenConfig == null ? BidTokenConfig.getDefaultInstance() : bidTokenConfig;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public ConfigsOuterClass.Configs getConfigs() {
            ConfigsOuterClass.Configs configs = this.configs_;
            return configs == null ? ConfigsOuterClass.Configs.getDefaultInstance() : configs;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public String getCountryIso2Code() {
            return this.countryIso2Code_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public l getCountryIso2CodeBytes() {
            return l.f(this.countryIso2Code_);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public String getCountryIso3Code() {
            return this.countryIso3Code_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public l getCountryIso3CodeBytes() {
            return l.f(this.countryIso3Code_);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public CrashReportingConfig getCrashReportingConfig() {
            CrashReportingConfig crashReportingConfig = this.crashReportingConfig_;
            return crashReportingConfig == null ? CrashReportingConfig.getDefaultInstance() : crashReportingConfig;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public DirectAdsConfig getDirectAdsConfig() {
            DirectAdsConfig directAdsConfig = this.directAdsConfig_;
            return directAdsConfig == null ? DirectAdsConfig.getDefaultInstance() : directAdsConfig;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public EventCollectionConfig getEventCollectionConfig() {
            EventCollectionConfig eventCollectionConfig = this.eventCollectionConfig_;
            return eventCollectionConfig == null ? EventCollectionConfig.getDefaultInstance() : eventCollectionConfig;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public ExperimentalFeatureFlag getExperimentalFeatureFlags(int i5) {
            return (ExperimentalFeatureFlag) this.experimentalFeatureFlags_.get(i5);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public int getExperimentalFeatureFlagsCount() {
            return this.experimentalFeatureFlags_.size();
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public List<ExperimentalFeatureFlag> getExperimentalFeatureFlagsList() {
            return this.experimentalFeatureFlags_;
        }

        public ExperimentalFeatureFlagOrBuilder getExperimentalFeatureFlagsOrBuilder(int i5) {
            return (ExperimentalFeatureFlagOrBuilder) this.experimentalFeatureFlags_.get(i5);
        }

        public List<? extends ExperimentalFeatureFlagOrBuilder> getExperimentalFeatureFlagsOrBuilderList() {
            return this.experimentalFeatureFlags_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public Geo getGeo() {
            Geo geo = this.geo_;
            return geo == null ? Geo.getDefaultInstance() : geo;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public ILRDConfig getIlrdConfig() {
            ILRDConfig iLRDConfig = this.ilrdConfig_;
            return iLRDConfig == null ? ILRDConfig.getDefaultInstance() : iLRDConfig;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public OperationalMetricsConfig getOperationalMetricsConfig() {
            OperationalMetricsConfig operationalMetricsConfig = this.operationalMetricsConfig_;
            return operationalMetricsConfig == null ? OperationalMetricsConfig.getDefaultInstance() : operationalMetricsConfig;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public String getPlatformId() {
            return this.platformId_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public l getPlatformIdBytes() {
            return l.f(this.platformId_);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public String getPublisherId() {
            return this.publisherId_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public l getPublisherIdBytes() {
            return l.f(this.publisherId_);
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public Region getResolvedRegion() {
            Region regionForNumber = Region.forNumber(this.resolvedRegion_);
            return regionForNumber == null ? Region.UNRECOGNIZED : regionForNumber;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public int getResolvedRegionValue() {
            return this.resolvedRegion_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean getVerifyBannerVisible() {
            return this.verifyBannerVisible_;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasBidTokenConfig() {
            return this.bidTokenConfig_ != null;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasConfigs() {
            return this.configs_ != null;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasCrashReportingConfig() {
            return this.crashReportingConfig_ != null;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasDirectAdsConfig() {
            return this.directAdsConfig_ != null;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasEventCollectionConfig() {
            return this.eventCollectionConfig_ != null;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasGeo() {
            return this.geo_ != null;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasIlrdConfig() {
            return this.ilrdConfig_ != null;
        }

        @Override // com.moloco.sdk.Init.SDKInitResponseOrBuilder
        public boolean hasOperationalMetricsConfig() {
            return this.operationalMetricsConfig_ != null;
        }

        public static Builder newBuilder(SDKInitResponse sDKInitResponse) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(sDKInitResponse);
        }

        public static SDKInitResponse parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitResponse) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitResponse parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static SDKInitResponse parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addAdUnits(int i5, AdUnit adUnit) {
            adUnit.getClass();
            ensureAdUnitsIsMutable();
            this.adUnits_.add(i5, adUnit);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addExperimentalFeatureFlags(int i5, ExperimentalFeatureFlag experimentalFeatureFlag) {
            experimentalFeatureFlag.getClass();
            ensureExperimentalFeatureFlagsIsMutable();
            this.experimentalFeatureFlags_.add(i5, experimentalFeatureFlag);
        }

        public static SDKInitResponse parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static SDKInitResponse parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static SDKInitResponse parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static SDKInitResponse parseFrom(InputStream inputStream) throws IOException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitResponse parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitResponse parseFrom(p pVar) throws IOException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static SDKInitResponse parseFrom(p pVar, y yVar) throws IOException {
            return (SDKInitResponse) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface SDKInitResponseOrBuilder extends p1 {
        String getAdServerUrl();

        l getAdServerUrlBytes();

        SDKInitResponse.AdUnit getAdUnits(int i5);

        int getAdUnitsCount();

        List<SDKInitResponse.AdUnit> getAdUnitsList();

        String getAppId();

        l getAppIdBytes();

        SDKInitResponse.BidTokenConfig getBidTokenConfig();

        ConfigsOuterClass.Configs getConfigs();

        String getCountryIso2Code();

        l getCountryIso2CodeBytes();

        String getCountryIso3Code();

        l getCountryIso3CodeBytes();

        SDKInitResponse.CrashReportingConfig getCrashReportingConfig();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        SDKInitResponse.DirectAdsConfig getDirectAdsConfig();

        SDKInitResponse.EventCollectionConfig getEventCollectionConfig();

        SDKInitResponse.ExperimentalFeatureFlag getExperimentalFeatureFlags(int i5);

        int getExperimentalFeatureFlagsCount();

        List<SDKInitResponse.ExperimentalFeatureFlag> getExperimentalFeatureFlagsList();

        SDKInitResponse.Geo getGeo();

        SDKInitResponse.ILRDConfig getIlrdConfig();

        SDKInitResponse.OperationalMetricsConfig getOperationalMetricsConfig();

        String getPlatformId();

        l getPlatformIdBytes();

        String getPublisherId();

        l getPublisherIdBytes();

        SDKInitResponse.Region getResolvedRegion();

        int getResolvedRegionValue();

        boolean getVerifyBannerVisible();

        boolean hasBidTokenConfig();

        boolean hasConfigs();

        boolean hasCrashReportingConfig();

        boolean hasDirectAdsConfig();

        boolean hasEventCollectionConfig();

        boolean hasGeo();

        boolean hasIlrdConfig();

        boolean hasOperationalMetricsConfig();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    private Init() {
    }

    public static void registerAllExtensions(y yVar) {
    }
}
