package com.moloco.sdk;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.f0;
import com.google.protobuf.g0;
import com.google.protobuf.l;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.o1;
import com.google.protobuf.p;
import com.google.protobuf.p1;
import com.google.protobuf.v1;
import com.google.protobuf.y;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class ConfigsOuterClass {

    /* renamed from: com.moloco.sdk.ConfigsOuterClass$1, reason: invalid class name */
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
    public static final class Configs extends n0 implements ConfigsOrBuilder {
        public static final int ANDROID_CONFIG_FIELD_NUMBER = 1;
        public static final int COMMON_CONFIGS_FIELD_NUMBER = 3;
        private static final Configs DEFAULT_INSTANCE;
        public static final int IOS_CONFIG_FIELD_NUMBER = 2;
        private static volatile v1 PARSER;
        private int clientConfigsCase_ = 0;
        private Object clientConfigs_;
        private CommonConfigs commonConfigs_;

        public static final class AndroidConfigs extends n0 implements AndroidConfigsOrBuilder {
            private static final AndroidConfigs DEFAULT_INSTANCE;
            private static volatile v1 PARSER;

            /* loaded from: classes3.dex */
            public static final class Builder extends f0 implements AndroidConfigsOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                private Builder() {
                    super(AndroidConfigs.DEFAULT_INSTANCE);
                }
            }

            static {
                AndroidConfigs androidConfigs = new AndroidConfigs();
                DEFAULT_INSTANCE = androidConfigs;
                n0.registerDefaultInstance(AndroidConfigs.class, androidConfigs);
            }

            private AndroidConfigs() {
            }

            public static AndroidConfigs getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static AndroidConfigs parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AndroidConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AndroidConfigs parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
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
                        return new AndroidConfigs();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (AndroidConfigs.class) {
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

            public static Builder newBuilder(AndroidConfigs androidConfigs) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(androidConfigs);
            }

            public static AndroidConfigs parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (AndroidConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AndroidConfigs parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static AndroidConfigs parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static AndroidConfigs parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static AndroidConfigs parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static AndroidConfigs parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static AndroidConfigs parseFrom(InputStream inputStream) throws IOException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AndroidConfigs parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AndroidConfigs parseFrom(p pVar) throws IOException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static AndroidConfigs parseFrom(p pVar, y yVar) throws IOException {
                return (AndroidConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface AndroidConfigsOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Builder extends f0 implements ConfigsOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearAndroidConfig() {
                copyOnWrite();
                ((Configs) this.instance).clearAndroidConfig();
                return this;
            }

            public Builder clearClientConfigs() {
                copyOnWrite();
                ((Configs) this.instance).clearClientConfigs();
                return this;
            }

            public Builder clearCommonConfigs() {
                copyOnWrite();
                ((Configs) this.instance).clearCommonConfigs();
                return this;
            }

            public Builder clearIosConfig() {
                copyOnWrite();
                ((Configs) this.instance).clearIosConfig();
                return this;
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
            public AndroidConfigs getAndroidConfig() {
                return ((Configs) this.instance).getAndroidConfig();
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
            public ClientConfigsCase getClientConfigsCase() {
                return ((Configs) this.instance).getClientConfigsCase();
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
            public CommonConfigs getCommonConfigs() {
                return ((Configs) this.instance).getCommonConfigs();
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
            public IOSConfigs getIosConfig() {
                return ((Configs) this.instance).getIosConfig();
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
            public boolean hasAndroidConfig() {
                return ((Configs) this.instance).hasAndroidConfig();
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
            public boolean hasCommonConfigs() {
                return ((Configs) this.instance).hasCommonConfigs();
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
            public boolean hasIosConfig() {
                return ((Configs) this.instance).hasIosConfig();
            }

            public Builder mergeAndroidConfig(AndroidConfigs androidConfigs) {
                copyOnWrite();
                ((Configs) this.instance).mergeAndroidConfig(androidConfigs);
                return this;
            }

            public Builder mergeCommonConfigs(CommonConfigs commonConfigs) {
                copyOnWrite();
                ((Configs) this.instance).mergeCommonConfigs(commonConfigs);
                return this;
            }

            public Builder mergeIosConfig(IOSConfigs iOSConfigs) {
                copyOnWrite();
                ((Configs) this.instance).mergeIosConfig(iOSConfigs);
                return this;
            }

            public Builder setAndroidConfig(AndroidConfigs androidConfigs) {
                copyOnWrite();
                ((Configs) this.instance).setAndroidConfig(androidConfigs);
                return this;
            }

            public Builder setCommonConfigs(CommonConfigs commonConfigs) {
                copyOnWrite();
                ((Configs) this.instance).setCommonConfigs(commonConfigs);
                return this;
            }

            public Builder setIosConfig(IOSConfigs iOSConfigs) {
                copyOnWrite();
                ((Configs) this.instance).setIosConfig(iOSConfigs);
                return this;
            }

            private Builder() {
                super(Configs.DEFAULT_INSTANCE);
            }

            public Builder setAndroidConfig(AndroidConfigs.Builder builder) {
                copyOnWrite();
                ((Configs) this.instance).setAndroidConfig((AndroidConfigs) builder.build());
                return this;
            }

            public Builder setCommonConfigs(CommonConfigs.Builder builder) {
                copyOnWrite();
                ((Configs) this.instance).setCommonConfigs((CommonConfigs) builder.build());
                return this;
            }

            public Builder setIosConfig(IOSConfigs.Builder builder) {
                copyOnWrite();
                ((Configs) this.instance).setIosConfig((IOSConfigs) builder.build());
                return this;
            }
        }

        /* loaded from: classes3.dex */
        public enum ClientConfigsCase {
            ANDROID_CONFIG(1),
            IOS_CONFIG(2),
            CLIENTCONFIGS_NOT_SET(0);

            private final int value;

            ClientConfigsCase(int i5) {
                this.value = i5;
            }

            public static ClientConfigsCase forNumber(int i5) {
                if (i5 == 0) {
                    return CLIENTCONFIGS_NOT_SET;
                }
                if (i5 == 1) {
                    return ANDROID_CONFIG;
                }
                if (i5 != 2) {
                    return null;
                }
                return IOS_CONFIG;
            }

            public int getNumber() {
                return this.value;
            }

            @Deprecated
            public static ClientConfigsCase valueOf(int i5) {
                return forNumber(i5);
            }
        }

        public static final class CommonConfigs extends n0 implements CommonConfigsOrBuilder {
            private static final CommonConfigs DEFAULT_INSTANCE;
            public static final int MEDIA_CONFIG_FIELD_NUMBER = 1;
            private static volatile v1 PARSER;
            private MediaConfig mediaConfig_;

            public static final class Builder extends f0 implements CommonConfigsOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearMediaConfig() {
                    copyOnWrite();
                    ((CommonConfigs) this.instance).clearMediaConfig();
                    return this;
                }

                @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigsOrBuilder
                public MediaConfig getMediaConfig() {
                    return ((CommonConfigs) this.instance).getMediaConfig();
                }

                @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigsOrBuilder
                public boolean hasMediaConfig() {
                    return ((CommonConfigs) this.instance).hasMediaConfig();
                }

                public Builder mergeMediaConfig(MediaConfig mediaConfig) {
                    copyOnWrite();
                    ((CommonConfigs) this.instance).mergeMediaConfig(mediaConfig);
                    return this;
                }

                public Builder setMediaConfig(MediaConfig mediaConfig) {
                    copyOnWrite();
                    ((CommonConfigs) this.instance).setMediaConfig(mediaConfig);
                    return this;
                }

                private Builder() {
                    super(CommonConfigs.DEFAULT_INSTANCE);
                }

                public Builder setMediaConfig(MediaConfig.Builder builder) {
                    copyOnWrite();
                    ((CommonConfigs) this.instance).setMediaConfig((MediaConfig) builder.build());
                    return this;
                }
            }

            public static final class MediaConfig extends n0 implements MediaConfigOrBuilder {
                private static final MediaConfig DEFAULT_INSTANCE;
                public static final int MIN_STREAMING_PLAYABLE_DURATION_ON_TIMEOUT_SECS_FIELD_NUMBER = 2;
                private static volatile v1 PARSER = null;
                public static final int STREAMING_CHUNK_SIZE_KILOBYTES_FIELD_NUMBER = 1;
                private int bitField0_;
                private double minStreamingPlayableDurationOnTimeoutSecs_;
                private long streamingChunkSizeKilobytes_;

                public static final class Builder extends f0 implements MediaConfigOrBuilder {
                    public /* synthetic */ Builder(int i5) {
                        this();
                    }

                    public Builder clearMinStreamingPlayableDurationOnTimeoutSecs() {
                        copyOnWrite();
                        ((MediaConfig) this.instance).clearMinStreamingPlayableDurationOnTimeoutSecs();
                        return this;
                    }

                    public Builder clearStreamingChunkSizeKilobytes() {
                        copyOnWrite();
                        ((MediaConfig) this.instance).clearStreamingChunkSizeKilobytes();
                        return this;
                    }

                    @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                    public double getMinStreamingPlayableDurationOnTimeoutSecs() {
                        return ((MediaConfig) this.instance).getMinStreamingPlayableDurationOnTimeoutSecs();
                    }

                    @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                    public long getStreamingChunkSizeKilobytes() {
                        return ((MediaConfig) this.instance).getStreamingChunkSizeKilobytes();
                    }

                    @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                    public boolean hasMinStreamingPlayableDurationOnTimeoutSecs() {
                        return ((MediaConfig) this.instance).hasMinStreamingPlayableDurationOnTimeoutSecs();
                    }

                    @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                    public boolean hasStreamingChunkSizeKilobytes() {
                        return ((MediaConfig) this.instance).hasStreamingChunkSizeKilobytes();
                    }

                    public Builder setMinStreamingPlayableDurationOnTimeoutSecs(double d5) {
                        copyOnWrite();
                        ((MediaConfig) this.instance).setMinStreamingPlayableDurationOnTimeoutSecs(d5);
                        return this;
                    }

                    public Builder setStreamingChunkSizeKilobytes(long j11) {
                        copyOnWrite();
                        ((MediaConfig) this.instance).setStreamingChunkSizeKilobytes(j11);
                        return this;
                    }

                    private Builder() {
                        super(MediaConfig.DEFAULT_INSTANCE);
                    }
                }

                static {
                    MediaConfig mediaConfig = new MediaConfig();
                    DEFAULT_INSTANCE = mediaConfig;
                    n0.registerDefaultInstance(MediaConfig.class, mediaConfig);
                }

                private MediaConfig() {
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearMinStreamingPlayableDurationOnTimeoutSecs() {
                    this.bitField0_ &= -3;
                    this.minStreamingPlayableDurationOnTimeoutSecs_ = 0.0d;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void clearStreamingChunkSizeKilobytes() {
                    this.bitField0_ &= -2;
                    this.streamingChunkSizeKilobytes_ = 0L;
                }

                public static MediaConfig getDefaultInstance() {
                    return DEFAULT_INSTANCE;
                }

                public static Builder newBuilder() {
                    return (Builder) DEFAULT_INSTANCE.createBuilder();
                }

                public static MediaConfig parseDelimitedFrom(InputStream inputStream) throws IOException {
                    return (MediaConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static MediaConfig parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
                }

                public static v1 parser() {
                    return DEFAULT_INSTANCE.getParserForType();
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setMinStreamingPlayableDurationOnTimeoutSecs(double d5) {
                    this.bitField0_ |= 2;
                    this.minStreamingPlayableDurationOnTimeoutSecs_ = d5;
                }

                /* JADX INFO: Access modifiers changed from: private */
                public void setStreamingChunkSizeKilobytes(long j11) {
                    this.bitField0_ |= 1;
                    this.streamingChunkSizeKilobytes_ = j11;
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
                            return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဂ\u0000\u0002က\u0001", new Object[]{"bitField0_", "streamingChunkSizeKilobytes_", "minStreamingPlayableDurationOnTimeoutSecs_"});
                        case 3:
                            return new MediaConfig();
                        case 4:
                            return new Builder(0);
                        case 5:
                            return DEFAULT_INSTANCE;
                        case 6:
                            v1 v1Var = PARSER;
                            if (v1Var != null) {
                                return v1Var;
                            }
                            synchronized (MediaConfig.class) {
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

                @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                public double getMinStreamingPlayableDurationOnTimeoutSecs() {
                    return this.minStreamingPlayableDurationOnTimeoutSecs_;
                }

                @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                public long getStreamingChunkSizeKilobytes() {
                    return this.streamingChunkSizeKilobytes_;
                }

                @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                public boolean hasMinStreamingPlayableDurationOnTimeoutSecs() {
                    return (this.bitField0_ & 2) != 0;
                }

                @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigs.MediaConfigOrBuilder
                public boolean hasStreamingChunkSizeKilobytes() {
                    return (this.bitField0_ & 1) != 0;
                }

                public static Builder newBuilder(MediaConfig mediaConfig) {
                    return (Builder) DEFAULT_INSTANCE.createBuilder(mediaConfig);
                }

                public static MediaConfig parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                    return (MediaConfig) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static MediaConfig parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
                }

                public static MediaConfig parseFrom(l lVar) throws InvalidProtocolBufferException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar);
                }

                public static MediaConfig parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
                }

                public static MediaConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr);
                }

                public static MediaConfig parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
                }

                public static MediaConfig parseFrom(InputStream inputStream) throws IOException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
                }

                public static MediaConfig parseFrom(InputStream inputStream, y yVar) throws IOException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
                }

                public static MediaConfig parseFrom(p pVar) throws IOException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar);
                }

                public static MediaConfig parseFrom(p pVar, y yVar) throws IOException {
                    return (MediaConfig) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
                }
            }

            public interface MediaConfigOrBuilder extends p1 {
                @Override // com.google.protobuf.p1
                /* synthetic */ o1 getDefaultInstanceForType();

                double getMinStreamingPlayableDurationOnTimeoutSecs();

                long getStreamingChunkSizeKilobytes();

                boolean hasMinStreamingPlayableDurationOnTimeoutSecs();

                boolean hasStreamingChunkSizeKilobytes();

                @Override // com.google.protobuf.p1
                /* synthetic */ boolean isInitialized();
            }

            static {
                CommonConfigs commonConfigs = new CommonConfigs();
                DEFAULT_INSTANCE = commonConfigs;
                n0.registerDefaultInstance(CommonConfigs.class, commonConfigs);
            }

            private CommonConfigs() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearMediaConfig() {
                this.mediaConfig_ = null;
            }

            public static CommonConfigs getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeMediaConfig(MediaConfig mediaConfig) {
                mediaConfig.getClass();
                MediaConfig mediaConfig2 = this.mediaConfig_;
                if (mediaConfig2 == null || mediaConfig2 == MediaConfig.getDefaultInstance()) {
                    this.mediaConfig_ = mediaConfig;
                } else {
                    this.mediaConfig_ = (MediaConfig) ((MediaConfig.Builder) MediaConfig.newBuilder(this.mediaConfig_).mergeFrom((n0) mediaConfig)).buildPartial();
                }
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static CommonConfigs parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (CommonConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static CommonConfigs parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setMediaConfig(MediaConfig mediaConfig) {
                mediaConfig.getClass();
                this.mediaConfig_ = mediaConfig;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\t", new Object[]{"mediaConfig_"});
                    case 3:
                        return new CommonConfigs();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (CommonConfigs.class) {
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

            @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigsOrBuilder
            public MediaConfig getMediaConfig() {
                MediaConfig mediaConfig = this.mediaConfig_;
                return mediaConfig == null ? MediaConfig.getDefaultInstance() : mediaConfig;
            }

            @Override // com.moloco.sdk.ConfigsOuterClass.Configs.CommonConfigsOrBuilder
            public boolean hasMediaConfig() {
                return this.mediaConfig_ != null;
            }

            public static Builder newBuilder(CommonConfigs commonConfigs) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(commonConfigs);
            }

            public static CommonConfigs parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (CommonConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static CommonConfigs parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static CommonConfigs parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static CommonConfigs parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static CommonConfigs parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static CommonConfigs parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static CommonConfigs parseFrom(InputStream inputStream) throws IOException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static CommonConfigs parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static CommonConfigs parseFrom(p pVar) throws IOException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static CommonConfigs parseFrom(p pVar, y yVar) throws IOException {
                return (CommonConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface CommonConfigsOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            CommonConfigs.MediaConfig getMediaConfig();

            boolean hasMediaConfig();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class IOSConfigs extends n0 implements IOSConfigsOrBuilder {
            private static final IOSConfigs DEFAULT_INSTANCE;
            private static volatile v1 PARSER;

            /* loaded from: classes3.dex */
            public static final class Builder extends f0 implements IOSConfigsOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                private Builder() {
                    super(IOSConfigs.DEFAULT_INSTANCE);
                }
            }

            static {
                IOSConfigs iOSConfigs = new IOSConfigs();
                DEFAULT_INSTANCE = iOSConfigs;
                n0.registerDefaultInstance(IOSConfigs.class, iOSConfigs);
            }

            private IOSConfigs() {
            }

            public static IOSConfigs getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static IOSConfigs parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (IOSConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static IOSConfigs parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
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
                        return new IOSConfigs();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (IOSConfigs.class) {
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

            public static Builder newBuilder(IOSConfigs iOSConfigs) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(iOSConfigs);
            }

            public static IOSConfigs parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (IOSConfigs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static IOSConfigs parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static IOSConfigs parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static IOSConfigs parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static IOSConfigs parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static IOSConfigs parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static IOSConfigs parseFrom(InputStream inputStream) throws IOException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static IOSConfigs parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static IOSConfigs parseFrom(p pVar) throws IOException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static IOSConfigs parseFrom(p pVar, y yVar) throws IOException {
                return (IOSConfigs) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface IOSConfigsOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        static {
            Configs configs = new Configs();
            DEFAULT_INSTANCE = configs;
            n0.registerDefaultInstance(Configs.class, configs);
        }

        private Configs() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAndroidConfig() {
            if (this.clientConfigsCase_ == 1) {
                this.clientConfigsCase_ = 0;
                this.clientConfigs_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearClientConfigs() {
            this.clientConfigsCase_ = 0;
            this.clientConfigs_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCommonConfigs() {
            this.commonConfigs_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearIosConfig() {
            if (this.clientConfigsCase_ == 2) {
                this.clientConfigsCase_ = 0;
                this.clientConfigs_ = null;
            }
        }

        public static Configs getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeAndroidConfig(AndroidConfigs androidConfigs) {
            androidConfigs.getClass();
            if (this.clientConfigsCase_ != 1 || this.clientConfigs_ == AndroidConfigs.getDefaultInstance()) {
                this.clientConfigs_ = androidConfigs;
            } else {
                this.clientConfigs_ = ((AndroidConfigs.Builder) AndroidConfigs.newBuilder((AndroidConfigs) this.clientConfigs_).mergeFrom((n0) androidConfigs)).buildPartial();
            }
            this.clientConfigsCase_ = 1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeCommonConfigs(CommonConfigs commonConfigs) {
            commonConfigs.getClass();
            CommonConfigs commonConfigs2 = this.commonConfigs_;
            if (commonConfigs2 == null || commonConfigs2 == CommonConfigs.getDefaultInstance()) {
                this.commonConfigs_ = commonConfigs;
            } else {
                this.commonConfigs_ = (CommonConfigs) ((CommonConfigs.Builder) CommonConfigs.newBuilder(this.commonConfigs_).mergeFrom((n0) commonConfigs)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeIosConfig(IOSConfigs iOSConfigs) {
            iOSConfigs.getClass();
            if (this.clientConfigsCase_ != 2 || this.clientConfigs_ == IOSConfigs.getDefaultInstance()) {
                this.clientConfigs_ = iOSConfigs;
            } else {
                this.clientConfigs_ = ((IOSConfigs.Builder) IOSConfigs.newBuilder((IOSConfigs) this.clientConfigs_).mergeFrom((n0) iOSConfigs)).buildPartial();
            }
            this.clientConfigsCase_ = 2;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static Configs parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (Configs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static Configs parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAndroidConfig(AndroidConfigs androidConfigs) {
            androidConfigs.getClass();
            this.clientConfigs_ = androidConfigs;
            this.clientConfigsCase_ = 1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCommonConfigs(CommonConfigs commonConfigs) {
            commonConfigs.getClass();
            this.commonConfigs_ = commonConfigs;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIosConfig(IOSConfigs iOSConfigs) {
            iOSConfigs.getClass();
            this.clientConfigs_ = iOSConfigs;
            this.clientConfigsCase_ = 2;
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0001\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000\u0003\t", new Object[]{"clientConfigs_", "clientConfigsCase_", AndroidConfigs.class, IOSConfigs.class, "commonConfigs_"});
                case 3:
                    return new Configs();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (Configs.class) {
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

        @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
        public AndroidConfigs getAndroidConfig() {
            return this.clientConfigsCase_ == 1 ? (AndroidConfigs) this.clientConfigs_ : AndroidConfigs.getDefaultInstance();
        }

        @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
        public ClientConfigsCase getClientConfigsCase() {
            return ClientConfigsCase.forNumber(this.clientConfigsCase_);
        }

        @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
        public CommonConfigs getCommonConfigs() {
            CommonConfigs commonConfigs = this.commonConfigs_;
            return commonConfigs == null ? CommonConfigs.getDefaultInstance() : commonConfigs;
        }

        @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
        public IOSConfigs getIosConfig() {
            return this.clientConfigsCase_ == 2 ? (IOSConfigs) this.clientConfigs_ : IOSConfigs.getDefaultInstance();
        }

        @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
        public boolean hasAndroidConfig() {
            return this.clientConfigsCase_ == 1;
        }

        @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
        public boolean hasCommonConfigs() {
            return this.commonConfigs_ != null;
        }

        @Override // com.moloco.sdk.ConfigsOuterClass.ConfigsOrBuilder
        public boolean hasIosConfig() {
            return this.clientConfigsCase_ == 2;
        }

        public static Builder newBuilder(Configs configs) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(configs);
        }

        public static Configs parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (Configs) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static Configs parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static Configs parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static Configs parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static Configs parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static Configs parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static Configs parseFrom(InputStream inputStream) throws IOException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static Configs parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static Configs parseFrom(p pVar) throws IOException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static Configs parseFrom(p pVar, y yVar) throws IOException {
            return (Configs) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface ConfigsOrBuilder extends p1 {
        Configs.AndroidConfigs getAndroidConfig();

        Configs.ClientConfigsCase getClientConfigsCase();

        Configs.CommonConfigs getCommonConfigs();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        Configs.IOSConfigs getIosConfig();

        boolean hasAndroidConfig();

        boolean hasCommonConfigs();

        boolean hasIosConfig();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    private ConfigsOuterClass() {
    }

    public static void registerAllExtensions(y yVar) {
    }
}
