.class final Le/e/a/ScrollingTimeline267$FrameBudget;
.super Ljava/lang/Object;
.source "ScrollingTimeline267.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ScrollingTimeline267;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FrameBudget"
.end annotation


# static fields
.field static final MAX_ITEMS:I = 0x30

.field static final MAX_NANOS:J = 0x16e360L


# instance fields
.field private consumed:I

.field private deadline:J

.field private remaining:I


# direct methods
.method constructor <init>()V
    .registers 5

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Le/e/a/ScrollingTimeline267$FrameBudget;->reset()V

    return-void
.end method


# virtual methods
.method remaining()I
    .registers 5

    .line 26
    iget v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining:I

    if-lez v0, :cond_1

    iget v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->consumed:I

    if-eqz v0, :cond_0

    iget-wide v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->deadline:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 27
    :cond_0
    iget v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining:I

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    return v0
.end method

.method reset()V
    .registers 5

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->consumed:I

    .line 21
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/32 v2, 0x16e360

    add-long/2addr v0, v2

    iput-wide v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->deadline:J

    .line 22
    const/16 v0, 0x30

    iput v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining:I

    return-void
.end method

.method take()Z
    .registers 3

    .line 31
    invoke-virtual {p0}, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 32
    :cond_0
    iget v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->remaining:I

    .line 33
    iget v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->consumed:I

    add-int/2addr v0, v1

    iput v0, p0, Le/e/a/ScrollingTimeline267$FrameBudget;->consumed:I

    .line 34
    return v1
.end method
