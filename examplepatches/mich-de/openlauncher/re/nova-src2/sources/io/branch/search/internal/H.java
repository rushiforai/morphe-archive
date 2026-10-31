package io.branch.search.internal;

import io.branch.search.AnalyticsEvent;
import java.util.ArrayList;
import java.util.Map;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public interface H {
    @Nullable
    Object a(@NotNull String str, @NotNull Continuation<? super Integer> continuation);

    void a(@NotNull String str, @NotNull AnalyticsEvent analyticsEvent);

    void a(@NotNull String str, @NotNull String str2, @NotNull Exception exc, @Nullable Map map);

    void a(@NotNull String str, @NotNull String str2, @Nullable String str3);

    void a(@NotNull String str, @NotNull String str2, @Nullable String str3, @Nullable Map<String, String> map);

    void a(@NotNull String str, @Nullable String str2, @Nullable Throwable th2);

    void a(@NotNull String str, @NotNull String str2, @NotNull JSONObject jSONObject);

    void a(@NotNull String str, @NotNull String str2, @NotNull JSONObject jSONObject, boolean z11);

    void a(@NotNull String str, @NotNull Throwable th2, @NotNull String str2);

    void a(@NotNull String str, boolean z11);

    void a(boolean z11);

    boolean a();

    boolean a(@NotNull String str);

    @NotNull
    C3350r9<JSONObject> b(@NotNull String str);

    void b(@NotNull String str, @Nullable String str2, @NotNull Throwable th2);

    @NotNull
    C3350r9 c(@NotNull String str);

    @NotNull
    ArrayList d(@NotNull String str);

    boolean e(@NotNull String str);

    boolean f(@NotNull String str);
}
