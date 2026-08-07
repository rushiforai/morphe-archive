.class public Ll/ihr;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ihr$b;,
        Ll/ihr$a;
    }
.end annotation


# instance fields
.field public d:Ll/ihr$b;

.field public e:Ll/ihr$a;

.field public f:Z

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>(Ll/ihr$a;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/ihr;->f:Z

    .line 16
    iput-boolean v0, p0, Ll/ihr;->g:Z

    .line 17
    iput-boolean v0, p0, Ll/ihr;->h:Z

    .line 18
    iput-object p1, p0, Ll/ihr;->e:Ll/ihr$a;

    return-void
.end method

.method public constructor <init>(Ll/ihr$b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ihr;->f:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/ihr;->g:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/ihr;->h:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/ihr;->d:Ll/ihr$b;

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
    .locals 0

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 8
    .line 9
    iget-object p2, p0, Ll/ihr;->d:Ll/ihr$b;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->o:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/ihr;->g:Z

    .line 14
    .line 15
    invoke-interface {p2, p1, p0}, Ll/ihr$b;->D(Lcom/p1/mobile/putong/core/data/LikedUser;Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    .line 20
    .line 21
    if-eqz p2, :cond_2

    .line 22
    .line 23
    iget-boolean p2, p0, Ll/ihr;->f:Z

    .line 24
    .line 25
    if-nez p2, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Ll/ihr;->e:Ll/ihr$a;

    .line 28
    .line 29
    iget-boolean p0, p0, Ll/ihr;->g:Z

    .line 30
    .line 31
    invoke-interface {p1, p0}, Ll/ihr$a;->c(Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    .line 36
    .line 37
    iget-object p2, p0, Ll/ihr;->e:Ll/ihr$a;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->j:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 40
    .line 41
    iget-boolean p0, p0, Ll/ihr;->g:Z

    .line 42
    .line 43
    invoke-interface {p2, p1, p0}, Ll/ihr$a;->T(Lcom/p1/mobile/putong/core/data/LikeUser;Z)V

    .line 44
    .line 45
    .line 46
    :cond_2
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
    iput-boolean v0, p0, Ll/ihr;->f:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/ihr;->g:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/ihr;->h:Z

    .line 7
    .line 8
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/k$e;->c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 3

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
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 8
    .line 9
    const/16 v0, 0xf

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    instance-of p2, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-static {v0, v0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    const/16 v2, 0xc

    .line 26
    .line 27
    if-eqz p2, :cond_2

    .line 28
    .line 29
    instance-of p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 30
    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    invoke-static {v2, v1}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    invoke-static {v1, v2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_2
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    .line 52
    .line 53
    if-eqz p2, :cond_3

    .line 54
    .line 55
    instance-of p2, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 56
    .line 57
    if-eqz p2, :cond_3

    .line 58
    .line 59
    invoke-static {v0, v0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0

    .line 64
    :cond_3
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    .line 65
    .line 66
    if-eqz p1, :cond_5

    .line 67
    .line 68
    instance-of p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 69
    .line 70
    if-eqz p1, :cond_5

    .line 71
    .line 72
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    invoke-static {v2, v1}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    return p0

    .line 85
    :cond_4
    invoke-static {v1, v2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    return p0

    .line 90
    :cond_5
    const/4 p0, 0x0

    .line 91
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
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
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    if-ne p6, v3, :cond_5

    .line 7
    .line 8
    iget-object v4, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 9
    .line 10
    instance-of v4, v4, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 11
    .line 12
    if-eqz v4, :cond_5

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    int-to-float v4, v4

    .line 19
    invoke-virtual {p0, p3}, Ll/ihr;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    mul-float/2addr v4, v5

    .line 24
    iget-object v5, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    mul-float/2addr v6, v0

    .line 35
    invoke-virtual {p0, v5, v6}, Ll/ihr;->C(IF)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    cmpl-float v5, p4, v1

    .line 40
    .line 41
    if-lez v5, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    neg-float v0, v0

    .line 45
    :goto_0
    iget-object v5, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 46
    .line 47
    check-cast v5, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 48
    .line 49
    cmpl-float v6, v0, v1

    .line 50
    .line 51
    if-lez v6, :cond_1

    .line 52
    .line 53
    if-eqz p7, :cond_3

    .line 54
    .line 55
    iput-boolean v3, p0, Ll/ihr;->g:Z

    .line 56
    .line 57
    iput-boolean v2, p0, Ll/ihr;->h:Z

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    cmpg-float v0, v0, v1

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    if-gez v0, :cond_2

    .line 64
    .line 65
    iget-object v0, v5, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->i:Lv/VImage;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    if-eqz p7, :cond_3

    .line 71
    .line 72
    iput-boolean v2, p0, Ll/ihr;->g:Z

    .line 73
    .line 74
    iput-boolean v3, p0, Ll/ihr;->h:Z

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    iget-object v0, v5, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->i:Lv/VImage;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    if-eqz p7, :cond_3

    .line 83
    .line 84
    iput-boolean v2, p0, Ll/ihr;->g:Z

    .line 85
    .line 86
    iput-boolean v2, p0, Ll/ihr;->h:Z

    .line 87
    .line 88
    :cond_3
    :goto_1
    if-eqz p7, :cond_b

    .line 89
    .line 90
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    cmpl-float v0, v0, v4

    .line 95
    .line 96
    if-lez v0, :cond_4

    .line 97
    .line 98
    move v2, v3

    .line 99
    :cond_4
    iput-boolean v2, p0, Ll/ihr;->f:Z

    .line 100
    .line 101
    goto :goto_4

    .line 102
    :cond_5
    if-ne p6, v3, :cond_b

    .line 103
    .line 104
    iget-object v4, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 105
    .line 106
    instance-of v4, v4, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    .line 107
    .line 108
    if-eqz v4, :cond_b

    .line 109
    .line 110
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    int-to-float v4, v4

    .line 115
    invoke-virtual {p0, p3}, Ll/ihr;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    mul-float/2addr v4, v5

    .line 120
    iget-object v5, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 121
    .line 122
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 127
    .line 128
    .line 129
    move-result v6

    .line 130
    mul-float/2addr v6, v0

    .line 131
    invoke-virtual {p0, v5, v6}, Ll/ihr;->C(IF)F

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    cmpl-float v5, p4, v1

    .line 136
    .line 137
    if-lez v5, :cond_6

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_6
    neg-float v0, v0

    .line 141
    :goto_2
    cmpl-float v5, v0, v1

    .line 142
    .line 143
    if-lez v5, :cond_7

    .line 144
    .line 145
    if-eqz p7, :cond_9

    .line 146
    .line 147
    iput-boolean v3, p0, Ll/ihr;->g:Z

    .line 148
    .line 149
    iput-boolean v2, p0, Ll/ihr;->h:Z

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_7
    cmpg-float v0, v0, v1

    .line 153
    .line 154
    if-gez v0, :cond_8

    .line 155
    .line 156
    if-eqz p7, :cond_9

    .line 157
    .line 158
    iput-boolean v2, p0, Ll/ihr;->g:Z

    .line 159
    .line 160
    iput-boolean v3, p0, Ll/ihr;->h:Z

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_8
    if-eqz p7, :cond_9

    .line 164
    .line 165
    iput-boolean v2, p0, Ll/ihr;->g:Z

    .line 166
    .line 167
    iput-boolean v2, p0, Ll/ihr;->h:Z

    .line 168
    .line 169
    :cond_9
    :goto_3
    if-eqz p7, :cond_b

    .line 170
    .line 171
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    cmpl-float v0, v0, v4

    .line 176
    .line 177
    if-lez v0, :cond_a

    .line 178
    .line 179
    move v2, v3

    .line 180
    :cond_a
    iput-boolean v2, p0, Ll/ihr;->f:Z

    .line 181
    .line 182
    :cond_b
    :goto_4
    instance-of v0, p2, Lv/VPullUpRecyclerView;

    .line 183
    .line 184
    if-eqz v0, :cond_c

    .line 185
    .line 186
    move-object v0, p2

    .line 187
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 188
    .line 189
    iget-object v1, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Lv/VRecyclerView;->F(Landroid/view/View;)V

    .line 192
    .line 193
    .line 194
    :cond_c
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/k$e;->u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
