.class public abstract Ll/ox2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/im4;


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/txl0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

.field public c:Ll/qn2;

.field public d:Ll/vr2;

.field public e:Ll/nx2;

.field public f:Ll/udj0;

.field public g:Ll/pk4;

.field public h:Ll/kj2;

.field public i:Ll/vo0;

.field public j:Landroid/content/Context;

.field public k:Ll/xi80;

.field public l:Ll/dn4;

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:Ll/pn4;

.field public r:J

.field public s:F

.field public t:F

.field public u:Z

.field public v:F

.field public w:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x42c80000    # 100.0f

    .line 5
    .line 6
    iput v0, p0, Ll/ox2;->m:F

    .line 7
    .line 8
    iput v0, p0, Ll/ox2;->n:F

    .line 9
    .line 10
    iput v0, p0, Ll/ox2;->o:F

    .line 11
    .line 12
    const/high16 v0, 0x41f00000    # 30.0f

    .line 13
    .line 14
    iput v0, p0, Ll/ox2;->p:F

    .line 15
    .line 16
    const-wide/16 v0, -0x1

    .line 17
    .line 18
    iput-wide v0, p0, Ll/ox2;->r:J

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Ll/ox2;->s:F

    .line 22
    .line 23
    iput v0, p0, Ll/ox2;->t:F

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p0, Ll/ox2;->u:Z

    .line 27
    .line 28
    iput v0, p0, Ll/ox2;->v:F

    .line 29
    .line 30
    iput v0, p0, Ll/ox2;->w:F

    .line 31
    .line 32
    iput-object p1, p0, Ll/ox2;->j:Landroid/content/Context;

    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ox2;->f()Ll/qn2;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/ox2;->c:Ll/qn2;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ox2;->h()Ll/udj0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Ll/ox2;->f:Ll/udj0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ox2;->e()Ll/kj2;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Ll/ox2;->h:Ll/kj2;

    .line 58
    .line 59
    iget-object v0, p0, Ll/ox2;->c:Ll/qn2;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ll/qn2;->p(Ll/ox2;)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/vo0;

    .line 65
    .line 66
    invoke-direct {v0, p0, p1}, Ll/vo0;-><init>(Ll/ox2;Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Ll/ox2;->i:Ll/vo0;

    .line 70
    .line 71
    new-instance p1, Ll/xi80;

    .line 72
    .line 73
    invoke-direct {p1}, Ll/xi80;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Ll/ox2;->k:Ll/xi80;

    .line 77
    .line 78
    new-instance p1, Ll/pk4;

    .line 79
    .line 80
    invoke-direct {p1, p0}, Ll/pk4;-><init>(Ll/ox2;)V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Ll/ox2;->g:Ll/pk4;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/ox2;->g()Ll/vr2;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Ll/ox2;->d:Ll/vr2;

    .line 90
    .line 91
    sget p1, Ll/vo0;->t:F

    .line 92
    .line 93
    iput p1, p0, Ll/ox2;->m:F

    .line 94
    .line 95
    sget p1, Ll/vo0;->u:F

    .line 96
    .line 97
    iput p1, p0, Ll/ox2;->o:F

    .line 98
    .line 99
    sget p1, Ll/vo0;->v:F

    .line 100
    .line 101
    iput p1, p0, Ll/ox2;->p:F

    .line 102
    .line 103
    sget p1, Ll/vo0;->I:F

    .line 104
    .line 105
    iput p1, p0, Ll/ox2;->n:F

    .line 106
    .line 107
    return-void
.end method


# virtual methods
.method public A()Ll/qn2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->c:Ll/qn2;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final C()F
    .locals 0

    .line 1
    iget p0, p0, Ll/ox2;->p:F

    .line 2
    .line 3
    return p0
.end method

.method public D()F
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    const/high16 v0, 0x3e800000    # 0.25f

    .line 9
    .line 10
    mul-float/2addr p0, v0

    .line 11
    return p0
.end method

.method public E()F
    .locals 0

    .line 1
    sget p0, Ll/vo0;->F:F

    .line 2
    .line 3
    return p0
.end method

.method public F()F
    .locals 0

    .line 1
    sget p0, Ll/vo0;->F:F

    .line 2
    .line 3
    return p0
.end method

.method public G()Ll/txl0;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
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
    check-cast v0, Ll/txl0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/txl0;->b()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public H()Ll/udj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->f:Ll/udj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Ll/nh4;J)V
    .locals 2

    .line 1
    sget-object p2, Ll/ox2$a;->a:[I

    .line 2
    .line 3
    iget-object p3, p1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    aget p2, p2, p3

    .line 10
    .line 11
    const/4 p3, 0x1

    .line 12
    if-eq p2, p3, :cond_5

    .line 13
    .line 14
    const/4 p3, 0x2

    .line 15
    if-eq p2, p3, :cond_1

    .line 16
    .line 17
    const/4 p3, 0x3

    .line 18
    if-eq p2, p3, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p2, p1, Ll/nh4;->p:Ll/txl0;

    .line 22
    .line 23
    iget-object p2, p2, Ll/txl0;->a:Landroid/view/View;

    .line 24
    .line 25
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 26
    .line 27
    iget-boolean v0, p1, Ll/nh4;->i:Z

    .line 28
    .line 29
    invoke-virtual {p0, p2, p3, v0}, Ll/ox2;->n0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 30
    .line 31
    .line 32
    iget-wide p2, p1, Ll/nh4;->c:J

    .line 33
    .line 34
    iget-wide v0, p1, Ll/nh4;->d:J

    .line 35
    .line 36
    add-long/2addr p2, v0

    .line 37
    invoke-virtual {p0, p1, p2, p3}, Ll/ox2;->J(Ll/nh4;J)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p2, p1, Ll/nh4;->p:Ll/txl0;

    .line 42
    .line 43
    iget-object p2, p2, Ll/txl0;->a:Landroid/view/View;

    .line 44
    .line 45
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 46
    .line 47
    iget-boolean v0, p1, Ll/nh4;->i:Z

    .line 48
    .line 49
    invoke-virtual {p0, p2, p3, v0}, Ll/ox2;->n0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 50
    .line 51
    .line 52
    iget-wide p2, p1, Ll/nh4;->c:J

    .line 53
    .line 54
    iget-wide v0, p1, Ll/nh4;->d:J

    .line 55
    .line 56
    add-long/2addr p2, v0

    .line 57
    invoke-virtual {p0, p1, p2, p3}, Ll/ox2;->L(Ll/nh4;J)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Ll/ox2;->a:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    :cond_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    const/4 v0, 0x0

    .line 71
    if-eqz p3, :cond_3

    .line 72
    .line 73
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    check-cast p3, Ll/txl0;

    .line 78
    .line 79
    invoke-virtual {p1, p3}, Ll/nh4;->l(Ll/txl0;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget v1, p3, Ll/txl0;->e:I

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-object p1, p3, Ll/txl0;->a:Landroid/view/View;

    .line 90
    .line 91
    instance-of p2, p1, Ll/pn4;

    .line 92
    .line 93
    if-eqz p2, :cond_3

    .line 94
    .line 95
    check-cast p1, Ll/pn4;

    .line 96
    .line 97
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 98
    .line 99
    invoke-interface {p1, v0, v0, v0, p2}, Ll/pn4;->d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 100
    .line 101
    .line 102
    :cond_3
    iget-object p1, p0, Ll/ox2;->q:Ll/pn4;

    .line 103
    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 107
    .line 108
    invoke-interface {p1, v0, v0, v0, p2}, Ll/pn4;->d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/ox2;->q:Ll/pn4;

    .line 112
    .line 113
    invoke-interface {p0, v0, v0, p2}, Ll/pn4;->v0(FFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    :goto_0
    return-void

    .line 117
    :cond_5
    iget-object p2, p1, Ll/nh4;->p:Ll/txl0;

    .line 118
    .line 119
    iget-object p2, p2, Ll/txl0;->a:Landroid/view/View;

    .line 120
    .line 121
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 122
    .line 123
    iget-boolean v0, p1, Ll/nh4;->i:Z

    .line 124
    .line 125
    invoke-virtual {p0, p2, p3, v0}, Ll/ox2;->n0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ll/ox2;->f0(Ll/nh4;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public abstract J(Ll/nh4;J)V
.end method

.method public K(Ll/nh4;J)V
    .locals 2

    .line 1
    sget-object v0, Ll/ox2$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Ll/ox2;->J(Ll/nh4;J)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Ll/ox2;->L(Ll/nh4;J)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Ll/ox2;->M(Ll/nh4;J)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public abstract L(Ll/nh4;J)V
.end method

.method public abstract M(Ll/nh4;J)V
.end method

.method public N(Ll/nh4;)V
    .locals 2

    .line 1
    sget-object v0, Ll/ox2$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p1, Ll/nh4;->p:Ll/txl0;

    .line 22
    .line 23
    iget-object v0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 26
    .line 27
    iget-boolean p1, p1, Ll/nh4;->i:Z

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, p1}, Ll/ox2;->n0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object v0, p1, Ll/nh4;->p:Ll/txl0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 38
    .line 39
    iget-boolean p1, p1, Ll/nh4;->i:Z

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1, p1}, Ll/ox2;->n0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public O(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V
    .locals 8

    .line 1
    move-object v0, p0

    .line 2
    move v1, p2

    .line 3
    move v2, p3

    .line 4
    move v3, p4

    .line 5
    move v4, p5

    .line 6
    move-object v5, p6

    .line 7
    move v6, p7

    .line 8
    move-object/from16 v7, p8

    .line 9
    .line 10
    invoke-virtual/range {v0 .. v7}, Ll/ox2;->j(FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/ox2;->q:Ll/pn4;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sub-float v2, p2, p4

    .line 18
    .line 19
    sub-float v3, p3, p5

    .line 20
    .line 21
    invoke-interface {v1, v2, v3, p6}, Ll/pn4;->v0(FFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    sub-float/2addr p2, p4

    .line 25
    iget p4, p0, Ll/ox2;->m:F

    .line 26
    .line 27
    div-float p4, p2, p4

    .line 28
    .line 29
    sub-float/2addr p3, p5

    .line 30
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 31
    .line 32
    .line 33
    move-result p5

    .line 34
    invoke-virtual {p0}, Ll/ox2;->y()F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    cmpl-float p5, p5, v1

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    if-lez p5, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ox2;->y()F

    .line 44
    .line 45
    .line 46
    move-result p5

    .line 47
    add-float/2addr p5, p3

    .line 48
    iget v2, p0, Ll/ox2;->m:F

    .line 49
    .line 50
    div-float/2addr p5, v2

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move p5, v1

    .line 53
    :goto_0
    invoke-virtual {p0}, Ll/ox2;->W()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    move p5, v1

    .line 60
    :cond_2
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-virtual {p0}, Ll/ox2;->v()F

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    cmpg-float p2, p2, v2

    .line 69
    .line 70
    if-gez p2, :cond_3

    .line 71
    .line 72
    move p4, v1

    .line 73
    :cond_3
    cmpl-float p2, p5, v1

    .line 74
    .line 75
    if-gtz p2, :cond_7

    .line 76
    .line 77
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    neg-float v2, p5

    .line 82
    cmpl-float p2, p2, v2

    .line 83
    .line 84
    if-gtz p2, :cond_7

    .line 85
    .line 86
    iget-object p2, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 87
    .line 88
    const/4 v3, 0x1

    .line 89
    invoke-virtual {p2, v3}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->v(Z)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_4

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_4
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 101
    .line 102
    .line 103
    move-result p5

    .line 104
    cmpg-float p2, p2, p5

    .line 105
    .line 106
    if-gez p2, :cond_6

    .line 107
    .line 108
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    invoke-virtual {p0}, Ll/ox2;->y()F

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    cmpl-float p2, p2, p3

    .line 117
    .line 118
    if-lez p2, :cond_6

    .line 119
    .line 120
    cmpl-float p2, p4, v1

    .line 121
    .line 122
    if-lez p2, :cond_5

    .line 123
    .line 124
    sub-float/2addr v2, p4

    .line 125
    :goto_1
    move v4, v2

    .line 126
    goto :goto_2

    .line 127
    :cond_5
    add-float/2addr v2, p4

    .line 128
    goto :goto_1

    .line 129
    :goto_2
    const/4 v2, 0x0

    .line 130
    const/4 v3, 0x0

    .line 131
    move-object v0, p0

    .line 132
    move-object v1, p1

    .line 133
    move-object v5, p6

    .line 134
    invoke-virtual/range {v0 .. v5}, Ll/ox2;->i(Landroid/view/View;FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_6
    const/4 v3, 0x0

    .line 139
    const/4 v4, 0x0

    .line 140
    const/4 v2, 0x0

    .line 141
    move-object v0, p0

    .line 142
    move-object v1, p1

    .line 143
    move-object v5, p6

    .line 144
    invoke-virtual/range {v0 .. v5}, Ll/ox2;->i(Landroid/view/View;FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_7
    :goto_3
    cmpg-float p2, p5, v1

    .line 149
    .line 150
    if-gez p2, :cond_9

    .line 151
    .line 152
    cmpl-float p2, p4, v1

    .line 153
    .line 154
    if-lez p2, :cond_8

    .line 155
    .line 156
    add-float/2addr p4, p5

    .line 157
    goto :goto_4

    .line 158
    :cond_8
    sub-float/2addr p4, p5

    .line 159
    :cond_9
    :goto_4
    move v3, p4

    .line 160
    cmpg-float p2, v3, v1

    .line 161
    .line 162
    if-gez p2, :cond_a

    .line 163
    .line 164
    neg-float v2, v3

    .line 165
    const/4 v3, 0x0

    .line 166
    const/4 v4, 0x0

    .line 167
    move-object v0, p0

    .line 168
    move-object v1, p1

    .line 169
    move-object v5, p6

    .line 170
    invoke-virtual/range {v0 .. v5}, Ll/ox2;->i(Landroid/view/View;FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_a
    cmpl-float p2, v3, v1

    .line 175
    .line 176
    if-lez p2, :cond_b

    .line 177
    .line 178
    const/4 v2, 0x0

    .line 179
    const/4 v4, 0x0

    .line 180
    move-object v0, p0

    .line 181
    move-object v1, p1

    .line 182
    move-object v5, p6

    .line 183
    invoke-virtual/range {v0 .. v5}, Ll/ox2;->i(Landroid/view/View;FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 184
    .line 185
    .line 186
    :cond_b
    return-void
.end method

.method public P(FFFF)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v4, p3

    .line 4
    .line 5
    move/from16 v5, p4

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/qn2;->d()I

    .line 12
    .line 13
    .line 14
    move-result v9

    .line 15
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/qn2;->e()F

    .line 20
    .line 21
    .line 22
    move-result v10

    .line 23
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ll/qn2;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v11

    .line 31
    iget-object v1, v0, Ll/ox2;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v12

    .line 37
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_9

    .line 42
    .line 43
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    move-object v6, v1

    .line 48
    check-cast v6, Ll/txl0;

    .line 49
    .line 50
    iget v1, v6, Ll/txl0;->e:I

    .line 51
    .line 52
    if-nez v1, :cond_0

    .line 53
    .line 54
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 57
    .line 58
    .line 59
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {v1, v4}, Landroid/view/View;->setPivotX(F)V

    .line 62
    .line 63
    .line 64
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {v1, v5}, Landroid/view/View;->setPivotY(F)V

    .line 67
    .line 68
    .line 69
    sub-float v1, p1, v4

    .line 70
    .line 71
    sub-float v2, p2, v5

    .line 72
    .line 73
    iget-object v3, v6, Ll/txl0;->a:Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {v3, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 76
    .line 77
    .line 78
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 81
    .line 82
    .line 83
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 84
    .line 85
    move/from16 v2, p1

    .line 86
    .line 87
    move/from16 v3, p2

    .line 88
    .line 89
    invoke-virtual/range {v0 .. v5}, Ll/ox2;->h0(Landroid/view/View;FFFF)V

    .line 90
    .line 91
    .line 92
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 93
    .line 94
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 95
    .line 96
    const/4 v7, 0x0

    .line 97
    const-string v8, "touch move"

    .line 98
    .line 99
    move-object/from16 v0, p0

    .line 100
    .line 101
    move/from16 v4, p3

    .line 102
    .line 103
    move/from16 v5, p4

    .line 104
    .line 105
    invoke-virtual/range {v0 .. v8}, Ll/ox2;->O(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_0
    sub-float v1, p1, p3

    .line 110
    .line 111
    mul-float/2addr v1, v1

    .line 112
    sub-float v2, p2, p4

    .line 113
    .line 114
    mul-float/2addr v2, v2

    .line 115
    add-float/2addr v1, v2

    .line 116
    float-to-double v1, v1

    .line 117
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 118
    .line 119
    .line 120
    move-result-wide v1

    .line 121
    double-to-float v1, v1

    .line 122
    iget v2, v6, Ll/txl0;->e:I

    .line 123
    .line 124
    if-gez v2, :cond_1

    .line 125
    .line 126
    :goto_1
    move/from16 v4, p3

    .line 127
    .line 128
    move/from16 v5, p4

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_1
    iget v3, v0, Ll/ox2;->m:F

    .line 132
    .line 133
    div-float/2addr v1, v3

    .line 134
    const/high16 v3, 0x3f800000    # 1.0f

    .line 135
    .line 136
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    int-to-float v4, v2

    .line 141
    sub-float/2addr v4, v1

    .line 142
    const/high16 v5, 0x40000000    # 2.0f

    .line 143
    .line 144
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    mul-float v7, v4, v10

    .line 149
    .line 150
    sub-float v7, v3, v7

    .line 151
    .line 152
    mul-float v8, v7, v7

    .line 153
    .line 154
    mul-float/2addr v8, v7

    .line 155
    invoke-static {v8}, Ljava/lang/Float;->isNaN(F)Z

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    if-eqz v7, :cond_2

    .line 160
    .line 161
    goto/16 :goto_4

    .line 162
    .line 163
    :cond_2
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 164
    .line 165
    invoke-virtual {v7}, Ll/vr2;->h()Z

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    const/4 v13, 0x0

    .line 170
    if-eqz v7, :cond_5

    .line 171
    .line 172
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 173
    .line 174
    invoke-virtual {v7}, Ll/vr2;->a()F

    .line 175
    .line 176
    .line 177
    move-result v7

    .line 178
    cmpg-float v7, v7, v3

    .line 179
    .line 180
    if-gez v7, :cond_5

    .line 181
    .line 182
    const/4 v7, 0x1

    .line 183
    if-ne v2, v7, :cond_3

    .line 184
    .line 185
    iget-object v2, v0, Ll/ox2;->d:Ll/vr2;

    .line 186
    .line 187
    invoke-virtual {v2}, Ll/vr2;->b()F

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    mul-float/2addr v1, v2

    .line 192
    iget-object v2, v0, Ll/ox2;->d:Ll/vr2;

    .line 193
    .line 194
    invoke-virtual {v2}, Ll/vr2;->a()F

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    add-float/2addr v1, v2

    .line 199
    invoke-static {v13, v1}, Ljava/lang/Math;->max(FF)F

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 208
    .line 209
    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V

    .line 210
    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_3
    const/4 v7, 0x2

    .line 214
    if-ne v2, v7, :cond_4

    .line 215
    .line 216
    iget-object v2, v0, Ll/ox2;->d:Ll/vr2;

    .line 217
    .line 218
    invoke-virtual {v2}, Ll/vr2;->a()F

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    mul-float/2addr v1, v2

    .line 223
    invoke-static {v13, v1}, Ljava/lang/Math;->max(FF)F

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 232
    .line 233
    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V

    .line 234
    .line 235
    .line 236
    goto :goto_2

    .line 237
    :cond_4
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 238
    .line 239
    invoke-virtual {v1, v13}, Landroid/view/View;->setAlpha(F)V

    .line 240
    .line 241
    .line 242
    :cond_5
    :goto_2
    float-to-double v1, v4

    .line 243
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 244
    .line 245
    .line 246
    move-result-wide v1

    .line 247
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 248
    .line 249
    .line 250
    move-result-wide v1

    .line 251
    double-to-float v1, v1

    .line 252
    mul-float v2, v1, v1

    .line 253
    .line 254
    mul-float/2addr v2, v1

    .line 255
    float-to-double v14, v2

    .line 256
    float-to-double v1, v1

    .line 257
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 258
    .line 259
    .line 260
    move-result-wide v1

    .line 261
    mul-double/2addr v14, v1

    .line 262
    double-to-float v1, v14

    .line 263
    int-to-float v2, v9

    .line 264
    mul-float/2addr v1, v2

    .line 265
    if-eqz v11, :cond_6

    .line 266
    .line 267
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 268
    .line 269
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    int-to-float v2, v2

    .line 274
    sub-float v4, v3, v8

    .line 275
    .line 276
    mul-float/2addr v2, v4

    .line 277
    div-float/2addr v2, v5

    .line 278
    goto :goto_3

    .line 279
    :cond_6
    move v2, v13

    .line 280
    :goto_3
    add-float/2addr v1, v2

    .line 281
    sget-boolean v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 282
    .line 283
    if-eqz v2, :cond_7

    .line 284
    .line 285
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 286
    .line 287
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 288
    .line 289
    .line 290
    :cond_7
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 291
    .line 292
    invoke-virtual {v2, v8}, Landroid/view/View;->setScaleY(F)V

    .line 293
    .line 294
    .line 295
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 296
    .line 297
    invoke-virtual {v2, v8}, Landroid/view/View;->setScaleX(F)V

    .line 298
    .line 299
    .line 300
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 301
    .line 302
    invoke-virtual {v2, v13}, Landroid/view/View;->setRotation(F)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-virtual {v2}, Ll/qn2;->q()Z

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    if-eqz v2, :cond_8

    .line 314
    .line 315
    const/high16 v3, -0x40800000    # -1.0f

    .line 316
    .line 317
    :cond_8
    iget-object v2, v6, Ll/txl0;->a:Landroid/view/View;

    .line 318
    .line 319
    mul-float/2addr v3, v1

    .line 320
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 321
    .line 322
    .line 323
    iget-object v1, v6, Ll/txl0;->a:Landroid/view/View;

    .line 324
    .line 325
    invoke-virtual {v1, v13}, Landroid/view/View;->setTranslationX(F)V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_1

    .line 329
    .line 330
    :cond_9
    :goto_4
    return-void
.end method

.method public Q(FFFFFF)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->U(FFFFFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R(FFFFFF)V
    .locals 15

    .line 1
    move/from16 v7, p6

    .line 2
    .line 3
    neg-float v1, v7

    .line 4
    invoke-static/range {p5 .. p5}, Ljava/lang/Math;->abs(F)F

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    invoke-virtual {p0}, Ll/ox2;->F()F

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    mul-float/2addr v2, v3

    .line 13
    cmpl-float v1, v1, v2

    .line 14
    .line 15
    if-lez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->v(Z)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ox2;->W()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 33
    .line 34
    :goto_0
    move-object v3, v1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    cmpl-float v1, p5, v1

    .line 38
    .line 39
    if-lez v1, :cond_1

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :goto_1
    sget v1, Ll/vo0;->r:F

    .line 48
    .line 49
    div-float v2, p5, v1

    .line 50
    .line 51
    div-float v1, v7, v1

    .line 52
    .line 53
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    sget v9, Ll/vo0;->x:F

    .line 66
    .line 67
    cmpl-float v5, v4, v9

    .line 68
    .line 69
    if-lez v5, :cond_2

    .line 70
    .line 71
    div-float/2addr v4, v9

    .line 72
    div-float/2addr v2, v4

    .line 73
    div-float/2addr v1, v4

    .line 74
    :cond_2
    move v6, v1

    .line 75
    move v5, v2

    .line 76
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 77
    .line 78
    .line 79
    move-result-object v10

    .line 80
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->PRE_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 81
    .line 82
    iput-object v1, v10, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 83
    .line 84
    new-instance v1, Ll/mo0;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/mo0;-><init>()V

    .line 87
    .line 88
    .line 89
    iget-object v2, v10, Ll/txl0;->a:Landroid/view/View;

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ll/mo0;->e(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    iget-object v2, v10, Ll/txl0;->a:Landroid/view/View;

    .line 95
    .line 96
    const/4 v8, 0x1

    .line 97
    move v4, v5

    .line 98
    move v5, v6

    .line 99
    move/from16 v6, p5

    .line 100
    .line 101
    invoke-virtual/range {v1 .. v8}, Ll/mo0;->d(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FFFFZ)V

    .line 102
    .line 103
    .line 104
    move-object v11, v1

    .line 105
    move v6, v5

    .line 106
    move v5, v4

    .line 107
    new-instance v12, Ll/nh4;

    .line 108
    .line 109
    iget v1, v10, Ll/txl0;->k:I

    .line 110
    .line 111
    invoke-direct {v12, v1, v10}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 112
    .line 113
    .line 114
    iput-object v3, v12, Ll/nh4;->h:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 115
    .line 116
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 117
    .line 118
    iput-object v1, v12, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 119
    .line 120
    iget v1, v10, Ll/txl0;->k:I

    .line 121
    .line 122
    invoke-virtual {v12, v1}, Ll/nh4;->a(I)V

    .line 123
    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 126
    .line 127
    filled-new-array {v1}, [Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v12, v1}, Ll/nh4;->b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V

    .line 132
    .line 133
    .line 134
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 135
    .line 136
    if-eq v3, v1, :cond_4

    .line 137
    .line 138
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 139
    .line 140
    if-ne v3, v2, :cond_3

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_3
    sget-wide v8, Ll/vo0;->h:J

    .line 144
    .line 145
    iput-wide v8, v12, Ll/nh4;->d:J

    .line 146
    .line 147
    const-string v7, "up"

    .line 148
    .line 149
    move-object v0, p0

    .line 150
    move/from16 v1, p1

    .line 151
    .line 152
    move/from16 v2, p2

    .line 153
    .line 154
    move/from16 v3, p3

    .line 155
    .line 156
    move/from16 v4, p4

    .line 157
    .line 158
    invoke-virtual/range {v0 .. v9}, Ll/ox2;->p0(FFFFFFLjava/lang/String;J)V

    .line 159
    .line 160
    .line 161
    goto :goto_5

    .line 162
    :cond_4
    :goto_2
    iget v2, v11, Ll/mo0;->c:F

    .line 163
    .line 164
    iget v4, v11, Ll/mo0;->d:F

    .line 165
    .line 166
    sub-float v7, v2, v4

    .line 167
    .line 168
    sub-float/2addr v2, v4

    .line 169
    mul-float/2addr v7, v2

    .line 170
    float-to-double v7, v7

    .line 171
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 172
    .line 173
    .line 174
    move-result-wide v7

    .line 175
    const-wide v13, 0x408f400000000000L    # 1000.0

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    mul-double/2addr v7, v13

    .line 181
    float-to-double v9, v9

    .line 182
    div-double/2addr v7, v9

    .line 183
    sget v2, Ll/vo0;->r:F

    .line 184
    .line 185
    float-to-double v9, v2

    .line 186
    div-double/2addr v7, v9

    .line 187
    double-to-long v7, v7

    .line 188
    sget-wide v9, Ll/vo0;->f:J

    .line 189
    .line 190
    add-long/2addr v9, v7

    .line 191
    iput-wide v9, v12, Ll/nh4;->d:J

    .line 192
    .line 193
    iget-object v2, p0, Ll/ox2;->d:Ll/vr2;

    .line 194
    .line 195
    const/high16 v4, 0x3f800000    # 1.0f

    .line 196
    .line 197
    invoke-virtual {v2, v4}, Ll/vr2;->c(F)Landroid/view/animation/PathInterpolator;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-virtual {v12, v2}, Ll/nh4;->p(Landroid/view/animation/Interpolator;)V

    .line 202
    .line 203
    .line 204
    if-ne v3, v1, :cond_5

    .line 205
    .line 206
    const-string v1, "left"

    .line 207
    .line 208
    :goto_3
    move-object v7, v1

    .line 209
    goto :goto_4

    .line 210
    :cond_5
    const-string v1, "right"

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :goto_4
    iget-wide v8, v12, Ll/nh4;->d:J

    .line 214
    .line 215
    move-object v0, p0

    .line 216
    move/from16 v1, p1

    .line 217
    .line 218
    move/from16 v2, p2

    .line 219
    .line 220
    move/from16 v3, p3

    .line 221
    .line 222
    move/from16 v4, p4

    .line 223
    .line 224
    invoke-virtual/range {v0 .. v9}, Ll/ox2;->p0(FFFFFFLjava/lang/String;J)V

    .line 225
    .line 226
    .line 227
    :goto_5
    const/4 v1, -0x1

    .line 228
    iput v1, v12, Ll/nh4;->e:I

    .line 229
    .line 230
    iput-object v11, v12, Ll/nh4;->f:Ll/mo0;

    .line 231
    .line 232
    iget-object v1, p0, Ll/ox2;->d:Ll/vr2;

    .line 233
    .line 234
    invoke-virtual {v1, v12}, Ll/vr2;->f(Ll/nh4;)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Ll/ox2;->i:Ll/vo0;

    .line 238
    .line 239
    filled-new-array {v12}, [Ll/nh4;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v0, v1}, Ll/vo0;->d([Ll/nh4;)V

    .line 244
    .line 245
    .line 246
    return-void
.end method

.method public final S(FFFFFF)V
    .locals 3

    .line 1
    sub-float v0, p3, p1

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Ll/ox2;->t()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    cmpl-float v0, v0, v1

    .line 12
    .line 13
    if-gtz v0, :cond_1

    .line 14
    .line 15
    sub-float v0, p4, p2

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ox2;->u()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    cmpl-float v0, v0, v1

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->v(Z)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ox2;->W()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string v0, "\u5feb\u901f\u8fd4\u56de"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->c(FFFFFF)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    :goto_0
    sub-float v0, p1, p3

    .line 51
    .line 52
    mul-float/2addr v0, p5

    .line 53
    const/4 v1, 0x0

    .line 54
    cmpg-float v0, v0, v1

    .line 55
    .line 56
    if-gez v0, :cond_2

    .line 57
    .line 58
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->d0(FFFFFF)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v1, "\u5feb\u901f\u6ed1\u52a8: "

    .line 65
    .line 66
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v1, " , "

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v1, ","

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {p0}, Ll/ox2;->F()F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    mul-float/2addr v1, v2

    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->R(FFFFFF)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final T(FFFFFF)V
    .locals 12

    .line 1
    sub-float v1, p2, p4

    .line 2
    .line 3
    neg-float v1, v1

    .line 4
    sub-float v2, p1, p3

    .line 5
    .line 6
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    invoke-virtual {p0}, Ll/ox2;->E()F

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    mul-float/2addr v3, v4

    .line 15
    cmpl-float v3, v1, v3

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-lez v3, :cond_0

    .line 19
    .line 20
    iget-object v3, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->v(Z)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {p0}, Ll/ox2;->C()F

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    cmpg-float v3, v3, v5

    .line 38
    .line 39
    if-gez v3, :cond_0

    .line 40
    .line 41
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    cmpl-float v3, v2, v4

    .line 45
    .line 46
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 47
    .line 48
    :goto_0
    sub-float v3, p3, p1

    .line 49
    .line 50
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {p0}, Ll/ox2;->E()F

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    div-float/2addr v3, v5

    .line 59
    cmpl-float v1, v3, v1

    .line 60
    .line 61
    if-gtz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 64
    .line 65
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 66
    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ox2;->W()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 77
    .line 78
    :goto_1
    move-object v4, v1

    .line 79
    goto :goto_3

    .line 80
    :cond_2
    :goto_2
    cmpl-float v1, v2, v4

    .line 81
    .line 82
    if-lez v1, :cond_3

    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :goto_3
    sget v1, Ll/vo0;->r:F

    .line 91
    .line 92
    div-float v2, p5, v1

    .line 93
    .line 94
    div-float v1, p6, v1

    .line 95
    .line 96
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    invoke-static {v3, v5}, Ljava/lang/Math;->max(FF)F

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    sget v9, Ll/vo0;->x:F

    .line 109
    .line 110
    cmpl-float v5, v3, v9

    .line 111
    .line 112
    if-lez v5, :cond_4

    .line 113
    .line 114
    div-float/2addr v3, v9

    .line 115
    div-float/2addr v2, v3

    .line 116
    div-float/2addr v1, v3

    .line 117
    :cond_4
    move v6, v1

    .line 118
    move v5, v2

    .line 119
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->PRE_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 124
    .line 125
    iput-object v2, v1, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 126
    .line 127
    new-instance v2, Ll/mo0;

    .line 128
    .line 129
    invoke-direct {v2}, Ll/mo0;-><init>()V

    .line 130
    .line 131
    .line 132
    iget-object v3, v1, Ll/txl0;->a:Landroid/view/View;

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Ll/mo0;->e(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iget-object v3, v1, Ll/txl0;->a:Landroid/view/View;

    .line 138
    .line 139
    move/from16 v7, p5

    .line 140
    .line 141
    move/from16 v8, p6

    .line 142
    .line 143
    invoke-virtual/range {v2 .. v8}, Ll/mo0;->c(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FFFF)V

    .line 144
    .line 145
    .line 146
    move-object v10, v2

    .line 147
    new-instance v11, Ll/nh4;

    .line 148
    .line 149
    iget v2, v1, Ll/txl0;->k:I

    .line 150
    .line 151
    invoke-direct {v11, v2, v1}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 152
    .line 153
    .line 154
    iput-object v4, v11, Ll/nh4;->h:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 155
    .line 156
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 157
    .line 158
    iput-object v2, v11, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 159
    .line 160
    iget v1, v1, Ll/txl0;->k:I

    .line 161
    .line 162
    invoke-virtual {v11, v1}, Ll/nh4;->a(I)V

    .line 163
    .line 164
    .line 165
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 166
    .line 167
    filled-new-array {v1}, [Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v11, v1}, Ll/nh4;->b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V

    .line 172
    .line 173
    .line 174
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 175
    .line 176
    if-eq v4, v1, :cond_6

    .line 177
    .line 178
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 179
    .line 180
    if-ne v4, v2, :cond_5

    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_5
    sget-wide v8, Ll/vo0;->h:J

    .line 184
    .line 185
    iput-wide v8, v11, Ll/nh4;->d:J

    .line 186
    .line 187
    const-string v7, "up"

    .line 188
    .line 189
    move-object v0, p0

    .line 190
    move v1, p1

    .line 191
    move v2, p2

    .line 192
    move v3, p3

    .line 193
    move/from16 v4, p4

    .line 194
    .line 195
    invoke-virtual/range {v0 .. v9}, Ll/ox2;->p0(FFFFFFLjava/lang/String;J)V

    .line 196
    .line 197
    .line 198
    goto :goto_7

    .line 199
    :cond_6
    :goto_4
    iget v2, v10, Ll/mo0;->c:F

    .line 200
    .line 201
    iget v3, v10, Ll/mo0;->d:F

    .line 202
    .line 203
    sub-float v7, v2, v3

    .line 204
    .line 205
    sub-float/2addr v2, v3

    .line 206
    mul-float/2addr v7, v2

    .line 207
    float-to-double v2, v7

    .line 208
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 209
    .line 210
    .line 211
    move-result-wide v2

    .line 212
    const-wide v7, 0x408f400000000000L    # 1000.0

    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    mul-double/2addr v2, v7

    .line 218
    float-to-double v7, v9

    .line 219
    div-double/2addr v2, v7

    .line 220
    sget v7, Ll/vo0;->r:F

    .line 221
    .line 222
    float-to-double v7, v7

    .line 223
    div-double/2addr v2, v7

    .line 224
    double-to-long v2, v2

    .line 225
    sget-wide v7, Ll/vo0;->f:J

    .line 226
    .line 227
    add-long/2addr v7, v2

    .line 228
    iput-wide v7, v11, Ll/nh4;->d:J

    .line 229
    .line 230
    iget-object v2, p0, Ll/ox2;->d:Ll/vr2;

    .line 231
    .line 232
    const/high16 v3, 0x3f800000    # 1.0f

    .line 233
    .line 234
    invoke-virtual {v2, v3}, Ll/vr2;->e(F)Landroid/view/animation/PathInterpolator;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-virtual {v11, v2}, Ll/nh4;->p(Landroid/view/animation/Interpolator;)V

    .line 239
    .line 240
    .line 241
    if-ne v4, v1, :cond_7

    .line 242
    .line 243
    const-string v1, "left"

    .line 244
    .line 245
    :goto_5
    move-object v7, v1

    .line 246
    goto :goto_6

    .line 247
    :cond_7
    const-string v1, "right"

    .line 248
    .line 249
    goto :goto_5

    .line 250
    :goto_6
    iget-wide v8, v11, Ll/nh4;->d:J

    .line 251
    .line 252
    move-object v0, p0

    .line 253
    move v1, p1

    .line 254
    move v2, p2

    .line 255
    move v3, p3

    .line 256
    move/from16 v4, p4

    .line 257
    .line 258
    invoke-virtual/range {v0 .. v9}, Ll/ox2;->p0(FFFFFFLjava/lang/String;J)V

    .line 259
    .line 260
    .line 261
    :goto_7
    const/4 v1, -0x1

    .line 262
    iput v1, v11, Ll/nh4;->e:I

    .line 263
    .line 264
    iput-object v10, v11, Ll/nh4;->f:Ll/mo0;

    .line 265
    .line 266
    iget-object v1, p0, Ll/ox2;->d:Ll/vr2;

    .line 267
    .line 268
    invoke-virtual {v1, v11}, Ll/vr2;->f(Ll/nh4;)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Ll/ox2;->i:Ll/vo0;

    .line 272
    .line 273
    filled-new-array {v11}, [Ll/nh4;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-virtual {v0, v1}, Ll/vo0;->d([Ll/nh4;)V

    .line 278
    .line 279
    .line 280
    return-void
.end method

.method public final U(FFFFFF)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ox2;->q:Ll/pn4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, v2, v2, v2, v1}, Ll/pn4;->d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ox2;->q:Ll/pn4;

    .line 12
    .line 13
    invoke-interface {v0, v2, v2, v1}, Ll/pn4;->v0(FFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sget v1, Ll/vo0;->D:F

    .line 21
    .line 22
    cmpl-float v0, v0, v1

    .line 23
    .line 24
    if-gtz v0, :cond_7

    .line 25
    .line 26
    invoke-static {p6}, Ljava/lang/Math;->abs(F)F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    sget v1, Ll/vo0;->D:F

    .line 31
    .line 32
    cmpl-float v0, v0, v1

    .line 33
    .line 34
    if-lez v0, :cond_1

    .line 35
    .line 36
    goto/16 :goto_1

    .line 37
    .line 38
    :cond_1
    sub-float v0, p3, p1

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0}, Ll/ox2;->E()F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    div-float/2addr v1, v2

    .line 49
    sub-float v2, p2, p4

    .line 50
    .line 51
    neg-float v3, v2

    .line 52
    cmpl-float v1, v1, v3

    .line 53
    .line 54
    const-string v4, ","

    .line 55
    .line 56
    if-gtz v1, :cond_5

    .line 57
    .line 58
    iget-object v1, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 59
    .line 60
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 61
    .line 62
    if-nez v1, :cond_2

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    if-eqz v1, :cond_4

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/ox2;->D()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    cmpl-float v0, v3, v0

    .line 72
    .line 73
    if-lez v0, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/ox2;->W()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_3

    .line 80
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v1, "\u6162\u6162\u6ed1\u52a82: "

    .line 84
    .line 85
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    sub-float v1, p1, p3

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->T(FFFFFF)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v1, "\u6162\u6162\u8fd4\u56de2: "

    .line 113
    .line 114
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sub-float v1, p1, p3

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->c(FFFFFF)V

    .line 136
    .line 137
    .line 138
    :cond_4
    return-void

    .line 139
    :cond_5
    :goto_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    invoke-virtual {p0}, Ll/ox2;->C()F

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    cmpl-float v0, v0, v1

    .line 148
    .line 149
    if-lez v0, :cond_6

    .line 150
    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string v1, "\u6162\u6162\u6ed1\u52a81\uff1a"

    .line 154
    .line 155
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    sub-float v1, p1, p3

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->T(FFFFFF)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v1, "\u6162\u6162\u8fd4\u56de1: "

    .line 183
    .line 184
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sub-float v1, p1, p3

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->c(FFFFFF)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_7
    :goto_1
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->S(FFFFFF)V

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method public V()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ox2;->i:Ll/vo0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vo0;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Ll/ox2;->i:Ll/vo0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vo0;->f()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    iget-object p0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/txl0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/txl0;->f()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const/4 v0, 0x0

    .line 46
    :goto_0
    if-eqz v0, :cond_4

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/txl0;->b()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_4
    return v1
.end method

.method public W()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public X(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-lez p1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    :goto_0
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ge p1, v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ":"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ll/txl0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/txl0;->d()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    add-int/lit8 p1, p1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 51
    .line 52
    return-void
.end method

.method public Z(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    instance-of v1, v0, Ll/qn4;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    check-cast v0, Ll/qn4;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/ox2;->f:Ll/udj0;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Ll/udj0;->f(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public a0(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ox2;->i:Ll/vo0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vo0;->b()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ox2;->f:Ll/udj0;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/udj0;->g(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public b0(ZIIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->c:Ll/qn2;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/qn2;->j(ZIIII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(FFFFFF)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nh4;

    .line 6
    .line 7
    iget v2, v0, Ll/txl0;->k:I

    .line 8
    .line 9
    invoke-direct {v1, v2, v0}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 10
    .line 11
    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 13
    .line 14
    iput-object v2, v1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 15
    .line 16
    sget-wide v2, Ll/vo0;->k:J

    .line 17
    .line 18
    const-wide/16 v4, 0x3

    .line 19
    .line 20
    mul-long/2addr v2, v4

    .line 21
    const-wide/16 v4, 0x2

    .line 22
    .line 23
    div-long/2addr v2, v4

    .line 24
    iput-wide v2, v1, Ll/nh4;->d:J

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    iput v2, v1, Ll/nh4;->e:I

    .line 28
    .line 29
    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    .line 30
    .line 31
    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/nh4;->p(Landroid/view/animation/Interpolator;)V

    .line 35
    .line 36
    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 38
    .line 39
    filled-new-array {v2}, [Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Ll/nh4;->b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/mo0;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/mo0;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ll/mo0;->e(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ll/mo0;->b()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ll/nh4;->n(Ll/mo0;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 63
    .line 64
    const-string v9, "back"

    .line 65
    .line 66
    iget-wide v10, v1, Ll/nh4;->d:J

    .line 67
    .line 68
    move-object v2, p0

    .line 69
    move v3, p1

    .line 70
    move v4, p2

    .line 71
    move v5, p3

    .line 72
    move/from16 v6, p4

    .line 73
    .line 74
    move/from16 v7, p5

    .line 75
    .line 76
    move/from16 v8, p6

    .line 77
    .line 78
    invoke-virtual/range {v2 .. v11}, Ll/ox2;->p0(FFFFFFLjava/lang/String;J)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/ox2;->i:Ll/vo0;

    .line 82
    .line 83
    filled-new-array {v1}, [Ll/nh4;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Ll/vo0;->d([Ll/nh4;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public c0(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ox2;->c:Ll/qn2;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/qn2;->k(II)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ox2;->g:Ll/pk4;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/pk4;->d(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/ox2;->A()Ll/qn2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/qn2;->m()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Ll/ox2;->p()Ll/nx2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/nx2;->f()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ox2;->p()Ll/nx2;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ox2;->r()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v3}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const/4 v4, 0x0

    .line 41
    :goto_0
    if-ge v4, v0, :cond_0

    .line 42
    .line 43
    new-instance v5, Ll/txl0;

    .line 44
    .line 45
    invoke-direct {v5}, Ll/txl0;-><init>()V

    .line 46
    .line 47
    .line 48
    iput v4, v5, Ll/txl0;->e:I

    .line 49
    .line 50
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->INIT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 51
    .line 52
    iput-object v6, v5, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 53
    .line 54
    invoke-virtual {v1, v4}, Ll/nx2;->i(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-virtual {v1, v4}, Ll/nx2;->g(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    invoke-virtual {v5, v6, v7}, Ll/txl0;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v4}, Ll/nx2;->h(I)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    iput v6, v5, Ll/txl0;->d:I

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/ox2;->r()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    invoke-virtual {v1, v6, v7, v3}, Ll/nx2;->e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    iput-object v6, v5, Ll/txl0;->a:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {v1, v6, v4}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    add-int/lit8 v4, v4, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_1

    .line 106
    .line 107
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Ll/txl0;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    iget-object v1, v1, Ll/txl0;->a:Landroid/view/View;

    .line 118
    .line 119
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_1
    return-void
.end method

.method public final d0(FFFFFF)V
    .locals 4

    .line 1
    const/high16 v0, 0x42c80000    # 100.0f

    .line 2
    .line 3
    div-float v0, p5, v0

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, 0x40a00000    # 5.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    int-to-float v3, v3

    .line 16
    cmpg-float v1, v1, v3

    .line 17
    .line 18
    if-gez v1, :cond_0

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "\u53cd\u5411\u6162\u6162\u6ed1\u52a8:"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sub-float v1, p1, p3

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, ","

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    sub-float v1, p2, p4

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->T(FFFFFF)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/high16 v3, 0x41400000    # 12.0f

    .line 58
    .line 59
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    int-to-float v3, v3

    .line 64
    cmpg-float v1, v1, v3

    .line 65
    .line 66
    if-gez v1, :cond_1

    .line 67
    .line 68
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    int-to-float v1, v1

    .line 77
    cmpl-float v0, v0, v1

    .line 78
    .line 79
    if-ltz v0, :cond_1

    .line 80
    .line 81
    const-string v0, "\u53cd\u5411\u6162\u6162\u8fd4\u56de"

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->c(FFFFFF)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v1, "\u53cd\u5411\u5feb\u901f\u6ed1\u52a8:"

    .line 93
    .line 94
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v1, " , "

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v1, " | "

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    sub-float v2, p1, p3

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    sub-float v1, p2, p4

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {p0, v0}, Ll/ox2;->m0(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual/range {p0 .. p6}, Ll/ox2;->R(FFFFFF)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public e()Ll/kj2;
    .locals 0

    .line 1
    new-instance p0, Ll/znd;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/znd;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e0(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->f:Ll/udj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/udj0;->h(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public abstract f()Ll/qn2;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public final f0(Ll/nh4;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ll/nh4;->m:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v1, :cond_4

    .line 10
    .line 11
    iget-object v1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_3

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/txl0;

    .line 28
    .line 29
    iget v3, v2, Ll/txl0;->k:I

    .line 30
    .line 31
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    iget v3, v2, Ll/txl0;->k:I

    .line 42
    .line 43
    iget v4, p1, Ll/nh4;->o:I

    .line 44
    .line 45
    if-ne v3, v4, :cond_0

    .line 46
    .line 47
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v4, "realRemoveCard: "

    .line 50
    .line 51
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget v4, p1, Ll/nh4;->o:I

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v4, " , d: "

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget-object v4, p1, Ll/nh4;->p:Ll/txl0;

    .line 65
    .line 66
    if-nez v4, :cond_2

    .line 67
    .line 68
    const-string v4, ""

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    invoke-virtual {v4}, Ll/txl0;->d()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {p0, v3}, Ll/ox2;->X(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v4, v2, Ll/txl0;->a:Landroid/view/View;

    .line 93
    .line 94
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Ll/ox2;->k:Ll/xi80;

    .line 98
    .line 99
    invoke-virtual {v3, v2}, Ll/xi80;->b(Ll/txl0;)V

    .line 100
    .line 101
    .line 102
    iget-object v3, p0, Ll/ox2;->e:Ll/nx2;

    .line 103
    .line 104
    iget-object v2, v2, Ll/txl0;->a:Landroid/view/View;

    .line 105
    .line 106
    const/4 v4, 0x0

    .line 107
    invoke-virtual {v3, v2, v4}, Ll/nx2;->l(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 114
    .line 115
    if-eqz p1, :cond_4

    .line 116
    .line 117
    const-string p1, "anim out finish"

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    return-void
.end method

.method public g()Ll/vr2;
    .locals 0

    .line 1
    new-instance p0, Ll/vr2;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/vr2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public g0(Ll/txl0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ox2;->e:Ll/nx2;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/nx2;->m(Ll/txl0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/ox2;->h:Ll/kj2;

    .line 7
    .line 8
    iget-object p0, p0, Ll/ox2;->e:Ll/nx2;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/nx2;->f()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-interface {p1, p0}, Ll/kj2;->a(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public h()Ll/udj0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/udj0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/udj0;-><init>(Ll/ox2;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final h0(Landroid/view/View;FFFF)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 p5, 0x3fc00000    # 1.5f

    .line 7
    .line 8
    div-float/2addr p0, p5

    .line 9
    const/4 p5, 0x0

    .line 10
    cmpl-float v0, p0, p5

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sub-float/2addr p2, p4

    .line 16
    div-float/2addr p2, p0

    .line 17
    const/high16 p0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/high16 p2, -0x40800000    # -1.0f

    .line 24
    .line 25
    invoke-static {p2, p0}, Ljava/lang/Math;->max(FF)F

    .line 26
    .line 27
    .line 28
    move-result p5

    .line 29
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    div-int/lit8 p0, p0, 0x3

    .line 34
    .line 35
    mul-int/lit8 p0, p0, 0x2

    .line 36
    .line 37
    int-to-float p0, p0

    .line 38
    cmpl-float p0, p3, p0

    .line 39
    .line 40
    if-lez p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    div-int/lit8 p0, p0, 0x3

    .line 47
    .line 48
    mul-int/lit8 p0, p0, 0x2

    .line 49
    .line 50
    int-to-float p0, p0

    .line 51
    sub-float/2addr p0, p3

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    div-int/lit8 p0, p0, 0x3

    .line 58
    .line 59
    mul-int/lit8 p0, p0, 0x2

    .line 60
    .line 61
    int-to-float p0, p0

    .line 62
    sub-float/2addr p0, p3

    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    div-int/lit8 p2, p2, 0x3

    .line 68
    .line 69
    int-to-float p2, p2

    .line 70
    invoke-static {p0, p2}, Ljava/lang/Math;->min(FF)F

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    int-to-float p2, p2

    .line 79
    div-float/2addr p0, p2

    .line 80
    const/high16 p2, 0x41f00000    # 30.0f

    .line 81
    .line 82
    mul-float/2addr p0, p2

    .line 83
    const p2, 0x3fb33333    # 1.4f

    .line 84
    .line 85
    .line 86
    mul-float/2addr p0, p2

    .line 87
    mul-float/2addr p5, p0

    .line 88
    invoke-virtual {p1, p5}, Landroid/view/View;->setRotation(F)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final i(Landroid/view/View;FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p2, v0

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    neg-float v1, p2

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v1, p3

    .line 9
    :goto_0
    const/high16 v2, -0x40800000    # -1.0f

    .line 10
    .line 11
    cmpl-float v3, v1, v2

    .line 12
    .line 13
    if-nez v3, :cond_1

    .line 14
    .line 15
    iget v3, p0, Ll/ox2;->s:F

    .line 16
    .line 17
    cmpl-float v3, v1, v3

    .line 18
    .line 19
    if-nez v3, :cond_8

    .line 20
    .line 21
    :cond_1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 22
    .line 23
    cmpl-float v4, v1, v3

    .line 24
    .line 25
    if-nez v4, :cond_2

    .line 26
    .line 27
    iget v4, p0, Ll/ox2;->s:F

    .line 28
    .line 29
    cmpl-float v4, v1, v4

    .line 30
    .line 31
    if-nez v4, :cond_8

    .line 32
    .line 33
    :cond_2
    cmpl-float v4, v1, v0

    .line 34
    .line 35
    if-nez v4, :cond_3

    .line 36
    .line 37
    iget v4, p0, Ll/ox2;->s:F

    .line 38
    .line 39
    cmpl-float v4, v1, v4

    .line 40
    .line 41
    if-nez v4, :cond_8

    .line 42
    .line 43
    :cond_3
    iget v4, p0, Ll/ox2;->s:F

    .line 44
    .line 45
    sub-float v4, v1, v4

    .line 46
    .line 47
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    const v5, 0x3c23d70a    # 0.01f

    .line 52
    .line 53
    .line 54
    cmpl-float v4, v4, v5

    .line 55
    .line 56
    if-gtz v4, :cond_8

    .line 57
    .line 58
    cmpl-float v2, p4, v2

    .line 59
    .line 60
    if-nez v2, :cond_4

    .line 61
    .line 62
    iget v2, p0, Ll/ox2;->t:F

    .line 63
    .line 64
    cmpl-float v2, p4, v2

    .line 65
    .line 66
    if-nez v2, :cond_8

    .line 67
    .line 68
    :cond_4
    cmpl-float v2, p4, v3

    .line 69
    .line 70
    if-nez v2, :cond_5

    .line 71
    .line 72
    iget v2, p0, Ll/ox2;->t:F

    .line 73
    .line 74
    cmpl-float v2, p4, v2

    .line 75
    .line 76
    if-nez v2, :cond_8

    .line 77
    .line 78
    :cond_5
    cmpl-float v0, p4, v0

    .line 79
    .line 80
    if-nez v0, :cond_6

    .line 81
    .line 82
    iget v0, p0, Ll/ox2;->t:F

    .line 83
    .line 84
    cmpl-float v0, p4, v0

    .line 85
    .line 86
    if-nez v0, :cond_8

    .line 87
    .line 88
    :cond_6
    iget v0, p0, Ll/ox2;->t:F

    .line 89
    .line 90
    sub-float v0, p4, v0

    .line 91
    .line 92
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    cmpl-float v0, v0, v5

    .line 97
    .line 98
    if-gtz v0, :cond_8

    .line 99
    .line 100
    iget-boolean v0, p0, Ll/ox2;->u:Z

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_7
    return-void

    .line 106
    :cond_8
    :goto_1
    iput v1, p0, Ll/ox2;->s:F

    .line 107
    .line 108
    iput p4, p0, Ll/ox2;->t:F

    .line 109
    .line 110
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 111
    .line 112
    if-eq p5, v0, :cond_a

    .line 113
    .line 114
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 115
    .line 116
    if-eq p5, v0, :cond_a

    .line 117
    .line 118
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 119
    .line 120
    if-ne p5, v0, :cond_9

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_9
    const/4 v0, 0x0

    .line 124
    goto :goto_3

    .line 125
    :cond_a
    :goto_2
    const/4 v0, 0x1

    .line 126
    :goto_3
    iput-boolean v0, p0, Ll/ox2;->u:Z

    .line 127
    .line 128
    instance-of v0, p1, Ll/pn4;

    .line 129
    .line 130
    if-eqz v0, :cond_b

    .line 131
    .line 132
    check-cast p1, Ll/pn4;

    .line 133
    .line 134
    invoke-interface {p1, p2, p3, p4, p5}, Ll/pn4;->d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 135
    .line 136
    .line 137
    :cond_b
    iget-object p0, p0, Ll/ox2;->q:Ll/pn4;

    .line 138
    .line 139
    if-eqz p0, :cond_c

    .line 140
    .line 141
    invoke-interface {p0, p2, p3, p4, p5}, Ll/pn4;->d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 142
    .line 143
    .line 144
    :cond_c
    return-void
.end method

.method public i0(Ll/nx2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ox2;->e:Ll/nx2;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/nx2;->c(Ll/im4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V
    .locals 6

    .line 1
    sub-float/2addr p1, p3

    .line 2
    mul-float p3, p1, p1

    .line 3
    .line 4
    sub-float/2addr p2, p4

    .line 5
    mul-float p4, p2, p2

    .line 6
    .line 7
    add-float/2addr p3, p4

    .line 8
    float-to-double p3, p3

    .line 9
    invoke-static {p3, p4}, Ljava/lang/Math;->sqrt(D)D

    .line 10
    .line 11
    .line 12
    move-result-wide p3

    .line 13
    double-to-float v3, p3

    .line 14
    iget p3, p0, Ll/ox2;->n:F

    .line 15
    .line 16
    div-float p3, v3, p3

    .line 17
    .line 18
    const/high16 p4, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-static {p4, p3}, Ljava/lang/Math;->min(FF)F

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    const/4 v0, 0x0

    .line 25
    cmpl-float v1, p3, v0

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    iget v1, p0, Ll/ox2;->v:F

    .line 30
    .line 31
    cmpl-float v0, v1, v0

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    :cond_0
    cmpl-float v0, p3, p4

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iget v0, p0, Ll/ox2;->v:F

    .line 40
    .line 41
    cmpl-float p4, v0, p4

    .line 42
    .line 43
    if-nez p4, :cond_2

    .line 44
    .line 45
    :cond_1
    iget p4, p0, Ll/ox2;->v:F

    .line 46
    .line 47
    sub-float p4, p3, p4

    .line 48
    .line 49
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    const v0, 0x3c23d70a    # 0.01f

    .line 54
    .line 55
    .line 56
    cmpl-float p4, p4, v0

    .line 57
    .line 58
    if-ltz p4, :cond_4

    .line 59
    .line 60
    :cond_2
    iput p3, p0, Ll/ox2;->v:F

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ox2;->q()Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    if-nez p3, :cond_4

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/ox2;->q()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    :cond_3
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result p4

    .line 84
    if-eqz p4, :cond_4

    .line 85
    .line 86
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p4

    .line 90
    check-cast p4, Ll/txl0;

    .line 91
    .line 92
    iget-object v0, p4, Ll/txl0;->a:Landroid/view/View;

    .line 93
    .line 94
    instance-of v1, v0, Ll/pn4;

    .line 95
    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    check-cast v0, Ll/pn4;

    .line 99
    .line 100
    iget v1, p4, Ll/txl0;->e:I

    .line 101
    .line 102
    iget v2, p0, Ll/ox2;->v:F

    .line 103
    .line 104
    iget-object p4, p0, Ll/ox2;->d:Ll/vr2;

    .line 105
    .line 106
    invoke-virtual {p4}, Ll/vr2;->h()Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    new-instance p4, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v5, " reason: "

    .line 123
    .line 124
    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p4, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-interface/range {v0 .. v5}, Ll/pn4;->f0(IFFZLjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_4
    invoke-virtual {p0}, Ll/ox2;->q()Ljava/util/List;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    if-nez p3, :cond_6

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/ox2;->q()Ljava/util/List;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 153
    .line 154
    .line 155
    move-result-object p7

    .line 156
    :goto_1
    invoke-interface {p7}, Ljava/util/Iterator;->hasNext()Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    if-eqz p0, :cond_6

    .line 161
    .line 162
    invoke-interface {p7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    check-cast p0, Ll/txl0;

    .line 167
    .line 168
    iget-object p3, p0, Ll/txl0;->a:Landroid/view/View;

    .line 169
    .line 170
    instance-of p4, p3, Ll/pn4;

    .line 171
    .line 172
    if-eqz p4, :cond_5

    .line 173
    .line 174
    check-cast p3, Ll/pn4;

    .line 175
    .line 176
    iget p0, p0, Ll/txl0;->e:I

    .line 177
    .line 178
    move-object p4, p5

    .line 179
    move p5, p2

    .line 180
    move-object p2, p4

    .line 181
    move p4, p1

    .line 182
    move p1, p0

    .line 183
    move-object p0, p3

    .line 184
    move p3, p6

    .line 185
    invoke-interface/range {p0 .. p5}, Ll/pn4;->l0(ILcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZFF)V

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_5
    move-object p3, p5

    .line 190
    move p5, p2

    .line 191
    move-object p2, p3

    .line 192
    move p4, p1

    .line 193
    move p3, p6

    .line 194
    :goto_2
    move p1, p5

    .line 195
    move-object p5, p2

    .line 196
    move p2, p1

    .line 197
    move p6, p3

    .line 198
    move p1, p4

    .line 199
    goto :goto_1

    .line 200
    :cond_6
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 2
    .line 3
    return-void
.end method

.method public k(FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZILjava/lang/String;)V
    .locals 6

    .line 1
    sub-float/2addr p1, p3

    .line 2
    mul-float/2addr p1, p1

    .line 3
    sub-float/2addr p2, p4

    .line 4
    mul-float/2addr p2, p2

    .line 5
    add-float/2addr p1, p2

    .line 6
    float-to-double p1, p1

    .line 7
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    double-to-float v3, p1

    .line 12
    iget p1, p0, Ll/ox2;->n:F

    .line 13
    .line 14
    div-float p1, v3, p1

    .line 15
    .line 16
    const/high16 p2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 p3, 0x0

    .line 23
    cmpl-float p4, p1, p3

    .line 24
    .line 25
    if-nez p4, :cond_0

    .line 26
    .line 27
    iget p4, p0, Ll/ox2;->w:F

    .line 28
    .line 29
    cmpl-float p3, p4, p3

    .line 30
    .line 31
    if-nez p3, :cond_2

    .line 32
    .line 33
    :cond_0
    cmpl-float p3, p1, p2

    .line 34
    .line 35
    if-nez p3, :cond_1

    .line 36
    .line 37
    iget p3, p0, Ll/ox2;->w:F

    .line 38
    .line 39
    cmpl-float p2, p3, p2

    .line 40
    .line 41
    if-nez p2, :cond_2

    .line 42
    .line 43
    :cond_1
    iget p2, p0, Ll/ox2;->w:F

    .line 44
    .line 45
    sub-float p2, p1, p2

    .line 46
    .line 47
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    const p3, 0x3c23d70a    # 0.01f

    .line 52
    .line 53
    .line 54
    cmpl-float p2, p2, p3

    .line 55
    .line 56
    if-ltz p2, :cond_4

    .line 57
    .line 58
    :cond_2
    iget p2, p0, Ll/ox2;->w:F

    .line 59
    .line 60
    iput p1, p0, Ll/ox2;->w:F

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ox2;->q()Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    if-nez p3, :cond_4

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/ox2;->q()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    :cond_3
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result p4

    .line 84
    if-eqz p4, :cond_4

    .line 85
    .line 86
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p4

    .line 90
    check-cast p4, Ll/txl0;

    .line 91
    .line 92
    iget-object p5, p4, Ll/txl0;->a:Landroid/view/View;

    .line 93
    .line 94
    instance-of p6, p5, Ll/pn4;

    .line 95
    .line 96
    if-eqz p6, :cond_3

    .line 97
    .line 98
    move-object v0, p5

    .line 99
    check-cast v0, Ll/pn4;

    .line 100
    .line 101
    iget p4, p4, Ll/txl0;->e:I

    .line 102
    .line 103
    sub-int v1, p4, p7

    .line 104
    .line 105
    iget v2, p0, Ll/ox2;->w:F

    .line 106
    .line 107
    iget-object p4, p0, Ll/ox2;->d:Ll/vr2;

    .line 108
    .line 109
    invoke-virtual {p4}, Ll/vr2;->h()Z

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    new-instance p4, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string p5, "after anim done reason: "

    .line 116
    .line 117
    invoke-direct {p4, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p4, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string p5, " detail: "

    .line 124
    .line 125
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p5, ", "

    .line 132
    .line 133
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-interface/range {v0 .. v5}, Ll/pn4;->f0(IFFZLjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_4
    return-void
.end method

.method public k0(Ll/dn4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ox2;->l:Ll/dn4;

    .line 2
    .line 3
    return-void
.end method

.method public l(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;Z)V
    .locals 0

    .line 1
    sub-float p4, p2, p4

    .line 2
    .line 3
    sub-float p5, p3, p5

    .line 4
    .line 5
    instance-of p0, p1, Ll/pn4;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    move-object p0, p1

    .line 10
    check-cast p0, Ll/pn4;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    move-object p2, p6

    .line 14
    move p3, p7

    .line 15
    invoke-interface/range {p0 .. p5}, Ll/pn4;->l0(ILcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZFF)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public l0(Ll/pn4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ox2;->q:Ll/pn4;

    .line 2
    .line 3
    return-void
.end method

.method public final m()Landroid/util/DisplayMetrics;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ox2;->r()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final m0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(F)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ox2;->m()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 6
    .line 7
    mul-float/2addr p0, p1

    .line 8
    float-to-int p0, p0

    .line 9
    return p0
.end method

.method public n0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/pn4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/pn4;

    .line 7
    .line 8
    invoke-interface {v0, p1, p2, p3}, Ll/pn4;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/ox2;->q:Ll/pn4;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0, p1, p2, p3}, Ll/pn4;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public o(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/txl0;

    .line 18
    .line 19
    iget v2, v1, Ll/txl0;->e:I

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    iget-object v0, v1, Ll/txl0;->a:Landroid/view/View;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    :goto_0
    invoke-virtual {p0, v0, p1, p2}, Ll/ox2;->n0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public p()Ll/nx2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->e:Ll/nx2;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p0(FFFFFFLjava/lang/String;J)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Ll/ox2;->r:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iget-wide v3, v0, Ll/ox2;->r:J

    .line 16
    .line 17
    sub-long/2addr v1, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-wide/16 v1, -0x1

    .line 20
    .line 21
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    iput-wide v3, v0, Ll/ox2;->r:J

    .line 26
    .line 27
    const-string v3, "touch_down_x"

    .line 28
    .line 29
    move/from16 v4, p3

    .line 30
    .line 31
    float-to-int v4, v4

    .line 32
    invoke-static {v3, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const-string v3, "touch_down_y"

    .line 37
    .line 38
    move/from16 v4, p4

    .line 39
    .line 40
    float-to-int v4, v4

    .line 41
    invoke-static {v3, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string v3, "touch_up_x"

    .line 46
    .line 47
    move/from16 v4, p1

    .line 48
    .line 49
    float-to-int v4, v4

    .line 50
    invoke-static {v3, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    const-string v3, "touch_up_y"

    .line 55
    .line 56
    move/from16 v4, p2

    .line 57
    .line 58
    float-to-int v4, v4

    .line 59
    invoke-static {v3, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    iget-object v3, v0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 64
    .line 65
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    const-string v4, "scope_x"

    .line 70
    .line 71
    invoke-static {v4, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    iget-object v0, v0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const-string v3, "scope_y"

    .line 82
    .line 83
    invoke-static {v3, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 84
    .line 85
    .line 86
    move-result-object v10

    .line 87
    move/from16 v0, p5

    .line 88
    .line 89
    float-to-int v0, v0

    .line 90
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    const-string v3, "touch_speed_x"

    .line 95
    .line 96
    invoke-static {v3, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 97
    .line 98
    .line 99
    move-result-object v11

    .line 100
    move/from16 v0, p6

    .line 101
    .line 102
    float-to-int v0, v0

    .line 103
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    const-string v3, "touch_speed_y"

    .line 108
    .line 109
    invoke-static {v3, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 110
    .line 111
    .line 112
    move-result-object v12

    .line 113
    const-string v0, "current_operation"

    .line 114
    .line 115
    move-object/from16 v3, p7

    .line 116
    .line 117
    invoke-static {v0, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 118
    .line 119
    .line 120
    move-result-object v13

    .line 121
    const-string v0, "operation_interval"

    .line 122
    .line 123
    invoke-static {v0, v1, v2}, Ll/sfj0$a;->g(Ljava/lang/String;J)Ll/sfj0$a;

    .line 124
    .line 125
    .line 126
    move-result-object v14

    .line 127
    const-string v0, "swipe_action_during"

    .line 128
    .line 129
    move-wide/from16 v1, p8

    .line 130
    .line 131
    invoke-static {v0, v1, v2}, Ll/sfj0$a;->g(Ljava/lang/String;J)Ll/sfj0$a;

    .line 132
    .line 133
    .line 134
    move-result-object v15

    .line 135
    filled-new-array/range {v5 .. v15}, [Ll/sfj0$a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const-string v1, "e_swipe_touch_info"

    .line 140
    .line 141
    const-string v2, "p_suggest_users_home_view"

    .line 142
    .line 143
    invoke-static {v1, v2, v0}, Ll/sfj0;->g(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public q()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/txl0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public q0(F)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ox2;->a:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v1, :cond_a

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_a

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    cmpg-float v2, p1, v1

    .line 15
    .line 16
    if-gez v2, :cond_0

    .line 17
    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    invoke-static/range {p1 .. p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_a

    .line 25
    .line 26
    invoke-static/range {p1 .. p1}, Ljava/lang/Float;->isInfinite(F)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :cond_1
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ll/qn2;->d()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3}, Ll/qn2;->e()F

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4}, Ll/qn2;->i()Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    iget-object v5, v0, Ll/ox2;->a:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    if-eqz v6, :cond_a

    .line 69
    .line 70
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    check-cast v6, Ll/txl0;

    .line 75
    .line 76
    iget v7, v6, Ll/txl0;->e:I

    .line 77
    .line 78
    if-nez v7, :cond_2

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    if-gez v7, :cond_3

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    iget v8, v0, Ll/ox2;->m:F

    .line 85
    .line 86
    div-float v8, p1, v8

    .line 87
    .line 88
    const/high16 v9, 0x3f800000    # 1.0f

    .line 89
    .line 90
    invoke-static {v9, v8}, Ljava/lang/Math;->min(FF)F

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    int-to-float v10, v7

    .line 95
    sub-float/2addr v10, v8

    .line 96
    const/high16 v11, 0x40000000    # 2.0f

    .line 97
    .line 98
    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    .line 99
    .line 100
    .line 101
    move-result v10

    .line 102
    mul-float v12, v10, v3

    .line 103
    .line 104
    sub-float v12, v9, v12

    .line 105
    .line 106
    mul-float v13, v12, v12

    .line 107
    .line 108
    mul-float/2addr v13, v12

    .line 109
    invoke-static {v13}, Ljava/lang/Float;->isNaN(F)Z

    .line 110
    .line 111
    .line 112
    move-result v12

    .line 113
    if-eqz v12, :cond_4

    .line 114
    .line 115
    goto/16 :goto_3

    .line 116
    .line 117
    :cond_4
    iget-object v12, v0, Ll/ox2;->d:Ll/vr2;

    .line 118
    .line 119
    invoke-virtual {v12}, Ll/vr2;->h()Z

    .line 120
    .line 121
    .line 122
    move-result v12

    .line 123
    if-eqz v12, :cond_7

    .line 124
    .line 125
    iget-object v12, v0, Ll/ox2;->d:Ll/vr2;

    .line 126
    .line 127
    invoke-virtual {v12}, Ll/vr2;->a()F

    .line 128
    .line 129
    .line 130
    move-result v12

    .line 131
    cmpg-float v12, v12, v9

    .line 132
    .line 133
    if-gez v12, :cond_7

    .line 134
    .line 135
    const/4 v12, 0x1

    .line 136
    if-ne v7, v12, :cond_5

    .line 137
    .line 138
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 139
    .line 140
    invoke-virtual {v7}, Ll/vr2;->b()F

    .line 141
    .line 142
    .line 143
    move-result v7

    .line 144
    mul-float/2addr v8, v7

    .line 145
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 146
    .line 147
    invoke-virtual {v7}, Ll/vr2;->a()F

    .line 148
    .line 149
    .line 150
    move-result v7

    .line 151
    add-float/2addr v8, v7

    .line 152
    invoke-static {v1, v8}, Ljava/lang/Math;->max(FF)F

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    invoke-static {v9, v7}, Ljava/lang/Math;->min(FF)F

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    iget-object v8, v6, Ll/txl0;->a:Landroid/view/View;

    .line 161
    .line 162
    invoke-virtual {v8, v7}, Landroid/view/View;->setAlpha(F)V

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_5
    const/4 v12, 0x2

    .line 167
    if-ne v7, v12, :cond_6

    .line 168
    .line 169
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 170
    .line 171
    invoke-virtual {v7}, Ll/vr2;->a()F

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    mul-float/2addr v8, v7

    .line 176
    invoke-static {v1, v8}, Ljava/lang/Math;->max(FF)F

    .line 177
    .line 178
    .line 179
    move-result v7

    .line 180
    invoke-static {v9, v7}, Ljava/lang/Math;->min(FF)F

    .line 181
    .line 182
    .line 183
    move-result v7

    .line 184
    iget-object v8, v6, Ll/txl0;->a:Landroid/view/View;

    .line 185
    .line 186
    invoke-virtual {v8, v7}, Landroid/view/View;->setAlpha(F)V

    .line 187
    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_6
    iget-object v7, v6, Ll/txl0;->a:Landroid/view/View;

    .line 191
    .line 192
    invoke-virtual {v7, v1}, Landroid/view/View;->setAlpha(F)V

    .line 193
    .line 194
    .line 195
    :cond_7
    :goto_1
    float-to-double v7, v10

    .line 196
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 197
    .line 198
    .line 199
    move-result-wide v7

    .line 200
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 201
    .line 202
    .line 203
    move-result-wide v7

    .line 204
    double-to-float v7, v7

    .line 205
    mul-float v8, v7, v7

    .line 206
    .line 207
    mul-float/2addr v8, v7

    .line 208
    float-to-double v14, v8

    .line 209
    float-to-double v7, v7

    .line 210
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 211
    .line 212
    .line 213
    move-result-wide v7

    .line 214
    mul-double/2addr v14, v7

    .line 215
    double-to-float v7, v14

    .line 216
    int-to-float v8, v2

    .line 217
    mul-float/2addr v7, v8

    .line 218
    if-eqz v4, :cond_8

    .line 219
    .line 220
    iget-object v8, v6, Ll/txl0;->a:Landroid/view/View;

    .line 221
    .line 222
    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    .line 223
    .line 224
    .line 225
    move-result v8

    .line 226
    int-to-float v8, v8

    .line 227
    sub-float v10, v9, v13

    .line 228
    .line 229
    mul-float/2addr v8, v10

    .line 230
    div-float/2addr v8, v11

    .line 231
    goto :goto_2

    .line 232
    :cond_8
    move v8, v1

    .line 233
    :goto_2
    add-float/2addr v7, v8

    .line 234
    iget-object v8, v6, Ll/txl0;->a:Landroid/view/View;

    .line 235
    .line 236
    invoke-virtual {v8, v13}, Landroid/view/View;->setScaleY(F)V

    .line 237
    .line 238
    .line 239
    iget-object v8, v6, Ll/txl0;->a:Landroid/view/View;

    .line 240
    .line 241
    invoke-virtual {v8, v13}, Landroid/view/View;->setScaleX(F)V

    .line 242
    .line 243
    .line 244
    iget-object v8, v6, Ll/txl0;->a:Landroid/view/View;

    .line 245
    .line 246
    invoke-virtual {v8, v1}, Landroid/view/View;->setRotation(F)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 250
    .line 251
    .line 252
    move-result-object v8

    .line 253
    invoke-virtual {v8}, Ll/qn2;->q()Z

    .line 254
    .line 255
    .line 256
    move-result v8

    .line 257
    if-eqz v8, :cond_9

    .line 258
    .line 259
    const/high16 v9, -0x40800000    # -1.0f

    .line 260
    .line 261
    :cond_9
    iget-object v8, v6, Ll/txl0;->a:Landroid/view/View;

    .line 262
    .line 263
    mul-float/2addr v9, v7

    .line 264
    invoke-virtual {v8, v9}, Landroid/view/View;->setTranslationY(F)V

    .line 265
    .line 266
    .line 267
    iget-object v6, v6, Ll/txl0;->a:Landroid/view/View;

    .line 268
    .line 269
    invoke-virtual {v6, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 270
    .line 271
    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :cond_a
    :goto_3
    return-void
.end method

.method public r()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->j:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Ll/kj2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->h:Ll/kj2;

    .line 2
    .line 3
    return-object p0
.end method

.method public final t()F
    .locals 0

    .line 1
    iget p0, p0, Ll/ox2;->p:F

    .line 2
    .line 3
    return p0
.end method

.method public u()F
    .locals 0

    .line 1
    const/high16 p0, 0x427c0000    # 63.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    return p0
.end method

.method public v()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public w()Ll/txl0;
    .locals 3

    .line 1
    iget-object p0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/txl0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/txl0;->b()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-lt v0, v2, :cond_1

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public x()Ll/xi80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox2;->k:Ll/xi80;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ox2;->u()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 6
    .line 7
    div-float/2addr p0, v0

    .line 8
    return p0
.end method

.method public z(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "from: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, "=> \u6e32\u67d3\u8be6\u60c5:"

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-lez p1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    :goto_0
    iget-object v1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-ge p1, v1, :cond_0

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ":"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ll/txl0;

    .line 62
    .line 63
    invoke-virtual {v1}, Ll/txl0;->d()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v1, " | "

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    add-int/lit8 p1, p1, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method
