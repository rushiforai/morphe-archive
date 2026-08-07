.class public Lcom/tencent/connect/common/Constants;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/connect/common/Constants$JumpUrlConstants;
    }
.end annotation


# static fields
.field public static final ACTIVITY_CANCEL:I = 0x0

.field public static final ACTIVITY_OK:I = -0x1

.field public static final APPID:Ljava/lang/String; = "appid"

.field public static final APP_NAME:Ljava/lang/String; = "app_name"

.field public static APP_SPECIFIC_ROOT:Ljava/lang/String; = null

.field public static final APP_VERSION_UNKNOWN:Ljava/lang/String; = "UNKNOWN"

.field public static final CANCEL_URI:Ljava/lang/String; = "auth://cancel"

.field public static final CLOSE_URI:Ljava/lang/String; = "auth://close"

.field public static final CODE_REQUEST_MAX:I = 0x1a00

.field public static final CODE_REQUEST_MIN:I = 0x1618

.field public static final DEFAULT_PF:Ljava/lang/String; = "openmobile_android"

.field public static final DEFAULT_UIN:Ljava/lang/String; = "1000"

.field public static final DOWNLOAD_URI:Ljava/lang/String; = "download://"

.field public static final ENC_UTF_8:Ljava/lang/String; = "UTF-8"

.field public static final ERROR_CONNECTTIMEOUT:I = -0x7

.field public static final ERROR_FILE_EXISTED:I = -0xb

.field public static final ERROR_HTTPSTATUS_ERROR:I = -0x9

.field public static final ERROR_IMAGE_TOO_LARGE:I = -0x10

.field public static final ERROR_IO:I = -0x2

.field public static final ERROR_JSON:I = -0x4

.field public static final ERROR_LOCATION_TIMEOUT:I = -0xd

.field public static final ERROR_LOCATION_VERIFY_FAILED:I = -0xe

.field public static final ERROR_NETWORK_UNAVAILABLE:I = -0xa

.field public static final ERROR_NO_AUTHORITY:I = -0x13

.field public static final ERROR_NO_SDCARD:I = -0xc

.field public static final ERROR_PARAM:I = -0x5

.field public static final ERROR_PROXY_LOGIN_AND_QQ_VERSION_LOWER:I = -0x12

.field public static final ERROR_QQVERSION_LOW:I = -0xf

.field public static final ERROR_QQ_NOT_INSTALL:I = -0x14

.field public static final ERROR_QQ_NOT_LOGIN:I = -0x15

.field public static final ERROR_SOCKETTIMEOUT:I = -0x8

.field public static final ERROR_UNKNOWN:I = -0x6

.field public static final ERROR_URL:I = -0x3

.field public static final FILE_PROVIDER_AUTHORITIES:Ljava/lang/String; = "com.tencent.tauth.fileprovider"

.field public static final FLAG_DEBUG:Z = true

.field public static final FORCE_ACCOUNT_EQUAL:Ljava/lang/String; = "force_account_equal"

.field public static final FOR_RESULT:Ljava/lang/String; = "for_result"

.field public static final FROM:Ljava/lang/String; = "from"

.field public static final FROM_OPEN_SDK:Ljava/lang/String; = "from_open_sdk"

.field public static final GUILD_AVATAR:Ljava/lang/String; = "guild_avatar"

.field public static final GUILD_ID:Ljava/lang/String; = "guild_id"

.field public static final GUILD_NAME:Ljava/lang/String; = "guild_name"

.field public static final GUILD_OPENID:Ljava/lang/String; = "guild_openid"

.field public static final HTTP_GET:Ljava/lang/String; = "GET"

.field public static final HTTP_POST:Ljava/lang/String; = "POST"

.field public static final IM_AIO:I = 0x0

.field public static final IM_AUDIO_CHAT:I = 0x1

.field public static final IM_VIDEO_CHAT:I = 0x2

