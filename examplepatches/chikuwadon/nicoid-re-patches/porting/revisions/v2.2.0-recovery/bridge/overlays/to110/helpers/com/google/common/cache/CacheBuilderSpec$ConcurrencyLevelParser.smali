.class final Lcom/google/common/cache/CacheBuilderSpec$ConcurrencyLevelParser;
.super Lcom/google/common/cache/CacheBuilderSpec$IntegerParser;
.source "CacheBuilderSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/CacheBuilderSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ConcurrencyLevelParser"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 370
    invoke-direct {p0, v0}, Lcom/google/common/cache/CacheBuilderSpec$IntegerParser;-><init>(Lcom/google/common/cache/CacheBuilderSpec$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/cache/CacheBuilderSpec$1;)V
    .registers 2

    .line 370
    invoke-direct {p0}, Lcom/google/common/cache/CacheBuilderSpec$ConcurrencyLevelParser;-><init>()V

    return-void
.end method


# virtual methods
.method writeToSpec(Lcom/google/common/cache/CacheBuilderSpec;I)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "spec",
            "value"
        }
    .end annotation

    .line 373
    iget-object p0, p1, Lcom/google/common/cache/CacheBuilderSpec;->concurrencyLevel:Ljava/lang/Integer;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const-string v0, "concurrency level was already set to %s"

    iget-object v1, p1, Lcom/google/common/cache/CacheBuilderSpec;->concurrencyLevel:Ljava/lang/Integer;

    invoke-static {p0, v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 377
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    iput-object p0, p1, Lcom/google/common/cache/CacheBuilderSpec;->concurrencyLevel:Ljava/lang/Integer;

    return-void
.end method
