.class public Ll/pk4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# instance fields
.field public a:Ll/ox2;

.field public b:Z

.field public c:Z

.field public d:I

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Rect;

.field public g:F

.field public h:F

.field public i:J

.field public j:J

.field public k:I

.field public l:Landroid/graphics/Path;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Long;",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public o:J

.field public p:J


# direct methods
.method public constructor <init>(Ll/ox2;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/pk4;->b:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/pk4;->c:Z

    .line 8
    .line 9
    const-wide/16 v0, 0x1770

    .line 10
    .line 11
    iput-wide v0, p0, Ll/pk4;->i:J

    .line 12
    .line 13
    const-wide/16 v0, 0x64

    .line 14
    .line 15
    iput-wide v0, p0, Ll/pk4;->j:J

    .line 16
    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    iput v0, p0, Ll/pk4;->k:I

    .line 20
    .line 21
    new-instance v0, Landroid/graphics/Path;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/pk4;->l:Landroid/graphics/Path;

    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/pk4;->m:Ljava/util/List;

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/pk4;->n:Ljava/util/List;

    .line 41
    .line 42
    const-wide/16 v0, -0x1

    .line 43
    .line 44
    iput-wide v0, p0, Ll/pk4;->o:J

    .line 45
    .line 46
    iput-wide v0, p0, Ll/pk4;->p:J

    .line 47
    .line 48
    iput-object p1, p0, Ll/pk4;->a:Ll/ox2;

    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/pk4;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/pf60;

    .line 18
    .line 19
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    sub-long v0, p1, v0

    .line 28
    .line 29
    const-wide/16 v2, 0x1f40

    .line 30
    .line 31
    cmp-long v0, v0, v2

    .line 32
    .line 33
    if-ltz v0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method

.method public final b()V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/pk4;->e:Landroid/graphics/Paint;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    iget v1, p0, Ll/pk4;->d:I

    .line 11
    .line 12
    iget-object v2, p0, Ll/pk4;->a:Ll/ox2;

    .line 13
    .line 14
    const/high16 v3, 0x42c80000    # 100.0f

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ll/ox2;->n(F)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-direct {v0, v4, v4, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/pk4;->f:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget v0, p0, Ll/pk4;->d:I

    .line 27
    .line 28
    int-to-float v0, v0

    .line 29
    iget-wide v1, p0, Ll/pk4;->i:J

    .line 30
    .line 31
    long-to-float v1, v1

    .line 32
    div-float/2addr v0, v1

    .line 33
    iput v0, p0, Ll/pk4;->g:F

    .line 34
    .line 35
    iget-object v0, p0, Ll/pk4;->a:Ll/ox2;

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ll/ox2;->n(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget v1, p0, Ll/pk4;->k:I

    .line 42
    .line 43
    sub-int/2addr v0, v1

    .line 44
    int-to-float v0, v0

    .line 45
    const/high16 v1, 0x42700000    # 60.0f

    .line 46
    .line 47
    div-float/2addr v0, v1

    .line 48
    iput v0, p0, Ll/pk4;->h:F

    .line 49
    .line 50
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final c(J)V
    .locals 5

    .line 1
    iget-wide v0, p0, Ll/pk4;->p:J

    .line 2
    .line 3
    sub-long v0, p1, v0

    .line 4
    .line 5
    iget-wide v2, p0, Ll/pk4;->j:J

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/pk4;->n:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x0

    .line 19
    move v3, v1

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    int-to-float v4, v4

    .line 37
    add-float/2addr v3, v4

    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    if-nez v2, :cond_1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    int-to-float v0, v2

    .line 45
    div-float v1, v3, v0

    .line 46
    .line 47
    :goto_1
    iget-object v0, p0, Ll/pk4;->n:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/pk4;->m:Ljava/util/List;

    .line 53
    .line 54
    iget-wide v2, p0, Ll/pk4;->p:J

    .line 55
    .line 56
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iput-wide p1, p0, Ll/pk4;->p:J

    .line 72
    .line 73
    invoke-virtual {p0, p1, p2}, Ll/pk4;->a(J)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public d(II)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Ll/pk4;->d:I

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/pk4;->c:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Ll/pk4;->b:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Ll/pk4;->c:Z

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/pk4;->b()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/pk4;->a:Ll/ox2;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/pk4;->a:Ll/ox2;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public doFrame(J)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    iget-wide v0, p0, Ll/pk4;->p:J

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    iput-wide p1, p0, Ll/pk4;->p:J

    .line 21
    .line 22
    :cond_0
    iget-wide v0, p0, Ll/pk4;->o:J

    .line 23
    .line 24
    cmp-long v2, v0, v2

    .line 25
    .line 26
    if-ltz v2, :cond_1

    .line 27
    .line 28
    const-wide/16 v2, 0x3e8

    .line 29
    .line 30
    sub-long v0, p1, v0

    .line 31
    .line 32
    div-long/2addr v2, v0

    .line 33
    long-to-int v0, v2

    .line 34
    iget-object v1, p0, Ll/pk4;->n:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    iput-wide v0, p0, Ll/pk4;->o:J

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Ll/pk4;->c(J)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/pk4;->a:Ll/ox2;

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget-object p0, p0, Ll/pk4;->a:Ll/ox2;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method