.field public static final KEY_ACTION:Ljava/lang/String; = "key_action"

.field public static final KEY_ADD_LOGIN_ACCOUNT:Ljava/lang/String; = "key_add_login_account"

.field public static final KEY_APP_NAME:Ljava/lang/String; = "oauth_app_name"

.field public static KEY_ENABLE_SHOW_DOWNLOAD_URL:Ljava/lang/String; = null

.field public static final KEY_ERROR_CODE:Ljava/lang/String; = "key_error_code"

.field public static final KEY_ERROR_DETAIL:Ljava/lang/String; = "key_error_detail"

.field public static final KEY_ERROR_MSG:Ljava/lang/String; = "key_error_msg"

.field public static KEY_GUILD_TYPE:Ljava/lang/String; = null

.field public static KEY_GUILD_URL:Ljava/lang/String; = null

.field public static final KEY_PARAMS:Ljava/lang/String; = "key_params"

.field public static KEY_PASS_REPORT_VIA_PARAM:Ljava/lang/String; = null

.field public static KEY_PASS_REPORT_VIA_TIMELY:Ljava/lang/String; = null

.field public static final KEY_PPSTS:Ljava/lang/String; = "ppsts"

.field public static KEY_PROXY_APPID:Ljava/lang/String; = null

.field public static KEY_QRCODE:Ljava/lang/String; = null

.field public static final KEY_REQUEST_CODE:Ljava/lang/String; = "key_request_code"

.field public static final KEY_RESPONSE:Ljava/lang/String; = "key_response"

.field public static KEY_RESTORE_LANDSCAPE:Ljava/lang/String; = null

.field public static KEY_SCOPE:Ljava/lang/String; = null

.field public static final KEY_STAY:Ljava/lang/String; = "stay_back_stack"

.field public static final LOGIN_INFO:Ljava/lang/String; = "login_info"

.field public static final MOBILEQQ_PACKAGE_NAME:Ljava/lang/String; = "com.tencent.mobileqq"

.field public static final MSG_CONNECTTIMEOUT_ERROR:Ljava/lang/String; = "\u7f51\u7edc\u8fde\u63a5\u8d85\u65f6!"

.field public static final MSG_IMAGE_ERROR:Ljava/lang/String; = "\u56fe\u7247\u8bfb\u53d6\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u8be5\u56fe\u7247\u662f\u5426\u6709\u6548"

.field public static final MSG_IO_ERROR:Ljava/lang/String; = "\u7f51\u7edc\u8fde\u63a5\u5f02\u5e38\uff0c\u8bf7\u68c0\u67e5\u540e\u91cd\u8bd5!"

.field public static final MSG_JSON_ERROR:Ljava/lang/String; = "\u670d\u52a1\u5668\u8fd4\u56de\u6570\u636e\u683c\u5f0f\u6709\u8bef!"

.field public static final MSG_LOCATION_TIMEOUT_ERROR:Ljava/lang/String; = "\u5b9a\u4f4d\u8d85\u65f6\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\u6216\u68c0\u67e5\u7f51\u7edc\u72b6\u51b5\uff01"

.field public static final MSG_LOCATION_VERIFY_ERROR:Ljava/lang/String; = "\u5b9a\u4f4d\u5931\u8d25\uff0c\u9a8c\u8bc1\u5b9a\u4f4d\u7801\u9519\u8bef\uff01"

.field public static final MSG_LOGIN_NEEDED:Ljava/lang/String; = "\u8bf7\u5148\u4f7f\u7528\u624bQ\u767b\u5f55"

.field public static final MSG_NOT_CALL_ON_MAIN_THREAD:Ljava/lang/String; = "\u6ca1\u6709\u5728\u4e3b\u7ebf\u7a0b\u8c03\u7528\uff01"

