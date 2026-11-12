.class Lcom/leanplum/LeanplumNotificationChannel;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/LeanplumNotificationChannel$NotificationGroupData;,
        Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;
    }
.end annotation


# static fields
.field public static final synthetic a:I

.field private static final externallyManagedChannels:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/leanplum/LeanplumNotificationChannel;->externallyManagedChannels:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addExternallyManagedChannel(Ljava/lang/String;)V
    .registers 2

    sget-object v0, Lcom/leanplum/LeanplumNotificationChannel;->externallyManagedChannels:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static configureChannels(Landroid/content/Context;Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/lang/String;)V
    .registers 4

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationChannel;->configureNotificationGroups(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-static {p0, p2}, Lcom/leanplum/LeanplumNotificationChannel;->configureNotificationChannels(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-static {p0, p3}, Lcom/leanplum/LeanplumNotificationChannel;->configureDefaultNotificationChannel(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static configureDefaultNotificationChannel(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    if-eqz p0, :cond_10

    :try_start_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationChannel;->storeDefaultNotificationChannel(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_c

    return-void

    :catchall_c
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_10
    return-void
.end method

.method public static configureNotificationChannels(Landroid/content/Context;Lorg/json/JSONArray;)V
    .registers 5

    if-eqz p0, :cond_50

    if-eqz p1, :cond_50

    :try_start_4
    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationChannel;->retrieveNotificationChannels(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->listFromJson(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p1

    if-eqz v0, :cond_31

    if-eqz p1, :cond_31

    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    if-eqz v1, :cond_17

    const-string v2, "id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/leanplum/LeanplumNotificationChannel;->deleteNotificationChannel(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_17

    :cond_31
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationChannel;->storeNotificationChannels(Landroid/content/Context;Ljava/util/List;)V

    if-eqz p1, :cond_50

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3a
    :goto_3a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    if-eqz v0, :cond_3a

    invoke-static {p0, v0}, Lcom/leanplum/LeanplumNotificationChannel;->createNotificationChannel(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;
    :try_end_4b
    .catchall {:try_start_4 .. :try_end_4b} :catchall_4c

    goto :goto_3a

    :catchall_4c
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_50
    return-void
.end method

.method public static configureNotificationGroups(Landroid/content/Context;Lorg/json/JSONArray;)V
    .registers 5

    if-eqz p0, :cond_50

    if-eqz p1, :cond_50

    :try_start_4
    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationChannel;->retrieveNotificationGroups(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->listFromJson(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p1

    if-eqz v0, :cond_31

    if-eqz p1, :cond_31

    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    if-eqz v1, :cond_17

    const-string v2, "id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/leanplum/LeanplumNotificationChannel;->deleteNotificationGroup(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_17

    :cond_31
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationChannel;->storeNotificationGroups(Landroid/content/Context;Ljava/util/List;)V

    if-eqz p1, :cond_50

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3a
    :goto_3a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    if-eqz v0, :cond_3a

    invoke-static {p0, v0}, Lcom/leanplum/LeanplumNotificationChannel;->createNotificationGroup(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;
    :try_end_4b
    .catchall {:try_start_4 .. :try_end_4b} :catchall_4c

    goto :goto_3a

    :catchall_4c
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_50
    return-void
.end method

.method public static createNotificationChannel(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    move-object/from16 v0, p1

    const/4 v1, 0x0

    if-eqz p0, :cond_3f

    if-eqz v0, :cond_3f

    .line 96
    :try_start_7
    new-instance v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;

    invoke-direct {v2, v0}, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;-><init>(Ljava/util/Map;)V

    .line 97
    sget-object v0, Lcom/leanplum/LeanplumNotificationChannel;->externallyManagedChannels:Ljava/util/Set;

    iget-object v3, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->id:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 98
    iget-object v4, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->id:Ljava/lang/String;

    if-eqz v0, :cond_19

    return-object v4

    :cond_19
    iget-object v5, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->name:Ljava/lang/String;

    iget v6, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->importance:I

    iget-object v7, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->description:Ljava/lang/String;

    iget-object v8, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->groupId:Ljava/lang/String;

    iget-boolean v9, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableLights:Z

    iget v10, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lightColor:I

    iget-boolean v11, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableVibration:Z

    iget-object v12, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->vibrationPattern:[J

    iget v13, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lockscreenVisibility:I

    iget-boolean v14, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->bypassDnd:Z

    iget-boolean v15, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->showBadge:Z

    move-object/from16 v3, p0

    invoke-static/range {v3 .. v15}, Lcom/leanplum/LeanplumNotificationChannel;->createNotificationChannel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZIZ[JIZZ)V

    .line 99
    iget-object v0, v2, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->id:Ljava/lang/String;
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_36} :catch_37

    return-object v0

    :catch_37
    const/4 v0, 0x0

    .line 100
    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "Failed to create notification channel."

    invoke-static {v2, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_3f
    return-object v1
.end method

.method private static createNotificationChannel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZIZ[JIZZ)V
    .registers 14

    if-eqz p0, :cond_5f

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5f

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_5f

    :try_start_e
    const-class v0, Landroid/app/NotificationManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-nez p0, :cond_21

    const-string p0, "Notification manager is null"

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_21
    new-instance v0, Landroid/app/NotificationChannel;

    invoke-direct {v0, p1, p2, p3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2f

    invoke-virtual {v0, p4}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    :cond_2f
    const/4 p1, 0x1

    if-eqz p6, :cond_38

    invoke-virtual {v0, p1}, Landroid/app/NotificationChannel;->enableLights(Z)V

    invoke-virtual {v0, p7}, Landroid/app/NotificationChannel;->setLightColor(I)V

    :cond_38
    if-eqz p8, :cond_45

    invoke-virtual {v0, p1}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    if-eqz p9, :cond_45

    array-length p1, p9

    if-eqz p1, :cond_45

    invoke-virtual {v0, p9}, Landroid/app/NotificationChannel;->setVibrationPattern([J)V

    :cond_45
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4e

    invoke-virtual {v0, p5}, Landroid/app/NotificationChannel;->setGroup(Ljava/lang/String;)V

    :cond_4e
    invoke-virtual {v0, p10}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    invoke-virtual {v0, p11}, Landroid/app/NotificationChannel;->setBypassDnd(Z)V

    invoke-virtual {v0, p12}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V
    :try_end_5a
    .catchall {:try_start_e .. :try_end_5a} :catchall_5b

    return-void

    :catchall_5b
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_5f
    return-void
.end method

.method private static createNotificationGroup(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    if-eqz p0, :cond_13

    if-eqz p1, :cond_13

    .line 47
    new-instance v0, Lcom/leanplum/LeanplumNotificationChannel$NotificationGroupData;

    invoke-direct {v0, p1}, Lcom/leanplum/LeanplumNotificationChannel$NotificationGroupData;-><init>(Ljava/util/Map;)V

    .line 48
    iget-object p1, v0, Lcom/leanplum/LeanplumNotificationChannel$NotificationGroupData;->id:Ljava/lang/String;

    iget-object v1, v0, Lcom/leanplum/LeanplumNotificationChannel$NotificationGroupData;->name:Ljava/lang/String;

    invoke-static {p0, p1, v1}, Lcom/leanplum/LeanplumNotificationChannel;->createNotificationGroup(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    iget-object p0, v0, Lcom/leanplum/LeanplumNotificationChannel$NotificationGroupData;->id:Ljava/lang/String;

    return-object p0

    :cond_13
    const/4 p0, 0x0

    return-object p0
.end method

.method private static createNotificationGroup(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    if-eqz p0, :cond_2e

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2e

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2e

    :try_start_e
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-nez p0, :cond_21

    const-string p0, "Notification manager is null"

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_21
    new-instance v0, Landroid/app/NotificationChannelGroup;

    invoke-direct {v0, p1, p2}, Landroid/app/NotificationChannelGroup;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->createNotificationChannelGroup(Landroid/app/NotificationChannelGroup;)V
    :try_end_29
    .catchall {:try_start_e .. :try_end_29} :catchall_2a

    return-void

    :catchall_2a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_2e
    return-void
.end method

.method private static deleteNotificationChannel(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    if-eqz p0, :cond_2b

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2b

    sget-object v0, Lcom/leanplum/LeanplumNotificationChannel;->externallyManagedChannels:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    :try_start_10
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-nez p0, :cond_23

    const-string p0, "Notification manager is null"

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_23
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->deleteNotificationChannel(Ljava/lang/String;)V
    :try_end_26
    .catchall {:try_start_10 .. :try_end_26} :catchall_27

    return-void

    :catchall_27
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_2b
    return-void
.end method

.method private static deleteNotificationGroup(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    if-eqz p0, :cond_29

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_29

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_29

    :try_start_e
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-nez p0, :cond_21

    const-string p0, "Notification manager is null"

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_21
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->deleteNotificationChannelGroup(Ljava/lang/String;)V
    :try_end_24
    .catchall {:try_start_e .. :try_end_24} :catchall_25

    return-void

    :catchall_25
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_29
    return-void
.end method

.method public static getDefaultNotificationChannelId(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationChannel;->retrieveDefaultNotificationChannel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getNotificationChannels(Landroid/content/Context;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Landroid/app/NotificationChannel;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1f

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-nez p0, :cond_1a

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "Notification manager is null"

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_1a
    invoke-virtual {p0}, Landroid/app/NotificationManager;->getNotificationChannels()Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1f
    return-object v1
.end method

.method public static getNotificationGroups(Landroid/content/Context;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Landroid/app/NotificationChannelGroup;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1f

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-nez p0, :cond_1a

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "Cannot get Notification Channel Groups, notificationManager is null."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_1a
    invoke-virtual {p0}, Landroid/app/NotificationManager;->getNotificationChannelGroups()Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1f
    return-object v1
.end method

.method private static retrieveDefaultNotificationChannel(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    :try_start_5
    const-string v2, "__leanplum__"

    invoke-virtual {p0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "__leanplum_default_notification_channels"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_11} :catch_12

    return-object p0

    :catch_12
    const-string p0, "Failed to convert default notification channels json."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private static retrieveNotificationChannels(Landroid/content/Context;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    :try_start_5
    const-string v2, "__leanplum__"

    invoke-virtual {p0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "__leanplum_notification_channels"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_14

    return-object v0

    :cond_14
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/leanplum/internal/JsonConverter;->listFromJson(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p0
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1d} :catch_1e

    return-object p0

    :catch_1e
    const-string p0, "Failed to convert notification channels json."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private static retrieveNotificationGroups(Landroid/content/Context;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    :try_start_5
    const-string v2, "__leanplum__"

    invoke-virtual {p0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "__leanplum_notification_groups"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_14

    return-object v0

    :cond_14
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/leanplum/internal/JsonConverter;->listFromJson(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p0
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1d} :catch_1e

    return-object p0

    :catch_1e
    const-string p0, "Failed to convert notification channels json."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private static storeDefaultNotificationChannel(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    if-eqz p0, :cond_17

    if-eqz p1, :cond_17

    const-string v0, "__leanplum__"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "__leanplum_default_notification_channels"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {p0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    :cond_17
    return-void
.end method

.method private static storeNotificationChannels(Landroid/content/Context;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    if-eqz p0, :cond_20

    if-eqz p1, :cond_20

    const-string v0, "__leanplum__"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "__leanplum_notification_channels"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {p0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    :cond_20
    return-void
.end method

.method private static storeNotificationGroups(Landroid/content/Context;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    if-eqz p0, :cond_20

    if-eqz p1, :cond_20

    const-string v0, "__leanplum__"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "__leanplum_notification_groups"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {p0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    :cond_20
    return-void
.end method
