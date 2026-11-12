.class public Lcom/leanplum/ActionContext;
.super Lcom/leanplum/internal/BaseActionContext;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/ActionContext$ContextualValues;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/leanplum/internal/BaseActionContext;",
        "Ljava/lang/Comparable<",
        "Lcom/leanplum/ActionContext;",
        ">;"
    }
.end annotation


# instance fields
.field private actionNamedHandler:Lcom/leanplum/callbacks/ActionCallback;

.field private final contentVersion:I

.field private contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

.field private key:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private parentContext:Lcom/leanplum/ActionContext;

.field private preventRealtimeUpdating:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v4, 0x0

    const/16 v5, 0x3e8

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 19
    invoke-direct/range {v0 .. v5}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6
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
            "I)V"
        }
    .end annotation

    invoke-direct {p0, p3, p4}, Lcom/leanplum/internal/BaseActionContext;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p3, 0x0

    iput-boolean p3, p0, Lcom/leanplum/ActionContext;->preventRealtimeUpdating:Z

    iput-object p1, p0, Lcom/leanplum/ActionContext;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/internal/BaseActionContext;->args:Ljava/util/Map;

    invoke-static {}, Lcom/leanplum/internal/VarCache;->contentVersion()I

    move-result p1

    iput p1, p0, Lcom/leanplum/ActionContext;->contentVersion:I

    iput p5, p0, Lcom/leanplum/internal/BaseActionContext;->priority:I

    return-void
.end method

