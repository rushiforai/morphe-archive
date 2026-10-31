package nova.branch.engage.sesame_lite.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.provider.ContactsContract;
import com.tiktok.util.TTConst;
import java.util.List;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.android.ContactsProviderHelper;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J*\u0010\n\u001a\u0004\u0018\u00010\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0086@¢\u0006\u0004\b\n\u0010\u000bJ%\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\b¢\u0006\u0004\b\u0010\u0010\u0011JI\u0010 \u001a\u0004\u0018\u00010\u001f2\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u00062\b\u0010\u001c\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u001e\u001a\u00020\u001d¢\u0006\u0004\b \u0010!¨\u0006\""}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ContactActionsHelper;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Landroid/content/ContentResolver;", "contentResolver", "Lr80/b;", TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lookupKey", "getLaunchDataForType", "(Landroid/content/ContentResolver;Lr80/b;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "contactId", "dataForType", "Landroid/content/Intent;", "makeIntent", "(Lr80/b;JLjava/lang/String;)Landroid/content/Intent;", "Landroid/content/Context;", "context", "Lnova/branch/engage/sesame_lite/internal/Prefs;", "prefs", "Lnova/branch/engage/sesame_lite/internal/Pkgs;", "pkgs", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "contactEntity", "actionType", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "usage", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "maxTimesCount", "Lr80/y;", "makeShortcutAction", "(Landroid/content/Context;Lnova/branch/engage/sesame_lite/internal/Prefs;Lnova/branch/engage/sesame_lite/internal/Pkgs;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lr80/b;Lnova/branch/engage/sesame_lite/internal/LinkUsage;I)Lr80/y;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ContactActionsHelper {

    @NotNull
    public static final ContactActionsHelper INSTANCE = new ContactActionsHelper();

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[r80.b.values().length];
            try {
                r80.a aVar = r80.b.Companion;
                iArr[0] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                r80.a aVar2 = r80.b.Companion;
                iArr[1] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                r80.a aVar3 = r80.b.Companion;
                iArr[2] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                r80.a aVar4 = r80.b.Companion;
                iArr[3] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                r80.a aVar5 = r80.b.Companion;
                iArr[4] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                r80.a aVar6 = r80.b.Companion;
                iArr[5] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                r80.a aVar7 = r80.b.Companion;
                iArr[6] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                r80.a aVar8 = r80.b.Companion;
                iArr[7] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                r80.a aVar9 = r80.b.Companion;
                iArr[8] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.ContactActionsHelper", f = "DataImporters.kt", l = {1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188}, m = "getLaunchDataForType")
    /* renamed from: nova.branch.engage.sesame_lite.internal.ContactActionsHelper$getLaunchDataForType$1, reason: invalid class name */
    /* loaded from: classes5.dex */
    public static final class AnonymousClass1 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return ContactActionsHelper.this.getLaunchDataForType(null, null, null, this);
        }
    }

    private ContactActionsHelper() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c2, code lost:
    
        if (r12 == r0) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00e2, code lost:
    
        if (r12 == r0) goto L69;
     */
    /* JADX WARN: Removed duplicated region for block: B:69:0x011f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object getLaunchDataForType(@NotNull ContentResolver contentResolver, @NotNull r80.b bVar, @NotNull String str, @NotNull Continuation<? super String> continuation) {
        AnonymousClass1 anonymousClass1;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        AnonymousClass1 anonymousClass12 = anonymousClass1;
        Object phoneNumberAssociatedApp = anonymousClass12.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (anonymousClass12.label) {
            case 0:
                ResultKt.b(phoneNumberAssociatedApp);
                switch (bVar.ordinal()) {
                    case 0:
                        return str;
                    case 1:
                        ContactsProviderHelper contactsProviderHelper = ContactsProviderHelper.INSTANCE;
                        anonymousClass12.label = 1;
                        Object phoneNumber$default = ContactsProviderHelper.getPhoneNumber$default(contactsProviderHelper, contentResolver, str, null, anonymousClass12, 4, null);
                        return phoneNumber$default == coroutineSingletons ? coroutineSingletons : phoneNumber$default;
                    case 2:
                        ContactsProviderHelper contactsProviderHelper2 = ContactsProviderHelper.INSTANCE;
                        anonymousClass12.label = 2;
                        Object phoneNumber$default2 = ContactsProviderHelper.getPhoneNumber$default(contactsProviderHelper2, contentResolver, str, null, anonymousClass12, 4, null);
                        if (phoneNumber$default2 != coroutineSingletons) {
                            return phoneNumber$default2;
                        }
                        break;
                    case 3:
                        ContactsProviderHelper contactsProviderHelper3 = ContactsProviderHelper.INSTANCE;
                        anonymousClass12.label = 3;
                        Object emailAddress = contactsProviderHelper3.getEmailAddress(contentResolver, str, anonymousClass12);
                        if (emailAddress != coroutineSingletons) {
                            return emailAddress;
                        }
                        break;
                    case 4:
                        ContactsProviderHelper contactsProviderHelper4 = ContactsProviderHelper.INSTANCE;
                        ContactAppDataConfig appDataConfig = ContactAppsKt.getAppDataConfig(bVar);
                        Intrinsics.d(appDataConfig);
                        String mimeType = appDataConfig.getMimeType();
                        anonymousClass12.label = 4;
                        phoneNumberAssociatedApp = contactsProviderHelper4.getPhoneNumberAssociatedApp(contentResolver, str, mimeType, anonymousClass12);
                        break;
                    case 5:
                        ContactsProviderHelper contactsProviderHelper5 = ContactsProviderHelper.INSTANCE;
                        ContactAppDataConfig appDataConfig2 = ContactAppsKt.getAppDataConfig(bVar);
                        Intrinsics.d(appDataConfig2);
                        String mimeType2 = appDataConfig2.getMimeType();
                        anonymousClass12.label = 5;
                        phoneNumberAssociatedApp = contactsProviderHelper5.getPhoneNumberAssociatedApp(contentResolver, str, mimeType2, anonymousClass12);
                        break;
                    case 6:
                        ContactsProviderHelper contactsProviderHelper6 = ContactsProviderHelper.INSTANCE;
                        ContactAppDataConfig appDataConfig3 = ContactAppsKt.getAppDataConfig(bVar);
                        Intrinsics.d(appDataConfig3);
                        String mimeType3 = appDataConfig3.getMimeType();
                        anonymousClass12.label = 6;
                        Object phoneNumberAssociatedApp2 = contactsProviderHelper6.getPhoneNumberAssociatedApp(contentResolver, str, mimeType3, anonymousClass12);
                        if (phoneNumberAssociatedApp2 != coroutineSingletons) {
                            return phoneNumberAssociatedApp2;
                        }
                        break;
                    case 7:
                        ContactsProviderHelper contactsProviderHelper7 = ContactsProviderHelper.INSTANCE;
                        ContactAppDataConfig appDataConfig4 = ContactAppsKt.getAppDataConfig(bVar);
                        Intrinsics.d(appDataConfig4);
                        String mimeType4 = appDataConfig4.getMimeType();
                        anonymousClass12.label = 7;
                        Object phoneNumberAssociatedApp3 = contactsProviderHelper7.getPhoneNumberAssociatedApp(contentResolver, str, mimeType4, anonymousClass12);
                        if (phoneNumberAssociatedApp3 != coroutineSingletons) {
                            return phoneNumberAssociatedApp3;
                        }
                        break;
                    case 8:
                        ContactsProviderHelper contactsProviderHelper8 = ContactsProviderHelper.INSTANCE;
                        ContactAppDataConfig appDataConfig5 = ContactAppsKt.getAppDataConfig(bVar);
                        Intrinsics.d(appDataConfig5);
                        String mimeType5 = appDataConfig5.getMimeType();
                        anonymousClass12.label = 8;
                        Object phoneNumberAssociatedApp4 = contactsProviderHelper8.getPhoneNumberAssociatedApp(contentResolver, str, mimeType5, anonymousClass12);
                        if (phoneNumberAssociatedApp4 != coroutineSingletons) {
                            return phoneNumberAssociatedApp4;
                        }
                        break;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
            case 1:
                ResultKt.b(phoneNumberAssociatedApp);
                return phoneNumberAssociatedApp;
            case 2:
                ResultKt.b(phoneNumberAssociatedApp);
                return phoneNumberAssociatedApp;
            case 3:
                ResultKt.b(phoneNumberAssociatedApp);
                return phoneNumberAssociatedApp;
            case 4:
                ResultKt.b(phoneNumberAssociatedApp);
                String str2 = (String) phoneNumberAssociatedApp;
                if (str2 != null) {
                    return r70.j.F0(str2, "@s.whatsapp.net", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);
                }
                return null;
            case 5:
                ResultKt.b(phoneNumberAssociatedApp);
                String str3 = (String) phoneNumberAssociatedApp;
                if (str3 != null) {
                    return r70.j.F0(str3, "@s.whatsapp.net", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);
                }
                return null;
            case 6:
                ResultKt.b(phoneNumberAssociatedApp);
                return phoneNumberAssociatedApp;
            case 7:
                ResultKt.b(phoneNumberAssociatedApp);
                return phoneNumberAssociatedApp;
            case 8:
                ResultKt.b(phoneNumberAssociatedApp);
                return phoneNumberAssociatedApp;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    @NotNull
    public final Intent makeIntent(@NotNull r80.b type, long contactId, @NotNull String dataForType) {
        Intent intentAddFlags;
        Intrinsics.g(type, "type");
        Intrinsics.g(dataForType, "dataForType");
        switch (type.ordinal()) {
            case 0:
                intentAddFlags = new Intent("android.intent.action.VIEW", ContactsContract.Contacts.getLookupUri(contactId, dataForType)).addFlags(268435456);
                break;
            case 1:
                intentAddFlags = new Intent("android.intent.action.DIAL", Uri.parse("tel:".concat(dataForType)));
                break;
            case 2:
                intentAddFlags = new Intent("android.intent.action.SENDTO", Uri.parse("sms:".concat(dataForType)));
                break;
            case 3:
                intentAddFlags = new Intent("android.intent.action.SENDTO", Uri.parse("mailto:".concat(dataForType)));
                break;
            case 4:
                intentAddFlags = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:".concat(dataForType)));
                break;
            case 5:
                intentAddFlags = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:".concat(dataForType)));
                break;
            case 6:
                intentAddFlags = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:".concat(dataForType)));
                break;
            case 7:
                intentAddFlags = new Intent("android.intent.action.VIEW", Uri.parse("viber://chat?number=".concat(r70.j.F0(dataForType, "+", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false))));
                break;
            case 8:
                intentAddFlags = new Intent("android.intent.action.VIEW", Uri.parse("https://t.me/".concat(r70.j.F0(dataForType, "+", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false))));
                break;
            default:
                throw new NoWhenBranchMatchedException();
        }
        Intrinsics.d(intentAddFlags);
        ContactAppDataConfig appDataConfig = ContactAppsKt.getAppDataConfig(type);
        if (appDataConfig != null) {
            intentAddFlags.setPackage(appDataConfig.getPackageName());
        }
        intentAddFlags.addFlags(268435456);
        return intentAddFlags;
    }

    @Nullable
    public final r80.y makeShortcutAction(@NotNull Context context, @NotNull Prefs prefs, @NotNull Pkgs pkgs, @NotNull LinkEntity contactEntity, @NotNull r80.b actionType, @Nullable LinkUsage usage, int maxTimesCount) {
        String str;
        String string;
        String strA;
        long[] usageTimes;
        List listY0;
        long[] clickTimes;
        List listY02;
        Intrinsics.g(context, "context");
        Intrinsics.g(prefs, "prefs");
        Intrinsics.g(pkgs, "pkgs");
        Intrinsics.g(contactEntity, "contactEntity");
        Intrinsics.g(actionType, "actionType");
        Uri uri = null;
        switch (actionType.ordinal()) {
            case 0:
                return null;
            case 1:
                String string2 = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_DIALER_PKG, prefs.getDefContactActionsDialerPkg());
                if (string2 == null) {
                    string2 = pkgs.getContacts();
                }
                str = string2;
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_DIALER_ICON, prefs.getDefContactActionsDialerIcon());
                strA = actionType.a(context);
                break;
            case 2:
                String string3 = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_SMS_PKG, prefs.getDefContactActionsSmsPkg());
                if (string3 == null) {
                    string3 = pkgs.getContacts();
                }
                str = string3;
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_SMS_ICON, prefs.getDefContactActionsSmsIcon());
                strA = actionType.a(context);
                break;
            case 3:
                String string4 = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_EMAIL_PKG, prefs.getDefContactActionsEmailPkg());
                if (string4 == null) {
                    string4 = pkgs.getContacts();
                }
                str = string4;
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_EMAIL_ICON, prefs.getDefContactActionsEmailIcon());
                strA = actionType.a(context);
                break;
            case 4:
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_ICON, prefs.getDefContactActionsWhatsappIcon());
                strA = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_LABEL, null);
                str = Pkgs.WHATSAPP;
                if (strA == null) {
                    strA = actionType.a(context);
                    break;
                }
                break;
            case 5:
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_4B_ICON, prefs.getDefContactActionsWhatsappIcon());
                strA = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_WHATSAPP_4B_LABEL, null);
                str = Pkgs.WHATSAPP_4B;
                if (strA == null) {
                    strA = actionType.a(context);
                    break;
                }
                break;
            case 6:
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_SIGNAL_ICON, prefs.getDefContactActionsWhatsappIcon());
                strA = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_SIGNAL_LABEL, null);
                str = Pkgs.SIGNAL;
                if (strA == null) {
                    strA = actionType.a(context);
                    break;
                }
                break;
            case 7:
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_VIBER_ICON, prefs.getDefContactActionsWhatsappIcon());
                strA = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_VIBER_LABEL, null);
                str = Pkgs.VIBER;
                if (strA == null) {
                    strA = actionType.a(context);
                    break;
                }
                break;
            case 8:
                string = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_TELEGRAM_ICON, prefs.getDefContactActionsWhatsappIcon());
                strA = prefs.getString(Prefs.KEY_CONTACT_ACTIONS_TELEGRAM_LABEL, null);
                str = Pkgs.TELEGRAM;
                if (strA == null) {
                    strA = actionType.a(context);
                    break;
                }
                break;
            default:
                throw new NoWhenBranchMatchedException();
        }
        String str2 = strA;
        String str3 = str;
        if (string != null && !r70.k.U0(string)) {
            uri = Uri.parse(string);
        }
        Uri uri2 = uri;
        long[] jArrJ1 = (usage == null || (clickTimes = usage.getClickTimes()) == null || (listY02 = kotlin.collections.c.Y0(clickTimes, maxTimesCount)) == null) ? new long[0] : b70.g.J1(listY02);
        long[] jArrJ12 = (usage == null || (usageTimes = usage.getUsageTimes()) == null || (listY0 = kotlin.collections.c.Y0(usageTimes, maxTimesCount)) == null) ? new long[0] : b70.g.J1(listY0);
        IdHash idHash = contactEntity.getIdHash();
        long userSerial = contactEntity.getUserSerial();
        r80.d dVar = r80.d.f85660g;
        IdHash idHashOfContactAction = IdHash.INSTANCE.ofContactAction(contactEntity.getGroupId(), actionType);
        Long lV0 = r70.i.v0(contactEntity.getTypeSpecificKey());
        return new r80.y(idHash, str3, userSerial, dVar, str2, uri2, jArrJ1, jArrJ12, new r80.s(idHashOfContactAction, lV0 != null ? lV0.longValue() : 0L, contactEntity.getGroupId()));
    }
}
