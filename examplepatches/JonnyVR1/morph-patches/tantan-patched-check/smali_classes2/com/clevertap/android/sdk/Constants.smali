.class public interface abstract Lcom/clevertap/android/sdk/Constants;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field public static final AES_GCM_PREFIX:Ljava/lang/String; = "<ct<"

.field public static final AES_GCM_SUFFIX:Ljava/lang/String; = ">ct>"

.field public static final AES_PREFIX:Ljava/lang/String; = "["

.field public static final AES_SUFFIX:Ljava/lang/String; = "]"

.field public static final ALL_IDENTITY_KEYS:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final APP_INBOX_CTA1_INDEX:I = 0x0

.field public static final APP_INBOX_CTA2_INDEX:I = 0x1

.field public static final APP_INBOX_CTA3_INDEX:I = 0x2

.field public static final APP_INBOX_ITEM_CONTENT_PAGE_INDEX:I = 0x0

.field public static final APP_INBOX_ITEM_INDEX:I = -0x1

.field public static final APP_LAUNCHED_EVENT:Ljava/lang/String; = "App Launched"

.field public static final AUDIO_THUMBNAIL:Ljava/lang/String; = "ct_audio"

.field public static final AUTH:Ljava/lang/String; = "auth"

.field public static final BLACK:Ljava/lang/String; = "#000000"

.field public static final BLUE:Ljava/lang/String; = "#0000FF"

.field public static final CACHED_GUIDS_KEY:Ljava/lang/String; = "cachedGUIDsKey"

.field public static final CACHED_GUIDS_LENGTH_KEY:Ljava/lang/String; = "cachedGUIDsLengthKey"

.field public static final CACHED_VARIABLES_KEY:Ljava/lang/String; = "variablesKey"

.field public static final CACHED_VARIANTS_KEY:Ljava/lang/String; = "variantsForAbKey"

.field public static final CHARGED_EVENT:Ljava/lang/String; = "Charged"

.field public static final CLEVERTAP_ALLOW_SYSTEM_EVENTS:Ljava/lang/String; = "ct_allow_sys_events_and_communication"

.field public static final CLEVERTAP_IDENTIFIER:Ljava/lang/String; = "CLEVERTAP_IDENTIFIER"

.field public static final CLEVERTAP_LOG_TAG:Ljava/lang/String; = "CleverTap"

.field public static final CLEVERTAP_OPTOUT:Ljava/lang/String; = "ct_optout"

.field public static final CLEVERTAP_STORAGE_TAG:Ljava/lang/String; = "WizRocket"

.field public static final CLOSE_SYSTEM_DIALOGS:Ljava/lang/String; = "close_system_dialogs"

.field public static final CLTAP_APP_VERSION:Ljava/lang/String; = "Version"

.field public static final CLTAP_BLUETOOTH_ENABLED:Ljava/lang/String; = "BluetoothEnabled"

.field public static final CLTAP_BLUETOOTH_VERSION:Ljava/lang/String; = "BluetoothVersion"

.field public static final CLTAP_CARRIER:Ljava/lang/String; = "Carrier"

.field public static final CLTAP_CONNECTED_TO_WIFI:Ljava/lang/String; = "wifi"

.field public static final CLTAP_LATITUDE:Ljava/lang/String; = "Latitude"

.field public static final CLTAP_LONGITUDE:Ljava/lang/String; = "Longitude"

.field public static final CLTAP_NETWORK_TYPE:Ljava/lang/String; = "Radio"

.field public static final CLTAP_OS_VERSION:Ljava/lang/String; = "OS Version"

.field public static final CLTAP_PROP_CAMPAIGN_ID:Ljava/lang/String; = "Campaign id"

.field public static final CLTAP_PROP_VARIANT:Ljava/lang/String; = "Variant"

.field public static final CLTAP_SDK_VERSION:Ljava/lang/String; = "SDK Version"

.field public static final COMMAND_ADD:Ljava/lang/String; = "$add"

.field public static final COMMAND_DECREMENT:Ljava/lang/String; = "$decr"

.field public static final COMMAND_DELETE:Ljava/lang/String; = "$delete"

