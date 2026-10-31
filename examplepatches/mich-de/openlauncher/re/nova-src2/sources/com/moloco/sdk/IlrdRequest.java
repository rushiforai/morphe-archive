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
public final class IlrdRequest {

    /* renamed from: com.moloco.sdk.IlrdRequest$1, reason: invalid class name */
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

    public static final class ImpressionLevelRevenue extends n0 implements ImpressionLevelRevenueOrBuilder {
        private static final ImpressionLevelRevenue DEFAULT_INSTANCE;
        public static final int EVENT_ID_FIELD_NUMBER = 2;
        public static final int LEVELPLAY_FIELD_NUMBER = 4;
        public static final int MAX_FIELD_NUMBER = 3;
        private static volatile v1 PARSER = null;
        public static final int SESSION_ID_FIELD_NUMBER = 1;
        private Object platform_;
        private int platformCase_ = 0;
        private String sessionId_ = b.f42142b;
        private String eventId_ = b.f42142b;

        public static final class Builder extends f0 implements ImpressionLevelRevenueOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearEventId() {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).clearEventId();
                return this;
            }

            public Builder clearLevelplay() {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).clearLevelplay();
                return this;
            }

            public Builder clearMax() {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).clearMax();
                return this;
            }

            public Builder clearPlatform() {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).clearPlatform();
                return this;
            }

            public Builder clearSessionId() {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).clearSessionId();
                return this;
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public String getEventId() {
                return ((ImpressionLevelRevenue) this.instance).getEventId();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public l getEventIdBytes() {
                return ((ImpressionLevelRevenue) this.instance).getEventIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public LevelPlayImpression getLevelplay() {
                return ((ImpressionLevelRevenue) this.instance).getLevelplay();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public MaxImpression getMax() {
                return ((ImpressionLevelRevenue) this.instance).getMax();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public PlatformCase getPlatformCase() {
                return ((ImpressionLevelRevenue) this.instance).getPlatformCase();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public String getSessionId() {
                return ((ImpressionLevelRevenue) this.instance).getSessionId();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public l getSessionIdBytes() {
                return ((ImpressionLevelRevenue) this.instance).getSessionIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public boolean hasLevelplay() {
                return ((ImpressionLevelRevenue) this.instance).hasLevelplay();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
            public boolean hasMax() {
                return ((ImpressionLevelRevenue) this.instance).hasMax();
            }

            public Builder mergeLevelplay(LevelPlayImpression levelPlayImpression) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).mergeLevelplay(levelPlayImpression);
                return this;
            }

            public Builder mergeMax(MaxImpression maxImpression) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).mergeMax(maxImpression);
                return this;
            }

            public Builder setEventId(String str) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setEventId(str);
                return this;
            }

            public Builder setEventIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setEventIdBytes(lVar);
                return this;
            }

            public Builder setLevelplay(LevelPlayImpression levelPlayImpression) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setLevelplay(levelPlayImpression);
                return this;
            }

            public Builder setMax(MaxImpression maxImpression) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setMax(maxImpression);
                return this;
            }

            public Builder setSessionId(String str) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setSessionId(str);
                return this;
            }

            public Builder setSessionIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setSessionIdBytes(lVar);
                return this;
            }

            private Builder() {
                super(ImpressionLevelRevenue.DEFAULT_INSTANCE);
            }

            public Builder setLevelplay(LevelPlayImpression.Builder builder) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setLevelplay((LevelPlayImpression) builder.build());
                return this;
            }

            public Builder setMax(MaxImpression.Builder builder) {
                copyOnWrite();
                ((ImpressionLevelRevenue) this.instance).setMax((MaxImpression) builder.build());
                return this;
            }
        }

        public enum PlatformCase {
            MAX(3),
            LEVELPLAY(4),
            PLATFORM_NOT_SET(0);

            private final int value;

            PlatformCase(int i5) {
                this.value = i5;
            }

            public static PlatformCase forNumber(int i5) {
                if (i5 == 0) {
                    return PLATFORM_NOT_SET;
                }
                if (i5 == 3) {
                    return MAX;
                }
                if (i5 != 4) {
                    return null;
                }
                return LEVELPLAY;
            }

            public int getNumber() {
                return this.value;
            }

            @Deprecated
            public static PlatformCase valueOf(int i5) {
                return forNumber(i5);
            }
        }

        static {
            ImpressionLevelRevenue impressionLevelRevenue = new ImpressionLevelRevenue();
            DEFAULT_INSTANCE = impressionLevelRevenue;
            n0.registerDefaultInstance(ImpressionLevelRevenue.class, impressionLevelRevenue);
        }

        private ImpressionLevelRevenue() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearEventId() {
            this.eventId_ = getDefaultInstance().getEventId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearLevelplay() {
            if (this.platformCase_ == 4) {
                this.platformCase_ = 0;
                this.platform_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearMax() {
            if (this.platformCase_ == 3) {
                this.platformCase_ = 0;
                this.platform_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPlatform() {
            this.platformCase_ = 0;
            this.platform_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSessionId() {
            this.sessionId_ = getDefaultInstance().getSessionId();
        }

        public static ImpressionLevelRevenue getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeLevelplay(LevelPlayImpression levelPlayImpression) {
            levelPlayImpression.getClass();
            if (this.platformCase_ != 4 || this.platform_ == LevelPlayImpression.getDefaultInstance()) {
                this.platform_ = levelPlayImpression;
            } else {
                this.platform_ = ((LevelPlayImpression.Builder) LevelPlayImpression.newBuilder((LevelPlayImpression) this.platform_).mergeFrom((n0) levelPlayImpression)).buildPartial();
            }
            this.platformCase_ = 4;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeMax(MaxImpression maxImpression) {
            maxImpression.getClass();
            if (this.platformCase_ != 3 || this.platform_ == MaxImpression.getDefaultInstance()) {
                this.platform_ = maxImpression;
            } else {
                this.platform_ = ((MaxImpression.Builder) MaxImpression.newBuilder((MaxImpression) this.platform_).mergeFrom((n0) maxImpression)).buildPartial();
            }
            this.platformCase_ = 3;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static ImpressionLevelRevenue parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (ImpressionLevelRevenue) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ImpressionLevelRevenue parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEventId(String str) {
            str.getClass();
            this.eventId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEventIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.eventId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setLevelplay(LevelPlayImpression levelPlayImpression) {
            levelPlayImpression.getClass();
            this.platform_ = levelPlayImpression;
            this.platformCase_ = 4;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setMax(MaxImpression maxImpression) {
            maxImpression.getClass();
            this.platform_ = maxImpression;
            this.platformCase_ = 3;
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

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0004\u0001\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003<\u0000\u0004<\u0000", new Object[]{"platform_", "platformCase_", "sessionId_", "eventId_", MaxImpression.class, LevelPlayImpression.class});
                case 3:
                    return new ImpressionLevelRevenue();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (ImpressionLevelRevenue.class) {
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

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public String getEventId() {
            return this.eventId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public l getEventIdBytes() {
            return l.f(this.eventId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public LevelPlayImpression getLevelplay() {
            return this.platformCase_ == 4 ? (LevelPlayImpression) this.platform_ : LevelPlayImpression.getDefaultInstance();
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public MaxImpression getMax() {
            return this.platformCase_ == 3 ? (MaxImpression) this.platform_ : MaxImpression.getDefaultInstance();
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public PlatformCase getPlatformCase() {
            return PlatformCase.forNumber(this.platformCase_);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public String getSessionId() {
            return this.sessionId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public l getSessionIdBytes() {
            return l.f(this.sessionId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public boolean hasLevelplay() {
            return this.platformCase_ == 4;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionLevelRevenueOrBuilder
        public boolean hasMax() {
            return this.platformCase_ == 3;
        }

        public static Builder newBuilder(ImpressionLevelRevenue impressionLevelRevenue) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(impressionLevelRevenue);
        }

        public static ImpressionLevelRevenue parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (ImpressionLevelRevenue) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ImpressionLevelRevenue parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static ImpressionLevelRevenue parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static ImpressionLevelRevenue parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static ImpressionLevelRevenue parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static ImpressionLevelRevenue parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static ImpressionLevelRevenue parseFrom(InputStream inputStream) throws IOException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ImpressionLevelRevenue parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ImpressionLevelRevenue parseFrom(p pVar) throws IOException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static ImpressionLevelRevenue parseFrom(p pVar, y yVar) throws IOException {
            return (ImpressionLevelRevenue) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface ImpressionLevelRevenueOrBuilder extends p1 {
        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        String getEventId();

        l getEventIdBytes();

        LevelPlayImpression getLevelplay();

        MaxImpression getMax();

        ImpressionLevelRevenue.PlatformCase getPlatformCase();

        String getSessionId();

        l getSessionIdBytes();

        boolean hasLevelplay();

        boolean hasMax();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    public static final class ImpressionRevenueRequest extends n0 implements ImpressionRevenueRequestOrBuilder {
        private static final ImpressionRevenueRequest DEFAULT_INSTANCE;
        public static final int DEVICE_ID_FIELD_NUMBER = 1;
        public static final int EVENTS_FIELD_NUMBER = 6;
        public static final int IDFV_FIELD_NUMBER = 2;
        public static final int OS_FIELD_NUMBER = 3;
        private static volatile v1 PARSER = null;
        public static final int PUBLISHER_APP_ID_FIELD_NUMBER = 5;
        public static final int PUBLISHER_ID_FIELD_NUMBER = 4;
        private String deviceId_ = b.f42142b;
        private String idfv_ = b.f42142b;
        private String os_ = b.f42142b;
        private String publisherId_ = b.f42142b;
        private String publisherAppId_ = b.f42142b;
        private z0 events_ = n0.emptyProtobufList();

        public static final class Builder extends f0 implements ImpressionRevenueRequestOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder addAllEvents(Iterable<? extends ImpressionLevelRevenue> iterable) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).addAllEvents(iterable);
                return this;
            }

            public Builder addEvents(ImpressionLevelRevenue impressionLevelRevenue) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).addEvents(impressionLevelRevenue);
                return this;
            }

            public Builder clearDeviceId() {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).clearDeviceId();
                return this;
            }

            public Builder clearEvents() {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).clearEvents();
                return this;
            }

            public Builder clearIdfv() {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).clearIdfv();
                return this;
            }

            public Builder clearOs() {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).clearOs();
                return this;
            }

            public Builder clearPublisherAppId() {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).clearPublisherAppId();
                return this;
            }

            public Builder clearPublisherId() {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).clearPublisherId();
                return this;
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public String getDeviceId() {
                return ((ImpressionRevenueRequest) this.instance).getDeviceId();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public l getDeviceIdBytes() {
                return ((ImpressionRevenueRequest) this.instance).getDeviceIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public ImpressionLevelRevenue getEvents(int i5) {
                return ((ImpressionRevenueRequest) this.instance).getEvents(i5);
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public int getEventsCount() {
                return ((ImpressionRevenueRequest) this.instance).getEventsCount();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public List<ImpressionLevelRevenue> getEventsList() {
                return Collections.unmodifiableList(((ImpressionRevenueRequest) this.instance).getEventsList());
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public String getIdfv() {
                return ((ImpressionRevenueRequest) this.instance).getIdfv();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public l getIdfvBytes() {
                return ((ImpressionRevenueRequest) this.instance).getIdfvBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public String getOs() {
                return ((ImpressionRevenueRequest) this.instance).getOs();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public l getOsBytes() {
                return ((ImpressionRevenueRequest) this.instance).getOsBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public String getPublisherAppId() {
                return ((ImpressionRevenueRequest) this.instance).getPublisherAppId();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public l getPublisherAppIdBytes() {
                return ((ImpressionRevenueRequest) this.instance).getPublisherAppIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public String getPublisherId() {
                return ((ImpressionRevenueRequest) this.instance).getPublisherId();
            }

            @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
            public l getPublisherIdBytes() {
                return ((ImpressionRevenueRequest) this.instance).getPublisherIdBytes();
            }

            public Builder removeEvents(int i5) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).removeEvents(i5);
                return this;
            }

            public Builder setDeviceId(String str) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setDeviceId(str);
                return this;
            }

            public Builder setDeviceIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setDeviceIdBytes(lVar);
                return this;
            }

            public Builder setEvents(int i5, ImpressionLevelRevenue impressionLevelRevenue) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setEvents(i5, impressionLevelRevenue);
                return this;
            }

            public Builder setIdfv(String str) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setIdfv(str);
                return this;
            }

            public Builder setIdfvBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setIdfvBytes(lVar);
                return this;
            }

            public Builder setOs(String str) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setOs(str);
                return this;
            }

            public Builder setOsBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setOsBytes(lVar);
                return this;
            }

            public Builder setPublisherAppId(String str) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setPublisherAppId(str);
                return this;
            }

            public Builder setPublisherAppIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setPublisherAppIdBytes(lVar);
                return this;
            }

            public Builder setPublisherId(String str) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setPublisherId(str);
                return this;
            }

            public Builder setPublisherIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setPublisherIdBytes(lVar);
                return this;
            }

            private Builder() {
                super(ImpressionRevenueRequest.DEFAULT_INSTANCE);
            }

            public Builder addEvents(int i5, ImpressionLevelRevenue impressionLevelRevenue) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).addEvents(i5, impressionLevelRevenue);
                return this;
            }

            public Builder setEvents(int i5, ImpressionLevelRevenue.Builder builder) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).setEvents(i5, (ImpressionLevelRevenue) builder.build());
                return this;
            }

            public Builder addEvents(ImpressionLevelRevenue.Builder builder) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).addEvents((ImpressionLevelRevenue) builder.build());
                return this;
            }

            public Builder addEvents(int i5, ImpressionLevelRevenue.Builder builder) {
                copyOnWrite();
                ((ImpressionRevenueRequest) this.instance).addEvents(i5, (ImpressionLevelRevenue) builder.build());
                return this;
            }
        }

        static {
            ImpressionRevenueRequest impressionRevenueRequest = new ImpressionRevenueRequest();
            DEFAULT_INSTANCE = impressionRevenueRequest;
            n0.registerDefaultInstance(ImpressionRevenueRequest.class, impressionRevenueRequest);
        }

        private ImpressionRevenueRequest() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addAllEvents(Iterable<? extends ImpressionLevelRevenue> iterable) {
            ensureEventsIsMutable();
            c.addAll(iterable, this.events_);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addEvents(ImpressionLevelRevenue impressionLevelRevenue) {
            impressionLevelRevenue.getClass();
            ensureEventsIsMutable();
            this.events_.add(impressionLevelRevenue);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearDeviceId() {
            this.deviceId_ = getDefaultInstance().getDeviceId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearEvents() {
            this.events_ = n0.emptyProtobufList();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearIdfv() {
            this.idfv_ = getDefaultInstance().getIdfv();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearOs() {
            this.os_ = getDefaultInstance().getOs();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPublisherAppId() {
            this.publisherAppId_ = getDefaultInstance().getPublisherAppId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPublisherId() {
            this.publisherId_ = getDefaultInstance().getPublisherId();
        }

        private void ensureEventsIsMutable() {
            z0 z0Var = this.events_;
            if (((d) z0Var).f34834a) {
                return;
            }
            this.events_ = n0.mutableCopy(z0Var);
        }

        public static ImpressionRevenueRequest getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static ImpressionRevenueRequest parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (ImpressionRevenueRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ImpressionRevenueRequest parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void removeEvents(int i5) {
            ensureEventsIsMutable();
            this.events_.remove(i5);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setDeviceId(String str) {
            str.getClass();
            this.deviceId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setDeviceIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.deviceId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEvents(int i5, ImpressionLevelRevenue impressionLevelRevenue) {
            impressionLevelRevenue.getClass();
            ensureEventsIsMutable();
            this.events_.set(i5, impressionLevelRevenue);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIdfv(String str) {
            str.getClass();
            this.idfv_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIdfvBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.idfv_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setOs(String str) {
            str.getClass();
            this.os_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setOsBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.os_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPublisherAppId(String str) {
            str.getClass();
            this.publisherAppId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPublisherAppIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.publisherAppId_ = lVar.o();
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

        @Override // com.google.protobuf.n0
        public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
            v1 g0Var;
            switch (m0Var.ordinal()) {
                case 0:
                    return (byte) 1;
                case 1:
                    return null;
                case 2:
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0006\u0000\u0000\u0001\u0006\u0006\u0000\u0001\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004Ȉ\u0005Ȉ\u0006\u001b", new Object[]{"deviceId_", "idfv_", "os_", "publisherId_", "publisherAppId_", "events_", ImpressionLevelRevenue.class});
                case 3:
                    return new ImpressionRevenueRequest();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (ImpressionRevenueRequest.class) {
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

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public String getDeviceId() {
            return this.deviceId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public l getDeviceIdBytes() {
            return l.f(this.deviceId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public ImpressionLevelRevenue getEvents(int i5) {
            return (ImpressionLevelRevenue) this.events_.get(i5);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public int getEventsCount() {
            return this.events_.size();
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public List<ImpressionLevelRevenue> getEventsList() {
            return this.events_;
        }

        public ImpressionLevelRevenueOrBuilder getEventsOrBuilder(int i5) {
            return (ImpressionLevelRevenueOrBuilder) this.events_.get(i5);
        }

        public List<? extends ImpressionLevelRevenueOrBuilder> getEventsOrBuilderList() {
            return this.events_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public String getIdfv() {
            return this.idfv_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public l getIdfvBytes() {
            return l.f(this.idfv_);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public String getOs() {
            return this.os_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public l getOsBytes() {
            return l.f(this.os_);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public String getPublisherAppId() {
            return this.publisherAppId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public l getPublisherAppIdBytes() {
            return l.f(this.publisherAppId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public String getPublisherId() {
            return this.publisherId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.ImpressionRevenueRequestOrBuilder
        public l getPublisherIdBytes() {
            return l.f(this.publisherId_);
        }

        public static Builder newBuilder(ImpressionRevenueRequest impressionRevenueRequest) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(impressionRevenueRequest);
        }

        public static ImpressionRevenueRequest parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (ImpressionRevenueRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ImpressionRevenueRequest parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static ImpressionRevenueRequest parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addEvents(int i5, ImpressionLevelRevenue impressionLevelRevenue) {
            impressionLevelRevenue.getClass();
            ensureEventsIsMutable();
            this.events_.add(i5, impressionLevelRevenue);
        }

        public static ImpressionRevenueRequest parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static ImpressionRevenueRequest parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static ImpressionRevenueRequest parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static ImpressionRevenueRequest parseFrom(InputStream inputStream) throws IOException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ImpressionRevenueRequest parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static ImpressionRevenueRequest parseFrom(p pVar) throws IOException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static ImpressionRevenueRequest parseFrom(p pVar, y yVar) throws IOException {
            return (ImpressionRevenueRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface ImpressionRevenueRequestOrBuilder extends p1 {
        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        String getDeviceId();

        l getDeviceIdBytes();

        ImpressionLevelRevenue getEvents(int i5);

        int getEventsCount();

        List<ImpressionLevelRevenue> getEventsList();

        String getIdfv();

        l getIdfvBytes();

        String getOs();

        l getOsBytes();

        String getPublisherAppId();

        l getPublisherAppIdBytes();

        String getPublisherId();

        l getPublisherIdBytes();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    public static final class LevelPlayImpression extends n0 implements LevelPlayImpressionOrBuilder {
        public static final int AB_FIELD_NUMBER = 10;
        public static final int AD_FORMAT_FIELD_NUMBER = 2;
        public static final int AUCTION_ID_FIELD_NUMBER = 1;
        public static final int COUNTRY_CODE_FIELD_NUMBER = 6;
        public static final int CREATIVE_ID_FIELD_NUMBER = 14;
        private static final LevelPlayImpression DEFAULT_INSTANCE;
        public static final int ENCRYPTED_CPM_FIELD_NUMBER = 13;
        public static final int INSTANCE_ID_FIELD_NUMBER = 5;
        public static final int INSTANCE_NAME_FIELD_NUMBER = 4;
        public static final int LIFETIME_REVENUE_FIELD_NUMBER = 12;
        public static final int NETWORK_NAME_FIELD_NUMBER = 3;
        private static volatile v1 PARSER = null;
        public static final int PLACEMENT_FIELD_NUMBER = 7;
        public static final int PRECISION_FIELD_NUMBER = 9;
        public static final int REVENUE_FIELD_NUMBER = 8;
        public static final int SEGMENT_NAME_FIELD_NUMBER = 11;
        private double lifetimeRevenue_;
        private double revenue_;
        private String auctionId_ = b.f42142b;
        private String adFormat_ = b.f42142b;
        private String networkName_ = b.f42142b;
        private String instanceName_ = b.f42142b;
        private String instanceId_ = b.f42142b;
        private String countryCode_ = b.f42142b;
        private String placement_ = b.f42142b;
        private String precision_ = b.f42142b;
        private String ab_ = b.f42142b;
        private String segmentName_ = b.f42142b;
        private String encryptedCpm_ = b.f42142b;
        private String creativeId_ = b.f42142b;

        public static final class Builder extends f0 implements LevelPlayImpressionOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearAb() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearAb();
                return this;
            }

            public Builder clearAdFormat() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearAdFormat();
                return this;
            }

            public Builder clearAuctionId() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearAuctionId();
                return this;
            }

            public Builder clearCountryCode() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearCountryCode();
                return this;
            }

            public Builder clearCreativeId() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearCreativeId();
                return this;
            }

            public Builder clearEncryptedCpm() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearEncryptedCpm();
                return this;
            }

            public Builder clearInstanceId() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearInstanceId();
                return this;
            }

            public Builder clearInstanceName() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearInstanceName();
                return this;
            }

            public Builder clearLifetimeRevenue() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearLifetimeRevenue();
                return this;
            }

            public Builder clearNetworkName() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearNetworkName();
                return this;
            }

            public Builder clearPlacement() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearPlacement();
                return this;
            }

            public Builder clearPrecision() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearPrecision();
                return this;
            }

            public Builder clearRevenue() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearRevenue();
                return this;
            }

            public Builder clearSegmentName() {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).clearSegmentName();
                return this;
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getAb() {
                return ((LevelPlayImpression) this.instance).getAb();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getAbBytes() {
                return ((LevelPlayImpression) this.instance).getAbBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getAdFormat() {
                return ((LevelPlayImpression) this.instance).getAdFormat();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getAdFormatBytes() {
                return ((LevelPlayImpression) this.instance).getAdFormatBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getAuctionId() {
                return ((LevelPlayImpression) this.instance).getAuctionId();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getAuctionIdBytes() {
                return ((LevelPlayImpression) this.instance).getAuctionIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getCountryCode() {
                return ((LevelPlayImpression) this.instance).getCountryCode();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getCountryCodeBytes() {
                return ((LevelPlayImpression) this.instance).getCountryCodeBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getCreativeId() {
                return ((LevelPlayImpression) this.instance).getCreativeId();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getCreativeIdBytes() {
                return ((LevelPlayImpression) this.instance).getCreativeIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getEncryptedCpm() {
                return ((LevelPlayImpression) this.instance).getEncryptedCpm();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getEncryptedCpmBytes() {
                return ((LevelPlayImpression) this.instance).getEncryptedCpmBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getInstanceId() {
                return ((LevelPlayImpression) this.instance).getInstanceId();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getInstanceIdBytes() {
                return ((LevelPlayImpression) this.instance).getInstanceIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getInstanceName() {
                return ((LevelPlayImpression) this.instance).getInstanceName();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getInstanceNameBytes() {
                return ((LevelPlayImpression) this.instance).getInstanceNameBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public double getLifetimeRevenue() {
                return ((LevelPlayImpression) this.instance).getLifetimeRevenue();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getNetworkName() {
                return ((LevelPlayImpression) this.instance).getNetworkName();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getNetworkNameBytes() {
                return ((LevelPlayImpression) this.instance).getNetworkNameBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getPlacement() {
                return ((LevelPlayImpression) this.instance).getPlacement();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getPlacementBytes() {
                return ((LevelPlayImpression) this.instance).getPlacementBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getPrecision() {
                return ((LevelPlayImpression) this.instance).getPrecision();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getPrecisionBytes() {
                return ((LevelPlayImpression) this.instance).getPrecisionBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public double getRevenue() {
                return ((LevelPlayImpression) this.instance).getRevenue();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public String getSegmentName() {
                return ((LevelPlayImpression) this.instance).getSegmentName();
            }

            @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
            public l getSegmentNameBytes() {
                return ((LevelPlayImpression) this.instance).getSegmentNameBytes();
            }

            public Builder setAb(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setAb(str);
                return this;
            }

            public Builder setAbBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setAbBytes(lVar);
                return this;
            }

            public Builder setAdFormat(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setAdFormat(str);
                return this;
            }

            public Builder setAdFormatBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setAdFormatBytes(lVar);
                return this;
            }

            public Builder setAuctionId(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setAuctionId(str);
                return this;
            }

            public Builder setAuctionIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setAuctionIdBytes(lVar);
                return this;
            }

            public Builder setCountryCode(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setCountryCode(str);
                return this;
            }

            public Builder setCountryCodeBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setCountryCodeBytes(lVar);
                return this;
            }

            public Builder setCreativeId(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setCreativeId(str);
                return this;
            }

            public Builder setCreativeIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setCreativeIdBytes(lVar);
                return this;
            }

            public Builder setEncryptedCpm(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setEncryptedCpm(str);
                return this;
            }

            public Builder setEncryptedCpmBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setEncryptedCpmBytes(lVar);
                return this;
            }

            public Builder setInstanceId(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setInstanceId(str);
                return this;
            }

            public Builder setInstanceIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setInstanceIdBytes(lVar);
                return this;
            }

            public Builder setInstanceName(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setInstanceName(str);
                return this;
            }

            public Builder setInstanceNameBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setInstanceNameBytes(lVar);
                return this;
            }

            public Builder setLifetimeRevenue(double d5) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setLifetimeRevenue(d5);
                return this;
            }

            public Builder setNetworkName(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setNetworkName(str);
                return this;
            }

            public Builder setNetworkNameBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setNetworkNameBytes(lVar);
                return this;
            }

            public Builder setPlacement(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setPlacement(str);
                return this;
            }

            public Builder setPlacementBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setPlacementBytes(lVar);
                return this;
            }

            public Builder setPrecision(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setPrecision(str);
                return this;
            }

            public Builder setPrecisionBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setPrecisionBytes(lVar);
                return this;
            }

            public Builder setRevenue(double d5) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setRevenue(d5);
                return this;
            }

            public Builder setSegmentName(String str) {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setSegmentName(str);
                return this;
            }

            public Builder setSegmentNameBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((LevelPlayImpression) this.instance).setSegmentNameBytes(lVar);
                return this;
            }

            private Builder() {
                super(LevelPlayImpression.DEFAULT_INSTANCE);
            }
        }

        static {
            LevelPlayImpression levelPlayImpression = new LevelPlayImpression();
            DEFAULT_INSTANCE = levelPlayImpression;
            n0.registerDefaultInstance(LevelPlayImpression.class, levelPlayImpression);
        }

        private LevelPlayImpression() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAb() {
            this.ab_ = getDefaultInstance().getAb();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAdFormat() {
            this.adFormat_ = getDefaultInstance().getAdFormat();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAuctionId() {
            this.auctionId_ = getDefaultInstance().getAuctionId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCountryCode() {
            this.countryCode_ = getDefaultInstance().getCountryCode();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCreativeId() {
            this.creativeId_ = getDefaultInstance().getCreativeId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearEncryptedCpm() {
            this.encryptedCpm_ = getDefaultInstance().getEncryptedCpm();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearInstanceId() {
            this.instanceId_ = getDefaultInstance().getInstanceId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearInstanceName() {
            this.instanceName_ = getDefaultInstance().getInstanceName();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearLifetimeRevenue() {
            this.lifetimeRevenue_ = 0.0d;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearNetworkName() {
            this.networkName_ = getDefaultInstance().getNetworkName();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPlacement() {
            this.placement_ = getDefaultInstance().getPlacement();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPrecision() {
            this.precision_ = getDefaultInstance().getPrecision();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearRevenue() {
            this.revenue_ = 0.0d;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSegmentName() {
            this.segmentName_ = getDefaultInstance().getSegmentName();
        }

        public static LevelPlayImpression getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static LevelPlayImpression parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (LevelPlayImpression) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static LevelPlayImpression parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAb(String str) {
            str.getClass();
            this.ab_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAbBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.ab_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdFormat(String str) {
            str.getClass();
            this.adFormat_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdFormatBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.adFormat_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAuctionId(String str) {
            str.getClass();
            this.auctionId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAuctionIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.auctionId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryCode(String str) {
            str.getClass();
            this.countryCode_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryCodeBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.countryCode_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCreativeId(String str) {
            str.getClass();
            this.creativeId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCreativeIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.creativeId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEncryptedCpm(String str) {
            str.getClass();
            this.encryptedCpm_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEncryptedCpmBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.encryptedCpm_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setInstanceId(String str) {
            str.getClass();
            this.instanceId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setInstanceIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.instanceId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setInstanceName(String str) {
            str.getClass();
            this.instanceName_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setInstanceNameBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.instanceName_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setLifetimeRevenue(double d5) {
            this.lifetimeRevenue_ = d5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setNetworkName(String str) {
            str.getClass();
            this.networkName_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setNetworkNameBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.networkName_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPlacement(String str) {
            str.getClass();
            this.placement_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPlacementBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.placement_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPrecision(String str) {
            str.getClass();
            this.precision_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPrecisionBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.precision_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setRevenue(double d5) {
            this.revenue_ = d5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSegmentName(String str) {
            str.getClass();
            this.segmentName_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSegmentNameBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.segmentName_ = lVar.o();
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u000e\u0000\u0000\u0001\u000e\u000e\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004Ȉ\u0005Ȉ\u0006Ȉ\u0007Ȉ\b\u0000\tȈ\nȈ\u000bȈ\f\u0000\rȈ\u000eȈ", new Object[]{"auctionId_", "adFormat_", "networkName_", "instanceName_", "instanceId_", "countryCode_", "placement_", "revenue_", "precision_", "ab_", "segmentName_", "lifetimeRevenue_", "encryptedCpm_", "creativeId_"});
                case 3:
                    return new LevelPlayImpression();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (LevelPlayImpression.class) {
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

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getAb() {
            return this.ab_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getAbBytes() {
            return l.f(this.ab_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getAdFormat() {
            return this.adFormat_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getAdFormatBytes() {
            return l.f(this.adFormat_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getAuctionId() {
            return this.auctionId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getAuctionIdBytes() {
            return l.f(this.auctionId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getCountryCode() {
            return this.countryCode_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getCountryCodeBytes() {
            return l.f(this.countryCode_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getCreativeId() {
            return this.creativeId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getCreativeIdBytes() {
            return l.f(this.creativeId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getEncryptedCpm() {
            return this.encryptedCpm_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getEncryptedCpmBytes() {
            return l.f(this.encryptedCpm_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getInstanceId() {
            return this.instanceId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getInstanceIdBytes() {
            return l.f(this.instanceId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getInstanceName() {
            return this.instanceName_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getInstanceNameBytes() {
            return l.f(this.instanceName_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public double getLifetimeRevenue() {
            return this.lifetimeRevenue_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getNetworkName() {
            return this.networkName_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getNetworkNameBytes() {
            return l.f(this.networkName_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getPlacement() {
            return this.placement_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getPlacementBytes() {
            return l.f(this.placement_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getPrecision() {
            return this.precision_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getPrecisionBytes() {
            return l.f(this.precision_);
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public double getRevenue() {
            return this.revenue_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public String getSegmentName() {
            return this.segmentName_;
        }

        @Override // com.moloco.sdk.IlrdRequest.LevelPlayImpressionOrBuilder
        public l getSegmentNameBytes() {
            return l.f(this.segmentName_);
        }

        public static Builder newBuilder(LevelPlayImpression levelPlayImpression) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(levelPlayImpression);
        }

        public static LevelPlayImpression parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (LevelPlayImpression) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static LevelPlayImpression parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static LevelPlayImpression parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static LevelPlayImpression parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static LevelPlayImpression parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static LevelPlayImpression parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static LevelPlayImpression parseFrom(InputStream inputStream) throws IOException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static LevelPlayImpression parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static LevelPlayImpression parseFrom(p pVar) throws IOException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static LevelPlayImpression parseFrom(p pVar, y yVar) throws IOException {
            return (LevelPlayImpression) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface LevelPlayImpressionOrBuilder extends p1 {
        String getAb();

        l getAbBytes();

        String getAdFormat();

        l getAdFormatBytes();

        String getAuctionId();

        l getAuctionIdBytes();

        String getCountryCode();

        l getCountryCodeBytes();

        String getCreativeId();

        l getCreativeIdBytes();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        String getEncryptedCpm();

        l getEncryptedCpmBytes();

        String getInstanceId();

        l getInstanceIdBytes();

        String getInstanceName();

        l getInstanceNameBytes();

        double getLifetimeRevenue();

        String getNetworkName();

        l getNetworkNameBytes();

        String getPlacement();

        l getPlacementBytes();

        String getPrecision();

        l getPrecisionBytes();

        double getRevenue();

        String getSegmentName();

        l getSegmentNameBytes();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    public static final class MaxImpression extends n0 implements MaxImpressionOrBuilder {
        public static final int AD_FORMAT_FIELD_NUMBER = 1;
        public static final int COUNTRY_CODE_FIELD_NUMBER = 2;
        private static final MaxImpression DEFAULT_INSTANCE;
        public static final int ID_FIELD_NUMBER = 3;
        public static final int MAX_AD_UNIT_ID_FIELD_NUMBER = 4;
        public static final int NETWORK_NAME_FIELD_NUMBER = 5;
        private static volatile v1 PARSER = null;
        public static final int REVENUE_FIELD_NUMBER = 6;
        public static final int THIRD_PARTY_AD_PLACEMENT_ID_FIELD_NUMBER = 7;
        public static final int USER_SEGMENT_FIELD_NUMBER = 8;
        private double revenue_;
        private String adFormat_ = b.f42142b;
        private String countryCode_ = b.f42142b;
        private String id_ = b.f42142b;
        private String maxAdUnitId_ = b.f42142b;
        private String networkName_ = b.f42142b;
        private String thirdPartyAdPlacementId_ = b.f42142b;
        private String userSegment_ = b.f42142b;

        public static final class Builder extends f0 implements MaxImpressionOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearAdFormat() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearAdFormat();
                return this;
            }

            public Builder clearCountryCode() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearCountryCode();
                return this;
            }

            public Builder clearId() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearId();
                return this;
            }

            public Builder clearMaxAdUnitId() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearMaxAdUnitId();
                return this;
            }

            public Builder clearNetworkName() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearNetworkName();
                return this;
            }

            public Builder clearRevenue() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearRevenue();
                return this;
            }

            public Builder clearThirdPartyAdPlacementId() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearThirdPartyAdPlacementId();
                return this;
            }

            public Builder clearUserSegment() {
                copyOnWrite();
                ((MaxImpression) this.instance).clearUserSegment();
                return this;
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public String getAdFormat() {
                return ((MaxImpression) this.instance).getAdFormat();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public l getAdFormatBytes() {
                return ((MaxImpression) this.instance).getAdFormatBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public String getCountryCode() {
                return ((MaxImpression) this.instance).getCountryCode();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public l getCountryCodeBytes() {
                return ((MaxImpression) this.instance).getCountryCodeBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public String getId() {
                return ((MaxImpression) this.instance).getId();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public l getIdBytes() {
                return ((MaxImpression) this.instance).getIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public String getMaxAdUnitId() {
                return ((MaxImpression) this.instance).getMaxAdUnitId();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public l getMaxAdUnitIdBytes() {
                return ((MaxImpression) this.instance).getMaxAdUnitIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public String getNetworkName() {
                return ((MaxImpression) this.instance).getNetworkName();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public l getNetworkNameBytes() {
                return ((MaxImpression) this.instance).getNetworkNameBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public double getRevenue() {
                return ((MaxImpression) this.instance).getRevenue();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public String getThirdPartyAdPlacementId() {
                return ((MaxImpression) this.instance).getThirdPartyAdPlacementId();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public l getThirdPartyAdPlacementIdBytes() {
                return ((MaxImpression) this.instance).getThirdPartyAdPlacementIdBytes();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public String getUserSegment() {
                return ((MaxImpression) this.instance).getUserSegment();
            }

            @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
            public l getUserSegmentBytes() {
                return ((MaxImpression) this.instance).getUserSegmentBytes();
            }

            public Builder setAdFormat(String str) {
                copyOnWrite();
                ((MaxImpression) this.instance).setAdFormat(str);
                return this;
            }

            public Builder setAdFormatBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((MaxImpression) this.instance).setAdFormatBytes(lVar);
                return this;
            }

            public Builder setCountryCode(String str) {
                copyOnWrite();
                ((MaxImpression) this.instance).setCountryCode(str);
                return this;
            }

            public Builder setCountryCodeBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((MaxImpression) this.instance).setCountryCodeBytes(lVar);
                return this;
            }

            public Builder setId(String str) {
                copyOnWrite();
                ((MaxImpression) this.instance).setId(str);
                return this;
            }

            public Builder setIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((MaxImpression) this.instance).setIdBytes(lVar);
                return this;
            }

            public Builder setMaxAdUnitId(String str) {
                copyOnWrite();
                ((MaxImpression) this.instance).setMaxAdUnitId(str);
                return this;
            }

            public Builder setMaxAdUnitIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((MaxImpression) this.instance).setMaxAdUnitIdBytes(lVar);
                return this;
            }

            public Builder setNetworkName(String str) {
                copyOnWrite();
                ((MaxImpression) this.instance).setNetworkName(str);
                return this;
            }

            public Builder setNetworkNameBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((MaxImpression) this.instance).setNetworkNameBytes(lVar);
                return this;
            }

            public Builder setRevenue(double d5) {
                copyOnWrite();
                ((MaxImpression) this.instance).setRevenue(d5);
                return this;
            }

            public Builder setThirdPartyAdPlacementId(String str) {
                copyOnWrite();
                ((MaxImpression) this.instance).setThirdPartyAdPlacementId(str);
                return this;
            }

            public Builder setThirdPartyAdPlacementIdBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((MaxImpression) this.instance).setThirdPartyAdPlacementIdBytes(lVar);
                return this;
            }

            public Builder setUserSegment(String str) {
                copyOnWrite();
                ((MaxImpression) this.instance).setUserSegment(str);
                return this;
            }

            public Builder setUserSegmentBytes(l lVar) throws IllegalArgumentException {
                copyOnWrite();
                ((MaxImpression) this.instance).setUserSegmentBytes(lVar);
                return this;
            }

            private Builder() {
                super(MaxImpression.DEFAULT_INSTANCE);
            }
        }

        static {
            MaxImpression maxImpression = new MaxImpression();
            DEFAULT_INSTANCE = maxImpression;
            n0.registerDefaultInstance(MaxImpression.class, maxImpression);
        }

        private MaxImpression() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAdFormat() {
            this.adFormat_ = getDefaultInstance().getAdFormat();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCountryCode() {
            this.countryCode_ = getDefaultInstance().getCountryCode();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearId() {
            this.id_ = getDefaultInstance().getId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearMaxAdUnitId() {
            this.maxAdUnitId_ = getDefaultInstance().getMaxAdUnitId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearNetworkName() {
            this.networkName_ = getDefaultInstance().getNetworkName();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearRevenue() {
            this.revenue_ = 0.0d;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearThirdPartyAdPlacementId() {
            this.thirdPartyAdPlacementId_ = getDefaultInstance().getThirdPartyAdPlacementId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearUserSegment() {
            this.userSegment_ = getDefaultInstance().getUserSegment();
        }

        public static MaxImpression getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static MaxImpression parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (MaxImpression) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static MaxImpression parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdFormat(String str) {
            str.getClass();
            this.adFormat_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAdFormatBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.adFormat_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryCode(String str) {
            str.getClass();
            this.countryCode_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCountryCodeBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.countryCode_ = lVar.o();
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
        public void setMaxAdUnitId(String str) {
            str.getClass();
            this.maxAdUnitId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setMaxAdUnitIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.maxAdUnitId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setNetworkName(String str) {
            str.getClass();
            this.networkName_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setNetworkNameBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.networkName_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setRevenue(double d5) {
            this.revenue_ = d5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setThirdPartyAdPlacementId(String str) {
            str.getClass();
            this.thirdPartyAdPlacementId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setThirdPartyAdPlacementIdBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.thirdPartyAdPlacementId_ = lVar.o();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setUserSegment(String str) {
            str.getClass();
            this.userSegment_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setUserSegmentBytes(l lVar) throws IllegalArgumentException {
            c.checkByteStringIsUtf8(lVar);
            this.userSegment_ = lVar.o();
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\b\u0000\u0000\u0001\b\b\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004Ȉ\u0005Ȉ\u0006\u0000\u0007Ȉ\bȈ", new Object[]{"adFormat_", "countryCode_", "id_", "maxAdUnitId_", "networkName_", "revenue_", "thirdPartyAdPlacementId_", "userSegment_"});
                case 3:
                    return new MaxImpression();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (MaxImpression.class) {
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

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public String getAdFormat() {
            return this.adFormat_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public l getAdFormatBytes() {
            return l.f(this.adFormat_);
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public String getCountryCode() {
            return this.countryCode_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public l getCountryCodeBytes() {
            return l.f(this.countryCode_);
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public String getId() {
            return this.id_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public l getIdBytes() {
            return l.f(this.id_);
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public String getMaxAdUnitId() {
            return this.maxAdUnitId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public l getMaxAdUnitIdBytes() {
            return l.f(this.maxAdUnitId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public String getNetworkName() {
            return this.networkName_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public l getNetworkNameBytes() {
            return l.f(this.networkName_);
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public double getRevenue() {
            return this.revenue_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public String getThirdPartyAdPlacementId() {
            return this.thirdPartyAdPlacementId_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public l getThirdPartyAdPlacementIdBytes() {
            return l.f(this.thirdPartyAdPlacementId_);
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public String getUserSegment() {
            return this.userSegment_;
        }

        @Override // com.moloco.sdk.IlrdRequest.MaxImpressionOrBuilder
        public l getUserSegmentBytes() {
            return l.f(this.userSegment_);
        }

        public static Builder newBuilder(MaxImpression maxImpression) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(maxImpression);
        }

        public static MaxImpression parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (MaxImpression) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static MaxImpression parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static MaxImpression parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static MaxImpression parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static MaxImpression parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static MaxImpression parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static MaxImpression parseFrom(InputStream inputStream) throws IOException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static MaxImpression parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static MaxImpression parseFrom(p pVar) throws IOException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static MaxImpression parseFrom(p pVar, y yVar) throws IOException {
            return (MaxImpression) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface MaxImpressionOrBuilder extends p1 {
        String getAdFormat();

        l getAdFormatBytes();

        String getCountryCode();

        l getCountryCodeBytes();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        String getId();

        l getIdBytes();

        String getMaxAdUnitId();

        l getMaxAdUnitIdBytes();

        String getNetworkName();

        l getNetworkNameBytes();

        double getRevenue();

        String getThirdPartyAdPlacementId();

        l getThirdPartyAdPlacementIdBytes();

        String getUserSegment();

        l getUserSegmentBytes();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    private IlrdRequest() {
    }

    public static void registerAllExtensions(y yVar) {
    }
}
