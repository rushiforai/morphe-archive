.class public Lcom/leanplum/internal/VarCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/VarCache$StreamProvider;
    }
.end annotation


# static fields
.field private static final LEANPLUM:Ljava/lang/String; = "__leanplum__"

.field private static final NAME_COMPONENT_PATTERN:Ljava/util/regex/Pattern;

.field private static final NAME_COMPONENT_REGEX:Ljava/lang/String; = "(?:[^\\.\\[.(\\\\]+|\\\\.)+"

.field private static final actionDefinitions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static contentVersion:I

.field private static final defaultKinds:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static devModeActionDefinitionsFromServer:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static devModeFileAttributesFromServer:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static devModeValuesFromServer:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static diffs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final fileAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final fileStreams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/leanplum/internal/VarCache$StreamProvider;",
            ">;"
        }
    .end annotation
.end field

.field private static hasReceivedDiffs:Z

.field private static volatile localCaps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private static merged:Ljava/lang/Object;

.field private static messageDiffs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static messages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static regions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static silent:Z

.field private static updateBlock:Lcom/leanplum/CacheUpdateBlock;

.field private static userAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final valuesFromClient:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static variantDebugInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile variants:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final vars:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/leanplum/Var<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static volatile varsJson:Ljava/lang/String;

.field private static volatile varsSignature:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->fileAttributes:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->fileStreams:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->valuesFromClient:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->defaultKinds:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->actionDefinitions:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->diffs:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->regions:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->messageDiffs:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/leanplum/internal/VarCache;->hasReceivedDiffs:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->messages:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->variantDebugInfo:Ljava/util/Map;

    const-string v0, "(?:[^\\.\\[.(\\\\]+|\\\\.)+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/leanplum/internal/VarCache;->NAME_COMPONENT_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static actionDefinitions()Ljava/util/Map;
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

    sget-object v0, Lcom/leanplum/internal/VarCache;->actionDefinitions:Ljava/util/Map;

    return-object v0
.end method

