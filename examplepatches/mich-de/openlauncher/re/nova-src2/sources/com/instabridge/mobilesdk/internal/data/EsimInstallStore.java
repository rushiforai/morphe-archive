package com.instabridge.mobilesdk.internal.data;

import android.content.Context;
import android.content.SharedPreferences;
import b.c9;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0007\b\u0001\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000e\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0006\u0010\f\u001a\u00020\rJ\u0006\u0010\u000e\u001a\u00020\u000fJ\b\u0010\n\u001a\u0004\u0018\u00010\u000bJ\u0006\u0010\u0010\u001a\u00020\rJ\u0006\u0010\u0011\u001a\u00020\tJ\u0006\u0010\u0012\u001a\u00020\rJ\u0006\u0010\u0013\u001a\u00020\tJ\u0006\u0010\u0014\u001a\u00020\tR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/EsimInstallStore;", b.f42142b, "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "prefs", "Landroid/content/SharedPreferences;", "markInstalled", b.f42142b, EsimInstallStore.KEY_ICCID, b.f42142b, "isInstalled", b.f42142b, "installedAtMillis", b.f42142b, "isProvisioningNoticeDismissed", "dismissProvisioningNotice", "hasConsumedData", "markDataConsumed", "clear", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class EsimInstallStore {

    @Deprecated
    @NotNull
    public static final String KEY_DATA_CONSUMED = "data_consumed";

    @Deprecated
    @NotNull
    public static final String KEY_ICCID = "iccid";

    @Deprecated
    @NotNull
    public static final String KEY_INSTALLED = "installed";

    @Deprecated
    @NotNull
    public static final String KEY_INSTALLED_AT = "installed_at";

    @Deprecated
    @NotNull
    public static final String KEY_NOTICE_DISMISSED = "provisioning_notice_dismissed";

    @Deprecated
    @NotNull
    public static final String PREFS_NAME = "instabridge_mobile_sdk_esim_install";

    @NotNull
    private final SharedPreferences prefs;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/EsimInstallStore$Companion;", b.f42142b, "<init>", "()V", "PREFS_NAME", b.f42142b, "KEY_INSTALLED", "KEY_ICCID", "KEY_INSTALLED_AT", "KEY_NOTICE_DISMISSED", "KEY_DATA_CONSUMED", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public EsimInstallStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences(PREFS_NAME, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
    }

    public final void clear() {
        this.prefs.edit().clear().apply();
    }

    public final void dismissProvisioningNotice() {
        c9.q(this.prefs, KEY_NOTICE_DISMISSED, true);
    }

    public final boolean hasConsumedData() {
        return this.prefs.getBoolean(KEY_DATA_CONSUMED, false);
    }

    @Nullable
    public final String iccid() {
        return this.prefs.getString(KEY_ICCID, null);
    }

    public final long installedAtMillis() {
        return this.prefs.getLong(KEY_INSTALLED_AT, 0L);
    }

    public final boolean isInstalled() {
        return this.prefs.getBoolean(KEY_INSTALLED, false);
    }

    public final boolean isProvisioningNoticeDismissed() {
        return this.prefs.getBoolean(KEY_NOTICE_DISMISSED, false);
    }

    public final void markDataConsumed() {
        if (hasConsumedData()) {
            return;
        }
        c9.q(this.prefs, KEY_DATA_CONSUMED, true);
    }

    public final void markInstalled(@NotNull String iccid) {
        Intrinsics.g(iccid, "iccid");
        this.prefs.edit().putBoolean(KEY_INSTALLED, true).putString(KEY_ICCID, iccid).putLong(KEY_INSTALLED_AT, System.currentTimeMillis()).putBoolean(KEY_NOTICE_DISMISSED, false).putBoolean(KEY_DATA_CONSUMED, false).apply();
    }
}
