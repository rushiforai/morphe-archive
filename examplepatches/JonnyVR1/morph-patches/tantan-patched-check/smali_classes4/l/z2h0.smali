.class public Ll/z2h0;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# instance fields
.field public d:Ll/i3h0;

.field public e:Z

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Ll/i3h0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/z2h0;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/z2h0;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/z2h0;->g:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public B(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 3

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    .line 4
    .line 5
    iget-boolean p2, p0, Ll/z2h0;->e:Z

    .line 6
    .line 7
    if-eqz p2, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getLeftOption()Lcom/p1/mobile/putong/core/data/CardOption;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getRightOption()Lcom/p1/mobile/putong/core/data/CardOption;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v1, p0, Ll/z2h0;->f:Z

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    iget-object p2, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getCardPattern()Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p2, v1, v2}, Ll/i3h0;->q0(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p1, p2}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/i3h0;->p0()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    iget-boolean v0, p0, Ll/z2h0;->f:Z

    .line 68
    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getCardPattern()Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v1, v2}, Ll/i3h0;->q0(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->f()Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-static {p1, p2}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/i3h0;->p0()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    iget-object p2, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getCardPattern()Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p2, v0, p1}, Ll/i3h0;->q0(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 131
    .line 132
    iget-boolean p2, p0, Ll/z2h0;->f:Z

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Ll/i3h0;->n0(Z)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/i3h0;->p0()V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    iget-object p0, p0, Ll/z2h0;->d:Ll/i3h0;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getCardPattern()Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0, p1}, Ll/i3h0;->o0(Lcom/p1/mobile/putong/core/data/CardPattern;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public C(IF)F
    .locals 1

    .line 1
    int-to-float p0, p1

    .line 2
    sget p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->C:F

    .line 3
    .line 4
    div-float/2addr p0, p1

    .line 5
    const/4 p1, 0x0

    .line 6
    cmpl-float v0, p0, p1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    div-float/2addr p2, p0

    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/high16 p1, -0x40800000    # -1.0f

    .line 19
    .line 20
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/z2h0;->e:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/z2h0;->f:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/z2h0;->g:Z

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
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

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
    instance-of p2, p1, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    instance-of p2, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 12
    .line 13
    if-eqz p2, :cond_0

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
    instance-of p1, p1, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    instance-of p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    const/4 p1, 0x3

    .line 37
    const/16 p2, 0xc

    .line 38
    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    invoke-static {p2, p1}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    invoke-static {p1, p2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_2
    const/4 p0, 0x0

    .line 52
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
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
    if-ne p6, v0, :cond_5

    .line 3
    .line 4
    iget-object v1, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 5
    .line 6
    instance-of v1, v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    .line 7
    .line 8
    if-eqz v1, :cond_5

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
    invoke-virtual {p0, p3}, Ll/z2h0;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

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
    invoke-virtual {p0, v2, v4}, Ll/z2h0;->C(IF)F

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
    iget-object v4, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 45
    .line 46
    check-cast v4, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    .line 47
    .line 48
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 49
    .line 50
    cmpl-float v5, v2, v3

    .line 51
    .line 52
    const/4 v6, 0x0

    .line 53
    if-lez v5, :cond_1

    .line 54
    .line 55
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4, v2}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    if-eqz p7, :cond_3

    .line 62
    .line 63
    iput-boolean v0, p0, Ll/z2h0;->f:Z

    .line 64
    .line 65
    iput-boolean v6, p0, Ll/z2h0;->g:Z

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    cmpg-float v2, v2, v3

    .line 69
    .line 70
    if-gez v2, :cond_2

    .line 71
    .line 72
    const/4 v2, 0x4

    .line 73
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    if-eqz p7, :cond_3

    .line 77
    .line 78
    iput-boolean v6, p0, Ll/z2h0;->f:Z

    .line 79
    .line 80
    iput-boolean v0, p0, Ll/z2h0;->g:Z

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 84
    .line 85
    .line 86
    const/high16 v2, 0x3f800000    # 1.0f

    .line 87
    .line 88
    invoke-virtual {v4, v2}, Landroid/view/View;->setAlpha(F)V

    .line 89
    .line 90
    .line 91
    if-eqz p7, :cond_3

    .line 92
    .line 93
    iput-boolean v6, p0, Ll/z2h0;->f:Z

    .line 94
    .line 95
    iput-boolean v6, p0, Ll/z2h0;->g:Z

    .line 96
    .line 97
    :cond_3
    :goto_1
    if-eqz p7, :cond_5

    .line 98
    .line 99
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    cmpl-float v1, v2, v1

    .line 104
    .line 105
    if-lez v1, :cond_4

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_4
    move v0, v6

    .line 109
    :goto_2
    iput-boolean v0, p0, Ll/z2h0;->e:Z

    .line 110
    .line 111
    :cond_5
    instance-of v0, p2, Lv/VPullUpRecyclerView;

    .line 112
    .line 113
    if-eqz v0, :cond_6

    .line 114
    .line 115
    move-object v0, p2

    .line 116
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 117
    .line 118
    iget-object v1, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lv/VRecyclerView;->F(Landroid/view/View;)V

    .line 121
    .line 122
    .line 123
    :cond_6
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/k$e;->u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V

    .line 124
    .line 125
    .line 126
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