.field public static final MSG_NO_SDCARD:Ljava/lang/String; = "\u68c0\u6d4b\u4e0d\u5230SD\u5361\uff0c\u65e0\u6cd5\u53d1\u9001\u8bed\u97f3\uff01"

.field public static final MSG_OPEN_BROWSER_ERROR:Ljava/lang/String; = "\u6253\u5f00\u6d4f\u89c8\u5668\u5931\u8d25!"

.field public static final MSG_PARAM_APPSHARE_TOO_LOW:Ljava/lang/String; = "\u624bQ\u7248\u672c\u8fc7\u4f4e\uff0c\u5e94\u7528\u5206\u4eab\u53ea\u652f\u6301\u624bQ5.0\u53ca\u5176\u4ee5\u4e0a\u7248\u672c"

.field public static final MSG_PARAM_ERROR:Ljava/lang/String; = "\u4f20\u5165\u53c2\u6570\u6709\u8bef!"

.field public static final MSG_PARAM_IMAGE_ERROR:Ljava/lang/String; = "\u7eaf\u56fe\u5206\u4eab\uff0cimageUrl \u4e0d\u80fd\u4e3a\u7a7a"

.field public static final MSG_PARAM_IMAGE_URL_FORMAT_ERROR:Ljava/lang/String; = "\u975e\u6cd5\u7684\u56fe\u7247\u5730\u5740!"

.field public static final MSG_PARAM_IMAGE_URL_MUST_BE_LOCAL:Ljava/lang/String; = "\u624bQ\u7248\u672c\u8fc7\u4f4e\uff0c\u7eaf\u56fe\u5206\u4eab\u4e0d\u652f\u6301\u7f51\u8def\u56fe\u7247"

.field public static final MSG_PARAM_NULL_ERROR:Ljava/lang/String; = "\u4f20\u5165\u53c2\u6570\u4e0d\u53ef\u4ee5\u4e3a\u7a7a"

.field public static final MSG_PARAM_QQ_VERSION_ERROR:Ljava/lang/String; = "\u4f4e\u7248\u672c\u624bQ\u4e0d\u652f\u6301\u8be5\u9879\u529f\u80fd!"

.field public static final MSG_PARAM_TARGETURL_ERROR:Ljava/lang/String; = "targetUrl\u6709\u8bef"

.field public static final MSG_PARAM_TARGETURL_NULL_ERROR:Ljava/lang/String; = "targetUrl\u4e3a\u5fc5\u586b\u9879\uff0c\u8bf7\u8865\u5145\u540e\u5206\u4eab"

.field public static final MSG_PARAM_TITLE_NULL_ERROR:Ljava/lang/String; = "title\u4e0d\u80fd\u4e3a\u7a7a!"

.field public static final MSG_PARAM_VERSION_TOO_LOW:Ljava/lang/String; = "\u624bQ\u7248\u672c\u8fc7\u4f4e\uff0c\u8bf7\u4e0b\u8f7d\u5b89\u88c5\u6700\u65b0\u7248\u624bQ"

.field public static final MSG_PERMISSION_NOT_GRANTED:Ljava/lang/String; = "\u7528\u6237\u672a\u6388\u6743\uff0c\u6682\u65f6\u65e0\u6cd5\u4f7f\u7528QQ\u767b\u5f55\u53ca\u5206\u4eab\u7b49\u529f\u80fd"

.field public static final MSG_PERSISTENCE_FAIL:Ljava/lang/String; = "\u6301\u4e45\u5316\u5931\u8d25!"

.field public static final MSG_PROXY_LOGIN_QQ_VERSION_LOWER:Ljava/lang/String; = "\u624bQ\u7248\u672c\u592a\u4f4e\uff0c\u4e0d\u652f\u6301\u59d4\u6258\u767b\u5f55!"

.field public static final MSG_PUBLISH_VIDEO_ERROR:Ljava/lang/String; = "\u8bf7\u9009\u62e9\u6709\u6548\u7684\u89c6\u9891\u6587\u4ef6"

