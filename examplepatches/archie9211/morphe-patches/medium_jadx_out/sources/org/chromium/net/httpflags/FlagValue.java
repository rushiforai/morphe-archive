package org.chromium.net.httpflags;

import com.google.protobuf.e;
import defpackage.a2;
import defpackage.c21;
import defpackage.cz7;
import defpackage.ez7;
import defpackage.f21;
import defpackage.f75;
import defpackage.i75;
import defpackage.p74;
import defpackage.q49;
import defpackage.q75;
import defpackage.r1;
import defpackage.rd6;
import defpackage.sp1;
import defpackage.t56;
import defpackage.v56;
import j$.util.DesugarCollections;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class FlagValue extends e implements FlagValueOrBuilder {
    public static final int CONSTRAINED_VALUES_FIELD_NUMBER = 8;
    private static final FlagValue DEFAULT_INSTANCE;
    private static volatile q49 PARSER;
    private t56 constrainedValues_ = e.emptyProtobufList();

    /* JADX INFO: renamed from: org.chromium.net.httpflags.FlagValue$1, reason: invalid class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke;

        static {
            int[] iArr = new int[q75.values().length];
            $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke = iArr;
            try {
                iArr[q75.NEW_MUTABLE_INSTANCE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75.NEW_BUILDER.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75.BUILD_MESSAGE_INFO.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75.GET_DEFAULT_INSTANCE.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75.GET_PARSER.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75.GET_MEMOIZED_IS_INITIALIZED.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75.SET_MEMOIZED_IS_INITIALIZED.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public interface ConstrainedValueOrBuilder extends ez7 {
        String getAppId();

        f21 getAppIdBytes();

        boolean getApplyEvenIfCronetTelemetryDisabled();

        boolean getBoolValue();

        f21 getBytesValue();

        @Override // defpackage.ez7
        /* synthetic */ cz7 getDefaultInstanceForType();

        float getFloatValue();

        long getIntValue();

        String getMinVersion();

        f21 getMinVersionBytes();

        String getStringValue();

        f21 getStringValueBytes();

        ConstrainedValue.ValueCase getValueCase();

        boolean hasAppId();

        boolean hasApplyEvenIfCronetTelemetryDisabled();

        boolean hasBoolValue();

        boolean hasBytesValue();

        boolean hasFloatValue();

        boolean hasIntValue();

        boolean hasMinVersion();

        boolean hasStringValue();

        /* synthetic */ boolean isInitialized();
    }

    static {
        FlagValue flagValue = new FlagValue();
        DEFAULT_INSTANCE = flagValue;
        e.registerDefaultInstance(FlagValue.class, flagValue);
    }

    private FlagValue() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addAllConstrainedValues(Iterable<? extends ConstrainedValue> iterable) {
        ensureConstrainedValuesIsMutable();
        r1.addAll((Iterable) iterable, (List) this.constrainedValues_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addConstrainedValues(ConstrainedValue constrainedValue) {
        constrainedValue.getClass();
        ensureConstrainedValuesIsMutable();
        this.constrainedValues_.add(constrainedValue);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearConstrainedValues() {
        this.constrainedValues_ = e.emptyProtobufList();
    }

    private void ensureConstrainedValuesIsMutable() {
        t56 t56Var = this.constrainedValues_;
        if (((a2) t56Var).a) {
            return;
        }
        this.constrainedValues_ = e.mutableCopy(t56Var);
    }

    public static FlagValue getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static Builder newBuilder() {
        return (Builder) DEFAULT_INSTANCE.createBuilder();
    }

    public static FlagValue parseDelimitedFrom(InputStream inputStream) {
        return (FlagValue) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static FlagValue parseFrom(ByteBuffer byteBuffer) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static q49 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeConstrainedValues(int i) {
        ensureConstrainedValuesIsMutable();
        this.constrainedValues_.remove(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setConstrainedValues(int i, ConstrainedValue constrainedValue) {
        constrainedValue.getClass();
        ensureConstrainedValuesIsMutable();
        this.constrainedValues_.set(i, constrainedValue);
    }

    @Override // com.google.protobuf.e
    public final Object dynamicMethod(q75 q75Var, Object obj, Object obj2) {
        q49 i75Var;
        int i = AnonymousClass1.$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75Var.ordinal()];
        int i2 = 0;
        switch (i) {
            case 1:
                return new FlagValue();
            case 2:
                return new Builder(i2);
            case 3:
                return e.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\b\b\u0001\u0000\u0001\u0000\b\u001b", new Object[]{"constrainedValues_", ConstrainedValue.class});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                q49 q49Var = PARSER;
                if (q49Var != null) {
                    return q49Var;
                }
                synchronized (FlagValue.class) {
                    try {
                        i75Var = PARSER;
                        if (i75Var == null) {
                            i75Var = new i75();
                            PARSER = i75Var;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                    break;
                }
                return i75Var;
            case 6:
                return (byte) 1;
            default:
                rd6.b();
            case 7:
                return null;
        }
    }

    @Override // org.chromium.net.httpflags.FlagValueOrBuilder
    public ConstrainedValue getConstrainedValues(int i) {
        return (ConstrainedValue) this.constrainedValues_.get(i);
    }

    @Override // org.chromium.net.httpflags.FlagValueOrBuilder
    public int getConstrainedValuesCount() {
        return this.constrainedValues_.size();
    }

    @Override // org.chromium.net.httpflags.FlagValueOrBuilder
    public List<ConstrainedValue> getConstrainedValuesList() {
        return this.constrainedValues_;
    }

    public ConstrainedValueOrBuilder getConstrainedValuesOrBuilder(int i) {
        return (ConstrainedValueOrBuilder) this.constrainedValues_.get(i);
    }

    public List<? extends ConstrainedValueOrBuilder> getConstrainedValuesOrBuilderList() {
        return this.constrainedValues_;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class ConstrainedValue extends e implements ConstrainedValueOrBuilder {
        public static final int APPLY_EVEN_IF_CRONET_TELEMETRY_DISABLED_FIELD_NUMBER = 8;
        public static final int APP_ID_FIELD_NUMBER = 1;
        public static final int BOOL_VALUE_FIELD_NUMBER = 3;
        public static final int BYTES_VALUE_FIELD_NUMBER = 7;
        private static final ConstrainedValue DEFAULT_INSTANCE;
        public static final int FLOAT_VALUE_FIELD_NUMBER = 5;
        public static final int INT_VALUE_FIELD_NUMBER = 4;
        public static final int MIN_VERSION_FIELD_NUMBER = 2;
        private static volatile q49 PARSER = null;
        public static final int STRING_VALUE_FIELD_NUMBER = 6;
        private boolean applyEvenIfCronetTelemetryDisabled_;
        private int bitField0_;
        private Object value_;
        private int valueCase_ = 0;
        private String appId_ = "";
        private String minVersion_ = "";

        static {
            ConstrainedValue constrainedValue = new ConstrainedValue();
            DEFAULT_INSTANCE = constrainedValue;
            e.registerDefaultInstance(ConstrainedValue.class, constrainedValue);
        }

        private ConstrainedValue() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearAppId() {
            this.bitField0_ &= -2;
            this.appId_ = getDefaultInstance().getAppId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearApplyEvenIfCronetTelemetryDisabled() {
            this.bitField0_ &= -5;
            this.applyEvenIfCronetTelemetryDisabled_ = false;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearBoolValue() {
            if (this.valueCase_ == 3) {
                this.valueCase_ = 0;
                this.value_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearBytesValue() {
            if (this.valueCase_ == 7) {
                this.valueCase_ = 0;
                this.value_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearFloatValue() {
            if (this.valueCase_ == 5) {
                this.valueCase_ = 0;
                this.value_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearIntValue() {
            if (this.valueCase_ == 4) {
                this.valueCase_ = 0;
                this.value_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearMinVersion() {
            this.bitField0_ &= -3;
            this.minVersion_ = getDefaultInstance().getMinVersion();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearStringValue() {
            if (this.valueCase_ == 6) {
                this.valueCase_ = 0;
                this.value_ = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearValue() {
            this.valueCase_ = 0;
            this.value_ = null;
        }

        public static ConstrainedValue getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static ConstrainedValue parseDelimitedFrom(InputStream inputStream) {
            return (ConstrainedValue) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ConstrainedValue parseFrom(ByteBuffer byteBuffer) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static q49 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAppId(String str) {
            str.getClass();
            this.bitField0_ |= 1;
            this.appId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAppIdBytes(f21 f21Var) {
            this.appId_ = f21Var.u();
            this.bitField0_ |= 1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setApplyEvenIfCronetTelemetryDisabled(boolean z) {
            this.bitField0_ |= 4;
            this.applyEvenIfCronetTelemetryDisabled_ = z;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBoolValue(boolean z) {
            this.valueCase_ = 3;
            this.value_ = Boolean.valueOf(z);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setBytesValue(f21 f21Var) {
            f21Var.getClass();
            this.valueCase_ = 7;
            this.value_ = f21Var;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setFloatValue(float f) {
            this.valueCase_ = 5;
            this.value_ = Float.valueOf(f);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIntValue(long j) {
            this.valueCase_ = 4;
            this.value_ = Long.valueOf(j);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setMinVersion(String str) {
            str.getClass();
            this.bitField0_ |= 2;
            this.minVersion_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setMinVersionBytes(f21 f21Var) {
            this.minVersion_ = f21Var.u();
            this.bitField0_ |= 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setStringValue(String str) {
            str.getClass();
            this.valueCase_ = 6;
            this.value_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setStringValueBytes(f21 f21Var) {
            this.value_ = f21Var.u();
            this.valueCase_ = 6;
        }

        @Override // com.google.protobuf.e
        public final Object dynamicMethod(q75 q75Var, Object obj, Object obj2) {
            q49 i75Var;
            int i = AnonymousClass1.$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75Var.ordinal()];
            int i2 = 0;
            switch (i) {
                case 1:
                    return new ConstrainedValue();
                case 2:
                    return new Builder(i2);
                case 3:
                    return e.newMessageInfo(DEFAULT_INSTANCE, "\u0001\b\u0001\u0001\u0001\b\b\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003:\u0000\u00045\u0000\u00054\u0000\u0006;\u0000\u0007=\u0000\bဇ\u0002", new Object[]{"value_", "valueCase_", "bitField0_", "appId_", "minVersion_", "applyEvenIfCronetTelemetryDisabled_"});
                case 4:
                    return DEFAULT_INSTANCE;
                case 5:
                    q49 q49Var = PARSER;
                    if (q49Var != null) {
                        return q49Var;
                    }
                    synchronized (ConstrainedValue.class) {
                        try {
                            i75Var = PARSER;
                            if (i75Var == null) {
                                i75Var = new i75();
                                PARSER = i75Var;
                            }
                        } catch (Throwable th) {
                            throw th;
                        }
                        break;
                    }
                    return i75Var;
                case 6:
                    return (byte) 1;
                default:
                    rd6.b();
                case 7:
                    return null;
            }
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public String getAppId() {
            return this.appId_;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public f21 getAppIdBytes() {
            String str = this.appId_;
            c21 c21Var = f21.b;
            return new c21(str.getBytes(v56.a));
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean getApplyEvenIfCronetTelemetryDisabled() {
            return this.applyEvenIfCronetTelemetryDisabled_;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean getBoolValue() {
            if (this.valueCase_ == 3) {
                return ((Boolean) this.value_).booleanValue();
            }
            return false;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public f21 getBytesValue() {
            return this.valueCase_ == 7 ? (f21) this.value_ : f21.b;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public float getFloatValue() {
            if (this.valueCase_ == 5) {
                return ((Float) this.value_).floatValue();
            }
            return 0.0f;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public long getIntValue() {
            if (this.valueCase_ == 4) {
                return ((Long) this.value_).longValue();
            }
            return 0L;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public String getMinVersion() {
            return this.minVersion_;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public f21 getMinVersionBytes() {
            String str = this.minVersion_;
            c21 c21Var = f21.b;
            return new c21(str.getBytes(v56.a));
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public String getStringValue() {
            return this.valueCase_ == 6 ? (String) this.value_ : "";
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public f21 getStringValueBytes() {
            String str = this.valueCase_ == 6 ? (String) this.value_ : "";
            c21 c21Var = f21.b;
            return new c21(str.getBytes(v56.a));
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public ValueCase getValueCase() {
            return ValueCase.forNumber(this.valueCase_);
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasAppId() {
            return (this.bitField0_ & 1) != 0;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasApplyEvenIfCronetTelemetryDisabled() {
            return (this.bitField0_ & 4) != 0;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasBoolValue() {
            return this.valueCase_ == 3;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasBytesValue() {
            return this.valueCase_ == 7;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasFloatValue() {
            return this.valueCase_ == 5;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasIntValue() {
            return this.valueCase_ == 4;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasMinVersion() {
            return (this.bitField0_ & 2) != 0;
        }

        @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
        public boolean hasStringValue() {
            return this.valueCase_ == 6;
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class Builder extends f75 implements ConstrainedValueOrBuilder {
            private Builder() {
                super(ConstrainedValue.DEFAULT_INSTANCE);
            }

            public Builder clearAppId() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearAppId();
                return this;
            }

            public Builder clearApplyEvenIfCronetTelemetryDisabled() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearApplyEvenIfCronetTelemetryDisabled();
                return this;
            }

            public Builder clearBoolValue() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearBoolValue();
                return this;
            }

            public Builder clearBytesValue() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearBytesValue();
                return this;
            }

            public Builder clearFloatValue() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearFloatValue();
                return this;
            }

            public Builder clearIntValue() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearIntValue();
                return this;
            }

            public Builder clearMinVersion() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearMinVersion();
                return this;
            }

            public Builder clearStringValue() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearStringValue();
                return this;
            }

            public Builder clearValue() {
                copyOnWrite();
                ((ConstrainedValue) this.instance).clearValue();
                return this;
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public String getAppId() {
                return ((ConstrainedValue) this.instance).getAppId();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public f21 getAppIdBytes() {
                return ((ConstrainedValue) this.instance).getAppIdBytes();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean getApplyEvenIfCronetTelemetryDisabled() {
                return ((ConstrainedValue) this.instance).getApplyEvenIfCronetTelemetryDisabled();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean getBoolValue() {
                return ((ConstrainedValue) this.instance).getBoolValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public f21 getBytesValue() {
                return ((ConstrainedValue) this.instance).getBytesValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public float getFloatValue() {
                return ((ConstrainedValue) this.instance).getFloatValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public long getIntValue() {
                return ((ConstrainedValue) this.instance).getIntValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public String getMinVersion() {
                return ((ConstrainedValue) this.instance).getMinVersion();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public f21 getMinVersionBytes() {
                return ((ConstrainedValue) this.instance).getMinVersionBytes();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public String getStringValue() {
                return ((ConstrainedValue) this.instance).getStringValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public f21 getStringValueBytes() {
                return ((ConstrainedValue) this.instance).getStringValueBytes();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public ValueCase getValueCase() {
                return ((ConstrainedValue) this.instance).getValueCase();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasAppId() {
                return ((ConstrainedValue) this.instance).hasAppId();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasApplyEvenIfCronetTelemetryDisabled() {
                return ((ConstrainedValue) this.instance).hasApplyEvenIfCronetTelemetryDisabled();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasBoolValue() {
                return ((ConstrainedValue) this.instance).hasBoolValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasBytesValue() {
                return ((ConstrainedValue) this.instance).hasBytesValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasFloatValue() {
                return ((ConstrainedValue) this.instance).hasFloatValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasIntValue() {
                return ((ConstrainedValue) this.instance).hasIntValue();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasMinVersion() {
                return ((ConstrainedValue) this.instance).hasMinVersion();
            }

            @Override // org.chromium.net.httpflags.FlagValue.ConstrainedValueOrBuilder
            public boolean hasStringValue() {
                return ((ConstrainedValue) this.instance).hasStringValue();
            }

            public Builder setAppId(String str) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setAppId(str);
                return this;
            }

            public Builder setAppIdBytes(f21 f21Var) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setAppIdBytes(f21Var);
                return this;
            }

            public Builder setApplyEvenIfCronetTelemetryDisabled(boolean z) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setApplyEvenIfCronetTelemetryDisabled(z);
                return this;
            }

            public Builder setBoolValue(boolean z) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setBoolValue(z);
                return this;
            }

            public Builder setBytesValue(f21 f21Var) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setBytesValue(f21Var);
                return this;
            }

            public Builder setFloatValue(float f) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setFloatValue(f);
                return this;
            }

            public Builder setIntValue(long j) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setIntValue(j);
                return this;
            }

            public Builder setMinVersion(String str) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setMinVersion(str);
                return this;
            }

            public Builder setMinVersionBytes(f21 f21Var) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setMinVersionBytes(f21Var);
                return this;
            }

            public Builder setStringValue(String str) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setStringValue(str);
                return this;
            }

            public Builder setStringValueBytes(f21 f21Var) {
                copyOnWrite();
                ((ConstrainedValue) this.instance).setStringValueBytes(f21Var);
                return this;
            }

            public /* synthetic */ Builder(int i) {
                this();
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public enum ValueCase {
            BOOL_VALUE(3),
            INT_VALUE(4),
            FLOAT_VALUE(5),
            STRING_VALUE(6),
            BYTES_VALUE(7),
            VALUE_NOT_SET(0);

            private final int value;

            ValueCase(int i) {
                this.value = i;
            }

            public static ValueCase forNumber(int i) {
                if (i == 0) {
                    return VALUE_NOT_SET;
                }
                if (i == 3) {
                    return BOOL_VALUE;
                }
                if (i == 4) {
                    return INT_VALUE;
                }
                if (i == 5) {
                    return FLOAT_VALUE;
                }
                if (i == 6) {
                    return STRING_VALUE;
                }
                if (i != 7) {
                    return null;
                }
                return BYTES_VALUE;
            }

            public int getNumber() {
                return this.value;
            }

            @Deprecated
            public static ValueCase valueOf(int i) {
                return forNumber(i);
            }
        }

        public static Builder newBuilder(ConstrainedValue constrainedValue) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(constrainedValue);
        }

        public static ConstrainedValue parseDelimitedFrom(InputStream inputStream, p74 p74Var) {
            return (ConstrainedValue) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, p74Var);
        }

        public static ConstrainedValue parseFrom(ByteBuffer byteBuffer, p74 p74Var) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, byteBuffer, p74Var);
        }

        public static ConstrainedValue parseFrom(f21 f21Var) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, f21Var);
        }

        public static ConstrainedValue parseFrom(f21 f21Var, p74 p74Var) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, f21Var, p74Var);
        }

        public static ConstrainedValue parseFrom(byte[] bArr) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static ConstrainedValue parseFrom(byte[] bArr, p74 p74Var) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, bArr, p74Var);
        }

        public static ConstrainedValue parseFrom(InputStream inputStream) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static ConstrainedValue parseFrom(InputStream inputStream, p74 p74Var) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, inputStream, p74Var);
        }

        public static ConstrainedValue parseFrom(sp1 sp1Var) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, sp1Var);
        }

        public static ConstrainedValue parseFrom(sp1 sp1Var, p74 p74Var) {
            return (ConstrainedValue) e.parseFrom(DEFAULT_INSTANCE, sp1Var, p74Var);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder extends f75 implements FlagValueOrBuilder {
        private Builder() {
            super(FlagValue.DEFAULT_INSTANCE);
        }

        public Builder addAllConstrainedValues(Iterable<? extends ConstrainedValue> iterable) {
            copyOnWrite();
            ((FlagValue) this.instance).addAllConstrainedValues(iterable);
            return this;
        }

        public Builder addConstrainedValues(ConstrainedValue.Builder builder) {
            copyOnWrite();
            ((FlagValue) this.instance).addConstrainedValues((ConstrainedValue) builder.m106build());
            return this;
        }

        public Builder clearConstrainedValues() {
            copyOnWrite();
            ((FlagValue) this.instance).clearConstrainedValues();
            return this;
        }

        @Override // org.chromium.net.httpflags.FlagValueOrBuilder
        public ConstrainedValue getConstrainedValues(int i) {
            return ((FlagValue) this.instance).getConstrainedValues(i);
        }

        @Override // org.chromium.net.httpflags.FlagValueOrBuilder
        public int getConstrainedValuesCount() {
            return ((FlagValue) this.instance).getConstrainedValuesCount();
        }

        @Override // org.chromium.net.httpflags.FlagValueOrBuilder
        public List<ConstrainedValue> getConstrainedValuesList() {
            return DesugarCollections.unmodifiableList(((FlagValue) this.instance).getConstrainedValuesList());
        }

        public Builder removeConstrainedValues(int i) {
            copyOnWrite();
            ((FlagValue) this.instance).removeConstrainedValues(i);
            return this;
        }

        public Builder setConstrainedValues(int i, ConstrainedValue.Builder builder) {
            copyOnWrite();
            ((FlagValue) this.instance).setConstrainedValues(i, (ConstrainedValue) builder.m106build());
            return this;
        }

        public /* synthetic */ Builder(int i) {
            this();
        }

        public Builder addConstrainedValues(int i, ConstrainedValue constrainedValue) {
            copyOnWrite();
            ((FlagValue) this.instance).addConstrainedValues(i, constrainedValue);
            return this;
        }

        public Builder setConstrainedValues(int i, ConstrainedValue constrainedValue) {
            copyOnWrite();
            ((FlagValue) this.instance).setConstrainedValues(i, constrainedValue);
            return this;
        }

        public Builder addConstrainedValues(ConstrainedValue constrainedValue) {
            copyOnWrite();
            ((FlagValue) this.instance).addConstrainedValues(constrainedValue);
            return this;
        }

        public Builder addConstrainedValues(int i, ConstrainedValue.Builder builder) {
            copyOnWrite();
            ((FlagValue) this.instance).addConstrainedValues(i, (ConstrainedValue) builder.m106build());
            return this;
        }
    }

    public static Builder newBuilder(FlagValue flagValue) {
        return (Builder) DEFAULT_INSTANCE.createBuilder(flagValue);
    }

    public static FlagValue parseDelimitedFrom(InputStream inputStream, p74 p74Var) {
        return (FlagValue) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, p74Var);
    }

    public static FlagValue parseFrom(ByteBuffer byteBuffer, p74 p74Var) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, byteBuffer, p74Var);
    }

    public static FlagValue parseFrom(f21 f21Var) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, f21Var);
    }

    public static FlagValue parseFrom(f21 f21Var, p74 p74Var) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, f21Var, p74Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addConstrainedValues(int i, ConstrainedValue constrainedValue) {
        constrainedValue.getClass();
        ensureConstrainedValuesIsMutable();
        this.constrainedValues_.add(i, constrainedValue);
    }

    public static FlagValue parseFrom(byte[] bArr) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static FlagValue parseFrom(byte[] bArr, p74 p74Var) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, bArr, p74Var);
    }

    public static FlagValue parseFrom(InputStream inputStream) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static FlagValue parseFrom(InputStream inputStream, p74 p74Var) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, inputStream, p74Var);
    }

    public static FlagValue parseFrom(sp1 sp1Var) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, sp1Var);
    }

    public static FlagValue parseFrom(sp1 sp1Var, p74 p74Var) {
        return (FlagValue) e.parseFrom(DEFAULT_INSTANCE, sp1Var, p74Var);
    }
}
