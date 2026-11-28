.class final Lcom/google/common/cache/CacheBuilderSpec$MaximumWeightParser;
.super Lcom/google/common/cache/CacheBuilderSpec$LongParser;
.source "CacheBuilderSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/CacheBuilderSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MaximumWeightParser"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 358
    invoke-direct {p0, v0}, Lcom/google/common/cache/CacheBuilderSpec$LongParser;-><init>(Lcom/google/common/cache/CacheBuilderSpec$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/cache/CacheBuilderSpec$1;)V
    .registers 2

    .line 358
    invoke-direct {p0}, Lcom/google/common/cache/CacheBuilderSpec$MaximumWeightParser;-><init>()V

    return-void
.end method


# virtual methods
.method writeToSpec(Lcom/google/common/cache/CacheBuilderSpec;J)V
    .registers 8
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

    .line 361
    iget-object p0, p1, Lcom/google/common/cache/CacheBuilderSpec;->maximumWeight:Ljava/lang/Long;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p0, :cond_0

    move p0, v0

    goto :goto_0

    :cond_0
    move p0, v1

    :goto_0
    const-string v2, "maximum weight was already set to %s"

    iget-object v3, p1, Lcom/google/common/cache/CacheBuilderSpec;->maximumWeight:Ljava/lang/Long;

    invoke-static {p0, v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 363
    iget-object p0, p1, Lcom/google/common/cache/CacheBuilderSpec;->maximumSize:Ljava/lang/Long;

    if-eqz p0, :cond_1

    move v0, v1

    :cond_1
    const-string p0, "maximum size was already set to %s"

    iget-object v1, p1, Lcom/google/common/cache/CacheBuilderSpec;->maximumSize:Ljava/lang/Long;

    invoke-static {v0, p0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 365
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    iput-object p0, p1, Lcom/google/common/cache/CacheBuilderSpec;->maximumWeight:Ljava/lang/Long;

    return-void
.end method
