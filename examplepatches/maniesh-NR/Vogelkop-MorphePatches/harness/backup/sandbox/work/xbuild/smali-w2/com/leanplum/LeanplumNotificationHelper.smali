.class Lcom/leanplum/LeanplumNotificationHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;
    }
.end annotation


# static fields
.field private static final LEANPLUM_DEFAULT_PUSH_ICON:Ljava/lang/String; = "leanplum_default_push_icon"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static areNotificationsEnabled(Landroid/content/Context;Landroid/os/Bundle;)Z
    .registers 5

    new-instance v0, Ll2f;

    invoke-direct {v0, p0}, Ll2f;-><init>(Landroid/content/Context;)V

    iget-object v0, v0, Ll2f;->b:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->areNotificationsEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_f

    return v1

    :cond_f
    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_28

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationHelper;->resolveChannelId(Landroid/content/Context;Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_27

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationHelper;->isChannelEnabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_27

    return v2

    :cond_27
    return v1

    :cond_28
    return v2
.end method

.method private static canCreateIconDrawable(Landroid/content/Context;)Z
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0

    const-string v0, "applicationInfo.icon"

    invoke-static {p0, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_18

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :catchall_18
    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public static getBigPictureBitmap(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_16

    invoke-static {p0, p1}, Lcom/leanplum/utils/BitmapUtil;->getScaledBitmap(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    if-nez p0, :cond_15

    const-string v0, "Failed to download image for push notification: %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_15
    return-object p0

    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getBigPictureStyle(Landroid/os/Bundle;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification$BigPictureStyle;
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    if-eqz p0, :cond_16

    if-eqz p1, :cond_16

    new-instance p0, Landroid/app/Notification$BigPictureStyle;

    invoke-direct {p0}, Landroid/app/Notification$BigPictureStyle;-><init>()V

    invoke-virtual {p0, p1}, Landroid/app/Notification$BigPictureStyle;->bigPicture(Landroid/graphics/Bitmap;)Landroid/app/Notification$BigPictureStyle;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/app/Notification$BigPictureStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigPictureStyle;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/app/Notification$BigPictureStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigPictureStyle;

    move-result-object p0

    return-object p0

    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getDefaultCompatNotificationBuilder(Landroid/content/Context;Z)Ll1f;
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_9

    new-instance p1, Ll1f;

    invoke-direct {p1, p0, v0}, Ll1f;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object p1

    :cond_9
    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationChannel;->getDefaultNotificationChannelId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_19

    new-instance v0, Ll1f;

    invoke-direct {v0, p0, p1}, Ll1f;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0

    :cond_19
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "Failed to post notification, there are no notification channels configured."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private static getDefaultNotificationBuilder(Landroid/content/Context;Z)Landroid/app/Notification$Builder;
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    if-nez p1, :cond_8

    new-instance p1, Landroid/app/Notification$Builder;

    invoke-direct {p1, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    return-object p1

    :cond_8
    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationChannel;->getDefaultNotificationChannelId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18

    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0

    :cond_18
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "Failed to post notification, there are no notification channels configured."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static getDefaultPushNotificationIconResourceId(Landroid/content/Context;)I
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "leanplum_default_push_icon"

    const-string v2, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0
    :try_end_10
    .catchall {:try_start_0 .. :try_end_10} :catchall_11

    return p0

    :catchall_11
    const/4 p0, 0x0

    return p0
.end method

.method public static getLargeIconBitmap(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_28

    const v0, 0x1050005

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const v1, 0x1050006

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    invoke-static {p1, v0, p0}, Lcom/leanplum/utils/BitmapUtil;->getScaledBitmap(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object p0

    if-nez p0, :cond_27

    const-string v0, "Failed to download large icon for push notification: %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_27
    return-object p0

    :cond_28
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getNotificationBuilder(Landroid/content/Context;Landroid/os/Bundle;)Landroid/app/Notification$Builder;
    .registers 6

    .line 81
    const-string v0, "Failed to post notification to specified channel."

    .line 82
    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3c

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 83
    :try_start_a
    const-string v3, "lp_channel"

    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 84
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_30

    .line 85
    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    .line 86
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationChannel;->createNotificationChannel(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    .line 87
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 88
    new-instance v3, Landroid/app/Notification$Builder;

    invoke-direct {v3, p0, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v3

    .line 89
    :cond_2a
    new-array p0, v1, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2

    :cond_30
    const/4 p1, 0x1

    .line 90
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationHelper;->getDefaultNotificationBuilder(Landroid/content/Context;Z)Landroid/app/Notification$Builder;

    move-result-object p0
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_35} :catch_36

    return-object p0

    .line 91
    :catch_36
    new-array p0, v1, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2

    .line 92
    :cond_3c
    new-instance p1, Landroid/app/Notification$Builder;

    invoke-direct {p1, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public static getNotificationBuilder(Landroid/content/Context;Landroid/os/Bundle;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;ILcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)Landroid/app/Notification$Builder;
    .registers 8

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationHelper;->getNotificationBuilder(Landroid/content/Context;Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    move-result-object p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    if-nez p6, :cond_14

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p6

    iget p6, p6, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {p1, p6}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    goto :goto_17

    :cond_14
    invoke-virtual {p1, p6}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    :goto_17
    invoke-virtual {p1, p3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p3

    invoke-virtual {p3, p4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p3

    invoke-virtual {p3, p5}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    new-instance p3, Landroid/app/Notification$BigTextStyle;

    invoke-direct {p3}, Landroid/app/Notification$BigTextStyle;-><init>()V

    invoke-virtual {p3, p4}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_38

    const/4 p0, 0x2

    invoke-virtual {p1, p0}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    :cond_38
    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    invoke-virtual {p1, p2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    invoke-static {}, Lcom/leanplum/LeanplumNotificationHelper;->isGroupingSupported()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_50

    if-eqz p7, :cond_50

    iget-object p0, p7, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->key:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    :cond_50
    return-object p1
.end method

.method public static getNotificationCompatBuilder(Landroid/content/Context;Landroid/os/Bundle;)Ll1f;
    .registers 6

    .line 117
    const-string v0, "Failed to post notification to specified channel."

    .line 118
    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3c

    const/4 v1, 0x0

    .line 119
    :try_start_a
    const-string v3, "lp_channel"

    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 120
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_30

    .line 121
    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    .line 122
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationChannel;->createNotificationChannel(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    .line 123
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 124
    new-instance v3, Ll1f;

    invoke-direct {v3, p0, p1}, Ll1f;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v3

    .line 125
    :cond_2a
    new-array p0, v1, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2

    :cond_30
    const/4 p1, 0x1

    .line 126
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationHelper;->getDefaultCompatNotificationBuilder(Landroid/content/Context;Z)Ll1f;

    move-result-object p0
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_35} :catch_36

    return-object p0

    .line 127
    :catch_36
    new-array p0, v1, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2

    .line 128
    :cond_3c
    new-instance p1, Ll1f;

    .line 129
    invoke-direct {p1, p0, v2}, Ll1f;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object p1
.end method

.method public static getNotificationCompatBuilder(Landroid/content/Context;Landroid/os/Bundle;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;ILcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)Ll1f;
    .registers 11

    if-eqz p1, :cond_8

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationHelper;->getNotificationCompatBuilder(Landroid/content/Context;Landroid/os/Bundle;)Ll1f;

    move-result-object p1

    if-nez p1, :cond_a

    :cond_8
    const/4 p0, 0x0

    return-object p0

    :cond_a
    iget-object v0, p1, Ll1f;->G:Landroid/app/Notification;

    if-nez p7, :cond_17

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p7

    iget p7, p7, Landroid/content/pm/ApplicationInfo;->icon:I

    iput p7, v0, Landroid/app/Notification;->icon:I

    goto :goto_19

    :cond_17
    iput p7, v0, Landroid/app/Notification;->icon:I

    :goto_19
    invoke-static {p3}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p7

    iput-object p7, p1, Ll1f;->e:Ljava/lang/CharSequence;

    new-instance p7, Lg1f;

    const/4 v0, 0x0

    invoke-direct {p7, v0}, Ln1f;-><init>(B)V

    invoke-static {p4}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p7, Lg1f;->e:Ljava/lang/CharSequence;

    invoke-virtual {p1, p7}, Ll1f;->j(Ln1f;)V

    invoke-static {p4}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p7

    iput-object p7, p1, Ll1f;->f:Ljava/lang/CharSequence;

    invoke-virtual {p1, p5}, Ll1f;->i(Landroid/graphics/Bitmap;)V

    const/4 p5, 0x1

    if-eqz p6, :cond_56

    new-instance p7, Lf1f;

    invoke-direct {p7, v0}, Ln1f;-><init>(B)V

    invoke-static {p6}, Landroidx/core/graphics/drawable/IconCompat;->b(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object p6

    iput-object p6, p7, Lf1f;->e:Landroidx/core/graphics/drawable/IconCompat;

    invoke-static {p3}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p3

    iput-object p3, p7, Ln1f;->c:Ljava/lang/Object;

    invoke-static {p4}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p3

    iput-object p3, p7, Ln1f;->d:Ljava/lang/Object;

    iput-boolean p5, p7, Ln1f;->a:Z

    invoke-virtual {p1, p7}, Ll1f;->j(Ln1f;)V

    :cond_56
    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_5f

    const/4 p0, 0x2

    iput p0, p1, Ll1f;->j:I

    :cond_5f
    invoke-virtual {p1, p5}, Ll1f;->d(Z)V

    iput-object p2, p1, Ll1f;->g:Landroid/app/PendingIntent;

    invoke-static {}, Lcom/leanplum/LeanplumNotificationHelper;->isGroupingSupported()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_74

    if-eqz p8, :cond_74

    iget-object p0, p8, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->key:Ljava/lang/String;

    iput-object p0, p1, Ll1f;->r:Ljava/lang/String;

    :cond_74
    return-object p1
.end method

.method public static getNotificationGroupInfo(Ljava/lang/String;)Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;
    .registers 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-static {}, Lcom/leanplum/LeanplumNotificationHelper;->isGroupingSupported()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_c

    return-object v1

    :cond_c
    const/4 v0, 0x0

    :try_start_d
    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    if-nez p0, :cond_14

    return-object v1

    :cond_14
    const-string v2, "tag"

    invoke-static {p0, v2, v1}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "key"

    invoke-static {p0, v3, v1}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_27

    return-object v1

    :cond_27
    const-string v4, "id"

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p0, v4, v5}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v5, "min_notifications"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v5, v6}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    new-instance v5, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;

    invoke-direct {v5, v2, v4, v3, p0}, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;-><init>(Ljava/lang/String;ILjava/lang/String;I)V
    :try_end_50
    .catchall {:try_start_d .. :try_end_50} :catchall_51

    return-object v5

    :catchall_51
    const-string p0, "Failed to parse group info."

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1
.end method

.method public static getNumberOfActiveNotifications(Landroid/app/NotificationManager;Ljava/lang/String;)I
    .registers 6
    .param p0    # Landroid/app/NotificationManager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/app/NotificationManager;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    if-ge v1, v0, :cond_1e

    aget-object v3, p0, v1

    invoke-virtual {v3}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    add-int/lit8 v2, v2, 0x1

    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1e
    return v2
.end method

.method public static isApplicationIconValid(Landroid/content/Context;)Z
    .registers 1

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationHelper;->canCreateIconDrawable(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method private static isChannelEnabled(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3

    new-instance v0, Ll2f;

    invoke-direct {v0, p0}, Ll2f;-><init>(Landroid/content/Context;)V

    iget-object p0, v0, Ll2f;->b:Landroid/app/NotificationManager;

    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Landroid/app/NotificationChannel;->getImportance()I

    move-result p0

    if-lez p0, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public static isGroupingSupported()Ljava/lang/Boolean;
    .registers 1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0
.end method

.method private static resolveChannelId(Landroid/content/Context;Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3

    const-string v0, "lp_channel"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    const-string v0, "id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1f

    return-object p1

    :cond_1f
    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationChannel;->getDefaultNotificationChannelId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2a

    return-object p0

    :cond_2a
    const/4 p0, 0x0

    return-object p0
.end method

.method public static scheduleJobService(Landroid/content/Context;Ljava/lang/Class;I)V
    .registers 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    if-eqz p0, :cond_2b

    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p0, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p1, "jobscheduler"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    if-eqz p0, :cond_2b

    invoke-virtual {p0}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/leanplum/LeanplumNotificationHelper;->verifyJobId(Ljava/util/List;I)I

    move-result p1

    new-instance p2, Landroid/app/job/JobInfo$Builder;

    invoke-direct {p2, p1, v0}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const-wide/16 v0, 0xa

    invoke-virtual {p2, v0, v1}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    :cond_2b
    return-void
.end method

.method public static setModifiedBigPictureStyle(Landroid/app/Notification$Builder;Landroid/app/Notification$Style;)V
    .registers 2

    if-eqz p0, :cond_7

    if-eqz p1, :cond_7

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    :cond_7
    return-void
.end method

.method private static verifyJobId(Ljava/util/List;I)I
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/app/job/JobInfo;",
            ">;I)I"
        }
    .end annotation

    if-eqz p0, :cond_7b

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7b

    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/job/JobInfo;

    invoke-virtual {v1}, Landroid/app/job/JobInfo;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7b

    invoke-virtual {v0}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/high16 v1, -0x80000000

    if-le p0, v1, :cond_4e

    invoke-virtual {v0}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    return p0

    :cond_4e
    invoke-virtual {v0}, Ljava/util/TreeSet;->last()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-ge p0, v1, :cond_67

    invoke-virtual {v0}, Ljava/util/TreeSet;->last()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0

    :cond_67
    :goto_67
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7b

    new-instance p0, Ljava/util/Random;

    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    invoke-virtual {p0}, Ljava/util/Random;->nextInt()I

    move-result p1

    goto :goto_67

    :cond_7b
    return p1
.end method
