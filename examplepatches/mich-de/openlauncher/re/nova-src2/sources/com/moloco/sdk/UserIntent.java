package com.moloco.sdk;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.c;
import com.google.protobuf.d;
import com.google.protobuf.f0;
import com.google.protobuf.g0;
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
import com.google.protobuf.z0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class UserIntent {

    /* renamed from: com.moloco.sdk.UserIntent$1, reason: invalid class name */
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

    public static final class UserAdInteractionExt extends n0 implements UserAdInteractionExtOrBuilder {
        public static final int ADVERTISING_ID_FIELD_NUMBER = 3;
        public static final int APP_BACKGROUNDING_INTERACTION_FIELD_NUMBER = 103;
        public static final int APP_FIELD_NUMBER = 5;
        public static final int APP_FOREGROUNDING_INTERACTION_FIELD_NUMBER = 102;
        public static final int CLICK_INTERACTION_FIELD_NUMBER = 101;
        public static final int CLIENT_TIMESTAMP_FIELD_NUMBER = 2;
        private static final UserAdInteractionExt DEFAULT_INSTANCE;
        public static final int DEVICE_FIELD_NUMBER = 4;
        public static final int IMP_INTERACTION_FIELD_NUMBER = 100;
        public static final int MREF_FIELD_NUMBER = 1;
        public static final int NETWORK_FIELD_NUMBER = 6;
        private static volatile v1 PARSER = null;
        public static final int SDK_FIELD_NUMBER = 7;
        private App app_;
        private long clientTimestamp_;
        private Device device_;
        private Object infoExt_;
        private Network network_;
        private MolocoSDK sdk_;
        private int infoExtCase_ = 0;
        private String mref_ = b.f42142b;
        private String advertisingId_ = b.f42142b;

        public static final class App extends n0 implements AppOrBuilder {
            private static final App DEFAULT_INSTANCE;
            public static final int ID_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int VER_FIELD_NUMBER = 2;
            private String id_ = b.f42142b;
            private String ver_ = b.f42142b;

            public static final class Builder extends f0 implements AppOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearId() {
                    copyOnWrite();
                    ((App) this.instance).clearId();
                    return this;
                }

                public Builder clearVer() {
                    copyOnWrite();
                    ((App) this.instance).clearVer();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
                public String getId() {
                    return ((App) this.instance).getId();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
                public l getIdBytes() {
                    return ((App) this.instance).getIdBytes();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
                public String getVer() {
                    return ((App) this.instance).getVer();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
                public l getVerBytes() {
                    return ((App) this.instance).getVerBytes();
                }

                public Builder setId(String str) {
                    copyOnWrite();
                    ((App) this.instance).setId(str);
                    return this;
                }

                public Builder setIdBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((App) this.instance).setIdBytes(lVar);
                    return this;
                }

                public Builder setVer(String str) {
                    copyOnWrite();
                    ((App) this.instance).setVer(str);
                    return this;
                }

                public Builder setVerBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((App) this.instance).setVerBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(App.DEFAULT_INSTANCE);
                }
            }

            static {
                App app = new App();
                DEFAULT_INSTANCE = app;
                n0.registerDefaultInstance(App.class, app);
            }

            private App() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearId() {
                this.id_ = getDefaultInstance().getId();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearVer() {
                this.ver_ = getDefaultInstance().getVer();
            }

            public static App getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static App parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (App) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static App parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
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
            public void setVer(String str) {
                str.getClass();
                this.ver_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setVerBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.ver_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ", new Object[]{"id_", "ver_"});
                    case 3:
                        return new App();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (App.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
            public String getId() {
                return this.id_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
            public l getIdBytes() {
                return l.f(this.id_);
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
            public String getVer() {
                return this.ver_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppOrBuilder
            public l getVerBytes() {
                return l.f(this.ver_);
            }

            public static Builder newBuilder(App app) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(app);
            }

            public static App parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (App) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static App parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static App parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static App parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static App parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static App parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static App parseFrom(InputStream inputStream) throws IOException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static App parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static App parseFrom(p pVar) throws IOException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static App parseFrom(p pVar, y yVar) throws IOException {
                return (App) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public static final class AppBackgroundingInteraction extends n0 implements AppBackgroundingInteractionOrBuilder {
            private static final AppBackgroundingInteraction DEFAULT_INSTANCE;
            private static volatile v1 PARSER;

            public static final class Builder extends f0 implements AppBackgroundingInteractionOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                private Builder() {
                    super(AppBackgroundingInteraction.DEFAULT_INSTANCE);
                }
            }

            static {
                AppBackgroundingInteraction appBackgroundingInteraction = new AppBackgroundingInteraction();
                DEFAULT_INSTANCE = appBackgroundingInteraction;
                n0.registerDefaultInstance(AppBackgroundingInteraction.class, appBackgroundingInteraction);
            }

            private AppBackgroundingInteraction() {
            }

            public static AppBackgroundingInteraction getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static AppBackgroundingInteraction parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AppBackgroundingInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AppBackgroundingInteraction parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
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
                        return new AppBackgroundingInteraction();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (AppBackgroundingInteraction.class) {
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

            public static Builder newBuilder(AppBackgroundingInteraction appBackgroundingInteraction) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(appBackgroundingInteraction);
            }

            public static AppBackgroundingInteraction parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (AppBackgroundingInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AppBackgroundingInteraction parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static AppBackgroundingInteraction parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static AppBackgroundingInteraction parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static AppBackgroundingInteraction parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static AppBackgroundingInteraction parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static AppBackgroundingInteraction parseFrom(InputStream inputStream) throws IOException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AppBackgroundingInteraction parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AppBackgroundingInteraction parseFrom(p pVar) throws IOException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static AppBackgroundingInteraction parseFrom(p pVar, y yVar) throws IOException {
                return (AppBackgroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface AppBackgroundingInteractionOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class AppForegroundingInteraction extends n0 implements AppForegroundingInteractionOrBuilder {
            public static final int BG_TS_MS_FIELD_NUMBER = 1;
            private static final AppForegroundingInteraction DEFAULT_INSTANCE;
            private static volatile v1 PARSER;
            private long bgTsMs_;

            public static final class Builder extends f0 implements AppForegroundingInteractionOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearBgTsMs() {
                    copyOnWrite();
                    ((AppForegroundingInteraction) this.instance).clearBgTsMs();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppForegroundingInteractionOrBuilder
                public long getBgTsMs() {
                    return ((AppForegroundingInteraction) this.instance).getBgTsMs();
                }

                public Builder setBgTsMs(long j11) {
                    copyOnWrite();
                    ((AppForegroundingInteraction) this.instance).setBgTsMs(j11);
                    return this;
                }

                private Builder() {
                    super(AppForegroundingInteraction.DEFAULT_INSTANCE);
                }
            }

            static {
                AppForegroundingInteraction appForegroundingInteraction = new AppForegroundingInteraction();
                DEFAULT_INSTANCE = appForegroundingInteraction;
                n0.registerDefaultInstance(AppForegroundingInteraction.class, appForegroundingInteraction);
            }

            private AppForegroundingInteraction() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearBgTsMs() {
                this.bgTsMs_ = 0L;
            }

            public static AppForegroundingInteraction getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static AppForegroundingInteraction parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (AppForegroundingInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AppForegroundingInteraction parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setBgTsMs(long j11) {
                this.bgTsMs_ = j11;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u0002", new Object[]{"bgTsMs_"});
                    case 3:
                        return new AppForegroundingInteraction();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (AppForegroundingInteraction.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.AppForegroundingInteractionOrBuilder
            public long getBgTsMs() {
                return this.bgTsMs_;
            }

            public static Builder newBuilder(AppForegroundingInteraction appForegroundingInteraction) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(appForegroundingInteraction);
            }

            public static AppForegroundingInteraction parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (AppForegroundingInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AppForegroundingInteraction parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static AppForegroundingInteraction parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static AppForegroundingInteraction parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static AppForegroundingInteraction parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static AppForegroundingInteraction parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static AppForegroundingInteraction parseFrom(InputStream inputStream) throws IOException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static AppForegroundingInteraction parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static AppForegroundingInteraction parseFrom(p pVar) throws IOException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static AppForegroundingInteraction parseFrom(p pVar, y yVar) throws IOException {
                return (AppForegroundingInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface AppForegroundingInteractionOrBuilder extends p1 {
            long getBgTsMs();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public interface AppOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getId();

            l getIdBytes();

            String getVer();

            l getVerBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Builder extends f0 implements UserAdInteractionExtOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearAdvertisingId() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearAdvertisingId();
                return this;
            }

            public Builder clearApp() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearApp();
                return this;
            }

            public Builder clearAppBackgroundingInteraction() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearAppBackgroundingInteraction();
                return this;
            }

            public Builder clearAppForegroundingInteraction() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearAppForegroundingInteraction();
                return this;
            }

            public Builder clearClickInteraction() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearClickInteraction();
                return this;
            }

            public Builder clearClientTimestamp() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearClientTimestamp();
                return this;
            }

            public Builder clearDevice() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearDevice();
                return this;
            }

            public Builder clearImpInteraction() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearImpInteraction();
                return this;
            }

            public Builder clearInfoExt() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearInfoExt();
                return this;
            }

            public Builder clearMref() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearMref();
                return this;
            }

            public Builder clearNetwork() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearNetwork();
                return this;
            }

            public Builder clearSdk() {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).clearSdk();
                return this;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public String getAdvertisingId() {
                return ((UserAdInteractionExt) this.instance).getAdvertisingId();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public l getAdvertisingIdBytes() {
                return ((UserAdInteractionExt) this.instance).getAdvertisingIdBytes();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public App getApp() {
                return ((UserAdInteractionExt) this.instance).getApp();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public AppBackgroundingInteraction getAppBackgroundingInteraction() {
                return ((UserAdInteractionExt) this.instance).getAppBackgroundingInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public AppForegroundingInteraction getAppForegroundingInteraction() {
                return ((UserAdInteractionExt) this.instance).getAppForegroundingInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public ClickInteraction getClickInteraction() {
                return ((UserAdInteractionExt) this.instance).getClickInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public long getClientTimestamp() {
                return ((UserAdInteractionExt) this.instance).getClientTimestamp();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public Device getDevice() {
                return ((UserAdInteractionExt) this.instance).getDevice();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public ImpressionInteraction getImpInteraction() {
                return ((UserAdInteractionExt) this.instance).getImpInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public InfoExtCase getInfoExtCase() {
                return ((UserAdInteractionExt) this.instance).getInfoExtCase();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public String getMref() {
                return ((UserAdInteractionExt) this.instance).getMref();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public l getMrefBytes() {
                return ((UserAdInteractionExt) this.instance).getMrefBytes();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public Network getNetwork() {
                return ((UserAdInteractionExt) this.instance).getNetwork();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public MolocoSDK getSdk() {
                return ((UserAdInteractionExt) this.instance).getSdk();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasApp() {
                return ((UserAdInteractionExt) this.instance).hasApp();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasAppBackgroundingInteraction() {
                return ((UserAdInteractionExt) this.instance).hasAppBackgroundingInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasAppForegroundingInteraction() {
                return ((UserAdInteractionExt) this.instance).hasAppForegroundingInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasClickInteraction() {
                return ((UserAdInteractionExt) this.instance).hasClickInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasDevice() {
                return ((UserAdInteractionExt) this.instance).hasDevice();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasImpInteraction() {
                return ((UserAdInteractionExt) this.instance).hasImpInteraction();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasNetwork() {
                return ((UserAdInteractionExt) this.instance).hasNetwork();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
            public boolean hasSdk() {
                return ((UserAdInteractionExt) this.instance).hasSdk();
            }

            public Builder mergeApp(App app) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeApp(app);
                return this;
            }

            public Builder mergeAppBackgroundingInteraction(AppBackgroundingInteraction appBackgroundingInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeAppBackgroundingInteraction(appBackgroundingInteraction);
                return this;
            }

            public Builder mergeAppForegroundingInteraction(AppForegroundingInteraction appForegroundingInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeAppForegroundingInteraction(appForegroundingInteraction);
                return this;
            }

            public Builder mergeClickInteraction(ClickInteraction clickInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeClickInteraction(clickInteraction);
                return this;
            }

            public Builder mergeDevice(Device device) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeDevice(device);
                return this;
            }

            public Builder mergeImpInteraction(ImpressionInteraction impressionInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeImpInteraction(impressionInteraction);
                return this;
            }

            public Builder mergeNetwork(Network network) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeNetwork(network);
                return this;
            }

            public Builder mergeSdk(MolocoSDK molocoSDK) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).mergeSdk(molocoSDK);
                return this;
            }

            public Builder setAdvertisingId(String str) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setAdvertisingId(str);
                return this;
            }

            public Builder setAdvertisingIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setAdvertisingIdBytes(lVar);
                return this;
            }

            public Builder setApp(App app) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setApp(app);
                return this;
            }

            public Builder setAppBackgroundingInteraction(AppBackgroundingInteraction appBackgroundingInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setAppBackgroundingInteraction(appBackgroundingInteraction);
                return this;
            }

            public Builder setAppForegroundingInteraction(AppForegroundingInteraction appForegroundingInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setAppForegroundingInteraction(appForegroundingInteraction);
                return this;
            }

            public Builder setClickInteraction(ClickInteraction clickInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setClickInteraction(clickInteraction);
                return this;
            }

            public Builder setClientTimestamp(long j11) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setClientTimestamp(j11);
                return this;
            }

            public Builder setDevice(Device device) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setDevice(device);
                return this;
            }

            public Builder setImpInteraction(ImpressionInteraction impressionInteraction) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setImpInteraction(impressionInteraction);
                return this;
            }

            public Builder setMref(String str) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setMref(str);
                return this;
            }

            public Builder setMrefBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setMrefBytes(lVar);
                return this;
            }

            public Builder setNetwork(Network network) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setNetwork(network);
                return this;
            }

            public Builder setSdk(MolocoSDK molocoSDK) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setSdk(molocoSDK);
                return this;
            }

            private Builder() {
                super(UserAdInteractionExt.DEFAULT_INSTANCE);
            }

            public Builder setApp(App.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setApp((App) builder.build());
                return this;
            }

            public Builder setAppBackgroundingInteraction(AppBackgroundingInteraction.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setAppBackgroundingInteraction((AppBackgroundingInteraction) builder.build());
                return this;
            }

            public Builder setAppForegroundingInteraction(AppForegroundingInteraction.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setAppForegroundingInteraction((AppForegroundingInteraction) builder.build());
                return this;
            }

            public Builder setClickInteraction(ClickInteraction.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setClickInteraction((ClickInteraction) builder.build());
                return this;
            }

            public Builder setDevice(Device.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setDevice((Device) builder.build());
                return this;
            }

            public Builder setImpInteraction(ImpressionInteraction.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setImpInteraction((ImpressionInteraction) builder.build());
                return this;
            }

            public Builder setNetwork(Network.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setNetwork((Network) builder.build());
                return this;
            }

            public Builder setSdk(MolocoSDK.Builder builder) {
                copyOnWrite();
                ((UserAdInteractionExt) this.instance).setSdk((MolocoSDK) builder.build());
                return this;
            }
        }

        public static final class Button extends n0 implements ButtonOrBuilder {
            private static final Button DEFAULT_INSTANCE;
            private static volatile v1 PARSER = null;
            public static final int POS_FIELD_NUMBER = 2;
            public static final int SIZE_FIELD_NUMBER = 3;
            public static final int TYPE_FIELD_NUMBER = 1;
            private Position pos_;
            private Size size_;
            private int type_;

            public static final class Builder extends f0 implements ButtonOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearPos() {
                    copyOnWrite();
                    ((Button) this.instance).clearPos();
                    return this;
                }

                public Builder clearSize() {
                    copyOnWrite();
                    ((Button) this.instance).clearSize();
                    return this;
                }

                public Builder clearType() {
                    copyOnWrite();
                    ((Button) this.instance).clearType();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
                public Position getPos() {
                    return ((Button) this.instance).getPos();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
                public Size getSize() {
                    return ((Button) this.instance).getSize();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
                public Type getType() {
                    return ((Button) this.instance).getType();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
                public int getTypeValue() {
                    return ((Button) this.instance).getTypeValue();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
                public boolean hasPos() {
                    return ((Button) this.instance).hasPos();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
                public boolean hasSize() {
                    return ((Button) this.instance).hasSize();
                }

                public Builder mergePos(Position position) {
                    copyOnWrite();
                    ((Button) this.instance).mergePos(position);
                    return this;
                }

                public Builder mergeSize(Size size) {
                    copyOnWrite();
                    ((Button) this.instance).mergeSize(size);
                    return this;
                }

                public Builder setPos(Position position) {
                    copyOnWrite();
                    ((Button) this.instance).setPos(position);
                    return this;
                }

                public Builder setSize(Size size) {
                    copyOnWrite();
                    ((Button) this.instance).setSize(size);
                    return this;
                }

                public Builder setType(Type type) {
                    copyOnWrite();
                    ((Button) this.instance).setType(type);
                    return this;
                }

                public Builder setTypeValue(int i5) {
                    copyOnWrite();
                    ((Button) this.instance).setTypeValue(i5);
                    return this;
                }

                private Builder() {
                    super(Button.DEFAULT_INSTANCE);
                }

                public Builder setPos(Position.Builder builder) {
                    copyOnWrite();
                    ((Button) this.instance).setPos((Position) builder.build());
                    return this;
                }

                public Builder setSize(Size.Builder builder) {
                    copyOnWrite();
                    ((Button) this.instance).setSize((Size) builder.build());
                    return this;
                }
            }

            public enum Type implements r0 {
                NONE(0),
                CLOSE(1),
                SKIP(2),
                MUTE(3),
                UNMUTE(4),
                CTA(5),
                REPLAY(6),
                DEC_SKIP(7),
                AD_BADGE(8),
                UNRECOGNIZED(-1);

                public static final int AD_BADGE_VALUE = 8;
                public static final int CLOSE_VALUE = 1;
                public static final int CTA_VALUE = 5;
                public static final int DEC_SKIP_VALUE = 7;
                public static final int MUTE_VALUE = 3;
                public static final int NONE_VALUE = 0;
                public static final int REPLAY_VALUE = 6;
                public static final int SKIP_VALUE = 2;
                public static final int UNMUTE_VALUE = 4;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.UserIntent.UserAdInteractionExt.Button.Type.1
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
                    switch (i5) {
                        case 0:
                            return NONE;
                        case 1:
                            return CLOSE;
                        case 2:
                            return SKIP;
                        case 3:
                            return MUTE;
                        case 4:
                            return UNMUTE;
                        case 5:
                            return CTA;
                        case 6:
                            return REPLAY;
                        case 7:
                            return DEC_SKIP;
                        case 8:
                            return AD_BADGE;
                        default:
                            return null;
                    }
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
                Button button = new Button();
                DEFAULT_INSTANCE = button;
                n0.registerDefaultInstance(Button.class, button);
            }

            private Button() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearPos() {
                this.pos_ = null;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearSize() {
                this.size_ = null;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearType() {
                this.type_ = 0;
            }

            public static Button getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergePos(Position position) {
                position.getClass();
                Position position2 = this.pos_;
                if (position2 == null || position2 == Position.getDefaultInstance()) {
                    this.pos_ = position;
                } else {
                    this.pos_ = (Position) ((Position.Builder) Position.newBuilder(this.pos_).mergeFrom((n0) position)).buildPartial();
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeSize(Size size) {
                size.getClass();
                Size size2 = this.size_;
                if (size2 == null || size2 == Size.getDefaultInstance()) {
                    this.size_ = size;
                } else {
                    this.size_ = (Size) ((Size.Builder) Size.newBuilder(this.size_).mergeFrom((n0) size)).buildPartial();
                }
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static Button parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Button) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Button parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setPos(Position position) {
                position.getClass();
                this.pos_ = position;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setSize(Size size) {
                size.getClass();
                this.size_ = size;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\f\u0002\t\u0003\t", new Object[]{"type_", "pos_", "size_"});
                    case 3:
                        return new Button();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (Button.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
            public Position getPos() {
                Position position = this.pos_;
                return position == null ? Position.getDefaultInstance() : position;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
            public Size getSize() {
                Size size = this.size_;
                return size == null ? Size.getDefaultInstance() : size;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
            public Type getType() {
                Type typeForNumber = Type.forNumber(this.type_);
                return typeForNumber == null ? Type.UNRECOGNIZED : typeForNumber;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
            public int getTypeValue() {
                return this.type_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
            public boolean hasPos() {
                return this.pos_ != null;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ButtonOrBuilder
            public boolean hasSize() {
                return this.size_ != null;
            }

            public static Builder newBuilder(Button button) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(button);
            }

            public static Button parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (Button) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Button parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static Button parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static Button parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static Button parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static Button parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static Button parseFrom(InputStream inputStream) throws IOException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Button parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Button parseFrom(p pVar) throws IOException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static Button parseFrom(p pVar, y yVar) throws IOException {
                return (Button) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface ButtonOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            Position getPos();

            Size getSize();

            Button.Type getType();

            int getTypeValue();

            boolean hasPos();

            boolean hasSize();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class ClickInteraction extends n0 implements ClickInteractionOrBuilder {
            public static final int BUTTONS_FIELD_NUMBER = 5;
            public static final int CLICK_POS_FIELD_NUMBER = 1;
            private static final ClickInteraction DEFAULT_INSTANCE;
            private static volatile v1 PARSER = null;
            public static final int SCREEN_SIZE_FIELD_NUMBER = 2;
            public static final int VIEW_POS_FIELD_NUMBER = 3;
            public static final int VIEW_SIZE_FIELD_NUMBER = 4;
            private z0 buttons_ = n0.emptyProtobufList();
            private Position clickPos_;
            private Size screenSize_;
            private Position viewPos_;
            private Size viewSize_;

            public static final class Builder extends f0 implements ClickInteractionOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder addAllButtons(Iterable<? extends Button> iterable) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).addAllButtons(iterable);
                    return this;
                }

                public Builder addButtons(Button button) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).addButtons(button);
                    return this;
                }

                public Builder clearButtons() {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).clearButtons();
                    return this;
                }

                public Builder clearClickPos() {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).clearClickPos();
                    return this;
                }

                public Builder clearScreenSize() {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).clearScreenSize();
                    return this;
                }

                public Builder clearViewPos() {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).clearViewPos();
                    return this;
                }

                public Builder clearViewSize() {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).clearViewSize();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public Button getButtons(int i5) {
                    return ((ClickInteraction) this.instance).getButtons(i5);
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public int getButtonsCount() {
                    return ((ClickInteraction) this.instance).getButtonsCount();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public List<Button> getButtonsList() {
                    return Collections.unmodifiableList(((ClickInteraction) this.instance).getButtonsList());
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public Position getClickPos() {
                    return ((ClickInteraction) this.instance).getClickPos();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public Size getScreenSize() {
                    return ((ClickInteraction) this.instance).getScreenSize();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public Position getViewPos() {
                    return ((ClickInteraction) this.instance).getViewPos();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public Size getViewSize() {
                    return ((ClickInteraction) this.instance).getViewSize();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public boolean hasClickPos() {
                    return ((ClickInteraction) this.instance).hasClickPos();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public boolean hasScreenSize() {
                    return ((ClickInteraction) this.instance).hasScreenSize();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public boolean hasViewPos() {
                    return ((ClickInteraction) this.instance).hasViewPos();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
                public boolean hasViewSize() {
                    return ((ClickInteraction) this.instance).hasViewSize();
                }

                public Builder mergeClickPos(Position position) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).mergeClickPos(position);
                    return this;
                }

                public Builder mergeScreenSize(Size size) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).mergeScreenSize(size);
                    return this;
                }

                public Builder mergeViewPos(Position position) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).mergeViewPos(position);
                    return this;
                }

                public Builder mergeViewSize(Size size) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).mergeViewSize(size);
                    return this;
                }

                public Builder removeButtons(int i5) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).removeButtons(i5);
                    return this;
                }

                public Builder setButtons(int i5, Button button) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setButtons(i5, button);
                    return this;
                }

                public Builder setClickPos(Position position) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setClickPos(position);
                    return this;
                }

                public Builder setScreenSize(Size size) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setScreenSize(size);
                    return this;
                }

                public Builder setViewPos(Position position) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setViewPos(position);
                    return this;
                }

                public Builder setViewSize(Size size) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setViewSize(size);
                    return this;
                }

                private Builder() {
                    super(ClickInteraction.DEFAULT_INSTANCE);
                }

                public Builder addButtons(int i5, Button button) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).addButtons(i5, button);
                    return this;
                }

                public Builder setButtons(int i5, Button.Builder builder) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setButtons(i5, (Button) builder.build());
                    return this;
                }

                public Builder setClickPos(Position.Builder builder) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setClickPos((Position) builder.build());
                    return this;
                }

                public Builder setScreenSize(Size.Builder builder) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setScreenSize((Size) builder.build());
                    return this;
                }

                public Builder setViewPos(Position.Builder builder) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setViewPos((Position) builder.build());
                    return this;
                }

                public Builder setViewSize(Size.Builder builder) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).setViewSize((Size) builder.build());
                    return this;
                }

                public Builder addButtons(Button.Builder builder) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).addButtons((Button) builder.build());
                    return this;
                }

                public Builder addButtons(int i5, Button.Builder builder) {
                    copyOnWrite();
                    ((ClickInteraction) this.instance).addButtons(i5, (Button) builder.build());
                    return this;
                }
            }

            static {
                ClickInteraction clickInteraction = new ClickInteraction();
                DEFAULT_INSTANCE = clickInteraction;
                n0.registerDefaultInstance(ClickInteraction.class, clickInteraction);
            }

            private ClickInteraction() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addAllButtons(Iterable<? extends Button> iterable) {
                ensureButtonsIsMutable();
                c.addAll(iterable, this.buttons_);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addButtons(Button button) {
                button.getClass();
                ensureButtonsIsMutable();
                this.buttons_.add(button);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearButtons() {
                this.buttons_ = n0.emptyProtobufList();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearClickPos() {
                this.clickPos_ = null;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearScreenSize() {
                this.screenSize_ = null;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearViewPos() {
                this.viewPos_ = null;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearViewSize() {
                this.viewSize_ = null;
            }

            private void ensureButtonsIsMutable() {
                z0 z0Var = this.buttons_;
                if (((d) z0Var).f34834a) {
                    return;
                }
                this.buttons_ = n0.mutableCopy(z0Var);
            }

            public static ClickInteraction getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeClickPos(Position position) {
                position.getClass();
                Position position2 = this.clickPos_;
                if (position2 == null || position2 == Position.getDefaultInstance()) {
                    this.clickPos_ = position;
                } else {
                    this.clickPos_ = (Position) ((Position.Builder) Position.newBuilder(this.clickPos_).mergeFrom((n0) position)).buildPartial();
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeScreenSize(Size size) {
                size.getClass();
                Size size2 = this.screenSize_;
                if (size2 == null || size2 == Size.getDefaultInstance()) {
                    this.screenSize_ = size;
                } else {
                    this.screenSize_ = (Size) ((Size.Builder) Size.newBuilder(this.screenSize_).mergeFrom((n0) size)).buildPartial();
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeViewPos(Position position) {
                position.getClass();
                Position position2 = this.viewPos_;
                if (position2 == null || position2 == Position.getDefaultInstance()) {
                    this.viewPos_ = position;
                } else {
                    this.viewPos_ = (Position) ((Position.Builder) Position.newBuilder(this.viewPos_).mergeFrom((n0) position)).buildPartial();
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void mergeViewSize(Size size) {
                size.getClass();
                Size size2 = this.viewSize_;
                if (size2 == null || size2 == Size.getDefaultInstance()) {
                    this.viewSize_ = size;
                } else {
                    this.viewSize_ = (Size) ((Size.Builder) Size.newBuilder(this.viewSize_).mergeFrom((n0) size)).buildPartial();
                }
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ClickInteraction parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ClickInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ClickInteraction parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void removeButtons(int i5) {
                ensureButtonsIsMutable();
                this.buttons_.remove(i5);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setButtons(int i5, Button button) {
                button.getClass();
                ensureButtonsIsMutable();
                this.buttons_.set(i5, button);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setClickPos(Position position) {
                position.getClass();
                this.clickPos_ = position;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setScreenSize(Size size) {
                size.getClass();
                this.screenSize_ = size;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setViewPos(Position position) {
                position.getClass();
                this.viewPos_ = position;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setViewSize(Size size) {
                size.getClass();
                this.viewSize_ = size;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0005\u0000\u0000\u0001\u0005\u0005\u0000\u0001\u0000\u0001\t\u0002\t\u0003\t\u0004\t\u0005\u001b", new Object[]{"clickPos_", "screenSize_", "viewPos_", "viewSize_", "buttons_", Button.class});
                    case 3:
                        return new ClickInteraction();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ClickInteraction.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public Button getButtons(int i5) {
                return (Button) this.buttons_.get(i5);
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public int getButtonsCount() {
                return this.buttons_.size();
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public List<Button> getButtonsList() {
                return this.buttons_;
            }

            public ButtonOrBuilder getButtonsOrBuilder(int i5) {
                return (ButtonOrBuilder) this.buttons_.get(i5);
            }

            public List<? extends ButtonOrBuilder> getButtonsOrBuilderList() {
                return this.buttons_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public Position getClickPos() {
                Position position = this.clickPos_;
                return position == null ? Position.getDefaultInstance() : position;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public Size getScreenSize() {
                Size size = this.screenSize_;
                return size == null ? Size.getDefaultInstance() : size;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public Position getViewPos() {
                Position position = this.viewPos_;
                return position == null ? Position.getDefaultInstance() : position;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public Size getViewSize() {
                Size size = this.viewSize_;
                return size == null ? Size.getDefaultInstance() : size;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public boolean hasClickPos() {
                return this.clickPos_ != null;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public boolean hasScreenSize() {
                return this.screenSize_ != null;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public boolean hasViewPos() {
                return this.viewPos_ != null;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.ClickInteractionOrBuilder
            public boolean hasViewSize() {
                return this.viewSize_ != null;
            }

            public static Builder newBuilder(ClickInteraction clickInteraction) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(clickInteraction);
            }

            public static ClickInteraction parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ClickInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ClickInteraction parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ClickInteraction parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addButtons(int i5, Button button) {
                button.getClass();
                ensureButtonsIsMutable();
                this.buttons_.add(i5, button);
            }

            public static ClickInteraction parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ClickInteraction parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ClickInteraction parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ClickInteraction parseFrom(InputStream inputStream) throws IOException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ClickInteraction parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ClickInteraction parseFrom(p pVar) throws IOException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ClickInteraction parseFrom(p pVar, y yVar) throws IOException {
                return (ClickInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface ClickInteractionOrBuilder extends p1 {
            Button getButtons(int i5);

            int getButtonsCount();

            List<Button> getButtonsList();

            Position getClickPos();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            Size getScreenSize();

            Position getViewPos();

            Size getViewSize();

            boolean hasClickPos();

            boolean hasScreenSize();

            boolean hasViewPos();

            boolean hasViewSize();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Device extends n0 implements DeviceOrBuilder {
            private static final Device DEFAULT_INSTANCE;
            public static final int MODEL_FIELD_NUMBER = 3;
            public static final int OS_FIELD_NUMBER = 1;
            public static final int OS_VER_FIELD_NUMBER = 2;
            private static volatile v1 PARSER = null;
            public static final int SCREEN_SCALE_FIELD_NUMBER = 4;
            private int os_;
            private float screenScale_;
            private String osVer_ = b.f42142b;
            private String model_ = b.f42142b;

            public static final class Builder extends f0 implements DeviceOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearModel() {
                    copyOnWrite();
                    ((Device) this.instance).clearModel();
                    return this;
                }

                public Builder clearOs() {
                    copyOnWrite();
                    ((Device) this.instance).clearOs();
                    return this;
                }

                public Builder clearOsVer() {
                    copyOnWrite();
                    ((Device) this.instance).clearOsVer();
                    return this;
                }

                public Builder clearScreenScale() {
                    copyOnWrite();
                    ((Device) this.instance).clearScreenScale();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
                public String getModel() {
                    return ((Device) this.instance).getModel();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
                public l getModelBytes() {
                    return ((Device) this.instance).getModelBytes();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
                public OsType getOs() {
                    return ((Device) this.instance).getOs();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
                public int getOsValue() {
                    return ((Device) this.instance).getOsValue();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
                public String getOsVer() {
                    return ((Device) this.instance).getOsVer();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
                public l getOsVerBytes() {
                    return ((Device) this.instance).getOsVerBytes();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
                public float getScreenScale() {
                    return ((Device) this.instance).getScreenScale();
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

                public Builder setOs(OsType osType) {
                    copyOnWrite();
                    ((Device) this.instance).setOs(osType);
                    return this;
                }

                public Builder setOsValue(int i5) {
                    copyOnWrite();
                    ((Device) this.instance).setOsValue(i5);
                    return this;
                }

                public Builder setOsVer(String str) {
                    copyOnWrite();
                    ((Device) this.instance).setOsVer(str);
                    return this;
                }

                public Builder setOsVerBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Device) this.instance).setOsVerBytes(lVar);
                    return this;
                }

                public Builder setScreenScale(float f11) {
                    copyOnWrite();
                    ((Device) this.instance).setScreenScale(f11);
                    return this;
                }

                private Builder() {
                    super(Device.DEFAULT_INSTANCE);
                }
            }

            public enum OsType implements r0 {
                UNKNOWN(0),
                ANDROID(1),
                IOS(2),
                UNRECOGNIZED(-1);

                public static final int ANDROID_VALUE = 1;
                public static final int IOS_VALUE = 2;
                public static final int UNKNOWN_VALUE = 0;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.UserIntent.UserAdInteractionExt.Device.OsType.1
                    @Override // com.google.protobuf.s0
                    public OsType findValueByNumber(int i5) {
                        return OsType.forNumber(i5);
                    }
                };
                private final int value;

                public static final class OsTypeVerifier implements t0 {
                    static final t0 INSTANCE = new OsTypeVerifier();

                    private OsTypeVerifier() {
                    }

                    @Override // com.google.protobuf.t0
                    public boolean isInRange(int i5) {
                        return OsType.forNumber(i5) != null;
                    }
                }

                OsType(int i5) {
                    this.value = i5;
                }

                public static OsType forNumber(int i5) {
                    if (i5 == 0) {
                        return UNKNOWN;
                    }
                    if (i5 == 1) {
                        return ANDROID;
                    }
                    if (i5 != 2) {
                        return null;
                    }
                    return IOS;
                }

                public static s0 internalGetValueMap() {
                    return internalValueMap;
                }

                public static t0 internalGetVerifier() {
                    return OsTypeVerifier.INSTANCE;
                }

                @Override // com.google.protobuf.r0
                public final int getNumber() {
                    if (this != UNRECOGNIZED) {
                        return this.value;
                    }
                    throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                }

                @Deprecated
                public static OsType valueOf(int i5) {
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
            public void clearModel() {
                this.model_ = getDefaultInstance().getModel();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearOs() {
                this.os_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearOsVer() {
                this.osVer_ = getDefaultInstance().getOsVer();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearScreenScale() {
                this.screenScale_ = 0.0f;
            }

            public static Device getDefaultInstance() {
                return DEFAULT_INSTANCE;
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
            public void setModel(String str) {
                str.getClass();
                this.model_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setModelBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.model_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOs(OsType osType) {
                this.os_ = osType.getNumber();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOsValue(int i5) {
                this.os_ = i5;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOsVer(String str) {
                str.getClass();
                this.osVer_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setOsVerBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.osVer_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setScreenScale(float f11) {
                this.screenScale_ = f11;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\f\u0002Ȉ\u0003Ȉ\u0004\u0001", new Object[]{"os_", "osVer_", "model_", "screenScale_"});
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
            public String getModel() {
                return this.model_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
            public l getModelBytes() {
                return l.f(this.model_);
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
            public OsType getOs() {
                OsType osTypeForNumber = OsType.forNumber(this.os_);
                return osTypeForNumber == null ? OsType.UNRECOGNIZED : osTypeForNumber;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
            public int getOsValue() {
                return this.os_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
            public String getOsVer() {
                return this.osVer_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
            public l getOsVerBytes() {
                return l.f(this.osVer_);
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.DeviceOrBuilder
            public float getScreenScale() {
                return this.screenScale_;
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
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getModel();

            l getModelBytes();

            Device.OsType getOs();

            int getOsValue();

            String getOsVer();

            l getOsVerBytes();

            float getScreenScale();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class ImpressionInteraction extends n0 implements ImpressionInteractionOrBuilder {
            private static final ImpressionInteraction DEFAULT_INSTANCE;
            private static volatile v1 PARSER;

            public static final class Builder extends f0 implements ImpressionInteractionOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                private Builder() {
                    super(ImpressionInteraction.DEFAULT_INSTANCE);
                }
            }

            static {
                ImpressionInteraction impressionInteraction = new ImpressionInteraction();
                DEFAULT_INSTANCE = impressionInteraction;
                n0.registerDefaultInstance(ImpressionInteraction.class, impressionInteraction);
            }

            private ImpressionInteraction() {
            }

            public static ImpressionInteraction getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ImpressionInteraction parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ImpressionInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ImpressionInteraction parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
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
                        return new ImpressionInteraction();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ImpressionInteraction.class) {
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

            public static Builder newBuilder(ImpressionInteraction impressionInteraction) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(impressionInteraction);
            }

            public static ImpressionInteraction parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ImpressionInteraction) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ImpressionInteraction parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ImpressionInteraction parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static ImpressionInteraction parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ImpressionInteraction parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ImpressionInteraction parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ImpressionInteraction parseFrom(InputStream inputStream) throws IOException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ImpressionInteraction parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ImpressionInteraction parseFrom(p pVar) throws IOException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ImpressionInteraction parseFrom(p pVar, y yVar) throws IOException {
                return (ImpressionInteraction) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface ImpressionInteractionOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public enum InfoExtCase {
            IMP_INTERACTION(100),
            CLICK_INTERACTION(101),
            APP_FOREGROUNDING_INTERACTION(102),
            APP_BACKGROUNDING_INTERACTION(103),
            INFOEXT_NOT_SET(0);

            private final int value;

            InfoExtCase(int i5) {
                this.value = i5;
            }

            public static InfoExtCase forNumber(int i5) {
                if (i5 == 0) {
                    return INFOEXT_NOT_SET;
                }
                switch (i5) {
                    case 100:
                        return IMP_INTERACTION;
                    case 101:
                        return CLICK_INTERACTION;
                    case 102:
                        return APP_FOREGROUNDING_INTERACTION;
                    case 103:
                        return APP_BACKGROUNDING_INTERACTION;
                    default:
                        return null;
                }
            }

            public int getNumber() {
                return this.value;
            }

            @Deprecated
            public static InfoExtCase valueOf(int i5) {
                return forNumber(i5);
            }
        }

        public static final class MolocoSDK extends n0 implements MolocoSDKOrBuilder {
            public static final int ADAPTER_VER_FIELD_NUMBER = 2;
            public static final int CORE_VER_FIELD_NUMBER = 1;
            private static final MolocoSDK DEFAULT_INSTANCE;
            private static volatile v1 PARSER;
            private String coreVer_ = b.f42142b;
            private String adapterVer_ = b.f42142b;

            public static final class Builder extends f0 implements MolocoSDKOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearAdapterVer() {
                    copyOnWrite();
                    ((MolocoSDK) this.instance).clearAdapterVer();
                    return this;
                }

                public Builder clearCoreVer() {
                    copyOnWrite();
                    ((MolocoSDK) this.instance).clearCoreVer();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
                public String getAdapterVer() {
                    return ((MolocoSDK) this.instance).getAdapterVer();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
                public l getAdapterVerBytes() {
                    return ((MolocoSDK) this.instance).getAdapterVerBytes();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
                public String getCoreVer() {
                    return ((MolocoSDK) this.instance).getCoreVer();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
                public l getCoreVerBytes() {
                    return ((MolocoSDK) this.instance).getCoreVerBytes();
                }

                public Builder setAdapterVer(String str) {
                    copyOnWrite();
                    ((MolocoSDK) this.instance).setAdapterVer(str);
                    return this;
                }

                public Builder setAdapterVerBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((MolocoSDK) this.instance).setAdapterVerBytes(lVar);
                    return this;
                }

                public Builder setCoreVer(String str) {
                    copyOnWrite();
                    ((MolocoSDK) this.instance).setCoreVer(str);
                    return this;
                }

                public Builder setCoreVerBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((MolocoSDK) this.instance).setCoreVerBytes(lVar);
                    return this;
                }

                private Builder() {
                    super(MolocoSDK.DEFAULT_INSTANCE);
                }
            }

            static {
                MolocoSDK molocoSDK = new MolocoSDK();
                DEFAULT_INSTANCE = molocoSDK;
                n0.registerDefaultInstance(MolocoSDK.class, molocoSDK);
            }

            private MolocoSDK() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearAdapterVer() {
                this.adapterVer_ = getDefaultInstance().getAdapterVer();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCoreVer() {
                this.coreVer_ = getDefaultInstance().getCoreVer();
            }

            public static MolocoSDK getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static MolocoSDK parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (MolocoSDK) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static MolocoSDK parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAdapterVer(String str) {
                str.getClass();
                this.adapterVer_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setAdapterVerBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.adapterVer_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCoreVer(String str) {
                str.getClass();
                this.coreVer_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCoreVerBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.coreVer_ = lVar.o();
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ", new Object[]{"coreVer_", "adapterVer_"});
                    case 3:
                        return new MolocoSDK();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (MolocoSDK.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
            public String getAdapterVer() {
                return this.adapterVer_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
            public l getAdapterVerBytes() {
                return l.f(this.adapterVer_);
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
            public String getCoreVer() {
                return this.coreVer_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.MolocoSDKOrBuilder
            public l getCoreVerBytes() {
                return l.f(this.coreVer_);
            }

            public static Builder newBuilder(MolocoSDK molocoSDK) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(molocoSDK);
            }

            public static MolocoSDK parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (MolocoSDK) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static MolocoSDK parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static MolocoSDK parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static MolocoSDK parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static MolocoSDK parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static MolocoSDK parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static MolocoSDK parseFrom(InputStream inputStream) throws IOException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static MolocoSDK parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static MolocoSDK parseFrom(p pVar) throws IOException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static MolocoSDK parseFrom(p pVar, y yVar) throws IOException {
                return (MolocoSDK) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface MolocoSDKOrBuilder extends p1 {
            String getAdapterVer();

            l getAdapterVerBytes();

            String getCoreVer();

            l getCoreVerBytes();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Network extends n0 implements NetworkOrBuilder {
            public static final int CARRIER_FIELD_NUMBER = 2;
            public static final int CONNECTION_TYPE_FIELD_NUMBER = 1;
            private static final Network DEFAULT_INSTANCE;
            private static volatile v1 PARSER;
            private String carrier_ = b.f42142b;
            private int connectionType_;

            public static final class Builder extends f0 implements NetworkOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearCarrier() {
                    copyOnWrite();
                    ((Network) this.instance).clearCarrier();
                    return this;
                }

                public Builder clearConnectionType() {
                    copyOnWrite();
                    ((Network) this.instance).clearConnectionType();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
                public String getCarrier() {
                    return ((Network) this.instance).getCarrier();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
                public l getCarrierBytes() {
                    return ((Network) this.instance).getCarrierBytes();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
                public ConnectionType getConnectionType() {
                    return ((Network) this.instance).getConnectionType();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
                public int getConnectionTypeValue() {
                    return ((Network) this.instance).getConnectionTypeValue();
                }

                public Builder setCarrier(String str) {
                    copyOnWrite();
                    ((Network) this.instance).setCarrier(str);
                    return this;
                }

                public Builder setCarrierBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((Network) this.instance).setCarrierBytes(lVar);
                    return this;
                }

                public Builder setConnectionType(ConnectionType connectionType) {
                    copyOnWrite();
                    ((Network) this.instance).setConnectionType(connectionType);
                    return this;
                }

                public Builder setConnectionTypeValue(int i5) {
                    copyOnWrite();
                    ((Network) this.instance).setConnectionTypeValue(i5);
                    return this;
                }

                private Builder() {
                    super(Network.DEFAULT_INSTANCE);
                }
            }

            public enum ConnectionType implements r0 {
                UNKNOWN(0),
                WIFI(1),
                CELLULAR(2),
                UNRECOGNIZED(-1);

                public static final int CELLULAR_VALUE = 2;
                public static final int UNKNOWN_VALUE = 0;
                public static final int WIFI_VALUE = 1;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.UserIntent.UserAdInteractionExt.Network.ConnectionType.1
                    @Override // com.google.protobuf.s0
                    public ConnectionType findValueByNumber(int i5) {
                        return ConnectionType.forNumber(i5);
                    }
                };
                private final int value;

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
                    if (i5 != 2) {
                        return null;
                    }
                    return CELLULAR;
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
                Network network = new Network();
                DEFAULT_INSTANCE = network;
                n0.registerDefaultInstance(Network.class, network);
            }

            private Network() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCarrier() {
                this.carrier_ = getDefaultInstance().getCarrier();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearConnectionType() {
                this.connectionType_ = 0;
            }

            public static Network getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static Network parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Network) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Network parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCarrier(String str) {
                str.getClass();
                this.carrier_ = str;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCarrierBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                this.carrier_ = lVar.o();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setConnectionType(ConnectionType connectionType) {
                this.connectionType_ = connectionType.getNumber();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setConnectionTypeValue(int i5) {
                this.connectionType_ = i5;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\f\u0002Ȉ", new Object[]{"connectionType_", "carrier_"});
                    case 3:
                        return new Network();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (Network.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
            public String getCarrier() {
                return this.carrier_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
            public l getCarrierBytes() {
                return l.f(this.carrier_);
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
            public ConnectionType getConnectionType() {
                ConnectionType connectionTypeForNumber = ConnectionType.forNumber(this.connectionType_);
                return connectionTypeForNumber == null ? ConnectionType.UNRECOGNIZED : connectionTypeForNumber;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.NetworkOrBuilder
            public int getConnectionTypeValue() {
                return this.connectionType_;
            }

            public static Builder newBuilder(Network network) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(network);
            }

            public static Network parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (Network) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Network parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static Network parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static Network parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static Network parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static Network parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static Network parseFrom(InputStream inputStream) throws IOException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Network parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Network parseFrom(p pVar) throws IOException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static Network parseFrom(p pVar, y yVar) throws IOException {
                return (Network) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface NetworkOrBuilder extends p1 {
            String getCarrier();

            l getCarrierBytes();

            Network.ConnectionType getConnectionType();

            int getConnectionTypeValue();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Position extends n0 implements PositionOrBuilder {
            private static final Position DEFAULT_INSTANCE;
            private static volatile v1 PARSER = null;
            public static final int X_FIELD_NUMBER = 1;
            public static final int Y_FIELD_NUMBER = 2;
            private float x_;
            private float y_;

            public static final class Builder extends f0 implements PositionOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearX() {
                    copyOnWrite();
                    ((Position) this.instance).clearX();
                    return this;
                }

                public Builder clearY() {
                    copyOnWrite();
                    ((Position) this.instance).clearY();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.PositionOrBuilder
                public float getX() {
                    return ((Position) this.instance).getX();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.PositionOrBuilder
                public float getY() {
                    return ((Position) this.instance).getY();
                }

                public Builder setX(float f11) {
                    copyOnWrite();
                    ((Position) this.instance).setX(f11);
                    return this;
                }

                public Builder setY(float f11) {
                    copyOnWrite();
                    ((Position) this.instance).setY(f11);
                    return this;
                }

                private Builder() {
                    super(Position.DEFAULT_INSTANCE);
                }
            }

            static {
                Position position = new Position();
                DEFAULT_INSTANCE = position;
                n0.registerDefaultInstance(Position.class, position);
            }

            private Position() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearX() {
                this.x_ = 0.0f;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearY() {
                this.y_ = 0.0f;
            }

            public static Position getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static Position parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Position) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Position parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setX(float f11) {
                this.x_ = f11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setY(float f11) {
                this.y_ = f11;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0001\u0002\u0001", new Object[]{"x_", "y_"});
                    case 3:
                        return new Position();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (Position.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.PositionOrBuilder
            public float getX() {
                return this.x_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.PositionOrBuilder
            public float getY() {
                return this.y_;
            }

            public static Builder newBuilder(Position position) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(position);
            }

            public static Position parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (Position) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Position parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static Position parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static Position parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static Position parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static Position parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static Position parseFrom(InputStream inputStream) throws IOException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Position parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Position parseFrom(p pVar) throws IOException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static Position parseFrom(p pVar, y yVar) throws IOException {
                return (Position) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface PositionOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            float getX();

            float getY();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class Size extends n0 implements SizeOrBuilder {
            private static final Size DEFAULT_INSTANCE;
            public static final int H_FIELD_NUMBER = 2;
            private static volatile v1 PARSER = null;
            public static final int W_FIELD_NUMBER = 1;
            private float h_;
            private float w_;

            public static final class Builder extends f0 implements SizeOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearH() {
                    copyOnWrite();
                    ((Size) this.instance).clearH();
                    return this;
                }

                public Builder clearW() {
                    copyOnWrite();
                    ((Size) this.instance).clearW();
                    return this;
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.SizeOrBuilder
                public float getH() {
                    return ((Size) this.instance).getH();
                }

                @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.SizeOrBuilder
                public float getW() {
                    return ((Size) this.instance).getW();
                }

                public Builder setH(float f11) {
                    copyOnWrite();
                    ((Size) this.instance).setH(f11);
                    return this;
                }

                public Builder setW(float f11) {
                    copyOnWrite();
                    ((Size) this.instance).setW(f11);
                    return this;
                }

                private Builder() {
                    super(Size.DEFAULT_INSTANCE);
                }
            }

            static {
                Size size = new Size();
                DEFAULT_INSTANCE = size;
                n0.registerDefaultInstance(Size.class, size);
            }

            private Size() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearH() {
                this.h_ = 0.0f;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearW() {
                this.w_ = 0.0f;
            }

            public static Size getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static Size parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (Size) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Size parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setH(float f11) {
                this.h_ = f11;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setW(float f11) {
                this.w_ = f11;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0001\u0002\u0001", new Object[]{"w_", "h_"});
                    case 3:
                        return new Size();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (Size.class) {
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

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.SizeOrBuilder
            public float getH() {
                return this.h_;
            }

            @Override // com.moloco.sdk.UserIntent.UserAdInteractionExt.SizeOrBuilder
            public float getW() {
                return this.w_;
            }

            public static Builder newBuilder(Size size) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(size);
            }

            public static Size parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (Size) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Size parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static Size parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static Size parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static Size parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static Size parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static Size parseFrom(InputStream inputStream) throws IOException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static Size parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static Size parseFrom(p pVar) throws IOException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static Size parseFrom(p pVar, y yVar) throws IOException {
                return (Size) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface SizeOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            float getH();

            float getW();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        static {
            UserAdInteractionExt userAdInteractionExt = new UserAdInteractionExt();
            DEFAULT_INSTANCE = userAdInteractionExt;
            n0.registerDefaultInstance(UserAdInteractionExt.class, userAdInteractionExt);
        }

        private UserAdInteractionExt() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAdvertisingId() {
            this.advertisingId_ = getDefaultInstance().getAdvertisingId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearApp() {
            this.app_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAppBackgroundingInteraction() {
            if (this.infoExtCase_ == 103) {
                this.infoExtCase_ = 0;
                this.infoExt_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAppForegroundingInteraction() {
            if (this.infoExtCase_ == 102) {
                this.infoExtCase_ = 0;
                this.infoExt_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearClickInteraction() {
            if (this.infoExtCase_ == 101) {
                this.infoExtCase_ = 0;
                this.infoExt_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearClientTimestamp() {
            this.clientTimestamp_ = 0L;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearDevice() {
            this.device_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearImpInteraction() {
            if (this.infoExtCase_ == 100) {
                this.infoExtCase_ = 0;
                this.infoExt_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearInfoExt() {
            this.infoExtCase_ = 0;
            this.infoExt_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearMref() {
            this.mref_ = getDefaultInstance().getMref();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearNetwork() {
            this.network_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSdk() {
            this.sdk_ = null;
        }

        public static UserAdInteractionExt getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeApp(App app) {
            app.getClass();
            App app2 = this.app_;
            if (app2 == null || app2 == App.getDefaultInstance()) {
                this.app_ = app;
            } else {
                this.app_ = (App) ((App.Builder) App.newBuilder(this.app_).mergeFrom((n0) app)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeAppBackgroundingInteraction(AppBackgroundingInteraction appBackgroundingInteraction) {
            appBackgroundingInteraction.getClass();
            if (this.infoExtCase_ != 103 || this.infoExt_ == AppBackgroundingInteraction.getDefaultInstance()) {
                this.infoExt_ = appBackgroundingInteraction;
            } else {
                this.infoExt_ = ((AppBackgroundingInteraction.Builder) AppBackgroundingInteraction.newBuilder((AppBackgroundingInteraction) this.infoExt_).mergeFrom((n0) appBackgroundingInteraction)).buildPartial();
            }
            this.infoExtCase_ = 103;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeAppForegroundingInteraction(AppForegroundingInteraction appForegroundingInteraction) {
            appForegroundingInteraction.getClass();
            if (this.infoExtCase_ != 102 || this.infoExt_ == AppForegroundingInteraction.getDefaultInstance()) {
                this.infoExt_ = appForegroundingInteraction;
            } else {
                this.infoExt_ = ((AppForegroundingInteraction.Builder) AppForegroundingInteraction.newBuilder((AppForegroundingInteraction) this.infoExt_).mergeFrom((n0) appForegroundingInteraction)).buildPartial();
            }
            this.infoExtCase_ = 102;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeClickInteraction(ClickInteraction clickInteraction) {
            clickInteraction.getClass();
            if (this.infoExtCase_ != 101 || this.infoExt_ == ClickInteraction.getDefaultInstance()) {
                this.infoExt_ = clickInteraction;
            } else {
                this.infoExt_ = ((ClickInteraction.Builder) ClickInteraction.newBuilder((ClickInteraction) this.infoExt_).mergeFrom((n0) clickInteraction)).buildPartial();
            }
            this.infoExtCase_ = 101;
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
        public void mergeImpInteraction(ImpressionInteraction impressionInteraction) {
            impressionInteraction.getClass();
            if (this.infoExtCase_ != 100 || this.infoExt_ == ImpressionInteraction.getDefaultInstance()) {
                this.infoExt_ = impressionInteraction;
            } else {
                this.infoExt_ = ((ImpressionInteraction.Builder) ImpressionInteraction.newBuilder((ImpressionInteraction) this.infoExt_).mergeFrom((n0) impressionInteraction)).buildPartial();
            }
            this.infoExtCase_ = 100;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeNetwork(Network network) {
            network.getClass();
            Network network2 = this.network_;
            if (network2 == null || network2 == Network.getDefaultInstance()) {
                this.network_ = network;
            } else {
                this.network_ = (Network) ((Network.Builder) Network.newBuilder(this.network_).mergeFrom((n0) network)).buildPartial();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeSdk(MolocoSDK molocoSDK) {
            molocoSDK.getClass();
            MolocoSDK molocoSDK2 = this.sdk_;
            if (molocoSDK2 == null || molocoSDK2 == MolocoSDK.getDefaultInstance()) {
                this.sdk_ = molocoSDK;
            } else {
                this.sdk_ = (MolocoSDK) ((MolocoSDK.Builder) MolocoSDK.newBuilder(this.sdk_).mergeFrom((n0) molocoSDK)).buildPartial();
            }
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static UserAdInteractionExt parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (UserAdInteractionExt) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static UserAdInteractionExt parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdvertisingId(String str) {
            str.getClass();
            this.advertisingId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdvertisingIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.advertisingId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setApp(App app) {
            app.getClass();
            this.app_ = app;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAppBackgroundingInteraction(AppBackgroundingInteraction appBackgroundingInteraction) {
            appBackgroundingInteraction.getClass();
            this.infoExt_ = appBackgroundingInteraction;
            this.infoExtCase_ = 103;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAppForegroundingInteraction(AppForegroundingInteraction appForegroundingInteraction) {
            appForegroundingInteraction.getClass();
            this.infoExt_ = appForegroundingInteraction;
            this.infoExtCase_ = 102;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setClickInteraction(ClickInteraction clickInteraction) {
            clickInteraction.getClass();
            this.infoExt_ = clickInteraction;
            this.infoExtCase_ = 101;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setClientTimestamp(long j11) {
            this.clientTimestamp_ = j11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setDevice(Device device) {
            device.getClass();
            this.device_ = device;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setImpInteraction(ImpressionInteraction impressionInteraction) {
            impressionInteraction.getClass();
            this.infoExt_ = impressionInteraction;
            this.infoExtCase_ = 100;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setMref(String str) {
            str.getClass();
            this.mref_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setMrefBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.mref_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setNetwork(Network network) {
            network.getClass();
            this.network_ = network;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSdk(MolocoSDK molocoSDK) {
            molocoSDK.getClass();
            this.sdk_ = molocoSDK;
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u000b\u0001\u0000\u0001g\u000b\u0000\u0000\u0000\u0001Ȉ\u0002\u0002\u0003Ȉ\u0004\t\u0005\t\u0006\t\u0007\td<\u0000e<\u0000f<\u0000g<\u0000", new Object[]{"infoExt_", "infoExtCase_", "mref_", "clientTimestamp_", "advertisingId_", "device_", "app_", "network_", "sdk_", ImpressionInteraction.class, ClickInteraction.class, AppForegroundingInteraction.class, AppBackgroundingInteraction.class});
                case 3:
                    return new UserAdInteractionExt();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (UserAdInteractionExt.class) {
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

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public String getAdvertisingId() {
            return this.advertisingId_;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public l getAdvertisingIdBytes() {
            return l.f(this.advertisingId_);
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public App getApp() {
            App app = this.app_;
            return app == null ? App.getDefaultInstance() : app;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public AppBackgroundingInteraction getAppBackgroundingInteraction() {
            return this.infoExtCase_ == 103 ? (AppBackgroundingInteraction) this.infoExt_ : AppBackgroundingInteraction.getDefaultInstance();
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public AppForegroundingInteraction getAppForegroundingInteraction() {
            return this.infoExtCase_ == 102 ? (AppForegroundingInteraction) this.infoExt_ : AppForegroundingInteraction.getDefaultInstance();
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public ClickInteraction getClickInteraction() {
            return this.infoExtCase_ == 101 ? (ClickInteraction) this.infoExt_ : ClickInteraction.getDefaultInstance();
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public long getClientTimestamp() {
            return this.clientTimestamp_;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public Device getDevice() {
            Device device = this.device_;
            return device == null ? Device.getDefaultInstance() : device;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public ImpressionInteraction getImpInteraction() {
            return this.infoExtCase_ == 100 ? (ImpressionInteraction) this.infoExt_ : ImpressionInteraction.getDefaultInstance();
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public InfoExtCase getInfoExtCase() {
            return InfoExtCase.forNumber(this.infoExtCase_);
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public String getMref() {
            return this.mref_;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public l getMrefBytes() {
            return l.f(this.mref_);
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public Network getNetwork() {
            Network network = this.network_;
            return network == null ? Network.getDefaultInstance() : network;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public MolocoSDK getSdk() {
            MolocoSDK molocoSDK = this.sdk_;
            return molocoSDK == null ? MolocoSDK.getDefaultInstance() : molocoSDK;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasApp() {
            return this.app_ != null;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasAppBackgroundingInteraction() {
            return this.infoExtCase_ == 103;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasAppForegroundingInteraction() {
            return this.infoExtCase_ == 102;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasClickInteraction() {
            return this.infoExtCase_ == 101;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasDevice() {
            return this.device_ != null;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasImpInteraction() {
            return this.infoExtCase_ == 100;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasNetwork() {
            return this.network_ != null;
        }

        @Override // com.moloco.sdk.UserIntent.UserAdInteractionExtOrBuilder
        public boolean hasSdk() {
            return this.sdk_ != null;
        }

        public static Builder newBuilder(UserAdInteractionExt userAdInteractionExt) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(userAdInteractionExt);
        }

        public static UserAdInteractionExt parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (UserAdInteractionExt) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static UserAdInteractionExt parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static UserAdInteractionExt parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static UserAdInteractionExt parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static UserAdInteractionExt parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static UserAdInteractionExt parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static UserAdInteractionExt parseFrom(InputStream inputStream) throws IOException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static UserAdInteractionExt parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static UserAdInteractionExt parseFrom(p pVar) throws IOException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static UserAdInteractionExt parseFrom(p pVar, y yVar) throws IOException {
            return (UserAdInteractionExt) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface UserAdInteractionExtOrBuilder extends p1 {
        String getAdvertisingId();

        l getAdvertisingIdBytes();

        UserAdInteractionExt.App getApp();

        UserAdInteractionExt.AppBackgroundingInteraction getAppBackgroundingInteraction();

        UserAdInteractionExt.AppForegroundingInteraction getAppForegroundingInteraction();

        UserAdInteractionExt.ClickInteraction getClickInteraction();

        long getClientTimestamp();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        UserAdInteractionExt.Device getDevice();

        UserAdInteractionExt.ImpressionInteraction getImpInteraction();

        UserAdInteractionExt.InfoExtCase getInfoExtCase();

        String getMref();

        l getMrefBytes();

        UserAdInteractionExt.Network getNetwork();

        UserAdInteractionExt.MolocoSDK getSdk();

        boolean hasApp();

        boolean hasAppBackgroundingInteraction();

        boolean hasAppForegroundingInteraction();

        boolean hasClickInteraction();

        boolean hasDevice();

        boolean hasImpInteraction();

        boolean hasNetwork();

        boolean hasSdk();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    private UserIntent() {
    }

    public static void registerAllExtensions(y yVar) {
    }
}
