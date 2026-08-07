.class public Lcom/p1/mobile/putong/core/ui/vip/likers/b;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;

.field public e:Z

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->g:Z

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;

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
    .locals 2

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->e:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 6
    .line 7
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;

    .line 14
    .line 15
    iget-object p2, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->w:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 18
    .line 19
    invoke-interface {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;->b(Lcom/p1/mobile/putong/data/User;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 26
    .line 27
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;

    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;

    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 38
    .line 39
    invoke-interface {p2, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;->b(Lcom/p1/mobile/putong/data/User;Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 46
    .line 47
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;->c(Z)V

    .line 48
    .line 49
    .line 50
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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->e:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->g:Z

    .line 7
    .line 8
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/k$e;->c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 1

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
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    :cond_0
    instance-of v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/16 p0, 0xf

    .line 20
    .line 21
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;

    .line 31
    .line 32
    if-eqz p1, :cond_4

    .line 33
    .line 34
    :cond_2
    instance-of p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 35
    .line 36
    if-eqz p1, :cond_4

    .line 37
    .line 38
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const/4 p1, 0x3

    .line 45
    const/16 p2, 0xc

    .line 46
    .line 47
    if-nez p0, :cond_3

    .line 48
    .line 49
    invoke-static {p2, p1}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_3
    invoke-static {p1, p2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object p1, p2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 68
    .line 69
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hq(Landroid/view/View;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_5

    .line 74
    .line 75
    iget-object p0, p2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 76
    .line 77
    const/high16 p1, 0x41200000    # 10.0f

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 80
    .line 81
    .line 82
    :cond_5
    const/4 p0, 0x0

    .line 83
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    return p0
.end method

.method public l(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x4f000000

    return p0
.end method

.method public m(Landroidx/recyclerview/widget/RecyclerView$e0;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3e800000    # 0.25f

    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V
    .locals 11

    .line 1
    move/from16 v0, p7

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    move/from16 v2, p6

    .line 5
    .line 6
    if-ne v2, v1, :cond_8

    .line 7
    .line 8
    iget-object v3, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 9
    .line 10
    instance-of v4, v3, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 11
    .line 12
    if-nez v4, :cond_0

    .line 13
    .line 14
    instance-of v3, v3, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;

    .line 15
    .line 16
    if-eqz v3, :cond_8

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    int-to-float v3, v3

    .line 23
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    mul-float/2addr v3, v4

    .line 28
    iget-object v4, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    const/high16 v5, 0x40000000    # 2.0f

    .line 35
    .line 36
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    mul-float/2addr v6, v5

    .line 41
    invoke-virtual {p0, v4, v6}, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->C(IF)F

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const/4 v5, 0x0

    .line 46
    cmpl-float v6, p4, v5

    .line 47
    .line 48
    if-lez v6, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    neg-float v4, v4

    .line 52
    :goto_0
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;

    .line 53
    .line 54
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;->n()Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_2

    .line 59
    .line 60
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->e:Z

    .line 61
    .line 62
    goto :goto_4

    .line 63
    :cond_2
    iget-object v6, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 64
    .line 65
    instance-of v7, v6, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 66
    .line 67
    if-eqz v7, :cond_3

    .line 68
    .line 69
    check-cast v6, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 70
    .line 71
    iget-object v7, v6, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->f:Lv/VImage;

    .line 72
    .line 73
    iget-object v6, v6, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->e:Lv/VImage;

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    check-cast v6, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;

    .line 77
    .line 78
    iget-object v7, v6, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->f:Lv/VImage;

    .line 79
    .line 80
    iget-object v6, v6, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->e:Lv/VImage;

    .line 81
    .line 82
    :goto_1
    cmpl-float v8, v4, v5

    .line 83
    .line 84
    const/4 v9, 0x4

    .line 85
    const/4 v10, 0x0

    .line 86
    if-lez v8, :cond_4

    .line 87
    .line 88
    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v9}, Landroid/view/View;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v7, v4}, Landroid/view/View;->setAlpha(F)V

    .line 95
    .line 96
    .line 97
    if-eqz v0, :cond_6

    .line 98
    .line 99
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 100
    .line 101
    iput-boolean v10, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->g:Z

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_4
    cmpg-float v5, v4, v5

    .line 105
    .line 106
    if-gez v5, :cond_5

    .line 107
    .line 108
    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    neg-float v4, v4

    .line 115
    invoke-virtual {v6, v4}, Landroid/view/View;->setAlpha(F)V

    .line 116
    .line 117
    .line 118
    if-eqz v0, :cond_6

    .line 119
    .line 120
    iput-boolean v10, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 121
    .line 122
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->g:Z

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_5
    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v6, v9}, Landroid/view/View;->setVisibility(I)V

    .line 129
    .line 130
    .line 131
    if-eqz v0, :cond_6

    .line 132
    .line 133
    iput-boolean v10, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->f:Z

    .line 134
    .line 135
    iput-boolean v10, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->g:Z

    .line 136
    .line 137
    :cond_6
    :goto_2
    if-eqz v0, :cond_8

    .line 138
    .line 139
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    cmpl-float v3, v4, v3

    .line 144
    .line 145
    if-lez v3, :cond_7

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_7
    move v1, v10

    .line 149
    :goto_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;->e:Z

    .line 150
    .line 151
    :cond_8
    :goto_4
    instance-of v1, p2, Lv/VPullUpRecyclerView;

    .line 152
    .line 153
    if-eqz v1, :cond_9

    .line 154
    .line 155
    move-object v1, p2

    .line 156
    check-cast v1, Lv/VPullUpRecyclerView;

    .line 157
    .line 158
    iget-object v3, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 159
    .line 160
    invoke-virtual {v1, v3}, Lv/VRecyclerView;->F(Landroid/view/View;)V

    .line 161
    .line 162
    .line 163
    :cond_9
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/k$e;->u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method
