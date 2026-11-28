.class Lcom/google/common/cache/CacheBuilder$3;
.super Lcom/google/common/base/Ticker;
.source "CacheBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/CacheBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 271
    invoke-direct {p0}, Lcom/google/common/base/Ticker;-><init>()V

    return-void
.end method


# virtual methods
.method public read()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method