.field public static final MSG_SHARE_GETIMG_ERROR:Ljava/lang/String; = "\u83b7\u53d6\u5206\u4eab\u56fe\u7247\u5931\u8d25!"

.field public static final MSG_SHARE_IMAGE_TOO_LARGE_ERROR:Ljava/lang/String; = "\u56fe\u7247\u592a\u5927\uff0c\u8bf7\u538b\u7f29\u52305M\u5185\u518d\u5206\u4eab!"

.field public static final MSG_SHARE_NOSD_ERROR:Ljava/lang/String; = "\u5206\u4eab\u56fe\u7247\u5931\u8d25\uff0c\u68c0\u6d4b\u4e0d\u5230SD\u5361!"

.field public static final MSG_SHARE_TO_QQ_ERROR:Ljava/lang/String; = "\u5206\u4eab\u7684\u624b\u673aQQ\u5931\u8d25!"

.field public static final MSG_SHARE_TYPE_ERROR:Ljava/lang/String; = "\u8bf7\u9009\u62e9\u652f\u6301\u7684\u5206\u4eab\u7c7b\u578b"

.field public static final MSG_SOCKETTIMEOUT_ERROR:Ljava/lang/String; = "\u7f51\u7edc\u8fde\u63a5\u8d85\u65f6!"

.field public static final MSG_UNKNOWN_ERROR:Ljava/lang/String; = "\u672a\u77e5\u9519\u8bef!"

.field public static final MSG_URL_ERROR:Ljava/lang/String; = "\u8bbf\u95eeurl\u6709\u8bef!"

.field public static final NONCE:Ljava/lang/String; = "nonce"

.field public static final OPENID:Ljava/lang/String; = "openid"

.field public static final PACKAGE_ID:Ljava/lang/String; = "package_id"

.field public static final PACKAGE_QIM:Ljava/lang/String; = "com.tencent.qim"

.field public static final PACKAGE_QQ:Ljava/lang/String; = "com.tencent.mobileqq"

.field public static final PACKAGE_QQ_PAD:Ljava/lang/String; = "com.tencent.minihd.qq"

.field public static final PACKAGE_QQ_SPEED:Ljava/lang/String; = "com.tencent.qqlite"

.field public static final PACKAGE_QZONE:Ljava/lang/String; = "com.qzone"

.field public static final PACKAGE_TIM:Ljava/lang/String; = "com.tencent.tim"

.field public static final PARAM_ACCESS_TOKEN:Ljava/lang/String; = "access_token"

.field public static final PARAM_APP_ID:Ljava/lang/String; = "appid"

.field public static final PARAM_APP_NAME:Ljava/lang/String; = "app_name"

.field public static final PARAM_APP_VER:Ljava/lang/String; = "app_ver"

.field public static final PARAM_AVATAR_URI:Ljava/lang/String; = "picture"

.field public static final PARAM_CLIENT_ID:Ljava/lang/String; = "client_id"

.field public static final PARAM_CONSUMER_KEY:Ljava/lang/String; = "oauth_consumer_key"

.field public static final PARAM_EXPIRES_IN:Ljava/lang/String; = "expires_in"

.field public static final PARAM_EXPIRES_TIME:Ljava/lang/String; = "expires_time"

.field public static final PARAM_EXT_DATA:Ljava/lang/String; = "opensdk_ext_data"

.field public static final PARAM_HOPEN_ID:Ljava/lang/String; = "hopenid"

.field public static final PARAM_KEY_STR:Ljava/lang/String; = "keystr"

.field public static final PARAM_KEY_TYPE:Ljava/lang/String; = "keytype"

.field public static final PARAM_MN:Ljava/lang/String; = "mn"

.field public static final PARAM_OPEN_ID:Ljava/lang/String; = "openid"

.field public static final PARAM_PKG_NAME:Ljava/lang/String; = "pkg_name"

