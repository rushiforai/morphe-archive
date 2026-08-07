.class public Lcom/xiaomi/push/service/ac;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "NCHelper"

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/xiaomi/push/service/ac;->a:Z

    .line 9
    .line 10
    return-void
.end method

.method private static a(Landroid/app/NotificationChannel;)I
    .locals 4

    .line 334
    const-string v0, "isUserLockedChannel:"

    const/4 v1, 0x0

    .line 335
    :try_start_0
    const-string v2, "getUserLockedFields"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {p0, v2, v3}, Ll/otq0;->n(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 336
    sget-boolean v2, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v2, :cond_0

    .line 337
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception p0

    goto :goto_0

    :cond_0
    return v1

    .line 338
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "is user locked error"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "NCHelper"

    invoke-static {v0, p0}, Ll/ouq0;->n(Ljava/lang/String;Ljava/lang/String;)V

    return v1
.end method

.method private static a(Ljava/lang/String;Landroid/app/NotificationChannel;)Landroid/app/NotificationChannel;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 339
    invoke-static {}, Ll/hx3;->a()V

    invoke-static {p1}, Ll/q6k;->a(Landroid/app/NotificationChannel;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p1}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v1

    invoke-static {p0, v0, v1}, Ll/iy40;->a(Ljava/lang/String;Ljava/lang/CharSequence;I)Landroid/app/NotificationChannel;

    move-result-object p0

    .line 340
    invoke-static {p1}, Ll/osq0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Ll/a95;->a(Landroid/app/NotificationChannel;Ljava/lang/String;)V

    .line 341
    invoke-static {p1}, Ll/blb0;->a(Landroid/app/NotificationChannel;)Z

    move-result v0

    invoke-static {p0, v0}, Ll/qz40;->a(Landroid/app/NotificationChannel;Z)V

    .line 342
    invoke-static {p1}, Ll/lsq0;->a(Landroid/app/NotificationChannel;)Z

    move-result v0

    invoke-static {p0, v0}, Ll/msq0;->a(Landroid/app/NotificationChannel;Z)V

    .line 343
    invoke-static {p1}, Ll/nsq0;->a(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p1}, Ll/psq0;->a(Landroid/app/NotificationChannel;)Landroid/media/AudioAttributes;

    move-result-object v1

    invoke-static {p0, v0, v1}, Ll/aae;->a(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    .line 344
    invoke-static {p1}, Ll/clb0;->a(Landroid/app/NotificationChannel;)I

    move-result p1

    invoke-static {p0, p1}, Ll/i250;->a(Landroid/app/NotificationChannel;I)V

    return-object p0
.end method

.method private static a(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 357
    const-string v0, "mipush_channel_copy_sp"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/xiaomi/push/service/af;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 358
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/af;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 359
    sget-boolean v1, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v1, :cond_0

    .line 360
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "createChannel: appChannelId:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " serverChannelId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " serverChannelName:"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " serverChannelDesc:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " serverChannelNotifyType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " serverChannelImportance:"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " channelSoundStr:"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " channelPermissions:"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 361
    :cond_0
    invoke-static {v0, p2, p5}, Ll/iy40;->a(Ljava/lang/String;Ljava/lang/CharSequence;I)Landroid/app/NotificationChannel;

    move-result-object p1

    .line 362
    invoke-static {p1, p3}, Ll/a95;->a(Landroid/app/NotificationChannel;Ljava/lang/String;)V

    and-int/lit8 p2, p4, 0x2

    const/4 p3, 0x0

    const/4 p5, 0x1

    if-eqz p2, :cond_1

    move p2, p5

    goto :goto_0

    :cond_1
    move p2, p3

    .line 363
    :goto_0
    invoke-static {p1, p2}, Ll/qz40;->a(Landroid/app/NotificationChannel;Z)V

    and-int/lit8 p2, p4, 0x4

    if-eqz p2, :cond_2

    move p3, p5

    .line 364
    :cond_2
    invoke-static {p1, p3}, Ll/msq0;->a(Landroid/app/NotificationChannel;Z)V

    and-int/lit8 p2, p4, 0x1

    if-eqz p2, :cond_3

    .line 365
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "android.resource://"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 366
    invoke-virtual {p0}, Lcom/xiaomi/push/service/af;->a()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p6, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 367
    invoke-static {p6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    sget-object p3, Landroid/app/Notification;->AUDIO_ATTRIBUTES_DEFAULT:Landroid/media/AudioAttributes;

    invoke-static {p1, p2, p3}, Ll/aae;->a(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    goto :goto_1

    :cond_3
    const/4 p2, 0x0

    .line 368
    invoke-static {p1, p2, p2}, Ll/aae;->a(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    .line 369
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "create channel:"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 370
    :cond_5
    invoke-static {p0, p1, p7}, Lcom/xiaomi/push/service/ac;->a(Lcom/xiaomi/push/service/af;Landroid/app/NotificationChannel;Ljava/lang/String;)V

    return-object v0
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/service/af;Landroid/app/NotificationChannel;ILjava/lang/String;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    if-lez p3, :cond_a

    .line 384
    invoke-static {p0}, Lcom/xiaomi/push/g;->a(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 385
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p4}, Lcom/xiaomi/push/service/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    goto :goto_0

    :cond_0
    move p0, v2

    .line 386
    :goto_0
    invoke-static {p2}, Ll/hlb0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4, p2}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;Landroid/app/NotificationChannel;)Landroid/app/NotificationChannel;

    move-result-object p4

    and-int/lit8 v0, p3, 0x20

    if-eqz v0, :cond_2

    .line 387
    invoke-static {p2}, Ll/nsq0;->a(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 388
    invoke-static {p4, v0, v0}, Ll/aae;->a(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    goto :goto_1

    .line 389
    :cond_1
    sget-object v0, Landroid/provider/Settings$System;->DEFAULT_NOTIFICATION_URI:Landroid/net/Uri;

    sget-object v3, Landroid/app/Notification;->AUDIO_ATTRIBUTES_DEFAULT:Landroid/media/AudioAttributes;

    invoke-static {p4, v0, v3}, Ll/aae;->a(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    :cond_2
    :goto_1
    and-int/lit8 v0, p3, 0x10

    const/4 v3, 0x1

    if-eqz v0, :cond_4

    .line 390
    invoke-static {p2}, Ll/blb0;->a(Landroid/app/NotificationChannel;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 391
    invoke-static {p4, v2}, Ll/qz40;->a(Landroid/app/NotificationChannel;Z)V

    goto :goto_2

    .line 392
    :cond_3
    invoke-static {p4, v3}, Ll/qz40;->a(Landroid/app/NotificationChannel;Z)V

    :cond_4
    :goto_2
    and-int/lit8 v0, p3, 0x8

    if-eqz v0, :cond_6

    .line 393
    invoke-static {p2}, Ll/lsq0;->a(Landroid/app/NotificationChannel;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 394
    invoke-static {p4, v2}, Ll/msq0;->a(Landroid/app/NotificationChannel;Z)V

    goto :goto_3

    .line 395
    :cond_5
    invoke-static {p4, v3}, Ll/msq0;->a(Landroid/app/NotificationChannel;Z)V

    :cond_6
    :goto_3
    and-int/lit8 v0, p3, 0x4

    if-eqz v0, :cond_8

    .line 396
    invoke-static {p2}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v0

    sub-int/2addr v0, v3

    if-gtz v0, :cond_7

    move v0, v1

    .line 397
    :cond_7
    invoke-static {p4, v0}, Ll/rz40;->a(Landroid/app/NotificationChannel;I)V

    :cond_8
    and-int/2addr p3, v1

    if-eqz p3, :cond_9

    .line 398
    invoke-static {p2}, Ll/clb0;->a(Landroid/app/NotificationChannel;)I

    move-result p3

    sub-int/2addr p3, v3

    .line 399
    invoke-static {p4, p3}, Ll/i250;->a(Landroid/app/NotificationChannel;I)V

    .line 400
    :cond_9
    invoke-virtual {p1, p4}, Lcom/xiaomi/push/service/af;->a(Landroid/app/NotificationChannel;)V

    .line 401
    invoke-virtual {p1, p2, v3}, Lcom/xiaomi/push/service/af;->a(Landroid/app/NotificationChannel;Z)V

    .line 402
    invoke-virtual {p1}, Lcom/xiaomi/push/service/af;->a()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Ll/hlb0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p0, v2}, Lcom/xiaomi/push/service/f;->a(Ljava/lang/String;Ljava/lang/String;II)V

    return-void

    .line 403
    :cond_a
    invoke-virtual {p1, p2}, Lcom/xiaomi/push/service/af;->a(Landroid/app/NotificationChannel;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 372
    invoke-static {p0}, Ll/l4r0;->j(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 373
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/ac;->c(Landroid/content/Context;Ljava/lang/String;)V

    .line 374
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/f;->a(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private static a(Landroid/content/Context;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 350
    sget-boolean v0, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v0, :cond_0

    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "deleteCopiedChannelRecord:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 352
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 353
    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 354
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 355
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 356
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2
    return-void
.end method

.method public static a(Lcom/xiaomi/push/gs;)V
    .locals 3

    if-eqz p0, :cond_0

    .line 375
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    if-eqz v0, :cond_0

    const-string v1, "REMOVE_CHANNEL_MARK"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 376
    iput v0, p0, Lcom/xiaomi/push/gs;->a:I

    .line 377
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    const-string v2, "channel_id"

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    const-string v2, "channel_importance"

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    const-string v2, "channel_name"

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    const-string v2, "channel_description"

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    const-string v2, "channel_perm"

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "delete channel info by:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 383
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    invoke-interface {p0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/af;Landroid/app/NotificationChannel;Ljava/lang/String;)V
    .locals 13
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/service/af;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/hlb0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-virtual {p0}, Lcom/xiaomi/push/service/af;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v3, v1}, Lcom/xiaomi/push/service/af;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-boolean v2, Lcom/xiaomi/push/service/ac;->a:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    new-instance v4, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v5, "appChannelId:"

    .line 24
    .line 25
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v5, " oldChannelId:"

    .line 32
    .line 33
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-static {v4}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-static {v0}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    const/4 v5, 0x4

    .line 51
    const/4 v6, 0x3

    .line 52
    const/4 v7, 0x1

    .line 53
    const/4 v8, 0x0

    .line 54
    if-eqz v4, :cond_a

    .line 55
    .line 56
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-nez v4, :cond_a

    .line 61
    .line 62
    const-string v4, "notification"

    .line 63
    .line 64
    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Landroid/app/NotificationManager;

    .line 69
    .line 70
    invoke-static {v4, v1}, Ll/ey40;->a(Landroid/app/NotificationManager;Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    invoke-virtual {p0, v3}, Lcom/xiaomi/push/service/af;->a(Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    if-eqz v2, :cond_1

    .line 79
    .line 80
    new-instance v11, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v12, "xmsfChannel:"

    .line 83
    .line 84
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v11

    .line 94
    invoke-static {v11}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    new-instance v11, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v12, "appChannel:"

    .line 100
    .line 101
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v11

    .line 111
    invoke-static {v11}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_1
    if-eqz v9, :cond_5

    .line 115
    .line 116
    invoke-static {v3, v9}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;Landroid/app/NotificationChannel;)Landroid/app/NotificationChannel;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    if-eqz v2, :cond_2

    .line 121
    .line 122
    new-instance v2, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v12, "copyXmsf copyXmsfChannel:"

    .line 125
    .line 126
    invoke-direct {v2, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v2}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_2
    if-eqz v10, :cond_4

    .line 140
    .line 141
    invoke-static {v10}, Lcom/xiaomi/push/service/ac;->a(Landroid/app/NotificationChannel;)I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-nez v2, :cond_3

    .line 146
    .line 147
    move v9, v7

    .line 148
    goto :goto_0

    .line 149
    :cond_3
    move v9, v8

    .line 150
    :goto_0
    invoke-virtual {p0, v11, v9}, Lcom/xiaomi/push/service/af;->a(Landroid/app/NotificationChannel;Z)V

    .line 151
    .line 152
    .line 153
    move v9, v6

    .line 154
    goto :goto_1

    .line 155
    :cond_4
    invoke-static {v9}, Lcom/xiaomi/push/service/ac;->a(Landroid/app/NotificationChannel;)I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    invoke-static {v9}, Ll/hlb0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    invoke-static {v0, p0, v11, v2, v9}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;Lcom/xiaomi/push/service/af;Landroid/app/NotificationChannel;ILjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    move v9, v5

    .line 167
    :goto_1
    invoke-static {v0, v3}, Lcom/xiaomi/push/service/ac;->b(Landroid/content/Context;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v4, v1}, Ll/g250;->a(Landroid/app/NotificationManager;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    goto/16 :goto_3

    .line 174
    .line 175
    :cond_5
    if-eqz v10, :cond_8

    .line 176
    .line 177
    invoke-static {v0, v3}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_c

    .line 182
    .line 183
    invoke-static {p1, v10}, Lcom/xiaomi/push/service/ac;->a(Landroid/app/NotificationChannel;Landroid/app/NotificationChannel;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-eqz v0, :cond_c

    .line 188
    .line 189
    if-eqz v2, :cond_6

    .line 190
    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string v1, "appHack updateNotificationChannel:"

    .line 194
    .line 195
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-static {v0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :cond_6
    invoke-static {v10}, Lcom/xiaomi/push/service/ac;->a(Landroid/app/NotificationChannel;)I

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-nez v2, :cond_7

    .line 213
    .line 214
    move v0, v7

    .line 215
    goto :goto_2

    .line 216
    :cond_7
    move v0, v8

    .line 217
    :goto_2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/service/af;->a(Landroid/app/NotificationChannel;Z)V

    .line 218
    .line 219
    .line 220
    const/4 v9, 0x2

    .line 221
    goto :goto_3

    .line 222
    :cond_8
    if-eqz v2, :cond_9

    .line 223
    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    const-string v1, "appHack createNotificationChannel:"

    .line 227
    .line 228
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-static {v0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    :cond_9
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/af;->a(Landroid/app/NotificationChannel;)V

    .line 242
    .line 243
    .line 244
    move v9, v7

    .line 245
    move v2, v8

    .line 246
    goto :goto_3

    .line 247
    :cond_a
    invoke-virtual {p0, v3}, Lcom/xiaomi/push/service/af;->a(Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    if-eqz v2, :cond_b

    .line 252
    .line 253
    new-instance v1, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    const-string v2, "elseLogic getNotificationChannel:"

    .line 256
    .line 257
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-static {v1}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    :cond_b
    if-nez v0, :cond_c

    .line 271
    .line 272
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/af;->a(Landroid/app/NotificationChannel;)V

    .line 273
    .line 274
    .line 275
    :cond_c
    move v2, v8

    .line 276
    move v9, v2

    .line 277
    :goto_3
    if-eq v9, v7, :cond_e

    .line 278
    .line 279
    if-eq v9, v5, :cond_e

    .line 280
    .line 281
    if-ne v9, v6, :cond_d

    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_d
    move v6, v8

    .line 285
    goto :goto_5

    .line 286
    :cond_e
    :goto_4
    move v6, v7

    .line 287
    :goto_5
    invoke-virtual {p0}, Lcom/xiaomi/push/service/af;->a()Landroid/content/Context;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {p0}, Lcom/xiaomi/push/service/af;->a()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-static {p1}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    .line 296
    .line 297
    .line 298
    move-result v4

    .line 299
    move-object v5, p2

    .line 300
    move v7, v2

    .line 301
    move-object v2, p0

    .line 302
    invoke-static/range {v1 .. v7}, Lcom/xiaomi/push/service/f;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZI)V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method private static a(Ljava/lang/String;)V
    .locals 1

    .line 371
    const-string v0, "NCHelper"

    invoke-static {v0, p0}, Ll/ouq0;->n(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static a(Landroid/app/NotificationChannel;Landroid/app/NotificationChannel;)Z
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_10

    if-nez p1, :cond_0

    goto/16 :goto_4

    .line 306
    :cond_0
    invoke-static {p0}, Ll/q6k;->a(Landroid/app/NotificationChannel;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {p1}, Ll/q6k;->a(Landroid/app/NotificationChannel;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_2

    .line 307
    sget-boolean v1, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v1, :cond_1

    .line 308
    const-string v1, "appHack channelConfigLowerCompare:getName"

    invoke-static {v1}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    :cond_1
    move v1, v2

    goto :goto_0

    :cond_2
    move v1, v0

    .line 309
    :goto_0
    invoke-static {p0}, Ll/osq0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Ll/osq0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 310
    sget-boolean v1, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v1, :cond_3

    .line 311
    const-string v1, "appHack channelConfigLowerCompare:getDescription"

    invoke-static {v1}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    :cond_3
    move v1, v2

    .line 312
    :cond_4
    invoke-static {p0}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v3

    invoke-static {p1}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v4

    if-eq v3, v4, :cond_6

    .line 313
    invoke-static {p0}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v1

    invoke-static {p1}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p0, v1}, Ll/rz40;->a(Landroid/app/NotificationChannel;I)V

    .line 314
    sget-boolean v1, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v1, :cond_5

    .line 315
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "appHack channelConfigLowerCompare:getImportance  "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 316
    invoke-static {p0}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    invoke-static {p1}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 318
    invoke-static {v1}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    :cond_5
    move v1, v2

    .line 319
    :cond_6
    invoke-static {p0}, Ll/blb0;->a(Landroid/app/NotificationChannel;)Z

    move-result v3

    invoke-static {p1}, Ll/blb0;->a(Landroid/app/NotificationChannel;)Z

    move-result v4

    if-eq v3, v4, :cond_8

    .line 320
    invoke-static {p0, v0}, Ll/qz40;->a(Landroid/app/NotificationChannel;Z)V

    .line 321
    sget-boolean v1, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v1, :cond_7

    .line 322
    const-string v1, "appHack channelConfigLowerCompare:enableVibration"

    invoke-static {v1}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    :cond_7
    move v1, v2

    .line 323
    :cond_8
    invoke-static {p0}, Ll/lsq0;->a(Landroid/app/NotificationChannel;)Z

    move-result v3

    invoke-static {p1}, Ll/lsq0;->a(Landroid/app/NotificationChannel;)Z

    move-result v4

    if-eq v3, v4, :cond_a

    .line 324
    invoke-static {p0, v0}, Ll/msq0;->a(Landroid/app/NotificationChannel;Z)V

    .line 325
    sget-boolean v1, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz v1, :cond_9

    .line 326
    const-string v1, "appHack channelConfigLowerCompare:enableLights"

    invoke-static {v1}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    :cond_9
    move v1, v2

    .line 327
    :cond_a
    invoke-static {p0}, Ll/nsq0;->a(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object v3

    if-nez v3, :cond_b

    move v3, v0

    goto :goto_1

    :cond_b
    move v3, v2

    .line 328
    :goto_1
    invoke-static {p1}, Ll/nsq0;->a(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_c

    goto :goto_2

    :cond_c
    move v0, v2

    :goto_2
    if-eq v3, v0, :cond_d

    const/4 p1, 0x0

    .line 329
    invoke-static {p0, p1, p1}, Ll/aae;->a(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    .line 330
    sget-boolean p0, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz p0, :cond_e

    .line 331
    const-string p0, "appHack channelConfigLowerCompare:setSound"

    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    goto :goto_3

    :cond_d
    move v2, v1

    .line 332
    :cond_e
    :goto_3
    sget-boolean p0, Lcom/xiaomi/push/service/ac;->a:Z

    if-eqz p0, :cond_f

    .line 333
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "appHack channelConfigLowerCompare:isDifferent:"

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    :cond_f
    return v2

    :cond_10
    :goto_4
    return v0
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 345
    sget-boolean v0, Lcom/xiaomi/push/service/ac;->a:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 346
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "checkCopeidChannel:newFullChannelId:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "  "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 348
    invoke-static {v0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 349
    :cond_0
    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/xiaomi/push/service/ac;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "recordCopiedChannel:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private static c(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    .line 1
    :try_start_0
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/af;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/push/service/af;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, v2}, Lcom/xiaomi/push/service/af;->a(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_0

    .line 43
    .line 44
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-boolean v3, Lcom/xiaomi/push/service/ac;->a:Z

    .line 48
    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v4, "delete channel copy record:"

    .line 57
    .line 58
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {v2}, Lcom/xiaomi/push/service/ac;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-static {p0, v1}, Lcom/xiaomi/push/service/ac;->a(Landroid/content/Context;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    :catch_0
    return-void
.end method
