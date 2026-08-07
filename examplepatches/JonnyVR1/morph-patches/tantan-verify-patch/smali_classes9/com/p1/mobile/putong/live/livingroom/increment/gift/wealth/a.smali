.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

.field public b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getWealth()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getWealth()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getPreWealth()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getPreWealth()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    cmp-long v0, v0, v2

    .line 36
    .line 37
    if-gez v0, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    return-void

    .line 41
    :cond_3
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 42
    .line 43
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 5
    .line 6
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getGrade()J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getSuperGrade()J

    .line 20
    .line 21
    .line 22
    move-result-wide v6

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getWealthRatio()D

    .line 26
    .line 27
    .line 28
    move-result-wide v8

    .line 29
    invoke-direct/range {v3 .. v9}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;-><init>(JJD)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getWealth()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getPreWealth()J

    .line 41
    .line 42
    .line 43
    move-result-wide v6

    .line 44
    sub-long/2addr v4, v6

    .line 45
    invoke-virtual {v3, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a$a;->e(J)V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->a:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/a;->b:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 51
    .line 52
    return-object v3

    .line 53
    :cond_1
    :goto_0
    return-object v1
.end method
