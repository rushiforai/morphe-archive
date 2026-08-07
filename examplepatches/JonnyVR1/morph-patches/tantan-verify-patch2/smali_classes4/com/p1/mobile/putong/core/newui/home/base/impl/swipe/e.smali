.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# instance fields
.field public g:I

.field public h:J

.field public i:I

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->g:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->h:J

    .line 10
    .line 11
    invoke-static {}, Ll/gra;->f0()Lcom/p1/mobile/putong/core/data/HomeHealConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/core/data/HomeHealConfig;->left_slide_guidance:I

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->i:I

    .line 18
    .line 19
    invoke-static {}, Ll/gra;->f0()Lcom/p1/mobile/putong/core/data/HomeHealConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget v0, v0, Lcom/p1/mobile/putong/core/data/HomeHealConfig;->right_slide_guidance:I

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->j:I

    .line 26
    .line 27
    invoke-static {}, Ll/gra;->f0()Lcom/p1/mobile/putong/core/data/HomeHealConfig;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget v0, v0, Lcom/p1/mobile/putong/core/data/HomeHealConfig;->right_interval:I

    .line 32
    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->k:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 13

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->L5:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->i:I

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v3, v2, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 27
    .line 28
    iget v3, v3, Ll/r4a;->r:I

    .line 29
    .line 30
    if-ne v3, v0, :cond_0

    .line 31
    .line 32
    iget-object v0, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object v0, v0, Ll/dkb;->L5:Ll/jxd0;

    .line 35
    .line 36
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e$a;

    .line 48
    .line 49
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 50
    .line 51
    .line 52
    const-wide/16 p0, 0xc8

    .line 53
    .line 54
    invoke-static {v0, v2, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 55
    .line 56
    .line 57
    return v1

    .line 58
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    iget-object v0, v0, Ll/dkb;->M5:Ll/jxd0;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_6

    .line 75
    .line 76
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->j:I

    .line 77
    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 81
    .line 82
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 83
    .line 84
    const-wide/16 v3, 0x0

    .line 85
    .line 86
    if-eq v0, v2, :cond_2

    .line 87
    .line 88
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 89
    .line 90
    if-ne v0, v2, :cond_1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->h:J

    .line 94
    .line 95
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->g:I

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_2
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 99
    .line 100
    .line 101
    move-result-wide v5

    .line 102
    iget-wide v7, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->h:J

    .line 103
    .line 104
    cmp-long v0, v7, v3

    .line 105
    .line 106
    const/4 v2, 0x1

    .line 107
    if-nez v0, :cond_3

    .line 108
    .line 109
    iput-wide v5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->h:J

    .line 110
    .line 111
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->g:I

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_3
    sub-long v7, v5, v7

    .line 115
    .line 116
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->k:I

    .line 117
    .line 118
    int-to-long v9, v0

    .line 119
    const-wide/16 v11, 0x3e8

    .line 120
    .line 121
    mul-long/2addr v9, v11

    .line 122
    cmp-long v0, v7, v9

    .line 123
    .line 124
    if-gez v0, :cond_4

    .line 125
    .line 126
    iput-wide v5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->h:J

    .line 127
    .line 128
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->g:I

    .line 129
    .line 130
    add-int/2addr v0, v2

    .line 131
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->g:I

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_4
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->h:J

    .line 135
    .line 136
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->g:I

    .line 137
    .line 138
    :goto_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->g:I

    .line 139
    .line 140
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;->j:I

    .line 141
    .line 142
    if-ne v0, p0, :cond_6

    .line 143
    .line 144
    new-instance p0, Ll/d5l;

    .line 145
    .line 146
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-direct {p0, v0}, Ll/d5l;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_5

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    sget-object v2, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->HIGH_SPEED_RIGHT_SLIDE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 170
    .line 171
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    const/16 v3, 0x4e20

    .line 178
    .line 179
    invoke-virtual {v0, v2, p1, p0, v3}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_5
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-static {p0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p1, p0}, Ll/cl80;->q(Ll/al80;)V

    .line 192
    .line 193
    .line 194
    :goto_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 195
    .line 196
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 197
    .line 198
    iget-object p0, p0, Ll/dkb;->M5:Ll/jxd0;

    .line 199
    .line 200
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 201
    .line 202
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    :cond_6
    :goto_3
    return v1
.end method
