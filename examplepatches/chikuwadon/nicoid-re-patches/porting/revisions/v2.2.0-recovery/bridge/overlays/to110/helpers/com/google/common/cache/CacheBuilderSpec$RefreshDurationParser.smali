.class final Lcom/google/common/cache/CacheBuilderSpec$RefreshDurationParser;
.super Lcom/google/common/cache/CacheBuilderSpec$DurationParser;
.source "CacheBuilderSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/CacheBuilderSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RefreshDurationParser"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 486
    invoke-direct {p0, v0}, Lcom/google/common/cache/CacheBuilderSpec$DurationParser;-><init>(Lcom/google/common/cache/CacheBuilderSpec$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/cache/CacheBuilderSpec$1;)V
    .registers 2

    .line 486
    invoke-direct {p0}, Lcom/google/common/cache/CacheBuilderSpec$RefreshDurationParser;-><init>()V

    return-void
.end method


# virtual methods
.method writeToSpec(Lcom/google/common/cache/CacheBuilderSpec;JLjava/util/concurrent/TimeUnit;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "spec",
            "duration",
            "unit"
        }
    .end annotation

    .line 489
    iget-object p0, p1, Lcom/google/common/cache/CacheBuilderSpec;->refreshTimeUnit:Ljava/util/concurrent/TimeUnit;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const-string v0, "refreshAfterWrite already set"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 490
    iput-wide p2, p1, Lcom/google/common/cache/CacheBuilderSpec;->refreshDuration:J

    .line 491
    iput-object p4, p1, Lcom/google/common/cache/CacheBuilderSpec;->refreshTimeUnit:Ljava/util/concurrent/TimeUnit;

    return-void
.end method
