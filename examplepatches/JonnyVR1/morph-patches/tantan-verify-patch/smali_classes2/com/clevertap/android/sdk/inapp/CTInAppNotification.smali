.class public final Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;,
        Lcom/clevertap/android/sdk/inapp/CTInAppNotification$c;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\t\n\u0002\u0008&\n\u0002\u0010\u0006\n\u0002\u0008\u000e\n\u0002\u0010\u000c\n\u0002\u0008\u000f\n\u0002\u0010 \n\u0002\u0008\u0007\u0018\u0000 \u009b\u00012\u00020\u0001:\u0001\u0010B\u0019\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007B\u0011\u0008\u0012\u0012\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0006\u0010\nJ\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0003\u001a\u00020\u0002H\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u0003\u001a\u00020\u0002H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\rJ-\u0010\u0015\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000f2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u00112\n\u0010\u0014\u001a\u0006\u0012\u0002\u0008\u00030\u0013H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0017\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u0017\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u001f\u0010\u001f\u001a\u00020\u000b2\u0006\u0010\u001d\u001a\u00020\u00082\u0006\u0010\u001e\u001a\u00020\u001aH\u0016\u00a2\u0006\u0004\u0008\u001f\u0010 J\u0019\u0010#\u001a\u0004\u0018\u00010\"2\u0006\u0010!\u001a\u00020\u001aH\u0000\u00a2\u0006\u0004\u0008#\u0010$J\u001b\u0010\u0010\u001a\u0004\u0018\u00010\u00002\u0008\u0010&\u001a\u0004\u0018\u00010%H\u0000\u00a2\u0006\u0004\u0008\u0010\u0010\'J\u0019\u0010)\u001a\u00020\u000b2\u0008\u0010(\u001a\u0004\u0018\u00010%H\u0000\u00a2\u0006\u0004\u0008)\u0010*R(\u0010,\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008,\u0010-\u001a\u0004\u0008.\u0010/R(\u00100\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u00080\u0010-\u001a\u0004\u00081\u0010/R(\u00103\u001a\u0004\u0018\u0001022\u0008\u0010+\u001a\u0004\u0018\u0001028\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u00083\u00104\u001a\u0004\u00085\u00106R$\u00107\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u00087\u00108\u001a\u0004\u00089\u0010:R\u0018\u0010;\u001a\u0004\u0018\u00010\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008;\u0010<R\u0016\u0010=\u001a\u00020\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008=\u0010<R(\u0010>\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008>\u0010-\u001a\u0004\u0008?\u0010/R$\u0010@\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008@\u0010A\u001a\u0004\u0008B\u0010\u001cR\u001c\u0010E\u001a\u0008\u0012\u0004\u0012\u00020D0C8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008E\u0010FR$\u0010G\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008G\u00108\u001a\u0004\u0008H\u0010:R$\u0010I\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008I\u00108\u001a\u0004\u0008J\u0010:R(\u0010K\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008K\u0010-\u001a\u0004\u0008L\u0010/R(\u0010M\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008M\u0010-\u001a\u0004\u0008N\u0010/R$\u0010P\u001a\u00020O2\u0006\u0010+\u001a\u00020O8\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008P\u00109\u001a\u0004\u0008Q\u0010RR$\u0010S\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008S\u0010A\u001a\u0004\u0008T\u0010\u001cR$\u0010U\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008U\u0010A\u001a\u0004\u0008V\u0010\u001cR$\u0010W\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008W\u00108\u001a\u0004\u0008X\u0010:R$\u0010Y\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008Y\u00108\u001a\u0004\u0008Z\u0010:R$\u0010[\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008[\u00108\u001a\u0004\u0008\\\u0010:R(\u0010]\u001a\u0004\u0018\u00010%2\u0008\u0010+\u001a\u0004\u0018\u00010%8\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008]\u0010^\u001a\u0004\u0008_\u0010`R(\u0010a\u001a\u0004\u0018\u00010\u00022\u0008\u0010+\u001a\u0004\u0018\u00010\u00028\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008a\u0010<\u001a\u0004\u0008b\u0010cR(\u0010\u0014\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010-\u001a\u0004\u0008d\u0010/R$\u0010e\u001a\u00020\u00112\u0006\u0010+\u001a\u00020\u00118\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008e\u0010-\u001a\u0004\u0008f\u0010/R$\u0010g\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008g\u0010A\u001a\u0004\u0008h\u0010\u001cR(\u0010i\u001a\u0004\u0018\u00010\u00022\u0008\u0010+\u001a\u0004\u0018\u00010\u00028\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008i\u0010<\u001a\u0004\u0008j\u0010cR(\u0010k\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008k\u0010-\u001a\u0004\u0008l\u0010/R$\u0010m\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008m\u00108\u001a\u0004\u0008A\u0010:R$\u0010n\u001a\u0004\u0018\u00010\u00118\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0012\n\u0004\u0008n\u0010-\u001a\u0004\u0008o\u0010/\"\u0004\u0008p\u0010qR$\u0010r\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008r\u0010A\u001a\u0004\u0008s\u0010\u001cR$\u0010t\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008t\u0010A\u001a\u0004\u0008u\u0010\u001cR$\u0010w\u001a\u00020v2\u0006\u0010+\u001a\u00020v8\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008w\u0010T\u001a\u0004\u0008x\u0010yR$\u0010z\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008z\u00108\u001a\u0004\u0008{\u0010:R(\u0010|\u001a\u0004\u0018\u00010\u00112\u0008\u0010+\u001a\u0004\u0018\u00010\u00118\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008|\u0010-\u001a\u0004\u0008}\u0010/R$\u0010~\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0000@BX\u0080\u000e\u00a2\u0006\u000c\n\u0004\u0008~\u00108\u001a\u0004\u0008\u007f\u0010:R\'\u0010\u0080\u0001\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0000@BX\u0080\u000e\u00a2\u0006\u000e\n\u0005\u0008\u0080\u0001\u00108\u001a\u0005\u0008\u0081\u0001\u0010:R\u001e\u0010\u0082\u0001\u001a\u0008\u0012\u0004\u0012\u00020\"0C8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0082\u0001\u0010FR\'\u0010\u0083\u0001\u001a\u00020\u00112\u0006\u0010+\u001a\u00020\u00118\u0000@BX\u0080\u000e\u00a2\u0006\u000e\n\u0005\u0008\u0083\u0001\u0010-\u001a\u0005\u0008\u0084\u0001\u0010/R+\u0010\u0086\u0001\u001a\u00030\u0085\u00012\u0007\u0010+\u001a\u00030\u0085\u00018\u0000@BX\u0080\u000e\u00a2\u0006\u0010\n\u0006\u0008\u0086\u0001\u0010\u0087\u0001\u001a\u0006\u0008\u0088\u0001\u0010\u0089\u0001R\'\u0010\u008a\u0001\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0000@BX\u0080\u000e\u00a2\u0006\u000e\n\u0005\u0008\u008a\u0001\u00108\u001a\u0005\u0008\u008b\u0001\u0010:R\'\u0010\u008c\u0001\u001a\u00020\u00112\u0006\u0010+\u001a\u00020\u00118\u0000@BX\u0080\u000e\u00a2\u0006\u000e\n\u0005\u0008\u008c\u0001\u0010-\u001a\u0005\u0008\u0087\u0001\u0010/R\'\u0010\u008d\u0001\u001a\u00020\u00042\u0006\u0010+\u001a\u00020\u00048\u0000@BX\u0080\u000e\u00a2\u0006\u000e\n\u0005\u0008\u008d\u0001\u00108\u001a\u0005\u0008\u008e\u0001\u0010:R\'\u0010\u008f\u0001\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0000@BX\u0080\u000e\u00a2\u0006\u000e\n\u0005\u0008\u008f\u0001\u0010A\u001a\u0005\u0008\u0090\u0001\u0010\u001cR\'\u0010\u0091\u0001\u001a\u00020\u001a2\u0006\u0010+\u001a\u00020\u001a8\u0000@BX\u0080\u000e\u00a2\u0006\u000e\n\u0005\u0008\u0091\u0001\u0010A\u001a\u0005\u0008\u0092\u0001\u0010\u001cR\u0013\u0010\u0094\u0001\u001a\u00020\u00028F\u00a2\u0006\u0007\u001a\u0005\u0008\u0093\u0001\u0010cR\u001b\u0010\u0098\u0001\u001a\t\u0012\u0004\u0012\u00020D0\u0095\u00018F\u00a2\u0006\u0008\u001a\u0006\u0008\u0096\u0001\u0010\u0097\u0001R\u001e\u0010\u009a\u0001\u001a\t\u0012\u0004\u0012\u00020\"0\u0095\u00018@X\u0080\u0004\u00a2\u0006\u0008\u001a\u0006\u0008\u0099\u0001\u0010\u0097\u0001\u00a8\u0006\u009c\u0001"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
        "Landroid/os/Parcelable;",
        "Lorg/json/JSONObject;",
        "jsonObject",
        "",
        "videoSupported",
        "<init>",
        "(Lorg/json/JSONObject;Z)V",
        "Landroid/os/Parcel;",
        "parcel",
        "(Landroid/os/Parcel;)V",
        "",
        "a",
        "(Lorg/json/JSONObject;)V",
        "U",
        "Landroid/os/Bundle;",
        "b",
        "",
        "key",
        "Lkotlin/reflect/KClass;",
        "type",
        "M",
        "(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z",
        "notif",
        "X",
        "(Landroid/os/Bundle;)Z",
        "",
        "describeContents",
        "()I",
        "dest",
        "flags",
        "writeToParcel",
        "(Landroid/os/Parcel;I)V",
        "orientation",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
        "q",
        "(I)Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
        "Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;",
        "actionData",
        "(Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
        "inAppData",
        "V",
        "(Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)V",
        "value",
        "id",
        "Ljava/lang/String;",
        "p",
        "()Ljava/lang/String;",
        "campaignId",
        "g",
        "Lcom/clevertap/android/sdk/inapp/CTInAppType;",
        "inAppType",
        "Lcom/clevertap/android/sdk/inapp/CTInAppType;",
        "r",
        "()Lcom/clevertap/android/sdk/inapp/CTInAppType;",
        "isExcludeFromCaps",
        "Z",
        "J",
        "()Z",
        "_actionExtras",
        "Lorg/json/JSONObject;",
        "_jsonDescription",
        "landscapeImageUrl",
        "getLandscapeImageUrl",
        "maxPerSession",
        "I",
        "t",
        "Ljava/util/ArrayList;",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;",
        "_buttons",
        "Ljava/util/ArrayList;",
        "isLandscape",
        "O",
        "isPortrait",
        "Q",
        "title",
        "B",
        "message",
        "w",
        "",
        "timeToLive",
        "A",
        "()J",
        "totalDailyCount",
        "D",
        "totalLifetimeCount",
        "E",
        "isLocalInApp",
        "P",
        "fallBackToNotificationSettings",
        "l",
        "isRequestForPushPermission",
        "R",
        "customTemplateData",
        "Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;",
        "i",
        "()Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;",
        "pipConfigJson",
        "y",
        "()Lorg/json/JSONObject;",
        "F",
        "backgroundColor",
        "d",
        "buttonCount",
        "e",
        "customExtras",
        "getCustomExtras$clevertap_core_release",
        "customInAppUrl",
        "h",
        "isDarkenScreen",
        "error",
        "k",
        "W",
        "(Ljava/lang/String;)V",
        "height",
        "m",
        "heightPercentage",
        "n",
        "",
        "aspectRatio",
        "c",
        "()D",
        "isHideCloseButton",
        "K",
        "html",
        "o",
        "isTablet",
        "T",
        "isJsEnabled",
        "L",
        "_mediaList",
        "messageColor",
        "x",
        "",
        "position",
        "C",
        "z",
        "()C",
        "isShowClose",
        "S",
        "titleColor",
        "isVideoSupported",
        "isVideoSupported$clevertap_core_release",
        "width",
        "G",
        "widthPercentage",
        "H",
        "s",
        "jsonDescription",
        "",
        "f",
        "()Ljava/util/List;",
        "buttons",
        "u",
        "mediaList",
        "Companion",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
            ">;"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final Companion:Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final EMPTY_JSON:Ljava/lang/String; = "{}"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final HTML_DEFAULT_ASPECT_RATIO:D = -1.0