.method public static synthetic access$000(Lcom/leanplum/ActionContext;)Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/ActionContext;->name:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic access$100(Lcom/leanplum/ActionContext;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lcom/leanplum/ActionContext;->executeChainedMessage(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static convertToBoolean(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22

    const-string v0, "yes"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22

    const-string v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22

    const-string v0, "on"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_22

    const/4 p0, 0x0

    return p0

    :cond_22
    const/4 p0, 0x1

    return p0
.end method

.method private createActionContextForMessageId(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Z
    .registers 7
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
            "Ljava/lang/Boolean;",
            ")Z"
        }
    .end annotation

    :try_start_0
    new-instance v0, Lcom/leanplum/ActionContext;

    invoke-direct {v0, p1, p2, p3}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    iput-object p1, v0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    iget-boolean p1, p0, Lcom/leanplum/ActionContext;->preventRealtimeUpdating:Z

    iput-boolean p1, v0, Lcom/leanplum/ActionContext;->preventRealtimeUpdating:Z

    iget-boolean p1, p0, Lcom/leanplum/internal/BaseActionContext;->isRooted:Z

    iput-boolean p1, v0, Lcom/leanplum/internal/BaseActionContext;->isRooted:Z

    iput-object p4, v0, Lcom/leanplum/ActionContext;->key:Ljava/lang/String;

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_22

    new-instance p1, Lcom/leanplum/ActionContext$1;

    invoke-direct {p1, p0, v0, p3}, Lcom/leanplum/ActionContext$1;-><init>(Lcom/leanplum/ActionContext;Lcom/leanplum/ActionContext;Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/leanplum/internal/LeanplumInternal;->triggerAction(Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    goto :goto_27

    :cond_22
    iput-object p0, v0, Lcom/leanplum/ActionContext;->parentContext:Lcom/leanplum/ActionContext;

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->triggerAction(Lcom/leanplum/ActionContext;)V
    :try_end_27
    .catchall {:try_start_0 .. :try_end_27} :catchall_29

    :goto_27
    const/4 p0, 0x1

    return p0

    :catchall_29
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method private defaultValues()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/leanplum/ActionContext;->getDefinition()Ljava/util/Map;

    move-result-object p0

    const-string v0, "values"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-nez p0, :cond_17

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :cond_17
    return-object p0
.end method

.method private eventWithParentEventNames(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_a
    iget-object v2, p0, Lcom/leanplum/ActionContext;->parentContext:Lcom/leanplum/ActionContext;

    if-eqz v2, :cond_14

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lcom/leanplum/ActionContext;->parentContext:Lcom/leanplum/ActionContext;

    goto :goto_a

    :cond_14
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    :goto_1a
    const/4 v2, -0x1

    if-lt p0, v2, :cond_4a

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_28

    const/16 v3, 0x20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_28
    if-le p0, v2, :cond_33

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/ActionContext;

    iget-object v2, v2, Lcom/leanplum/ActionContext;->key:Ljava/lang/String;

    goto :goto_34

    :cond_33
    move-object v2, p1

    :goto_34
    const-string v3, ""

    if-nez v2, :cond_3e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_4a

    :cond_3e
    const-string v4, " action"

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p0, p0, -0x1

    goto :goto_1a

    :cond_4a
    :goto_4a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private executeChainedMessage(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_4

    return v0

    :cond_4
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    if-eqz p2, :cond_36

    const-string v1, "vars"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljava/util/Map;

    const-string v1, "action"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_36

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object v2, p0

    move-object v5, p1

    move-object v6, p3

    invoke-direct/range {v2 .. v7}, Lcom/leanplum/ActionContext;->createActionContextForMessageId(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Z

    move-result p0

    if-eqz p0, :cond_36

    const/4 p0, 0x1

    return p0

    :cond_36
    return v0
.end method

.method public static filePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChainedMessageId(Ljava/util/Map;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    if-eqz p0, :cond_19

    const-string v0, "__name__"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Chain to Existing Message"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    const-string v0, "Chained message"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_19
    const/4 p0, 0x0

    return-object p0
.end method

.method private getChildArgs(Ljava/lang/String;)Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/util/Map;

    if-nez p1, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    const-string p1, "__name__"

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/leanplum/ActionContext;->getDefinition(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    const-string v0, "values"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-static {p1, p0}, Lcom/leanplum/internal/VarCache;->mergeHelper(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method private getDefaultValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    const-string v0, "\\."

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Lcom/leanplum/ActionContext;->defaultValues()Ljava/util/Map;

    move-result-object p0

    const/4 v0, 0x0

    :goto_b
    array-length v1, p1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_34

    if-nez p0, :cond_12

    return-object v2

    :cond_12
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_25

    aget-object p1, p1, v0

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_20

    return-object v2

    :cond_20
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_25
    aget-object v1, p1, v0

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_34
    return-object v2
.end method

.method private getDefinition()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 22
    iget-object p0, p0, Lcom/leanplum/ActionContext;->name:Ljava/lang/String;

    invoke-static {p0}, Lcom/leanplum/ActionContext;->getDefinition(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method private static getDefinition(Ljava/lang/String;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/VarCache;->actionDefinitions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-nez p0, :cond_15

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :cond_15
    return-object p0
.end method

.method private isChainToExistingMessageStarted(Ljava/util/Map;Ljava/lang/String;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-static {p1}, Lcom/leanplum/ActionContext;->getChainedMessageId(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/leanplum/ActionContext;->shouldForceContentUpdateForChainedMessage(Ljava/util/Map;)Z

    move-result p1

    if-nez p1, :cond_17

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object p1

    invoke-direct {p0, v1, p1, p2}, Lcom/leanplum/ActionContext;->executeChainedMessage(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_17
    new-instance p1, Lcom/leanplum/ActionContext$2;

    invoke-direct {p1, p0, v1, p2}, Lcom/leanplum/ActionContext$2;-><init>(Lcom/leanplum/ActionContext;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/leanplum/Leanplum;->forceContentUpdate(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return v0
.end method

.method private kinds()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/leanplum/ActionContext;->getDefinition()Ljava/util/Map;

    move-result-object p0

    const-string v0, "kinds"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-nez p0, :cond_17

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :cond_17
    return-object p0
.end method

.method public static mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static mapToJsonObject(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->mapToJsonObject(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static shouldForceContentUpdateForChainedMessage(Ljava/util/Map;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    invoke-static {p0}, Lcom/leanplum/ActionContext;->getChainedMessageId(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1c

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_1a

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    :cond_1a
    const/4 p0, 0x1

    return p0

    :cond_1c
    return v0
.end method

.method private triggerActionNamedHandler(Ljava/lang/String;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/leanplum/ActionContext;->actionNamedHandler:Lcom/leanplum/callbacks/ActionCallback;

    if-eqz v0, :cond_12

    new-instance v0, Lcom/leanplum/ActionContext;

    iget-object v1, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    invoke-direct {v0, p1, p2, v1}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    iput-object p0, v0, Lcom/leanplum/ActionContext;->parentContext:Lcom/leanplum/ActionContext;

    iget-object p0, p0, Lcom/leanplum/ActionContext;->actionNamedHandler:Lcom/leanplum/callbacks/ActionCallback;

    invoke-virtual {p0, v0}, Lcom/leanplum/callbacks/ActionCallback;->onResponse(Lcom/leanplum/ActionContext;)Z

    :cond_12
    return-void
.end method

.method private updateArgs(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/leanplum/ActionContext;->kinds()Ljava/util/Map;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_c
    :goto_c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    const/4 v3, 0x0

    if-eqz p3, :cond_2a

    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_2b

    :cond_2a
    move-object v4, v3

    :goto_2b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "__name__"

    const-string v7, "action"

    if-eqz v5, :cond_4c

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6a

    :cond_4c
    instance-of v8, v1, Ljava/util/Map;

    if-eqz v8, :cond_6a

    move-object v8, v1

    check-cast v8, Ljava/util/Map;

    invoke-interface {v8, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6a

    instance-of v1, v4, Ljava/util/Map;

    if-eqz v1, :cond_60

    move-object v3, v4

    check-cast v3, Ljava/util/Map;

    :cond_60
    const-string v1, "."

    invoke-static {p2, v2, v1}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v8, v1, v3}, Lcom/leanplum/ActionContext;->updateArgs(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_c

    :cond_6a
    if-eqz v5, :cond_74

    const-string v8, "file"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7c

    :cond_74
    const-string v8, "__file__"

    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_8d

    :cond_7c
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v4, :cond_87

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_88

    :cond_87
    move-object v2, v3

    :goto_88
    const/4 v4, 0x0

    invoke-static {v4, v1, v2, v3, v3}, Lcom/leanplum/internal/FileManager;->maybeDownloadFile(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Lcom/leanplum/internal/FileManager$DownloadFileResult;

    goto :goto_c

    :cond_8d
    if-eqz v5, :cond_95

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    :cond_95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/util/Map;

    if-eqz v2, :cond_c

    check-cast v1, Ljava/util/Map;

    new-instance v2, Lcom/leanplum/ActionContext;

    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    invoke-direct {v2, v3, v1, v4}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/leanplum/ActionContext;->update()V

    goto/16 :goto_c

    :cond_c0
    return-void
.end method


# virtual methods
.method public actionName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/ActionContext;->name:Ljava/lang/String;

    return-object p0
.end method

.method public booleanNamed(Ljava/lang/String;)Z
    .registers 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string p0, "booleanNamed - Invalid name parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return v1

    :cond_f
    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_16

    return v1

    :cond_16
    :try_start_16
    instance-of p1, p0, Ljava/lang/Boolean;

    if-eqz p1, :cond_21

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_21
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/ActionContext;->convertToBoolean(Ljava/lang/String;)Z

    move-result p0
    :try_end_29
    .catchall {:try_start_16 .. :try_end_29} :catchall_2a

    return p0

    :catchall_2a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return v1
.end method

.method public compareTo(Lcom/leanplum/ActionContext;)I
    .registers 2
    .param p1    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget p0, p0, Lcom/leanplum/internal/BaseActionContext;->priority:I

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getPriority()I

    move-result p1

    sub-int/2addr p0, p1

    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 8
    check-cast p1, Lcom/leanplum/ActionContext;

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->compareTo(Lcom/leanplum/ActionContext;)I

    move-result p0

    return p0
.end method

.method public fillTemplate(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    iget-object v0, p0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    if-eqz v0, :cond_67

    if-eqz p1, :cond_67

    const-string v0, "##"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_67

    iget-object v1, p0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    iget-object v1, v1, Lcom/leanplum/ActionContext$ContextualValues;->parameters:Ljava/util/Map;

    if-eqz v1, :cond_46

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_46

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "##Parameter "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v3, v4, v0}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1c

    :cond_46
    iget-object v0, p0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    iget-object v0, v0, Lcom/leanplum/ActionContext$ContextualValues;->previousAttributeValue:Ljava/lang/Object;

    if-eqz v0, :cond_56

    const-string v1, "##Previous Value##"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_56
    iget-object p0, p0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    iget-object p0, p0, Lcom/leanplum/ActionContext$ContextualValues;->attributeValue:Ljava/lang/Object;

    if-eqz p0, :cond_67

    const-string v0, "##Value##"

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_67
    return-object p1
.end method

.method public getContextualValues()Lcom/leanplum/ActionContext$ContextualValues;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    return-object p0
.end method

.method public getParentContext()Lcom/leanplum/ActionContext;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/ActionContext;->parentContext:Lcom/leanplum/ActionContext;

    return-object p0
.end method

.method public hasParentContext()Z
    .registers 1

    iget-object p0, p0, Lcom/leanplum/ActionContext;->parentContext:Lcom/leanplum/ActionContext;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public muteFutureMessagesOfSameKind()V
    .registers 2

    :try_start_0
    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v0

    iget-object p0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/ActionManager;->muteFutureMessagesOfKind(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    return-void

    :catchall_a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public numberNamed(Ljava/lang/String;)Ljava/lang/Number;
    .registers 4

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "numberNamed - Invalid name parameter provided."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0

    :cond_16
    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_3a

    :try_start_1c
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3a

    instance-of p1, p0, Ljava/lang/Number;

    if-eqz p1, :cond_2d

    check-cast p0, Ljava/lang/Number;

    return-object p0

    :cond_2d
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p0
    :try_end_35
    .catchall {:try_start_1c .. :try_end_35} :catchall_36

    return-object p0

    :catchall_36
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_3a
    return-object v0
.end method

.method public objectNamed(Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "objectNamed - Invalid name parameter provided."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_10
    :try_start_10
    iget-boolean v0, p0, Lcom/leanplum/ActionContext;->preventRealtimeUpdating:Z

    if-nez v0, :cond_4d

    invoke-static {}, Lcom/leanplum/internal/VarCache;->contentVersion()I

    move-result v0

    iget v2, p0, Lcom/leanplum/ActionContext;->contentVersion:I

    if-le v0, v2, :cond_4d

    iget-object v0, p0, Lcom/leanplum/ActionContext;->parentContext:Lcom/leanplum/ActionContext;

    if-eqz v0, :cond_29

    iget-object v2, p0, Lcom/leanplum/ActionContext;->key:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/leanplum/ActionContext;->getChildArgs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/internal/BaseActionContext;->args:Ljava/util/Map;

    goto :goto_4d

    :cond_29
    iget-object v0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    if-eqz v0, :cond_4d

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_4d

    const-string v2, "vars"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lcom/leanplum/internal/BaseActionContext;->args:Ljava/util/Map;

    :cond_4d
    :goto_4d
    invoke-static {p1}, Lcom/leanplum/internal/VarCache;->getNameComponents(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/leanplum/internal/BaseActionContext;->args:Ljava/util/Map;

    invoke-static {p1, p0}, Lcom/leanplum/internal/VarCache;->getMergedValueFromComponentArray([Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_57
    .catchall {:try_start_10 .. :try_end_57} :catchall_58

    return-object p0

    :catchall_58
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public preventRealtimeUpdating()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/leanplum/ActionContext;->preventRealtimeUpdating:Z

    return-void
.end method

.method public runActionNamed(Ljava/lang/String;)V
    .registers 8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "runActionNamed - Invalid name parameter provided."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    invoke-direct {p0, p1}, Lcom/leanplum/ActionContext;->getChildArgs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lcom/leanplum/ActionContext;->triggerActionNamedHandler(Ljava/lang/String;Ljava/util/Map;)V

    if-eqz v2, :cond_33

    invoke-direct {p0, v2, p1}, Lcom/leanplum/ActionContext;->isChainToExistingMessageStarted(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_33

    const-string v0, "__name__"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object v0, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/leanplum/ActionContext;->createActionContextForMessageId(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Z

    :cond_33
    return-void
.end method

.method public runTrackedActionNamed(Ljava/lang/String;)V
    .registers 8

    :try_start_0
    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    if-eqz v0, :cond_27

    iget-boolean v0, p0, Lcom/leanplum/internal/BaseActionContext;->isRooted:Z

    if-eqz v0, :cond_27

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const-string p0, "runTrackedActionNamed - Invalid name parameter provided."

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1d
    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/leanplum/ActionContext;->trackMessageEvent(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    goto :goto_29

    :cond_27
    move-object v0, p0

    move-object v1, p1

    :goto_29
    invoke-virtual {v0, v1}, Lcom/leanplum/ActionContext;->runActionNamed(Ljava/lang/String;)V
    :try_end_2c
    .catchall {:try_start_0 .. :try_end_2c} :catchall_2d

    return-void

    :catchall_2d
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public setActionNamedHandler(Lcom/leanplum/callbacks/ActionCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/ActionContext;->actionNamedHandler:Lcom/leanplum/callbacks/ActionCallback;

    return-void
.end method

.method public setContextualValues(Lcom/leanplum/ActionContext$ContextualValues;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/ActionContext;->contextualValues:Lcom/leanplum/ActionContext$ContextualValues;

    return-void
.end method

.method public streamNamed(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 12

    const-string v0, "Could not open stream named "

    const/4 v1, 0x0

    :try_start_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_12

    const-string p0, "streamNamed - Invalid name parameter provided."

    new-array p1, v3, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_12
    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1}, Lcom/leanplum/ActionContext;->getDefaultValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v2, :cond_22

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p0

    if-nez p0, :cond_2a

    :cond_22
    if-eqz v8, :cond_4a

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_4a

    :cond_2a
    invoke-static {v2, v8, v1}, Lcom/leanplum/internal/FileManager;->fileValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v4 .. v9}, Lcom/leanplum/internal/FileManager;->stream(ZLjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;[B)Ljava/io/InputStream;

    move-result-object p0

    if-nez p0, :cond_49

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v0, v3, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_49
    .catchall {:try_start_3 .. :try_end_49} :catchall_4b

    :cond_49
    return-object p0

    :cond_4a
    return-object v1

    :catchall_4b
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public stringNamed(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "stringNamed - Invalid name parameter provided."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_10
    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_17

    return-object v1

    :cond_17
    :try_start_17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->fillTemplate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1f
    .catchall {:try_start_17 .. :try_end_1f} :catchall_20

    return-object p0

    :catchall_20
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public track(Ljava/lang/String;DLjava/util/Map;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    if-eqz v0, :cond_2c

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_19

    const-string p0, "track - Invalid event parameter provided."

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_19
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    const-string v0, "messageId"

    iget-object p0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    invoke-virtual {v5, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x0

    move-object v0, p1

    move-wide v1, p2

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/leanplum/internal/LeanplumInternal;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_2c
    .catchall {:try_start_0 .. :try_end_2c} :catchall_2d

    :cond_2c
    return-void

    :catchall_2d
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public trackMessageEvent(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_3d

    iget-object v0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    if-eqz v0, :cond_3d

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    const-string p0, "trackMessageEvent - Invalid event parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_19
    invoke-direct {p0, p1}, Lcom/leanplum/ActionContext;->eventWithParentEventNames(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2b

    const-string p0, "trackMessageEvent - Failed to generate parent action names."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_2b
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    const-string p1, "messageId"

    iget-object p0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    invoke-virtual {v5, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-wide v1, p2

    move-object v3, p4

    move-object v4, p5

    invoke-static/range {v0 .. v5}, Lcom/leanplum/internal/LeanplumInternal;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_3d
    .catchall {:try_start_0 .. :try_end_3d} :catchall_3e

    :cond_3d
    return-void

    :catchall_3e
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public update()V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/internal/BaseActionContext;->args:Ljava/util/Map;

    const-string v1, ""

    invoke-direct {p0}, Lcom/leanplum/ActionContext;->defaultValues()Ljava/util/Map;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/leanplum/ActionContext;->updateArgs(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
