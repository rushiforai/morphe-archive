.class public Lcom/leanplum/internal/LeanplumInternal;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;
    }
.end annotation


# static fields
.field private static final ACTION:Ljava/lang/String; = "action"

.field private static final actionHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/leanplum/callbacks/ActionCallback;",
            ">;>;"
        }
    .end annotation
.end field

.field private static calledStart:Z

.field private static hasStarted:Z

.field private static hasStartedAndRegisteredAsDeveloper:Z

.field private static inForeground:Z

.field private static final inForegroundLock:Ljava/lang/Object;

.field private static isPaused:Z

.field private static isScreenTrackingEnabled:Z

.field private static isVariantDebugInfoEnabled:Z

.field private static issuedStart:Z

.field private static final startIssuedHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static startSuccessful:Z

.field private static startedInBackground:Z

.field private static final userAttributeChanges:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/LeanplumInternal;->actionHandlers:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/leanplum/internal/LeanplumInternal;->inForegroundLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v0, Lcom/leanplum/internal/LeanplumInternal;->userAttributeChanges:Ljava/util/Queue;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/internal/LeanplumInternal;->startIssuedHandlers:Ljava/util/ArrayList;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->isScreenTrackingEnabled:Z

    sput-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->isVariantDebugInfoEnabled:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic access$000()V
    .registers 0

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->onHasStartedAndRegisteredAsDeveloperAndFinishedSyncing()V

    return-void
.end method

