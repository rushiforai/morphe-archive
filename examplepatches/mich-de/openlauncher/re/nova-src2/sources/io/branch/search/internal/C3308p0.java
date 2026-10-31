package io.branch.search.internal;

import android.text.TextUtils;
import io.branch.search.internal.C3296o5;
import java.util.Collection;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.p0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3308p0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Boolean f65464a = Boolean.FALSE;

    public static void a(@Nullable String str) {
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        C3309p1.a("BranchSearchSDK_Session", str);
    }

    public static void b(@NotNull Y entity, @NotNull JSONObject payload, @NotNull String key, @Nullable Object obj) {
        Intrinsics.g(entity, "entity");
        Intrinsics.g(payload, "payload");
        Intrinsics.g(key, "key");
        a(entity.b() + ".getImpressionJson", payload, key, obj);
    }

    public static void c(@NotNull Y entity, @NotNull JSONObject payload, @NotNull String key, @Nullable Object obj) {
        Intrinsics.g(entity, "entity");
        Intrinsics.g(payload, "payload");
        Intrinsics.g(key, "key");
        a(entity.b() + ".getParseJson", payload, key, obj);
    }

    public static void a(@NotNull String sessionId, @NotNull JSONObject payload, @NotNull Map map, @NotNull String keyPostfix) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(payload, "payload");
        Intrinsics.g(map, "map");
        Intrinsics.g(keyPostfix, "keyPostfix");
        for (Map.Entry entry : map.entrySet()) {
            String strQ = b.c0.q(new StringBuilder(), (String) entry.getKey(), keyPostfix);
            Object value = entry.getValue();
            try {
                if (!(value instanceof Collection)) {
                    if (!(value instanceof String) && !(value instanceof Integer) && !(value instanceof Long) && !(value instanceof Double) && !(value instanceof JSONArray) && !(value instanceof JSONObject)) {
                        C3296o5.a aVar = C3296o5.f65426a;
                        C3296o5.a(new F6(sessionId, "AnalyticsUtil.loadValues", "loadValues() was passed a non-json-compliant structure. Should never happen", null));
                        return;
                    }
                } else if (((Collection) value).isEmpty()) {
                    return;
                } else {
                    value = new JSONArray((Collection) value);
                }
                payload.putOpt(strQ, value);
            } catch (JSONException e3) {
                C3296o5.a(sessionId, e3, "AnalyticsUtil.loadValues");
            }
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static void a(@NotNull String source, @NotNull JSONObject payload, @NotNull String key, @Nullable Object obj) throws JSONException {
        Intrinsics.g(source, "source");
        Intrinsics.g(payload, "payload");
        Intrinsics.g(key, "key");
        try {
            if (obj != null) {
                String simpleName = obj.getClass().getSimpleName();
                switch (simpleName.hashCode()) {
                    case -1808118735:
                        if (simpleName.equals("String")) {
                            if (TextUtils.isEmpty((String) obj)) {
                                throw new JSONException("invalid value key: ".concat(key));
                            }
                            payload.putOpt(key, obj);
                            return;
                        }
                        break;
                    case -672261858:
                        if (simpleName.equals("Integer")) {
                            int iIntValue = ((Integer) obj).intValue();
                            if (iIntValue < 0 && (!key.equals("result_id") || (iIntValue != -1234 && iIntValue != -1))) {
                                throw new JSONException("invalid value key: ".concat(key));
                            }
                            payload.putOpt(key, obj);
                            return;
                        }
                        break;
                    case 2374300:
                        if (simpleName.equals("Long")) {
                            long jLongValue = ((Long) obj).longValue();
                            if (jLongValue < 0) {
                                int i5 = (int) jLongValue;
                                if (!key.equals("result_id") || (i5 != -1234 && i5 != -1)) {
                                    throw new JSONException("invalid value key: ".concat(key));
                                }
                                return;
                            }
                            payload.putOpt(key, obj);
                            return;
                        }
                        break;
                    case 1706651217:
                        if (simpleName.equals("JSONArray")) {
                            if (((JSONArray) obj).length() == 0) {
                                throw new JSONException("invalid value key: ".concat(key));
                            }
                            payload.putOpt(key, obj);
                            return;
                        }
                        break;
                    case 1729365000:
                        if (simpleName.equals("Boolean")) {
                            payload.putOpt(key, obj);
                            return;
                        }
                        break;
                    case 1752376903:
                        if (simpleName.equals("JSONObject")) {
                            if (!((JSONObject) obj).keys().hasNext()) {
                                throw new JSONException("invalid value key: ".concat(key));
                            }
                            payload.putOpt(key, obj);
                            return;
                        }
                        break;
                    case 2052876273:
                        if (simpleName.equals("Double")) {
                            if (((Double) obj).doubleValue() < 0.0d) {
                                throw new JSONException("invalid value key: ".concat(key));
                            }
                            payload.putOpt(key, obj);
                            return;
                        }
                        break;
                }
                throw new JSONException("invalid value type (" + obj.getClass().getSimpleName() + ") for key: " + key);
            }
            throw new JSONException("value cannot be null for key: ".concat(key));
        } catch (JSONException e3) {
            String message = e3.getMessage();
            if (message == null) {
                message = "failed to report value: " + obj + ", for key: " + key;
            }
            C3296o5.a("AnalyticsUtil.loadAnalyticsVal.".concat(source), e3, message);
        }
    }

    public static void a(@NotNull Y entity, @NotNull JSONObject payload, @NotNull String key, @Nullable Object obj) {
        Intrinsics.g(entity, "entity");
        Intrinsics.g(payload, "payload");
        Intrinsics.g(key, "key");
        a(entity.b() + ".getClickJson", payload, key, obj);
    }
}
