.class public Lcom/leanplum/internal/ActionManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/ActionManager$MessageMatchResult;
    }
.end annotation


# static fields
.field private static final DAY_MILLIS:J = 0x5265c00L

.field public static final HELD_BACK_ACTION_NAME:Ljava/lang/String; = "__held_back"

.field private static final HOUR_MILLIS:J = 0x36ee80L

.field private static final LEANPLUM_LOCAL_PUSH_HELPER:Ljava/lang/String; = "com.leanplum.internal.LeanplumLocalPushHelper"

.field public static final PUSH_NOTIFICATION_ACTION_NAME:Ljava/lang/String; = "__Push Notification"

.field private static final WEEK_MILLIS:J = 0x240c8400L

.field private static instance:Lcom/leanplum/internal/ActionManager;

.field private static locationManager:Lcom/leanplum/LocationManager;

.field private static loggedLocationManagerFailure:Z


# instance fields
.field private final messageImpressionOccurrences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;>;"
        }
    .end annotation
.end field

.field private final messageTriggerOccurrences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation
.end field

.field private final sessionOccurrences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/ActionManager;->messageImpressionOccurrences:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/ActionManager;->messageTriggerOccurrences:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/ActionManager;->sessionOccurrences:Ljava/util/Map;

    invoke-direct {p0}, Lcom/leanplum/internal/ActionManager;->listenForLocalNotifications()V

    return-void
.end method

