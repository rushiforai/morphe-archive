.class public Ll/px2;
.super Ll/mx2;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mx2;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pf7;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Ll/px2;->D0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-super {p0, p1, p2}, Ll/mx2;->A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final D0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 10
    .line 11
    if-ne p1, v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 14
    .line 15
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    sget-boolean v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 21
    .line 22
    if-eqz v2, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object v2, p0, Ll/ox2;->i:Ll/vo0;

    .line 28
    .line 29
    iget v3, v0, Ll/txl0;->k:I

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ll/vo0;->a(I)V

    .line 32
    .line 33
    .line 34
    iget-object v2, v0, Ll/txl0;->a:Landroid/view/View;

    .line 35
    .line 36
    iget-object v3, p0, Ll/ox2;->f:Ll/udj0;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/udj0;->e()V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Ll/ox2;->i:Ll/vo0;

    .line 42
    .line 43
    invoke-virtual {v3}, Ll/vo0;->b()V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Ll/ox2;->e:Ll/nx2;

    .line 47
    .line 48
    invoke-virtual {v3, v2}, Ll/nx2;->j(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Ll/ox2;->i:Ll/vo0;

    .line 52
    .line 53
    iget v4, v0, Ll/txl0;->k:I

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ll/vo0;->h(I)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_4

    .line 60
    .line 61
    if-eqz p2, :cond_4

    .line 62
    .line 63
    sget-boolean v3, Ll/vo0;->y:Z

    .line 64
    .line 65
    if-nez v3, :cond_4

    .line 66
    .line 67
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 68
    .line 69
    if-eqz p0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    :cond_3
    return v1

    .line 75
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->PRE_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 76
    .line 77
    iput-object v1, v0, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 78
    .line 79
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    new-instance v3, Ll/nh4;

    .line 84
    .line 85
    iget v4, v0, Ll/txl0;->k:I

    .line 86
    .line 87
    invoke-direct {v3, v4, v0}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 88
    .line 89
    .line 90
    const-wide/16 v4, 0x1f4

    .line 91
    .line 92
    iput-wide v4, v3, Ll/nh4;->d:J

    .line 93
    .line 94
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 95
    .line 96
    iput-object v4, v3, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 97
    .line 98
    iput-object p1, v3, Ll/nh4;->h:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 99
    .line 100
    const/4 v4, 0x1

    .line 101
    if-eqz p2, :cond_5

    .line 102
    .line 103
    sget-boolean p2, Ll/vo0;->y:Z

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_5
    move p2, v4

    .line 107
    :goto_0
    iput-boolean p2, v3, Ll/nh4;->i:Z

    .line 108
    .line 109
    iget p2, v0, Ll/txl0;->k:I

    .line 110
    .line 111
    invoke-virtual {v3, p2}, Ll/nh4;->a(I)V

    .line 112
    .line 113
    .line 114
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 115
    .line 116
    filled-new-array {p2}, [Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-virtual {v3, p2}, Ll/nh4;->b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V

    .line 121
    .line 122
    .line 123
    const/4 p2, -0x1

    .line 124
    iput p2, v3, Ll/nh4;->e:I

    .line 125
    .line 126
    new-instance p2, Ll/mo0;

    .line 127
    .line 128
    invoke-direct {p2}, Ll/mo0;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object p2, v3, Ll/nh4;->f:Ll/mo0;

    .line 132
    .line 133
    invoke-virtual {p2, v2}, Ll/mo0;->e(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    const/high16 v0, 0x3f800000    # 1.0f

    .line 137
    .line 138
    iput v0, p2, Ll/mo0;->f:F

    .line 139
    .line 140
    const/4 v2, 0x0

    .line 141
    iput v2, p2, Ll/mo0;->h:F

    .line 142
    .line 143
    iput v2, p2, Ll/mo0;->d:F

    .line 144
    .line 145
    iput v2, p2, Ll/mo0;->j:F

    .line 146
    .line 147
    iput v0, p2, Ll/mo0;->l:F

    .line 148
    .line 149
    sget-object v5, Ll/px2$a;->a:[I

    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    aget v5, v5, v6

    .line 156
    .line 157
    if-eq v5, v4, :cond_7

    .line 158
    .line 159
    const/4 v6, 0x2

    .line 160
    if-eq v5, v6, :cond_7

    .line 161
    .line 162
    const/4 v6, 0x3

    .line 163
    if-eq v5, v6, :cond_6

    .line 164
    .line 165
    neg-int v1, v1

    .line 166
    int-to-float v1, v1

    .line 167
    iput v1, p2, Ll/mo0;->b:F

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_6
    int-to-float v1, v1

    .line 171
    iput v1, p2, Ll/mo0;->b:F

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_7
    neg-int v1, v1

    .line 175
    int-to-float v1, v1

    .line 176
    iput v1, p2, Ll/mo0;->b:F

    .line 177
    .line 178
    :goto_1
    new-instance p2, Landroid/view/animation/PathInterpolator;

    .line 179
    .line 180
    sget v1, Ll/vo0;->p:F

    .line 181
    .line 182
    invoke-direct {p2, v1, v2, v0, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v3, p2}, Ll/nh4;->p(Landroid/view/animation/Interpolator;)V

    .line 186
    .line 187
    .line 188
    iget-object p2, p0, Ll/ox2;->d:Ll/vr2;

    .line 189
    .line 190
    invoke-virtual {p2, v3}, Ll/vr2;->f(Ll/nh4;)V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Ll/ox2;->i:Ll/vo0;

    .line 194
    .line 195
    filled-new-array {v3}, [Ll/nh4;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-virtual {p0, p2}, Ll/vo0;->d([Ll/nh4;)V

    .line 200
    .line 201
    .line 202
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 203
    .line 204
    if-eqz p0, :cond_8

    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    :cond_8
    return v4
.end method

.method public f()Ll/qn2;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/iqj0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/iqj0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Ll/yrn;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/yrn;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public h()Ll/udj0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/jqj0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/jqj0;-><init>(Ll/ox2;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    invoke-super {p0}, Ll/ox2;->h()Ll/udj0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public r0(Ll/jk4;Ljava/util/List;Ll/txl0;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jk4;",
            "Ljava/util/List<",
            "Ll/nh4;",
            ">;",
            "Ll/txl0;",
            ")I"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    invoke-interface {p1}, Ll/jk4;->getPreBackOperation()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ltz v0, :cond_3

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    if-eq v0, v2, :cond_1

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_3
    :goto_0
    const/4 v0, 0x0

    .line 32
    :goto_1
    invoke-interface {p1}, Ll/jk4;->resetPreAction()V

    .line 33
    .line 34
    .line 35
    if-eqz v0, :cond_7

    .line 36
    .line 37
    iget p1, p3, Ll/txl0;->e:I

    .line 38
    .line 39
    if-nez p1, :cond_7

    .line 40
    .line 41
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 42
    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    :cond_4
    new-instance p1, Ll/nh4;

    .line 49
    .line 50
    iget v3, p3, Ll/txl0;->k:I

    .line 51
    .line 52
    invoke-direct {p1, v3, p3}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 53
    .line 54
    .line 55
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_INSERT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 56
    .line 57
    iput-object v3, p1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 58
    .line 59
    sget-wide v3, Ll/vo0;->j:J

    .line 60
    .line 61
    iput-wide v3, p1, Ll/nh4;->d:J

    .line 62
    .line 63
    new-instance v3, Ll/mo0;

    .line 64
    .line 65
    invoke-direct {v3}, Ll/mo0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ll/mo0;->b()V

    .line 69
    .line 70
    .line 71
    sget-object v4, Ll/px2$a;->a:[I

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    aget v4, v4, v5

    .line 78
    .line 79
    const/high16 v5, 0x3f800000    # 1.0f

    .line 80
    .line 81
    const/4 v6, 0x0

    .line 82
    if-eq v4, v2, :cond_6

    .line 83
    .line 84
    if-eq v4, v1, :cond_6

    .line 85
    .line 86
    const/4 v1, 0x3

    .line 87
    if-eq v4, v1, :cond_5

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_5
    iput v6, v3, Ll/mo0;->c:F

    .line 91
    .line 92
    iget-object p0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    int-to-float p0, p0

    .line 99
    iput p0, v3, Ll/mo0;->a:F

    .line 100
    .line 101
    iput v5, v3, Ll/mo0;->e:F

    .line 102
    .line 103
    iput v6, v3, Ll/mo0;->g:F

    .line 104
    .line 105
    iput v6, v3, Ll/mo0;->i:F

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_6
    iput v6, v3, Ll/mo0;->c:F

    .line 109
    .line 110
    iget-object p0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    neg-int p0, p0

    .line 117
    int-to-float p0, p0

    .line 118
    iput p0, v3, Ll/mo0;->a:F

    .line 119
    .line 120
    iput v5, v3, Ll/mo0;->e:F

    .line 121
    .line 122
    iput v6, v3, Ll/mo0;->g:F

    .line 123
    .line 124
    iput v6, v3, Ll/mo0;->i:F

    .line 125
    .line 126
    :goto_2
    iput-object v0, p3, Ll/txl0;->i:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 127
    .line 128
    iget p0, p3, Ll/txl0;->k:I

    .line 129
    .line 130
    invoke-virtual {p1, p0}, Ll/nh4;->a(I)V

    .line 131
    .line 132
    .line 133
    iput-object v3, p1, Ll/nh4;->f:Ll/mo0;

    .line 134
    .line 135
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    const/4 p0, -0x1

    .line 139
    return p0

    .line 140
    :cond_7
    const/4 p0, 0x0

    .line 141
    return p0

    .line 142
    :cond_8
    invoke-super {p0, p1, p2, p3}, Ll/qx2;->r0(Ll/jk4;Ljava/util/List;Ll/txl0;)I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    return p0
.end method
