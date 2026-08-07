.class public Lcom/idv/identity/platform/log/RecordConst;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static ANDROID_VERSION:Ljava/lang/String; = ""

.field private static CLIENT_ID:Ljava/lang/String; = ""

.field private static CLIENT_VERSION:Ljava/lang/String; = ""

.field private static DEVICE_ID:Ljava/lang/String; = ""

.field private static LOG_FILE_NAME:Ljava/lang/String; = "/sdcard/idv_identity_platform_log"

.field private static LOG_VERSION:Ljava/lang/String; = "1.0.2"

.field private static NET_TYPE:Ljava/lang/String; = ""

.field private static OS_VERSION:Ljava/lang/String; = ""

.field private static PACKAGE_NAME:Ljava/lang/String; = ""

.field private static PHONE_PRINT:Ljava/lang/String; = ""

.field private static SCREEN_METRICS:Ljava/lang/String; = ""

.field private static SESSION_ID:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static getClientId()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->CLIENT_ID:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getClientVersion()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->CLIENT_VERSION:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->DEVICE_ID:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getLogFilePath()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->LOG_FILE_NAME:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getLogVersion()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->LOG_VERSION:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getNetType()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->NET_TYPE:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getOsVersion()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->OS_VERSION:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getPackageName()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->PACKAGE_NAME:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getPhonePrint()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->PHONE_PRINT:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getScreenMetrics()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->SCREEN_METRICS:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getSessionId()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordConst;->SESSION_ID:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static setClientId(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->CLIENT_ID:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setClientVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->CLIENT_VERSION:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setDeviceId(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->DEVICE_ID:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setLogFilePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->LOG_FILE_NAME:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setLogVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->LOG_VERSION:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setNetType(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->NET_TYPE:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setOsVersion(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "android_version"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->OS_VERSION:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public static setPackageName(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->PACKAGE_NAME:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setPhonePrint(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->PHONE_PRINT:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setScreenMetrics(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->SCREEN_METRICS:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setSessionId(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/idv/identity/platform/log/RecordConst;->SESSION_ID:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