.field public static final PARAM_PLATFORM:Ljava/lang/String; = "platform"

.field public static final PARAM_PLATFORM_ID:Ljava/lang/String; = "pf"

.field public static final PARAM_QQ_VER:Ljava/lang/String; = "qq_ver"

.field public static final PARAM_SCOPE:Ljava/lang/String; = "scope"

.field public static final PARAM_SDK_VER:Ljava/lang/String; = "sdk_ver"

.field public static final PARAM_SRC_ID:Ljava/lang/String; = "src_id"

.field public static final PLATID:Ljava/lang/String; = "platid"

.field public static final PREFERENCE_PF:Ljava/lang/String; = "pfStore"

.field public static final QQ_APPID:Ljava/lang/String; = "100686848"

.field public static QQ_SHARE_TEMP_DIR:Ljava/lang/String; = null

.field public static final REQUEST_API:I = 0x2774

.field public static final REQUEST_APPBAR:I = 0x2776

.field public static final REQUEST_AVATER:I = 0x2b5e

.field public static final REQUEST_BIND_GROUP:I = 0x2780

.field public static final REQUEST_COMMON_CHANNEL:I = 0x2782

.field public static final REQUEST_EDIT_AVATAR:I = 0x277c

.field public static final REQUEST_EDIT_DYNAMIC_AVATAR:I = 0x277e

.field public static final REQUEST_EDIT_EMOTION:I = 0x277d

.field public static final REQUEST_GUILD:I = 0x2781

.field public static final REQUEST_JOIN_GROUP:I = 0x277f

.field public static final REQUEST_LOGIN:I = 0x2b5d

.field public static final REQUEST_OLD_QZSHARE:I = 0x2b60

.field public static final REQUEST_OLD_SHARE:I = 0x2b5f

.field public static final REQUEST_QQ_FAVORITES:I = 0x2779

.field public static final REQUEST_QQ_SHARE:I = 0x2777

.field public static final REQUEST_QZONE_SHARE:I = 0x2778

.field public static final REQUEST_SEND_TO_MY_COMPUTER:I = 0x277a

.field public static final REQUEST_SHARE_TO_TROOP_BAR:I = 0x277b

.field public static final REQUEST_SOCIAL_API:I = 0x2b61

.field public static final REQUEST_SOCIAL_H5:I = 0x2b62

.field public static final SDK_QUA:Ljava/lang/String; = "V1_AND_OpenSDK_3.5.16.lite_1077_RDM_B"

.field public static final SDK_VERSION:Ljava/lang/String; = "3.5.16.lite"

.field public static final SDK_VERSION_REPORT:Ljava/lang/String; = "OpenSdk_3.5.16.lite"

.field public static final SHARE_QQ_AND_STAY:Ljava/lang/String; = "com.tencent.tauth.opensdk.SHARE_SUCCESS_AND_STAY_QQ_"

.field public static final SIGNATRUE_QZONE:Ljava/lang/String; = "ec96e9ac1149251acbb1b0c5777cae95"

.field public static final SOURCE_QQ:Ljava/lang/String; = "QQ"

.field public static final SOURCE_QZONE:Ljava/lang/String; = "qzone"

.field public static final SPECIFY_UIN:Ljava/lang/String; = "specify_uin"

.field public static final STR_EMPTY:Ljava/lang/String; = ""

.field public static final TS:Ljava/lang/String; = "ts"

.field public static final UI_ACTIVITY:I = 0x1

.field public static final UI_CHECK_TOKEN:I = 0x3

.field public static final UI_DIALOG:I = 0x2

.field public static final UI_DOWNLOAD_QQ:I = 0x4

.field public static final UI_NONE:I = -0x1

.field public static final UI_PROXY_LOGIN_AND_NO_QQ:I = 0x5

.field public static VALUE_GUILD_CREATE:Ljava/lang/String; = null

