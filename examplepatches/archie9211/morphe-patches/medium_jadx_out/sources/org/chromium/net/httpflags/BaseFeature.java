package org.chromium.net.httpflags;

import defpackage.ay0;
import defpackage.c21;
import defpackage.ev6;
import defpackage.f21;
import defpackage.ik4;
import defpackage.lv8;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import org.chromium.net.httpflags.BaseFeatureOverrides;
import org.chromium.net.httpflags.ResolvedFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class BaseFeature {
    public static final String FLAG_PREFIX = "ChromiumBaseFeature_";
    public static final String PARAM_DELIMITER = "_PARAM_";

    /* JADX INFO: renamed from: org.chromium.net.httpflags.BaseFeature$1, reason: invalid class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type;

        static {
            int[] iArr = new int[ResolvedFlags.Value.Type.values().length];
            $SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type = iArr;
            try {
                iArr[ResolvedFlags.Value.Type.BOOL.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type[ResolvedFlags.Value.Type.INT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type[ResolvedFlags.Value.Type.FLOAT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type[ResolvedFlags.Value.Type.STRING.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type[ResolvedFlags.Value.Type.BYTES.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
        }
    }

    private BaseFeature() {
    }

    private static void applyOverride(String str, ResolvedFlags.Value value, Map<String, BaseFeatureOverrides.FeatureState.Builder> map) {
        ParsedFlagName flagName = parseFlagName(str);
        if (flagName == null) {
            return;
        }
        BaseFeatureOverrides.FeatureState.Builder builderNewBuilder = map.get(flagName.featureName);
        if (builderNewBuilder == null) {
            builderNewBuilder = BaseFeatureOverrides.FeatureState.newBuilder();
            map.put(flagName.featureName, builderNewBuilder);
        }
        String str2 = flagName.paramName;
        if (str2 == null) {
            applyStateOverride(value, builderNewBuilder);
        } else {
            applyParamOverride(str2, value, builderNewBuilder);
        }
    }

    private static void applyParamOverride(String str, ResolvedFlags.Value value, BaseFeatureOverrides.FeatureState.Builder builder) {
        c21 c21Var;
        f21 bytesValue;
        ResolvedFlags.Value.Type type = value.getType();
        int i = AnonymousClass1.$SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type[type.ordinal()];
        if (i == 1) {
            String str2 = value.getBoolValue() ? "true" : "false";
            Charset charset = StandardCharsets.UTF_8;
            c21 c21Var2 = f21.b;
            c21Var = new c21(str2.getBytes(charset));
        } else if (i == 2) {
            String string = Long.toString(value.getIntValue(), 10);
            Charset charset2 = StandardCharsets.UTF_8;
            c21 c21Var3 = f21.b;
            c21Var = new c21(string.getBytes(charset2));
        } else if (i == 3) {
            String string2 = Float.toString(value.getFloatValue());
            Charset charset3 = StandardCharsets.UTF_8;
            c21 c21Var4 = f21.b;
            c21Var = new c21(string2.getBytes(charset3));
        } else {
            if (i != 4) {
                if (i != 5) {
                    ik4.k(lv8.r("Unsupported HTTP flag value type for base::Feature param `", str, "`: ", String.valueOf(type)));
                    return;
                } else {
                    bytesValue = value.getBytesValue();
                    builder.putParams(str, bytesValue);
                }
            }
            String stringValue = value.getStringValue();
            Charset charset4 = StandardCharsets.UTF_8;
            c21 c21Var5 = f21.b;
            c21Var = new c21(stringValue.getBytes(charset4));
        }
        bytesValue = c21Var;
        builder.putParams(str, bytesValue);
    }

    private static void applyStateOverride(ResolvedFlags.Value value, BaseFeatureOverrides.FeatureState.Builder builder) {
        ResolvedFlags.Value.Type type = value.getType();
        if (type == ResolvedFlags.Value.Type.BOOL) {
            builder.setEnabled(value.getBoolValue());
        } else {
            ay0.e(ev6.x("HTTP flag has type ", String.valueOf(type), ", but only boolean flags are supported as base::Feature overrides"));
        }
    }

    public static BaseFeatureOverrides getOverrides(ResolvedFlags resolvedFlags) {
        HashMap map = new HashMap();
        for (Map.Entry<String, ResolvedFlags.Value> entry : resolvedFlags.flags().entrySet()) {
            try {
                applyOverride(entry.getKey(), entry.getValue(), map);
            } catch (RuntimeException e) {
                throw new IllegalArgumentException(ev6.x("Could not parse HTTP flag `", entry.getKey(), "` as a base::Feature override"), e);
            }
        }
        BaseFeatureOverrides.Builder builderNewBuilder = BaseFeatureOverrides.newBuilder();
        for (Map.Entry entry2 : map.entrySet()) {
            builderNewBuilder.putFeatureStates((String) entry2.getKey(), (BaseFeatureOverrides.FeatureState) ((BaseFeatureOverrides.FeatureState.Builder) entry2.getValue()).m106build());
        }
        return (BaseFeatureOverrides) builderNewBuilder.m106build();
    }

    private static ParsedFlagName parseFlagName(String str) {
        if (!str.startsWith(FLAG_PREFIX)) {
            return null;
        }
        String strSubstring = str.substring(20);
        ParsedFlagName parsedFlagName = new ParsedFlagName(0);
        int iIndexOf = strSubstring.indexOf(PARAM_DELIMITER);
        if (iIndexOf < 0) {
            parsedFlagName.featureName = strSubstring;
            return parsedFlagName;
        }
        parsedFlagName.featureName = strSubstring.substring(0, iIndexOf);
        parsedFlagName.paramName = strSubstring.substring(iIndexOf + 7);
        return parsedFlagName;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class ParsedFlagName {
        public String featureName;
        public String paramName;

        public /* synthetic */ ParsedFlagName(int i) {
            this();
        }

        private ParsedFlagName() {
        }
    }
}
