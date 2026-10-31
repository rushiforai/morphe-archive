package ads_mobile_sdk;

/* loaded from: classes.dex */
public final class b8 implements b.x5 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f1314b;
    public static final b8 a$1 = new b8(1);
    public static final b8 a$2 = new b8(2);

    /* renamed from: a, reason: collision with root package name */
    public static final b8 f1313a = new b8(0);
    public static final b8 a$3 = new b8(3);
    public static final b8 a$4 = new b8(4);
    public static final b8 a$5 = new b8(5);
    public static final b8 a$6 = new b8(6);
    public static final b8 a$7 = new b8(7);
    public static final b8 a$8 = new b8(8);
    public static final b8 a$9 = new b8(9);
    public static final b8 a$10 = new b8(10);
    public static final b8 a$11 = new b8(11);
    public static final b8 a$12 = new b8(12);
    public static final b8 a$13 = new b8(13);
    public static final b8 a$14 = new b8(14);
    public static final b8 a$15 = new b8(15);
    public static final b8 a$16 = new b8(16);

    public /* synthetic */ b8(int i5) {
        this.f1314b = i5;
    }

    @Override // b.x5
    public final boolean a(int i5) {
        b40 b40Var;
        f50 f50Var;
        jc jcVar;
        n50 n50Var;
        v50 v50Var;
        a60 a60Var;
        switch (this.f1314b) {
            case 0:
                if (c8.a(i5) != null) {
                }
                break;
            case 1:
                switch (i5) {
                    case 0:
                        b40Var = b40.ACTION_UNSPECIFIED;
                        break;
                    case 1:
                        b40Var = b40.PROCEED;
                        break;
                    case 2:
                        b40Var = b40.DISCARD;
                        break;
                    case 3:
                        b40Var = b40.KEEP;
                        break;
                    case 4:
                        b40Var = b40.CLOSE;
                        break;
                    case 5:
                        b40Var = b40.CANCEL;
                        break;
                    case 6:
                        b40Var = b40.DISMISS;
                        break;
                    case 7:
                        b40Var = b40.BACK;
                        break;
                    case 8:
                        b40Var = b40.OPEN_SUBPAGE;
                        break;
                    case 9:
                        b40Var = b40.PROCEED_DEEP_SCAN;
                        break;
                    case 10:
                        b40Var = b40.OPEN_LEARN_MORE_LINK;
                        break;
                    default:
                        b40Var = null;
                        break;
                }
                if (b40Var != null) {
                }
                break;
            case 2:
                if ((i5 != 0 ? i5 != 1 ? null : c50.TYPE_CREATIVE : c50.TYPE_UNKNOWN) != null) {
                }
                break;
            case 3:
                if ((i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? null : dt.BLOB_STATE_FAILED : dt.BLOB_STATE_ACTIVE : dt.BLOB_STATE_INACTIVE : dt.BLOB_STATE_AVAILABLE) != null) {
                }
                break;
            case 4:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3 || i5 == 4 || i5 == 5) {
                }
                break;
            case 5:
                switch (i5) {
                    case 0:
                        f50Var = f50.UNKNOWN;
                        break;
                    case 1:
                        f50Var = f50.URL_PHISHING;
                        break;
                    case 2:
                        f50Var = f50.URL_MALWARE;
                        break;
                    case 3:
                        f50Var = f50.URL_UNWANTED;
                        break;
                    case 4:
                        f50Var = f50.CLIENT_SIDE_PHISHING_URL;
                        break;
                    case 5:
                        f50Var = f50.CLIENT_SIDE_MALWARE_URL;
                        break;
                    case 6:
                        f50Var = f50.DANGEROUS_DOWNLOAD_RECOVERY;
                        break;
                    case 7:
                        f50Var = f50.DANGEROUS_DOWNLOAD_WARNING;
                        break;
                    case 8:
                        f50Var = f50.OCTAGON_AD;
                        break;
                    case 9:
                        f50Var = f50.OCTAGON_AD_SB_MATCH;
                        break;
                    case 10:
                        f50Var = f50.DANGEROUS_DOWNLOAD_BY_API;
                        break;
                    case 11:
                        f50Var = f50.OCTAGON_IOS_AD;
                        break;
                    case 12:
                        f50Var = f50.PASSWORD_PROTECTION_PHISHING_URL;
                        break;
                    case 13:
                        f50Var = f50.DANGEROUS_DOWNLOAD_OPENED;
                        break;
                    case 14:
                        f50Var = f50.AD_SAMPLE;
                        break;
                    case 15:
                        f50Var = f50.URL_SUSPICIOUS;
                        break;
                    case 16:
                        f50Var = f50.BILLING;
                        break;
                    case 17:
                        f50Var = f50.APK_DOWNLOAD;
                        break;
                    case 18:
                        f50Var = f50.BLOCKED_AD_DRIVE_BY_DOWNLOAD;
                        break;
                    case 19:
                        f50Var = f50.BLOCKED_AD_REDIRECT;
                        break;
                    case 20:
                        f50Var = f50.BLOCKED_AD_POPUP;
                        break;
                    case 21:
                        f50Var = f50.HASH_PREFIX_REAL_TIME_EXPERIMENT;
                        break;
                    case 22:
                        f50Var = f50.PHISHY_SITE_INTERACTIONS;
                        break;
                    case 23:
                        f50Var = f50.WARNING_SHOWN;
                        break;
                    case 24:
                        f50Var = f50.NOTIFICATION_PERMISSION_ACCEPTED;
                        break;
                    case 25:
                        f50Var = f50.DANGEROUS_DOWNLOAD_AUTO_DELETED;
                        break;
                    case 26:
                        f50Var = f50.DANGEROUS_DOWNLOAD_PROFILE_CLOSED;
                        break;
                    case 27:
                        f50Var = f50.URL_REALTIME_AND_HASH_REALTIME_DISCREPANCY;
                        break;
                    case 28:
                        f50Var = f50.EXTERNAL_APP_REDIRECT;
                        break;
                    case 29:
                        f50Var = f50.DANGEROUS_DOWNLOAD_WARNING_ANDROID;
                        break;
                    case 30:
                        f50Var = f50.SERVICE_WORKER_BEHAVIOR;
                        break;
                    case 31:
                        f50Var = f50.OCTAGON_AD_UNTRUSTED_DOMAIN;
                        break;
                    default:
                        f50Var = null;
                        break;
                }
                if (f50Var != null) {
                }
                break;
            case 6:
                if ((i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? null : ft.BLOB_TYPE_BRAIN_SUGGEST : ft.BLOB_TYPE_WEB_SUGGEST : ft.BLOB_TYPE_JAR : ft.BLOB_TYPE_DEFAULT : ft.BLOB_TYPE_UNKNOWN) != null) {
                }
                break;
            case 7:
                if ((i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? null : h50.AD_RESOURCE_AUTO_CLICK_DESTINATION : h50.AD_RESOURCE_POST_CLICK : h50.AD_RESOURCE_CREATIVE : h50.AD_RESOURCE_UNKNOWN) != null) {
                }
                break;
            case 8:
                if (i5 == 0 || i5 == 1) {
                }
                break;
            case 9:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3 || i5 == 4 || i5 == 5) {
                }
                break;
            case 10:
                switch (i5) {
                    case 0:
                        jcVar = jc.DEBUGGER_STATE_UNSPECIFIED;
                        break;
                    case 1:
                        jcVar = jc.DEBUGGER_STATE_NOT_INSTALLED;
                        break;
                    case 2:
                        jcVar = jc.DEBUGGER_STATE_INSTALLED;
                        break;
                    case 3:
                        jcVar = jc.DEBUGGER_STATE_ACTIVE;
                        break;
                    case 4:
                        jcVar = jc.DEBUGGER_STATE_ENVVAR;
                        break;
                    case 5:
                        jcVar = jc.DEBUGGER_STATE_MACHPORT;
                        break;
                    case 6:
                        jcVar = jc.DEBUGGER_STATE_ENVVAR_MACHPORT;
                        break;
                    default:
                        jcVar = null;
                        break;
                }
                if (jcVar != null) {
                }
                break;
            case 11:
                switch (i5) {
                    case 0:
                        n50Var = n50.SAFE_BROWSING_URL_API_TYPE_UNSPECIFIED;
                        break;
                    case 1:
                        n50Var = n50.PVER3_NATIVE;
                        break;
                    case 2:
                        n50Var = n50.PVER4_NATIVE;
                        break;
                    case 3:
                        n50Var = n50.ANDROID_SAFETYNET;
                        break;
                    case 4:
                        n50Var = n50.FLYWHEEL;
                        break;
                    case 5:
                        n50Var = n50.REAL_TIME;
                        break;
                    case 6:
                        n50Var = n50.PVER5_NATIVE_REAL_TIME;
                        break;
                    case 7:
                        n50Var = n50.ANDROID_SAFEBROWSING_REAL_TIME;
                        break;
                    case 8:
                        n50Var = n50.ANDROID_SAFEBROWSING;
                        break;
                    case 9:
                        n50Var = n50.CLIENT_SIDE_DETECTION;
                        break;
                    case 10:
                        n50Var = n50.GLIC;
                        break;
                    case 11:
                        n50Var = n50.PVER5_NATIVE_LOCAL_BLOCKLIST;
                        break;
                    default:
                        n50Var = null;
                        break;
                }
                if (n50Var != null) {
                }
                break;
            case 12:
                if ((i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? null : s50.BILLING : s50.UNWANTED : s50.PHISHING : s50.MALWARE : s50.SAFE_OR_OTHER) != null) {
                }
                break;
            case 13:
                if ((i5 != 0 ? i5 != 1 ? null : ut.DOWNLOADED : ut.DOWNLOADABLE) != null) {
                }
                break;
            case 14:
                switch (i5) {
                    case 0:
                        v50Var = v50.REQUEST_DESTINATION_UNSPECIFIED;
                        break;
                    case 1:
                        v50Var = v50.EMPTY;
                        break;
                    case 2:
                        v50Var = v50.AUDIO;
                        break;
                    case 3:
                        v50Var = v50.AUDIO_WORKLET;
                        break;
                    case 4:
                        v50Var = v50.DOCUMENT;
                        break;
                    case 5:
                        v50Var = v50.EMBED;
                        break;
                    case 6:
                        v50Var = v50.FONT;
                        break;
                    case 7:
                        v50Var = v50.FRAME;
                        break;
                    case 8:
                        v50Var = v50.IFRAME;
                        break;
                    case 9:
                        v50Var = v50.IMAGE;
                        break;
                    case 10:
                        v50Var = v50.MANIFEST;
                        break;
                    case 11:
                        v50Var = v50.OBJECT;
                        break;
                    case 12:
                        v50Var = v50.PAINT_WORKLET;
                        break;
                    case 13:
                        v50Var = v50.REPORT;
                        break;
                    case 14:
                        v50Var = v50.SCRIPT;
                        break;
                    case 15:
                        v50Var = v50.SERVICE_WORKER;
                        break;
                    case 16:
                        v50Var = v50.SHARED_WORKER;
                        break;
                    case 17:
                        v50Var = v50.STYLE;
                        break;
                    case 18:
                        v50Var = v50.TRACK;
                        break;
                    case 19:
                        v50Var = v50.VIDEO;
                        break;
                    case 20:
                        v50Var = v50.WEB_BUNDLE;
                        break;
                    case 21:
                        v50Var = v50.WORKER;
                        break;
                    case 22:
                        v50Var = v50.XSLT;
                        break;
                    case 23:
                        v50Var = v50.FENCED_FRAME;
                        break;
                    case 24:
                        v50Var = v50.WEB_IDENTITY;
                        break;
                    case 25:
                        v50Var = v50.DICTIONARY;
                        break;
                    case 26:
                        v50Var = v50.SPECULATION_RULES;
                        break;
                    case 27:
                        v50Var = v50.JSON;
                        break;
                    case 28:
                        v50Var = v50.SHARED_STORAGE_WORKLET;
                        break;
                    default:
                        v50Var = null;
                        break;
                }
                if (v50Var != null) {
                }
                break;
            case 15:
                if ((i5 != 0 ? i5 != 1 ? null : wp.COLLECTED_BIDDING_SIGNAL : wp.UNKNOWN) != null) {
                }
                break;
            default:
                switch (i5) {
                    case 0:
                        a60Var = a60.UNKNOWN;
                        break;
                    case 1:
                        a60Var = a60.PHISHING_INTERSTITIAL;
                        break;
                    case 2:
                        a60Var = a60.CLIENT_SIDE_PHISHING_INTERSTITIAL;
                        break;
                    case 3:
                        a60Var = a60.MALWARE_INTERSTITIAL;
                        break;
                    case 4:
                        a60Var = a60.UWS_INTERSTITIAL;
                        break;
                    case 5:
                        a60Var = a60.BILLING_INTERSTITIAL;
                        break;
                    case 6:
                        a60Var = a60.BINARY_MALWARE_DOWNLOAD_WARNING;
                        break;
                    default:
                        a60Var = null;
                        break;
                }
                if (a60Var != null) {
                }
                break;
        }
        return true;
    }
}
