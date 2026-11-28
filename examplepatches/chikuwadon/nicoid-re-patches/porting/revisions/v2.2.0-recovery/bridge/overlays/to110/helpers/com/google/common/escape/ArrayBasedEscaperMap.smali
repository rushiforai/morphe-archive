.class public final Lcom/google/common/escape/ArrayBasedEscaperMap;
.super Ljava/lang/Object;
.source "ArrayBasedEscaperMap.java"


# static fields
.field private static final EMPTY_REPLACEMENT_ARRAY:[[C


# instance fields
.field private final replacementArray:[[C


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x2

    .line 82
    new-array v0, v0, [I

    const/4 v1, 0x1

    const/4 v2, 0x0

    aput v2, v0, v1

    aput v2, v0, v2

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[C

    sput-object v0, Lcom/google/common/escape/ArrayBasedEscaperMap;->EMPTY_REPLACEMENT_ARRAY:[[C

    return-void
.end method

.method private constructor <init>([[C)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "replacementArray"
        }
    .end annotation

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/google/common/escape/ArrayBasedEscaperMap;->replacementArray:[[C

    return-void
.end method

.method public static create(Ljava/util/Map;)Lcom/google/common/escape/ArrayBasedEscaperMap;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "replacements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/common/escape/ArrayBasedEscaperMap;"
        }
    .end annotation

    .line 47
    new-instance v0, Lcom/google/common/escape/ArrayBasedEscaperMap;

    invoke-static {p0}, Lcom/google/common/escape/ArrayBasedEscaperMap;->createReplacementArray(Ljava/util/Map;)[[C

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/google/common/escape/ArrayBasedEscaperMap;-><init>([[C)V

    return-object v0
.end method

.method static createReplacementArray(Ljava/util/Map;)[[C
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;)[[C"
        }
    .end annotation

    .line 68
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    sget-object p0, Lcom/google/common/escape/ArrayBasedEscaperMap;->EMPTY_REPLACEMENT_ARRAY:[[C

    return-object p0

    .line 72
    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 73
    new-array v0, v0, [[C

    .line 74
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    .line 75
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v3

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    aput-object v2, v0, v3

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method getReplacementArray()[[C
    .registers 1

    .line 60
    iget-object p0, p0, Lcom/google/common/escape/ArrayBasedEscaperMap;->replacementArray:[[C

    return-object p0
.end method