.method public static applyVariableDiffs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_33

    sput-object p0, Lcom/leanplum/internal/VarCache;->diffs:Ljava/util/Map;

    invoke-static {}, Lcom/leanplum/internal/VarCache;->computeMergedDictionary()V

    new-instance p0, Ljava/util/HashMap;

    sget-object v0, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-direct {p0, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_16
    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/leanplum/Var;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Lcom/leanplum/Var;->update()V

    goto :goto_16

    :cond_30
    invoke-static {}, Lcom/leanplum/internal/VarCache;->fileVariableFinish()V

    :cond_33
    if-eqz p1, :cond_e1

    sput-object p1, Lcom/leanplum/internal/VarCache;->messageDiffs:Ljava/util/Map;

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_44
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "action"

    const-string v3, "vars"

    if-eqz v1, :cond_96

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    sget-object v6, Lcom/leanplum/internal/VarCache;->actionDefinitions:Ljava/util/Map;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v7, "values"

    filled-new-array {v2, v7}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/leanplum/internal/Util;->multiIndex(Ljava/util/Map;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-static {v2, v4}, Lcom/leanplum/internal/VarCache;->mergeHelper(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_44

    :cond_96
    sput-object p0, Lcom/leanplum/internal/VarCache;->messages:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_a0
    :goto_a0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lcom/leanplum/internal/VarCache;->messages:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_a0

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_a0

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    new-instance v5, Lcom/leanplum/ActionContext;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1, v4, v0}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/leanplum/ActionContext;->update()V

    goto :goto_a0

    :cond_e1
    if-eqz p2, :cond_e5

    sput-object p2, Lcom/leanplum/internal/VarCache;->regions:Ljava/util/Map;

    :cond_e5
    if-nez p1, :cond_e9

    if-eqz p2, :cond_ff

    :cond_e9
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    invoke-static {p0, p1}, Lcom/leanplum/internal/ActionManager;->getForegroundandBackgroundRegionNames(Ljava/util/Set;Ljava/util/Set;)V

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getLocationManager()Lcom/leanplum/LocationManager;

    move-result-object v0

    if-eqz v0, :cond_ff

    invoke-interface {v0, p2, p0, p1}, Lcom/leanplum/LocationManager;->setRegionsData(Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    :cond_ff
    if-eqz p3, :cond_103

    sput-object p3, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    :cond_103
    if-eqz p4, :cond_107

    sput-object p4, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    :cond_107
    if-eqz p5, :cond_10c

    invoke-static {p5}, Lcom/leanplum/internal/VarCache;->setVariantDebugInfo(Ljava/util/Map;)V

    :cond_10c
    if-eqz p6, :cond_112

    sput-object p6, Lcom/leanplum/internal/VarCache;->varsJson:Ljava/lang/String;

    sput-object p7, Lcom/leanplum/internal/VarCache;->varsSignature:Ljava/lang/String;

    :cond_112
    sget p0, Lcom/leanplum/internal/VarCache;->contentVersion:I

    add-int/lit8 p0, p0, 0x1

    sput p0, Lcom/leanplum/internal/VarCache;->contentVersion:I

    sget-boolean p0, Lcom/leanplum/internal/VarCache;->silent:Z

    if-nez p0, :cond_122

    invoke-static {}, Lcom/leanplum/internal/VarCache;->saveDiffs()V

    invoke-static {}, Lcom/leanplum/internal/VarCache;->triggerHasReceivedDiffs()V

    :cond_122
    return-void
.end method

.method private static areActionDefinitionsEqual(Ljava/util/Map;Ljava/util/Map;)Z
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_98

    if-eqz p1, :cond_98

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v2

    if-ne v1, v2, :cond_98

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_17
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_97

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_96

    if-eqz v3, :cond_96

    const-string v4, "kind"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "values"

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string v8, "kinds"

    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    const-string v10, "options"

    invoke-interface {v3, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v5, :cond_64

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_96

    :cond_64
    if-eqz v7, :cond_70

    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_96

    :cond_70
    if-eqz v9, :cond_7c

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v9, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_96

    :cond_7c
    if-nez v3, :cond_80

    move v4, v2

    goto :goto_81

    :cond_80
    move v4, v0

    :goto_81
    invoke-interface {v1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_88

    move v2, v0

    :cond_88
    if-ne v4, v2, :cond_96

    if-eqz v3, :cond_17

    invoke-interface {v1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    :cond_96
    return v0

    :cond_97
    return v2

    :cond_98
    return v0
.end method

.method public static clearUserContent()V
    .registers 2

    sget-object v0, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    sget-object v0, Lcom/leanplum/internal/VarCache;->variantDebugInfo:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    const/4 v0, 0x0

    sput-object v0, Lcom/leanplum/internal/VarCache;->varsJson:Ljava/lang/String;

    sput-object v0, Lcom/leanplum/internal/VarCache;->varsSignature:Ljava/lang/String;

    sget-object v1, Lcom/leanplum/internal/VarCache;->diffs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    sget-object v1, Lcom/leanplum/internal/VarCache;->messageDiffs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->messages:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->merged:Ljava/lang/Object;

    sput-object v0, Lcom/leanplum/internal/VarCache;->devModeValuesFromServer:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->devModeFileAttributesFromServer:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->devModeActionDefinitionsFromServer:Ljava/util/Map;

    return-void
.end method

.method private static computeMergedDictionary()V
    .registers 2

    sget-object v0, Lcom/leanplum/internal/VarCache;->valuesFromClient:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/leanplum/internal/VarCache;->diffs:Ljava/util/Map;

    invoke-static {v0, v1}, Lcom/leanplum/internal/VarCache;->mergeHelper(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sput-object v1, Lcom/leanplum/internal/VarCache;->merged:Ljava/lang/Object;

    monitor-exit v0

    return-void

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_f

    throw v1

    :catchall_f
    move-exception v1

    goto :goto_d
.end method

.method public static contentVersion()I
    .registers 1

    sget v0, Lcom/leanplum/internal/VarCache;->contentVersion:I

    return v0
.end method

.method private static fileVariableFinish()V
    .registers 5

    new-instance v0, Ljava/util/HashMap;

    sget-object v1, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_67

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/leanplum/Var;

    if-eqz v1, :cond_f

    iget-object v2, v1, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    iget-boolean v3, v1, Lcom/leanplum/Var;->isResource:Z

    if-eqz v3, :cond_f

    const-string v3, "file"

    invoke-virtual {v1}, Lcom/leanplum/Var;->kind()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    if-eqz v2, :cond_f

    invoke-virtual {v1}, Lcom/leanplum/Var;->defaultValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    sget-object v3, Lcom/leanplum/internal/VarCache;->fileAttributes:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    sget-object v4, Lcom/leanplum/internal/VarCache;->fileStreams:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/internal/VarCache$StreamProvider;

    if-eqz v3, :cond_f

    if-eqz v2, :cond_f

    invoke-virtual {v1}, Lcom/leanplum/Var;->stringValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/VarCache;->getResIdFromPath(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/leanplum/Var;->setOverrideResId(I)V

    goto :goto_f

    :cond_67
    return-void
.end method

.method public static getActionDefinitionType(Ljava/lang/String;)I
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/VarCache;->actionDefinitions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_1d

    check-cast p0, Ljava/util/Map;

    const-string v0, "kind"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-eqz p0, :cond_1d

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public static getDiffs()Ljava/util/Map;
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

    sget-object v0, Lcom/leanplum/internal/VarCache;->diffs:Ljava/util/Map;

    return-object v0
.end method

.method public static getMergedValueFromComponentArray([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/leanplum/internal/VarCache;->merged:Ljava/lang/Object;

    if-nez v0, :cond_6

    sget-object v0, Lcom/leanplum/internal/VarCache;->valuesFromClient:Ljava/util/Map;

    .line 16
    :cond_6
    invoke-static {p0, v0}, Lcom/leanplum/internal/VarCache;->getMergedValueFromComponentArray([Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getMergedValueFromComponentArray([Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_3
    if-ge v2, v0, :cond_e

    aget-object v3, p0, v2

    invoke-static {p1, v3, v1}, Lcom/leanplum/internal/VarCache;->traverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p1

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_e
    return-object p1
.end method

.method public static getMessageDiffs()Ljava/util/Map;
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

    sget-object v0, Lcom/leanplum/internal/VarCache;->messageDiffs:Ljava/util/Map;

    return-object v0
.end method

.method public static getNameComponents(Ljava/lang/String;)[Ljava/lang/String;
    .registers 5

    sget-object v0, Lcom/leanplum/internal/VarCache;->NAME_COMPONENT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_b
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_21
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public static getResIdFromPath(Ljava/lang/String;)I
    .registers 6

    const/4 v0, 0x0

    :try_start_1
    const-string v1, "res/"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    invoke-virtual {p0, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, p0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_3b} :catch_3c

    return p0

    :catch_3c
    return v0
.end method

.method public static getSecuredVars()Lcom/leanplum/SecuredVars;
    .registers 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/leanplum/internal/VarCache;->varsJson:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1a

    sget-object v0, Lcom/leanplum/internal/VarCache;->varsSignature:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1a

    new-instance v0, Lcom/leanplum/SecuredVars;

    sget-object v1, Lcom/leanplum/internal/VarCache;->varsJson:Ljava/lang/String;

    sget-object v2, Lcom/leanplum/internal/VarCache;->varsSignature:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/leanplum/SecuredVars;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_1a
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getVariable(Ljava/lang/String;)Lcom/leanplum/Var;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Lcom/leanplum/Var<",
            "TT;>;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/leanplum/Var;

    return-object p0
.end method

.method public static getVariantDebugInfo()Ljava/util/Map;
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

    sget-object v0, Lcom/leanplum/internal/VarCache;->variantDebugInfo:Ljava/util/Map;

    return-object v0
.end method

.method public static hasReceivedDiffs()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/VarCache;->hasReceivedDiffs:Z

    return v0
.end method

.method private static isStreamAvailable(Lcom/leanplum/internal/VarCache$StreamProvider;)Z
    .registers 1

    if-eqz p0, :cond_d

    :try_start_2
    invoke-interface {p0}, Lcom/leanplum/internal/VarCache$StreamProvider;->openStream()Ljava/io/InputStream;

    move-result-object p0

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_d

    const/4 p0, 0x1

    return p0

    :catchall_d
    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public static kindFromValue(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_49

    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_49

    instance-of v0, p0, Ljava/lang/Short;

    if-nez v0, :cond_49

    instance-of v0, p0, Ljava/lang/Character;

    if-nez v0, :cond_49

    instance-of v0, p0, Ljava/lang/Byte;

    if-nez v0, :cond_49

    instance-of v0, p0, Ljava/math/BigInteger;

    if-nez v0, :cond_49

    instance-of v0, p0, Ljava/lang/Float;

    if-nez v0, :cond_46

    instance-of v0, p0, Ljava/lang/Double;

    if-nez v0, :cond_46

    instance-of v0, p0, Ljava/math/BigDecimal;

    if-nez v0, :cond_46

    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_2b

    const-string p0, "string"

    return-object p0

    :cond_2b
    instance-of v0, p0, Ljava/util/List;

    if-nez v0, :cond_43

    instance-of v0, p0, Ljava/lang/reflect/Array;

    if-nez v0, :cond_43

    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_3a

    const-string p0, "group"

    return-object p0

    :cond_3a
    instance-of p0, p0, Ljava/lang/Boolean;

    if-eqz p0, :cond_41

    const-string p0, "bool"

    return-object p0

    :cond_41
    const/4 p0, 0x0

    return-object p0

    :cond_43
    const-string p0, "list"

    return-object p0

    :cond_46
    const-string p0, "float"

    return-object p0

    :cond_49
    const-string p0, "integer"

    return-object p0
.end method

.method public static loadDiffs()V
    .registers 21

    const-string v0, "[]"

    const-string v1, "{}"

    const-string v2, "Invalid stored user id found: \""

    const-string v3, "Invalid stored device id found: \""

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v4

    if-eqz v4, :cond_f

    return-void

    :cond_f
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "__leanplum__"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    sget-boolean v5, Lcom/leanplum/internal/Constants;->allowStorageWithoutLegacyToken:Z

    if-nez v5, :cond_4e

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4e

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    const-string v13, ""

    const-string v14, ""

    invoke-static/range {v7 .. v14}, Lcom/leanplum/internal/VarCache;->applyVariableDiffs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_4e
    :try_start_4e
    new-instance v5, Lcom/leanplum/internal/AESCrypt;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v7

    invoke-virtual {v7}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v8

    invoke-virtual {v8}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Lcom/leanplum/internal/AESCrypt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "__leanplum_variables"

    invoke-virtual {v5, v4, v7, v1}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "__leanplum_messages"

    invoke-virtual {v5, v4, v8, v1}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "regions"

    invoke-virtual {v5, v4, v9, v1}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "variants"

    invoke-virtual {v5, v4, v10, v0}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "localCaps"

    invoke-virtual {v5, v4, v11, v0}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v11, "variantDebugInfo"

    invoke-virtual {v5, v4, v11, v1}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "__leanplum_variables_json"

    invoke-virtual {v5, v4, v12, v1}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v1, "__leanplum_variables_signature"

    const/4 v12, 0x0

    invoke-virtual {v5, v4, v1, v12}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static {v7}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v13

    invoke-static {v8}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v14

    invoke-static {v9}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v15

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v10}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->listFromJson(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v16

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->listFromJson(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v17

    invoke-static {v11}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v18

    invoke-static/range {v13 .. v20}, Lcom/leanplum/internal/VarCache;->applyVariableDiffs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "deviceId"

    invoke-virtual {v5, v4, v0, v12}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_bf
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_bf} :catch_121

    const-string v1, "\"; discarding."

    if-eqz v0, :cond_e5

    :try_start_c3
    invoke-static {v0}, Lcom/leanplum/internal/Util;->isValidDeviceId(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d1

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/APIConfig;->setDeviceId(Ljava/lang/String;)V

    goto :goto_e5

    :cond_d1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_e5
    :goto_e5
    const-string v0, "userId"

    invoke-virtual {v5, v4, v0, v12}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_10f

    invoke-static {v0}, Lcom/leanplum/internal/Util;->isValidUserId(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_fb

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/APIConfig;->setUserId(Ljava/lang/String;)V

    goto :goto_10f

    :cond_fb
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_10f
    :goto_10f
    const-string v0, "loggingEnabled"

    const-string v1, "false"

    invoke-virtual {v5, v4, v0, v1}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_139

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/internal/Constants;->loggingEnabled:Z
    :try_end_120
    .catch Ljava/lang/Exception; {:try_start_c3 .. :try_end_120} :catch_121

    goto :goto_139

    :catch_121
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not load variable diffs.\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_139
    :goto_139
    invoke-static {}, Lcom/leanplum/internal/VarCache;->userAttributes()Ljava/util/Map;

    return-void
.end method

.method public static localCaps()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    return-object v0
.end method

.method public static maybeUploadNewFiles()V
    .registers 15

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_14a

    sget-object v0, Lcom/leanplum/internal/VarCache;->devModeFileAttributesFromServer:Ljava/util/Map;

    if-eqz v0, :cond_14a

    invoke-static {}, Lcom/leanplum/Leanplum;->hasStartedAndRegisteredAsDeveloper()Z

    move-result v0

    if-eqz v0, :cond_14a

    sget-boolean v0, Lcom/leanplum/internal/Constants;->enableFileUploadingInDevelopmentMode:Z

    if-eqz v0, :cond_14a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    sget-object v3, Lcom/leanplum/internal/VarCache;->fileAttributes:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    move v5, v4

    :cond_2f
    :goto_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_13d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    sget-object v8, Lcom/leanplum/internal/VarCache;->devModeFileAttributesFromServer:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v9, ""

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    const/4 v10, 0x0

    if-eqz v8, :cond_6b

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_6c

    :cond_6b
    move-object v8, v10

    :goto_6c
    invoke-static {v8}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    invoke-static {v6, v8}, Lcom/leanplum/internal/FileManager;->isNewerLocally(Ljava/util/Map;Ljava/util/Map;)Z

    move-result v11

    if-eqz v11, :cond_2f

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Will upload file "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, ". Local attributes: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, "; server attributes: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v8, v11}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string v8, "hash"

    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    if-nez v11, :cond_a6

    move-object v11, v9

    :cond_a6
    invoke-static {v7}, Lcom/leanplum/internal/FileManager;->fileRelativeToAppBundle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/high16 v13, 0x1900000

    if-le v5, v13, :cond_b4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v13

    if-gtz v13, :cond_bc

    :cond_b4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v13

    const/16 v14, 0x10

    if-lt v13, v14, :cond_d3

    :cond_bc
    invoke-static {}, Lcom/leanplum/internal/FileTransferManager;->getInstance()Lcom/leanplum/internal/FileTransferManager;

    move-result-object v5

    invoke-virtual {v5, v1, v0, v2}, Lcom/leanplum/internal/FileTransferManager;->sendFilesNow(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move v5, v4

    :cond_d3
    const-string v13, "size"

    invoke-interface {v6, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    add-int/2addr v5, v14

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    :try_start_e8
    invoke-virtual {v12, v8, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v6, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v12, v13, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "filename"

    invoke-virtual {v12, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-interface {v1, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_109
    .catch Lorg/json/JSONException; {:try_start_e8 .. :try_end_109} :catch_10a

    goto :goto_12a

    :catch_10a
    move-exception v6

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Unable to upload files.\n"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v6, v8}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_12a
    sget-object v6, Lcom/leanplum/internal/VarCache;->fileStreams:Ljava/util/Map;

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/leanplum/internal/VarCache$StreamProvider;

    if-eqz v6, :cond_138

    invoke-interface {v6}, Lcom/leanplum/internal/VarCache$StreamProvider;->openStream()Ljava/io/InputStream;

    move-result-object v10

    :cond_138
    invoke-interface {v2, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2f

    :cond_13d
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_14a

    invoke-static {}, Lcom/leanplum/internal/FileTransferManager;->getInstance()Lcom/leanplum/internal/FileTransferManager;

    move-result-object v3

    invoke-virtual {v3, v1, v0, v2}, Lcom/leanplum/internal/FileTransferManager;->sendFilesNow(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    :cond_14a
    return-void
.end method

.method public static mergeHelper(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    if-nez p1, :cond_3

    return-object p0

    :cond_3
    instance-of v0, p1, Ljava/lang/Number;

    if-nez v0, :cond_172

    instance-of v0, p1, Ljava/lang/Boolean;

    if-nez v0, :cond_172

    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_172

    instance-of v0, p1, Ljava/lang/Character;

    if-nez v0, :cond_172

    instance-of v0, p0, Ljava/lang/Number;

    if-nez v0, :cond_172

    instance-of v0, p0, Ljava/lang/Boolean;

    if-nez v0, :cond_172

    instance-of v0, p0, Ljava/lang/String;

    if-nez v0, :cond_172

    instance-of v0, p0, Ljava/lang/Character;

    if-eqz v0, :cond_24

    return-object p1

    :cond_24
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_30

    move-object v1, p1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    goto :goto_33

    :cond_30
    move-object v1, p1

    check-cast v1, Ljava/lang/Iterable;

    :goto_33
    instance-of v2, p0, Ljava/util/Map;

    if-eqz v2, :cond_3f

    move-object v3, p0

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    goto :goto_42

    :cond_3f
    move-object v3, p0

    check-cast v3, Ljava/lang/Iterable;

    :goto_42
    const/4 v4, 0x0

    if-eqz v0, :cond_49

    move-object v5, p1

    check-cast v5, Ljava/util/Map;

    goto :goto_4a

    :cond_49
    move-object v5, v4

    :goto_4a
    if-eqz v2, :cond_50

    move-object v6, p0

    check-cast v6, Ljava/util/Map;

    goto :goto_51

    :cond_50
    move-object v6, v4

    :goto_51
    const/4 v7, 0x0

    const/4 v8, 0x1

    if-nez p0, :cond_a3

    if-eqz v0, :cond_a3

    check-cast p1, Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    if-lez p1, :cond_a3

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_63
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    instance-of v10, v9, Ljava/lang/String;

    if-eqz v10, :cond_a3

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x3

    if-lt v10, v11, :cond_a3

    invoke-virtual {v9, v7}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x5b

    if-ne v10, v11, :cond_a3

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v10, v8

    invoke-virtual {v9, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x5d

    if-ne v10, v11, :cond_a3

    invoke-static {v8, v8, v9}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_63

    goto :goto_a3

    :cond_a2
    move v7, v8

    :cond_a3
    :goto_a3
    instance-of p0, p0, Ljava/util/List;

    if-nez p0, :cond_fe

    if-nez v7, :cond_fe

    if-nez v2, :cond_ae

    if-nez v0, :cond_ae

    return-object v4

    :cond_ae
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    if-eqz v3, :cond_d7

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_b9
    :goto_b9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    if-eqz v5, :cond_b9

    if-eqz v6, :cond_b9

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v2, :cond_b9

    if-eqz v3, :cond_b9

    invoke-virtual {p0, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b9

    :cond_d7
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_db
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_fd

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    if-eqz v5, :cond_ec

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_ed

    :cond_ec
    move-object v1, v4

    :goto_ed
    if-eqz v6, :cond_f4

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_f5

    :cond_f4
    move-object v2, v4

    :goto_f5
    invoke-static {v2, v1}, Lcom/leanplum/internal/VarCache;->mergeHelper(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_db

    :cond_fd
    return-object p0

    :cond_fe
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_107
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_115

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_107

    :cond_115
    if-eqz v5, :cond_171

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_11b
    :goto_11b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_171

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_11b

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_11b

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11b

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v8

    invoke-virtual {v0, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_153
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_165

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x7fff

    if-ge v2, v3, :cond_165

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_153

    :cond_165
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/leanplum/internal/VarCache;->mergeHelper(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_11b

    :cond_171
    return-object p0

    :cond_172
    return-object p1
.end method

.method public static messages()Ljava/util/Map;
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

    sget-object v0, Lcom/leanplum/internal/VarCache;->messages:Ljava/util/Map;

    return-object v0
.end method

.method public static onUpdate(Lcom/leanplum/CacheUpdateBlock;)V
    .registers 1

    sput-object p0, Lcom/leanplum/internal/VarCache;->updateBlock:Lcom/leanplum/CacheUpdateBlock;

    return-void
.end method

.method public static regions()Ljava/util/Map;
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

    sget-object v0, Lcom/leanplum/internal/VarCache;->regions:Ljava/util/Map;

    return-object v0
.end method

.method public static registerActionDefinition(Ljava/lang/String;ILjava/util/List;Ljava/util/Map;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lcom/leanplum/internal/ActionArg<",
            "*>;>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_13
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/leanplum/internal/ActionArg;

    invoke-virtual {v7}, Lcom/leanplum/internal/ActionArg;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7}, Lcom/leanplum/internal/ActionArg;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/VarCache;->getNameComponents(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7}, Lcom/leanplum/internal/ActionArg;->defaultValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v7}, Lcom/leanplum/internal/ActionArg;->kind()Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v0 .. v5}, Lcom/leanplum/internal/VarCache;->updateValues(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    invoke-virtual {v7}, Lcom/leanplum/internal/ActionArg;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_3f
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "kind"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "values"

    invoke-virtual {p2, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "kinds"

    invoke-virtual {p2, p1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "order"

    invoke-virtual {p2, p1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "options"

    invoke-virtual {p2, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lcom/leanplum/internal/VarCache;->actionDefinitions:Ljava/util/Map;

    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static registerFile(Ljava/lang/String;Lcom/leanplum/internal/VarCache$StreamProvider;Ljava/lang/String;I)V
    .registers 6

    .line 96
    invoke-static {p1}, Lcom/leanplum/internal/VarCache;->isStreamAvailable(Lcom/leanplum/internal/VarCache$StreamProvider;)Z

    move-result v0

    if-eqz v0, :cond_3a

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-eqz v0, :cond_3a

    .line 97
    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_3a

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 99
    const-string v1, "hash"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    const-string p2, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 102
    const-string p3, ""

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object p3, Lcom/leanplum/internal/VarCache;->fileStreams:Ljava/util/Map;

    invoke-interface {p3, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object p1, Lcom/leanplum/internal/VarCache;->fileAttributes:Ljava/util/Map;

    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    invoke-static {}, Lcom/leanplum/internal/VarCache;->maybeUploadNewFiles()V

    :cond_3a
    return-void
.end method

.method public static registerFile(Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/internal/VarCache$StreamProvider;)V
    .registers 8

    invoke-static {p2}, Lcom/leanplum/internal/VarCache;->isStreamAvailable(Lcom/leanplum/internal/VarCache$StreamProvider;)Z

    move-result v0

    if-eqz v0, :cond_5f

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-eqz v0, :cond_5f

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_5f

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcom/leanplum/internal/Util;->isSimulator()Z

    move-result v2

    const-string v3, "size"

    if-eqz v2, :cond_3d

    invoke-interface {p2}, Lcom/leanplum/internal/VarCache$StreamProvider;->openStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->fileMD5HashCreateWithPath(Ljava/io/InputStream;)Lcom/leanplum/internal/FileManager$HashResults;

    move-result-object p1

    if-eqz p1, :cond_4d

    const-string v2, "hash"

    iget-object v4, p1, Lcom/leanplum/internal/FileManager$HashResults;->hash:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget p1, p1, Lcom/leanplum/internal/FileManager$HashResults;->size:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4d

    :cond_3d
    const/4 v2, 0x0

    invoke-static {p0, p1, v2}, Lcom/leanplum/internal/FileManager;->fileValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->getFileSize(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4d
    :goto_4d
    const-string p1, ""

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lcom/leanplum/internal/VarCache;->fileStreams:Ljava/util/Map;

    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lcom/leanplum/internal/VarCache;->fileAttributes:Ljava/util/Map;

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/VarCache;->maybeUploadNewFiles()V

    :cond_5f
    return-void
.end method

.method public static registerVariable(Lcom/leanplum/Var;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/Var<",
            "*>;)V"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/leanplum/Var;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/leanplum/internal/VarCache;->valuesFromClient:Ljava/util/Map;

    monitor-enter v6

    :try_start_c
    invoke-virtual {p0}, Lcom/leanplum/Var;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/leanplum/Var;->nameComponents()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/leanplum/Var;->defaultValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0}, Lcom/leanplum/Var;->kind()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/leanplum/internal/VarCache;->defaultKinds:Ljava/util/Map;

    invoke-static/range {v2 .. v7}, Lcom/leanplum/internal/VarCache;->updateValues(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    monitor-exit v6

    return-void

    :goto_23
    monitor-exit v6
    :try_end_24
    .catchall {:try_start_c .. :try_end_24} :catchall_25

    throw p0

    :catchall_25
    move-exception v0

    move-object p0, v0

    goto :goto_23
.end method

.method public static reset()V
    .registers 2

    sget-object v0, Lcom/leanplum/internal/VarCache;->vars:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->variantDebugInfo:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->fileAttributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->fileStreams:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->valuesFromClient:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->defaultKinds:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->actionDefinitions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->diffs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->messageDiffs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/leanplum/internal/VarCache;->regions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    const/4 v0, 0x0

    sput-object v0, Lcom/leanplum/internal/VarCache;->devModeValuesFromServer:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->devModeFileAttributesFromServer:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->devModeActionDefinitionsFromServer:Ljava/util/Map;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    sput-object v0, Lcom/leanplum/internal/VarCache;->updateBlock:Lcom/leanplum/CacheUpdateBlock;

    const/4 v1, 0x0

    sput-boolean v1, Lcom/leanplum/internal/VarCache;->hasReceivedDiffs:Z

    sput-object v0, Lcom/leanplum/internal/VarCache;->messages:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->merged:Ljava/lang/Object;

    sput-boolean v1, Lcom/leanplum/internal/VarCache;->silent:Z

    sput v1, Lcom/leanplum/internal/VarCache;->contentVersion:I

    sput-object v0, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;

    sput-object v0, Lcom/leanplum/internal/VarCache;->varsJson:Ljava/lang/String;

    sput-object v0, Lcom/leanplum/internal/VarCache;->varsSignature:Ljava/lang/String;

    return-void
.end method

.method public static saveDiffs()V
    .registers 8

    const-string v0, " to JSON.\n"

    const-string v1, "Error converting "

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v2

    if-nez v2, :cond_18

    sget-boolean v2, Lcom/leanplum/internal/Constants;->allowStorageWithoutLegacyToken:Z

    if-nez v2, :cond_19

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_19

    :cond_18
    return-void

    :cond_19
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "__leanplum__"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    new-instance v3, Lcom/leanplum/internal/AESCrypt;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v6

    invoke-virtual {v6}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lcom/leanplum/internal/AESCrypt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v5, Lcom/leanplum/internal/VarCache;->diffs:Ljava/util/Map;

    invoke-static {v5}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "__leanplum_variables"

    invoke-interface {v2, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    sget-object v5, Lcom/leanplum/internal/VarCache;->messages:Ljava/util/Map;

    invoke-static {v5}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "__leanplum_messages"

    invoke-interface {v2, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    sget-object v5, Lcom/leanplum/internal/VarCache;->regions:Ljava/util/Map;

    invoke-static {v5}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "regions"

    invoke-interface {v2, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :try_start_6a
    sget-object v5, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    if-eqz v5, :cond_a8

    sget-object v5, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_a8

    sget-object v5, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    invoke-static {v5}, Lcom/leanplum/internal/JsonConverter;->listToJsonArray(Ljava/lang/Iterable;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "variants"

    invoke-virtual {v3, v5}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_89
    .catch Lorg/json/JSONException; {:try_start_6a .. :try_end_89} :catch_8a

    goto :goto_a8

    :catch_8a
    move-exception v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v7, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_a8
    :goto_a8
    :try_start_a8
    sget-object v5, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    if-eqz v5, :cond_de

    sget-object v5, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    invoke-static {v5}, Lcom/leanplum/internal/JsonConverter;->listToJsonArray(Ljava/lang/Iterable;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "localCaps"

    invoke-virtual {v3, v5}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_bf
    .catch Lorg/json/JSONException; {:try_start_a8 .. :try_end_bf} :catch_c0

    goto :goto_de

    :catch_c0
    move-exception v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/leanplum/internal/VarCache;->localCaps:Ljava/util/List;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_de
    :goto_de
    sget-object v0, Lcom/leanplum/internal/VarCache;->variantDebugInfo:Ljava/util/Map;

    if-eqz v0, :cond_ef

    invoke-static {v0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "variantDebugInfo"

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_ef
    sget-object v0, Lcom/leanplum/internal/VarCache;->varsJson:Ljava/lang/String;

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "__leanplum_variables_json"

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    sget-object v0, Lcom/leanplum/internal/VarCache;->varsSignature:Ljava/lang/String;

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "__leanplum_variables_signature"

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->deviceId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "deviceId"

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->userId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "userId"

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    sget-boolean v0, Lcom/leanplum/internal/Constants;->loggingEnabled:Z

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "loggingEnabled"

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {v2}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method public static saveUserAttributes()V
    .registers 5

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_4a

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4a

    sget-object v0, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;

    if-eqz v0, :cond_4a

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v1, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/leanplum/internal/AESCrypt;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/leanplum/internal/AESCrypt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "__leanplum_attributes"

    invoke-virtual {v2, v1}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {v0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    :cond_4a
    return-void
.end method

.method public static sendActionsIfChanged()Z
    .registers 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/leanplum/internal/VarCache;->sendContentIfChanged(ZZ)Z

    move-result v0

    return v0
.end method

.method private static sendContentIfChanged(ZZ)Z
    .registers 6

    const/4 v0, 0x1

    if-eqz p0, :cond_11

    sget-object v1, Lcom/leanplum/internal/VarCache;->devModeValuesFromServer:Ljava/util/Map;

    if-eqz v1, :cond_11

    sget-object v2, Lcom/leanplum/internal/VarCache;->valuesFromClient:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    move v1, v0

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    if-eqz p1, :cond_1e

    sget-object v2, Lcom/leanplum/internal/VarCache;->actionDefinitions:Ljava/util/Map;

    sget-object v3, Lcom/leanplum/internal/VarCache;->devModeActionDefinitionsFromServer:Ljava/util/Map;

    invoke-static {v2, v3}, Lcom/leanplum/internal/VarCache;->areActionDefinitionsEqual(Ljava/util/Map;Ljava/util/Map;)Z

    move-result v2

    if-eqz v2, :cond_1f

    :cond_1e
    move v0, v1

    :cond_1f
    if-eqz v0, :cond_6f

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    if-eqz p0, :cond_3e

    sget-object p0, Lcom/leanplum/internal/VarCache;->valuesFromClient:Ljava/util/Map;

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "vars"

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/leanplum/internal/VarCache;->defaultKinds:Ljava/util/Map;

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "kinds"

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3e
    if-eqz p1, :cond_4b

    sget-object p0, Lcom/leanplum/internal/VarCache;->actionDefinitions:Ljava/util/Map;

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "actionDefinitions"

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4b
    sget-object p0, Lcom/leanplum/internal/VarCache;->fileAttributes:Ljava/util/Map;

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "fileAttributes"

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withSetVarsAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    sget-object p1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    :cond_6f
    return v0
.end method

.method public static sendVariablesIfChanged()Z
    .registers 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/leanplum/internal/VarCache;->sendContentIfChanged(ZZ)Z

    move-result v0

    return v0
.end method

.method public static setDevModeValuesFromServer(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    sput-object p0, Lcom/leanplum/internal/VarCache;->devModeValuesFromServer:Ljava/util/Map;

    sput-object p2, Lcom/leanplum/internal/VarCache;->devModeActionDefinitionsFromServer:Ljava/util/Map;

    sput-object p1, Lcom/leanplum/internal/VarCache;->devModeFileAttributesFromServer:Ljava/util/Map;

    return-void
.end method

.method public static setSilent(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/VarCache;->silent:Z

    return-void
.end method

.method public static setVariantDebugInfo(Ljava/util/Map;)V
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    if-eqz p0, :cond_5

    sput-object p0, Lcom/leanplum/internal/VarCache;->variantDebugInfo:Ljava/util/Map;

    return-void

    :cond_5
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    sput-object p0, Lcom/leanplum/internal/VarCache;->variantDebugInfo:Ljava/util/Map;

    return-void
.end method

.method public static silent()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/VarCache;->silent:Z

    return v0
.end method

.method private static traverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    instance-of v1, p0, Ljava/util/Map;

    if-eqz v1, :cond_24

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz p2, :cond_23

    if-nez v0, :cond_23

    instance-of p2, p1, Ljava/lang/String;

    if-eqz p2, :cond_23

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2

    :cond_23
    return-object v0

    :cond_24
    instance-of v1, p0, Ljava/util/List;

    if-eqz v1, :cond_49

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz p2, :cond_49

    if-nez v0, :cond_49

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-object p2

    :cond_49
    return-object v0
.end method

.method private static triggerHasReceivedDiffs()V
    .registers 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/internal/VarCache;->hasReceivedDiffs:Z

    sget-object v0, Lcom/leanplum/internal/VarCache;->updateBlock:Lcom/leanplum/CacheUpdateBlock;

    if-eqz v0, :cond_a

    invoke-interface {v0}, Lcom/leanplum/CacheUpdateBlock;->updateCache()V

    :cond_a
    return-void
.end method

.method private static updateValues(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_25

    array-length v0, p1

    if-lez v0, :cond_25

    const/4 v0, 0x0

    :goto_6
    array-length v1, p1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_14

    aget-object v1, p1, v0

    invoke-static {p4, v1, v2}, Lcom/leanplum/internal/VarCache;->traverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p4

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_14
    instance-of v0, p4, Ljava/util/Map;

    if-eqz v0, :cond_25

    invoke-static {p4}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/Map;

    array-length v0, p1

    sub-int/2addr v0, v2

    aget-object p1, p1, v0

    invoke-interface {p4, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_25
    if-eqz p5, :cond_2a

    invoke-interface {p5, p0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2a
    return-void
.end method

.method public static userAttributes()Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;

    if-nez v0, :cond_52

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Lcom/leanplum/internal/AESCrypt;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/leanplum/internal/AESCrypt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_24
    const-string v3, "__leanplum_attributes"

    const-string v4, "{}"

    invoke-virtual {v1, v0, v3, v4}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_32} :catch_33

    goto :goto_52

    :catch_33
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Could not load user attributes.\n"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;

    :cond_52
    :goto_52
    sget-object v0, Lcom/leanplum/internal/VarCache;->userAttributes:Ljava/util/Map;

    return-object v0
.end method

.method public static variants()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/internal/VarCache;->variants:Ljava/util/List;

    return-object v0
.end method
