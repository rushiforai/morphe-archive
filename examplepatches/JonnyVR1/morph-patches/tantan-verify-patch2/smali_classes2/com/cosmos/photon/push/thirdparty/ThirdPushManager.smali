.class public Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/thirdparty/ThirdPushManager$DefaultBridge;,
        Lcom/cosmos/photon/push/thirdparty/ThirdPushManager$SingletonHolder;
    }
.end annotation


# static fields
.field public static final TYPE_PUSH_FCM:I = 0x69

.field public static final TYPE_PUSH_HONOR:I = 0xa

.field public static final TYPE_PUSH_HUAWEI:I = 0x3

.field public static final TYPE_PUSH_MEIZU:I = 0x6

.field public static final TYPE_PUSH_MI:I = 0x1

.field public static final TYPE_PUSH_MI_OVERSEA:I = 0x7

.field public static final TYPE_PUSH_NONE:I = 0x0

.field public static final TYPE_PUSH_OPPO:I = 0x4

.field public static final TYPE_PUSH_VIVO:I = 0x5

.field public static final VENDOR_TYPE_FCM:Ljava/lang/String; = "Google"

.field public static final VENDOR_TYPE_HONOR:Ljava/lang/String; = "HONOR"

.field public static final VENDOR_TYPE_HUAWEI:Ljava/lang/String; = "Huawei"

.field public static final VENDOR_TYPE_MEIZU:Ljava/lang/String; = "MEIZU"

.field public static final VENDOR_TYPE_OPPO:Ljava/lang/String; = "Oppo"

.field public static final VENDOR_TYPE_VIVO:Ljava/lang/String; = "Vivo"

.field public static final VENDOR_TYPE_XIAOMI:Ljava/lang/String; = "Xiaomi"

.field public static final XIAOMI_OVERSEA_PREFIX:Ljava/lang/String; = "QiangGe_666_888_999"

.field private static fcmEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

.field private static mContext:Landroid/app/Application;

.field public static volatile mEnableFcmPush:Z

.field private static volatile mEnableHWPush:Z

.field private static volatile mEnableHonorPush:Z

.field private static volatile mEnableMeizuPush:Z

.field private static volatile mEnableMiPush:Z

.field private static volatile mEnableOPPOPush:Z

.field private static volatile mEnableVIVOPush:Z

.field private static pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager$SingletonHolder;->access$000()Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static getPushSdk()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableMiPush:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/RomUtil;->isMiui()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableFcmPush:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x7

    .line 16
    return v0

    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_1
    sget-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableHWPush:Z

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/RomUtil;->isEmui()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    sget-object v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mContext:Landroid/app/Application;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/huawei/HWPushEngine;->isSupport(Landroid/content/Context;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    return v0

    .line 39
    :cond_2
    sget-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableOPPOPush:Z

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/RomUtil;->isOppoSupport()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    sget-object v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mContext:Landroid/app/Application;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isSupport(Landroid/content/Context;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x4

    .line 58
    return v0

    .line 59
    :cond_3
    sget-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableVIVOPush:Z

    .line 60
    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/RomUtil;->isVivo()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    sget-object v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mContext:Landroid/app/Application;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->isSupport(Landroid/content/Context;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    const/4 v0, 0x5

    .line 78
    return v0

    .line 79
    :cond_4
    sget-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableMeizuPush:Z

    .line 80
    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/RomUtil;->isFlyme()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_5

    .line 88
    .line 89
    const/4 v0, 0x6

    .line 90
    return v0

    .line 91
    :cond_5
    sget-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableHonorPush:Z

    .line 92
    .line 93
    if-eqz v0, :cond_6

    .line 94
    .line 95
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/RomUtil;->isHonor()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    const/16 v0, 0xa

    .line 102
    .line 103
    return v0

    .line 104
    :cond_6
    const/4 v0, 0x0

    .line 105
    return v0
.end method

.method public static useThirdPush()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getPushSdk()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method


# virtual methods
.method public clearNotify()V
    .locals 0

    .line 1
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushEngine;->clearNotify()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->fcmEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushEngine;->clearNotify()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mContext:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/app/Application;)V
    .locals 7

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 115
    invoke-virtual/range {v0 .. v6}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->init(Landroid/app/Application;ZZZZZ)V

    return-void
.end method

.method public init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;)V
    .locals 8

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 111
    invoke-virtual/range {v0 .. v7}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZ)V

    return-void
.end method

.method public init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZ)V
    .locals 9

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    .line 113
    invoke-virtual/range {v0 .. v8}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZZ)V

    return-void
.end method

