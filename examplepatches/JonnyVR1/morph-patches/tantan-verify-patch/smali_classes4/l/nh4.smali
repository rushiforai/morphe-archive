.class public Ll/nh4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/animation/Interpolator;

.field public b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

.field public c:J

.field public d:J

.field public e:I

.field public f:Ll/mo0;

.field public g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

.field public h:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public n:Z

.field public o:I

.field public p:Ll/txl0;

.field public q:Z


# direct methods
.method public constructor <init>(ILl/txl0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nh4;->a:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->INVALID:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 12
    .line 13
    iput-object v0, p0, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/nh4;->i:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Ll/nh4;->j:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/nh4;->k:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/nh4;->n:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/nh4;->q:Z

    .line 25
    .line 26
    iput-object p2, p0, Ll/nh4;->p:Ll/txl0;

    .line 27
    .line 28
    iput p1, p0, Ll/nh4;->o:I

    .line 29
    .line 30
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 31
    .line 32
    .line 33
    move-result-wide p1

    .line 34
    iput-wide p1, p0, Ll/nh4;->c:J

    .line 35
    .line 36
    new-instance p1, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/nh4;->m:Ljava/util/List;

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/nh4;->l:Ljava/util/List;

    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh4;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public varargs b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    aget-object v2, p1, v1

    .line 11
    .line 12
    iget-object v3, p0, Ll/nh4;->l:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/nh4;->m:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public e()Ll/mo0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh4;->f:Ll/mo0;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh4;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh4;->h:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ll/txl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh4;->p:Ll/txl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh4;->h:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nh4;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public l(Ll/txl0;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nh4;->l:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/nh4;->l:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 29
    .line 30
    iget-object v3, p1, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 31
    .line 32
    if-ne v3, v2, :cond_0

    .line 33
    .line 34
    return v1

    .line 35
    :cond_1
    iget-object v0, p0, Ll/nh4;->m:Ljava/util/List;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    iget-object p0, p0, Ll/nh4;->m:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget v2, p1, Ll/txl0;->k:I

    .line 68
    .line 69
    if-ne v2, v0, :cond_2

    .line 70
    .line 71
    return v1

    .line 72
    :cond_3
    const/4 p0, 0x0

    .line 73
    return p0
.end method

.method public m(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nh4;->m:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/nh4;->m:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ne p1, v0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public n(Ll/mo0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nh4;->f:Ll/mo0;

    .line 2
    .line 3
    return-void
.end method

.method public o(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/nh4;->d:J

    .line 2
    .line 3
    return-void
.end method

.method public p(Landroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nh4;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/nh4;->q:Z

    .line 2
    .line 3
    return-void
.end method