# instance fields
.field private _actionExtras:Lorg/json/JSONObject;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private _buttons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private _jsonDescription:Lorg/json/JSONObject;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private _mediaList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private aspectRatio:D

.field private backgroundColor:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private buttonCount:I

.field private campaignId:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private customExtras:Lorg/json/JSONObject;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private customInAppUrl:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private customTemplateData:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private error:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private fallBackToNotificationSettings:Z

.field private height:I

.field private heightPercentage:I

.field private html:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private id:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private isDarkenScreen:Z

.field private isExcludeFromCaps:Z

.field private isHideCloseButton:Z

.field private isJsEnabled:Z

.field private isLandscape:Z

.field private isLocalInApp:Z

.field private isPortrait:Z

.field private isRequestForPushPermission:Z

.field private isShowClose:Z

.field private isTablet:Z

.field private isVideoSupported:Z

.field private landscapeImageUrl:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private maxPerSession:I

.field private message:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private messageColor:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private pipConfigJson:Lorg/json/JSONObject;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private position:C

.field private timeToLive:J

.field private title:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private titleColor:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private totalDailyCount:I

.field private totalLifetimeCount:I

.field private type:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private width:I

.field private widthPercentage:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->Companion:Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;

    .line 8
    .line 9
    new-instance v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$a;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$a;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_buttons:Ljava/util/ArrayList;

    .line 10
    .line 11
    const-string v0, "#FFFFFF"

    .line 12
    .line 13
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    .line 14
    .line 15
    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    .line 16
    .line 17
    iput-wide v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 18
    .line 19
    new-instance v1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 25
    .line 26
    const-string v1, "#000000"

    .line 27
    .line 28
    iput-object v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->campaignId:Ljava/lang/String;

    .line 43
    .line 44
    const-class v2, Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    instance-of v3, v2, Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    if-eqz v3, :cond_0

    .line 58
    .line 59
    check-cast v2, Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move-object v2, v4

    .line 63
    :goto_0
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->html:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    const/4 v3, 0x0

    .line 76
    const/4 v5, 0x1

    .line 77
    if-eqz v2, :cond_1

    .line 78
    .line 79
    move v2, v5

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    move v2, v3

    .line 82
    :goto_1
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isExcludeFromCaps:Z

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_2

    .line 89
    .line 90
    move v2, v5

    .line 91
    goto :goto_2

    .line 92
    :cond_2
    move v2, v3

    .line 93
    :goto_2
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isShowClose:Z

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_3

    .line 100
    .line 101
    move v2, v5

    .line 102
    goto :goto_3

    .line 103
    :cond_3
    move v2, v3

    .line 104
    :goto_3
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isDarkenScreen:Z

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->maxPerSession:I

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalLifetimeCount:I

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalDailyCount:I

    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    int-to-char v2, v2

    .line 129
    iput-char v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->position:C

    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->height:I

    .line 136
    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 142
    .line 143
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->width:I

    .line 148
    .line 149
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->widthPercentage:I

    .line 154
    .line 155
    new-instance v2, Lorg/json/JSONObject;

    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    const-string v7, "{}"

    .line 162
    .line 163
    if-nez v6, :cond_4

    .line 164
    .line 165
    move-object v6, v7

    .line 166
    :cond_4
    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 170
    .line 171
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    if-nez v2, :cond_5

    .line 182
    .line 183
    move-object v2, v4

    .line 184
    goto :goto_4

    .line 185
    :cond_5
    new-instance v2, Lorg/json/JSONObject;

    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v6

    .line 191
    if-nez v6, :cond_6

    .line 192
    .line 193
    move-object v6, v7

    .line 194
    :cond_6
    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :goto_4
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customExtras:Lorg/json/JSONObject;

    .line 198
    .line 199
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-nez v2, :cond_7

    .line 204
    .line 205
    goto :goto_6

    .line 206
    :cond_7
    new-instance v4, Lorg/json/JSONObject;

    .line 207
    .line 208
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    if-nez v2, :cond_8

    .line 213
    .line 214
    goto :goto_5

    .line 215
    :cond_8
    move-object v7, v2

    .line 216
    :goto_5
    invoke-direct {v4, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    :goto_6
    iput-object v4, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_actionExtras:Lorg/json/JSONObject;

    .line 220
    .line 221
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->type:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->title:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    if-nez v2, :cond_9

    .line 238
    .line 239
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 240
    .line 241
    :cond_9
    invoke-static {v2, v1}, Ll/hf5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    if-nez v2, :cond_a

    .line 252
    .line 253
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    .line 254
    .line 255
    :cond_a
    invoke-static {v2, v0}, Ll/hf5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->message:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    if-nez v0, :cond_b

    .line 272
    .line 273
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 274
    .line 275
    :cond_b
    invoke-static {v0, v1}, Ll/hf5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 280
    .line 281
    :try_start_0
    sget-object v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 282
    .line 283
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    if-nez v0, :cond_c

    .line 288
    .line 289
    new-instance v0, Ljava/util/ArrayList;

    .line 290
    .line 291
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 292
    .line 293
    .line 294
    :cond_c
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_buttons:Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 295
    .line 296
    :catchall_0
    :try_start_1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 297
    .line 298
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    if-nez v0, :cond_d

    .line 303
    .line 304
    new-instance v0, Ljava/util/ArrayList;

    .line 305
    .line 306
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .line 308
    .line 309
    :cond_d
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 310
    .line 311
    :catchall_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-eqz v0, :cond_e

    .line 316
    .line 317
    move v0, v5

    .line 318
    goto :goto_7

    .line 319
    :cond_e
    move v0, v3

    .line 320
    :goto_7
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isHideCloseButton:Z

    .line 321
    .line 322
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    iput v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->buttonCount:I

    .line 327
    .line 328
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    if-eqz v0, :cond_f

    .line 333
    .line 334
    move v0, v5

    .line 335
    goto :goto_8

    .line 336
    :cond_f
    move v0, v3

    .line 337
    :goto_8
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isTablet:Z

    .line 338
    .line 339
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customInAppUrl:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 346
    .line 347
    .line 348
    move-result v0

    .line 349
    if-eqz v0, :cond_10

    .line 350
    .line 351
    move v0, v5

    .line 352
    goto :goto_9

    .line 353
    :cond_10
    move v0, v3

    .line 354
    :goto_9
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isJsEnabled:Z

    .line 355
    .line 356
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    if-eqz v0, :cond_11

    .line 361
    .line 362
    move v0, v5

    .line 363
    goto :goto_a

    .line 364
    :cond_11
    move v0, v3

    .line 365
    :goto_a
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isPortrait:Z

    .line 366
    .line 367
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    if-eqz v0, :cond_12

    .line 372
    .line 373
    move v0, v5

    .line 374
    goto :goto_b

    .line 375
    :cond_12
    move v0, v3

    .line 376
    :goto_b
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLandscape:Z

    .line 377
    .line 378
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_13

    .line 383
    .line 384
    move v0, v5

    .line 385
    goto :goto_c

    .line 386
    :cond_13
    move v0, v3

    .line 387
    :goto_c
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLocalInApp:Z

    .line 388
    .line 389
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-eqz v0, :cond_14

    .line 394
    .line 395
    move v0, v5

    .line 396
    goto :goto_d

    .line 397
    :cond_14
    move v0, v3

    .line 398
    :goto_d
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->fallBackToNotificationSettings:Z

    .line 399
    .line 400
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->landscapeImageUrl:Ljava/lang/String;

    .line 405
    .line 406
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 407
    .line 408
    .line 409
    move-result-wide v0

    .line 410
    iput-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->timeToLive:J

    .line 411
    .line 412
    const-class v0, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 413
    .line 414
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 419
    .line 420
    .line 421
    move-result-object v0

    .line 422
    check-cast v0, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 423
    .line 424
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customTemplateData:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 425
    .line 426
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    .line 427
    .line 428
    .line 429
    move-result-wide v0

    .line 430
    iput-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 431
    .line 432
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 433
    .line 434
    .line 435
    move-result p1

    .line 436
    if-eqz p1, :cond_15

    .line 437
    .line 438
    move v3, v5

    .line 439
    :cond_15
    iput-boolean v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isRequestForPushPermission:Z

    .line 440
    .line 441
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 442
    .line 443
    const-string v0, "pip"

    .line 444
    .line 445
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 446
    .line 447
    .line 448
    move-result-object p1

    .line 449
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->pipConfigJson:Lorg/json/JSONObject;

    .line 450
    .line 451
    return-void
.end method

.method public synthetic constructor <init>(Landroid/os/Parcel;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 466
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Z)V
    .locals 2
    .param p1    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 452
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 453
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_buttons:Ljava/util/ArrayList;

    .line 454
    const-string v0, "#FFFFFF"

    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 455
    iput-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 456
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 457
    const-string v0, "#000000"

    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 458
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 459
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isVideoSupported:Z

    .line 460
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 461
    :try_start_0
    const-string p2, "type"

    invoke-static {p1, p2}, Ll/xrq;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->type:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 462
    const-string v0, "custom-html"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    .line 463
    :cond_0
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->a(Lorg/json/JSONObject;)V

    return-void

    :catch_0
    move-exception p1

    goto :goto_1

    .line 464
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->U(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 465
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Invalid JSON: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    return-void
.end method

.method private final M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/lang/String;",
            "Lkotlin/reflect/KClass<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p3, p0}, Lkotlin/reflect/KClass;->isInstance(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private final U(Lorg/json/JSONObject;)V
    .locals 10

    .line 1
    const-string v0, "kv"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    sget-object v2, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->Companion:Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;

    .line 6
    .line 7
    invoke-static {v2, p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;->a(Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;Lorg/json/JSONObject;)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-direct {p0, v3}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->X(Landroid/os/Bundle;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const-string v4, "Invalid JSON"

    .line 16
    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    iput-object v4, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    :try_start_0
    const-string v3, "ti"

    .line 23
    .line 24
    invoke-virtual {p1, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iput-object v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->id:Ljava/lang/String;

    .line 29
    .line 30
    const-string v3, "wzrk_id"

    .line 31
    .line 32
    invoke-virtual {p1, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iput-object v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->campaignId:Ljava/lang/String;

    .line 37
    .line 38
    const-string v3, "efc"

    .line 39
    .line 40
    const/4 v5, -0x1

    .line 41
    invoke-virtual {p1, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/4 v6, 0x1

    .line 46
    const/4 v7, 0x0

    .line 47
    if-eq v3, v6, :cond_2

    .line 48
    .line 49
    const-string v3, "excludeGlobalFCaps"

    .line 50
    .line 51
    invoke-virtual {p1, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-ne v3, v6, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    move v6, v7

    .line 59
    :cond_2
    :goto_0
    iput-boolean v6, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isExcludeFromCaps:Z

    .line 60
    .line 61
    const-string v3, "tlc"

    .line 62
    .line 63
    invoke-virtual {p1, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    iput v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalLifetimeCount:I

    .line 68
    .line 69
    const-string v3, "tdc"

    .line 70
    .line 71
    invoke-virtual {p1, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    iput v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalDailyCount:I

    .line 76
    .line 77
    const-string v3, "isJsEnabled"

    .line 78
    .line 79
    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    iput-boolean v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isJsEnabled:Z

    .line 84
    .line 85
    const-string v3, "wzrk_ttl"

    .line 86
    .line 87
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;->b()J

    .line 88
    .line 89
    .line 90
    move-result-wide v8

    .line 91
    invoke-virtual {p1, v3, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 92
    .line 93
    .line 94
    move-result-wide v2

    .line 95
    iput-wide v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->timeToLive:J

    .line 96
    .line 97
    const-string v2, "rfp"

    .line 98
    .line 99
    invoke-virtual {p1, v2, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isRequestForPushPermission:Z

    .line 104
    .line 105
    const-string v2, "d"

    .line 106
    .line 107
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    if-eqz v2, :cond_b

    .line 112
    .line 113
    const-string v3, "html"

    .line 114
    .line 115
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iput-object v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->html:Ljava/lang/String;

    .line 120
    .line 121
    const-string v3, "url"

    .line 122
    .line 123
    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iput-object v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customInAppUrl:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    if-eqz v1, :cond_3

    .line 134
    .line 135
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    goto :goto_1

    .line 140
    :cond_3
    new-instance v0, Lorg/json/JSONObject;

    .line 141
    .line 142
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 143
    .line 144
    .line 145
    :goto_1
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customExtras:Lorg/json/JSONObject;

    .line 146
    .line 147
    const-string v0, "w"

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 154
    .line 155
    if-eqz p1, :cond_4

    .line 156
    .line 157
    const-string v2, "dk"

    .line 158
    .line 159
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isDarkenScreen:Z

    .line 164
    .line 165
    const-string v2, "sc"

    .line 166
    .line 167
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isShowClose:Z

    .line 172
    .line 173
    const-string v2, "pos"

    .line 174
    .line 175
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v2, v7}, Ljava/lang/String;->charAt(I)C

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    iput-char v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->position:C

    .line 184
    .line 185
    const-string v2, "xdp"

    .line 186
    .line 187
    invoke-virtual {p1, v2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->width:I

    .line 192
    .line 193
    const-string v2, "xp"

    .line 194
    .line 195
    invoke-virtual {p1, v2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->widthPercentage:I

    .line 200
    .line 201
    const-string v2, "ydp"

    .line 202
    .line 203
    invoke-virtual {p1, v2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->height:I

    .line 208
    .line 209
    const-string v2, "yp"

    .line 210
    .line 211
    invoke-virtual {p1, v2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 216
    .line 217
    const-string v2, "mdc"

    .line 218
    .line 219
    invoke-virtual {p1, v2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->maxPerSession:I

    .line 224
    .line 225
    const-string v2, "aspectRatio"

    .line 226
    .line 227
    invoke-virtual {p1, v2, v0, v1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 228
    .line 229
    .line 230
    move-result-wide v2

    .line 231
    iput-wide v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 232
    .line 233
    const-wide/16 v5, 0x0

    .line 234
    .line 235
    cmpg-double p1, v2, v5

    .line 236
    .line 237
    if-gtz p1, :cond_4

    .line 238
    .line 239
    iput-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 240
    .line 241
    :cond_4
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->html:Ljava/lang/String;

    .line 242
    .line 243
    if-eqz p1, :cond_b

    .line 244
    .line 245
    iget-char p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->position:C

    .line 246
    .line 247
    const/16 v2, 0x74

    .line 248
    .line 249
    const/16 v3, 0x1e

    .line 250
    .line 251
    const/16 v5, 0x64

    .line 252
    .line 253
    if-ne p1, v2, :cond_6

    .line 254
    .line 255
    iget-wide v6, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 256
    .line 257
    cmpg-double p1, v6, v0

    .line 258
    .line 259
    if-nez p1, :cond_5

    .line 260
    .line 261
    iget p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->widthPercentage:I

    .line 262
    .line 263
    if-ne p1, v5, :cond_b

    .line 264
    .line 265
    iget p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 266
    .line 267
    if-gt p1, v3, :cond_b

    .line 268
    .line 269
    :cond_5
    sget-object p1, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeHeaderHTML:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 270
    .line 271
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 272
    .line 273
    return-void

    .line 274
    :cond_6
    const/16 v2, 0x62

    .line 275
    .line 276
    if-ne p1, v2, :cond_8

    .line 277
    .line 278
    iget-wide v6, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 279
    .line 280
    cmpg-double p1, v6, v0

    .line 281
    .line 282
    if-nez p1, :cond_7

    .line 283
    .line 284
    iget p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->widthPercentage:I

    .line 285
    .line 286
    if-ne p1, v5, :cond_b

    .line 287
    .line 288
    iget p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 289
    .line 290
    if-gt p1, v3, :cond_b

    .line 291
    .line 292
    :cond_7
    sget-object p1, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeFooterHTML:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 293
    .line 294
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 295
    .line 296
    return-void

    .line 297
    :cond_8
    const/16 v0, 0x63

    .line 298
    .line 299
    if-ne p1, v0, :cond_b

    .line 300
    .line 301
    iget p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->widthPercentage:I

    .line 302
    .line 303
    const/16 v0, 0x5a

    .line 304
    .line 305
    if-ne p1, v0, :cond_9

    .line 306
    .line 307
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 308
    .line 309
    const/16 v2, 0x55

    .line 310
    .line 311
    if-ne v1, v2, :cond_9

    .line 312
    .line 313
    sget-object p1, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeInterstitialHTML:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 314
    .line 315
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 316
    .line 317
    return-void

    .line 318
    :cond_9
    if-ne p1, v5, :cond_a

    .line 319
    .line 320
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 321
    .line 322
    if-ne v1, v5, :cond_a

    .line 323
    .line 324
    sget-object p1, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeCoverHTML:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 325
    .line 326
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 327
    .line 328
    return-void

    .line 329
    :cond_a
    if-ne p1, v0, :cond_b

    .line 330
    .line 331
    iget p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 332
    .line 333
    const/16 v0, 0x32

    .line 334
    .line 335
    if-ne p1, v0, :cond_b

    .line 336
    .line 337
    sget-object p1, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeHalfInterstitialHTML:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 338
    .line 339
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    .line 341
    :cond_b
    return-void

    .line 342
    :catch_0
    iput-object v4, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 343
    .line 344
    return-void
.end method

.method private final X(Landroid/os/Bundle;)Z
    .locals 7

    .line 1
    const-string v0, "pos"

    .line 2
    .line 3
    const-class v1, Ljava/lang/String;

    .line 4
    .line 5
    const-class v2, Ljava/lang/Integer;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    :try_start_0
    const-string v4, "w"

    .line 9
    .line 10
    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    const-string v5, "d"

    .line 15
    .line 16
    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz v4, :cond_8

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_0
    const-string v5, "xdp"

    .line 27
    .line 28
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    invoke-direct {p0, v4, v5, v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-nez v5, :cond_1

    .line 37
    .line 38
    const-string v5, "xp"

    .line 39
    .line 40
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    invoke-direct {p0, v4, v5, v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-nez v5, :cond_1

    .line 49
    .line 50
    return v3

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto/16 :goto_2

    .line 53
    .line 54
    :cond_1
    const-string v5, "ydp"

    .line 55
    .line 56
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    invoke-direct {p0, v4, v5, v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-nez v5, :cond_2

    .line 65
    .line 66
    const-string v5, "yp"

    .line 67
    .line 68
    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-direct {p0, v4, v5, v2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_2

    .line 77
    .line 78
    return v3

    .line 79
    :cond_2
    const-string v2, "dk"

    .line 80
    .line 81
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 82
    .line 83
    invoke-static {v5}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-direct {p0, v4, v2, v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-nez v2, :cond_3

    .line 92
    .line 93
    return v3

    .line 94
    :cond_3
    const-string v2, "sc"

    .line 95
    .line 96
    invoke-static {v5}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-direct {p0, v4, v2, v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-nez v2, :cond_4

    .line 105
    .line 106
    return v3

    .line 107
    :cond_4
    const-string v2, "html"

    .line 108
    .line 109
    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-direct {p0, p1, v2, v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_5

    .line 118
    .line 119
    return v3

    .line 120
    :cond_5
    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-direct {p0, v4, v0, p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->M(Landroid/os/Bundle;Ljava/lang/String;Lkotlin/reflect/KClass;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-eqz p0, :cond_8

    .line 129
    .line 130
    invoke-virtual {v4, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 138
    .line 139
    .line 140
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    const/16 p1, 0x74

    .line 142
    .line 143
    if-eq p0, p1, :cond_7

    .line 144
    .line 145
    const/16 p1, 0x72

    .line 146
    .line 147
    if-eq p0, p1, :cond_7

    .line 148
    .line 149
    const/16 p1, 0x62

    .line 150
    .line 151
    if-eq p0, p1, :cond_7

    .line 152
    .line 153
    const/16 p1, 0x6c

    .line 154
    .line 155
    if-eq p0, p1, :cond_7

    .line 156
    .line 157
    const/16 p1, 0x63

    .line 158
    .line 159
    if-ne p0, p1, :cond_6

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_6
    return v3

    .line 163
    :cond_7
    :goto_0
    const/4 p0, 0x1

    .line 164
    return p0

    .line 165
    :cond_8
    :goto_1
    return v3

    .line 166
    :goto_2
    const-string p1, "Failed to parse in-app notification!"

    .line 167
    .line 168
    invoke-static {p1, p0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 169
    .line 170
    .line 171
    return v3
.end method

.method private final a(Lorg/json/JSONObject;)V
    .locals 10

    .line 1
    const-string v0, "hasPortrait"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    :try_start_0
    const-string v2, "ti"

    .line 6
    .line 7
    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "wzrk_id"

    .line 14
    .line 15
    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->campaignId:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "type"

    .line 22
    .line 23
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->type:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "isLocalInApp"

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLocalInApp:Z

    .line 37
    .line 38
    const-string v2, "fallbackToNotificationSettings"

    .line 39
    .line 40
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->fallBackToNotificationSettings:Z

    .line 45
    .line 46
    const-string v2, "efc"

    .line 47
    .line 48
    const/4 v4, -0x1

    .line 49
    invoke-virtual {p1, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    const/4 v5, 0x1

    .line 54
    if-eq v2, v5, :cond_1

    .line 55
    .line 56
    const-string v2, "excludeGlobalFCaps"

    .line 57
    .line 58
    invoke-virtual {p1, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-ne v2, v5, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move v2, v3

    .line 66
    goto :goto_1

    .line 67
    :catch_0
    move-exception p1

    .line 68
    goto/16 :goto_8

    .line 69
    .line 70
    :cond_1
    :goto_0
    move v2, v5

    .line 71
    :goto_1
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isExcludeFromCaps:Z

    .line 72
    .line 73
    const-string v2, "tlc"

    .line 74
    .line 75
    invoke-virtual {p1, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalLifetimeCount:I

    .line 80
    .line 81
    const-string v2, "tdc"

    .line 82
    .line 83
    invoke-virtual {p1, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalDailyCount:I

    .line 88
    .line 89
    const-string v2, "mdc"

    .line 90
    .line 91
    invoke-virtual {p1, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->maxPerSession:I

    .line 96
    .line 97
    sget-object v2, Lcom/clevertap/android/sdk/inapp/CTInAppType;->Companion:Lcom/clevertap/android/sdk/inapp/CTInAppType$a;

    .line 98
    .line 99
    iget-object v6, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->type:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v2, v6}, Lcom/clevertap/android/sdk/inapp/CTInAppType$a;->a(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 106
    .line 107
    const-string v2, "tablet"

    .line 108
    .line 109
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isTablet:Z

    .line 114
    .line 115
    const-string v2, "bg"

    .line 116
    .line 117
    iget-object v6, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p1, v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    const-string v6, "#FFFFFF"

    .line 124
    .line 125
    invoke-static {v2, v6}, Ll/hf5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iput-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-eqz v2, :cond_3

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_2

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_2
    move v0, v3

    .line 145
    goto :goto_3

    .line 146
    :cond_3
    :goto_2
    move v0, v5

    .line 147
    :goto_3
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isPortrait:Z

    .line 148
    .line 149
    const-string v0, "hasLandscape"

    .line 150
    .line 151
    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLandscape:Z

    .line 156
    .line 157
    const-string v0, "wzrk_ttl"

    .line 158
    .line 159
    sget-object v2, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->Companion:Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;

    .line 160
    .line 161
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$b;->b()J

    .line 162
    .line 163
    .line 164
    move-result-wide v6

    .line 165
    invoke-virtual {p1, v0, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 166
    .line 167
    .line 168
    move-result-wide v6

    .line 169
    iput-wide v6, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->timeToLive:J

    .line 170
    .line 171
    const-string v0, "title"

    .line 172
    .line 173
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 174
    .line 175
    .line 176
    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    const-string v2, "#000000"

    .line 178
    .line 179
    const-string v6, "color"

    .line 180
    .line 181
    const-string v7, "text"

    .line 182
    .line 183
    if-eqz v0, :cond_4

    .line 184
    .line 185
    :try_start_1
    invoke-virtual {v0, v7, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v8

    .line 189
    iput-object v8, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->title:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v8, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v0, v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-static {v0, v2}, Ll/hf5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 202
    .line 203
    :cond_4
    const-string v0, "message"

    .line 204
    .line 205
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    if-eqz v0, :cond_5

    .line 210
    .line 211
    invoke-virtual {v0, v7, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v7

    .line 215
    iput-object v7, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->message:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v7, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-static {v0, v2}, Ll/hf5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 228
    .line 229
    :cond_5
    const-string v0, "close"

    .line 230
    .line 231
    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isHideCloseButton:Z

    .line 236
    .line 237
    const-string v0, "media"

    .line 238
    .line 239
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    if-eqz v0, :cond_6

    .line 244
    .line 245
    sget-object v2, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->Companion:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia$b;

    .line 246
    .line 247
    invoke-virtual {v2, v0, v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia$b;->a(Lorg/json/JSONObject;I)Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    if-eqz v0, :cond_6

    .line 252
    .line 253
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 254
    .line 255
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    :cond_6
    const-string v0, "mediaLandscape"

    .line 259
    .line 260
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    if-eqz v0, :cond_7

    .line 265
    .line 266
    sget-object v2, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->Companion:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia$b;

    .line 267
    .line 268
    const/4 v6, 0x2

    .line 269
    invoke-virtual {v2, v0, v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia$b;->a(Lorg/json/JSONObject;I)Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    if-eqz v0, :cond_7

    .line 274
    .line 275
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 276
    .line 277
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    :cond_7
    const-string v0, "buttons"

    .line 281
    .line 282
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    if-eqz v0, :cond_9

    .line 287
    .line 288
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    move v6, v3

    .line 293
    :goto_4
    if-ge v6, v2, :cond_9

    .line 294
    .line 295
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 296
    .line 297
    .line 298
    move-result-object v7

    .line 299
    if-eqz v7, :cond_8

    .line 300
    .line 301
    iget-object v8, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_buttons:Ljava/util/ArrayList;

    .line 302
    .line 303
    new-instance v9, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;

    .line 304
    .line 305
    invoke-direct {v9, v7}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;-><init>(Lorg/json/JSONObject;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    iget v7, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->buttonCount:I

    .line 312
    .line 313
    add-int/2addr v7, v5

    .line 314
    iput v7, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->buttonCount:I

    .line 315
    .line 316
    :cond_8
    add-int/lit8 v6, v6, 0x1

    .line 317
    .line 318
    goto :goto_4

    .line 319
    :cond_9
    const-string v0, "rfp"

    .line 320
    .line 321
    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isRequestForPushPermission:Z

    .line 326
    .line 327
    sget-object v0, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->CREATOR:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData$a;

    .line 328
    .line 329
    invoke-virtual {v0, p1}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData$a;->a(Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customTemplateData:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 334
    .line 335
    const-string v0, "pip"

    .line 336
    .line 337
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->pipConfigJson:Lorg/json/JSONObject;

    .line 342
    .line 343
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 344
    .line 345
    if-nez p1, :cond_a

    .line 346
    .line 347
    goto :goto_5

    .line 348
    :cond_a
    sget-object v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification$c;->a:[I

    .line 349
    .line 350
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 351
    .line 352
    .line 353
    move-result p1

    .line 354
    aget v4, v0, p1

    .line 355
    .line 356
    :goto_5
    packed-switch v4, :pswitch_data_0

    .line 357
    .line 358
    .line 359
    goto :goto_7

    .line 360
    :pswitch_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 361
    .line 362
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 363
    .line 364
    .line 365
    move-result p1

    .line 366
    if-eqz p1, :cond_d

    .line 367
    .line 368
    const-string p1, "PIP type requires media"

    .line 369
    .line 370
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 371
    .line 372
    return-void

    .line 373
    :pswitch_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 374
    .line 375
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 376
    .line 377
    .line 378
    move-result p1

    .line 379
    if-eqz p1, :cond_d

    .line 380
    .line 381
    const-string p1, "No media type for template"

    .line 382
    .line 383
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 384
    .line 385
    return-void

    .line 386
    :pswitch_2
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 387
    .line 388
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 393
    .line 394
    .line 395
    :cond_b
    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    if-eqz v0, :cond_d

    .line 400
    .line 401
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 406
    .line 407
    .line 408
    check-cast v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 409
    .line 410
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->e()Z

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    if-nez v2, :cond_c

    .line 415
    .line 416
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->h()Z

    .line 417
    .line 418
    .line 419
    move-result v2

    .line 420
    if-eqz v2, :cond_b

    .line 421
    .line 422
    :cond_c
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->i(Ljava/lang/String;)V

    .line 423
    .line 424
    .line 425
    const-string v0, "Unable to download media. Video/audio not supported for this template"

    .line 426
    .line 427
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 428
    .line 429
    .line 430
    goto :goto_6

    .line 431
    :cond_d
    :goto_7
    return-void

    .line 432
    :goto_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 433
    .line 434
    const-string v1, "Invalid JSON: "

    .line 435
    .line 436
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object p1

    .line 443
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object p1

    .line 450
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 451
    .line 452
    return-void

    .line 453
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final A()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->timeToLive:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final B()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final C()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final D()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalDailyCount:I

    .line 2
    .line 3
    return p0
.end method

.method public final E()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalLifetimeCount:I

    .line 2
    .line 3
    return p0
.end method

.method public final F()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final G()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public final H()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->widthPercentage:I

    .line 2
    .line 3
    return p0
.end method

.method public final I()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isDarkenScreen:Z

    .line 2
    .line 3
    return p0
.end method

.method public final J()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isExcludeFromCaps:Z

    .line 2
    .line 3
    return p0
.end method

.method public final K()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isHideCloseButton:Z

    .line 2
    .line 3
    return p0
.end method

.method public final L()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isJsEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final O()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLandscape:Z

    .line 2
    .line 3
    return p0
.end method

.method public final P()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLocalInApp:Z

    .line 2
    .line 3
    return p0
.end method

.method public final Q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isPortrait:Z

    .line 2
    .line 3
    return p0
.end method

.method public final R()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isRequestForPushPermission:Z

    .line 2
    .line 3
    return p0
.end method

.method public final S()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isShowClose:Z

    .line 2
    .line 3
    return p0
.end method

.method public final T()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isTablet:Z

    .line 2
    .line 3
    return p0
.end method

.method public final V(Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)V
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customTemplateData:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->i(Lorg/json/JSONObject;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final W(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final b(Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
    .locals 6
    .param p1    # Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const-string v0, "wzrk_cgId"

    .line 2
    .line 3
    const-string v1, "wzrk_pivot"

    .line 4
    .line 5
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, "ti"

    .line 11
    .line 12
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    const-string v3, "wzrk_id"

    .line 18
    .line 19
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->campaignId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v3, "type"

    .line 25
    .line 26
    sget-object v4, Lcom/clevertap/android/sdk/inapp/InAppActionType;->CUSTOM_CODE:Lcom/clevertap/android/sdk/inapp/InAppActionType;

    .line 27
    .line 28
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/inapp/InAppActionType;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const-string v3, "efc"

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    const-string v3, "excludeGlobalFCaps"

    .line 42
    .line 43
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    const-string v3, "wzrk_ttl"

    .line 47
    .line 48
    iget-wide v4, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->timeToLive:J

    .line 49
    .line 50
    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_0

    .line 60
    .line 61
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 62
    .line 63
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    .line 86
    .line 87
    :cond_1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 88
    .line 89
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isVideoSupported:Z

    .line 90
    .line 91
    invoke-direct {v0, v2, p0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;-><init>(Lorg/json/JSONObject;Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->V(Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .line 96
    .line 97
    return-object v0

    .line 98
    :catch_0
    const/4 p0, 0x0

    .line 99
    return-object p0
.end method

.method public final c()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public final d()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->buttonCount:I

    .line 2
    .line 3
    return p0
.end method

.method public final f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_buttons:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->campaignId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customInAppUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customTemplateData:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->fallBackToNotificationSettings:Z

    .line 2
    .line 3
    return p0
.end method

.method public final m()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public final n()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 2
    .line 3
    return p0
.end method

.method public final o()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->html:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q(I)Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    check-cast v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->d()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ne p1, v1, :cond_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final r()Lcom/clevertap/android/sdk/inapp/CTInAppType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s()Lorg/json/JSONObject;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-static {p0}, Ll/kx3;->f(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final t()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->maxPerSession:I

    .line 2
    .line 3
    return p0
.end method

.method public final u()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final w()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1    # Landroid/os/Parcel;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->id:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->campaignId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->inAppType:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->html:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isExcludeFromCaps:Z

    .line 25
    .line 26
    int-to-byte v0, v0

    .line 27
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isShowClose:Z

    .line 31
    .line 32
    int-to-byte v0, v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isDarkenScreen:Z

    .line 37
    .line 38
    int-to-byte v0, v0

    .line 39
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->maxPerSession:I

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 45
    .line 46
    .line 47
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalLifetimeCount:I

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 50
    .line 51
    .line 52
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->totalDailyCount:I

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 55
    .line 56
    .line 57
    iget-char v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->position:C

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 60
    .line 61
    .line 62
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->height:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 65
    .line 66
    .line 67
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->heightPercentage:I

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 70
    .line 71
    .line 72
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->width:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 75
    .line 76
    .line 77
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->widthPercentage:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_jsonDescription:Lorg/json/JSONObject;

    .line 83
    .line 84
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->error:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customExtras:Lorg/json/JSONObject;

    .line 97
    .line 98
    const/4 v1, 0x1

    .line 99
    const/4 v2, 0x0

    .line 100
    if-nez v0, :cond_0

    .line 101
    .line 102
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customExtras:Lorg/json/JSONObject;

    .line 110
    .line 111
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :goto_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_actionExtras:Lorg/json/JSONObject;

    .line 119
    .line 120
    if-nez v0, :cond_1

    .line 121
    .line 122
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_actionExtras:Lorg/json/JSONObject;

    .line 130
    .line 131
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :goto_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->type:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->title:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->titleColor:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->backgroundColor:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->message:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_buttons:Ljava/util/ArrayList;

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->_mediaList:Ljava/util/ArrayList;

    .line 174
    .line 175
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 176
    .line 177
    .line 178
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isHideCloseButton:Z

    .line 179
    .line 180
    int-to-byte v0, v0

    .line 181
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 182
    .line 183
    .line 184
    iget v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->buttonCount:I

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 187
    .line 188
    .line 189
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isTablet:Z

    .line 190
    .line 191
    int-to-byte v0, v0

    .line 192
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customInAppUrl:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isJsEnabled:Z

    .line 201
    .line 202
    int-to-byte v0, v0

    .line 203
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 204
    .line 205
    .line 206
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isPortrait:Z

    .line 207
    .line 208
    int-to-byte v0, v0

    .line 209
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 210
    .line 211
    .line 212
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLandscape:Z

    .line 213
    .line 214
    int-to-byte v0, v0

    .line 215
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 216
    .line 217
    .line 218
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isLocalInApp:Z

    .line 219
    .line 220
    int-to-byte v0, v0

    .line 221
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 222
    .line 223
    .line 224
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->fallBackToNotificationSettings:Z

    .line 225
    .line 226
    int-to-byte v0, v0

    .line 227
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->landscapeImageUrl:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->timeToLive:J

    .line 236
    .line 237
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->customTemplateData:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 241
    .line 242
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 243
    .line 244
    .line 245
    iget-wide v0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->aspectRatio:D

    .line 246
    .line 247
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 248
    .line 249
    .line 250
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->isRequestForPushPermission:Z

    .line 251
    .line 252
    int-to-byte p0, p0

    .line 253
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeByte(B)V

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method public final x()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->messageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y()Lorg/json/JSONObject;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->pipConfigJson:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public final z()C
    .locals 0

    .line 1
    iget-char p0, p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->position:C

    .line 2
    .line 3
    return p0
.end method
