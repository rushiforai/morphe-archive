package nova.branch.engage.sesame_lite.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.provider.Telephony;
import android.telecom.TelecomManager;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.android.ContactsProviderHelper;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000¢\u0006\u0004\b\u0002\u0010\u0003\u001a-\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00002\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\f\u0010\r\u001a/\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00002\u0006\u0010\u000e\u001a\u00020\u00012\u0006\u0010\b\u001a\u00020\u0007H\u0002¢\u0006\u0004\b\u000f\u0010\u0010\u001a'\u0010\u0011\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b\u0011\u0010\u0012\u001a'\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b\u0013\u0010\u0012\u001a'\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b\u0014\u0010\u0012\u001aE\u0010\u001d\u001a\u000e\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\u001c0\u001b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0018\u001a\u00020\u00172\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019H\u0002¢\u0006\u0004\b\u001d\u0010\u001e¨\u0006\u001f"}, d2 = {"Lr80/b;", "Lnova/branch/engage/sesame_lite/internal/ContactAppDataConfig;", "getAppDataConfig", "(Lr80/b;)Lnova/branch/engage/sesame_lite/internal/ContactAppDataConfig;", "Landroid/content/Context;", "context", "contactApp", "Lnova/branch/engage/sesame_lite/internal/Prefs;", "prefs", "Lnova/branch/engage/sesame_lite/internal/Pkgs;", "pkgs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "refreshContactActionData", "(Landroid/content/Context;Lr80/b;Lnova/branch/engage/sesame_lite/internal/Prefs;Lnova/branch/engage/sesame_lite/internal/Pkgs;)V", "config", "refreshContactAppData", "(Landroid/content/Context;Lr80/b;Lnova/branch/engage/sesame_lite/internal/ContactAppDataConfig;Lnova/branch/engage/sesame_lite/internal/Prefs;)V", "refreshDialerData", "(Landroid/content/Context;Lnova/branch/engage/sesame_lite/internal/Prefs;Lnova/branch/engage/sesame_lite/internal/Pkgs;)V", "refreshSmsData", "refreshEmailData", "Landroid/content/Intent;", "intent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "fallbackIconRes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "targetPkg", "Lkotlin/Pair;", "Landroid/net/Uri;", "getResolvedPackageAndIcon", "(Landroid/content/Context;Lnova/branch/engage/sesame_lite/internal/Pkgs;Landroid/content/Intent;ILjava/lang/String;)Lkotlin/Pair;", "sesame-lite_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ContactAppsKt {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[r80.b.values().length];
            try {
                r80.a aVar = r80.b.Companion;
                iArr[4] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                r80.a aVar2 = r80.b.Companion;
                iArr[5] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                r80.a aVar3 = r80.b.Companion;
                iArr[6] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                r80.a aVar4 = r80.b.Companion;
                iArr[7] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                r80.a aVar5 = r80.b.Companion;
                iArr[8] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                r80.a aVar6 = r80.b.Companion;
                iArr[1] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                r80.a aVar7 = r80.b.Companion;
                iArr[2] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                r80.a aVar8 = r80.b.Companion;
                iArr[3] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @Nullable
    public static final ContactAppDataConfig getAppDataConfig(@NotNull r80.b bVar) {
        Intrinsics.g(bVar, "<this>");
        int i5 = WhenMappings.$EnumSwitchMapping$0[bVar.ordinal()];
        if (i5 == 1) {
            return new ContactAppDataConfig(Pkgs.WHATSAPP, Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_ICON, Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_LABEL, ContactsProviderHelper.MIME_WHATSAPP);
        }
        if (i5 == 2) {
            return new ContactAppDataConfig(Pkgs.WHATSAPP_4B, Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_4B_ICON, Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_4B_LABEL, "vnd.android.cursor.item/vnd.com.whatsapp.w4b.profile");
        }
        if (i5 == 3) {
            return new ContactAppDataConfig(Pkgs.SIGNAL, Prefs.KEY_CONTACT_ACTIONS_SIGNAL_ICON, Prefs.KEY_CONTACT_ACTIONS_SIGNAL_LABEL, "vnd.android.cursor.item/vnd.org.thoughtcrime.securesms.contact");
        }
        if (i5 == 4) {
            return new ContactAppDataConfig(Pkgs.VIBER, Prefs.KEY_CONTACT_ACTIONS_VIBER_ICON, Prefs.KEY_CONTACT_ACTIONS_VIBER_LABEL, "vnd.android.cursor.item/vnd.com.viber.voip.viber_number_message");
        }
        if (i5 != 5) {
            return null;
        }
        return new ContactAppDataConfig(Pkgs.TELEGRAM, Prefs.KEY_CONTACT_ACTIONS_TELEGRAM_ICON, Prefs.KEY_CONTACT_ACTIONS_TELEGRAM_LABEL, "vnd.android.cursor.item/vnd.org.telegram.messenger.android.profile");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x002e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static final Pair<String, Uri> getResolvedPackageAndIcon(Context context, Pkgs pkgs, Intent intent, int i5, String str) {
        Uri uriMakeResUri;
        ApplicationInfo applicationInfo;
        Utils utils = Utils.INSTANCE;
        ResolveInfo resolveInfoResolveIntent = utils.resolveIntent(context, intent, str);
        if (resolveInfoResolveIntent == null) {
            String contacts = pkgs.getContacts();
            String packageName = context.getPackageName();
            Intrinsics.f(packageName, "getPackageName(...)");
            return new Pair<>(contacts, utils.makeResUri(packageName, i5));
        }
        ActivityInfo activityInfo = resolveInfoResolveIntent.activityInfo;
        String contacts2 = (activityInfo == null || (applicationInfo = activityInfo.applicationInfo) == null) ? null : applicationInfo.packageName;
        if (contacts2 == null) {
            String packageName2 = context.getPackageName();
            Intrinsics.f(packageName2, "getPackageName(...)");
            uriMakeResUri = utils.makeResUri(packageName2, i5);
        } else {
            if ((activityInfo != null ? activityInfo.getIconResource() : 0) != 0) {
                uriMakeResUri = utils.makeResUri(contacts2, resolveInfoResolveIntent.activityInfo.getIconResource());
            }
        }
        if (contacts2 == null) {
            contacts2 = pkgs.getContacts();
        }
        return new Pair<>(contacts2, uriMakeResUri);
    }

    public static final void refreshContactActionData(@NotNull Context context, @NotNull r80.b contactApp, @NotNull Prefs prefs, @NotNull Pkgs pkgs) {
        Intrinsics.g(context, "context");
        Intrinsics.g(contactApp, "contactApp");
        Intrinsics.g(prefs, "prefs");
        Intrinsics.g(pkgs, "pkgs");
        int i5 = WhenMappings.$EnumSwitchMapping$0[contactApp.ordinal()];
        if (i5 == 6) {
            refreshDialerData(context, prefs, pkgs);
            return;
        }
        if (i5 == 7) {
            refreshSmsData(context, prefs, pkgs);
            return;
        }
        if (i5 == 8) {
            refreshEmailData(context, prefs, pkgs);
            return;
        }
        ContactAppDataConfig appDataConfig = getAppDataConfig(contactApp);
        if (appDataConfig != null) {
            refreshContactAppData(context, contactApp, appDataConfig, prefs);
        }
    }

    private static final void refreshContactAppData(Context context, r80.b bVar, ContactAppDataConfig contactAppDataConfig, Prefs prefs) {
        ActivityInfo activityInfo;
        ActivityInfo activityInfo2;
        ActivityInfo activityInfo3;
        ApplicationInfo applicationInfo;
        Utils utils = Utils.INSTANCE;
        ResolveInfo resolveInfoResolveIntent = utils.resolveIntent(context, ContactActionsHelper.INSTANCE.makeIntent(bVar, 0L, "fake_convo_id"), contactAppDataConfig.getPackageName());
        String string = null;
        String str = (resolveInfoResolveIntent == null || (activityInfo3 = resolveInfoResolveIntent.activityInfo) == null || (applicationInfo = activityInfo3.applicationInfo) == null) ? null : applicationInfo.packageName;
        int iconResource = (resolveInfoResolveIntent == null || (activityInfo2 = resolveInfoResolveIntent.activityInfo) == null) ? 0 : activityInfo2.getIconResource();
        CharSequence charSequenceLoadLabel = (resolveInfoResolveIntent == null || (activityInfo = resolveInfoResolveIntent.activityInfo) == null) ? null : activityInfo.loadLabel(context.getPackageManager());
        prefs.putString(contactAppDataConfig.getIconPrefName(), (str == null || iconResource == 0) ? null : utils.makeResUri(str, iconResource).toString());
        if (str != null && charSequenceLoadLabel != null) {
            string = charSequenceLoadLabel.toString();
        }
        prefs.putString(contactAppDataConfig.getLabelPrefName(), string);
    }

    private static final void refreshDialerData(Context context, Prefs prefs, Pkgs pkgs) {
        Pair<String, Uri> resolvedPackageAndIcon = getResolvedPackageAndIcon(context, pkgs, ContactActionsHelper.INSTANCE.makeIntent(r80.b.f85650c, 0L, "8005551234"), 2131231467, ((TelecomManager) context.getSystemService(TelecomManager.class)).getDefaultDialerPackage());
        String str = (String) resolvedPackageAndIcon.f71683a;
        Uri uri = (Uri) resolvedPackageAndIcon.f71684b;
        prefs.putString(Prefs.KEY_CONTACT_ACTIONS_DIALER_PKG, str);
        prefs.putString(Prefs.KEY_CONTACT_ACTIONS_DIALER_ICON, uri.toString());
    }

    private static final void refreshEmailData(Context context, Prefs prefs, Pkgs pkgs) {
        Pair<String, Uri> resolvedPackageAndIcon = getResolvedPackageAndIcon(context, pkgs, ContactActionsHelper.INSTANCE.makeIntent(r80.b.f85652e, 0L, "tester@example.com"), 2131231471, null);
        String str = (String) resolvedPackageAndIcon.f71683a;
        Uri uri = (Uri) resolvedPackageAndIcon.f71684b;
        prefs.putString(Prefs.KEY_CONTACT_ACTIONS_EMAIL_PKG, str);
        prefs.putString(Prefs.KEY_CONTACT_ACTIONS_EMAIL_ICON, uri.toString());
    }

    private static final void refreshSmsData(Context context, Prefs prefs, Pkgs pkgs) {
        Pair<String, Uri> resolvedPackageAndIcon = getResolvedPackageAndIcon(context, pkgs, ContactActionsHelper.INSTANCE.makeIntent(r80.b.f85651d, 0L, "8005551234"), 2131231496, Telephony.Sms.getDefaultSmsPackage(context));
        String str = (String) resolvedPackageAndIcon.f71683a;
        Uri uri = (Uri) resolvedPackageAndIcon.f71684b;
        prefs.putString(Prefs.KEY_CONTACT_ACTIONS_SMS_PKG, str);
        prefs.putString(Prefs.KEY_CONTACT_ACTIONS_SMS_ICON, uri.toString());
    }
}
