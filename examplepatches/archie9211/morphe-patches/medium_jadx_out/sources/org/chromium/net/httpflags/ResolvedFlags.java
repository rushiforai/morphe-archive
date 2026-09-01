package org.chromium.net.httpflags;

import android.os.Trace;
import defpackage.ay0;
import defpackage.ev6;
import defpackage.f21;
import defpackage.grb;
import defpackage.lv8;
import defpackage.ygf;
import j$.util.DesugarCollections;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import org.chromium.net.httpflags.FlagValue;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ResolvedFlags {
    private final Map<String, Value> mFlags;

    /* JADX INFO: renamed from: org.chromium.net.httpflags.ResolvedFlags$1, reason: invalid class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase;

        static {
            int[] iArr = new int[FlagValue.ConstrainedValue.ValueCase.values().length];
            $SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase = iArr;
            try {
                iArr[FlagValue.ConstrainedValue.ValueCase.BOOL_VALUE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase[FlagValue.ConstrainedValue.ValueCase.INT_VALUE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase[FlagValue.ConstrainedValue.ValueCase.FLOAT_VALUE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase[FlagValue.ConstrainedValue.ValueCase.STRING_VALUE.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase[FlagValue.ConstrainedValue.ValueCase.BYTES_VALUE.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase[FlagValue.ConstrainedValue.ValueCase.VALUE_NOT_SET.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }

    public ResolvedFlags(Map<String, Value> map) {
        this.mFlags = map;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int[] parseVersionString(String str) {
        try {
            if (str.isEmpty()) {
                throw new IllegalArgumentException("Version string is empty");
            }
            StringTokenizer stringTokenizer = new StringTokenizer(str, ".");
            int iCountTokens = stringTokenizer.countTokens();
            int[] iArr = new int[iCountTokens];
            for (int i = 0; i < iCountTokens; i++) {
                iArr[i] = Integer.parseInt(stringTokenizer.nextToken());
            }
            return iArr;
        } catch (RuntimeException e) {
            throw new IllegalArgumentException(ev6.x("Unable to parse HTTP flags version string: `", str, "`"), e);
        }
    }

    public static ResolvedFlags resolve(Flags flags, String str, String str2, boolean z) {
        grb.f("Cronet ResolvedFlags#resolve");
        try {
            int[] versionString = parseVersionString(str2);
            HashMap map = new HashMap();
            for (Map.Entry<String, FlagValue> entry : flags.getFlagsMap().entrySet()) {
                try {
                    Value valueResolve = Value.resolve(entry.getValue(), str, versionString, z);
                    if (valueResolve != null) {
                        map.put(entry.getKey(), valueResolve);
                    }
                } catch (RuntimeException e) {
                    throw new IllegalArgumentException("Unable to resolve HTTP flag `" + entry.getKey() + "`", e);
                }
            }
            ResolvedFlags resolvedFlags = new ResolvedFlags(map);
            Trace.endSection();
            return resolvedFlags;
        } catch (Throwable th) {
            try {
                Trace.endSection();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public Map<String, Value> flags() {
        return DesugarCollections.unmodifiableMap(this.mFlags);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Value {
        private final Object mValue;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public enum Type {
            BOOL,
            INT,
            FLOAT,
            STRING,
            BYTES
        }

        public Value(boolean z) {
            this.mValue = Boolean.valueOf(z);
        }

        private void checkType(Type type) {
            Type type2 = getType();
            if (type == type2) {
                return;
            }
            ygf.f(lv8.r("Attempted to access flag value as ", String.valueOf(type), ", but actual type is ", String.valueOf(type2)));
        }

        private static Value fromConstrainedValue(FlagValue.ConstrainedValue constrainedValue) {
            FlagValue.ConstrainedValue.ValueCase valueCase = constrainedValue.getValueCase();
            switch (AnonymousClass1.$SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase[valueCase.ordinal()]) {
                case 1:
                    return new Value(constrainedValue.getBoolValue());
                case 2:
                    return new Value(constrainedValue.getIntValue());
                case 3:
                    return new Value(constrainedValue.getFloatValue());
                case 4:
                    return new Value(constrainedValue.getStringValue());
                case 5:
                    return new Value(constrainedValue.getBytesValue());
                default:
                    ay0.e("Flag value uses unknown value type ".concat(String.valueOf(valueCase)));
                case 6:
                    return null;
            }
        }

        private static boolean matchesVersion(int[] iArr, int[] iArr2) {
            int i = 0;
            while (i < Math.max(iArr.length, iArr2.length)) {
                int i2 = i < iArr.length ? iArr[i] : 0;
                int i3 = i < iArr2.length ? iArr2[i] : 0;
                if (i2 > i3) {
                    return true;
                }
                if (i2 < i3) {
                    return false;
                }
                i++;
            }
            return true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static Value resolve(FlagValue flagValue, String str, int[] iArr, boolean z) {
            for (FlagValue.ConstrainedValue constrainedValue : flagValue.getConstrainedValuesList()) {
                if (z || constrainedValue.getApplyEvenIfCronetTelemetryDisabled()) {
                    if (!constrainedValue.hasAppId() || constrainedValue.getAppId().equals(str)) {
                        if (!constrainedValue.hasMinVersion() || matchesVersion(iArr, ResolvedFlags.parseVersionString(constrainedValue.getMinVersion()))) {
                            return fromConstrainedValue(constrainedValue);
                        }
                    }
                }
            }
            return null;
        }

        public boolean getBoolValue() {
            checkType(Type.BOOL);
            return ((Boolean) this.mValue).booleanValue();
        }

        public f21 getBytesValue() {
            checkType(Type.BYTES);
            return (f21) this.mValue;
        }

        public float getFloatValue() {
            checkType(Type.FLOAT);
            return ((Float) this.mValue).floatValue();
        }

        public long getIntValue() {
            checkType(Type.INT);
            return ((Long) this.mValue).longValue();
        }

        public String getStringValue() {
            checkType(Type.STRING);
            return (String) this.mValue;
        }

        public Type getType() {
            Object obj = this.mValue;
            if (obj instanceof Boolean) {
                return Type.BOOL;
            }
            if (obj instanceof Long) {
                return Type.INT;
            }
            if (obj instanceof Float) {
                return Type.FLOAT;
            }
            if (obj instanceof String) {
                return Type.STRING;
            }
            if (obj instanceof f21) {
                return Type.BYTES;
            }
            ygf.f("Unexpected flag value type: ".concat(obj.getClass().getName()));
            return null;
        }

        public String toString() {
            return this.mValue.toString();
        }

        public Value(long j) {
            this.mValue = Long.valueOf(j);
        }

        public Value(float f) {
            this.mValue = Float.valueOf(f);
        }

        public Value(String str) {
            this.mValue = str;
        }

        public Value(f21 f21Var) {
            this.mValue = f21Var;
        }
    }
}
