.class public Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static sInstance:Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "utility"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;
    .locals 2

    .line 1
    const-class v0, Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;->sInstance:Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;->sInstance:Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;->sInstance:Lcom/sina/weibo/wcfc/sobusiness/UtilitySo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method


# virtual methods
.method public native calculateS(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native generateCheckToken(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native getDecryptionString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native getIValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
.end method