.field public static final COMMAND_INCREMENT:Ljava/lang/String; = "$incr"

.field public static final COMMAND_REMOVE:Ljava/lang/String; = "$remove"

.field public static final COMMAND_SET:Ljava/lang/String; = "$set"

.field public static final CONTENT_FETCH_JSON_RESPONSE_KEY:Ljava/lang/String; = "content_fetch"

.field public static final COPY_TYPE:Ljava/lang/String; = "copy"

.field public static final CRYPTION_IV:Ljava/lang/String; = "__CL3>3Rt#P__1V_"

.field public static final CRYPTION_SALT:Ljava/lang/String; = "W1ZRCl3>"

.field public static final CT_FALLBACK_NOTIFICATION_CHANNEL_ID_LOW:Ljava/lang/String; = "ct_fallback_notification_channel_low_importance"

.field public static final CUSTOM_CLEVERTAP_ID_PREFIX:Ljava/lang/String; = "__h"

.field public static final DATA_EVENT:I = 0x5

.field public static final DATE_PREFIX:Ljava/lang/String; = "$D_"

.field public static final DEEP_LINK_KEY:Ljava/lang/String; = "wzrk_dl"

.field public static final DEFAULT_MUTE_DURATION_MS:J = 0x5265c00L

.field public static final DEFAULT_PUSH_TTL_SECONDS:J = 0x54600L

.field public static final DEFINE_VARS_EVENT:I = 0x8

.field public static final DELETE_MARKER:Ljava/lang/String; = "__CLEVERTAP_DELETE__"

.field public static final DEVICE_ID_TAG:Ljava/lang/String; = "deviceId"

.field public static final DISCARDED_EVENT_JSON_KEY:Ljava/lang/String; = "d_e"

.field public static final DISPLAY_UNIT_JSON_RESPONSE_KEY:Ljava/lang/String; = "adUnit_notifs"

.field public static final DISPLAY_UNIT_PREVIEW_PUSH_PAYLOAD_KEY:Ljava/lang/String; = "wzrk_adunit"

.field public static final DND_START:Ljava/lang/String; = "22:00"

.field public static final DND_STOP:Ljava/lang/String; = "06:00"

.field public static final D_SRC:Ljava/lang/String; = "d_src"

.field public static final D_SRC_PI_R:Ljava/lang/String; = "PI_R"

.field public static final D_SRC_PI_WM:Ljava/lang/String; = "PI_WM"

.field public static final EMPTY_NOTIFICATION_ID:I = -0x3e8

.field public static final ERROR_KEY:Ljava/lang/String; = "wzrk_error"

.field public static final ERROR_PROFILE_PREFIX:Ljava/lang/String; = "__i"

.field public static final EXTRAS_FROM:Ljava/lang/String; = "extras_from"

.field public static final FALLBACK_COLOR:Ljava/lang/String; = "#FFFFFF"

.field public static final FALLBACK_ID_TAG:Ljava/lang/String; = "fallbackId"

.field public static final FCM_FALLBACK_NOTIFICATION_CHANNEL_ID:Ljava/lang/String; = "fcm_fallback_notification_channel"

.field public static final FCM_FALLBACK_NOTIFICATION_CHANNEL_NAME:Ljava/lang/String; = "Misc"

.field public static final FEATURE_DISPLAY_UNIT:Ljava/lang/String; = "DisplayUnit : "

.field public static final FEATURE_FLAG_JSON_RESPONSE_KEY:Ljava/lang/String; = "ff_notifs"

.field public static final FEATURE_FLAG_UNIT:Ljava/lang/String; = "Feature Flag : "

.field public static final FETCH_EVENT:I = 0x7

.field public static final FETCH_TYPE_FF:I = 0x1

.field public static final FETCH_TYPE_INBOX_V2:I = 0x7

.field public static final FETCH_TYPE_IN_ACTION_IN_APPS:I = 0x6

.field public static final FETCH_TYPE_IN_APPS:I = 0x5

.field public static final FETCH_TYPE_PC:I = 0x0

.field public static final FETCH_TYPE_VARIABLES:I = 0x4