.method public static synthetic access$100(Ljava/lang/String;Ljava/util/Map;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/internal/LeanplumInternal;->trackLocalInternal(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic access$200(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/internal/LeanplumInternal;->trackInternal(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method

.method public static addStartIssuedHandler(Ljava/lang/Runnable;)V
    .registers 3

    if-nez p0, :cond_b

    const-string p0, "addStartIssuedHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->startIssuedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    sget-boolean v1, Lcom/leanplum/internal/LeanplumInternal;->issuedStart:Z

    if-nez v1, :cond_17

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :cond_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_1e

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :goto_1c
    :try_start_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1e

    throw p0

    :catchall_1e
    move-exception p0

    goto :goto_1c
.end method

.method public static enableAutomaticScreenTracking()V
    .registers 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->isScreenTrackingEnabled:Z

    return-void
.end method

.method private static fetchCountDown(Lcom/leanplum/ActionContext;Ljava/util/Map;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/ActionContext;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_2f

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->isPreview()Z

    move-result v1

    if-eqz v1, :cond_d

    const/4 p0, 0x5

    return p0

    :cond_d
    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getOriginalMessageId()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_14

    return v0

    :cond_14
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    const-string p1, "countdown"

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/lang/Number;

    if-eqz p1, :cond_2f

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0

    :cond_2f
    return v0
.end method

.method public static getActionHandlers()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/leanplum/callbacks/ActionCallback;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->actionHandlers:Ljava/util/Map;

    return-object v0
.end method

.method public static getIsScreenTrackingEnabled()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->isScreenTrackingEnabled:Z

    return v0
.end method

.method public static getIsVariantDebugInfoEnabled()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->isVariantDebugInfoEnabled:Z

    return v0
.end method

.method public static getUserAttributeChanges()Ljava/util/Queue;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;>;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->userAttributeChanges:Ljava/util/Queue;

    return-object v0
.end method

.method public static hasCalledStart()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->calledStart:Z

    return v0
.end method

.method public static hasStarted()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->hasStarted:Z

    return v0
.end method

.method public static hasStartedAndRegisteredAsDeveloper()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->hasStartedAndRegisteredAsDeveloper:Z

    return v0
.end method

.method public static hasStartedInBackground()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->startedInBackground:Z

    return v0
.end method

.method public static isPaused()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->isPaused:Z

    return v0
.end method

.method public static isStartSuccessful()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->startSuccessful:Z

    return v0
.end method

.method private static isValidScalarValue(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 3

    instance-of v0, p0, Ljava/lang/Number;

    if-nez v0, :cond_1c

    instance-of v0, p0, Ljava/lang/String;

    if-nez v0, :cond_1c

    instance-of p0, p0, Ljava/lang/Boolean;

    if-nez p0, :cond_1c

    new-instance p0, Lcom/leanplum/LeanplumException;

    const-string v0, " values must be of type String, Number, or Boolean."

    invoke-static {p1, v0}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/leanplum/LeanplumException;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->maybeThrowException(Ljava/lang/RuntimeException;)V

    const/4 p0, 0x0

    return p0

    :cond_1c
    const/4 p0, 0x1

    return p0
.end method

.method public static issuedStart()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->issuedStart:Z

    return v0
.end method

.method private static makeTrackArgs(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p5, :cond_a

    invoke-virtual {v0, p5}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    :cond_a
    const-string p5, "value"

    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p5, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "info"

    invoke-virtual {v0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p0, :cond_1f

    const-string p1, "event"

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1f
    if-eqz p4, :cond_2f

    const/4 p0, 0x0

    const-string p1, "params"

    invoke-static {p4, p1, p0}, Lcom/leanplum/internal/LeanplumInternal;->validateAttributes(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2f
    sget-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->inForeground:Z

    if-eqz p0, :cond_3a

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused()Z

    move-result p0

    if-nez p0, :cond_3a

    return-object v0

    :cond_3a
    const-string p0, "allowOffline"

    const-string p1, "true"

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public static maybePerformActions(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V
    .registers 5

    .line 517
    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/leanplum/internal/LeanplumInternal;->maybePerformActions([Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V

    return-void
.end method

.method public static maybePerformActions([Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V
    .registers 24

    move-object/from16 v0, p0

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_204

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_15
    :goto_15
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const-string v5, "__held_back"

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v4, :cond_10d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Ljava/lang/String;

    if-eqz v12, :cond_30

    move-object/from16 v4, p3

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_15

    :cond_30
    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Ljava/util/Map;

    const-string v8, "action"

    invoke-interface {v15, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    if-eqz v9, :cond_15

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_53

    const-string v5, "__held_back__"

    invoke-static {v5, v12}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v11, v5

    goto :goto_54

    :cond_53
    move-object v11, v12

    :goto_54
    const-string v5, "__Push Notification"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_60

    and-int/lit8 v6, p2, 0x1

    if-eqz v6, :cond_15

    :cond_60
    new-instance v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;

    invoke-direct {v5}, Lcom/leanplum/internal/ActionManager$MessageMatchResult;-><init>()V

    array-length v6, v0

    :goto_66
    if-ge v7, v6, :cond_96

    aget-object v16, v0, v7

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v13

    move-object/from16 v17, p1

    move-object/from16 v18, p4

    move-object v14, v11

    invoke-virtual/range {v13 .. v18}, Lcom/leanplum/internal/ActionManager;->shouldShowMessage(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)Lcom/leanplum/internal/ActionManager$MessageMatchResult;

    move-result-object v9

    iget-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedTrigger:Z

    iget-boolean v13, v9, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedTrigger:Z

    or-int/2addr v10, v13

    iput-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedTrigger:Z

    iget-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedUnlessTrigger:Z

    iget-boolean v13, v9, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedUnlessTrigger:Z

    or-int/2addr v10, v13

    iput-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedUnlessTrigger:Z

    iget-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedLimit:Z

    iget-boolean v13, v9, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedLimit:Z

    or-int/2addr v10, v13

    iput-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedLimit:Z

    iget-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedActivePeriod:Z

    iget-boolean v9, v9, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedActivePeriod:Z

    or-int/2addr v10, v9

    iput-boolean v10, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedActivePeriod:Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_66

    :cond_96
    iget-boolean v6, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedUnlessTrigger:Z

    if-eqz v6, :cond_be

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "__Cancel"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v15, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/leanplum/ActionContext;

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    invoke-direct {v7, v6, v9, v12}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    new-instance v6, Lcom/leanplum/internal/LeanplumInternal$3;

    invoke-direct {v6, v12}, Lcom/leanplum/internal/LeanplumInternal$3;-><init>(Ljava/lang/String;)V

    invoke-static {v7, v6}, Lcom/leanplum/internal/LeanplumInternal;->triggerAction(Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    :cond_be
    iget-boolean v6, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedActivePeriod:Z

    if-eqz v6, :cond_15

    iget-boolean v6, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedTrigger:Z

    if-eqz v6, :cond_15

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v6

    invoke-virtual {v6, v11}, Lcom/leanplum/internal/ActionManager;->recordMessageTrigger(Ljava/lang/String;)V

    iget-boolean v5, v5, Lcom/leanplum/internal/ActionManager$MessageMatchResult;->matchedLimit:Z

    if-eqz v5, :cond_15

    const-string v5, "priority"

    invoke-interface {v15, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e5

    invoke-interface {v15, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    :goto_e3
    move v13, v5

    goto :goto_e8

    :cond_e5
    const/16 v5, 0x3e8

    goto :goto_e3

    :goto_e8
    const-string v5, "vars"

    invoke-interface {v15, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljava/util/Map;

    new-instance v5, Lcom/leanplum/ActionContext;

    invoke-interface {v15, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    move-object v8, v5

    invoke-direct/range {v8 .. v13}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v8, p4

    invoke-virtual {v5, v8}, Lcom/leanplum/ActionContext;->setContextualValues(Lcom/leanplum/ActionContext$ContextualValues;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_15

    :cond_10d
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_204

    new-instance v0, Lcom/leanplum/internal/LeanplumInternal$4;

    invoke-direct {v0}, Lcom/leanplum/internal/LeanplumInternal$4;-><init>()V

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    sget-boolean v0, Lcom/leanplum/internal/Constants;->enableMultipleActionsWithPriorityZero:Z

    const-string v3, "Suppressing messageId="

    if-eqz v0, :cond_197

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_12a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_15d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/leanplum/ActionContext;

    invoke-virtual {v8}, Lcom/leanplum/internal/BaseActionContext;->getPriority()I

    move-result v9

    if-nez v9, :cond_15d

    invoke-virtual {v8}, Lcom/leanplum/ActionContext;->actionName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_156

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v9

    invoke-virtual {v8}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8}, Lcom/leanplum/internal/BaseActionContext;->getOriginalMessageId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v10, v8}, Lcom/leanplum/internal/ActionManager;->recordHeldBackImpression(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_159

    :cond_156
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_159
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_12a

    :cond_15d
    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->maybeReorderZeroPriorityActions(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_165
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_191

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/leanplum/ActionContext;

    invoke-static {v4}, Lcom/leanplum/internal/LeanplumInternal;->shouldSuppressMessage(Lcom/leanplum/ActionContext;)Z

    move-result v8

    if-eqz v8, :cond_18d

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v8, v7, [Ljava/lang/Object;

    invoke-static {v4, v8}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_165

    :cond_18d
    invoke-static {v4}, Lcom/leanplum/internal/LeanplumInternal;->scheduleAction(Lcom/leanplum/ActionContext;)V

    goto :goto_165

    :cond_191
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_204

    :cond_197
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/leanplum/ActionContext;

    invoke-virtual {v0}, Lcom/leanplum/internal/BaseActionContext;->getPriority()I

    move-result v0

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/leanplum/ActionContext;

    invoke-static {v4, v1}, Lcom/leanplum/internal/LeanplumInternal;->fetchCountDown(Lcom/leanplum/ActionContext;Ljava/util/Map;)I

    move-result v4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v7

    move v10, v9

    :goto_1b1
    if-ge v10, v8, :cond_204

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Lcom/leanplum/ActionContext;

    invoke-virtual {v11}, Lcom/leanplum/internal/BaseActionContext;->getPriority()I

    move-result v12

    if-gt v12, v0, :cond_204

    if-eqz v9, :cond_1c9

    invoke-static {v11, v1}, Lcom/leanplum/internal/LeanplumInternal;->fetchCountDown(Lcom/leanplum/ActionContext;Ljava/util/Map;)I

    move-result v9

    if-eq v9, v4, :cond_204

    :cond_1c9
    invoke-virtual {v11}, Lcom/leanplum/ActionContext;->actionName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1e3

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v9

    invoke-virtual {v11}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11}, Lcom/leanplum/internal/BaseActionContext;->getOriginalMessageId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v12, v11}, Lcom/leanplum/internal/ActionManager;->recordHeldBackImpression(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_202

    :cond_1e3
    invoke-static {v11}, Lcom/leanplum/internal/LeanplumInternal;->shouldSuppressMessage(Lcom/leanplum/ActionContext;)Z

    move-result v9

    if-eqz v9, :cond_1ff

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-array v11, v7, [Ljava/lang/Object;

    invoke-static {v9, v11}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_202

    :cond_1ff
    invoke-static {v11}, Lcom/leanplum/internal/LeanplumInternal;->scheduleAction(Lcom/leanplum/ActionContext;)V

    :goto_202
    move v9, v6

    goto :goto_1b1

    :cond_204
    return-void
.end method

.method private static maybeReorderZeroPriorityActions(Ljava/util/List;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/leanplum/ActionContext;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/leanplum/ActionContext;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/LeanplumMessageDisplayControllers;->getMessageDisplayController()Lcom/leanplum/MessageDisplayController;

    move-result-object v0

    if-nez v0, :cond_7

    return-object p0

    :cond_7
    invoke-interface {v0, p0}, Lcom/leanplum/MessageDisplayController;->reorderPriorityZeroMessages(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static maybeThrowException(Ljava/lang/RuntimeException;)V
    .registers 3

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-nez v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " This error is only thrown in development mode."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_1d
    throw p0
.end method

.method public static moveToForeground()V
    .registers 2

    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->inForegroundLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-boolean v1, Lcom/leanplum/internal/LeanplumInternal;->inForeground:Z

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    const/4 v1, 0x1

    sput-boolean v1, Lcom/leanplum/internal/LeanplumInternal;->inForeground:Z

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_18

    new-instance v0, Lcom/leanplum/internal/LeanplumInternal$9;

    invoke-direct {v0}, Lcom/leanplum/internal/LeanplumInternal$9;-><init>()V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addStartResponseHandler(Lcom/leanplum/callbacks/StartCallback;)V

    return-void

    :goto_16
    :try_start_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_18

    throw v1

    :catchall_18
    move-exception v1

    goto :goto_16
.end method

.method public static onHasStartedAndRegisteredAsDeveloper()V
    .registers 2

    sget-object v0, Lcom/leanplum/internal/FileManager;->initializingLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-static {}, Lcom/leanplum/internal/FileManager;->initializing()Z

    move-result v1

    if-eqz v1, :cond_12

    new-instance v1, Lcom/leanplum/internal/LeanplumInternal$1;

    invoke-direct {v1}, Lcom/leanplum/internal/LeanplumInternal$1;-><init>()V

    invoke-static {v1}, Lcom/leanplum/internal/FileManager;->setResourceSyncFinishBlock(Lcom/leanplum/internal/FileManager$ResourceUpdateCallback;)V

    goto :goto_15

    :cond_12
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->onHasStartedAndRegisteredAsDeveloperAndFinishedSyncing()V

    :goto_15
    monitor-exit v0

    return-void

    :goto_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_19

    throw v1

    :catchall_19
    move-exception v1

    goto :goto_17
.end method

.method private static onHasStartedAndRegisteredAsDeveloperAndFinishedSyncing()V
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->hasStartedAndRegisteredAsDeveloper:Z

    if-nez v0, :cond_7

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->hasStartedAndRegisteredAsDeveloper:Z

    :cond_7
    return-void
.end method

.method public static performTrackedAction(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_13

    :cond_12
    return-void

    :cond_13
    const-string v1, "vars"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    new-instance v2, Lcom/leanplum/ActionContext;

    const-string v3, "action"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1, p1}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    return-void
.end method

.method public static recordAttributeChanges()V
    .registers 9

    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->userAttributeChanges:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-static {}, Lcom/leanplum/internal/VarCache;->userAttributes()Ljava/util/Map;

    move-result-object v3

    if-nez v3, :cond_1e

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    :cond_1e
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_26
    :goto_26
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v6, :cond_3f

    if-nez v7, :cond_45

    goto :goto_26

    :cond_3f
    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_26

    :cond_45
    new-instance v1, Lcom/leanplum/ActionContext$ContextualValues;

    invoke-direct {v1}, Lcom/leanplum/ActionContext$ContextualValues;-><init>()V

    iput-object v6, v1, Lcom/leanplum/ActionContext$ContextualValues;->previousAttributeValue:Ljava/lang/Object;

    iput-object v7, v1, Lcom/leanplum/ActionContext$ContextualValues;->attributeValue:Ljava/lang/Object;

    invoke-interface {v3, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v6, 0x3

    const/4 v7, 0x0

    const-string v8, "userAttribute"

    invoke-static {v8, v5, v6, v7, v1}, Lcom/leanplum/internal/LeanplumInternal;->maybePerformActions(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V

    const/4 v1, 0x1

    goto :goto_26

    :cond_5a
    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->userAttributeChanges:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    if-eqz v1, :cond_64

    invoke-static {}, Lcom/leanplum/internal/VarCache;->saveUserAttributes()V

    :cond_64
    return-void
.end method

.method private static scheduleAction(Lcom/leanplum/ActionContext;)V
    .registers 2
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/internal/LeanplumInternal$5;

    invoke-direct {v0, p0}, Lcom/leanplum/internal/LeanplumInternal$5;-><init>(Lcom/leanplum/ActionContext;)V

    invoke-static {p0, v0}, Lcom/leanplum/internal/LeanplumInternal;->triggerAction(Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return-void
.end method

.method public static setCalledStart(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->calledStart:Z

    return-void
.end method

.method public static setHasStarted(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->hasStarted:Z

    return-void
.end method

.method public static setIsPaused(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->isPaused:Z

    return-void
.end method

.method public static setIsVariantDebugInfoEnabled(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->isVariantDebugInfoEnabled:Z

    return-void
.end method

.method private static setIssuedStart(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->issuedStart:Z

    return-void
.end method

.method public static setStartSuccessful(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->startSuccessful:Z

    return-void
.end method

.method public static setStartedInBackground(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/LeanplumInternal;->startedInBackground:Z

    return-void
.end method

.method public static setUserLocationAttribute(Landroid/location/Location;Lcom/leanplum/LeanplumLocationAccuracyType;Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;)V
    .registers 4

    new-instance v0, Lcom/leanplum/internal/LeanplumInternal$8;

    invoke-direct {v0, p0, p1, p2}, Lcom/leanplum/internal/LeanplumInternal$8;-><init>(Landroid/location/Location;Lcom/leanplum/LeanplumLocationAccuracyType;Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;)V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addStartResponseHandler(Lcom/leanplum/callbacks/StartCallback;)V

    return-void
.end method

.method private static shouldDisplayAction(Lcom/leanplum/ActionContext;)Z
    .registers 2

    invoke-static {}, Lcom/leanplum/LeanplumMessageDisplayControllers;->getMessageDisplayController()Lcom/leanplum/MessageDisplayController;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    invoke-interface {v0, p0}, Lcom/leanplum/MessageDisplayController;->shouldDisplayMessage(Lcom/leanplum/ActionContext;)Z

    move-result p0

    return p0
.end method

.method private static shouldSuppressMessage(Lcom/leanplum/ActionContext;)Z
    .registers 3
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "__Push Notification"

    invoke-virtual {p0}, Lcom/leanplum/ActionContext;->actionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->shouldDisplayAction(Lcom/leanplum/ActionContext;)Z

    move-result p0

    if-nez p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/ActionManager;->shouldSuppressMessages()Z

    move-result p0

    return p0
.end method

.method public static track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    invoke-static/range {p0 .. p5}, Lcom/leanplum/internal/LeanplumInternal;->makeTrackArgs(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    invoke-static {p0, p4, p1}, Lcom/leanplum/internal/LeanplumInternal;->trackInternalWhenStarted(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_f

    return-void

    :catchall_f
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static trackGeofence(Lcom/leanplum/models/GeofenceEventType;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/models/GeofenceEventType;",
            "D",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lcom/leanplum/models/GeofenceEventType;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p5}, Lcom/leanplum/internal/LeanplumInternal;->makeTrackArgs(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withTrackGeofenceAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    sget-object p1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V
    :try_end_28
    .catchall {:try_start_7 .. :try_end_28} :catchall_29

    return-void

    :catchall_29
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static trackInternal(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withTrackAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    const-string v0, "messageId"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3a

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".m"

    invoke-static {v1, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz p0, :cond_38

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_38

    const-string v2, " "

    invoke-static {v1, v2, p0}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3b

    :cond_38
    move-object p0, v1

    goto :goto_3b

    :cond_3a
    const/4 v0, 0x0

    :goto_3b
    new-instance v1, Lcom/leanplum/ActionContext$ContextualValues;

    invoke-direct {v1}, Lcom/leanplum/ActionContext$ContextualValues;-><init>()V

    iput-object p1, v1, Lcom/leanplum/ActionContext$ContextualValues;->parameters:Ljava/util/Map;

    iput-object p2, v1, Lcom/leanplum/ActionContext$ContextualValues;->arguments:Ljava/util/Map;

    const-string p1, "params"

    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_60

    :try_start_4c
    iget-object p2, v1, Lcom/leanplum/ActionContext$ContextualValues;->arguments:Ljava/util/Map;

    new-instance v2, Lorg/json/JSONObject;

    iget-object v3, v1, Lcom/leanplum/ActionContext$ContextualValues;->arguments:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_60
    .catch Lorg/json/JSONException; {:try_start_4c .. :try_end_60} :catch_60

    :catch_60
    :cond_60
    const-string p1, "event"

    const/4 p2, 0x3

    invoke-static {p1, p0, p2, v0, v1}, Lcom/leanplum/internal/LeanplumInternal;->maybePerformActions(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V

    return-void
.end method

.method private static trackInternalWhenStarted(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->issuedStart:Z

    if-eqz v0, :cond_8

    invoke-static {p0, p1, p2}, Lcom/leanplum/internal/LeanplumInternal;->trackInternal(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void

    :cond_8
    new-instance v0, Lcom/leanplum/internal/LeanplumInternal$7;

    invoke-direct {v0, p0, p1, p2}, Lcom/leanplum/internal/LeanplumInternal$7;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static trackLocal(Ljava/lang/String;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    sget-boolean v0, Lcom/leanplum/internal/LeanplumInternal;->issuedStart:Z

    if-eqz v0, :cond_f

    invoke-static {p0, p1}, Lcom/leanplum/internal/LeanplumInternal;->trackLocalInternal(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_f
    new-instance v0, Lcom/leanplum/internal/LeanplumInternal$6;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/internal/LeanplumInternal$6;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static trackLocalInternal(Ljava/lang/String;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    new-instance v0, Lcom/leanplum/ActionContext$ContextualValues;

    invoke-direct {v0}, Lcom/leanplum/ActionContext$ContextualValues;-><init>()V

    iput-object p1, v0, Lcom/leanplum/ActionContext$ContextualValues;->parameters:Ljava/util/Map;

    const/4 p1, 0x3

    const/4 v1, 0x0

    const-string v2, "event"

    invoke-static {v2, p0, p1, v1, v0}, Lcom/leanplum/internal/LeanplumInternal;->maybePerformActions(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V

    return-void
.end method

.method public static triggerAction(Lcom/leanplum/ActionContext;)V
    .registers 2

    const/4 v0, 0x0

    .line 66
    invoke-static {p0, v0}, Lcom/leanplum/internal/LeanplumInternal;->triggerAction(Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return-void
.end method

.method public static triggerAction(Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 9

    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->actionHandlers:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0}, Lcom/leanplum/ActionContext;->actionName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_16

    if-eqz p1, :cond_14

    invoke-virtual {p1}, Lcom/leanplum/callbacks/VariablesChangedCallback;->variablesChanged()V

    :cond_14
    monitor-exit v0

    return-void

    :cond_16
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_40

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_26
    if-ge v1, v3, :cond_3d

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    check-cast v4, Lcom/leanplum/callbacks/ActionCallback;

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v5

    new-instance v6, Lcom/leanplum/internal/LeanplumInternal$2;

    invoke-direct {v6, v4, p0, p1, v0}, Lcom/leanplum/internal/LeanplumInternal$2;-><init>(Lcom/leanplum/callbacks/ActionCallback;Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-virtual {v5, v6}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_26

    :cond_3d
    return-void

    :goto_3e
    :try_start_3e
    monitor-exit v0
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_40

    throw p0

    :catchall_40
    move-exception p0

    goto :goto_3e
.end method

.method public static triggerStartIssued()V
    .registers 5

    sget-object v0, Lcom/leanplum/internal/LeanplumInternal;->startIssuedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_4
    invoke-static {v1}, Lcom/leanplum/internal/LeanplumInternal;->setIssuedStart(Z)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v1, :cond_1e

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/Runnable;

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_c

    :cond_1e
    sget-object v1, Lcom/leanplum/internal/LeanplumInternal;->startIssuedHandlers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0

    return-void

    :goto_25
    monitor-exit v0
    :try_end_26
    .catchall {:try_start_4 .. :try_end_26} :catchall_27

    throw v1

    :catchall_27
    move-exception v1

    goto :goto_25
.end method

.method public static validateAttributes(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/Map;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :try_start_9
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_11
    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz p2, :cond_42

    instance-of v3, v2, Ljava/lang/Iterable;

    if-eqz v3, :cond_42

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_31
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_60

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4, p1}, Lcom/leanplum/internal/LeanplumInternal;->isValidScalarValue(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_31

    goto :goto_11

    :cond_42
    instance-of v3, v2, Ljava/util/Date;

    if-eqz v3, :cond_58

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    :cond_58
    if-eqz v2, :cond_60

    invoke-static {v2, p1}, Lcom/leanplum/internal/LeanplumInternal;->isValidScalarValue(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    :cond_60
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_69
    .catch Ljava/util/ConcurrentModificationException; {:try_start_9 .. :try_end_69} :catch_6b

    goto :goto_11

    :cond_6a
    return-object v0

    :catch_6b
    new-instance p0, Lcom/leanplum/LeanplumException;

    const-string p1, "ConcurrentModificationException: You cannot modify Map<String, ?> attributes/parameters. Will override with an empty map"

    invoke-direct {p0, p1}, Lcom/leanplum/LeanplumException;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->maybeThrowException(Ljava/lang/RuntimeException;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0
.end method
