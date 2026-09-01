package org.chromium.net.httpflags;

import com.google.protobuf.e;
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
public final class Flags extends e implements FlagsOrBuilder {
    private static final Flags DEFAULT_INSTANCE;
    public static final int FLAGS_FIELD_NUMBER = 1;
    private static volatile q49 PARSER;
    private lh7 flags_ = lh7.b;

    /* JADX INFO: renamed from: org.chromium.net.httpflags.Flags$1, reason: invalid class name */
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
    public static final class FlagsDefaultEntryHolder {
        static final jh7 defaultEntry = new jh7(j6f.STRING, j6f.MESSAGE, FlagValue.getDefaultInstance());

        private FlagsDefaultEntryHolder() {
        }
    }

    static {
        Flags flags = new Flags();
        DEFAULT_INSTANCE = flags;
        e.registerDefaultInstance(Flags.class, flags);
    }

    private Flags() {
    }

    public static Flags getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Map<String, FlagValue> getMutableFlagsMap() {
        return internalGetMutableFlags();
    }

    private lh7 internalGetFlags() {
        return this.flags_;
    }

    private lh7 internalGetMutableFlags() {
        lh7 lh7Var = this.flags_;
        if (lh7Var.a) {
            return lh7Var;
        }
        lh7 lh7VarB = lh7Var.b();
        this.flags_ = lh7VarB;
        return lh7VarB;
    }

    public static Builder newBuilder() {
        return (Builder) DEFAULT_INSTANCE.createBuilder();
    }

    public static Flags parseDelimitedFrom(InputStream inputStream) {
        return (Flags) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static Flags parseFrom(ByteBuffer byteBuffer) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static q49 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public boolean containsFlags(String str) {
        str.getClass();
        return internalGetFlags().containsKey(str);
    }

    @Override // com.google.protobuf.e
    public final Object dynamicMethod(q75 q75Var, Object obj, Object obj2) {
        q49 i75Var;
        int i = AnonymousClass1.$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[q75Var.ordinal()];
        int i2 = 0;
        switch (i) {
            case 1:
                return new Flags();
            case 2:
                return new Builder(i2);
            case 3:
                return e.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"flags_", FlagsDefaultEntryHolder.defaultEntry});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                q49 q49Var = PARSER;
                if (q49Var != null) {
                    return q49Var;
                }
                synchronized (Flags.class) {
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

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    @Deprecated
    public Map<String, FlagValue> getFlags() {
        return getFlagsMap();
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public int getFlagsCount() {
        return internalGetFlags().size();
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public Map<String, FlagValue> getFlagsMap() {
        return DesugarCollections.unmodifiableMap(internalGetFlags());
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public FlagValue getFlagsOrDefault(String str, FlagValue flagValue) {
        str.getClass();
        lh7 lh7VarInternalGetFlags = internalGetFlags();
        return lh7VarInternalGetFlags.containsKey(str) ? (FlagValue) lh7VarInternalGetFlags.get(str) : flagValue;
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public FlagValue getFlagsOrThrow(String str) {
        str.getClass();
        lh7 lh7VarInternalGetFlags = internalGetFlags();
        if (lh7VarInternalGetFlags.containsKey(str)) {
            return (FlagValue) lh7VarInternalGetFlags.get(str);
        }
        lg8.r();
        return null;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder extends f75 implements FlagsOrBuilder {
        private Builder() {
            super(Flags.DEFAULT_INSTANCE);
        }

        public Builder clearFlags() {
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().clear();
            return this;
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public boolean containsFlags(String str) {
            str.getClass();
            return ((Flags) this.instance).getFlagsMap().containsKey(str);
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        @Deprecated
        public Map<String, FlagValue> getFlags() {
            return getFlagsMap();
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public int getFlagsCount() {
            return ((Flags) this.instance).getFlagsMap().size();
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public Map<String, FlagValue> getFlagsMap() {
            return DesugarCollections.unmodifiableMap(((Flags) this.instance).getFlagsMap());
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public FlagValue getFlagsOrDefault(String str, FlagValue flagValue) {
            str.getClass();
            Map<String, FlagValue> flagsMap = ((Flags) this.instance).getFlagsMap();
            return flagsMap.containsKey(str) ? flagsMap.get(str) : flagValue;
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public FlagValue getFlagsOrThrow(String str) {
            str.getClass();
            Map<String, FlagValue> flagsMap = ((Flags) this.instance).getFlagsMap();
            if (flagsMap.containsKey(str)) {
                return flagsMap.get(str);
            }
            lg8.r();
            return null;
        }

        public Builder putAllFlags(Map<String, FlagValue> map) {
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().putAll(map);
            return this;
        }

        public Builder putFlags(String str, FlagValue flagValue) {
            str.getClass();
            flagValue.getClass();
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().put(str, flagValue);
            return this;
        }

        public Builder removeFlags(String str) {
            str.getClass();
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().remove(str);
            return this;
        }

        public /* synthetic */ Builder(int i) {
            this();
        }
    }

    public static Builder newBuilder(Flags flags) {
        return (Builder) DEFAULT_INSTANCE.createBuilder(flags);
    }

    public static Flags parseDelimitedFrom(InputStream inputStream, p74 p74Var) {
        return (Flags) e.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, p74Var);
    }

    public static Flags parseFrom(ByteBuffer byteBuffer, p74 p74Var) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, byteBuffer, p74Var);
    }

    public static Flags parseFrom(f21 f21Var) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, f21Var);
    }

    public static Flags parseFrom(f21 f21Var, p74 p74Var) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, f21Var, p74Var);
    }

    public static Flags parseFrom(byte[] bArr) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static Flags parseFrom(byte[] bArr, p74 p74Var) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, bArr, p74Var);
    }

    public static Flags parseFrom(InputStream inputStream) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static Flags parseFrom(InputStream inputStream, p74 p74Var) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, inputStream, p74Var);
    }

    public static Flags parseFrom(sp1 sp1Var) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, sp1Var);
    }

    public static Flags parseFrom(sp1 sp1Var, p74 p74Var) {
        return (Flags) e.parseFrom(DEFAULT_INSTANCE, sp1Var, p74Var);
    }
}