.field public static VALUE_GUILD_JOIN:Ljava/lang/String; = null

.field public static final VIA_ACT_TYPE_EIGHTEEN:Ljava/lang/String; = "18"

.field public static final VIA_ACT_TYPE_FIVE:Ljava/lang/String; = "5"

.field public static final VIA_ACT_TYPE_NINETEEN:Ljava/lang/String; = "19"

.field public static final VIA_ACT_TYPE_SEVEN:Ljava/lang/String; = "7"

.field public static final VIA_ACT_TYPE_THREE:Ljava/lang/String; = "3"

.field public static final VIA_ACT_TYPE_TWENTY_EIGHT:Ljava/lang/String; = "28"

.field public static final VIA_BIND_GROUP:Ljava/lang/String; = "ANDROIDSDK.BINDGROUP.XX"

.field public static final VIA_CALL_SOURCE_H5:Ljava/lang/String; = "2"

.field public static final VIA_CALL_SOURCE_SQ:Ljava/lang/String; = "1"

.field public static final VIA_JOIN_GROUP:Ljava/lang/String; = "ANDROIDQQ.JOININGROUP.XX"

.field public static final VIA_MAKE_FRIEND:Ljava/lang/String; = "ANDROIDQQ.MAKEAFRIEND.XX"

.field public static final VIA_NO_VALUE:Ljava/lang/String; = "0"

.field public static final VIA_REPORT_TYPE_BIND_GROUP:Ljava/lang/String; = "18"

.field public static final VIA_REPORT_TYPE_CHAT_AIO:Ljava/lang/String; = "24"

.field public static final VIA_REPORT_TYPE_CHAT_AUDIO:Ljava/lang/String; = "25"

.field public static final VIA_REPORT_TYPE_CHAT_VIDEO:Ljava/lang/String; = "26"

.field public static final VIA_REPORT_TYPE_DATALINE:Ljava/lang/String; = "22"

.field public static final VIA_REPORT_TYPE_JOININ_GROUP:Ljava/lang/String; = "13"

.field public static final VIA_REPORT_TYPE_MAKE_FRIEND:Ljava/lang/String; = "14"

.field public static final VIA_REPORT_TYPE_QQFAVORITES:Ljava/lang/String; = "21"

.field public static final VIA_REPORT_TYPE_SET_AVATAR:Ljava/lang/String; = "12"

.field public static final VIA_REPORT_TYPE_SHARE_TO_QQ:Ljava/lang/String; = "10"

.field public static final VIA_REPORT_TYPE_SHARE_TO_QZONE:Ljava/lang/String; = "11"

.field public static final VIA_REPORT_TYPE_SHARE_TO_TROOPBAR:Ljava/lang/String; = "23"

.field public static final VIA_REPORT_TYPE_SSO_LOGIN:Ljava/lang/String; = "1"

.field public static final VIA_REPORT_TYPE_START_GROUP:Ljava/lang/String; = "17"

.field public static final VIA_REPORT_TYPE_START_WAP:Ljava/lang/String; = "16"

.field public static final VIA_REPORT_TYPE_WPA_STATE:Ljava/lang/String; = "15"

.field public static final VIA_RESULT_FAIL:Ljava/lang/String; = "1"

.field public static final VIA_RESULT_SUCCESS:Ljava/lang/String; = "0"

.field public static final VIA_SDK:Ljava/lang/String; = "2"

.field public static final VIA_SET_AVATAR:Ljava/lang/String; = "ANDROIDSDK.SETAVATAR.XX"

.field public static final VIA_SET_AVATAR_SUCCEED:Ljava/lang/String; = "ANDROIDSDK.SETAVATAR.SUCCEED"

.field public static final VIA_SHARE_TO_QQ:Ljava/lang/String; = "ANDROIDQQ.SHARETOQQ.XX"

.field public static final VIA_SHARE_TO_QZONE:Ljava/lang/String; = "ANDROIDQQ.SHARETOQZ.XX"

