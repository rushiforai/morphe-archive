package org.chromium.net.httpflags;

import com.google.protobuf.e;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import defpackage.cz7;
import defpackage.ez7;
import defpackage.f21;
import defpackage.f75;
import defpackage.i75;
import defpackage.j6f;
import defpackage.jh7;
import defpackage.lg8;
import defpackage.lh7;
import defpackage.p74;
import defpackage.q49;
import defpackage.q75;
import defpackage.rd6;
import defpackage.sp1;
import j$.util.DesugarCollections;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class BaseFeatureOverrides extends e implements BaseFeatureOverridesOrBuilder {
    private static final BaseFeatureOverrides DEFAULT_INSTANCE;
    public static final int FEATURE_STATES_FIELD_NUMBER = 1;
    private static volatile q49 PARSER;
    private lh7 featureStates_ = lh7.b;

    /* JADX INFO: renamed from: org.chromium.net.httpflags.BaseFeatureOverrides$1, reason: invalid class name */
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
    public static final class FeatureState extends e implements FeatureStateOrBuilder {
        private static final FeatureState DEFAULT_INSTANCE;
        public static final int ENABLED_FIELD_NUMBER = 1;
        public static final int PARAMS_FIELD_NUMBER = 2;
        private static volatile q49 PARSER;
        private int bitField0_;
        private boolean enabled_;
        private lh7 params_ = lh7.b;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class ParamsDefaultEntryHolder {
            static final jh7 defaultEntry = new jh7(j6f.STRING, j6f.BYTES, f21.b);

            private ParamsDefaultEntryHolder() {
            }
        }

        static {
            FeatureState featureState = new FeatureState();
            DEFAULT_INSTANCE = featureState;
            e.registerDefaultInstance(FeatureState.class, featureState);
        }

        private FeatureState() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearEnabled() {
            this.bitField0_ &= -2;
            this.enabled_ = false;
        }

        public static FeatureState getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Map<String, f21> getMutableParamsMap() {
            return internalGetMutableParams();
        }

        private lh7 internalGetMutableParams() {
            lh7 lh7Var = this.params_;
            if (lh7Var.a) {
                return lh7Var;
            }
            lh7 lh7VarB = lh7Var.b();
            this.params_ = lh7VarB;
            return lh7VarB;
        }

        private lh7 internalGetParams() {
            return this.params_;
        }

        public static Builder newBuilder() {
            return (Builder) DEFAULT_INSTANCE.createBuilder();
        }

        public static FeatureState parseDelimitedFrom(InputStream inputStream) {
            return (FeatureState) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static FeatureState parseFrom(ByteBuffer byteBuffer) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static q49 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEnabled(boolean z) {
            this.bitField0_ |= 1;
            this.enabled_ = z;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public boolean containsParams(String str) {
            str.getClass();
            return internalGetParams().containsKey(str);
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public boolean getEnabled() {
            return this.enabled_;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        @Deprecated
        public Map<String, f21> getParams() {
            return getParamsMap();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public int getParamsCount() {
            return internalGetParams().size();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public Map<String, f21> getParamsMap() {
            return DesugarCollections.unmodifiableMap(internalGetParams());
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public f21 getParamsOrDefault(String str, f21 f21Var) {
            str.getClass();
            lh7 lh7VarInternalGetParams = internalGetParams();
            return lh7VarInternalGetParams.containsKey(str) ? (f21) lh7VarInternalGetParams.get(str) : f21Var;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public f21 getParamsOrThrow(String str) {
            str.getClass();
            lh7 lh7VarInternalGetParams = internalGetParams();
            if (lh7VarInternalGetParams.containsKey(str)) {
                return (f21) lh7VarInternalGetParams.get(str);
            }
            lg8.r();
            return null;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public boolean hasEnabled() {
            return (this.bitField0_ & 1) != 0;
        }

        @Override // com.google.protobuf.e
        public final Object dynamicMethod(q75 q75Var, Object obj, Object obj2) {
            q49 i75Var;
            int i = AnonymousClass1.$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75Var.ordinal()];
            int i2 = 0;
            switch (i) {
                case 1:
                    return new FeatureState();
                case 2:
                    return new Builder(i2);
                case 3:
                    return e.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0001\u0000\u0000\u0001ဇ\u0000\u00022", new Object[]{"bitField0_", mgKMENwrbHf.fgjTgr, "params_", ParamsDefaultEntryHolder.defaultEntry});
                case 4:
                    return DEFAULT_INSTANCE;
                case 5:
                    q49 q49Var = PARSER;
                    if (q49Var != null) {
                        return q49Var;
                    }
                    synchronized (FeatureState.class) {
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

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class Builder extends f75 implements FeatureStateOrBuilder {
            private Builder() {
                super(FeatureState.DEFAULT_INSTANCE);
            }

            public Builder clearEnabled() {
                copyOnWrite();
                ((FeatureState) this.instance).clearEnabled();
                return this;
            }

            public Builder clearParams() {
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().clear();
                return this;
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public boolean containsParams(String str) {
                str.getClass();
                return ((FeatureState) this.instance).getParamsMap().containsKey(str);
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public boolean getEnabled() {
                return ((FeatureState) this.instance).getEnabled();
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            @Deprecated
            public Map<String, f21> getParams() {
                return getParamsMap();
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public int getParamsCount() {
                return ((FeatureState) this.instance).getParamsMap().size();
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public Map<String, f21> getParamsMap() {
                return DesugarCollections.unmodifiableMap(((FeatureState) this.instance).getParamsMap());
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public f21 getParamsOrDefault(String str, f21 f21Var) {
                str.getClass();
                Map<String, f21> paramsMap = ((FeatureState) this.instance).getParamsMap();
                return paramsMap.containsKey(str) ? paramsMap.get(str) : f21Var;
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public f21 getParamsOrThrow(String str) {
                str.getClass();
                Map<String, f21> paramsMap = ((FeatureState) this.instance).getParamsMap();
                if (paramsMap.containsKey(str)) {
                    return paramsMap.get(str);
                }
                lg8.r();
                return null;
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public boolean hasEnabled() {
                return ((FeatureState) this.instance).hasEnabled();
            }

            public Builder putAllParams(Map<String, f21> map) {
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().putAll(map);
                return this;
            }

            public Builder putParams(String str, f21 f21Var) {
                str.getClass();
                f21Var.getClass();
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().put(str, f21Var);
                return this;
            }

            public Builder removeParams(String str) {
                str.getClass();
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().remove(str);
                return this;
            }

            public Builder setEnabled(boolean z) {
                copyOnWrite();
                ((FeatureState) this.instance).setEnabled(z);
                return this;
            }

            public /* synthetic */ Builder(int i) {
                this();
            }
        }

        public static Builder newBuilder(FeatureState featureState) {
            return (Builder) DEFAULT_INSTANCE.createBuilder(featureState);
        }

        public static FeatureState parseDelimitedFrom(InputStream inputStream, p74 p74Var) {
            return (FeatureState) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, p74Var);
        }

        public static FeatureState parseFrom(ByteBuffer byteBuffer, p74 p74Var) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, byteBuffer, p74Var);
        }

        public static FeatureState parseFrom(f21 f21Var) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, f21Var);
        }

        public static FeatureState parseFrom(f21 f21Var, p74 p74Var) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, f21Var, p74Var);
        }

        public static FeatureState parseFrom(byte[] bArr) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static FeatureState parseFrom(byte[] bArr, p74 p74Var) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, bArr, p74Var);
        }

        public static FeatureState parseFrom(InputStream inputStream) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static FeatureState parseFrom(InputStream inputStream, p74 p74Var) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, inputStream, p74Var);
        }

        public static FeatureState parseFrom(sp1 sp1Var) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, sp1Var);
        }

        public static FeatureState parseFrom(sp1 sp1Var, p74 p74Var) {
            return (FeatureState) e.parseFrom(DEFAULT_INSTANCE, sp1Var, p74Var);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public interface FeatureStateOrBuilder extends ez7 {
        boolean containsParams(String str);

        @Override // defpackage.ez7
        /* synthetic */ cz7 getDefaultInstanceForType();

        boolean getEnabled();

        @Deprecated
        Map<String, f21> getParams();

        int getParamsCount();

        Map<String, f21> getParamsMap();

        f21 getParamsOrDefault(String str, f21 f21Var);

        f21 getParamsOrThrow(String str);

        boolean hasEnabled();

        /* synthetic */ boolean isInitialized();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class FeatureStatesDefaultEntryHolder {
        static final jh7 defaultEntry = new jh7(j6f.STRING, j6f.MESSAGE, FeatureState.getDefaultInstance());

        private FeatureStatesDefaultEntryHolder() {
        }
    }

    static {
        BaseFeatureOverrides baseFeatureOverrides = new BaseFeatureOverrides();
        DEFAULT_INSTANCE = baseFeatureOverrides;
        e.registerDefaultInstance(BaseFeatureOverrides.class, baseFeatureOverrides);
    }

    private BaseFeatureOverrides() {
    }

    public static BaseFeatureOverrides getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Map<String, FeatureState> getMutableFeatureStatesMap() {
        return internalGetMutableFeatureStates();
    }

    private lh7 internalGetFeatureStates() {
        return this.featureStates_;
    }

    private lh7 internalGetMutableFeatureStates() {
        lh7 lh7Var = this.featureStates_;
        if (lh7Var.a) {
            return lh7Var;
        }
        lh7 lh7VarB = lh7Var.b();
        this.featureStates_ = lh7VarB;
        return lh7VarB;
    }

    public static Builder newBuilder() {
        return (Builder) DEFAULT_INSTANCE.createBuilder();
    }

    public static BaseFeatureOverrides parseDelimitedFrom(InputStream inputStream) {
        return (BaseFeatureOverrides) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static BaseFeatureOverrides parseFrom(ByteBuffer byteBuffer) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static q49 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public boolean containsFeatureStates(String str) {
        str.getClass();
        return internalGetFeatureStates().containsKey(str);
    }

    @Override // com.google.protobuf.e
    public final Object dynamicMethod(q75 q75Var, Object obj, Object obj2) {
        q49 i75Var;
        int i = AnonymousClass1.$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75Var.ordinal()];
        int i2 = 0;
        switch (i) {
            case 1:
                return new BaseFeatureOverrides();
            case 2:
                return new Builder(i2);
            case 3:
                return e.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"featureStates_", FeatureStatesDefaultEntryHolder.defaultEntry});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                q49 q49Var = PARSER;
                if (q49Var != null) {
                    return q49Var;
                }
                synchronized (BaseFeatureOverrides.class) {
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

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    @Deprecated
    public Map<String, FeatureState> getFeatureStates() {
        return getFeatureStatesMap();
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public int getFeatureStatesCount() {
        return internalGetFeatureStates().size();
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public Map<String, FeatureState> getFeatureStatesMap() {
        return DesugarCollections.unmodifiableMap(internalGetFeatureStates());
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public FeatureState getFeatureStatesOrDefault(String str, FeatureState featureState) {
        str.getClass();
        lh7 lh7VarInternalGetFeatureStates = internalGetFeatureStates();
        return lh7VarInternalGetFeatureStates.containsKey(str) ? (FeatureState) lh7VarInternalGetFeatureStates.get(str) : featureState;
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public FeatureState getFeatureStatesOrThrow(String str) {
        str.getClass();
        lh7 lh7VarInternalGetFeatureStates = internalGetFeatureStates();
        if (lh7VarInternalGetFeatureStates.containsKey(str)) {
            return (FeatureState) lh7VarInternalGetFeatureStates.get(str);
        }
        lg8.r();
        return null;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder extends f75 implements BaseFeatureOverridesOrBuilder {
        private Builder() {
            super(BaseFeatureOverrides.DEFAULT_INSTANCE);
        }

        public Builder clearFeatureStates() {
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().clear();
            return this;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public boolean containsFeatureStates(String str) {
            str.getClass();
            return ((BaseFeatureOverrides) this.instance).getFeatureStatesMap().containsKey(str);
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        @Deprecated
        public Map<String, FeatureState> getFeatureStates() {
            return getFeatureStatesMap();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public int getFeatureStatesCount() {
            return ((BaseFeatureOverrides) this.instance).getFeatureStatesMap().size();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public Map<String, FeatureState> getFeatureStatesMap() {
            return DesugarCollections.unmodifiableMap(((BaseFeatureOverrides) this.instance).getFeatureStatesMap());
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public FeatureState getFeatureStatesOrDefault(String str, FeatureState featureState) {
            str.getClass();
            Map<String, FeatureState> featureStatesMap = ((BaseFeatureOverrides) this.instance).getFeatureStatesMap();
            return featureStatesMap.containsKey(str) ? featureStatesMap.get(str) : featureState;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public FeatureState getFeatureStatesOrThrow(String str) {
            str.getClass();
            Map<String, FeatureState> featureStatesMap = ((BaseFeatureOverrides) this.instance).getFeatureStatesMap();
            if (featureStatesMap.containsKey(str)) {
                return featureStatesMap.get(str);
            }
            lg8.r();
            return null;
        }

        public Builder putAllFeatureStates(Map<String, FeatureState> map) {
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().putAll(map);
            return this;
        }

        public Builder putFeatureStates(String str, FeatureState featureState) {
            str.getClass();
            featureState.getClass();
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().put(str, featureState);
            return this;
        }

        public Builder removeFeatureStates(String str) {
            str.getClass();
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().remove(str);
            return this;
        }

        public /* synthetic */ Builder(int i) {
            this();
        }
    }

    public static Builder newBuilder(BaseFeatureOverrides baseFeatureOverrides) {
        return (Builder) DEFAULT_INSTANCE.createBuilder(baseFeatureOverrides);
    }

    public static BaseFeatureOverrides parseDelimitedFrom(InputStream inputStream, p74 p74Var) {
        return (BaseFeatureOverrides) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, p74Var);
    }

    public static BaseFeatureOverrides parseFrom(ByteBuffer byteBuffer, p74 p74Var) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, byteBuffer, p74Var);
    }

    public static BaseFeatureOverrides parseFrom(f21 f21Var) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, f21Var);
    }

    public static BaseFeatureOverrides parseFrom(f21 f21Var, p74 p74Var) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, f21Var, p74Var);
    }

    public static BaseFeatureOverrides parseFrom(byte[] bArr) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static BaseFeatureOverrides parseFrom(byte[] bArr, p74 p74Var) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, bArr, p74Var);
    }

    public static BaseFeatureOverrides parseFrom(InputStream inputStream) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static BaseFeatureOverrides parseFrom(InputStream inputStream, p74 p74Var) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, inputStream, p74Var);
    }

    public static BaseFeatureOverrides parseFrom(sp1 sp1Var) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, sp1Var);
    }

    public static BaseFeatureOverrides parseFrom(sp1 sp1Var, p74 p74Var) {
        return (BaseFeatureOverrides) e.parseFrom(DEFAULT_INSTANCE, sp1Var, p74Var);
    }
}