.field public static final FLUSH_PUSH_IMPRESSIONS_ONE_TIME_WORKER_NAME:Ljava/lang/String; = "CTFlushPushImpressionsOneTime"

.field public static final GEOFENCES_JSON_RESPONSE_KEY:Ljava/lang/String; = "geofences"

.field public static final GEOFENCE_ENTERED_EVENT_NAME:Ljava/lang/String; = "Geocluster Entered"

.field public static final GEOFENCE_EXITED_EVENT_NAME:Ljava/lang/String; = "Geocluster Exited"

.field public static final GET_MARKER:Ljava/lang/String; = "__CLEVERTAP_GET__"

.field public static final GREEN:Ljava/lang/String; = "#00FF00"

.field public static final GUID_PREFIX_GOOGLE_AD_ID:Ljava/lang/String; = "__g"

.field public static final IMAGE_PLACEHOLDER:Ljava/lang/String; = "ct_image"

.field public static final INAPP_ADVANCED_BUILDER_TYPE:Ljava/lang/String; = "advanced-builder"

.field public static final INAPP_ASPECT_RATIO:Ljava/lang/String; = "aspectRatio"

.field public static final INAPP_CLOSE_IV_WIDTH:I = 0x28

.field public static final INAPP_DATA_TAG:Ljava/lang/String; = "d"

.field public static final INAPP_DELIVERY_MODE_KEY:Ljava/lang/String; = "inapp_delivery_mode"

.field public static final INAPP_FC_LIMITS:Ljava/lang/String; = "frequencyLimits"

.field public static final INAPP_HTML_SPLIT:Ljava/lang/String; = "\"##Vars##\""

.field public static final INAPP_HTML_TAG:Ljava/lang/String; = "html"

.field public static final INAPP_ID_IN_PAYLOAD:Ljava/lang/String; = "ti"

.field public static final INAPP_IMAGE_INTERSTITIAL_CONFIG:Ljava/lang/String; = "imageInterstitialConfig"

.field public static final INAPP_IMAGE_INTERSTITIAL_HTML_NAME:Ljava/lang/String; = "image_interstitial.html"

.field public static final INAPP_IMAGE_INTERSTITIAL_TYPE:Ljava/lang/String; = "image-interstitial"

.field public static final INAPP_JSON_RESPONSE_KEY:Ljava/lang/String; = "inapp_notifs"

.field public static final INAPP_JS_ENABLED:Ljava/lang/String; = "isJsEnabled"

.field public static final INAPP_KEY:Ljava/lang/String; = "inApp"

.field public static final INAPP_MAX_DISPLAY_COUNT:Ljava/lang/String; = "mdc"

.field public static final INAPP_MAX_PER_DAY_KEY:Ljava/lang/String; = "imp"

.field public static final INAPP_MAX_PER_SESSION_KEY:Ljava/lang/String; = "imc"

.field public static final INAPP_NOTIFS_APP_LAUNCHED_KEY:Ljava/lang/String; = "inapp_notifs_applaunched"

.field public static final INAPP_NOTIFS_APP_LAUNCHED_META_KEY:Ljava/lang/String; = "inapp_notifs_applaunched_meta"

.field public static final INAPP_NOTIFS_KEY_CS:Ljava/lang/String; = "inapp_notifs_cs"

.field public static final INAPP_NOTIFS_KEY_SS:Ljava/lang/String; = "inapp_notifs_ss"

.field public static final INAPP_NOTIFS_META_KEY:Ljava/lang/String; = "inapp_notifs_meta"

.field public static final INAPP_NOTIFS_STALE_KEY:Ljava/lang/String; = "inapp_stale"

.field public static final INAPP_NOTIF_DARKEN_SCREEN:Ljava/lang/String; = "dk"

.field public static final INAPP_NOTIF_SHOW_CLOSE:Ljava/lang/String; = "sc"

.field public static final INAPP_OCCURRENCE_LIMITS:Ljava/lang/String; = "occurrenceLimits"

.field public static final INAPP_POSITION:Ljava/lang/String; = "pos"

.field public static final INAPP_POSITION_BOTTOM:C = 'b'

.field public static final INAPP_POSITION_CENTER:C = 'c'

.field public static final INAPP_POSITION_LEFT:C = 'l'

