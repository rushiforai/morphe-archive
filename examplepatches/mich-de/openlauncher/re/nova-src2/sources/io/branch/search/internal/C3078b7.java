package io.branch.search.internal;

import android.text.TextUtils;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.CharRange;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.b7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3078b7 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f64018a = 0;

    static {
        b70.g.r1(new CharRange('0', '9'), new CharRange('A', 'F'));
    }

    @Nullable
    public static final JSONObject a(@NotNull x80.m0 response) {
        Intrinsics.g(response, "response");
        String strB = response.b("X-Branch-Analytics-Payload", null);
        if (TextUtils.isEmpty(strB)) {
            return null;
        }
        try {
            return new JSONObject(strB);
        } catch (JSONException e3) {
            C3296o5.a("HttpPool.executeRequest", e3, "error parsing analytics result: " + strB);
            return null;
        }
    }
}
