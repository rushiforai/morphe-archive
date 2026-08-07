.class public Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;
.super Lv/VList;
.source "SourceFile"


# instance fields
.field public f:I

.field public final g:Z

.field public h:J

.field public i:J

.field public j:J

.field public k:Landroid/view/Choreographer$FrameCallback;

.field public final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VList;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->f:I

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->n()Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/gra;->n()Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;->monitorEnable:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->g:Z

    .line 29
    .line 30
    const-wide/16 v0, 0x0

    .line 31
    .line 32
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->h:J

    .line 33
    .line 34
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 35
    .line 36
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->j:J

    .line 37
    .line 38
    new-instance p1, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->l:Ljava/util/List;

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Lv/VList;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->f:I

    .line 48
    invoke-static {}, Ll/gra;->n()Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;

    move-result-object p1

    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 49
    invoke-static {}, Ll/gra;->n()Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;

    move-result-object p1

    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;->monitorEnable:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->g:Z

    const-wide/16 p1, 0x0

    .line 50
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->h:J

    .line 51
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 52
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->j:J

    .line 53
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->l:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2, p3}, Lv/VList;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->f:I

    .line 56
    invoke-static {}, Ll/gra;->n()Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;

    move-result-object p1

    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 57
    invoke-static {}, Ll/gra;->n()Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;

    move-result-object p1

    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;->monitorEnable:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->g:Z

    const-wide/16 p1, 0x0

    .line 58
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->h:J

    .line 59
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 60
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->j:J

    .line 61
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->l:Ljava/util/List;

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->c(J)V

    return-void
.end method


# virtual methods
.method public final synthetic c(J)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->h:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 10
    .line 11
    const-wide/16 v4, 0x1

    .line 12
    .line 13
    add-long/2addr v0, v4

    .line 14
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 15
    .line 16
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->j:J

    .line 21
    .line 22
    sub-long/2addr v0, v4

    .line 23
    const-wide/16 v4, 0x3e8

    .line 24
    .line 25
    cmp-long v4, v0, v4

    .line 26
    .line 27
    if-ltz v4, :cond_0

    .line 28
    .line 29
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 30
    .line 31
    long-to-float v4, v4

    .line 32
    long-to-float v0, v0

    .line 33
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 34
    .line 35
    div-float/2addr v0, v1

    .line 36
    div-float/2addr v4, v0

    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->l:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 47
    .line 48
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 49
    .line 50
    .line 51
    move-result-wide v0

    .line 52
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->j:J

    .line 53
    .line 54
    :cond_0
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->h:J

    .line 55
    .line 56
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->k:Landroid/view/Choreographer$FrameCallback;

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "ConversationList average start"

    .line 7
    .line 8
    invoke-static {v0}, Ll/ue6;->C(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->j:J

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->l:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/b46;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/b46;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->k:Landroid/view/Choreographer$FrameCallback;

    .line 28
    .line 29
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->k:Landroid/view/Choreographer$FrameCallback;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->f:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p1, v3, v0, v1, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "ConversationList average stop"

    .line 7
    .line 8
    invoke-static {v0}, Ll/ue6;->C(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->k:Landroid/view/Choreographer$FrameCallback;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->k:Landroid/view/Choreographer$FrameCallback;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->h:J

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->i:J

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->j:J

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->l:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->l:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/a46;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/a46;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->mapToLong(Ljava/util/function/ToLongFunction;)Ljava/util/stream/LongStream;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Ljava/util/stream/LongStream;->summaryStatistics()Ljava/util/LongSummaryStatistics;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ljava/util/LongSummaryStatistics;->getAverage()D

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    const-string p0, "frame_average"

    .line 64
    .line 65
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    filled-new-array {p0}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v0, "e_conversation_list_frame"

    .line 78
    .line 79
    const-string v1, "p_messages_view"

    .line 80
    .line 81
    invoke-static {v0, v1, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    :goto_0
    return-void
.end method

.method public setClipHeight(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->f:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->f:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
