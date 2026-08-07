.class public Ll/kg20;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kg20$a;
    }
.end annotation


# instance fields
.field public d:Ll/kg20$a;

.field public e:Z

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Ll/kg20$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/kg20;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/kg20;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/kg20;->g:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/kg20;->d:Ll/kg20$a;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/k$e;->A(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public B(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 1

    .line 1
    iget-boolean p2, p0, Ll/kg20;->e:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 6
    .line 7
    instance-of v0, p2, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;->l:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 22
    .line 23
    check-cast p1, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;

    .line 24
    .line 25
    iget-object p2, p0, Ll/kg20;->d:Ll/kg20$a;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;->l:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-boolean p0, p0, Ll/kg20;->f:Z

    .line 30
    .line 31
    invoke-interface {p2, p1, p0}, Ll/kg20$a;->b(Lcom/p1/mobile/putong/data/User;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p1, p0, Ll/kg20;->d:Ll/kg20$a;

    .line 36
    .line 37
    iget-boolean p0, p0, Ll/kg20;->f:Z

    .line 38
    .line 39
    invoke-interface {p1, p0}, Ll/kg20$a;->c(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public C(IF)F
    .locals 1

    .line 1
    int-to-float p0, p1

    .line 2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->B9()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    div-float/2addr p0, p1

    .line 15
    const/4 p1, 0x0

    .line 16
    cmpl-float v0, p0, p1

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return p1

    .line 21
    :cond_0
    div-float/2addr p2, p0

    .line 22
    const/high16 p0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/high16 p1, -0x40800000    # -1.0f

    .line 29
    .line 30
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/kg20;->e:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/kg20;->f:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/kg20;->g:Z

    .line 7
    .line 8
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/k$e;->c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 6
    .line 7
    instance-of p1, p1, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    instance-of p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/16 p0, 0xf

    .line 16
    .line 17
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public l(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x4f000000

    .line 2
    .line 3
    return p0
.end method

.method public m(Landroidx/recyclerview/widget/RecyclerView$e0;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3e800000    # 0.25f

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p6, v0, :cond_9

    .line 3
    .line 4
    iget-object v1, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 5
    .line 6
    instance-of v1, v1, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;

    .line 7
    .line 8
    if-eqz v1, :cond_9

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v1, v1

    .line 15
    invoke-virtual {p0, p3}, Ll/kg20;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    mul-float/2addr v1, v2

    .line 20
    iget-object v2, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/high16 v3, 0x40000000    # 2.0f

    .line 27
    .line 28
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    mul-float/2addr v4, v3

    .line 33
    invoke-virtual {p0, v2, v4}, Ll/kg20;->C(IF)F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/4 v3, 0x0

    .line 38
    cmpl-float v4, p4, v3

    .line 39
    .line 40
    if-lez v4, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    neg-float v2, v2

    .line 44
    :goto_0
    const/4 v4, 0x0

    .line 45
    if-eqz p7, :cond_3

    .line 46
    .line 47
    cmpl-float v5, v2, v3

    .line 48
    .line 49
    if-lez v5, :cond_1

    .line 50
    .line 51
    iput-boolean v0, p0, Ll/kg20;->f:Z

    .line 52
    .line 53
    iput-boolean v4, p0, Ll/kg20;->g:Z

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    cmpg-float v5, v2, v3

    .line 57
    .line 58
    if-gez v5, :cond_2

    .line 59
    .line 60
    iput-boolean v4, p0, Ll/kg20;->f:Z

    .line 61
    .line 62
    iput-boolean v0, p0, Ll/kg20;->g:Z

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iput-boolean v4, p0, Ll/kg20;->f:Z

    .line 66
    .line 67
    iput-boolean v4, p0, Ll/kg20;->g:Z

    .line 68
    .line 69
    :cond_3
    :goto_1
    iget-object v5, p0, Ll/kg20;->d:Ll/kg20$a;

    .line 70
    .line 71
    invoke-interface {v5}, Ll/kg20$a;->n()Z

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-eqz v5, :cond_4

    .line 76
    .line 77
    iput-boolean p7, p0, Ll/kg20;->e:Z

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_4
    if-eqz p7, :cond_6

    .line 81
    .line 82
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    cmpl-float v1, v5, v1

    .line 87
    .line 88
    if-lez v1, :cond_5

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_5
    move v0, v4

    .line 92
    :goto_2
    iput-boolean v0, p0, Ll/kg20;->e:Z

    .line 93
    .line 94
    :cond_6
    :goto_3
    iget-object v0, p0, Ll/kg20;->d:Ll/kg20$a;

    .line 95
    .line 96
    invoke-interface {v0}, Ll/kg20$a;->n()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_9

    .line 101
    .line 102
    iget-object v0, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 103
    .line 104
    check-cast v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;

    .line 105
    .line 106
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;->i:Lv/VImage;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyItemView;->h:Lv/VImage;

    .line 109
    .line 110
    cmpl-float v5, v2, v3

    .line 111
    .line 112
    const/16 v6, 0x8

    .line 113
    .line 114
    if-lez v5, :cond_7

    .line 115
    .line 116
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 123
    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_7
    cmpg-float v3, v2, v3

    .line 127
    .line 128
    if-gez v3, :cond_8

    .line 129
    .line 130
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    neg-float v1, v2

    .line 137
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 138
    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_8
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 145
    .line 146
    .line 147
    :cond_9
    :goto_4
    instance-of v0, p2, Lv/VPullUpRecyclerView;

    .line 148
    .line 149
    if-eqz v0, :cond_a

    .line 150
    .line 151
    move-object v0, p2

    .line 152
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 153
    .line 154
    iget-object v1, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Lv/VRecyclerView;->F(Landroid/view/View;)V

    .line 157
    .line 158
    .line 159
    :cond_a
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/k$e;->u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
