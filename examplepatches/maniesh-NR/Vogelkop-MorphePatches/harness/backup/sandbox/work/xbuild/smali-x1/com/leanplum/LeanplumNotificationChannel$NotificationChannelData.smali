.class Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/LeanplumNotificationChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NotificationChannelData"
.end annotation


# instance fields
.field bypassDnd:Z

.field description:Ljava/lang/String;

.field enableLights:Z

.field enableVibration:Z

.field groupId:Ljava/lang/String;

.field id:Ljava/lang/String;

.field importance:I

.field lightColor:I

.field lockscreenVisibility:I

.field name:Ljava/lang/String;

.field showBadge:Z

.field vibrationPattern:[J


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    iput v0, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->importance:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableLights:Z

    iput v1, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lightColor:I

    iput-boolean v1, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableVibration:Z

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->vibrationPattern:[J

    const/4 v3, 0x1

    iput v3, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lockscreenVisibility:I

    iput-boolean v1, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->bypassDnd:Z

    iput-boolean v1, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->showBadge:Z

    const-string v4, "id"

    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->id:Ljava/lang/String;

    const-string v4, "name"

    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->name:Ljava/lang/String;

    const-string v4, "description"

    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->description:Ljava/lang/String;

    const-string v4, "groupId"

    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->groupId:Ljava/lang/String;

    iget v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->importance:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "importance"

    invoke-static {p1, v5, v4}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->importance:I

    iget-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableLights:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "enable_lights"

    invoke-static {p1, v5, v4}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iput-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableLights:Z

    iget v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lightColor:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "light_color"

    invoke-static {p1, v5, v4}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lightColor:I

    iget-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableVibration:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "enable_vibration"

    invoke-static {p1, v5, v4}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iput-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->enableVibration:Z

    iget v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lockscreenVisibility:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "lockscreen_visibility"

    invoke-static {p1, v5, v4}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lockscreenVisibility:I

    iget-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->bypassDnd:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "bypass_dnd"

    invoke-static {p1, v5, v4}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iput-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->bypassDnd:Z

    iget-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->showBadge:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "show_badge"

    invoke-static {p1, v5, v4}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iput-boolean v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->showBadge:Z

    :try_start_cb
    const-string v4, "vibration_pattern"

    invoke-static {p1, v4, v2}, Lcom/leanplum/internal/CollectionUtil;->getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_105

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [J

    iput-object v2, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->vibrationPattern:[J

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v2, v1

    :goto_e6
    iget-object v4, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->vibrationPattern:[J

    array-length v4, v4

    if-ge v2, v4, :cond_105

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    if-eqz v4, :cond_fb

    iget-object v5, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->vibrationPattern:[J

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    aput-wide v6, v5, v2
    :try_end_fb
    .catch Ljava/lang/Exception; {:try_start_cb .. :try_end_fb} :catch_fe

    :cond_fb
    add-int/lit8 v2, v2, 0x1

    goto :goto_e6

    :catch_fe
    const-string p1, "Failed to parse vibration pattern."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_105
    iget p1, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->importance:I

    if-gez p1, :cond_10e

    const/4 v1, 0x5

    if-le p1, v1, :cond_10e

    iput v0, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->importance:I

    :cond_10e
    iget p1, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lockscreenVisibility:I

    const/4 v0, -0x1

    if-ge p1, v0, :cond_117

    if-le p1, v3, :cond_117

    iput v3, p0, Lcom/leanplum/LeanplumNotificationChannel$NotificationChannelData;->lockscreenVisibility:I

    :cond_117
    return-void
.end method
