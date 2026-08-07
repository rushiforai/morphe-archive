.class public abstract Ll/d9d0;
.super Ll/e9d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/e9d0<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:Ll/j9d0;

.field public j:Lcom/p1/mobile/putong/live/base/bean/UserRightType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e9d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 5
    .line 6
    iput p2, p0, Ll/d9d0;->f:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/d9d0;->g:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/d9d0;->h:Z

    .line 11
    .line 12
    iput-object p5, p0, Ll/d9d0;->i:Ll/j9d0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public H()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->canActionRight()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public I()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->canActive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/d9d0;->h:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/d9d0;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public J()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isEquipped()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/d9d0;->h:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/d9d0;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public K()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/d9d0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/d9d0;->h:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/d9d0;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public L()Z
    .locals 5

    .line 1
    iget-object p0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 10
    .line 11
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 12
    .line 13
    cmp-long v3, v1, v3

    .line 14
    .line 15
    if-ltz v3, :cond_1

    .line 16
    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    if-lez v1, :cond_1

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->stockCount:J

    .line 24
    .line 25
    cmp-long p0, v1, v3

    .line 26
    .line 27
    if-lez p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v0
.end method

.method public N()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/e9d0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/d9d0;->h:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/d9d0;->g:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public abstract O()I
.end method

.method public abstract P()I
.end method

.method public Q()I
    .locals 4

    .line 1
    iget-object p0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 10
    .line 11
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 12
    .line 13
    sub-long/2addr v0, v2

    .line 14
    long-to-int p0, v0

    .line 15
    return p0
.end method

.method public abstract R()I
.end method

.method public S()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isLocked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public T()Z
    .locals 7

    .line 1
    iget-object p0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 10
    .line 11
    const-wide/16 v3, 0x0

    .line 12
    .line 13
    cmp-long v5, v1, v3

    .line 14
    .line 15
    if-ltz v5, :cond_1

    .line 16
    .line 17
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 18
    .line 19
    cmp-long v1, v1, v5

    .line 20
    .line 21
    if-ltz v1, :cond_1

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->stockCount:J

    .line 24
    .line 25
    cmp-long p0, v1, v3

    .line 26
    .line 27
    if-gtz p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v0
.end method

.method public U()Z
    .locals 5

    .line 1
    iget-object p0, p0, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 10
    .line 11
    const-wide/16 v3, 0x0

    .line 12
    .line 13
    cmp-long v3, v1, v3

    .line 14
    .line 15
    if-ltz v3, :cond_1

    .line 16
    .line 17
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 18
    .line 19
    cmp-long p0, v1, v3

    .line 20
    .line 21
    if-gez p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    return v0
.end method