.field public static final INAPP_POSITION_RIGHT:C = 'r'

.field public static final INAPP_POSITION_TOP:C = 't'

.field public static final INAPP_PREVIEW_PUSH_PAYLOAD_KEY:Ljava/lang/String; = "wzrk_inapp"

.field public static final INAPP_PREVIEW_PUSH_PAYLOAD_TYPE_KEY:Ljava/lang/String; = "wzrk_inapp_type"

.field public static final INAPP_PREVIEW_S3_URL_KEY:Ljava/lang/String; = "wzrk_inapp_s3_url"

.field public static final INAPP_PRIORITY:Ljava/lang/String; = "priority"

.field public static final INAPP_SS_EVAL_META:Ljava/lang/String; = "inapps_eval"

.field public static final INAPP_SUPPRESSED:Ljava/lang/String; = "suppressed"

.field public static final INAPP_SUPPRESSED_META:Ljava/lang/String; = "inapps_suppressed"

.field public static final INAPP_WHEN_TRIGGERS:Ljava/lang/String; = "whenTriggers"

.field public static final INAPP_WINDOW:Ljava/lang/String; = "w"

.field public static final INAPP_WZRK_CGID:Ljava/lang/String; = "wzrk_cgId"

.field public static final INAPP_WZRK_PIVOT:Ljava/lang/String; = "wzrk_pivot"

.field public static final INAPP_X_DP:Ljava/lang/String; = "xdp"

.field public static final INAPP_X_PERCENT:Ljava/lang/String; = "xp"

.field public static final INAPP_Y_DP:Ljava/lang/String; = "ydp"

.field public static final INAPP_Y_PERCENT:Ljava/lang/String; = "yp"

.field public static final INBOX_JSON_RESPONSE_KEY:Ljava/lang/String; = "inbox_notifs"

.field public static final INBOX_PREVIEW_PUSH_PAYLOAD_KEY:Ljava/lang/String; = "wzrk_inbox"

.field public static final INBOX_V2_ISREAD_KEY:Ljava/lang/String; = "isRead"

.field public static final INBOX_V2_JSON_RESPONSE_KEY:Ljava/lang/String; = "inbox_notifs_v2"

.field public static final INBOX_V2_THROTTLE_WINDOW_MS:J = 0x493e0L

.field public static final KEY_ACTION:Ljava/lang/String; = "action"

.field public static final KEY_ACTIONS:Ljava/lang/String; = "actions"

.field public static final KEY_ALT_TEXT:Ljava/lang/String; = "alt_text"

.field public static final KEY_ANDROID:Ljava/lang/String; = "android"

.field public static final KEY_BG:Ljava/lang/String; = "bg"

.field public static final KEY_BORDER:Ljava/lang/String; = "border"

.field public static final KEY_BUTTONS:Ljava/lang/String; = "buttons"

.field public static final KEY_C2A:Ljava/lang/String; = "wzrk_c2a"

.field public static final KEY_COLOR:Ljava/lang/String; = "color"

.field public static final KEY_CONFIG:Ljava/lang/String; = "config"

.field public static final KEY_CONTENT:Ljava/lang/String; = "content"

.field public static final KEY_CONTENT_TYPE:Ljava/lang/String; = "content_type"

.field public static final KEY_COUNTS_PER_INAPP:Ljava/lang/String; = "counts_per_inapp"

.field public static final KEY_COUNTS_SHOWN_TODAY:Ljava/lang/String; = "istc_inapp"

.field public static final KEY_CT_TYPE:Ljava/lang/String; = "ct_type"

.field public static final KEY_CUSTOM_HTML:Ljava/lang/String; = "custom-html"

.field public static final KEY_CUSTOM_KV:Ljava/lang/String; = "custom_kv"

.field public static final KEY_DATE:Ljava/lang/String; = "date"

.field public static final KEY_EFC:Ljava/lang/String; = "efc"

.field public static final KEY_ENCRYPTION_CGK:Ljava/lang/String; = "cgk"

.field public static final KEY_ENCRYPTION_EMAIL:Ljava/lang/String; = "Email"

