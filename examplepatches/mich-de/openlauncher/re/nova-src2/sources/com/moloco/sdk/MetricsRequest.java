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
public final class MetricsRequest {

    /* renamed from: com.moloco.sdk.MetricsRequest$1, reason: invalid class name */
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

    public static final class PostMetricsRequest extends n0 implements PostMetricsRequestOrBuilder {
        public static final int COUNTS_FIELD_NUMBER = 1;
        private static final PostMetricsRequest DEFAULT_INSTANCE;
        public static final int DURATIONS_FIELD_NUMBER = 2;
        private static volatile v1 PARSER;
        private z0 counts_ = n0.emptyProtobufList();
        private z0 durations_ = n0.emptyProtobufList();

        public static final class Builder extends f0 implements PostMetricsRequestOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder addAllCounts(Iterable<? extends CountEvent> iterable) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addAllCounts(iterable);
                return this;
            }

            public Builder addAllDurations(Iterable<? extends TimerEvent> iterable) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addAllDurations(iterable);
                return this;
            }

            public Builder addCounts(CountEvent countEvent) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addCounts(countEvent);
                return this;
            }

            public Builder addDurations(TimerEvent timerEvent) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addDurations(timerEvent);
                return this;
            }

            public Builder clearCounts() {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).clearCounts();
                return this;
            }

            public Builder clearDurations() {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).clearDurations();
                return this;
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
            public CountEvent getCounts(int i5) {
                return ((PostMetricsRequest) this.instance).getCounts(i5);
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
            public int getCountsCount() {
                return ((PostMetricsRequest) this.instance).getCountsCount();
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
            public List<CountEvent> getCountsList() {
                return Collections.unmodifiableList(((PostMetricsRequest) this.instance).getCountsList());
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
            public TimerEvent getDurations(int i5) {
                return ((PostMetricsRequest) this.instance).getDurations(i5);
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
            public int getDurationsCount() {
                return ((PostMetricsRequest) this.instance).getDurationsCount();
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
            public List<TimerEvent> getDurationsList() {
                return Collections.unmodifiableList(((PostMetricsRequest) this.instance).getDurationsList());
            }

            public Builder removeCounts(int i5) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).removeCounts(i5);
                return this;
            }

            public Builder removeDurations(int i5) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).removeDurations(i5);
                return this;
            }

            public Builder setCounts(int i5, CountEvent countEvent) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).setCounts(i5, countEvent);
                return this;
            }

            public Builder setDurations(int i5, TimerEvent timerEvent) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).setDurations(i5, timerEvent);
                return this;
            }

            private Builder() {
                super(PostMetricsRequest.DEFAULT_INSTANCE);
            }

            public Builder addCounts(int i5, CountEvent countEvent) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addCounts(i5, countEvent);
                return this;
            }

            public Builder addDurations(int i5, TimerEvent timerEvent) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addDurations(i5, timerEvent);
                return this;
            }

            public Builder setCounts(int i5, CountEvent.Builder builder) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).setCounts(i5, (CountEvent) builder.build());
                return this;
            }

            public Builder setDurations(int i5, TimerEvent.Builder builder) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).setDurations(i5, (TimerEvent) builder.build());
                return this;
            }

            public Builder addCounts(CountEvent.Builder builder) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addCounts((CountEvent) builder.build());
                return this;
            }

            public Builder addDurations(TimerEvent.Builder builder) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addDurations((TimerEvent) builder.build());
                return this;
            }

            public Builder addCounts(int i5, CountEvent.Builder builder) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addCounts(i5, (CountEvent) builder.build());
                return this;
            }

            public Builder addDurations(int i5, TimerEvent.Builder builder) {
                copyOnWrite();
                ((PostMetricsRequest) this.instance).addDurations(i5, (TimerEvent) builder.build());
                return this;
            }
        }

        public static final class CountEvent extends n0 implements CountEventOrBuilder {
            public static final int COUNT_FIELD_NUMBER = 2;
            private static final CountEvent DEFAULT_INSTANCE;
            public static final int NAME_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int TAGS_FIELD_NUMBER = 3;
            private int count_;
            private String name_ = b.f42142b;
            private z0 tags_ = n0.emptyProtobufList();

            public static final class Builder extends f0 implements CountEventOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder addAllTags(Iterable<String> iterable) {
                    copyOnWrite();
                    ((CountEvent) this.instance).addAllTags(iterable);
                    return this;
                }

                public Builder addTags(String str) {
                    copyOnWrite();
                    ((CountEvent) this.instance).addTags(str);
                    return this;
                }

                public Builder addTagsBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((CountEvent) this.instance).addTagsBytes(lVar);
                    return this;
                }

                public Builder clearCount() {
                    copyOnWrite();
                    ((CountEvent) this.instance).clearCount();
                    return this;
                }

                public Builder clearName() {
                    copyOnWrite();
                    ((CountEvent) this.instance).clearName();
                    return this;
                }

                public Builder clearTags() {
                    copyOnWrite();
                    ((CountEvent) this.instance).clearTags();
                    return this;
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
                public int getCount() {
                    return ((CountEvent) this.instance).getCount();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
                public String getName() {
                    return ((CountEvent) this.instance).getName();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
                public l getNameBytes() {
                    return ((CountEvent) this.instance).getNameBytes();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
                public String getTags(int i5) {
                    return ((CountEvent) this.instance).getTags(i5);
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
                public l getTagsBytes(int i5) {
                    return ((CountEvent) this.instance).getTagsBytes(i5);
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
                public int getTagsCount() {
                    return ((CountEvent) this.instance).getTagsCount();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
                public List<String> getTagsList() {
                    return Collections.unmodifiableList(((CountEvent) this.instance).getTagsList());
                }

                public Builder setCount(int i5) {
                    copyOnWrite();
                    ((CountEvent) this.instance).setCount(i5);
                    return this;
                }

                public Builder setName(String str) {
                    copyOnWrite();
                    ((CountEvent) this.instance).setName(str);
                    return this;
                }

                public Builder setNameBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((CountEvent) this.instance).setNameBytes(lVar);
                    return this;
                }

                public Builder setTags(int i5, String str) {
                    copyOnWrite();
                    ((CountEvent) this.instance).setTags(i5, str);
                    return this;
                }

                private Builder() {
                    super(CountEvent.DEFAULT_INSTANCE);
                }
            }

            static {
                CountEvent countEvent = new CountEvent();
                DEFAULT_INSTANCE = countEvent;
                n0.registerDefaultInstance(CountEvent.class, countEvent);
            }

            private CountEvent() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addAllTags(Iterable<String> iterable) {
                ensureTagsIsMutable();
                c.addAll(iterable, this.tags_);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addTags(String str) {
                str.getClass();
                ensureTagsIsMutable();
                this.tags_.add(str);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addTagsBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                ensureTagsIsMutable();
                this.tags_.add(lVar.o());
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearCount() {
                this.count_ = 0;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearName() {
                this.name_ = getDefaultInstance().getName();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearTags() {
                this.tags_ = n0.emptyProtobufList();
            }

            private void ensureTagsIsMutable() {
                z0 z0Var = this.tags_;
                if (((d) z0Var).f34834a) {
                    return;
                }
                this.tags_ = n0.mutableCopy(z0Var);
            }

            public static CountEvent getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static CountEvent parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (CountEvent) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static CountEvent parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setCount(int i5) {
                this.count_ = i5;
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
            public void setTags(int i5, String str) {
                str.getClass();
                ensureTagsIsMutable();
                this.tags_.set(i5, str);
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0001\u0000\u0001Ȉ\u0002\u000b\u0003Ț", new Object[]{"name_", "count_", "tags_"});
                    case 3:
                        return new CountEvent();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (CountEvent.class) {
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

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
            public int getCount() {
                return this.count_;
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
            public String getName() {
                return this.name_;
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
            public l getNameBytes() {
                return l.f(this.name_);
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
            public String getTags(int i5) {
                return (String) this.tags_.get(i5);
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
            public l getTagsBytes(int i5) {
                return l.f((String) this.tags_.get(i5));
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
            public int getTagsCount() {
                return this.tags_.size();
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.CountEventOrBuilder
            public List<String> getTagsList() {
                return this.tags_;
            }

            public static Builder newBuilder(CountEvent countEvent) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(countEvent);
            }

            public static CountEvent parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (CountEvent) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static CountEvent parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static CountEvent parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static CountEvent parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static CountEvent parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static CountEvent parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static CountEvent parseFrom(InputStream inputStream) throws IOException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static CountEvent parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static CountEvent parseFrom(p pVar) throws IOException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static CountEvent parseFrom(p pVar, y yVar) throws IOException {
                return (CountEvent) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface CountEventOrBuilder extends p1 {
            int getCount();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            String getName();

            l getNameBytes();

            String getTags(int i5);

            l getTagsBytes(int i5);

            int getTagsCount();

            List<String> getTagsList();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        public static final class TimerEvent extends n0 implements TimerEventOrBuilder {
            private static final TimerEvent DEFAULT_INSTANCE;
            public static final int ELAPSED_TIME_MILLIS_FIELD_NUMBER = 2;
            public static final int NAME_FIELD_NUMBER = 1;
            private static volatile v1 PARSER = null;
            public static final int TAGS_FIELD_NUMBER = 3;
            private long elapsedTimeMillis_;
            private String name_ = b.f42142b;
            private z0 tags_ = n0.emptyProtobufList();

            public static final class Builder extends f0 implements TimerEventOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder addAllTags(Iterable<String> iterable) {
                    copyOnWrite();
                    ((TimerEvent) this.instance).addAllTags(iterable);
                    return this;
                }

                public Builder addTags(String str) {
                    copyOnWrite();
                    ((TimerEvent) this.instance).addTags(str);
                    return this;
                }

                public Builder addTagsBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((TimerEvent) this.instance).addTagsBytes(lVar);
                    return this;
                }

                public Builder clearElapsedTimeMillis() {
                    copyOnWrite();
                    ((TimerEvent) this.instance).clearElapsedTimeMillis();
                    return this;
                }

                public Builder clearName() {
                    copyOnWrite();
                    ((TimerEvent) this.instance).clearName();
                    return this;
                }

                public Builder clearTags() {
                    copyOnWrite();
                    ((TimerEvent) this.instance).clearTags();
                    return this;
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
                public long getElapsedTimeMillis() {
                    return ((TimerEvent) this.instance).getElapsedTimeMillis();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
                public String getName() {
                    return ((TimerEvent) this.instance).getName();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
                public l getNameBytes() {
                    return ((TimerEvent) this.instance).getNameBytes();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
                public String getTags(int i5) {
                    return ((TimerEvent) this.instance).getTags(i5);
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
                public l getTagsBytes(int i5) {
                    return ((TimerEvent) this.instance).getTagsBytes(i5);
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
                public int getTagsCount() {
                    return ((TimerEvent) this.instance).getTagsCount();
                }

                @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
                public List<String> getTagsList() {
                    return Collections.unmodifiableList(((TimerEvent) this.instance).getTagsList());
                }

                public Builder setElapsedTimeMillis(long j11) {
                    copyOnWrite();
                    ((TimerEvent) this.instance).setElapsedTimeMillis(j11);
                    return this;
                }

                public Builder setName(String str) {
                    copyOnWrite();
                    ((TimerEvent) this.instance).setName(str);
                    return this;
                }

                public Builder setNameBytes(l lVar) throws IllegalArgumentException {
                    copyOnWrite();
                    ((TimerEvent) this.instance).setNameBytes(lVar);
                    return this;
                }

                public Builder setTags(int i5, String str) {
                    copyOnWrite();
                    ((TimerEvent) this.instance).setTags(i5, str);
                    return this;
                }

                private Builder() {
                    super(TimerEvent.DEFAULT_INSTANCE);
                }
            }

            static {
                TimerEvent timerEvent = new TimerEvent();
                DEFAULT_INSTANCE = timerEvent;
                n0.registerDefaultInstance(TimerEvent.class, timerEvent);
            }

            private TimerEvent() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addAllTags(Iterable<String> iterable) {
                ensureTagsIsMutable();
                c.addAll(iterable, this.tags_);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addTags(String str) {
                str.getClass();
                ensureTagsIsMutable();
                this.tags_.add(str);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addTagsBytes(l lVar) throws IllegalArgumentException {
                c.checkByteStringIsUtf8(lVar);
                ensureTagsIsMutable();
                this.tags_.add(lVar.o());
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearElapsedTimeMillis() {
                this.elapsedTimeMillis_ = 0L;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearName() {
                this.name_ = getDefaultInstance().getName();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearTags() {
                this.tags_ = n0.emptyProtobufList();
            }

            private void ensureTagsIsMutable() {
                z0 z0Var = this.tags_;
                if (((d) z0Var).f34834a) {
                    return;
                }
                this.tags_ = n0.mutableCopy(z0Var);
            }

            public static TimerEvent getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static TimerEvent parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (TimerEvent) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static TimerEvent parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setElapsedTimeMillis(long j11) {
                this.elapsedTimeMillis_ = j11;
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
            public void setTags(int i5, String str) {
                str.getClass();
                ensureTagsIsMutable();
                this.tags_.set(i5, str);
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0001\u0000\u0001Ȉ\u0002\u0003\u0003Ț", new Object[]{"name_", "elapsedTimeMillis_", "tags_"});
                    case 3:
                        return new TimerEvent();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (TimerEvent.class) {
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

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
            public long getElapsedTimeMillis() {
                return this.elapsedTimeMillis_;
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
            public String getName() {
                return this.name_;
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
            public l getNameBytes() {
                return l.f(this.name_);
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
            public String getTags(int i5) {
                return (String) this.tags_.get(i5);
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
            public l getTagsBytes(int i5) {
                return l.f((String) this.tags_.get(i5));
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
            public int getTagsCount() {
                return this.tags_.size();
            }

            @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequest.TimerEventOrBuilder
            public List<String> getTagsList() {
                return this.tags_;
            }

            public static Builder newBuilder(TimerEvent timerEvent) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(timerEvent);
            }

            public static TimerEvent parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (TimerEvent) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static TimerEvent parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static TimerEvent parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static TimerEvent parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static TimerEvent parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static TimerEvent parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static TimerEvent parseFrom(InputStream inputStream) throws IOException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static TimerEvent parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static TimerEvent parseFrom(p pVar) throws IOException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static TimerEvent parseFrom(p pVar, y yVar) throws IOException {
                return (TimerEvent) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        public interface TimerEventOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            long getElapsedTimeMillis();

            String getName();

            l getNameBytes();

            String getTags(int i5);

            l getTagsBytes(int i5);

            int getTagsCount();

            List<String> getTagsList();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        static {
            PostMetricsRequest postMetricsRequest = new PostMetricsRequest();
            DEFAULT_INSTANCE = postMetricsRequest;
            n0.registerDefaultInstance(PostMetricsRequest.class, postMetricsRequest);
        }

        private PostMetricsRequest() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addAllCounts(Iterable<? extends CountEvent> iterable) {
            ensureCountsIsMutable();
            c.addAll(iterable, this.counts_);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addAllDurations(Iterable<? extends TimerEvent> iterable) {
            ensureDurationsIsMutable();
            c.addAll(iterable, this.durations_);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addCounts(CountEvent countEvent) {
            countEvent.getClass();
            ensureCountsIsMutable();
            this.counts_.add(countEvent);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addDurations(TimerEvent timerEvent) {
            timerEvent.getClass();
            ensureDurationsIsMutable();
            this.durations_.add(timerEvent);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCounts() {
            this.counts_ = n0.emptyProtobufList();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearDurations() {
            this.durations_ = n0.emptyProtobufList();
        }

        private void ensureCountsIsMutable() {
            z0 z0Var = this.counts_;
            if (((d) z0Var).f34834a) {
                return;
            }
            this.counts_ = n0.mutableCopy(z0Var);
        }

        private void ensureDurationsIsMutable() {
            z0 z0Var = this.durations_;
            if (((d) z0Var).f34834a) {
                return;
            }
            this.durations_ = n0.mutableCopy(z0Var);
        }

        public static PostMetricsRequest getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static PostMetricsRequest parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (PostMetricsRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static PostMetricsRequest parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void removeCounts(int i5) {
            ensureCountsIsMutable();
            this.counts_.remove(i5);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void removeDurations(int i5) {
            ensureDurationsIsMutable();
            this.durations_.remove(i5);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setCounts(int i5, CountEvent countEvent) {
            countEvent.getClass();
            ensureCountsIsMutable();
            this.counts_.set(i5, countEvent);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setDurations(int i5, TimerEvent timerEvent) {
            timerEvent.getClass();
            ensureDurationsIsMutable();
            this.durations_.set(i5, timerEvent);
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0002\u0000\u0001\u001b\u0002\u001b", new Object[]{"counts_", CountEvent.class, "durations_", TimerEvent.class});
                case 3:
                    return new PostMetricsRequest();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (PostMetricsRequest.class) {
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

        @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
        public CountEvent getCounts(int i5) {
            return (CountEvent) this.counts_.get(i5);
        }

        @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
        public int getCountsCount() {
            return this.counts_.size();
        }

        @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
        public List<CountEvent> getCountsList() {
            return this.counts_;
        }

        public CountEventOrBuilder getCountsOrBuilder(int i5) {
            return (CountEventOrBuilder) this.counts_.get(i5);
        }

        public List<? extends CountEventOrBuilder> getCountsOrBuilderList() {
            return this.counts_;
        }

        @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
        public TimerEvent getDurations(int i5) {
            return (TimerEvent) this.durations_.get(i5);
        }

        @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
        public int getDurationsCount() {
            return this.durations_.size();
        }

        @Override // com.moloco.sdk.MetricsRequest.PostMetricsRequestOrBuilder
        public List<TimerEvent> getDurationsList() {
            return this.durations_;
        }

        public TimerEventOrBuilder getDurationsOrBuilder(int i5) {
            return (TimerEventOrBuilder) this.durations_.get(i5);
        }

        public List<? extends TimerEventOrBuilder> getDurationsOrBuilderList() {
            return this.durations_;
        }

        public static Builder newBuilder(PostMetricsRequest postMetricsRequest) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(postMetricsRequest);
        }

        public static PostMetricsRequest parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (PostMetricsRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static PostMetricsRequest parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static PostMetricsRequest parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addCounts(int i5, CountEvent countEvent) {
            countEvent.getClass();
            ensureCountsIsMutable();
            this.counts_.add(i5, countEvent);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addDurations(int i5, TimerEvent timerEvent) {
            timerEvent.getClass();
            ensureDurationsIsMutable();
            this.durations_.add(i5, timerEvent);
        }

        public static PostMetricsRequest parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static PostMetricsRequest parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static PostMetricsRequest parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static PostMetricsRequest parseFrom(InputStream inputStream) throws IOException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static PostMetricsRequest parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static PostMetricsRequest parseFrom(p pVar) throws IOException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static PostMetricsRequest parseFrom(p pVar, y yVar) throws IOException {
            return (PostMetricsRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface PostMetricsRequestOrBuilder extends p1 {
        PostMetricsRequest.CountEvent getCounts(int i5);

        int getCountsCount();

        List<PostMetricsRequest.CountEvent> getCountsList();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        PostMetricsRequest.TimerEvent getDurations(int i5);

        int getDurationsCount();

        List<PostMetricsRequest.TimerEvent> getDurationsList();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    /* loaded from: classes.dex */
    public static final class SDKInitFailureTrackingRequest extends n0 implements SDKInitFailureTrackingRequestOrBuilder {
        public static final int CLIENT_ERROR_FIELD_NUMBER = 2;
        private static final SDKInitFailureTrackingRequest DEFAULT_INSTANCE;
        private static volatile v1 PARSER = null;
        public static final int SERVER_ERROR_FIELD_NUMBER = 1;
        private int errorTypeCase_ = 0;
        private Object errorType_;

        /* loaded from: classes3.dex */
        public static final class Builder extends f0 implements SDKInitFailureTrackingRequestOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearClientError() {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).clearClientError();
                return this;
            }

            public Builder clearErrorType() {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).clearErrorType();
                return this;
            }

            public Builder clearServerError() {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).clearServerError();
                return this;
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
            public ClientError getClientError() {
                return ((SDKInitFailureTrackingRequest) this.instance).getClientError();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
            public ErrorTypeCase getErrorTypeCase() {
                return ((SDKInitFailureTrackingRequest) this.instance).getErrorTypeCase();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
            public ServerError getServerError() {
                return ((SDKInitFailureTrackingRequest) this.instance).getServerError();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
            public boolean hasClientError() {
                return ((SDKInitFailureTrackingRequest) this.instance).hasClientError();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
            public boolean hasServerError() {
                return ((SDKInitFailureTrackingRequest) this.instance).hasServerError();
            }

            public Builder mergeClientError(ClientError clientError) {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).mergeClientError(clientError);
                return this;
            }

            public Builder mergeServerError(ServerError serverError) {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).mergeServerError(serverError);
                return this;
            }

            public Builder setClientError(ClientError clientError) {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).setClientError(clientError);
                return this;
            }

            public Builder setServerError(ServerError serverError) {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).setServerError(serverError);
                return this;
            }

            private Builder() {
                super(SDKInitFailureTrackingRequest.DEFAULT_INSTANCE);
            }

            public Builder setClientError(ClientError.Builder builder) {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).setClientError((ClientError) builder.build());
                return this;
            }

            public Builder setServerError(ServerError.Builder builder) {
                copyOnWrite();
                ((SDKInitFailureTrackingRequest) this.instance).setServerError((ServerError) builder.build());
                return this;
            }
        }

        /* loaded from: classes3.dex */
        public static final class ClientError extends n0 implements ClientErrorOrBuilder {
            public static final int CLIENT_FAILURE_TYPE_FIELD_NUMBER = 1;
            private static final ClientError DEFAULT_INSTANCE;
            private static volatile v1 PARSER;
            private int bitField0_;
            private int clientFailureType_;

            public static final class Builder extends f0 implements ClientErrorOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearClientFailureType() {
                    copyOnWrite();
                    ((ClientError) this.instance).clearClientFailureType();
                    return this;
                }

                @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ClientErrorOrBuilder
                public ClientErrorTypes getClientFailureType() {
                    return ((ClientError) this.instance).getClientFailureType();
                }

                @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ClientErrorOrBuilder
                public int getClientFailureTypeValue() {
                    return ((ClientError) this.instance).getClientFailureTypeValue();
                }

                @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ClientErrorOrBuilder
                public boolean hasClientFailureType() {
                    return ((ClientError) this.instance).hasClientFailureType();
                }

                public Builder setClientFailureType(ClientErrorTypes clientErrorTypes) {
                    copyOnWrite();
                    ((ClientError) this.instance).setClientFailureType(clientErrorTypes);
                    return this;
                }

                public Builder setClientFailureTypeValue(int i5) {
                    copyOnWrite();
                    ((ClientError) this.instance).setClientFailureTypeValue(i5);
                    return this;
                }

                private Builder() {
                    super(ClientError.DEFAULT_INSTANCE);
                }
            }

            public enum ClientErrorTypes implements r0 {
                UNKNOWN(0),
                HTTP_SSL_ERROR(1),
                HTTP_UKNOWN_HOST(2),
                HTTP_REQUEST_TIMEOUT(3),
                HTTP_SOCKET(4),
                ANDROID_WORK_MANAGER_ISSUE(5),
                UNRECOGNIZED(-1);

                public static final int ANDROID_WORK_MANAGER_ISSUE_VALUE = 5;
                public static final int HTTP_REQUEST_TIMEOUT_VALUE = 3;
                public static final int HTTP_SOCKET_VALUE = 4;
                public static final int HTTP_SSL_ERROR_VALUE = 1;
                public static final int HTTP_UKNOWN_HOST_VALUE = 2;
                public static final int UNKNOWN_VALUE = 0;
                private static final s0 internalValueMap = new s0() { // from class: com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes.1
                    @Override // com.google.protobuf.s0
                    public ClientErrorTypes findValueByNumber(int i5) {
                        return ClientErrorTypes.forNumber(i5);
                    }
                };
                private final int value;

                public static final class ClientErrorTypesVerifier implements t0 {
                    static final t0 INSTANCE = new ClientErrorTypesVerifier();

                    private ClientErrorTypesVerifier() {
                    }

                    @Override // com.google.protobuf.t0
                    public boolean isInRange(int i5) {
                        return ClientErrorTypes.forNumber(i5) != null;
                    }
                }

                ClientErrorTypes(int i5) {
                    this.value = i5;
                }

                public static ClientErrorTypes forNumber(int i5) {
                    if (i5 == 0) {
                        return UNKNOWN;
                    }
                    if (i5 == 1) {
                        return HTTP_SSL_ERROR;
                    }
                    if (i5 == 2) {
                        return HTTP_UKNOWN_HOST;
                    }
                    if (i5 == 3) {
                        return HTTP_REQUEST_TIMEOUT;
                    }
                    if (i5 == 4) {
                        return HTTP_SOCKET;
                    }
                    if (i5 != 5) {
                        return null;
                    }
                    return ANDROID_WORK_MANAGER_ISSUE;
                }

                public static s0 internalGetValueMap() {
                    return internalValueMap;
                }

                public static t0 internalGetVerifier() {
                    return ClientErrorTypesVerifier.INSTANCE;
                }

                @Override // com.google.protobuf.r0
                public final int getNumber() {
                    if (this != UNRECOGNIZED) {
                        return this.value;
                    }
                    throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
                }

                @Deprecated
                public static ClientErrorTypes valueOf(int i5) {
                    return forNumber(i5);
                }
            }

            static {
                ClientError clientError = new ClientError();
                DEFAULT_INSTANCE = clientError;
                n0.registerDefaultInstance(ClientError.class, clientError);
            }

            private ClientError() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearClientFailureType() {
                this.bitField0_ &= -2;
                this.clientFailureType_ = 0;
            }

            public static ClientError getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ClientError parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ClientError) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ClientError parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setClientFailureType(ClientErrorTypes clientErrorTypes) {
                this.clientFailureType_ = clientErrorTypes.getNumber();
                this.bitField0_ |= 1;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setClientFailureTypeValue(int i5) {
                this.bitField0_ |= 1;
                this.clientFailureType_ = i5;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဌ\u0000", new Object[]{"bitField0_", "clientFailureType_"});
                    case 3:
                        return new ClientError();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ClientError.class) {
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

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ClientErrorOrBuilder
            public ClientErrorTypes getClientFailureType() {
                ClientErrorTypes clientErrorTypesForNumber = ClientErrorTypes.forNumber(this.clientFailureType_);
                return clientErrorTypesForNumber == null ? ClientErrorTypes.UNRECOGNIZED : clientErrorTypesForNumber;
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ClientErrorOrBuilder
            public int getClientFailureTypeValue() {
                return this.clientFailureType_;
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ClientErrorOrBuilder
            public boolean hasClientFailureType() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(ClientError clientError) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(clientError);
            }

            public static ClientError parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ClientError) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ClientError parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ClientError parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static ClientError parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ClientError parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ClientError parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ClientError parseFrom(InputStream inputStream) throws IOException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ClientError parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ClientError parseFrom(p pVar) throws IOException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ClientError parseFrom(p pVar, y yVar) throws IOException {
                return (ClientError) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        /* loaded from: classes3.dex */
        public interface ClientErrorOrBuilder extends p1 {
            ClientError.ClientErrorTypes getClientFailureType();

            int getClientFailureTypeValue();

            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            boolean hasClientFailureType();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        /* loaded from: classes3.dex */
        public enum ErrorTypeCase {
            SERVER_ERROR(1),
            CLIENT_ERROR(2),
            ERRORTYPE_NOT_SET(0);

            private final int value;

            ErrorTypeCase(int i5) {
                this.value = i5;
            }

            public static ErrorTypeCase forNumber(int i5) {
                if (i5 == 0) {
                    return ERRORTYPE_NOT_SET;
                }
                if (i5 == 1) {
                    return SERVER_ERROR;
                }
                if (i5 != 2) {
                    return null;
                }
                return CLIENT_ERROR;
            }

            public int getNumber() {
                return this.value;
            }

            @Deprecated
            public static ErrorTypeCase valueOf(int i5) {
                return forNumber(i5);
            }
        }

        /* loaded from: classes3.dex */
        public static final class ServerError extends n0 implements ServerErrorOrBuilder {
            private static final ServerError DEFAULT_INSTANCE;
            private static volatile v1 PARSER = null;
            public static final int SERVER_HTTP_STATUS_FIELD_NUMBER = 1;
            private int bitField0_;
            private int serverHttpStatus_;

            public static final class Builder extends f0 implements ServerErrorOrBuilder {
                public /* synthetic */ Builder(int i5) {
                    this();
                }

                public Builder clearServerHttpStatus() {
                    copyOnWrite();
                    ((ServerError) this.instance).clearServerHttpStatus();
                    return this;
                }

                @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ServerErrorOrBuilder
                public int getServerHttpStatus() {
                    return ((ServerError) this.instance).getServerHttpStatus();
                }

                @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ServerErrorOrBuilder
                public boolean hasServerHttpStatus() {
                    return ((ServerError) this.instance).hasServerHttpStatus();
                }

                public Builder setServerHttpStatus(int i5) {
                    copyOnWrite();
                    ((ServerError) this.instance).setServerHttpStatus(i5);
                    return this;
                }

                private Builder() {
                    super(ServerError.DEFAULT_INSTANCE);
                }
            }

            static {
                ServerError serverError = new ServerError();
                DEFAULT_INSTANCE = serverError;
                n0.registerDefaultInstance(ServerError.class, serverError);
            }

            private ServerError() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void clearServerHttpStatus() {
                this.bitField0_ &= -2;
                this.serverHttpStatus_ = 0;
            }

            public static ServerError getDefaultInstance() {
                return DEFAULT_INSTANCE;
            }

            public static Builder newBuilder() {
                return (Builder) DEFAULT_INSTANCE.createBuilder();
            }

            public static ServerError parseDelimitedFrom(InputStream inputStream) throws IOException {
                return (ServerError) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ServerError parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
            }

            public static v1 parser() {
                return DEFAULT_INSTANCE.getParserForType();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void setServerHttpStatus(int i5) {
                this.bitField0_ |= 1;
                this.serverHttpStatus_ = i5;
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
                        return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဋ\u0000", new Object[]{"bitField0_", "serverHttpStatus_"});
                    case 3:
                        return new ServerError();
                    case 4:
                        return new Builder(0);
                    case 5:
                        return DEFAULT_INSTANCE;
                    case 6:
                        v1 v1Var = PARSER;
                        if (v1Var != null) {
                            return v1Var;
                        }
                        synchronized (ServerError.class) {
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

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ServerErrorOrBuilder
            public int getServerHttpStatus() {
                return this.serverHttpStatus_;
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequest.ServerErrorOrBuilder
            public boolean hasServerHttpStatus() {
                return (this.bitField0_ & 1) != 0;
            }

            public static Builder newBuilder(ServerError serverError) {
                return (Builder) DEFAULT_INSTANCE.createBuilder(serverError);
            }

            public static ServerError parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
                return (ServerError) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ServerError parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
            }

            public static ServerError parseFrom(l lVar) throws InvalidProtocolBufferException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, lVar);
            }

            public static ServerError parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
            }

            public static ServerError parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, bArr);
            }

            public static ServerError parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
            }

            public static ServerError parseFrom(InputStream inputStream) throws IOException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
            }

            public static ServerError parseFrom(InputStream inputStream, y yVar) throws IOException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
            }

            public static ServerError parseFrom(p pVar) throws IOException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, pVar);
            }

            public static ServerError parseFrom(p pVar, y yVar) throws IOException {
                return (ServerError) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
            }
        }

        /* loaded from: classes3.dex */
        public interface ServerErrorOrBuilder extends p1 {
            @Override // com.google.protobuf.p1
            /* synthetic */ o1 getDefaultInstanceForType();

            int getServerHttpStatus();

            boolean hasServerHttpStatus();

            @Override // com.google.protobuf.p1
            /* synthetic */ boolean isInitialized();
        }

        static {
            SDKInitFailureTrackingRequest sDKInitFailureTrackingRequest = new SDKInitFailureTrackingRequest();
            DEFAULT_INSTANCE = sDKInitFailureTrackingRequest;
            n0.registerDefaultInstance(SDKInitFailureTrackingRequest.class, sDKInitFailureTrackingRequest);
        }

        private SDKInitFailureTrackingRequest() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearClientError() {
            if (this.errorTypeCase_ == 2) {
                this.errorTypeCase_ = 0;
                this.errorType_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearErrorType() {
            this.errorTypeCase_ = 0;
            this.errorType_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearServerError() {
            if (this.errorTypeCase_ == 1) {
                this.errorTypeCase_ = 0;
                this.errorType_ = null;
            }
        }

        public static SDKInitFailureTrackingRequest getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeClientError(ClientError clientError) {
            clientError.getClass();
            if (this.errorTypeCase_ != 2 || this.errorType_ == ClientError.getDefaultInstance()) {
                this.errorType_ = clientError;
            } else {
                this.errorType_ = ((ClientError.Builder) ClientError.newBuilder((ClientError) this.errorType_).mergeFrom((n0) clientError)).buildPartial();
            }
            this.errorTypeCase_ = 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeServerError(ServerError serverError) {
            serverError.getClass();
            if (this.errorTypeCase_ != 1 || this.errorType_ == ServerError.getDefaultInstance()) {
                this.errorType_ = serverError;
            } else {
                this.errorType_ = ((ServerError.Builder) ServerError.newBuilder((ServerError) this.errorType_).mergeFrom((n0) serverError)).buildPartial();
            }
            this.errorTypeCase_ = 1;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static SDKInitFailureTrackingRequest parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (SDKInitFailureTrackingRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitFailureTrackingRequest parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setClientError(ClientError clientError) {
            clientError.getClass();
            this.errorType_ = clientError;
            this.errorTypeCase_ = 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setServerError(ServerError serverError) {
            serverError.getClass();
            this.errorType_ = serverError;
            this.errorTypeCase_ = 1;
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0001\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000", new Object[]{"errorType_", "errorTypeCase_", ServerError.class, ClientError.class});
                case 3:
                    return new SDKInitFailureTrackingRequest();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (SDKInitFailureTrackingRequest.class) {
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

        @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
        public ClientError getClientError() {
            return this.errorTypeCase_ == 2 ? (ClientError) this.errorType_ : ClientError.getDefaultInstance();
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
        public ErrorTypeCase getErrorTypeCase() {
            return ErrorTypeCase.forNumber(this.errorTypeCase_);
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
        public ServerError getServerError() {
            return this.errorTypeCase_ == 1 ? (ServerError) this.errorType_ : ServerError.getDefaultInstance();
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
        public boolean hasClientError() {
            return this.errorTypeCase_ == 2;
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitFailureTrackingRequestOrBuilder
        public boolean hasServerError() {
            return this.errorTypeCase_ == 1;
        }

        public static Builder newBuilder(SDKInitFailureTrackingRequest sDKInitFailureTrackingRequest) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(sDKInitFailureTrackingRequest);
        }

        public static SDKInitFailureTrackingRequest parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitFailureTrackingRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitFailureTrackingRequest parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static SDKInitFailureTrackingRequest parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static SDKInitFailureTrackingRequest parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static SDKInitFailureTrackingRequest parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static SDKInitFailureTrackingRequest parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static SDKInitFailureTrackingRequest parseFrom(InputStream inputStream) throws IOException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitFailureTrackingRequest parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitFailureTrackingRequest parseFrom(p pVar) throws IOException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static SDKInitFailureTrackingRequest parseFrom(p pVar, y yVar) throws IOException {
            return (SDKInitFailureTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface SDKInitFailureTrackingRequestOrBuilder extends p1 {
        SDKInitFailureTrackingRequest.ClientError getClientError();

        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        SDKInitFailureTrackingRequest.ErrorTypeCase getErrorTypeCase();

        SDKInitFailureTrackingRequest.ServerError getServerError();

        boolean hasClientError();

        boolean hasServerError();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    /* loaded from: classes.dex */
    public static final class SDKInitSuccessTrackingRequest extends n0 implements SDKInitSuccessTrackingRequestOrBuilder {
        private static final SDKInitSuccessTrackingRequest DEFAULT_INSTANCE;
        private static volatile v1 PARSER;

        public static final class Builder extends f0 implements SDKInitSuccessTrackingRequestOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            private Builder() {
                super(SDKInitSuccessTrackingRequest.DEFAULT_INSTANCE);
            }
        }

        static {
            SDKInitSuccessTrackingRequest sDKInitSuccessTrackingRequest = new SDKInitSuccessTrackingRequest();
            DEFAULT_INSTANCE = sDKInitSuccessTrackingRequest;
            n0.registerDefaultInstance(SDKInitSuccessTrackingRequest.class, sDKInitSuccessTrackingRequest);
        }

        private SDKInitSuccessTrackingRequest() {
        }

        public static SDKInitSuccessTrackingRequest getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static SDKInitSuccessTrackingRequest parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (SDKInitSuccessTrackingRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
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
                    return new SDKInitSuccessTrackingRequest();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (SDKInitSuccessTrackingRequest.class) {
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

        public static Builder newBuilder(SDKInitSuccessTrackingRequest sDKInitSuccessTrackingRequest) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(sDKInitSuccessTrackingRequest);
        }

        public static SDKInitSuccessTrackingRequest parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitSuccessTrackingRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(InputStream inputStream) throws IOException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(p pVar) throws IOException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static SDKInitSuccessTrackingRequest parseFrom(p pVar, y yVar) throws IOException {
            return (SDKInitSuccessTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface SDKInitSuccessTrackingRequestOrBuilder extends p1 {
        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    /* loaded from: classes.dex */
    public static final class SDKInitTrackingRequest extends n0 implements SDKInitTrackingRequestOrBuilder {
        private static final SDKInitTrackingRequest DEFAULT_INSTANCE;
        public static final int FAILURE_FIELD_NUMBER = 2;
        public static final int LATENCY_MS_FIELD_NUMBER = 3;
        private static volatile v1 PARSER = null;
        public static final int SUCCESS_FIELD_NUMBER = 1;
        private int bitField0_;
        private int initStatusCase_ = 0;
        private Object initStatus_;
        private long latencyMs_;

        public static final class Builder extends f0 implements SDKInitTrackingRequestOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            public Builder clearFailure() {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).clearFailure();
                return this;
            }

            public Builder clearInitStatus() {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).clearInitStatus();
                return this;
            }

            public Builder clearLatencyMs() {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).clearLatencyMs();
                return this;
            }

            public Builder clearSuccess() {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).clearSuccess();
                return this;
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
            public SDKInitFailureTrackingRequest getFailure() {
                return ((SDKInitTrackingRequest) this.instance).getFailure();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
            public InitStatusCase getInitStatusCase() {
                return ((SDKInitTrackingRequest) this.instance).getInitStatusCase();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
            public long getLatencyMs() {
                return ((SDKInitTrackingRequest) this.instance).getLatencyMs();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
            public SDKInitSuccessTrackingRequest getSuccess() {
                return ((SDKInitTrackingRequest) this.instance).getSuccess();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
            public boolean hasFailure() {
                return ((SDKInitTrackingRequest) this.instance).hasFailure();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
            public boolean hasLatencyMs() {
                return ((SDKInitTrackingRequest) this.instance).hasLatencyMs();
            }

            @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
            public boolean hasSuccess() {
                return ((SDKInitTrackingRequest) this.instance).hasSuccess();
            }

            public Builder mergeFailure(SDKInitFailureTrackingRequest sDKInitFailureTrackingRequest) {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).mergeFailure(sDKInitFailureTrackingRequest);
                return this;
            }

            public Builder mergeSuccess(SDKInitSuccessTrackingRequest sDKInitSuccessTrackingRequest) {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).mergeSuccess(sDKInitSuccessTrackingRequest);
                return this;
            }

            public Builder setFailure(SDKInitFailureTrackingRequest sDKInitFailureTrackingRequest) {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).setFailure(sDKInitFailureTrackingRequest);
                return this;
            }

            public Builder setLatencyMs(long j11) {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).setLatencyMs(j11);
                return this;
            }

            public Builder setSuccess(SDKInitSuccessTrackingRequest sDKInitSuccessTrackingRequest) {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).setSuccess(sDKInitSuccessTrackingRequest);
                return this;
            }

            private Builder() {
                super(SDKInitTrackingRequest.DEFAULT_INSTANCE);
            }

            public Builder setFailure(SDKInitFailureTrackingRequest.Builder builder) {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).setFailure((SDKInitFailureTrackingRequest) builder.build());
                return this;
            }

            public Builder setSuccess(SDKInitSuccessTrackingRequest.Builder builder) {
                copyOnWrite();
                ((SDKInitTrackingRequest) this.instance).setSuccess((SDKInitSuccessTrackingRequest) builder.build());
                return this;
            }
        }

        /* loaded from: classes3.dex */
        public enum InitStatusCase {
            SUCCESS(1),
            FAILURE(2),
            INITSTATUS_NOT_SET(0);

            private final int value;

            InitStatusCase(int i5) {
                this.value = i5;
            }

            public static InitStatusCase forNumber(int i5) {
                if (i5 == 0) {
                    return INITSTATUS_NOT_SET;
                }
                if (i5 == 1) {
                    return SUCCESS;
                }
                if (i5 != 2) {
                    return null;
                }
                return FAILURE;
            }

            public int getNumber() {
                return this.value;
            }

            @Deprecated
            public static InitStatusCase valueOf(int i5) {
                return forNumber(i5);
            }
        }

        static {
            SDKInitTrackingRequest sDKInitTrackingRequest = new SDKInitTrackingRequest();
            DEFAULT_INSTANCE = sDKInitTrackingRequest;
            n0.registerDefaultInstance(SDKInitTrackingRequest.class, sDKInitTrackingRequest);
        }

        private SDKInitTrackingRequest() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearFailure() {
            if (this.initStatusCase_ == 2) {
                this.initStatusCase_ = 0;
                this.initStatus_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearInitStatus() {
            this.initStatusCase_ = 0;
            this.initStatus_ = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearLatencyMs() {
            this.bitField0_ &= -2;
            this.latencyMs_ = 0L;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSuccess() {
            if (this.initStatusCase_ == 1) {
                this.initStatusCase_ = 0;
                this.initStatus_ = null;
            }
        }

        public static SDKInitTrackingRequest getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeFailure(SDKInitFailureTrackingRequest sDKInitFailureTrackingRequest) {
            sDKInitFailureTrackingRequest.getClass();
            if (this.initStatusCase_ != 2 || this.initStatus_ == SDKInitFailureTrackingRequest.getDefaultInstance()) {
                this.initStatus_ = sDKInitFailureTrackingRequest;
            } else {
                this.initStatus_ = ((SDKInitFailureTrackingRequest.Builder) SDKInitFailureTrackingRequest.newBuilder((SDKInitFailureTrackingRequest) this.initStatus_).mergeFrom((n0) sDKInitFailureTrackingRequest)).buildPartial();
            }
            this.initStatusCase_ = 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeSuccess(SDKInitSuccessTrackingRequest sDKInitSuccessTrackingRequest) {
            sDKInitSuccessTrackingRequest.getClass();
            if (this.initStatusCase_ != 1 || this.initStatus_ == SDKInitSuccessTrackingRequest.getDefaultInstance()) {
                this.initStatus_ = sDKInitSuccessTrackingRequest;
            } else {
                this.initStatus_ = ((SDKInitSuccessTrackingRequest.Builder) SDKInitSuccessTrackingRequest.newBuilder((SDKInitSuccessTrackingRequest) this.initStatus_).mergeFrom((n0) sDKInitSuccessTrackingRequest)).buildPartial();
            }
            this.initStatusCase_ = 1;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static SDKInitTrackingRequest parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (SDKInitTrackingRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitTrackingRequest parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static v1 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setFailure(SDKInitFailureTrackingRequest sDKInitFailureTrackingRequest) {
            sDKInitFailureTrackingRequest.getClass();
            this.initStatus_ = sDKInitFailureTrackingRequest;
            this.initStatusCase_ = 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setLatencyMs(long j11) {
            this.bitField0_ |= 1;
            this.latencyMs_ = j11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSuccess(SDKInitSuccessTrackingRequest sDKInitSuccessTrackingRequest) {
            sDKInitSuccessTrackingRequest.getClass();
            this.initStatus_ = sDKInitSuccessTrackingRequest;
            this.initStatusCase_ = 1;
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
                    return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0001\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000\u0003ဃ\u0000", new Object[]{"initStatus_", "initStatusCase_", "bitField0_", SDKInitSuccessTrackingRequest.class, SDKInitFailureTrackingRequest.class, "latencyMs_"});
                case 3:
                    return new SDKInitTrackingRequest();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (SDKInitTrackingRequest.class) {
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

        @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
        public SDKInitFailureTrackingRequest getFailure() {
            return this.initStatusCase_ == 2 ? (SDKInitFailureTrackingRequest) this.initStatus_ : SDKInitFailureTrackingRequest.getDefaultInstance();
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
        public InitStatusCase getInitStatusCase() {
            return InitStatusCase.forNumber(this.initStatusCase_);
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
        public long getLatencyMs() {
            return this.latencyMs_;
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
        public SDKInitSuccessTrackingRequest getSuccess() {
            return this.initStatusCase_ == 1 ? (SDKInitSuccessTrackingRequest) this.initStatus_ : SDKInitSuccessTrackingRequest.getDefaultInstance();
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
        public boolean hasFailure() {
            return this.initStatusCase_ == 2;
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
        public boolean hasLatencyMs() {
            return (this.bitField0_ & 1) != 0;
        }

        @Override // com.moloco.sdk.MetricsRequest.SDKInitTrackingRequestOrBuilder
        public boolean hasSuccess() {
            return this.initStatusCase_ == 1;
        }

        public static Builder newBuilder(SDKInitTrackingRequest sDKInitTrackingRequest) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(sDKInitTrackingRequest);
        }

        public static SDKInitTrackingRequest parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitTrackingRequest) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitTrackingRequest parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static SDKInitTrackingRequest parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static SDKInitTrackingRequest parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static SDKInitTrackingRequest parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static SDKInitTrackingRequest parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static SDKInitTrackingRequest parseFrom(InputStream inputStream) throws IOException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitTrackingRequest parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitTrackingRequest parseFrom(p pVar) throws IOException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static SDKInitTrackingRequest parseFrom(p pVar, y yVar) throws IOException {
            return (SDKInitTrackingRequest) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    /* loaded from: classes.dex */
    public interface SDKInitTrackingRequestOrBuilder extends p1 {
        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        SDKInitFailureTrackingRequest getFailure();

        SDKInitTrackingRequest.InitStatusCase getInitStatusCase();

        long getLatencyMs();

        SDKInitSuccessTrackingRequest getSuccess();

        boolean hasFailure();

        boolean hasLatencyMs();

        boolean hasSuccess();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    public static final class SDKInitTrackingResponse extends n0 implements SDKInitTrackingResponseOrBuilder {
        private static final SDKInitTrackingResponse DEFAULT_INSTANCE;
        private static volatile v1 PARSER;

        public static final class Builder extends f0 implements SDKInitTrackingResponseOrBuilder {
            public /* synthetic */ Builder(int i5) {
                this();
            }

            private Builder() {
                super(SDKInitTrackingResponse.DEFAULT_INSTANCE);
            }
        }

        static {
            SDKInitTrackingResponse sDKInitTrackingResponse = new SDKInitTrackingResponse();
            DEFAULT_INSTANCE = sDKInitTrackingResponse;
            n0.registerDefaultInstance(SDKInitTrackingResponse.class, sDKInitTrackingResponse);
        }

        private SDKInitTrackingResponse() {
        }

        public static SDKInitTrackingResponse getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static SDKInitTrackingResponse parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (SDKInitTrackingResponse) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitTrackingResponse parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
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
                    return new SDKInitTrackingResponse();
                case 4:
                    return new Builder(0);
                case 5:
                    return DEFAULT_INSTANCE;
                case 6:
                    v1 v1Var = PARSER;
                    if (v1Var != null) {
                        return v1Var;
                    }
                    synchronized (SDKInitTrackingResponse.class) {
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

        public static Builder newBuilder(SDKInitTrackingResponse sDKInitTrackingResponse) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(sDKInitTrackingResponse);
        }

        public static SDKInitTrackingResponse parseDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitTrackingResponse) n0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitTrackingResponse parseFrom(ByteBuffer byteBuffer, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, byteBuffer, yVar);
        }

        public static SDKInitTrackingResponse parseFrom(l lVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, lVar);
        }

        public static SDKInitTrackingResponse parseFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, lVar, yVar);
        }

        public static SDKInitTrackingResponse parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static SDKInitTrackingResponse parseFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, bArr, yVar);
        }

        public static SDKInitTrackingResponse parseFrom(InputStream inputStream) throws IOException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SDKInitTrackingResponse parseFrom(InputStream inputStream, y yVar) throws IOException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, inputStream, yVar);
        }

        public static SDKInitTrackingResponse parseFrom(p pVar) throws IOException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, pVar);
        }

        public static SDKInitTrackingResponse parseFrom(p pVar, y yVar) throws IOException {
            return (SDKInitTrackingResponse) n0.parseFrom(DEFAULT_INSTANCE, pVar, yVar);
        }
    }

    public interface SDKInitTrackingResponseOrBuilder extends p1 {
        @Override // com.google.protobuf.p1
        /* synthetic */ o1 getDefaultInstanceForType();

        @Override // com.google.protobuf.p1
        /* synthetic */ boolean isInitialized();
    }

    private MetricsRequest() {
    }

    public static void registerAllExtensions(y yVar) {
    }
}
