.class public Ll/i1k;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ll/uie;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p0}, Ll/uie;->f(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_0
    const-string p0, "video"

    .line 36
    .line 37
    invoke-static {p0}, Ll/ahe;->b(Ljava/lang/String;)Ll/k4;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v2, Ll/g4d0;

    .line 44
    .line 45
    invoke-direct {v2}, Ll/g4d0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0, v1, v2}, Ll/k4;->c(Ljava/lang/String;ZLl/y4m$a;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_1
    return v1
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 16
    .line 17
    filled-new-array {v1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/g1k;

    .line 36
    .line 37
    invoke-direct {v1, p1}, Ll/g1k;-><init>(Ll/x20;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ll/h1k;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/h1k;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static e(Landroid/view/View;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/i1k$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/i1k$a;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static f(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 3
    .line 4
    .line 5
    const/high16 v1, 0x100000

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/view/View;->setDrawingCacheQuality(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->getDrawingCache(Z)Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static g(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static h(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;)Ll/bkj0;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;",
            ")",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 2
    .line 3
    const-string v1, "outOfRank"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v2, 0x14

    .line 18
    .line 19
    if-le v0, v2, :cond_0

    .line 20
    .line 21
    const-string v0, "\u524d100\u540d"

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :catch_0
    move-exception v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v2, "\u7b2c%s\u540d"

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    goto :goto_1

    .line 41
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    const-string v0, "\u6392\u540d100+"

    .line 45
    .line 46
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    const-string v4, ""

    .line 57
    .line 58
    sparse-switch v3, :sswitch_data_0

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :goto_2
    :sswitch_0
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_3

    .line 67
    :sswitch_1
    const-string v1, "country"

    .line 68
    .line 69
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p0, v4, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :sswitch_2
    const-string v1, "district"

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :sswitch_3
    const-string v1, "city"

    .line 86
    .line 87
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p0, v4, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :sswitch_4
    const-string v1, "unknown_"

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :sswitch_5
    const-string v1, "province"

    .line 104
    .line 105
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {p0, v4, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :cond_2
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v1, p0, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0

    .line 127
    :sswitch_data_0
    .sparse-switch
        -0x3adbd4d0 -> :sswitch_5
        -0xe5022ab -> :sswitch_4
        0x2e996b -> :sswitch_3
        0x1139338e -> :sswitch_2
        0x39175796 -> :sswitch_1
        0x487b7391 -> :sswitch_0
    .end sparse-switch
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, ""

    .line 12
    .line 13
    invoke-static {p0, p2, p1, v0}, Landroid/provider/MediaStore$Images$Media;->insertImage(Landroid/content/ContentResolver;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    xor-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public static j(Landroid/graphics/Bitmap;Z)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "wx67f59443a9c801bb"

    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    invoke-interface {v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->D6:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return v2

    .line 32
    :cond_0
    new-instance v1, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;-><init>(Landroid/graphics/Bitmap;)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;->mediaObject:Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 43
    .line 44
    new-instance v1, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;

    .line 45
    .line 46
    invoke-direct {v1}, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p0, v1, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->message:Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    iput p0, v1, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iput v2, v1, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 58
    .line 59
    :goto_0
    invoke-interface {v0, v1}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/opensdk/modelbase/BaseReq;)Z

    .line 60
    .line 61
    .line 62
    return p0
.end method

.method public static k(Landroid/graphics/Bitmap;Z)Z
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v2, "wx67f59443a9c801bb"

    .line 9
    .line 10
    invoke-interface {v0, v2}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    invoke-interface {v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    const-string p0, "\u672a\u68c0\u6d4b\u5230\u53ef\u5206\u4eab\u5e73\u53f0"

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return v3

    .line 26
    :cond_0
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    .line 27
    .line 28
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 29
    .line 30
    .line 31
    :try_start_1
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 32
    .line 33
    const/16 v5, 0x32

    .line 34
    .line 35
    invoke-virtual {p0, v4, v5, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 36
    .line 37
    .line 38
    new-instance p0, Ljava/io/ByteArrayInputStream;

    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-direct {p0, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 45
    .line 46
    .line 47
    :try_start_2
    invoke-static {p0, v1, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    .line 57
    invoke-static {p0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :catchall_0
    move-exception p1

    .line 65
    move-object v1, p0

    .line 66
    goto :goto_4

    .line 67
    :catch_0
    move-exception v4

    .line 68
    move-object v6, v1

    .line 69
    move-object v1, p0

    .line 70
    move-object p0, v6

    .line 71
    goto :goto_0

    .line 72
    :catchall_1
    move-exception p1

    .line 73
    goto :goto_4

    .line 74
    :catch_1
    move-exception v4

    .line 75
    move-object p0, v1

    .line 76
    goto :goto_0

    .line 77
    :catchall_2
    move-exception p1

    .line 78
    move-object v2, v1

    .line 79
    goto :goto_4

    .line 80
    :catch_2
    move-exception v4

    .line 81
    move-object p0, v1

    .line 82
    move-object v2, p0

    .line 83
    :goto_0
    :try_start_3
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 90
    .line 91
    .line 92
    move-object v1, p0

    .line 93
    :goto_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    const/4 v2, 0x1

    .line 98
    if-eqz p0, :cond_2

    .line 99
    .line 100
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_2

    .line 105
    .line 106
    new-instance p0, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;

    .line 107
    .line 108
    invoke-direct {p0, v1}, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;-><init>(Landroid/graphics/Bitmap;)V

    .line 109
    .line 110
    .line 111
    new-instance v1, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;

    .line 112
    .line 113
    invoke-direct {v1}, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object p0, v1, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;->mediaObject:Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 117
    .line 118
    new-instance p0, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;

    .line 119
    .line 120
    invoke-direct {p0}, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;-><init>()V

    .line 121
    .line 122
    .line 123
    iput-object v1, p0, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->message:Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;

    .line 124
    .line 125
    const-string v1, "ab_share_profile"

    .line 126
    .line 127
    iput-object v1, p0, Lcom/tencent/mm/opensdk/modelbase/BaseReq;->transaction:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p1, :cond_1

    .line 130
    .line 131
    iput v2, p0, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_1
    iput v3, p0, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 135
    .line 136
    :goto_2
    invoke-interface {v0, p0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/opensdk/modelbase/BaseReq;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_2
    const-string p0, "\u5206\u4eab\u5931\u8d25"

    .line 141
    .line 142
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :goto_3
    return v2

    .line 146
    :goto_4
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 150
    .line 151
    .line 152
    throw p1
.end method