.field public static final KEY_ENCRYPTION_IDENTITY:Ljava/lang/String; = "Identity"

.field public static final KEY_ENCRYPTION_MIGRATION:Ljava/lang/String; = "encryptionmigration"

.field public static final KEY_ENCRYPTION_NAME:Ljava/lang/String; = "Name"

.field public static final KEY_ENCRYPTION_PHONE:Ljava/lang/String; = "Phone"

.field public static final KEY_EVT_DATA:Ljava/lang/String; = "evtData"

.field public static final KEY_EVT_NAME:Ljava/lang/String; = "evtName"

.field public static final KEY_EXCLUDE_GLOBAL_CAPS:Ljava/lang/String; = "excludeGlobalFCaps"

.field public static final KEY_FALLBACK_NOTIFICATION_SETTINGS:Ljava/lang/String; = "fbSettings"

.field public static final KEY_FREQUENCY:Ljava/lang/String; = "frequency"

.field public static final KEY_HAS_LINKS:Ljava/lang/String; = "hasLinks"

.field public static final KEY_HAS_URL:Ljava/lang/String; = "hasUrl"

.field public static final KEY_HIDE_CLOSE:Ljava/lang/String; = "close"

.field public static final KEY_ICON:Ljava/lang/String; = "icon"

.field public static final KEY_ID:Ljava/lang/String; = "id"

.field public static final KEY_IS_READ:Ljava/lang/String; = "isRead"

.field public static final KEY_IS_TABLET:Ljava/lang/String; = "tablet"

.field public static final KEY_ITEMS:Ljava/lang/String; = "Items"

.field public static final KEY_KEY:Ljava/lang/String; = "key"

.field public static final KEY_KV:Ljava/lang/String; = "kv"

.field public static final KEY_LANDSCAPE:Ljava/lang/String; = "hasLandscape"

.field public static final KEY_LIMIT:Ljava/lang/String; = "limit"

.field public static final KEY_LINKS:Ljava/lang/String; = "links"

.field public static final KEY_MAX_PER_DAY:Ljava/lang/String; = "istmcd_inapp"

.field public static final KEY_MEDIA:Ljava/lang/String; = "media"

.field public static final KEY_MEDIA_LANDSCAPE:Ljava/lang/String; = "mediaLandscape"

.field public static final KEY_MESSAGE:Ljava/lang/String; = "message"

.field public static final KEY_MSG:Ljava/lang/String; = "msg"

.field public static final KEY_MUTED:Ljava/lang/String; = "comms_mtd"

.field public static final KEY_MUTE_EXPIRY:Ljava/lang/String; = "comms_mute_expiry_ts"

.field public static final KEY_NEW_VALUE:Ljava/lang/String; = "newValue"

.field public static final KEY_OLD_VALUE:Ljava/lang/String; = "oldValue"

.field public static final KEY_ORIENTATION:Ljava/lang/String; = "orientation"

.field public static final KEY_PORTRAIT:Ljava/lang/String; = "hasPortrait"

.field public static final KEY_POSTER_URL:Ljava/lang/String; = "poster"

.field public static final KEY_RADIUS:Ljava/lang/String; = "radius"

.field public static final KEY_REQUEST_FOR_NOTIFICATION_PERMISSION:Ljava/lang/String; = "rfp"

.field public static final KEY_T:Ljava/lang/String; = "t"

.field public static final KEY_TAGS:Ljava/lang/String; = "tags"

.field public static final KEY_TDC:Ljava/lang/String; = "tdc"

.field public static final KEY_TEXT:Ljava/lang/String; = "text"

.field public static final KEY_TITLE:Ljava/lang/String; = "title"

.field public static final KEY_TLC:Ljava/lang/String; = "tlc"

.field public static final KEY_TRIGGERS_PER_INAPP:Ljava/lang/String; = "triggers_per_inapp"

.field public static final KEY_TYPE:Ljava/lang/String; = "type"

.field public static final KEY_URL:Ljava/lang/String; = "url"

.field public static final KEY_VALUE:Ljava/lang/String; = "value"

.field public static final KEY_WZRK_PARAMS:Ljava/lang/String; = "wzrkParams"

