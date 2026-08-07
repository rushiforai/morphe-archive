.class public Lcom/heytap/mcssdk/PushManager;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/heytap/mcssdk/b;


# static fields
.field private static final APP_PACKAGE:Ljava/lang/String; = "appPackage"

.field private static final APP_VERSION_CODE:Ljava/lang/String; = "versionCode"

.field private static final APP_VERSION_NAME:Ljava/lang/String; = "versionName"

.field private static final EVENT_ID:Ljava/lang/String; = "eventID"

.field public static final EVENT_ID_APP_BLACK_LIST:Ljava/lang/String; = "app_black_list"

.field public static final EVENT_ID_PUSH_ADD_MESSAGE_NO_DISTURBING:Ljava/lang/String; = "add_message_no_disturbing"

.field public static final EVENT_ID_PUSH_ADD_MESSAGE_TOP:Ljava/lang/String; = "add_message_top"

.field public static final EVENT_ID_PUSH_CLICK:Ljava/lang/String; = "push_click"

.field public static final EVENT_ID_PUSH_DELETE:Ljava/lang/String; = "push_delete"

.field public static final EVENT_ID_PUSH_EXCEPTION:Ljava/lang/String; = "push_exception"

.field public static final EVENT_ID_PUSH_MESSAGE_REPEAT:Ljava/lang/String; = "message_repeat"

.field public static final EVENT_ID_PUSH_NO_IMSI:Ljava/lang/String; = "imsi_not_exist"

.field public static final EVENT_ID_PUSH_NO_SHOW:Ljava/lang/String; = "push_no_show"

.field public static final EVENT_ID_PUSH_REGISTER:Ljava/lang/String; = "push_register"

.field public static final EVENT_ID_PUSH_REVOKE:Ljava/lang/String; = "push_revoke"

.field public static final EVENT_ID_PUSH_REVOKE_DELETE:Ljava/lang/String; = "push_revoke_delete"

.field public static final EVENT_ID_PUSH_SHOW:Ljava/lang/String; = "push_show"

.field public static final EVENT_ID_PUSH_TRANSMIT:Ljava/lang/String; = "push_transmit"

.field public static final EVENT_ID_READ_MESSAGE:Ljava/lang/String; = "push_read_message"

.field private static final EXTRA:Ljava/lang/String; = "extra"

.field private static final GLOBAL_ID:Ljava/lang/String; = "globalID"

.field private static final MAX_HOUR_IN_DAY:I = 0x17

.field private static final MAX_MIN_IN_HOUR:I = 0x3b

.field private static final MCS_SUPPORT_VERSION:I = 0x3f4

.field private static final MESSAGE_ID:Ljava/lang/String; = "messageID"

.field private static final MESSAGE_TYPE:Ljava/lang/String; = "messageType"

.field private static final NEW_MCS_RECEIVE_SDK_ACTION:Ljava/lang/String; = "com.mcs.action.RECEIVE_SDK_MESSAGE"

.field private static final OLD_MCS_PACKAGE:[I

.field private static final OLD_MCS_RECEIVE_SDK_ACTION:[I

.field private static final PUSH_SDK_VERSION:Ljava/lang/String; = "pushSdkVersion"

.field private static final SDK_INT_24:I = 0x18

.field private static final SUPPORT_OPEN_PUSH:Ljava/lang/String; = "supportOpenPush"

.field private static final SYSTEM_UID:I = 0x3e8

.field private static final TASK_ID:Ljava/lang/String; = "taskID"

.field private static final TYPE:Ljava/lang/String; = "type"

.field private static sCount:I

.field private static sIsNewMcsPkg:Z

.field private static sMcsPkgName:Ljava/lang/String;


# instance fields
.field private mAppKey:Ljava/lang/String;

.field private mAppSecret:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private final mMcsServiceLock:Ljava/lang/Object;

.field private mParsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/a/d;",
            ">;"
        }
    .end annotation
.end field

.field private mProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/b/c;",
            ">;"
        }
    .end annotation
.end field

.field private mPushCallback:Lcom/heytap/mcssdk/callback/PushCallback;

