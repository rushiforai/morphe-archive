.class Lcom/google/common/base/Ticker$1;
.super Lcom/google/common/base/Ticker;
.source "Ticker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/Ticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 48
    invoke-direct {p0}, Lcom/google/common/base/Ticker;-><init>()V

    return-void
.end method


# virtual methods
.method public read()J
    .registers 3

    .line 52
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method
