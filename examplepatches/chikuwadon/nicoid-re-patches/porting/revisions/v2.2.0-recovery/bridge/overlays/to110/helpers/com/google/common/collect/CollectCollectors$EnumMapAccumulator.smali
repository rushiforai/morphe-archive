.class final Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;
.super Ljava/lang/Object;
.source "CollectCollectors.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/CollectCollectors;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EnumMapAccumulator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Enum<",
        "TK;>;V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private map:Ljava/util/EnumMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private final mergeFunction:Ljava/util/function/BinaryOperator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BinaryOperator<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/function/BinaryOperator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mergeFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/BinaryOperator<",
            "TV;>;)V"
        }
    .end annotation

    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 316
    iput-object v0, p0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->map:Ljava/util/EnumMap;

    .line 319
    iput-object p1, p0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->mergeFunction:Ljava/util/function/BinaryOperator;

    return-void
.end method


# virtual methods
.method combine(Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;)Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "other"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator<",
            "TK;TV;>;"
        }
    .end annotation

    .line 331
    iget-object v0, p0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->map:Ljava/util/EnumMap;

    if-nez v0, :cond_0

    return-object p1

    .line 333
    :cond_0
    iget-object p1, p1, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->map:Ljava/util/EnumMap;

    if-nez p1, :cond_1

    return-object p0

    .line 336
    :cond_1
    new-instance v0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator$0;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator$0;-><init>(Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;)V

    invoke-virtual {p1, v0}, Ljava/util/EnumMap;->forEach(Ljava/util/function/BiConsumer;)V

    return-object p0
.end method

.method put(Ljava/lang/Enum;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 323
    iget-object v0, p0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->map:Ljava/util/EnumMap;

    if-nez v0, :cond_0

    .line 324
    new-instance v0, Ljava/util/EnumMap;

    invoke-static {p1, p2}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/EnumMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->map:Ljava/util/EnumMap;

    return-void

    .line 326
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->mergeFunction:Ljava/util/function/BinaryOperator;

    invoke-virtual {v0, p1, p2, p0}, Ljava/util/EnumMap;->merge(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;

    return-void
.end method

.method toImmutableMap()Lcom/google/common/collect/ImmutableMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 342
    iget-object p0, p0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->map:Ljava/util/EnumMap;

    if-nez p0, :cond_0

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/google/common/collect/ImmutableEnumMap;->asImmutable(Ljava/util/EnumMap;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p0

    return-object p0
.end method
