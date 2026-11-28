.class final Lcom/google/common/cache/CacheBuilderSpec$RecordStatsParser;
.super Ljava/lang/Object;
.source "CacheBuilderSpec.java"

# interfaces
.implements Lcom/google/common/cache/CacheBuilderSpec$ValueParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/CacheBuilderSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RecordStatsParser"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 416
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/cache/CacheBuilderSpec$1;)V
    .registers 2

    .line 416
    invoke-direct {p0}, Lcom/google/common/cache/CacheBuilderSpec$RecordStatsParser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lcom/google/common/cache/CacheBuilderSpec;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "spec",
            "key",
            "value"
        }
    .end annotation

    const/4 p0, 0x1

    const/4 p2, 0x0

    if-nez p3, :cond_0

    move p3, p0

    goto :goto_0

    :cond_0
    move p3, p2

    .line 420
    :goto_0
    const-string v0, "recordStats does not take values"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 421
    iget-object p3, p1, Lcom/google/common/cache/CacheBuilderSpec;->recordStats:Ljava/lang/Boolean;

    if-eqz p3, :cond_1

    move p0, p2

    :cond_1
    const-string p2, "recordStats already set"

    invoke-static {p0, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 422
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object p0, p1, Lcom/google/common/cache/CacheBuilderSpec;->recordStats:Ljava/lang/Boolean;

    return-void
.end method