.field public static final VIA_SHARE_TO_TROOPBAR:Ljava/lang/String; = "ANDROIDSDK.SHARETOTROOPBAR.XX"

.field public static final VIA_SHARE_TYPE_IMAGE:Ljava/lang/String; = "2"

.field public static final VIA_SHARE_TYPE_IMAGE_TEXT:Ljava/lang/String; = "1"

.field public static final VIA_SHARE_TYPE_INFO:Ljava/lang/String; = "6"

.field public static final VIA_SHARE_TYPE_MINI_PROGRAM:Ljava/lang/String; = "9"

.field public static final VIA_SHARE_TYPE_MUSIC:Ljava/lang/String; = "3"

.field public static final VIA_SHARE_TYPE_PUBLISHMOOD:Ljava/lang/String; = "7"

.field public static final VIA_SHARE_TYPE_PUBLISHVIDEO:Ljava/lang/String; = "8"

.field public static final VIA_SHARE_TYPE_TEXT:Ljava/lang/String; = "5"

.field public static final VIA_SSO_LOGIN:Ljava/lang/String; = "2"

.field public static final VIA_START_IM:Ljava/lang/String; = "ANDROIDSDK.STARTIM.XX"

.field public static final VIA_START_WAP:Ljava/lang/String; = "ANDROIDSDK.STARTWPA.XX"

.field public static final VIA_TO_TYPE_QQ_DISCUSS_GROUP:Ljava/lang/String; = "3"

.field public static final VIA_TO_TYPE_QQ_FRIEND:Ljava/lang/String; = "1"

.field public static final VIA_TO_TYPE_QQ_GROUP:Ljava/lang/String; = "1"

.field public static final VIA_TO_TYPE_QZONE:Ljava/lang/String; = "4"

.field public static final VIA_WAP_STATE:Ljava/lang/String; = "ANDROIDSDK.WPASTATE.XX"

.field public static final ZONE_ID:Ljava/lang/String; = "zone_id"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "tencent"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "mobileqq"

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "opensdk"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/tencent/connect/common/Constants;->APP_SPECIFIC_ROOT:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "tmp"

    .line 33
    .line 34
    sput-object v0, Lcom/tencent/connect/common/Constants;->QQ_SHARE_TEMP_DIR:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "key_restore_landscape"

    .line 37
    .line 38
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_RESTORE_LANDSCAPE:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "key_scope"

    .line 41
    .line 42
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_SCOPE:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "key_qrcode"

    .line 45
    .line 46
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_QRCODE:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "key_enable_show_download_url"

    .line 49
    .line 50
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_ENABLE_SHOW_DOWNLOAD_URL:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "key_proxy_appid"

    .line 53
    .line 54
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_PROXY_APPID:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "key_pass_report_via_param"

    .line 57
    .line 58
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_PASS_REPORT_VIA_PARAM:Ljava/lang/String;

    .line 59
    .line 60
    const-string v0, "key_pass_report_via_timely"

    .line 61
    .line 62
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_PASS_REPORT_VIA_TIMELY:Ljava/lang/String;

    .line 63
    .line 64
    const-string v0, "guild_type"

    .line 65
    .line 66
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_GUILD_TYPE:Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "guild_url"

    .line 69
    .line 70
    sput-object v0, Lcom/tencent/connect/common/Constants;->KEY_GUILD_URL:Ljava/lang/String;

    .line 71
    .line 72
    const-string v0, "create"

    .line 73
    .line 74
    sput-object v0, Lcom/tencent/connect/common/Constants;->VALUE_GUILD_CREATE:Ljava/lang/String;

    .line 75
    .line 76
    const-string v0, "join"

    .line 77
    .line 78
    sput-object v0, Lcom/tencent/connect/common/Constants;->VALUE_GUILD_JOIN:Ljava/lang/String;

    .line 79
    .line 80
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
