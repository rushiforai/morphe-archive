.class final Lcom/google/common/collect/CollectCollectors;
.super Ljava/lang/Object;
.source "CollectCollectors.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/CollectCollectors$EnumSetAccumulator;,
        Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;
    }
.end annotation


# static fields
.field private static final TO_IMMUTABLE_LIST:Ljava/util/stream/Collector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/stream/Collector<",
            "Ljava/lang/Object;",
            "*",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final TO_IMMUTABLE_RANGE_SET:Ljava/util/stream/Collector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/stream/Collector<",
            "Lcom/google/common/collect/Range<",
            "Ljava/lang/Comparable<",
            "*>;>;*",
            "Lcom/google/common/collect/ImmutableRangeSet<",
            "Ljava/lang/Comparable<",
            "*>;>;>;"
        }
    .end annotation
.end field

.field private static final TO_IMMUTABLE_SET:Ljava/util/stream/Collector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/stream/Collector<",
            "Ljava/lang/Object;",
            "*",
            "Lcom/google/common/collect/ImmutableSet<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 46
    new-instance v0, Lcom/google/common/collect/CollectCollectors$18;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$18;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$21;

    invoke-direct {v1}, Lcom/google/common/collect/CollectCollectors$21;-><init>()V

    new-instance v2, Lcom/google/common/collect/CollectCollectors$22;

    invoke-direct {v2}, Lcom/google/common/collect/CollectCollectors$22;-><init>()V

    new-instance v3, Lcom/google/common/collect/CollectCollectors$23;

    invoke-direct {v3}, Lcom/google/common/collect/CollectCollectors$23;-><init>()V

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/util/stream/Collector$Characteristics;

    .line 47
    invoke-static {v0, v1, v2, v3, v5}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object v0

    sput-object v0, Lcom/google/common/collect/CollectCollectors;->TO_IMMUTABLE_LIST:Ljava/util/stream/Collector;

    .line 53
    new-instance v0, Lcom/google/common/collect/CollectCollectors$24;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$24;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$25;

    invoke-direct {v1}, Lcom/google/common/collect/CollectCollectors$25;-><init>()V

    new-instance v2, Lcom/google/common/collect/CollectCollectors$26;

    invoke-direct {v2}, Lcom/google/common/collect/CollectCollectors$26;-><init>()V

    new-instance v3, Lcom/google/common/collect/CollectCollectors$27;

    invoke-direct {v3}, Lcom/google/common/collect/CollectCollectors$27;-><init>()V

    new-array v5, v4, [Ljava/util/stream/Collector$Characteristics;

    .line 54
    invoke-static {v0, v1, v2, v3, v5}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object v0

    sput-object v0, Lcom/google/common/collect/CollectCollectors;->TO_IMMUTABLE_SET:Ljava/util/stream/Collector;

    .line 62
    new-instance v0, Lcom/google/common/collect/CollectCollectors$28;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$28;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$29;

    invoke-direct {v1}, Lcom/google/common/collect/CollectCollectors$29;-><init>()V

    new-instance v2, Lcom/google/common/collect/CollectCollectors$19;

    invoke-direct {v2}, Lcom/google/common/collect/CollectCollectors$19;-><init>()V

    new-instance v3, Lcom/google/common/collect/CollectCollectors$20;

    invoke-direct {v3}, Lcom/google/common/collect/CollectCollectors$20;-><init>()V

    new-array v4, v4, [Ljava/util/stream/Collector$Characteristics;

    .line 63
    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object v0

    sput-object v0, Lcom/google/common/collect/CollectCollectors;->TO_IMMUTABLE_RANGE_SET:Ljava/util/stream/Collector;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 462
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Ljava/util/stream/Collector;
    .registers 1

    .line 44
    invoke-static {}, Lcom/google/common/collect/CollectCollectors;->toImmutableEnumSetGeneric()Ljava/util/stream/Collector;

    move-result-object v0

    return-object v0
.end method

.method static flatteningToImmutableListMultimap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valuesFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+",
            "Ljava/util/stream/Stream<",
            "+TV;>;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableListMultimap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 379
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    new-instance v0, Lcom/google/common/collect/CollectCollectors$32;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CollectCollectors$32;-><init>(Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$33;

    invoke-direct {p0, p1}, Lcom/google/common/collect/CollectCollectors$33;-><init>(Ljava/util/function/Function;)V

    .line 385
    invoke-static {}, Lcom/google/common/collect/MultimapBuilder;->linkedHashKeys()Lcom/google/common/collect/MultimapBuilder$MultimapBuilderWithKeys;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/common/collect/MultimapBuilder$MultimapBuilderWithKeys;->arrayListValues()Lcom/google/common/collect/MultimapBuilder$ListMultimapBuilder;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/common/collect/CollectCollectors$34;

    invoke-direct {v1, p1}, Lcom/google/common/collect/CollectCollectors$34;-><init>(Lcom/google/common/collect/MultimapBuilder$ListMultimapBuilder;)V

    .line 382
    invoke-static {v0, p0, v1}, Lcom/google/common/collect/CollectCollectors;->flatteningToMultimap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    move-result-object p0

    new-instance p1, Lcom/google/common/collect/CollectCollectors$35;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$35;-><init>()V

    .line 381
    invoke-static {p0, p1}, Ljava/util/stream/Collectors;->collectingAndThen(Ljava/util/stream/Collector;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static flatteningToImmutableSetMultimap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valuesFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+",
            "Ljava/util/stream/Stream<",
            "+TV;>;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableSetMultimap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 406
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    new-instance v0, Lcom/google/common/collect/CollectCollectors$40;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CollectCollectors$40;-><init>(Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$41;

    invoke-direct {p0, p1}, Lcom/google/common/collect/CollectCollectors$41;-><init>(Ljava/util/function/Function;)V

    .line 412
    invoke-static {}, Lcom/google/common/collect/MultimapBuilder;->linkedHashKeys()Lcom/google/common/collect/MultimapBuilder$MultimapBuilderWithKeys;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/common/collect/MultimapBuilder$MultimapBuilderWithKeys;->linkedHashSetValues()Lcom/google/common/collect/MultimapBuilder$SetMultimapBuilder;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/common/collect/CollectCollectors$42;

    invoke-direct {v1, p1}, Lcom/google/common/collect/CollectCollectors$42;-><init>(Lcom/google/common/collect/MultimapBuilder$SetMultimapBuilder;)V

    .line 409
    invoke-static {v0, p0, v1}, Lcom/google/common/collect/CollectCollectors;->flatteningToMultimap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    move-result-object p0

    new-instance p1, Lcom/google/common/collect/CollectCollectors$43;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$43;-><init>()V

    .line 408
    invoke-static {p0, p1}, Ljava/util/stream/Collectors;->collectingAndThen(Ljava/util/stream/Collector;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static flatteningToMultimap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/Supplier;)Ljava/util/stream/Collector;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction",
            "multimapSupplier"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "M::",
            "Lcom/google/common/collect/Multimap<",
            "TK;TV;>;>(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+",
            "Ljava/util/stream/Stream<",
            "+TV;>;>;",
            "Ljava/util/function/Supplier<",
            "TM;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*TM;>;"
        }
    .end annotation

    .line 446
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    new-instance v0, Lcom/google/common/collect/CollectCollectors$30;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/CollectCollectors$30;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$31;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$31;-><init>()V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {p2, v0, p0, p1}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$flatteningToImmutableListMultimap$0(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 383
    invoke-interface {p0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$flatteningToImmutableListMultimap$1(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/util/stream/Stream;
    .registers 2

    .line 384
    invoke-interface {p0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/stream/Stream;

    new-instance p1, Lcom/google/common/collect/CollectCollectors$46;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$46;-><init>()V

    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->peek(Ljava/util/function/Consumer;)Ljava/util/stream/Stream;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$flatteningToImmutableSetMultimap$0(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 410
    invoke-interface {p0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$flatteningToImmutableSetMultimap$1(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/util/stream/Stream;
    .registers 2

    .line 411
    invoke-interface {p0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/stream/Stream;

    new-instance p1, Lcom/google/common/collect/CollectCollectors$46;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$46;-><init>()V

    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->peek(Ljava/util/function/Consumer;)Ljava/util/stream/Stream;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$flatteningToMultimap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/Multimap;Ljava/lang/Object;)V
    .registers 4

    .line 452
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 453
    invoke-interface {p2, p0}, Lcom/google/common/collect/Multimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object p0

    .line 454
    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/stream/Stream;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lcom/google/common/collect/CollectCollectors$9;

    invoke-direct {p2, p0}, Lcom/google/common/collect/CollectCollectors$9;-><init>(Ljava/util/Collection;)V

    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->forEachOrdered(Ljava/util/function/Consumer;)V

    return-void
.end method

.method static synthetic lambda$flatteningToMultimap$1(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/Multimap;
    .registers 2

    .line 457
    invoke-interface {p0, p1}, Lcom/google/common/collect/Multimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    return-object p0
.end method

.method static synthetic lambda$toImmutableBiMap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/ImmutableBiMap$Builder;Ljava/lang/Object;)V
    .registers 4

    .line 253
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/ImmutableBiMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableBiMap$Builder;

    return-void
.end method

.method static synthetic lambda$toImmutableEnumMap$0()Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;
    .registers 2

    .line 267
    new-instance v0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;

    new-instance v1, Lcom/google/common/collect/CollectCollectors$69;

    invoke-direct {v1}, Lcom/google/common/collect/CollectCollectors$69;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;-><init>(Ljava/util/function/BinaryOperator;)V

    return-object v0
.end method

.method static synthetic lambda$toImmutableEnumMap$1(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 269
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Multiple values for key: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$toImmutableEnumMap$2(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;Ljava/lang/Object;)V
    .registers 5

    .line 276
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Enum;

    .line 277
    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 278
    const-string v0, "Null key for input %s"

    .line 279
    invoke-static {p0, v0, p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Enum;

    const-string v0, "Null value for input %s"

    .line 280
    invoke-static {p1, v0, p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 278
    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->put(Ljava/lang/Enum;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$toImmutableEnumMap$3(Ljava/util/function/BinaryOperator;)Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;
    .registers 2

    .line 297
    new-instance v0, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;-><init>(Ljava/util/function/BinaryOperator;)V

    return-object v0
.end method

.method static synthetic lambda$toImmutableEnumMap$4(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;Ljava/lang/Object;)V
    .registers 5

    .line 303
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Enum;

    .line 304
    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 305
    const-string v0, "Null key for input %s"

    .line 306
    invoke-static {p0, v0, p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Enum;

    const-string v0, "Null value for input %s"

    .line 307
    invoke-static {p1, v0, p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 305
    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/CollectCollectors$EnumMapAccumulator;->put(Ljava/lang/Enum;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$toImmutableEnumSetGeneric$0()Lcom/google/common/collect/CollectCollectors$EnumSetAccumulator;
    .registers 2

    .line 101
    new-instance v0, Lcom/google/common/collect/CollectCollectors$EnumSetAccumulator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/collect/CollectCollectors$EnumSetAccumulator;-><init>(Lcom/google/common/collect/CollectCollectors$1;)V

    return-object v0
.end method

.method static synthetic lambda$toImmutableListMultimap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/ImmutableListMultimap$Builder;Ljava/lang/Object;)V
    .registers 4

    .line 370
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    return-void
.end method

.method static synthetic lambda$toImmutableMap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/ImmutableMap$Builder;Ljava/lang/Object;)V
    .registers 4

    .line 195
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    return-void
.end method

.method static synthetic lambda$toImmutableMultiset$0(Ljava/util/function/Function;Ljava/util/function/ToIntFunction;Lcom/google/common/collect/Multiset;Ljava/lang/Object;)V
    .registers 4

    .line 161
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/ToIntFunction;->applyAsInt(Ljava/lang/Object;)I

    move-result p1

    invoke-interface {p2, p0, p1}, Lcom/google/common/collect/Multiset;->add(Ljava/lang/Object;I)I

    return-void
.end method

.method static synthetic lambda$toImmutableMultiset$1(Lcom/google/common/collect/Multiset;Lcom/google/common/collect/Multiset;)Lcom/google/common/collect/Multiset;
    .registers 2

    .line 163
    invoke-interface {p0, p1}, Lcom/google/common/collect/Multiset;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method static synthetic lambda$toImmutableMultiset$2(Lcom/google/common/collect/Multiset;)Lcom/google/common/collect/ImmutableMultiset;
    .registers 1

    .line 166
    invoke-interface {p0}, Lcom/google/common/collect/Multiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/ImmutableMultiset;->copyFromEntries(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableMultiset;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$toImmutableRangeMap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/ImmutableRangeMap$Builder;Ljava/lang/Object;)V
    .registers 4

    .line 355
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/Range;

    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/ImmutableRangeMap$Builder;->put(Lcom/google/common/collect/Range;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableRangeMap$Builder;

    return-void
.end method

.method static synthetic lambda$toImmutableSetMultimap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/ImmutableSetMultimap$Builder;Ljava/lang/Object;)V
    .registers 4

    .line 397
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    return-void
.end method

.method static synthetic lambda$toImmutableSortedMap$0(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSortedMap$Builder;
    .registers 2

    .line 224
    new-instance v0, Lcom/google/common/collect/ImmutableSortedMap$Builder;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ImmutableSortedMap$Builder;-><init>(Ljava/util/Comparator;)V

    return-object v0
.end method

.method static synthetic lambda$toImmutableSortedMap$1(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/ImmutableSortedMap$Builder;Ljava/lang/Object;)V
    .registers 4

    .line 225
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/google/common/collect/ImmutableSortedMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedMap$Builder;

    return-void
.end method

.method static synthetic lambda$toImmutableSortedMap$2(Ljava/util/Comparator;)Ljava/util/TreeMap;
    .registers 2

    .line 242
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0, p0}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    return-object v0
.end method

.method static synthetic lambda$toImmutableSortedSet$0(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
    .registers 2

    .line 87
    new-instance v0, Lcom/google/common/collect/ImmutableSortedSet$Builder;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ImmutableSortedSet$Builder;-><init>(Ljava/util/Comparator;)V

    return-object v0
.end method

.method static synthetic lambda$toMultimap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/Multimap;Ljava/lang/Object;)V
    .registers 4

    .line 430
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic lambda$toMultimap$1(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/Multimap;
    .registers 2

    .line 432
    invoke-interface {p0, p1}, Lcom/google/common/collect/Multimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    return-object p0
.end method

.method static synthetic lambda$toMultiset$0(Ljava/util/function/Function;Ljava/util/function/ToIntFunction;Lcom/google/common/collect/Multiset;Ljava/lang/Object;)V
    .registers 4

    .line 179
    invoke-interface {p0, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p3}, Ljava/util/function/ToIntFunction;->applyAsInt(Ljava/lang/Object;)I

    move-result p1

    invoke-interface {p2, p0, p1}, Lcom/google/common/collect/Multiset;->add(Ljava/lang/Object;I)I

    return-void
.end method

.method static synthetic lambda$toMultiset$1(Lcom/google/common/collect/Multiset;Lcom/google/common/collect/Multiset;)Lcom/google/common/collect/Multiset;
    .registers 2

    .line 181
    invoke-interface {p0, p1}, Lcom/google/common/collect/Multiset;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method static toImmutableBiMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableBiMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 249
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    new-instance v0, Lcom/google/common/collect/CollectCollectors$10;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$10;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$11;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectCollectors$11;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$12;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$12;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$13;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$13;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, v1, p0, p1, v2}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableEnumMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Enum<",
            "TK;>;V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 263
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    new-instance v0, Lcom/google/common/collect/CollectCollectors$47;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$47;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$48;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectCollectors$48;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$49;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$49;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$50;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$50;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/stream/Collector$Characteristics;

    const/4 v3, 0x0

    sget-object v4, Ljava/util/stream/Collector$Characteristics;->UNORDERED:Ljava/util/stream/Collector$Characteristics;

    aput-object v4, v2, v3

    invoke-static {v0, v1, p0, p1, v2}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableEnumMap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction",
            "mergeFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Enum<",
            "TK;>;V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;",
            "Ljava/util/function/BinaryOperator<",
            "TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 292
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    new-instance v0, Lcom/google/common/collect/CollectCollectors$72;

    invoke-direct {v0, p2}, Lcom/google/common/collect/CollectCollectors$72;-><init>(Ljava/util/function/BinaryOperator;)V

    new-instance p2, Lcom/google/common/collect/CollectCollectors$73;

    invoke-direct {p2, p0, p1}, Lcom/google/common/collect/CollectCollectors$73;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$49;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$49;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$50;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$50;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, p2, p0, p1, v1}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableEnumSet()Ljava/util/stream/Collector;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum<",
            "TE;>;>()",
            "Ljava/util/stream/Collector<",
            "TE;*",
            "Lcom/google/common/collect/ImmutableSet<",
            "TE;>;>;"
        }
    .end annotation

    .line 95
    sget-object v0, Lcom/google/common/collect/CollectCollectors$EnumSetAccumulator;->TO_IMMUTABLE_ENUM_SET:Ljava/util/stream/Collector;

    return-object v0
.end method

.method private static toImmutableEnumSetGeneric()Ljava/util/stream/Collector;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum<",
            "TE;>;>()",
            "Ljava/util/stream/Collector<",
            "TE;",
            "Lcom/google/common/collect/CollectCollectors$EnumSetAccumulator<",
            "TE;>;",
            "Lcom/google/common/collect/ImmutableSet<",
            "TE;>;>;"
        }
    .end annotation

    .line 100
    new-instance v0, Lcom/google/common/collect/CollectCollectors$14;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$14;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$15;

    invoke-direct {v1}, Lcom/google/common/collect/CollectCollectors$15;-><init>()V

    new-instance v2, Lcom/google/common/collect/CollectCollectors$16;

    invoke-direct {v2}, Lcom/google/common/collect/CollectCollectors$16;-><init>()V

    new-instance v3, Lcom/google/common/collect/CollectCollectors$17;

    invoke-direct {v3}, Lcom/google/common/collect/CollectCollectors$17;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/util/stream/Collector$Characteristics;

    const/4 v5, 0x0

    sget-object v6, Ljava/util/stream/Collector$Characteristics;->UNORDERED:Ljava/util/stream/Collector$Characteristics;

    aput-object v6, v4, v5

    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object v0

    return-object v0
.end method

.method static toImmutableList()Ljava/util/stream/Collector;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/stream/Collector<",
            "TE;*",
            "Lcom/google/common/collect/ImmutableList<",
            "TE;>;>;"
        }
    .end annotation

    .line 73
    sget-object v0, Lcom/google/common/collect/CollectCollectors;->TO_IMMUTABLE_LIST:Ljava/util/stream/Collector;

    return-object v0
.end method

.method static toImmutableListMultimap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableListMultimap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 366
    const-string v0, "keyFunction"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    const-string v0, "valueFunction"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    new-instance v0, Lcom/google/common/collect/CollectCollectors$59;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$59;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$60;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectCollectors$60;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$61;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$61;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$62;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$62;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, v1, p0, p1, v2}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 191
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    new-instance v0, Lcom/google/common/collect/CollectCollectors$51;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$51;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$52;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectCollectors$52;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$53;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$53;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$54;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$54;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, v1, p0, p1, v2}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableMap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;)Ljava/util/stream/Collector;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction",
            "mergeFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;",
            "Ljava/util/function/BinaryOperator<",
            "TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 204
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    new-instance v0, Lcom/google/common/collect/CollectCollectors$67;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$67;-><init>()V

    .line 208
    invoke-static {p0, p1, p2, v0}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    move-result-object p0

    new-instance p1, Lcom/google/common/collect/CollectCollectors$68;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$68;-><init>()V

    .line 207
    invoke-static {p0, p1}, Ljava/util/stream/Collectors;->collectingAndThen(Ljava/util/stream/Collector;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableMultiset(Ljava/util/function/Function;Ljava/util/function/ToIntFunction;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "elementFunction",
            "countFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TE;>;",
            "Ljava/util/function/ToIntFunction<",
            "-TT;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableMultiset<",
            "TE;>;>;"
        }
    .end annotation

    .line 156
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    new-instance v0, Lcom/google/common/collect/CollectCollectors$36;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$36;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$37;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectCollectors$37;-><init>(Ljava/util/function/Function;Ljava/util/function/ToIntFunction;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$38;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$38;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$39;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$39;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, v1, p0, p1, v2}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableRangeMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K::",
            "Ljava/lang/Comparable<",
            "-TK;>;V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;",
            "Lcom/google/common/collect/Range<",
            "TK;>;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableRangeMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 351
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    new-instance v0, Lcom/google/common/collect/CollectCollectors$0;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$0;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$2;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectCollectors$2;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$3;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$3;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$4;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$4;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, v1, p0, p1, v2}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableRangeSet()Ljava/util/stream/Collector;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ljava/lang/Comparable<",
            "-TE;>;>()",
            "Ljava/util/stream/Collector<",
            "Lcom/google/common/collect/Range<",
            "TE;>;*",
            "Lcom/google/common/collect/ImmutableRangeSet<",
            "TE;>;>;"
        }
    .end annotation

    .line 149
    sget-object v0, Lcom/google/common/collect/CollectCollectors;->TO_IMMUTABLE_RANGE_SET:Ljava/util/stream/Collector;

    return-object v0
.end method

.method static toImmutableSet()Ljava/util/stream/Collector;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/stream/Collector<",
            "TE;*",
            "Lcom/google/common/collect/ImmutableSet<",
            "TE;>;>;"
        }
    .end annotation

    .line 80
    sget-object v0, Lcom/google/common/collect/CollectCollectors;->TO_IMMUTABLE_SET:Ljava/util/stream/Collector;

    return-object v0
.end method

.method static toImmutableSetMultimap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableSetMultimap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 393
    const-string v0, "keyFunction"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    const-string v0, "valueFunction"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    new-instance v0, Lcom/google/common/collect/CollectCollectors$63;

    invoke-direct {v0}, Lcom/google/common/collect/CollectCollectors$63;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$64;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectCollectors$64;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$65;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$65;-><init>()V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$66;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$66;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, v1, p0, p1, v2}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableSortedMap(Ljava/util/Comparator;Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "comparator",
            "keyFunction",
            "valueFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator<",
            "-TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableSortedMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 216
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    new-instance v0, Lcom/google/common/collect/CollectCollectors$5;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CollectCollectors$5;-><init>(Ljava/util/Comparator;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$6;

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/CollectCollectors$6;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p1, Lcom/google/common/collect/CollectCollectors$7;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$7;-><init>()V

    new-instance p2, Lcom/google/common/collect/CollectCollectors$8;

    invoke-direct {p2}, Lcom/google/common/collect/CollectCollectors$8;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/util/stream/Collector$Characteristics;

    const/4 v2, 0x0

    sget-object v3, Ljava/util/stream/Collector$Characteristics;->UNORDERED:Ljava/util/stream/Collector$Characteristics;

    aput-object v3, v1, v2

    invoke-static {v0, p0, p1, p2, v1}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableSortedMap(Ljava/util/Comparator;Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "comparator",
            "keyFunction",
            "valueFunction",
            "mergeFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator<",
            "-TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;",
            "Ljava/util/function/BinaryOperator<",
            "TV;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Lcom/google/common/collect/ImmutableSortedMap<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 237
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    new-instance v0, Lcom/google/common/collect/CollectCollectors$44;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CollectCollectors$44;-><init>(Ljava/util/Comparator;)V

    .line 242
    invoke-static {p1, p2, p3, v0}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    move-result-object p0

    new-instance p1, Lcom/google/common/collect/CollectCollectors$45;

    invoke-direct {p1}, Lcom/google/common/collect/CollectCollectors$45;-><init>()V

    .line 241
    invoke-static {p0, p1}, Ljava/util/stream/Collectors;->collectingAndThen(Ljava/util/stream/Collector;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toImmutableSortedSet(Ljava/util/Comparator;)Ljava/util/stream/Collector;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "comparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator<",
            "-TE;>;)",
            "Ljava/util/stream/Collector<",
            "TE;*",
            "Lcom/google/common/collect/ImmutableSortedSet<",
            "TE;>;>;"
        }
    .end annotation

    .line 85
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    new-instance v0, Lcom/google/common/collect/CollectCollectors$55;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CollectCollectors$55;-><init>(Ljava/util/Comparator;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$56;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$56;-><init>()V

    new-instance v1, Lcom/google/common/collect/CollectCollectors$57;

    invoke-direct {v1}, Lcom/google/common/collect/CollectCollectors$57;-><init>()V

    new-instance v2, Lcom/google/common/collect/CollectCollectors$58;

    invoke-direct {v2}, Lcom/google/common/collect/CollectCollectors$58;-><init>()V

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {v0, p0, v1, v2, v3}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toMultimap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/Supplier;)Ljava/util/stream/Collector;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "keyFunction",
            "valueFunction",
            "multimapSupplier"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "M::",
            "Lcom/google/common/collect/Multimap<",
            "TK;TV;>;>(",
            "Ljava/util/function/Function<",
            "-TT;+TK;>;",
            "Ljava/util/function/Function<",
            "-TT;+TV;>;",
            "Ljava/util/function/Supplier<",
            "TM;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*TM;>;"
        }
    .end annotation

    .line 425
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    new-instance v0, Lcom/google/common/collect/CollectCollectors$74;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/CollectCollectors$74;-><init>(Ljava/util/function/Function;Ljava/util/function/Function;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$75;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$75;-><init>()V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {p2, v0, p0, p1}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method

.method static toMultiset(Ljava/util/function/Function;Ljava/util/function/ToIntFunction;Ljava/util/function/Supplier;)Ljava/util/stream/Collector;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "elementFunction",
            "countFunction",
            "multisetSupplier"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "E:",
            "Ljava/lang/Object;",
            "M::",
            "Lcom/google/common/collect/Multiset<",
            "TE;>;>(",
            "Ljava/util/function/Function<",
            "-TT;TE;>;",
            "Ljava/util/function/ToIntFunction<",
            "-TT;>;",
            "Ljava/util/function/Supplier<",
            "TM;>;)",
            "Ljava/util/stream/Collector<",
            "TT;*TM;>;"
        }
    .end annotation

    .line 174
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    new-instance v0, Lcom/google/common/collect/CollectCollectors$70;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/CollectCollectors$70;-><init>(Ljava/util/function/Function;Ljava/util/function/ToIntFunction;)V

    new-instance p0, Lcom/google/common/collect/CollectCollectors$71;

    invoke-direct {p0}, Lcom/google/common/collect/CollectCollectors$71;-><init>()V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/util/stream/Collector$Characteristics;

    invoke-static {p2, v0, p0, p1}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object p0

    return-object p0
.end method
