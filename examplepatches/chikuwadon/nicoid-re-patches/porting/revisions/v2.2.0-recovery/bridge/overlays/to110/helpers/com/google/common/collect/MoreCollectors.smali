.class public final Lcom/google/common/collect/MoreCollectors;
.super Ljava/lang/Object;
.source "MoreCollectors.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/MoreCollectors$ToOptionalState;
    }
.end annotation


# static fields
.field private static final NULL_PLACEHOLDER:Ljava/lang/Object;

.field private static final ONLY_ELEMENT:Ljava/util/stream/Collector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/stream/Collector<",
            "Ljava/lang/Object;",
            "*",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final TO_OPTIONAL:Ljava/util/stream/Collector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/stream/Collector<",
            "Ljava/lang/Object;",
            "*",
            "Ljava/util/Optional<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 48
    new-instance v0, Lcom/google/common/collect/MoreCollectors$0;

    invoke-direct {v0}, Lcom/google/common/collect/MoreCollectors$0;-><init>()V

    new-instance v1, Lcom/google/common/collect/MoreCollectors$1;

    invoke-direct {v1}, Lcom/google/common/collect/MoreCollectors$1;-><init>()V

    new-instance v2, Lcom/google/common/collect/MoreCollectors$2;

    invoke-direct {v2}, Lcom/google/common/collect/MoreCollectors$2;-><init>()V

    new-instance v3, Lcom/google/common/collect/MoreCollectors$3;

    invoke-direct {v3}, Lcom/google/common/collect/MoreCollectors$3;-><init>()V

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/util/stream/Collector$Characteristics;

    sget-object v6, Ljava/util/stream/Collector$Characteristics;->UNORDERED:Ljava/util/stream/Collector$Characteristics;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    .line 49
    invoke-static {v0, v1, v2, v3, v5}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object v0

    sput-object v0, Lcom/google/common/collect/MoreCollectors;->TO_OPTIONAL:Ljava/util/stream/Collector;

    .line 69
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/common/collect/MoreCollectors;->NULL_PLACEHOLDER:Ljava/lang/Object;

    .line 71
    new-instance v0, Lcom/google/common/collect/MoreCollectors$4;

    invoke-direct {v0}, Lcom/google/common/collect/MoreCollectors$4;-><init>()V

    new-instance v1, Lcom/google/common/collect/MoreCollectors$5;

    invoke-direct {v1}, Lcom/google/common/collect/MoreCollectors$5;-><init>()V

    new-instance v2, Lcom/google/common/collect/MoreCollectors$2;

    invoke-direct {v2}, Lcom/google/common/collect/MoreCollectors$2;-><init>()V

    new-instance v3, Lcom/google/common/collect/MoreCollectors$6;

    invoke-direct {v3}, Lcom/google/common/collect/MoreCollectors$6;-><init>()V

    new-array v4, v4, [Ljava/util/stream/Collector$Characteristics;

    sget-object v5, Ljava/util/stream/Collector$Characteristics;->UNORDERED:Ljava/util/stream/Collector$Characteristics;

    aput-object v5, v4, v7

    .line 72
    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object v0

    sput-object v0, Lcom/google/common/collect/MoreCollectors;->ONLY_ELEMENT:Ljava/util/stream/Collector;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$static$0()Lcom/google/common/collect/MoreCollectors$ToOptionalState;
    .registers 2

    .line 50
    new-instance v0, Lcom/google/common/collect/MoreCollectors$ToOptionalState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/collect/MoreCollectors$ToOptionalState;-><init>(Ljava/util/function/Supplier;)V

    return-object v0
.end method

.method static synthetic lambda$static$1()Lcom/google/common/collect/MoreCollectors$ToOptionalState;
    .registers 2

    .line 73
    new-instance v0, Lcom/google/common/collect/MoreCollectors$ToOptionalState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/collect/MoreCollectors$ToOptionalState;-><init>(Ljava/util/function/Supplier;)V

    return-object v0
.end method

.method static synthetic lambda$static$2(Lcom/google/common/collect/MoreCollectors$ToOptionalState;Ljava/lang/Object;)V
    .registers 2

    if-nez p1, :cond_0

    .line 74
    sget-object p1, Lcom/google/common/collect/MoreCollectors;->NULL_PLACEHOLDER:Ljava/lang/Object;

    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/collect/MoreCollectors$ToOptionalState;->add(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$static$3(Lcom/google/common/collect/MoreCollectors$ToOptionalState;)Ljava/lang/Object;
    .registers 2

    .line 77
    invoke-virtual {p0}, Lcom/google/common/collect/MoreCollectors$ToOptionalState;->getElement()Ljava/lang/Object;

    move-result-object p0

    .line 78
    sget-object v0, Lcom/google/common/collect/MoreCollectors;->NULL_PLACEHOLDER:Ljava/lang/Object;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x0

    :cond_0
    return-object p0
.end method

.method public static onlyElement()Ljava/util/stream/Collector;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/stream/Collector<",
            "TT;*TT;>;"
        }
    .end annotation

    .line 89
    sget-object v0, Lcom/google/common/collect/MoreCollectors;->ONLY_ELEMENT:Ljava/util/stream/Collector;

    return-object v0
.end method

.method public static toOptional()Ljava/util/stream/Collector;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/stream/Collector<",
            "TT;*",
            "Ljava/util/Optional<",
            "TT;>;>;"
        }
    .end annotation

    .line 66
    sget-object v0, Lcom/google/common/collect/MoreCollectors;->TO_OPTIONAL:Ljava/util/stream/Collector;

    return-object v0
.end method
