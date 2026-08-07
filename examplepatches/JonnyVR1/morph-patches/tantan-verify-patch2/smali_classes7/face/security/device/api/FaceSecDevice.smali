.class public Lface/security/device/api/FaceSecDevice;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lface/security/device/api/FaceSecDevice$DataSwitch;
    }
.end annotation


# static fields
.field public static NO_BASIC_DEVICE_DATA:I = 0x4

.field public static NO_EXTRA_DEVICE_DATA:I = 0x8

.field public static NO_IDENTIFY_DEVICE_DATA:I = 0x2

.field public static NO_PRIVACY_DATA:I = 0x10

.field public static NO_UNIQUE_DEVICE_DATA:I = 0x1

.field private static s_instance:Lface/security/device/api/FaceSecDevice;


# instance fields
.field private ctx:Landroid/content/Context;

.field private initThread:Ljava/lang/Thread;

.field private isInited:Z

.field private mpThread:Ljava/lang/Thread;

.field private otherThread:Ljava/lang/Thread;

.field private securityInitListener:Lface/security/device/api/FaceSecInitListener;

.field private userProductKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "facedevice"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lface/security/device/api/FaceSecDevice;

    .line 7
    .line 8
    invoke-direct {v0}, Lface/security/device/api/FaceSecDevice;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lface/security/device/api/FaceSecDevice;->s_instance:Lface/security/device/api/FaceSecDevice;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 6
    .line 7
    iput-object v0, p0, Lface/security/device/api/FaceSecDevice;->securityInitListener:Lface/security/device/api/FaceSecInitListener;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lface/security/device/api/FaceSecDevice;->isInited:Z

    .line 11
    .line 12
    iput-object v0, p0, Lface/security/device/api/FaceSecDevice;->initThread:Ljava/lang/Thread;

    .line 13
    .line 14
    iput-object v0, p0, Lface/security/device/api/FaceSecDevice;->otherThread:Ljava/lang/Thread;

    .line 15
    .line 16
    iput-object v0, p0, Lface/security/device/api/FaceSecDevice;->mpThread:Ljava/lang/Thread;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic access$000(Lface/security/device/api/FaceSecDevice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->runInitEx()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lface/security/device/api/FaceSecDevice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->otherThreadRun()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lface/security/device/api/FaceSecDevice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->mpThreadRun()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native ascRaw(Landroid/app/Activity;)V
.end method

.method private createSessionIdWithCode(ILjava/lang/String;)Lface/security/device/api/FaceSecSessionId;
    .locals 0

    .line 1
    new-instance p0, Lface/security/device/api/FaceSecSessionId;

    .line 2
    .line 3
    invoke-direct {p0}, Lface/security/device/api/FaceSecSessionId;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, p0, Lface/security/device/api/FaceSecSessionId;->code:I

    .line 7
    .line 8
    iput-object p2, p0, Lface/security/device/api/FaceSecSessionId;->sessionId:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method private native getBizSessionRaw(Ljava/lang/String;)Lface/security/device/api/FaceSecSession;
.end method

.method private getCtx()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getInstance()Lface/security/device/api/FaceSecDevice;
    .locals 1

    .line 1
    sget-object v0, Lface/security/device/api/FaceSecDevice;->s_instance:Lface/security/device/api/FaceSecDevice;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getRegIdByAppKey(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "Intl"

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object p1

    .line 17
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 18
    const/4 v2, 0x2

    .line 19
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/16 v2, 0xa

    .line 24
    .line 25
    const/16 v3, 0xc

    .line 26
    .line 27
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v2, "sh"

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const-string v3, "0"

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    const-string v2, "hs"

    .line 42
    .line 43
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-interface {p1, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_2
    const-string v2, "sg"

    .line 54
    .line 55
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    const-string v0, "gs"

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_3

    .line 68
    .line 69
    const-string p0, "1"

    .line 70
    .line 71
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    return-object p1

    .line 75
    :cond_3
    invoke-interface {p1, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    return-object p1
.end method

.method private native getSessionIdRaw()Lface/security/device/api/FaceSecSessionId;
.end method

.method private native getSessionRaw()Lface/security/device/api/FaceSecSession;
.end method

.method private static native getVersionRaw()Ljava/lang/String;
.end method

.method public static native gsRaw(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static gtam()J
    .locals 3

    .line 1
    :try_start_0
    const-class v0, Lface/security/device/api/FaceSecDevice;

    .line 2
    .line 3
    const-string v1, "reserved0"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lface/security/device/api/SecurityUtil;->getArtMethod(Ljava/lang/reflect/Member;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    return-wide v0

    .line 15
    :catch_0
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    return-wide v0
.end method

.method private initCommonEx(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lface/security/device/api/FaceSecInitListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lface/security/device/api/FaceSecInitListener;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    if-eqz p2, :cond_4

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x20

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-boolean v0, p0, Lface/security/device/api/FaceSecDevice;->isInited:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    if-eqz p4, :cond_5

    .line 19
    .line 20
    const/16 p0, 0x2710

    .line 21
    .line 22
    invoke-interface {p4, p0}, Lface/security/device/api/FaceSecInitListener;->onInitFinish(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lface/security/device/api/FaceSecDevice;->isInited:Z

    .line 28
    .line 29
    iput-object p2, p0, Lface/security/device/api/FaceSecDevice;->userProductKey:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 36
    .line 37
    iput-object p4, p0, Lface/security/device/api/FaceSecDevice;->securityInitListener:Lface/security/device/api/FaceSecInitListener;

    .line 38
    .line 39
    if-nez p3, :cond_2

    .line 40
    .line 41
    new-instance p3, Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-static {p2, p3}, Lface/security/device/api/FaceSecDevice;->getRegIdByAppKey(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string p3, "AppKey"

    .line 51
    .line 52
    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    :try_start_0
    iget-object p2, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 56
    .line 57
    invoke-direct {p0, p2, p1}, Lface/security/device/api/FaceSecDevice;->setOptionsRaw(Landroid/content/Context;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lface/security/device/api/SecurityUtil;->utilInit()V

    .line 61
    .line 62
    .line 63
    new-instance p2, Ljava/lang/Thread;

    .line 64
    .line 65
    new-instance p3, Lface/security/device/api/FaceSecDevice$1;

    .line 66
    .line 67
    invoke-direct {p3, p0}, Lface/security/device/api/FaceSecDevice$1;-><init>(Lface/security/device/api/FaceSecDevice;)V

    .line 68
    .line 69
    .line 70
    invoke-direct {p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    iput-object p2, p0, Lface/security/device/api/FaceSecDevice;->initThread:Ljava/lang/Thread;

    .line 74
    .line 75
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lface/security/device/api/FaceSecDevice;->otherThread:Ljava/lang/Thread;

    .line 79
    .line 80
    if-nez p2, :cond_3

    .line 81
    .line 82
    new-instance p2, Ljava/lang/Thread;

    .line 83
    .line 84
    new-instance p3, Lface/security/device/api/FaceSecDevice$2;

    .line 85
    .line 86
    invoke-direct {p3, p0}, Lface/security/device/api/FaceSecDevice$2;-><init>(Lface/security/device/api/FaceSecDevice;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 90
    .line 91
    .line 92
    iput-object p2, p0, Lface/security/device/api/FaceSecDevice;->otherThread:Ljava/lang/Thread;

    .line 93
    .line 94
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 95
    .line 96
    .line 97
    :cond_3
    invoke-direct {p0, p1}, Lface/security/device/api/FaceSecDevice;->isActiveMpThread(Ljava/util/Map;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    :goto_0
    if-eqz p4, :cond_5

    .line 102
    .line 103
    const/16 p0, 0x271a

    .line 104
    .line 105
    invoke-interface {p4, p0}, Lface/security/device/api/FaceSecInitListener;->onInitFinish(I)V

    .line 106
    .line 107
    .line 108
    :catch_0
    :cond_5
    return-void
.end method

.method private native initExFirstRaw(Landroid/content/Context;)I
.end method

.method private native initExSecondRaw(Landroid/content/Context;)I
.end method

.method private initIDs()V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "face.security.device.api.SecurityID"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "init"

    .line 8
    .line 9
    const-class v2, Landroid/content/Context;

    .line 10
    .line 11
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 20
    .line 21
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, v0, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    :catch_0
    return-void
.end method

.method private isActiveMpThread(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lface/security/device/api/FaceSecDevice$DataSwitch;->TOKEN_COLLECT_DATA:Lface/security/device/api/FaceSecDevice$DataSwitch;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "DataSwitch"

    .line 12
    .line 13
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lface/security/device/api/FaceSecDevice;->mp()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private native lpRaw(ILjava/lang/String;)V
.end method

.method private native lxRaw()V
.end method

.method private native mpRaw(Landroid/content/Context;)V
.end method

.method private mpThreadRun()V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->getCtx()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lface/security/device/api/FaceSecDevice;->mpRaw(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method private otherThreadRun()V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->getCtx()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lface/security/device/api/FaceSecDevice;->otiRaw(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method private native otiRaw(Landroid/content/Context;)V
.end method

.method private native reportUserDataRaw(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native reserved0()V
.end method

.method public static native reserved1()V
.end method

.method private runInitEx()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lface/security/device/api/FaceSecDevice;->initExFirstRaw(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lface/security/device/api/FaceSecDevice;->securityInitListener:Lface/security/device/api/FaceSecInitListener;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {v1, v0}, Lface/security/device/api/FaceSecInitListener;->onInitFinish(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v1, 0x0

    .line 15
    packed-switch v0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lface/security/device/api/FaceSecDevice;->initExSecondRaw(Landroid/content/Context;)I

    .line 21
    .line 22
    .line 23
    iput-boolean v1, p0, Lface/security/device/api/FaceSecDevice;->isInited:Z

    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_0
    iput-boolean v1, p0, Lface/security/device/api/FaceSecDevice;->isInited:Z
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    :catch_0
    return-void

    .line 29
    :pswitch_data_0
    .packed-switch 0x2719
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private native setOptionsRaw(Landroid/content/Context;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method


# virtual methods
.method public asc(Landroid/app/Activity;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lface/security/device/api/FaceSecDevice;->ctx:Landroid/content/Context;

    .line 12
    .line 13
    :cond_0
    invoke-static {p1}, Lface/security/device/api/FaceSecDevice;->ascRaw(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    return-void
.end method

.method public getDeviceToken()Lface/security/device/api/FaceSecToken;
    .locals 2

    .line 1
    :try_start_0
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->getSessionRaw()Lface/security/device/api/FaceSecSession;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lface/security/device/api/FaceSecToken;

    .line 6
    .line 7
    invoke-direct {v0}, Lface/security/device/api/FaceSecToken;-><init>()V

    .line 8
    .line 9
    .line 10
    iget v1, p0, Lface/security/device/api/FaceSecSession;->code:I

    .line 11
    .line 12
    iput v1, v0, Lface/security/device/api/FaceSecToken;->code:I

    .line 13
    .line 14
    iget-object p0, p0, Lface/security/device/api/FaceSecSession;->session:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p0, v0, Lface/security/device/api/FaceSecToken;->token:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return-object v0

    .line 19
    :catch_0
    new-instance p0, Lface/security/device/api/FaceSecToken;

    .line 20
    .line 21
    invoke-direct {p0}, Lface/security/device/api/FaceSecToken;-><init>()V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x271d

    .line 25
    .line 26
    iput v0, p0, Lface/security/device/api/FaceSecToken;->code:I

    .line 27
    .line 28
    const-string v0, ""

    .line 29
    .line 30
    iput-object v0, p0, Lface/security/device/api/FaceSecToken;->token:Ljava/lang/String;

    .line 31
    .line 32
    return-object p0
.end method

.method public getDeviceToken(Ljava/lang/String;)Lface/security/device/api/FaceSecToken;
    .locals 1

    .line 33
    :try_start_0
    invoke-direct {p0, p1}, Lface/security/device/api/FaceSecDevice;->getBizSessionRaw(Ljava/lang/String;)Lface/security/device/api/FaceSecSession;

    move-result-object p0

    .line 34
    new-instance p1, Lface/security/device/api/FaceSecToken;

    invoke-direct {p1}, Lface/security/device/api/FaceSecToken;-><init>()V

    .line 35
    iget v0, p0, Lface/security/device/api/FaceSecSession;->code:I

    iput v0, p1, Lface/security/device/api/FaceSecToken;->code:I

    .line 36
    iget-object p0, p0, Lface/security/device/api/FaceSecSession;->session:Ljava/lang/String;

    iput-object p0, p1, Lface/security/device/api/FaceSecToken;->token:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 37
    :catch_0
    new-instance p0, Lface/security/device/api/FaceSecToken;

    invoke-direct {p0}, Lface/security/device/api/FaceSecToken;-><init>()V

    const/16 p1, 0x271d

    .line 38
    iput p1, p0, Lface/security/device/api/FaceSecToken;->code:I

    .line 39
    const-string p1, ""

    iput-object p1, p0, Lface/security/device/api/FaceSecToken;->token:Ljava/lang/String;

    return-object p0
.end method

.method public getSession()Lface/security/device/api/FaceSecSession;
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->getSessionRaw()Lface/security/device/api/FaceSecSession;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    new-instance p0, Lface/security/device/api/FaceSecSession;

    .line 7
    .line 8
    invoke-direct {p0}, Lface/security/device/api/FaceSecSession;-><init>()V

    .line 9
    .line 10
    .line 11
    const/16 v0, 0x271d

    .line 12
    .line 13
    iput v0, p0, Lface/security/device/api/FaceSecSession;->code:I

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    iput-object v0, p0, Lface/security/device/api/FaceSecSession;->session:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0
.end method

.method public getSessionId()Lface/security/device/api/FaceSecSessionId;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    iget-boolean v1, p0, Lface/security/device/api/FaceSecDevice;->isInited:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const/16 v1, 0x2711

    .line 8
    .line 9
    invoke-direct {p0, v1, v0}, Lface/security/device/api/FaceSecDevice;->createSessionIdWithCode(ILjava/lang/String;)Lface/security/device/api/FaceSecSessionId;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->getSessionIdRaw()Lface/security/device/api/FaceSecSessionId;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return-object p0

    .line 19
    :catch_0
    const/16 v1, 0x271d

    .line 20
    .line 21
    invoke-direct {p0, v1, v0}, Lface/security/device/api/FaceSecDevice;->createSessionIdWithCode(ILjava/lang/String;)Lface/security/device/api/FaceSecSessionId;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Lface/security/device/api/FaceSecDevice;->getVersionRaw()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    const/16 p0, 0x271d

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Lface/security/device/api/FaceSecInitListener;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0, p3}, Lface/security/device/api/FaceSecDevice;->initCommonEx(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lface/security/device/api/FaceSecInitListener;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public initWithOptions(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lface/security/device/api/FaceSecInitListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lface/security/device/api/FaceSecInitListener;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lface/security/device/api/FaceSecDevice;->initCommonEx(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lface/security/device/api/FaceSecInitListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public lp(ILjava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2}, Lface/security/device/api/FaceSecDevice;->lpRaw(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public lx()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lface/security/device/api/FaceSecDevice;->lxRaw()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public mp()V
    .locals 2

    .line 1
    iget-object v0, p0, Lface/security/device/api/FaceSecDevice;->mpThread:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/Thread;

    .line 14
    .line 15
    new-instance v1, Lface/security/device/api/FaceSecDevice$3;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lface/security/device/api/FaceSecDevice$3;-><init>(Lface/security/device/api/FaceSecDevice;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lface/security/device/api/FaceSecDevice;->mpThread:Ljava/lang/Thread;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public reportUserData(ILjava/lang/String;)V
    .locals 0

    .line 1
    add-int/lit16 p1, p1, 0x2710

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1, p2}, Lface/security/device/api/FaceSecDevice;->reportUserDataRaw(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
