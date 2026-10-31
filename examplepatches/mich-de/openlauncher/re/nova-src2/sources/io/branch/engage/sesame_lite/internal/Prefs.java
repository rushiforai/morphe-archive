package io.branch.engage.sesame_lite.internal;

import android.content.Context;
import android.content.SharedPreferences;
import b.c9;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0007\b\u0007\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0006\u0010\u000b\u001a\u00020\fJ\u0016\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\fJ\u0016\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0011J\u0016\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0013J\u0016\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0015J\u001a\u0010\u0016\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000e\u001a\u00020\u00062\b\u0010\u000f\u001a\u0004\u0018\u00010\u0006J\u0016\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\fJ\u0016\u0010\u001a\u001a\u00020\u00182\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u0011J\u0016\u0010\u001b\u001a\u00020\u00182\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u0013J\u0016\u0010\u001c\u001a\u00020\u00182\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u0015J\u0018\u0010\u001d\u001a\u00020\u00182\u0006\u0010\u000e\u001a\u00020\u00062\b\u0010\u0019\u001a\u0004\u0018\u00010\u0006R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001f"}, d2 = {"Lio/branch/engage/sesame_lite/internal/Prefs;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "(Landroid/content/Context;)V", "defDailyCronWorkReqId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getDefDailyCronWorkReqId", "()Ljava/lang/String;", "prefs", "Landroid/content/SharedPreferences;", "deletePrefs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getBoolean", "prefKey", "defaultVal", "getFloat", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getInt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getLong", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getString", "putBoolean", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "putFloat", "putInt", "putLong", "putString", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class Prefs {
    public static final long DEF_APP_USAGE_STATS_LAST_UPDATE = -1;

    @NotNull
    public static final String DEF_DB_NAME = "__ssml.db";
    public static final boolean DEF_INVOKE_DB_REBUILD = false;
    public static final boolean DEF_INVOKE_GARBAGE_COLLECTOR = true;
    public static final long DEF_LAUNCHER_APPS_DEBOUNCE_MS = 15000;
    public static final long DEF_POST_VACUUM_DB_SIZE = 3;

    @NotNull
    private static final String FILENAME = "__ssml_lib_preferences";

    @NotNull
    public static final String KEY_APP_USAGE_STATS_LAST_UPDATE = "app_usage_state_last_updated";

    @NotNull
    public static final String KEY_DAILY_CRON_WORK_REQ_ID = "daily_cron_work_req_id";

    @NotNull
    public static final String KEY_DB_NAME = "db_name";

    @NotNull
    public static final String KEY_INVOKE_DB_REBUILD = "invoke_db_rebuild";

    @NotNull
    public static final String KEY_INVOKE_GARBAGE_COLLECTOR = "invoke_garbage_collector";

    @NotNull
    public static final String KEY_LAUNCHER_APPS_DEBOUNCE_MS = "launcher_apps_update_debounce_delay";

    @NotNull
    public static final String KEY_POST_VACUUM_DB_SIZE = "post_vacuum_db_size";

    @NotNull
    private static final String TAG = "SSML-Prefs";

    @Nullable
    private final String defDailyCronWorkReqId;

    @NotNull
    private final SharedPreferences prefs;

    public Prefs(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getSharedPreferences(FILENAME, 0);
        Intrinsics.f(sharedPreferences, "context.getSharedPrefere…ME, Context.MODE_PRIVATE)");
        this.prefs = sharedPreferences;
    }

    public final boolean deletePrefs() {
        return this.prefs.edit().clear().commit();
    }

    public final boolean getBoolean(@NotNull String prefKey, boolean defaultVal) {
        Intrinsics.g(prefKey, "prefKey");
        return this.prefs.getBoolean(prefKey, defaultVal);
    }

    @Nullable
    public final String getDefDailyCronWorkReqId() {
        return this.defDailyCronWorkReqId;
    }

    public final float getFloat(@NotNull String prefKey, float defaultVal) {
        Intrinsics.g(prefKey, "prefKey");
        return this.prefs.getFloat(prefKey, defaultVal);
    }

    public final int getInt(@NotNull String prefKey, int defaultVal) {
        Intrinsics.g(prefKey, "prefKey");
        return this.prefs.getInt(prefKey, defaultVal);
    }

    public final long getLong(@NotNull String prefKey, long defaultVal) {
        Intrinsics.g(prefKey, "prefKey");
        return this.prefs.getLong(prefKey, defaultVal);
    }

    @Nullable
    public final String getString(@NotNull String prefKey, @Nullable String defaultVal) {
        Intrinsics.g(prefKey, "prefKey");
        return this.prefs.getString(prefKey, defaultVal);
    }

    public final void putBoolean(@NotNull String prefKey, boolean value) {
        Intrinsics.g(prefKey, "prefKey");
        c9.q(this.prefs, prefKey, value);
    }

    public final void putFloat(@NotNull String prefKey, float value) {
        Intrinsics.g(prefKey, "prefKey");
        this.prefs.edit().putFloat(prefKey, value).apply();
    }

    public final void putInt(@NotNull String prefKey, int value) {
        Intrinsics.g(prefKey, "prefKey");
        this.prefs.edit().putInt(prefKey, value).apply();
    }

    public final void putLong(@NotNull String prefKey, long value) {
        Intrinsics.g(prefKey, "prefKey");
        this.prefs.edit().putLong(prefKey, value).apply();
    }

    public final void putString(@NotNull String prefKey, @Nullable String value) {
        Intrinsics.g(prefKey, "prefKey");
        a2.c.v(this.prefs, prefKey, value);
    }
}