.field private mRegisterID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xf

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/heytap/mcssdk/PushManager;->OLD_MCS_PACKAGE:[I

    const/16 v0, 0x2d

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/heytap/mcssdk/PushManager;->OLD_MCS_RECEIVE_SDK_ACTION:[I

    const/4 v0, 0x0

    sput v0, Lcom/heytap/mcssdk/PushManager;->sCount:I

    return-void

    :array_0
    .array-data 4
        0x63
        0x6f
        0x6d
        0x2e
        0x63
        0x6f
        0x6c
        0x6f
        0x72
        0x6f
        0x73
        0x2e
        0x6d
        0x63
        0x73
    .end array-data

    :array_1
    .array-data 4
        0x63
        0x6f
        0x6d
        0x2e
        0x63
        0x6f
        0x6c
        0x6f
        0x72
        0x6f
        0x73
        0x2e
        0x6d
        0x63
        0x73
        0x73
        0x64
        0x6b
        0x2e
        0x61
        0x63
        0x74
        0x69
        0x6f
        0x6e
        0x2e
        0x52
        0x45
        0x43
        0x45
        0x49
        0x56
        0x45
        0x5f
        0x53
        0x44
        0x4b
        0x5f
        0x4d
        0x45
        0x53
        0x53
        0x41
        0x47
        0x45
    .end array-data
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mMcsServiceLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mProcessors:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mParsers:Ljava/util/List;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mRegisterID:Ljava/lang/String;

    const-class v0, Lcom/heytap/mcssdk/PushManager;

    monitor-enter v0

    :try_start_0
    sget v1, Lcom/heytap/mcssdk/PushManager;->sCount:I

    if-gtz v1, :cond_0

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/heytap/mcssdk/PushManager;->sCount:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Lcom/heytap/mcssdk/a/a;

    invoke-direct {v0}, Lcom/heytap/mcssdk/a/a;-><init>()V

    invoke-direct {p0, v0}, Lcom/heytap/mcssdk/PushManager;->addParser(Lcom/heytap/mcssdk/a/d;)V

    new-instance v0, Lcom/heytap/mcssdk/a/e;

    invoke-direct {v0}, Lcom/heytap/mcssdk/a/e;-><init>()V

    invoke-direct {p0, v0}, Lcom/heytap/mcssdk/PushManager;->addParser(Lcom/heytap/mcssdk/a/d;)V

    new-instance v0, Lcom/heytap/mcssdk/a/b;

    invoke-direct {v0}, Lcom/heytap/mcssdk/a/b;-><init>()V

    invoke-direct {p0, v0}, Lcom/heytap/mcssdk/PushManager;->addParser(Lcom/heytap/mcssdk/a/d;)V

    new-instance v0, Lcom/heytap/mcssdk/b/a;

    invoke-direct {v0}, Lcom/heytap/mcssdk/b/a;-><init>()V

    invoke-direct {p0, v0}, Lcom/heytap/mcssdk/PushManager;->addProcessor(Lcom/heytap/mcssdk/b/c;)V

    new-instance v0, Lcom/heytap/mcssdk/b/d;

    invoke-direct {v0}, Lcom/heytap/mcssdk/b/d;-><init>()V

    invoke-direct {p0, v0}, Lcom/heytap/mcssdk/PushManager;->addProcessor(Lcom/heytap/mcssdk/b/c;)V

    new-instance v0, Lcom/heytap/mcssdk/b/b;

    invoke-direct {v0}, Lcom/heytap/mcssdk/b/b;-><init>()V

    invoke-direct {p0, v0}, Lcom/heytap/mcssdk/PushManager;->addProcessor(Lcom/heytap/mcssdk/b/c;)V

    return-void

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v1, "PushManager can\'t create again!"

    invoke-direct {p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public synthetic constructor <init>(Lcom/heytap/mcssdk/d;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;-><init>()V

    return-void
.end method

.method public static synthetic access$100(Lcom/heytap/mcssdk/PushManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method private declared-synchronized addParser(Lcom/heytap/mcssdk/a/d;)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mParsers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized addProcessor(Lcom/heytap/mcssdk/b/c;)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mProcessors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method private checkAll()V
    .locals 0

    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkContext()V

    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkRegisterID()V

    return-void
.end method

.method private checkContext()V
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    if-eqz p0, :cond_0

    return-void

    :cond_0
    const-string p0, "please call the register first!"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method private checkRegisterID()V
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mRegisterID:Ljava/lang/String;

    if-eqz p0, :cond_0

    return-void

    :cond_0
    const-string p0, "please call the register until get the registerID!"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lcom/heytap/mcssdk/PushManager;
    .locals 1

    invoke-static {}, Lcom/heytap/mcssdk/e;->a()Lcom/heytap/mcssdk/PushManager;

    move-result-object v0

    return-object v0
.end method

.method private getIntent(ILjava/lang/String;Lorg/json/JSONObject;)Landroid/content/Intent;
    .locals 5

    const-string v0, "extra"

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iget-object v2, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/heytap/mcssdk/PushManager;->getReceiveSdkAction(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v2, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/heytap/mcssdk/PushManager;->getMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "type"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v2, "versionName"

    iget-object v3, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/heytap/mcssdk/utils/Utils;->getVersionName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "versionCode"

    iget-object v3, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/heytap/mcssdk/utils/Utils;->getVersionCode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p3, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    throw p0

    :goto_2
    const-string p1, "params"

    invoke-virtual {v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "appPackage"

    invoke-virtual {v1, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "appKey"

    iget-object p2, p0, Lcom/heytap/mcssdk/PushManager;->mAppKey:Ljava/lang/String;

    invoke-virtual {v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "appSecret"

    iget-object p2, p0, Lcom/heytap/mcssdk/PushManager;->mAppSecret:Ljava/lang/String;

    invoke-virtual {v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "registerID"

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mRegisterID:Ljava/lang/String;

    invoke-virtual {v1, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "sdkVersion"

    invoke-static {}, Lcom/heytap/mcssdk/PushManager;->getSDKVersion()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v1
.end method

.method public static getMcsPackageName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/heytap/mcssdk/PushManager;->sMcsPkgName:Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getNewMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/heytap/mcssdk/PushManager;->OLD_MCS_PACKAGE:[I

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/Utils;->getString([I)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/heytap/mcssdk/PushManager;->sMcsPkgName:Ljava/lang/String;

    const/4 p0, 0x0

    :goto_0
    sput-boolean p0, Lcom/heytap/mcssdk/PushManager;->sIsNewMcsPkg:Z

    goto :goto_1

    :cond_0
    sput-object p0, Lcom/heytap/mcssdk/PushManager;->sMcsPkgName:Ljava/lang/String;

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    sget-object p0, Lcom/heytap/mcssdk/PushManager;->sMcsPkgName:Ljava/lang/String;

    return-object p0
.end method

.method private static getNewMcsPackageName(Landroid/content/Context;)Ljava/lang/String;
    .locals 8

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mcs.action.RECEIVE_SDK_MESSAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/16 v2, 0x2000

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catch_0
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v1, v1, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v4, 0x1

    and-int/2addr v2, v4

    if-ne v2, v4, :cond_1

    move v2, v4

    goto :goto_0

    :cond_1
    move v2, v3

    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v5, v1, v3}, Landroid/content/pm/PackageManager;->getPackageUid(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const-string v7, "android"

    invoke-virtual {v6, v7, v3}, Landroid/content/pm/PackageManager;->getPackageUid(Ljava/lang/String;I)I

    move-result v6
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v5, v6, :cond_2

    move v3, v4

    :cond_2
    if-nez v2, :cond_3

    if-eqz v3, :cond_0

    :cond_3
    return-object v1

    :cond_4
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getReceiveSdkAction(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/heytap/mcssdk/PushManager;->sMcsPkgName:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getNewMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    :cond_0
    sget-boolean p0, Lcom/heytap/mcssdk/PushManager;->sIsNewMcsPkg:Z

    if-eqz p0, :cond_1

    const-string p0, "com.mcs.action.RECEIVE_SDK_MESSAGE"

    return-object p0

    :cond_1
    sget-object p0, Lcom/heytap/mcssdk/PushManager;->OLD_MCS_RECEIVE_SDK_ACTION:[I

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/Utils;->getString([I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    const-string v0, "2.0.2"

    return-object v0
.end method

.method public static isSupportPush(Landroid/content/Context;)Z
    .locals 3

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/heytap/mcssdk/utils/Utils;->isExistPackage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0, v0}, Lcom/heytap/mcssdk/utils/Utils;->getVersionCode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/16 v2, 0x3f4

    if-lt v1, v2, :cond_0

    const-string v1, "supportOpenPush"

    invoke-static {p0, v0, v1}, Lcom/heytap/mcssdk/utils/Utils;->isSupportPush(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static onAppStart(Landroid/content/Context;)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Lcom/heytap/mcssdk/mode/MessageStat;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "app_start"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/heytap/mcssdk/mode/MessageStat;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/heytap/mcssdk/PushManager;->statisticMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/MessageStat;)V

    return-void
.end method

.method private startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mMcsServiceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/heytap/mcssdk/PushManager;->getIntent(ILjava/lang/String;Lorg/json/JSONObject;)Landroid/content/Intent;

    move-result-object p1

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private startMcsService(ILorg/json/JSONObject;)V
    .locals 1

    .line 2
    const-string v0, ""

    invoke-direct {p0, p1, v0, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static statisticMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getReceiveSdkAction(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "type"

    const/16 v2, 0x3003

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "taskID"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/Message;->getTaskID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appPackage"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/Message;->getAppPackage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "messageID"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/Message;->getMessageID()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "globalID"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/Message;->getMessageID()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "messageType"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/AppMessage;->getType()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "eventID"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "statisticMessage--Exception"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void
.end method

.method public static statisticMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/MessageStat;)V
    .locals 0

    .line 2
    invoke-static {p0, p1}, Lcom/heytap/mcssdk/utils/StatUtil;->statisticMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/MessageStat;)V

    return-void
.end method

.method public static statisticMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;Ljava/lang/String;)V
    .locals 3

    .line 3
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getReceiveSdkAction(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "type"

    const/16 v2, 0x3003

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "taskID"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/Message;->getTaskID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appPackage"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/Message;->getAppPackage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "messageID"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/Message;->getMessageID()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "globalID"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/SptDataMessage;->getGlobalID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "messageType"

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/SptDataMessage;->getType()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "eventID"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "statisticMessage--Exception"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void
.end method

.method public static statisticMessage(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/MessageStat;",
            ">;)V"
        }
    .end annotation

    .line 4
    invoke-static {p0, p1}, Lcom/heytap/mcssdk/utils/StatUtil;->statisticMessage(Landroid/content/Context;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public bindMcsService(I)V
    .locals 2

    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/heytap/mcssdk/PushManager;->getIntent(ILjava/lang/String;Lorg/json/JSONObject;)Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heytap/mcssdk/d;

    invoke-direct {v1, p0, p1}, Lcom/heytap/mcssdk/d;-><init>(Lcom/heytap/mcssdk/PushManager;Landroid/content/Intent;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p1, v1, p0}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method public clearNotificationType()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->clearNotificationType(Lorg/json/JSONObject;)V

    return-void
.end method

.method public clearNotificationType(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x3014

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string p1, "mcssdk---"

    invoke-static {p1, p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public clearNotifications()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->clearNotifications(Lorg/json/JSONObject;)V

    return-void
.end method

.method public clearNotifications(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkContext()V

    const/16 v0, 0x3017

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string p1, "mcssdk---"

    invoke-static {p1, p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getAliases()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->getAliases(Lorg/json/JSONObject;)V

    return-void
.end method

.method public getAliases(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x3005

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetAliases(ILjava/util/List;)V

    :cond_0
    return-void
.end method

.method public getNotificationStatus()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->getNotificationStatus(Lorg/json/JSONObject;)V

    return-void
.end method

.method public getNotificationStatus(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x3015

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetNotificationStatus(II)V

    :cond_0
    return-void
.end method

.method public getParsers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/a/d;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mParsers:Ljava/util/List;

    return-object p0
.end method

.method public getProcessors()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/b/c;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mProcessors:Ljava/util/List;

    return-object p0
.end method

.method public getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mPushCallback:Lcom/heytap/mcssdk/callback/PushCallback;

    return-object p0
.end method

.method public getPushStatus()V
    .locals 2

    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x3012

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 v0, -0x2

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetPushStatus(II)V

    :cond_0
    return-void
.end method

.method public getPushVersionCode()I
    .locals 1

    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkContext()V

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/heytap/mcssdk/utils/Utils;->getVersionCode(Landroid/content/Context;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getPushVersionName()Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkContext()V

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->getMcsPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/heytap/mcssdk/utils/Utils;->getVersionName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getRegister()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->getRegister(Lorg/json/JSONObject;)V

    return-void
.end method

.method public getRegister(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkContext()V

    const/16 v0, 0x3001

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Lcom/heytap/mcssdk/callback/PushCallback;->onRegister(ILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public getRegisterID()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/PushManager;->mRegisterID:Ljava/lang/String;

    return-object p0
.end method

.method public getTags()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->getTags(Lorg/json/JSONObject;)V

    return-void
.end method

.method public getTags(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x3008

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetTags(ILjava/util/List;)V

    :cond_0
    return-void
.end method

.method public getUserAccounts()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->getUserAccounts(Lorg/json/JSONObject;)V

    return-void
.end method

.method public getUserAccounts(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x300e

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetUserAccounts(ILjava/util/List;)V

    :cond_0
    return-void
.end method

.method public openNotificationSettings()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->openNotificationSettings(Lorg/json/JSONObject;)V

    return-void
.end method

.method public openNotificationSettings(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x3016

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string p1, "mcssdk---"

    invoke-static {p1, p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public pausePush()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->pausePush(Lorg/json/JSONObject;)V

    return-void
.end method

.method public pausePush(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x300b

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string p1, "mcssdk---"

    invoke-static {p1, p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/heytap/mcssdk/callback/PushCallback;)V
    .locals 6

    .line 2
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/heytap/mcssdk/PushManager;->register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/heytap/mcssdk/callback/PushCallback;)V

    return-void
.end method

.method public register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/heytap/mcssdk/callback/PushCallback;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    :try_start_0
    new-instance v1, Lcom/heytap/mcssdk/mode/MessageStat;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "push_register"

    invoke-direct {v1, v2, v3, v0}, Lcom/heytap/mcssdk/mode/MessageStat;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, v1}, Lcom/heytap/mcssdk/PushManager;->statisticMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/MessageStat;)V

    invoke-static {p1}, Lcom/heytap/mcssdk/PushManager;->isSupportPush(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    iput-object p2, p0, Lcom/heytap/mcssdk/PushManager;->mAppKey:Ljava/lang/String;

    iput-object p3, p0, Lcom/heytap/mcssdk/PushManager;->mAppSecret:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    iput-object p5, p0, Lcom/heytap/mcssdk/PushManager;->mPushCallback:Lcom/heytap/mcssdk/callback/PushCallback;

    const/16 p1, 0x3001

    invoke-direct {p0, p1, p4}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "the phone is not support push!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "context is null !"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    invoke-interface {p0, p1, v0}, Lcom/heytap/mcssdk/callback/PushCallback;->onRegister(ILjava/lang/String;)V

    :cond_2
    return-void
.end method

.method public requestNotificationPermission()V
    .locals 1

    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkContext()V

    const/16 v0, 0x3019

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->bindMcsService(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string v0, "mcssdk---"

    invoke-static {v0, p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public resumePush()V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->resumePush(Lorg/json/JSONObject;)V

    return-void
.end method

.method public resumePush(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    const/16 v0, 0x300c

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string p1, "mcssdk---"

    invoke-static {p1, p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public setAliases(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->setAliases(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method public setAliases(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x3004

    invoke-direct {p0, v0, p1, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetAliases(ILjava/util/List;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setAppKeySecret(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/PushManager;->mAppKey:Ljava/lang/String;

    iput-object p2, p0, Lcom/heytap/mcssdk/PushManager;->mAppSecret:Ljava/lang/String;

    return-void
.end method

.method public setNotificationType(I)V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->setNotificationType(ILorg/json/JSONObject;)V

    return-void
.end method

.method public setNotificationType(ILorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x3013

    invoke-direct {p0, v0, p1, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string p1, "mcssdk---"

    invoke-static {p1, p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public setPushCallback(Lcom/heytap/mcssdk/callback/PushCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/PushManager;->mPushCallback:Lcom/heytap/mcssdk/callback/PushCallback;

    return-void
.end method

.method public setPushTime(Ljava/util/List;IIII)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;IIII)V"
        }
    .end annotation

    .line 2
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/heytap/mcssdk/PushManager;->setPushTime(Ljava/util/List;IIIILorg/json/JSONObject;)V

    return-void
.end method

.method public setPushTime(Ljava/util/List;IIIILorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;IIII",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v0, :cond_0

    if-ltz p2, :cond_0

    const/16 v0, 0x17

    if-gt p2, v0, :cond_0

    if-ltz p3, :cond_0

    const/16 v1, 0x3b

    if-gt p3, v1, :cond_0

    if-lt p4, p2, :cond_0

    if-gt p4, v0, :cond_0

    if-lt p5, p3, :cond_0

    if-gt p5, v1, :cond_0

    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "weekDays"

    invoke-static {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "startHour"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p1, "startMin"

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p1, "endHour"

    invoke-virtual {v0, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p1, "endMin"

    invoke-virtual {v0, p1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x300a

    invoke-direct {p0, p2, p1, p6}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "params are not all right,please check params"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p2, -0x2

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetPushTime(ILjava/lang/String;)V

    :cond_1
    :goto_1
    return-void
.end method

.method public setRegisterID(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/PushManager;->mRegisterID:Ljava/lang/String;

    return-void
.end method

.method public setTags(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->setTags(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method public setTags(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x3007

    invoke-direct {p0, v0, p1, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetTags(ILjava/util/List;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setUserAccount(Ljava/lang/String;)V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->setUserAccount(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public setUserAccount(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0, p2}, Lcom/heytap/mcssdk/PushManager;->setUserAccounts(Ljava/util/List;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetUserAccounts(ILjava/util/List;)V

    :cond_0
    return-void
.end method

.method public setUserAccounts(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->setUserAccounts(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method public setUserAccounts(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x300d

    invoke-direct {p0, v0, p1, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetUserAccounts(ILjava/util/List;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public unRegister()V
    .locals 1

    .line 3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->unRegister(Lorg/json/JSONObject;)V

    return-void
.end method

.method public unRegister(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/heytap/mcssdk/callback/PushCallback;)V
    .locals 0

    .line 2
    iput-object p2, p0, Lcom/heytap/mcssdk/PushManager;->mAppKey:Ljava/lang/String;

    iput-object p3, p0, Lcom/heytap/mcssdk/PushManager;->mAppSecret:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/heytap/mcssdk/PushManager;->mContext:Landroid/content/Context;

    iput-object p5, p0, Lcom/heytap/mcssdk/PushManager;->mPushCallback:Lcom/heytap/mcssdk/callback/PushCallback;

    invoke-virtual {p0, p4}, Lcom/heytap/mcssdk/PushManager;->unRegister(Lorg/json/JSONObject;)V

    return-void
.end method

.method public unRegister(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkContext()V

    const/16 v0, 0x3002

    invoke-direct {p0, v0, p1}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    invoke-interface {p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnRegister(I)V

    :cond_0
    return-void
.end method

.method public unsetAlias(Ljava/lang/String;)V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->unsetAlias(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public unsetAlias(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0, p2}, Lcom/heytap/mcssdk/PushManager;->unsetAliases(Ljava/util/List;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetAliases(ILjava/util/List;)V

    :cond_0
    return-void
.end method

.method public unsetAliases(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->unsetAliases(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method public unsetAliases(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x3006

    invoke-direct {p0, v0, p1, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetAliases(ILjava/util/List;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public unsetTags(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->unsetTags(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method public unsetTags(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x3009

    invoke-direct {p0, v0, p1, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetTags(ILjava/util/List;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public unsetUserAccounts(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heytap/mcssdk/PushManager;->unsetUserAccounts(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method public unsetUserAccounts(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushManager;->checkAll()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x300f

    invoke-direct {p0, v0, p1, p2}, Lcom/heytap/mcssdk/PushManager;->startMcsService(ILjava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    const/4 p1, -0x2

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetUserAccounts(ILjava/util/List;)V

    :cond_1
    :goto_0
    return-void
.end method