.field public static final KEY_WZRK_TTL:Ljava/lang/String; = "wzrk_ttl"

.field public static final LAST_SESSION_EPOCH:Ljava/lang/String; = "sexe"

.field public static final LEGACY_IDENTITY_KEYS:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIGHT_BLUE:Ljava/lang/String; = "#818ce5"

.field public static final LOCATION_PING_INTERVAL_IN_SECONDS:I = 0xa

.field public static final LOG_TAG_GEOFENCES:Ljava/lang/String; = "Geofences : "

.field public static final LOG_TAG_INAPP:Ljava/lang/String; = "InApp : "

.field public static final LOG_TAG_PRODUCT_CONFIG:Ljava/lang/String; = "Product Config : "

.field public static final LOG_TAG_SIGNED_CALL:Ljava/lang/String; = "SignedCall : "

.field public static final LOW_IMPORTANCE_FALLBACK_NOTIFICATION_CHANNEL_NAME:Ljava/lang/String; = "Silent Misc"

.field public static final MAX_KEY_LENGTH:I = 0x78

.field public static final MAX_VALUE_LENGTH:I = 0x200

.field public static final META_FRESH_APP_LAUNCH:Ljava/lang/String; = "fl"

.field public static final MULTI_USER_PREFIX:Ljava/lang/String; = "mt_"

.field public static final NETWORK_INFO:Ljava/lang/String; = "NetworkInfo"

.field public static final NOTIFICATION_CLICKED_EVENT_NAME:Ljava/lang/String; = "Notification Clicked"

.field public static final NOTIFICATION_ID_TAG:Ljava/lang/String; = "wzrk_id"

.field public static final NOTIFICATION_ID_TAG_INTERVAL:I = 0x1388

.field public static final NOTIFICATION_PERMISSION_REQUEST_CODE:I = 0x66

.field public static final NOTIFICATION_RENDER_FALLBACK:Ljava/lang/String; = "wzrk_fallback"

.field public static final NOTIFICATION_TAG:Ljava/lang/String; = "wzrk_pn"

.field public static final NOTIFICATION_VIEWED_EVENT_NAME:Ljava/lang/String; = "Notification Viewed"

.field public static final NOTIFICATION_VIEWED_ID_TAG_INTERVAL:I = 0x7d0

.field public static final NOTIF_HIDE_APP_LARGE_ICON:Ljava/lang/String; = "wzrk_hide_large_icon"

.field public static final NOTIF_ICON:Ljava/lang/String; = "ico"

.field public static final NOTIF_MSG:Ljava/lang/String; = "nm"

.field public static final NOTIF_PRIORITY:Ljava/lang/String; = "pr"

.field public static final NOTIF_TITLE:Ljava/lang/String; = "nt"

