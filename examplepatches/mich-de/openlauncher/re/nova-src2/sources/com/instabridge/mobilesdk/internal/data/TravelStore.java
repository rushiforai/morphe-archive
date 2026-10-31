package com.instabridge.mobilesdk.internal.data;

import android.content.Context;
import android.content.SharedPreferences;
import b.c9;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0005\b\u0001\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0006\u0010\b\u001a\u00020\tJ\u0006\u0010\n\u001a\u00020\u000bJ\u0006\u0010\f\u001a\u00020\tJ\b\u0010\r\u001a\u0004\u0018\u00010\u000eJ\u0006\u0010\u000f\u001a\u00020\u0010J\u000e\u0010\u0011\u001a\u00020\u000b2\u0006\u0010\u0012\u001a\u00020\u000eJ\u0006\u0010\u0013\u001a\u00020\u000bR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0015"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/TravelStore;", b.f42142b, "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "prefs", "Landroid/content/SharedPreferences;", "hasSeenIntro", b.f42142b, "markIntroSeen", b.f42142b, "isEsimInstalled", "esimIccid", b.f42142b, "esimInstalledAtMillis", b.f42142b, "markEsimInstalled", EsimInstallStore.KEY_ICCID, "clearEsim", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class TravelStore {

    @Deprecated
    @NotNull
    public static final String KEY_ESIM_ICCID = "esim_iccid";

    @Deprecated
    @NotNull
    public static final String KEY_ESIM_INSTALLED = "esim_installed";

    @Deprecated
    @NotNull
    public static final String KEY_ESIM_INSTALLED_AT = "esim_installed_at";

    @Deprecated
    @NotNull
    public static final String KEY_INTRO_SEEN = "intro_seen";

    @Deprecated
    @NotNull
    public static final String PREFS_NAME = "instabridge_mobile_sdk_travel";

    @NotNull
    private final SharedPreferences prefs;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/TravelStore$Companion;", b.f42142b, "<init>", "()V", "PREFS_NAME", b.f42142b, "KEY_INTRO_SEEN", "KEY_ESIM_INSTALLED", "KEY_ESIM_ICCID", "KEY_ESIM_INSTALLED_AT", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public TravelStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences(PREFS_NAME, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
    }

    public final void clearEsim() {
        this.prefs.edit().remove(KEY_ESIM_INSTALLED).remove(KEY_ESIM_ICCID).remove(KEY_ESIM_INSTALLED_AT).apply();
    }

    @Nullable
    public final String esimIccid() {
        return this.prefs.getString(KEY_ESIM_ICCID, null);
    }

    public final long esimInstalledAtMillis() {
        return this.prefs.getLong(KEY_ESIM_INSTALLED_AT, 0L);
    }

    public final boolean hasSeenIntro() {
        return this.prefs.getBoolean(KEY_INTRO_SEEN, false);
    }

    public final boolean isEsimInstalled() {
        return this.prefs.getBoolean(KEY_ESIM_INSTALLED, false);
    }

    public final void markEsimInstalled(@NotNull String iccid) {
        Intrinsics.g(iccid, "iccid");
        SharedPreferences.Editor editorPutBoolean = this.prefs.edit().putBoolean(KEY_ESIM_INSTALLED, true);
        if (r70.k.U0(iccid)) {
            iccid = null;
        }
        editorPutBoolean.putString(KEY_ESIM_ICCID, iccid).putLong(KEY_ESIM_INSTALLED_AT, System.currentTimeMillis()).apply();
    }

    public final void markIntroSeen() {
        if (hasSeenIntro()) {
            return;
        }
        c9.q(this.prefs, KEY_INTRO_SEEN, true);
    }
}
