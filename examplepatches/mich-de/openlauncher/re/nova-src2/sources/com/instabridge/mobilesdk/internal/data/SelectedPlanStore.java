package com.instabridge.mobilesdk.internal.data;

import android.content.Context;
import android.content.SharedPreferences;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0001\u0018\u0000 \u00102\u00020\u0001:\u0001\u0010B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rJ\r\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0002\u0010\u000eJ\u0006\u0010\f\u001a\u00020\rJ\u0006\u0010\u000f\u001a\u00020\tR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/SelectedPlanStore;", b.f42142b, "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "prefs", "Landroid/content/SharedPreferences;", ActionCategory.SAVE, b.f42142b, "packageId", b.f42142b, "isFreeTrial", b.f42142b, "()Ljava/lang/Long;", "clear", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class SelectedPlanStore {

    @Deprecated
    @NotNull
    public static final String KEY_IS_FREE_TRIAL = "is_free_trial";

    @Deprecated
    @NotNull
    public static final String KEY_PACKAGE_ID = "package_id";

    @Deprecated
    @NotNull
    public static final String PREFS_NAME = "instabridge_mobile_sdk_selected_plan";

    @NotNull
    private final SharedPreferences prefs;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/SelectedPlanStore$Companion;", b.f42142b, "<init>", "()V", "PREFS_NAME", b.f42142b, "KEY_PACKAGE_ID", "KEY_IS_FREE_TRIAL", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public SelectedPlanStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences(PREFS_NAME, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
    }

    public final void clear() {
        this.prefs.edit().clear().apply();
    }

    public final boolean isFreeTrial() {
        return this.prefs.getBoolean(KEY_IS_FREE_TRIAL, false);
    }

    @Nullable
    public final Long packageId() {
        if (this.prefs.contains("package_id")) {
            return Long.valueOf(this.prefs.getLong("package_id", -1L));
        }
        return null;
    }

    public final void save(long packageId, boolean isFreeTrial) {
        this.prefs.edit().putLong("package_id", packageId).putBoolean(KEY_IS_FREE_TRIAL, isFreeTrial).apply();
    }
}
