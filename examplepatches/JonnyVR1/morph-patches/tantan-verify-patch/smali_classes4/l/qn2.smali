.class public abstract Ll/qn2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ox2;

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/qn2;->b:I

    .line 6
    .line 7
    iput v0, p0, Ll/qn2;->c:I

    .line 8
    .line 9
    return-void
.end method

.method public static n(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/txl0;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/txl0;

    .line 19
    .line 20
    iget-object v1, v0, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 23
    .line 24
    if-ne v1, v2, :cond_1

    .line 25
    .line 26
    iget v1, v0, Ll/txl0;->e:I

    .line 27
    .line 28
    if-lez v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/qn2;->o(Ll/txl0;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    :goto_1
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final c()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ox2;->q()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_3

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_3

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/txl0;

    .line 30
    .line 31
    iget-object v2, v1, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 32
    .line 33
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->INIT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 34
    .line 35
    if-ne v2, v3, :cond_0

    .line 36
    .line 37
    sget-boolean v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 44
    .line 45
    .line 46
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 47
    .line 48
    iput-object v2, v1, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ll/qn2;->o(Ll/txl0;)V

    .line 51
    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    iput v2, v1, Ll/txl0;->f:I

    .line 55
    .line 56
    iget-object v2, v1, Ll/txl0;->i:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 57
    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    div-int/lit8 v3, v3, 0x2

    .line 67
    .line 68
    int-to-float v3, v3

    .line 69
    invoke-virtual {v2, v3}, Landroid/view/View;->setPivotX(F)V

    .line 70
    .line 71
    .line 72
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    div-int/lit8 v3, v3, 0x2

    .line 79
    .line 80
    int-to-float v3, v3

    .line 81
    invoke-virtual {v2, v3}, Landroid/view/View;->setPivotY(F)V

    .line 82
    .line 83
    .line 84
    sget-object v2, Ll/qn2$a;->a:[I

    .line 85
    .line 86
    iget-object v3, v1, Ll/txl0;->i:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    aget v2, v2, v3

    .line 93
    .line 94
    const/4 v3, 0x1

    .line 95
    if-eq v2, v3, :cond_2

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 99
    .line 100
    iget-object v3, p0, Ll/qn2;->a:Ll/ox2;

    .line 101
    .line 102
    invoke-virtual {v3}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    int-to-float v3, v3

    .line 111
    const/high16 v4, -0x40800000    # -1.0f

    .line 112
    .line 113
    mul-float/2addr v3, v4

    .line 114
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 115
    .line 116
    .line 117
    :goto_1
    const/4 v2, 0x0

    .line 118
    iput-object v2, v1, Ll/txl0;->i:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    return-void
.end method

.method public d()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    const/high16 v0, 0x40c00000    # 6.0f

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ox2;->n(F)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()F
    .locals 0

    .line 1
    const p0, 0x3c7df3b6    # 0.0155f

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public f()V
    .locals 3

    .line 1
    iget v0, p0, Ll/qn2;->b:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget v2, p0, Ll/qn2;->c:I

    .line 7
    .line 8
    if-eq v2, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0, v2}, Ll/qn2;->k(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public abstract g(IILandroid/view/View;ILl/txl0;)V
.end method

.method public h(Landroid/view/View;ILl/txl0;)V
    .locals 7

    .line 1
    iget v0, p0, Ll/qn2;->c:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/qn2;->b:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    iget v2, p0, Ll/qn2;->b:I

    .line 13
    .line 14
    iget v3, p0, Ll/qn2;->c:I

    .line 15
    .line 16
    move-object v1, p0

    .line 17
    move-object v4, p1

    .line 18
    move v5, p2

    .line 19
    move-object v6, p3

    .line 20
    invoke-virtual/range {v1 .. v6}, Ll/qn2;->g(IILandroid/view/View;ILl/txl0;)V

    .line 21
    .line 22
    .line 23
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public j(ZIIII)V
    .locals 10

    .line 1
    iget-object v1, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    invoke-virtual {v1}, Ll/ox2;->q()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v9

    .line 11
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    move-object v8, v1

    .line 22
    check-cast v8, Ll/txl0;

    .line 23
    .line 24
    iget-object v1, v8, Ll/txl0;->a:Landroid/view/View;

    .line 25
    .line 26
    iget v2, v8, Ll/txl0;->e:I

    .line 27
    .line 28
    move-object v0, p0

    .line 29
    move v7, p1

    .line 30
    move v3, p2

    .line 31
    move v4, p3

    .line 32
    move v5, p4

    .line 33
    move v6, p5

    .line 34
    invoke-virtual/range {v0 .. v8}, Ll/qn2;->l(Landroid/view/View;IIIIIZLl/txl0;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public k(II)V
    .locals 9

    .line 1
    iput p2, p0, Ll/qn2;->c:I

    .line 2
    .line 3
    iput p1, p0, Ll/qn2;->b:I

    .line 4
    .line 5
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/qn2;->a:Ll/ox2;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ox2;->q()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    move-object v8, v2

    .line 39
    check-cast v8, Ll/txl0;

    .line 40
    .line 41
    iget-object v6, v8, Ll/txl0;->a:Landroid/view/View;

    .line 42
    .line 43
    const/4 v7, 0x0

    .line 44
    move-object v3, p0

    .line 45
    move v4, p1

    .line 46
    move v5, p2

    .line 47
    invoke-virtual/range {v3 .. v8}, Ll/qn2;->g(IILandroid/view/View;ILl/txl0;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move-object v3, p0

    .line 52
    invoke-virtual {v3}, Ll/qn2;->c()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v0}, Ll/qn2;->a(Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 59
    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public abstract l(Landroid/view/View;IIIIIZLl/txl0;)V
.end method

.method public abstract m()I
.end method

.method public o(Ll/txl0;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/qn2;->e()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/qn2;->a:Ll/ox2;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/ox2;->A()Ll/qn2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/qn2;->d()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, Ll/qn2;->a:Ll/ox2;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/ox2;->A()Ll/qn2;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/qn2;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p1, Ll/txl0;->a:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const/4 v5, 0x2

    .line 38
    div-int/2addr v4, v5

    .line 39
    int-to-float v4, v4

    .line 40
    invoke-virtual {v3, v4}, Landroid/view/View;->setPivotX(F)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p1, Ll/txl0;->a:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    div-int/2addr v4, v5

    .line 50
    int-to-float v4, v4

    .line 51
    invoke-virtual {v3, v4}, Landroid/view/View;->setPivotY(F)V

    .line 52
    .line 53
    .line 54
    iget v3, p1, Ll/txl0;->e:I

    .line 55
    .line 56
    iget v4, p1, Ll/txl0;->f:I

    .line 57
    .line 58
    add-int/2addr v3, v4

    .line 59
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    int-to-float v3, v3

    .line 64
    mul-float/2addr v0, v3

    .line 65
    const/high16 v4, 0x3f800000    # 1.0f

    .line 66
    .line 67
    sub-float v0, v4, v0

    .line 68
    .line 69
    mul-float v5, v0, v0

    .line 70
    .line 71
    mul-float/2addr v5, v0

    .line 72
    float-to-double v6, v3

    .line 73
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    .line 74
    .line 75
    .line 76
    move-result-wide v6

    .line 77
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    .line 78
    .line 79
    .line 80
    move-result-wide v6

    .line 81
    double-to-float v0, v6

    .line 82
    mul-float v3, v0, v0

    .line 83
    .line 84
    mul-float/2addr v3, v0

    .line 85
    float-to-double v6, v3

    .line 86
    float-to-double v8, v0

    .line 87
    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    .line 88
    .line 89
    .line 90
    move-result-wide v8

    .line 91
    mul-double/2addr v6, v8

    .line 92
    double-to-float v0, v6

    .line 93
    int-to-float v1, v1

    .line 94
    mul-float/2addr v0, v1

    .line 95
    if-eqz v2, :cond_0

    .line 96
    .line 97
    iget-object v1, p1, Ll/txl0;->a:Landroid/view/View;

    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    int-to-float v1, v1

    .line 104
    sub-float v2, v4, v5

    .line 105
    .line 106
    mul-float/2addr v1, v2

    .line 107
    const/high16 v2, 0x40000000    # 2.0f

    .line 108
    .line 109
    div-float/2addr v1, v2

    .line 110
    add-float/2addr v0, v1

    .line 111
    :cond_0
    iget-object v1, p1, Ll/txl0;->a:Landroid/view/View;

    .line 112
    .line 113
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleY(F)V

    .line 114
    .line 115
    .line 116
    iget-object v1, p1, Ll/txl0;->a:Landroid/view/View;

    .line 117
    .line 118
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleX(F)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/qn2;->q()Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_1

    .line 126
    .line 127
    const/high16 v4, -0x40800000    # -1.0f

    .line 128
    .line 129
    :cond_1
    iget-object p0, p1, Ll/txl0;->a:Landroid/view/View;

    .line 130
    .line 131
    mul-float/2addr v4, v0

    .line 132
    invoke-virtual {p0, v4}, Landroid/view/View;->setTranslationY(F)V

    .line 133
    .line 134
    .line 135
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 136
    .line 137
    return-void
.end method

.method public p(Ll/ox2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