.method public static addRegionNamesFromTriggersToSet(Ljava/util/Map;Ljava/util/Set;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p0, :cond_42

    const-string v0, "children"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_12
    :goto_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_42

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "subject"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "enterRegion"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_36

    const-string v2, "exitRegion"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    :cond_36
    const-string v1, "noun"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_12

    :cond_42
    return-void
.end method

.method private countOccurrences(JJ)I
    .registers 14

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum_messaging__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_56

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "__leanplum_message_occurrences_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4f

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4f

    const-string v1, "{}"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4f

    move-object v3, p0

    move-wide v4, p1

    move-wide v6, p3

    invoke-direct/range {v3 .. v8}, Lcom/leanplum/internal/ActionManager;->countOccurrences(JJLjava/lang/String;)I

    move-result p0

    add-int/2addr v2, p0

    goto :goto_52

    :cond_4f
    move-object v3, p0

    move-wide v4, p1

    move-wide v6, p3

    :goto_52
    move-object p0, v3

    move-wide p1, v4

    move-wide p3, v6

    goto :goto_17

    :cond_56
    return v2
.end method

.method private countOccurrences(JJLjava/lang/String;)I
    .registers 14

    .line 87
    invoke-static {p5}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    .line 88
    const-string p5, "min"

    invoke-interface {p0, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Number;

    .line 89
    const-string v0, "max"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    const/4 v1, 0x0

    if-eqz p5, :cond_4d

    if-eqz v0, :cond_4d

    .line 90
    invoke-virtual {p5}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 91
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    :goto_27
    cmp-long p5, v4, v2

    if-ltz p5, :cond_4d

    .line 92
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p5

    invoke-interface {p0, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Number;

    if-eqz p5, :cond_49

    .line 93
    invoke-virtual {p5}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    cmp-long v0, p1, v6

    if-gtz v0, :cond_4d

    invoke-virtual {p5}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    cmp-long p5, v6, p3

    if-gtz p5, :cond_4d

    add-int/lit8 v1, v1, 0x1

    :cond_49
    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    goto :goto_27

    :cond_4d
    return v1
.end method

.method public static getForegroundandBackgroundRegionNames(Ljava/util/Set;Ljava/util/Set;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_56

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v3, "action"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_c

    const-string v4, "__Push Notification"

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    move-object v3, p1

    goto :goto_37

    :cond_36
    move-object v3, p0

    :goto_37
    const-string v4, "whenTriggers"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    const-string v5, "unlessTriggers"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-static {v4, v3}, Lcom/leanplum/internal/ActionManager;->addRegionNamesFromTriggersToSet(Ljava/util/Map;Ljava/util/Set;)V

    invoke-static {v2, v3}, Lcom/leanplum/internal/ActionManager;->addRegionNamesFromTriggersToSet(Ljava/util/Map;Ljava/util/Set;)V

    goto :goto_c

    :cond_56
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/leanplum/internal/ActionManager;
    .registers 2

    const-class v0, Lcom/leanplum/internal/ActionManager;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/leanplum/internal/ActionManager;->instance:Lcom/leanplum/internal/ActionManager;

    if-nez v1, :cond_e

    new-instance v1, Lcom/leanplum/internal/ActionManager;

    invoke-direct {v1}, Lcom/leanplum/internal/ActionManager;-><init>()V

    sput-object v1, Lcom/leanplum/internal/ActionManager;->instance:Lcom/leanplum/internal/ActionManager;
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_12

    :cond_e
    monitor-exit v0

    return-object v1

    :goto_10
    :try_start_10
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_12

    throw v1

    :catchall_12
    move-exception v1

    goto :goto_10
.end method

.method public static declared-synchronized getLocationManager()Lcom/leanplum/LocationManager;
    .registers 4

    const-class v0, Lcom/leanplum/internal/ActionManager;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/leanplum/internal/ActionManager;->locationManager:Lcom/leanplum/LocationManager;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_39

    if-eqz v1, :cond_9

    monitor-exit v0

    return-object v1

    :cond_9
    :try_start_9
    invoke-static {}, Lcom/leanplum/internal/Util;->hasPlayServices()Z

    move-result v1
    :try_end_d
    .catchall {:try_start_9 .. :try_end_d} :catchall_39

    const/4 v2, 0x0

    if-eqz v1, :cond_35

    :try_start_10
    const-string v1, "com.leanplum.LocationManagerImplementation"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v3, "instance"

    invoke-virtual {v1, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/leanplum/LocationManager;

    sput-object v1, Lcom/leanplum/internal/ActionManager;->locationManager:Lcom/leanplum/LocationManager;
    :try_end_24
    .catchall {:try_start_10 .. :try_end_24} :catchall_26

    monitor-exit v0

    return-object v1

    :catchall_26
    :try_start_26
    sget-boolean v1, Lcom/leanplum/internal/ActionManager;->loggedLocationManagerFailure:Z

    if-nez v1, :cond_35

    const-string v1, "Geofencing support requires leanplum-location module and Google Play Services v8.1 and higher.\nAdd this to your build.gradle file:\nimplementation \'com.google.android.gms:play-services-location:8.3.0+\'\nimplementation \'com.leanplum:leanplum-location:+\'"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v1, 0x1

    sput-boolean v1, Lcom/leanplum/internal/ActionManager;->loggedLocationManagerFailure:Z
    :try_end_35
    .catchall {:try_start_26 .. :try_end_35} :catchall_39

    :cond_35
    monitor-exit v0

    return-object v2

    :goto_37
    :try_start_37
    monitor-exit v0
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_39

    throw v1

    :catchall_39
    move-exception v1

    goto :goto_37
.end method

.method private listenForLocalNotifications()V
    .registers 3

    new-instance v0, Lcom/leanplum/internal/ActionManager$1;

    invoke-direct {v0, p0}, Lcom/leanplum/internal/ActionManager$1;-><init>(Lcom/leanplum/internal/ActionManager;)V

    const-string v1, "__Push Notification"

    invoke-static {v1, v0}, Lcom/leanplum/Leanplum;->onAction(Ljava/lang/String;Lcom/leanplum/callbacks/ActionCallback;)V

    new-instance v0, Lcom/leanplum/internal/ActionManager$2;

    invoke-direct {v0, p0}, Lcom/leanplum/internal/ActionManager$2;-><init>(Lcom/leanplum/internal/ActionManager;)V

    const-string p0, "__Cancel__Push Notification"

    invoke-static {p0, v0}, Lcom/leanplum/Leanplum;->onAction(Ljava/lang/String;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method

.method private matchedTrigger(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/leanplum/ActionContext$ContextualValues;",
            ")Z"
        }
    .end annotation

    const-string v0, "subject"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_d1

    const-string p2, "noun"

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_1d

    if-eqz p3, :cond_23

    goto/16 :goto_d1

    :cond_1d
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_d1

    :cond_23
    const-string p2, "verb"

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    const-string p3, "objects"

    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    const-string p3, "changesTo"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    const/4 v1, 0x1

    if-eqz p3, :cond_6b

    if-eqz p4, :cond_6a

    if-eqz p1, :cond_6a

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_48
    :goto_48
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_6a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_59

    iget-object p1, p4, Lcom/leanplum/ActionContext$ContextualValues;->attributeValue:Ljava/lang/Object;

    if-eqz p1, :cond_69

    goto :goto_48

    :cond_59
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p4, Lcom/leanplum/ActionContext$ContextualValues;->attributeValue:Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_48

    :cond_69
    return v1

    :cond_6a
    return v0

    :cond_6b
    const-string p3, "changesFromTo"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_ba

    if-eqz p4, :cond_b9

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    const/4 p2, 0x2

    if-ne p0, p2, :cond_b9

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b9

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b9

    iget-object p0, p4, Lcom/leanplum/ActionContext$ContextualValues;->previousAttributeValue:Ljava/lang/Object;

    if-eqz p0, :cond_b9

    iget-object p0, p4, Lcom/leanplum/ActionContext$ContextualValues;->attributeValue:Ljava/lang/Object;

    if-eqz p0, :cond_b9

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p2, p4, Lcom/leanplum/ActionContext$ContextualValues;->previousAttributeValue:Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_b9

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p4, Lcom/leanplum/ActionContext$ContextualValues;->attributeValue:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_b9

    return v1

    :cond_b9
    return v0

    :cond_ba
    const-string p3, "triggersWithParameter"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_d0

    if-eqz p1, :cond_cf

    if-eqz p4, :cond_cf

    iget-object p2, p4, Lcom/leanplum/ActionContext$ContextualValues;->parameters:Ljava/util/Map;

    if-eqz p2, :cond_cf

    invoke-direct {p0, p1, p2}, Lcom/leanplum/internal/ActionManager;->matchedTriggerParameters(Ljava/util/List;Ljava/util/Map;)Z

    move-result p0

    return p0

    :cond_cf
    return v0

    :cond_d0
    return v1

    :cond_d1
    :goto_d1
    return v0
.end method

.method private matchedTriggerParameters(Ljava/util/List;Ljava/util/Map;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)Z"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return v0

    :cond_8
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_11

    return v0

    :cond_11
    move p0, v0

    :goto_12
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p0, v1, :cond_40

    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, p0, 0x1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v1, :cond_3f

    if-eqz v2, :cond_3f

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2d

    return v0

    :cond_2d
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3c

    return v0

    :cond_3c
    add-int/lit8 p0, p0, 0x2

    goto :goto_12

    :cond_3f
    return v0

    :cond_40
    const/4 p0, 0x1

    return p0
.end method

.method private matchedTriggers(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)Z
    .registers 6

    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_32

    invoke-static {p1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    const-string v0, "children"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/leanplum/internal/ActionManager;->matchedTrigger(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_32
    const/4 p0, 0x0

    return p0
.end method

.method private matchesLimitTimes(IILjava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    move/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-string v5, "limitSession"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2b

    move-object/from16 v5, p0

    iget-object v1, v5, Lcom/leanplum/internal/ActionManager;->sessionOccurrences:Ljava/util/Map;

    move-object/from16 v2, p5

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    if-eqz v1, :cond_25

    move-object v4, v1

    :cond_25
    :goto_25
    const/16 v16, 0x1

    const/16 v17, 0x0

    goto/16 :goto_e0

    :cond_2b
    if-eqz v3, :cond_eb

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_eb

    const-string v5, "min"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    const-string v8, "max"

    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    if-nez v5, :cond_46

    move-object v5, v4

    :cond_46
    if-nez v8, :cond_49

    move-object v8, v4

    :cond_49
    const-string v9, "limitUser"

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const-wide/16 v10, 0x1

    if-eqz v9, :cond_62

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    sub-long/2addr v1, v3

    add-long/2addr v1, v10

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    goto :goto_25

    :cond_62
    const-string v9, "limitMinute"

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6d

    mul-int/lit8 v1, v1, 0x3c

    goto :goto_9d

    :cond_6d
    const-string v9, "limitHour"

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_78

    mul-int/lit16 v1, v1, 0xe10

    goto :goto_9d

    :cond_78
    const-string v9, "limitDay"

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_85

    const v2, 0x15180

    :goto_83
    mul-int/2addr v1, v2

    goto :goto_9d

    :cond_85
    const-string v9, "limitWeek"

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_91

    const v2, 0x93a80

    goto :goto_83

    :cond_91
    const-string v9, "limitMonth"

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9d

    const v2, 0x278d00

    goto :goto_83

    :cond_9d
    :goto_9d
    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object v2

    invoke-virtual {v2}, Lcom/leanplum/internal/Clock;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    const/4 v2, 0x0

    :goto_aa
    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v14

    cmp-long v14, v8, v14

    if-ltz v14, :cond_25

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v3, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_de

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v3, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Number;

    invoke-virtual {v14}, Ljava/lang/Number;->longValue()J

    move-result-wide v14

    sub-long v14, v12, v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    const/16 v16, 0x1

    const/16 v17, 0x0

    int-to-long v6, v1

    cmp-long v6, v14, v6

    if-gtz v6, :cond_e0

    add-int/lit8 v2, v2, 0x1

    if-lt v2, v0, :cond_de

    return v17

    :cond_de
    sub-long/2addr v8, v10

    goto :goto_aa

    :cond_e0
    :goto_e0
    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    int-to-long v3, v0

    cmp-long v0, v1, v3

    if-gez v0, :cond_ea

    return v16

    :cond_ea
    return v17

    :cond_eb
    const/16 v16, 0x1

    return v16
.end method

.method private matchesLimits(Ljava/lang/String;Ljava/util/Map;)Z
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x1

    if-nez p2, :cond_4

    return v0

    :cond_4
    const-string v1, "children"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_17

    return v0

    :cond_17
    invoke-virtual {p0, p1}, Lcom/leanplum/internal/ActionManager;->getMessageImpressionOccurrences(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/ActionManager;->getMessageTriggerOccurrences(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v1, v0

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_24
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v3, "subject"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "noun"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "verb"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "times"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_89

    const-string v3, "objects"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_7a

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_7b

    :cond_7a
    move v2, v8

    :goto_7b
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    move-object v7, p1

    move v4, v2

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/leanplum/internal/ActionManager;->matchesLimitTimes(IILjava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_ad

    return v8

    :cond_89
    move-object v2, p0

    move-object v7, p1

    const-string p0, "onNthOccurrence"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9a

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    if-eq v1, p0, :cond_ad

    return v8

    :cond_9a
    const-string p0, "everyNthOccurrence"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_ac

    rem-int p0, v1, p0

    if-eqz p0, :cond_ad

    :cond_ac
    return v8

    :cond_ad
    move-object p0, v2

    move-object p1, v7

    goto/16 :goto_24

    :cond_b1
    return v0
.end method

.method private recordImpression(Ljava/lang/String;)V
    .registers 14

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/ActionManager;->sessionOccurrences:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    if-nez v1, :cond_11

    move-object v1, v0

    :cond_11
    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v2, p0, Lcom/leanplum/internal/ActionManager;->sessionOccurrences:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/ActionManager;->getMessageImpressionOccurrences(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "max"

    const-string v5, "min"

    if-eqz v1, :cond_82

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_82

    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    if-nez v6, :cond_40

    move-object v6, v0

    :cond_40
    if-eqz v7, :cond_43

    move-object v0, v7

    :cond_43
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    add-long/2addr v7, v3

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object v10

    invoke-virtual {v10}, Lcom/leanplum/internal/Clock;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v1, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    sub-long/2addr v7, v9

    add-long/2addr v7, v3

    const-wide/16 v9, 0x64

    cmp-long v7, v7, v9

    if-lez v7, :cond_7e

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    add-long/2addr v6, v3

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7e
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9e

    :cond_82
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/Clock;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string v2, "0"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_9e
    invoke-virtual {p0, v1, p1}, Lcom/leanplum/internal/ActionManager;->saveMessageImpressionOccurrences(Ljava/util/Map;Ljava/lang/String;)V

    return-void
.end method

.method private trackHeldBackEvent(Ljava/lang/String;)V
    .registers 8

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    const-string p0, "messageId"

    invoke-virtual {v5, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v0, "Held Back"

    const-wide/16 v1, 0x0

    invoke-static/range {v0 .. v5}, Lcom/leanplum/internal/LeanplumInternal;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method

.method private trackImpressionEvent(Ljava/lang/String;)V
    .registers 8

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    const-string p0, "messageId"

    invoke-virtual {v5, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    invoke-static/range {v0 .. v5}, Lcom/leanplum/internal/LeanplumInternal;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public dailyOccurrencesCount()I
    .registers 5

    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/Clock;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x5265c00

    sub-long v2, v0, v2

    invoke-direct {p0, v2, v3, v0, v1}, Lcom/leanplum/internal/ActionManager;->countOccurrences(JJ)I

    move-result p0

    return p0
.end method

.method public getMessageImpressionOccurrences(Ljava/lang/String;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/leanplum/internal/ActionManager;->messageImpressionOccurrences:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_b

    return-object v0

    :cond_b
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum_messaging__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "__leanplum_message_occurrences_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "{}"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iget-object p0, p0, Lcom/leanplum/internal/ActionManager;->messageImpressionOccurrences:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getMessageTriggerOccurrences(Ljava/lang/String;)I
    .registers 6

    iget-object v0, p0, Lcom/leanplum/internal/ActionManager;->messageTriggerOccurrences:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0

    :cond_f
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum_messaging__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "__leanplum_message_trigger_occurrences_"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-object p0, p0, Lcom/leanplum/internal/ActionManager;->messageTriggerOccurrences:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method public muteFutureMessagesOfKind(Ljava/lang/String;)V
    .registers 4

    if-eqz p1, :cond_1e

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "__leanplum_messaging__"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "__leanplum_message_muted_"

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-static {p0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    :cond_1e
    return-void
.end method

.method public recordChainedActionImpression(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/internal/ActionManager;->trackImpressionEvent(Ljava/lang/String;)V

    return-void
.end method

.method public recordHeldBackImpression(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p2}, Lcom/leanplum/internal/ActionManager;->trackHeldBackEvent(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/leanplum/internal/ActionManager;->recordImpression(Ljava/lang/String;)V

    return-void
.end method

.method public recordLocalPushImpression(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/internal/ActionManager;->trackImpressionEvent(Ljava/lang/String;)V

    return-void
.end method

.method public recordMessageImpression(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/internal/ActionManager;->trackImpressionEvent(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/leanplum/internal/ActionManager;->recordImpression(Ljava/lang/String;)V

    return-void
.end method

.method public recordMessageTrigger(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/ActionManager;->getMessageTriggerOccurrences(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/leanplum/internal/ActionManager;->saveMessageTriggerOccurrences(ILjava/lang/String;)V

    return-void
.end method

.method public saveMessageImpressionOccurrences(Ljava/util/Map;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum_messaging__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "__leanplum_message_occurrences_"

    invoke-static {v1, p2}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget-object p0, p0, Lcom/leanplum/internal/ActionManager;->messageImpressionOccurrences:Ljava/util/Map;

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method public saveMessageTriggerOccurrences(ILjava/lang/String;)V
    .registers 6

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum_messaging__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "__leanplum_message_trigger_occurrences_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p0, p0, Lcom/leanplum/internal/ActionManager;->messageTriggerOccurrences:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method public sessionOccurrencesCount()I
    .registers 3

    iget-object p0, p0, Lcom/leanplum/internal/ActionManager;->sessionOccurrences:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_b
    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    add-int/2addr v1, v0

    move v0, v1

    goto :goto_b

    :cond_26
    return v0
.end method

.method public shouldShowMessage(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)Lcom/leanplum/internal/ActionManager$MessageMatchResult;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/leanplum/ActionContext$ContextualValues;",
            ")",
            "Lcom/leanplum/internal/ActionManager$MessageMatchResult;"
        }
    .end annotation

    new-instance v0, Lcom/leanplum/internal/ActionManager$MessageMatchResult;

    invoke-direct {v0}, Lcom/leanplum/internal/ActionManager$MessageMatchResult;-><init>()V

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "__leanplum_messaging__"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "__leanplum_message_muted_"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_42

    const-string v1, "whenTriggers"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1, p3, p4, p5}, Lcom/leanplum/internal/ActionManager;->matchedTriggers(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedTrigger:Z

    const-string v1, "unlessTriggers"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1, p3, p4, p5}, Lcom/leanplum/internal/ActionManager;->matchedTriggers(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)Z

    move-result p3

    iput-boolean p3, v0, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedUnlessTrigger:Z

    iget-boolean p4, v0, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedTrigger:Z

    if-nez p4, :cond_43

    if-nez p3, :cond_43

    :cond_42
    return-object v0

    :cond_43
    const-string p3, "whenLimits"

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    instance-of p4, p3, Ljava/util/Map;

    if-eqz p4, :cond_54

    invoke-static {p3}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map;

    goto :goto_55

    :cond_54
    const/4 p3, 0x0

    :goto_55
    invoke-direct {p0, p1, p3}, Lcom/leanplum/internal/ActionManager;->matchesLimits(Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    iput-boolean p0, v0, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedLimit:Z

    const-string p0, "startTime"

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string p1, "endTime"

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const/4 p2, 0x1

    if-eqz p0, :cond_90

    if-eqz p1, :cond_90

    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object p3

    invoke-virtual {p3}, Lcom/leanplum/internal/Clock;->newDate()Ljava/util/Date;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    move-result-wide p3

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long p0, p3, v1

    if-ltz p0, :cond_8d

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    cmp-long p0, p3, p0

    if-gtz p0, :cond_8d

    move v3, p2

    :cond_8d
    iput-boolean v3, v0, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedActivePeriod:Z

    return-object v0

    :cond_90
    iput-boolean p2, v0, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedActivePeriod:Z

    return-object v0
.end method

.method public shouldSuppressMessages()Z
    .registers 9

    invoke-static {}, Lcom/leanplum/internal/VarCache;->localCaps()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    move v4, v3

    :cond_c
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    const-string v6, "channel"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string v7, "IN_APP"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    const-string v6, "type"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "limit"

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    if-eqz v5, :cond_c

    const-string v7, "DAY"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_45

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_c

    :cond_45
    const-string v7, "WEEK"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_52

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_c

    :cond_52
    const-string v7, "SESSION"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    goto :goto_c

    :cond_5f
    if-lez v2, :cond_67

    invoke-virtual {p0}, Lcom/leanplum/internal/ActionManager;->weeklyOccurrencesCount()I

    move-result v0

    if-ge v0, v2, :cond_77

    :cond_67
    if-lez v3, :cond_6f

    invoke-virtual {p0}, Lcom/leanplum/internal/ActionManager;->dailyOccurrencesCount()I

    move-result v0

    if-ge v0, v3, :cond_77

    :cond_6f
    if-lez v4, :cond_79

    invoke-virtual {p0}, Lcom/leanplum/internal/ActionManager;->sessionOccurrencesCount()I

    move-result p0

    if-lt p0, v4, :cond_79

    :cond_77
    const/4 p0, 0x1

    return p0

    :cond_79
    return v1
.end method

.method public weeklyOccurrencesCount()I
    .registers 5

    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/Clock;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x240c8400

    sub-long v2, v0, v2

    invoke-direct {p0, v2, v3, v0, v1}, Lcom/leanplum/internal/ActionManager;->countOccurrences(JJ)I

    move-result p0

    return p0
.end method