.method public init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZZ)V
    .locals 10

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    .line 114
    invoke-virtual/range {v0 .. v9}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZZZ)V

    return-void
.end method

.method public init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZZZ)V
    .locals 0

    .line 1
    sput-object p1, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mContext:Landroid/app/Application;

    .line 2
    .line 3
    sput-boolean p3, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableMiPush:Z

    .line 4
    .line 5
    sput-boolean p4, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableHWPush:Z

    .line 6
    .line 7
    sput-boolean p5, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableOPPOPush:Z

    .line 8
    .line 9
    sput-boolean p6, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableVIVOPush:Z

    .line 10
    .line 11
    sput-boolean p7, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableMeizuPush:Z

    .line 12
    .line 13
    sput-boolean p8, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableFcmPush:Z

    .line 14
    .line 15
    sput-boolean p9, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableHonorPush:Z

    .line 16
    .line 17
    invoke-static {p2}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->setBridge(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getPushSdk()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/4 p1, 0x1

    .line 25
    if-eq p0, p1, :cond_5

    .line 26
    .line 27
    const/16 p1, 0xa

    .line 28
    .line 29
    if-eq p0, p1, :cond_4

    .line 30
    .line 31
    const/4 p1, 0x3

    .line 32
    if-eq p0, p1, :cond_3

    .line 33
    .line 34
    const/4 p1, 0x4

    .line 35
    if-eq p0, p1, :cond_2

    .line 36
    .line 37
    const/4 p1, 0x5

    .line 38
    if-eq p0, p1, :cond_1

    .line 39
    .line 40
    const/4 p1, 0x6

    .line 41
    if-eq p0, p1, :cond_0

    .line 42
    .line 43
    const/4 p1, 0x7

    .line 44
    if-eq p0, p1, :cond_5

    .line 45
    .line 46
    const-string p0, "this device not support vendor push"

    .line 47
    .line 48
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    new-instance p0, Lcom/cosmos/photon/push/thirdparty/meizu/MeizuPushEngine;

    .line 53
    .line 54
    invoke-direct {p0, p2}, Lcom/cosmos/photon/push/thirdparty/meizu/MeizuPushEngine;-><init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 55
    .line 56
    .line 57
    sput-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    new-instance p0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;

    .line 61
    .line 62
    invoke-direct {p0, p2}, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;-><init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 63
    .line 64
    .line 65
    sput-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    new-instance p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;

    .line 69
    .line 70
    invoke-direct {p0, p2}, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;-><init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 71
    .line 72
    .line 73
    sput-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    new-instance p0, Lcom/cosmos/photon/push/thirdparty/huawei/HWPushEngine;

    .line 77
    .line 78
    invoke-direct {p0, p2}, Lcom/cosmos/photon/push/thirdparty/huawei/HWPushEngine;-><init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 79
    .line 80
    .line 81
    sput-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    new-instance p0, Lcom/immomo/push/thirdparty/honor/a;

    .line 85
    .line 86
    invoke-direct {p0, p2}, Lcom/immomo/push/thirdparty/honor/a;-><init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 87
    .line 88
    .line 89
    sput-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    new-instance p0, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;

    .line 93
    .line 94
    invoke-direct {p0, p2}, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;-><init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 95
    .line 96
    .line 97
    sput-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 98
    .line 99
    :goto_0
    sget-boolean p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableFcmPush:Z

    .line 100
    .line 101
    if-eqz p0, :cond_6

    .line 102
    .line 103
    new-instance p0, Lcom/cosmos/photon/push/thirdparty/fcm/FcmPushEngine;

    .line 104
    .line 105
    invoke-direct {p0, p2}, Lcom/cosmos/photon/push/thirdparty/fcm/FcmPushEngine;-><init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V

    .line 106
    .line 107
    .line 108
    sput-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->fcmEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 109
    .line 110
    :cond_6
    return-void
.end method

.method public init(Landroid/app/Application;ZZZZZ)V
    .locals 8

    .line 112
    new-instance v2, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager$DefaultBridge;

    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager$DefaultBridge;-><init>(Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;)V

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZ)V

    return-void
.end method

.method public register()V
    .locals 0

    .line 1
    const-string p0, "ThirdPushManager register"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushEngine;->register()V

    .line 11
    .line 12
    .line 13
    :cond_0
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->fcmEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushEngine;->register()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public unregister()V
    .locals 0

    .line 1
    const-string p0, "ThirdPushManager unregisterregister"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->pushEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushEngine;->unregister()V

    .line 11
    .line 12
    .line 13
    :cond_0
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->fcmEngine:Lcom/cosmos/photon/push/thirdparty/IPushEngine;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushEngine;->unregister()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method