.field public static final NULL_STRING_ARRAY:[Ljava/lang/String;

.field public static final NV_EVENT:I = 0x6

.field public static final OMR_INVOKE_TIME_IN_MILLIS:Ljava/lang/String; = "omr_invoke_time_in_millis"

.field public static final ONE_DAY_IN_MILLIS:J = 0x5265c00L

.field public static final ONE_MIN_IN_MILLIS:J = 0xea60L

.field public static final PAGE_EVENT:I = 0x1

.field public static final PING_EVENT:I = 0x2

.field public static final PN_IMAGE_CONNECTION_TIMEOUT_IN_MILLIS:I = 0x3e8

.field public static final PN_IMAGE_DOWNLOAD_TIMEOUT_IN_MILLIS:J = 0x1388L

.field public static final PN_IMAGE_READ_TIMEOUT_IN_MILLIS:I = 0x1388

.field public static final PN_LARGE_ICON_DOWNLOAD_TIMEOUT_IN_MILLIS:J = 0x7d0L

.field public static final PREFS_EVALUATED_INAPP_KEY_SS:Ljava/lang/String; = "evaluated_ss"

.field public static final PREFS_INAPP_KEY_CS:Ljava/lang/String; = "inapp_notifs_cs"

.field public static final PREFS_INAPP_KEY_SS:Ljava/lang/String; = "inapp_notifs_ss"

.field public static final PREFS_SUPPRESSED_INAPP_KEY_CS:Ljava/lang/String; = "suppressed_ss"

.field public static final PRIMARY_DOMAIN:Ljava/lang/String; = "clevertap-prod.com"

.field public static final PRIORITY_HIGH:Ljava/lang/String; = "high"

.field public static final PRIORITY_MAX:Ljava/lang/String; = "max"

.field public static final PRIORITY_NORMAL:Ljava/lang/String; = "normal"

.field public static final PRIORITY_UNKNOWN:Ljava/lang/String; = "fcm_unknown"

.field public static final PROFILE:Ljava/lang/String; = "profile"

.field public static final PROFILE_EVENT:I = 0x3

.field public static final PT_NOTIF_ID:Ljava/lang/String; = "notificationId"

.field public static final PUSH_DIRECTORY_NAME:Ljava/lang/String; = "CleverTap.Push"

.field public static final RAISED:Ljava/lang/String; = "raised"

.field public static final RAISED_EVENT:I = 0x4

.field public static final REGION_EUROPE:Ljava/lang/String; = "eu1"

.field public static final REGION_INDIA:Ljava/lang/String; = "in1"

.field public static final REMOTE_CONFIG_FLAG_JSON_RESPONSE_KEY:Ljava/lang/String; = "pc_notifs"

.field public static final REQUEST_VARIABLES_JSON_RESPONSE_KEY:Ljava/lang/String; = "vars"

.field public static final REQUEST_VARIANTS_JSON_RESPONSE_KEY:Ljava/lang/String; = "abVariantInfo"

.field public static final SC_CAMPAIGN_OPT_OUT_EVENT_NAME:Ljava/lang/String; = "SCCampaignOptOut"

.field public static final SC_END_EVENT_NAME:Ljava/lang/String; = "SCEnd"

.field public static final SC_INCOMING_EVENT_NAME:Ljava/lang/String; = "SCIncoming"

.field public static final SC_OUTGOING_EVENT_NAME:Ljava/lang/String; = "SCOutgoing"

.field public static final SEPARATOR_COMMA:Ljava/lang/String; = ","

.field public static final SESSION_ID_LAST:Ljava/lang/String; = "lastSessionId"

.field public static final SESSION_LENGTH_MINS:I = 0x14

.field public static final SP_KEY_PROFILE_IDENTITIES:Ljava/lang/String; = "SP_KEY_PROFILE_IDENTITIES"

.field public static final SYSTEM_EVENTS:[Ljava/lang/String;

.field public static final TAG_FEATURE_IN_APPS:Ljava/lang/String; = "TAG_FEATURE_IN_APPS"

.field public static final TEST_IDENTIFIER:Ljava/lang/String; = "0_0"

.field public static final TYPE_EMAIL:Ljava/lang/String; = "Email"
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public static final TYPE_IDENTITY:Ljava/lang/String; = "Identity"
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public static final TYPE_PHONE:Ljava/lang/String; = "Phone"
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public static final URL_PARAM_DL_SEPARATOR:Ljava/lang/String; = "__dl__"

.field public static final USER_ATTRIBUTE_CHANGE:Ljava/lang/String; = "_CTUserAttributeChange"

.field public static final VIDEO_THUMBNAIL:Ljava/lang/String; = "ct_video_1"

.field public static final WHITE:Ljava/lang/String; = "#FFFFFF"

.field public static final WZRK_ACCT_ID_KEY:Ljava/lang/String; = "wzrk_acct_id"

.field public static final WZRK_ACTIONS:Ljava/lang/String; = "wzrk_acts"

.field public static final WZRK_BADGE_COUNT:Ljava/lang/String; = "wzrk_bc"

.field public static final WZRK_BADGE_ICON:Ljava/lang/String; = "wzrk_bi"

.field public static final WZRK_BIG_PICTURE:Ljava/lang/String; = "wzrk_bp"

.field public static final WZRK_BIG_PICTURE_ALT_TEXT_KEY:Ljava/lang/String; = "alt_text_wzrk_bp"

.field public static final WZRK_BPDS:Ljava/lang/String; = "wzrk_bpds"

.field public static final WZRK_BPDS_REASON:Ljava/lang/String; = "wzrk_bpdsr"

.field public static final WZRK_CHANNEL_ID:Ljava/lang/String; = "wzrk_cid"

.field public static final WZRK_COLLAPSE:Ljava/lang/String; = "wzrk_ck"

.field public static final WZRK_COLOR:Ljava/lang/String; = "wzrk_clr"

.field public static final WZRK_DEDUPE:Ljava/lang/String; = "wzrk_dd"

.field public static final WZRK_DISMISS:Ljava/lang/String; = "wzrk_dismiss"

.field public static final WZRK_FETCH:Ljava/lang/String; = "wzrk_fetch"

.field public static final WZRK_FROM:Ljava/lang/String; = "CTPushNotificationReceiver"

.field public static final WZRK_FROM_KEY:Ljava/lang/String; = "wzrk_from"

.field public static final WZRK_GIF:Ljava/lang/String; = "wzrk_gif"

.field public static final WZRK_MID:Ljava/lang/String; = "wzrk_mid"

.field public static final WZRK_MSG_SUMMARY:Ljava/lang/String; = "wzrk_nms"

.field public static final WZRK_PN_PRT:Ljava/lang/String; = "wzrk_pn_prt"

.field public static final WZRK_PREFIX:Ljava/lang/String; = "wzrk_"

.field public static final WZRK_PUSH_ID:Ljava/lang/String; = "wzrk_pid"

.field public static final WZRK_PUSH_SILENT:Ljava/lang/String; = "wzrk_pn_s"

.field public static final WZRK_RNV:Ljava/lang/String; = "wzrk_rnv"

.field public static final WZRK_SILENCE_IN_FOREGROUND:Ljava/lang/String; = "wzrk_sif"

.field public static final WZRK_SOUND:Ljava/lang/String; = "wzrk_sound"

.field public static final WZRK_STICKY:Ljava/lang/String; = "wzrk_sticky"

.field public static final WZRK_SUBTITLE:Ljava/lang/String; = "wzrk_st"

.field public static final WZRK_TIME_TO_LIVE:Ljava/lang/String; = "wzrk_ttl"

.field public static final WZRK_TIME_TO_LIVE_OFFSET:Ljava/lang/String; = "wzrk_ttl_offset"

.field public static final WZRK_TSR_FB:Ljava/lang/String; = "wzrk_tsr_fb"

.field public static final WZRK_URL_SCHEMA:Ljava/lang/String; = "wzrk://"

.field public static final piiDBKeys:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final variablePayloadType:Ljava/lang/String; = "varsPayload"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "Geocluster Entered"

    .line 2
    .line 3
    const-string v1, "Geocluster Exited"

    .line 4
    .line 5
    const-string v2, "Notification Clicked"

    .line 6
    .line 7
    const-string v3, "Notification Viewed"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/clevertap/android/sdk/Constants;->SYSTEM_EVENTS:[Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashSet;

    .line 16
    .line 17
    const-string v1, "Identity"

    .line 18
    .line 19
    const-string v2, "Email"

    .line 20
    .line 21
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-direct {v0, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/clevertap/android/sdk/Constants;->LEGACY_IDENTITY_KEYS:Ljava/util/HashSet;

    .line 33
    .line 34
    new-instance v0, Ljava/util/HashSet;

    .line 35
    .line 36
    const-string v3, "Phone"

    .line 37
    .line 38
    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-direct {v0, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/clevertap/android/sdk/Constants;->ALL_IDENTITY_KEYS:Ljava/util/HashSet;

    .line 50
    .line 51
    new-instance v0, Ljava/util/HashSet;

    .line 52
    .line 53
    const-string v4, "Name"

    .line 54
    .line 55
    filled-new-array {v4, v2, v1, v3}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 64
    .line 65
    .line 66
    sput-object v0, Lcom/clevertap/android/sdk/Constants;->piiDBKeys:Ljava/util/HashSet;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    new-array v0, v0, [Ljava/lang/String;

    .line 70
    .line 71
    sput-object v0, Lcom/clevertap/android/sdk/Constants;->NULL_STRING_ARRAY:[Ljava/lang/String;

    .line 72
    .line 73
    return-void
.end method
