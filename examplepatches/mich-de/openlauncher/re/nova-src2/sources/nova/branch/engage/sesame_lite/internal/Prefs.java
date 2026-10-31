package nova.branch.engage.sesame_lite.internal;

import android.content.Context;
import android.content.SharedPreferences;
import b.c9;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\b\b\u0007\u0018\u0000 /2\u00020\u0001:\u0001/B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0016\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010\u001f\u001a\u00020\u001dJ\u0016\u0010 \u001a\u00020!2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010\u001f\u001a\u00020!J\u0016\u0010\"\u001a\u00020#2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010\u001f\u001a\u00020#J\u0016\u0010$\u001a\u00020%2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010\u001f\u001a\u00020%J\u001a\u0010&\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u001e\u001a\u00020\u000b2\b\u0010\u001f\u001a\u0004\u0018\u00010\u000bJ\u0016\u0010'\u001a\u00020(2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010)\u001a\u00020\u001dJ\u0016\u0010*\u001a\u00020(2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010)\u001a\u00020!J\u0016\u0010+\u001a\u00020(2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010)\u001a\u00020#J\u0016\u0010,\u001a\u00020(2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010)\u001a\u00020%J\u0018\u0010-\u001a\u00020(2\u0006\u0010\u001e\u001a\u00020\u000b2\b\u0010)\u001a\u0004\u0018\u00010\u000bJ\u0006\u0010.\u001a\u00020\u001dR\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000b8F¢\u0006\u0006\u001a\u0004\b\u000f\u0010\rR\u0011\u0010\u0010\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\rR\u0011\u0010\u0012\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\rR\u0011\u0010\u0014\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\rR\u0011\u0010\u0016\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\rR\u0011\u0010\u0018\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\rR\u0011\u0010\u001a\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\r¨\u00060"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/Prefs;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "pkgs", "Lnova/branch/engage/sesame_lite/internal/Pkgs;", "<init>", "(Landroid/content/Context;Lnova/branch/engage/sesame_lite/internal/Pkgs;)V", "prefs", "Landroid/content/SharedPreferences;", "defDailyCronWorkReqId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getDefDailyCronWorkReqId", "()Ljava/lang/String;", "defContactActionsWhatsappIcon", "getDefContactActionsWhatsappIcon", "defContactActionsDialerPkg", "getDefContactActionsDialerPkg", "defContactActionsDialerIcon", "getDefContactActionsDialerIcon", "defContactActionsSmsPkg", "getDefContactActionsSmsPkg", "defContactActionsSmsIcon", "getDefContactActionsSmsIcon", "defContactActionsEmailPkg", "getDefContactActionsEmailPkg", "defContactActionsEmailIcon", "getDefContactActionsEmailIcon", "getBoolean", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "prefKey", "defaultVal", "getInt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getLong", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getFloat", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getString", "putBoolean", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "putInt", "putLong", "putFloat", "putString", "deletePrefs", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class Prefs {
    public static final long DEF_APP_USAGE_STATS_LAST_UPDATE = -1;
    public static final long DEF_CONTACTS_CONTENT_DEBOUNCE_MS = 15000;

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
    public static final String KEY_CONTACTS_CONTENT_DEBOUNCE_MS = "contacts_content_update_debounce_delay";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_DIALER_ICON = "contact_actions_dialer_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_DIALER_PKG = "contact_actions_dialer_package";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_EMAIL_ICON = "contact_actions_email_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_EMAIL_PKG = "contact_actions_email_package";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_SIGNAL_ICON = "contact_actions_signal_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_SIGNAL_LABEL = "contact_actions_signal_label";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_SMS_ICON = "contact_actions_sms_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_SMS_PKG = "contact_actions_sms_package";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_TELEGRAM_ICON = "contact_actions_telegram_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_TELEGRAM_LABEL = "contact_actions_telegram_label";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_VIBER_ICON = "contact_actions_viber_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_VIBER_LABEL = "contact_actions_viber_label";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_WHATSAPP_4B_ICON = "contact_actions_whatsapp_4b_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_WHATSAPP_4B_LABEL = "contact_actions_whatsapp_4b_label";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_WHATSAPP_ICON = "contact_actions_whatsapp_icon_uri";

    @NotNull
    public static final String KEY_CONTACT_ACTIONS_WHATSAPP_LABEL = "contact_actions_whatsapp_label";

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

    @NotNull
    private final String defContactActionsDialerIcon;

    @NotNull
    private final String defContactActionsDialerPkg;

    @NotNull
    private final String defContactActionsEmailIcon;

    @NotNull
    private final String defContactActionsEmailPkg;

    @NotNull
    private final String defContactActionsSmsIcon;

    @NotNull
    private final String defContactActionsSmsPkg;

    @Nullable
    private final String defDailyCronWorkReqId;

    @NotNull
    private final SharedPreferences prefs;

    public Prefs(@NotNull Context context, @NotNull Pkgs pkgs) {
        Intrinsics.g(context, "context");
        Intrinsics.g(pkgs, "pkgs");
        SharedPreferences sharedPreferences = context.getSharedPreferences(FILENAME, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
        this.defDailyCronWorkReqId = null;
        this.defContactActionsDialerPkg = pkgs.getContacts();
        Utils utils = Utils.INSTANCE;
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "getPackageName(...)");
        String string = utils.makeResUri(packageName, 2131231467).toString();
        Intrinsics.f(string, "toString(...)");
        this.defContactActionsDialerIcon = string;
        this.defContactActionsSmsPkg = pkgs.getContacts();
        String packageName2 = context.getPackageName();
        Intrinsics.f(packageName2, "getPackageName(...)");
        String string2 = utils.makeResUri(packageName2, 2131231496).toString();
        Intrinsics.f(string2, "toString(...)");
        this.defContactActionsSmsIcon = string2;
        this.defContactActionsEmailPkg = pkgs.getContacts();
        String packageName3 = context.getPackageName();
        Intrinsics.f(packageName3, "getPackageName(...)");
        String string3 = utils.makeResUri(packageName3, 2131231471).toString();
        Intrinsics.f(string3, "toString(...)");
        this.defContactActionsEmailIcon = string3;
    }

    public final boolean deletePrefs() {
        return this.prefs.edit().clear().commit();
    }

    public final boolean getBoolean(@NotNull String prefKey, boolean defaultVal) {
        Intrinsics.g(prefKey, "prefKey");
        return this.prefs.getBoolean(prefKey, defaultVal);
    }

    @NotNull
    public final String getDefContactActionsDialerIcon() {
        return this.defContactActionsDialerIcon;
    }

    @NotNull
    public final String getDefContactActionsDialerPkg() {
        return this.defContactActionsDialerPkg;
    }

    @NotNull
    public final String getDefContactActionsEmailIcon() {
        return this.defContactActionsEmailIcon;
    }

    @NotNull
    public final String getDefContactActionsEmailPkg() {
        return this.defContactActionsEmailPkg;
    }

    @NotNull
    public final String getDefContactActionsSmsIcon() {
        return this.defContactActionsSmsIcon;
    }

    @NotNull
    public final String getDefContactActionsSmsPkg() {
        return this.defContactActionsSmsPkg;
    }

    @Nullable
    public final String getDefContactActionsWhatsappIcon() {
        return null;
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
