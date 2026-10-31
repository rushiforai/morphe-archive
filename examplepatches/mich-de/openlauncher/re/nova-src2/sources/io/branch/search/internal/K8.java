package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes4.dex */
public final class K8 {
    @JvmStatic
    @Nullable
    public static final ArrayList a(@NotNull String sessionId, @NotNull F4 context, @Nullable JSONArray jSONArray) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(context, "context");
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            try {
                AbstractC3394u2 abstractC3394u2A = AbstractC3394u2.a(context, jSONArray.getJSONObject(i5));
                Intrinsics.f(abstractC3394u2A, "from(context, it.getJSONObject(i))");
                arrayList.add(abstractC3394u2A);
            } catch (JSONException e3) {
                C3296o5.a(sessionId, e3, "LinkingParser.parseJsonArrayToLinking");
            }
        }
        return arrayList;
    }

    @JvmStatic
    @NotNull
    public static final List a(@NotNull F4 context, @NotNull String sessionId, @Nullable String str) {
        List listA;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(context, "context");
        if (str != null) {
            try {
                listA = a(sessionId, context, new JSONArray(str));
            } catch (JSONException e3) {
                C3296o5.a(sessionId, e3, "LinkingParser.parseStringToLinking");
                listA = EmptyList.f71733a;
            }
            if (listA != null) {
                return listA;
            }
        }
        return EmptyList.f71733a;
    }
}
