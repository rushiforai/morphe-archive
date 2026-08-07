.class public Ll/bio;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bio$a;
    }
.end annotation


# instance fields
.field public final d:Ll/bio$a;

.field public e:Z

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Ll/bio$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/bio;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/bio;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/bio;->g:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/bio;->d:Ll/bio$a;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public B(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 8
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of p1, v1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;

    .line 9
    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    iget-boolean p1, p0, Ll/bio;->e:Z

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    move-object v3, v1

    .line 17
    check-cast v3, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;

    .line 18
    .line 19
    iget-object v2, p0, Ll/bio;->d:Ll/bio$a;

    .line 20
    .line 21
    iget-object v4, v3, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-boolean v5, p0, Ll/bio;->f:Z

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v7, 0x0

    .line 27
    invoke-interface/range {v2 .. v7}, Ll/bio$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZZ)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Ll/bio;->d:Ll/bio$a;

    .line 32
    .line 33
    iget-boolean p0, p0, Ll/bio;->f:Z

    .line 34
    .line 35
    invoke-interface {p1, p0}, Ll/bio$a;->o(Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    instance-of p1, v1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 40
    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    move-object p1, v1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 45
    .line 46
    iget-object v0, p0, Ll/bio;->d:Ll/bio$a;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-boolean v3, p0, Ll/bio;->f:Z

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    const/4 v5, 0x0

    .line 56
    invoke-interface/range {v0 .. v5}, Ll/bio$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZZ)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    instance-of p1, v1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    .line 61
    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    iget-object v0, p0, Ll/bio;->d:Ll/bio$a;

    .line 65
    .line 66
    iget-boolean v3, p0, Ll/bio;->f:Z

    .line 67
    .line 68
    const/4 v4, 0x0

    .line 69
    const/4 v5, 0x0

    .line 70
    const/4 v2, 0x0

    .line 71
    invoke-interface/range {v0 .. v5}, Ll/bio$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZZ)V

    .line 72
    .line 73
    .line 74
    :cond_4
    :goto_0
    return-void
.end method

.method public final C(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public D(IF)F
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

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/bio;->C(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p2, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-static {p2, p2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    instance-of p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const/16 p0, 0xf

    .line 24
    .line 25
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    instance-of p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 31
    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    const/4 p1, 0x3

    .line 41
    const/16 p2, 0xc

    .line 42
    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    move v0, p2

    .line 46
    move p2, p1

    .line 47
    move p1, v0

    .line 48
    :cond_2
    invoke-static {p1, p2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_3
    invoke-static {p2, p2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
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
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/high16 p0, 0x3e800000    # 0.25f

    .line 2
    .line 3
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
    .locals 11
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move/from16 v0, p6

    .line 2
    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x1

    .line 8
    if-ne v0, v4, :cond_8

    .line 9
    .line 10
    iget-object v5, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 11
    .line 12
    instance-of v5, v5, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;

    .line 13
    .line 14
    if-eqz v5, :cond_8

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    int-to-float v5, v5

    .line 21
    invoke-virtual {p0, p3}, Ll/bio;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    mul-float/2addr v5, v6

    .line 26
    iget-object v6, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    mul-float/2addr v7, v1

    .line 37
    invoke-virtual {p0, v6, v7}, Ll/bio;->D(IF)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    cmpl-float v6, p4, v2

    .line 42
    .line 43
    if-lez v6, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    neg-float v1, v1

    .line 47
    :goto_0
    iget-object v6, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 48
    .line 49
    check-cast v6, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;

    .line 50
    .line 51
    iget-object v7, v6, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->f:Lv/VImage;

    .line 52
    .line 53
    iget-object v6, v6, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->e:Lv/VImage;

    .line 54
    .line 55
    iget-object v8, p0, Ll/bio;->d:Ll/bio$a;

    .line 56
    .line 57
    invoke-interface {v8}, Ll/bio$a;->n()Z

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    cmpl-float v9, v1, v2

    .line 62
    .line 63
    const/4 v10, 0x4

    .line 64
    if-lez v9, :cond_2

    .line 65
    .line 66
    if-nez v8, :cond_1

    .line 67
    .line 68
    invoke-virtual {v7, v3}, Landroid/view/View;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v7, v1}, Landroid/view/View;->setAlpha(F)V

    .line 75
    .line 76
    .line 77
    :cond_1
    if-eqz p7, :cond_6

    .line 78
    .line 79
    iput-boolean v4, p0, Ll/bio;->f:Z

    .line 80
    .line 81
    iput-boolean v3, p0, Ll/bio;->g:Z

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    cmpg-float v2, v1, v2

    .line 85
    .line 86
    if-gez v2, :cond_4

    .line 87
    .line 88
    if-nez v8, :cond_3

    .line 89
    .line 90
    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    .line 94
    .line 95
    .line 96
    neg-float v1, v1

    .line 97
    invoke-virtual {v6, v1}, Landroid/view/View;->setAlpha(F)V

    .line 98
    .line 99
    .line 100
    :cond_3
    if-eqz p7, :cond_6

    .line 101
    .line 102
    iput-boolean v3, p0, Ll/bio;->f:Z

    .line 103
    .line 104
    iput-boolean v4, p0, Ll/bio;->g:Z

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_4
    if-nez v8, :cond_5

    .line 108
    .line 109
    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 113
    .line 114
    .line 115
    :cond_5
    if-eqz p7, :cond_6

    .line 116
    .line 117
    iput-boolean v3, p0, Ll/bio;->f:Z

    .line 118
    .line 119
    iput-boolean v3, p0, Ll/bio;->g:Z

    .line 120
    .line 121
    :cond_6
    :goto_1
    if-eqz p7, :cond_c

    .line 122
    .line 123
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    cmpl-float v1, v1, v5

    .line 128
    .line 129
    if-lez v1, :cond_7

    .line 130
    .line 131
    move v3, v4

    .line 132
    :cond_7
    iput-boolean v3, p0, Ll/bio;->e:Z

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_8
    if-ne v0, v4, :cond_c

    .line 136
    .line 137
    if-eqz p7, :cond_c

    .line 138
    .line 139
    iget-object v5, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 140
    .line 141
    instance-of v6, v5, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 142
    .line 143
    if-nez v6, :cond_9

    .line 144
    .line 145
    instance-of v6, v5, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    .line 146
    .line 147
    if-eqz v6, :cond_c

    .line 148
    .line 149
    :cond_9
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 154
    .line 155
    .line 156
    move-result v6

    .line 157
    mul-float/2addr v6, v1

    .line 158
    invoke-virtual {p0, v5, v6}, Ll/bio;->D(IF)F

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    cmpl-float v5, p4, v2

    .line 163
    .line 164
    if-lez v5, :cond_a

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_a
    neg-float v1, v1

    .line 168
    :goto_2
    cmpl-float v1, v1, v2

    .line 169
    .line 170
    if-lez v1, :cond_b

    .line 171
    .line 172
    move v3, v4

    .line 173
    :cond_b
    iput-boolean v3, p0, Ll/bio;->f:Z

    .line 174
    .line 175
    :cond_c
    :goto_3
    instance-of v1, p2, Lv/VPullUpRecyclerView;

    .line 176
    .line 177
    if-eqz v1, :cond_d

    .line 178
    .line 179
    move-object v1, p2

    .line 180
    check-cast v1, Lv/VPullUpRecyclerView;

    .line 181
    .line 182
    iget-object v2, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 183
    .line 184
    invoke-virtual {v1, v2}, Lv/VRecyclerView;->F(Landroid/view/View;)V

    .line 185
    .line 186
    .line 187
    :cond_d
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/k$e;->u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
