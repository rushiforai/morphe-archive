.class public Ll/nof;
.super Ll/vr2;
.source "SourceFile"


# static fields
.field public static a:Landroid/view/animation/PathInterpolator;

.field public static b:Landroid/view/animation/PathInterpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v1, 0x3f11eb85    # 0.57f

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const v3, 0x3f0ccccd    # 0.55f

    .line 8
    .line 9
    .line 10
    const/high16 v4, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/nof;->a:Landroid/view/animation/PathInterpolator;

    .line 16
    .line 17
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 18
    .line 19
    const v1, 0x3ea3d70a    # 0.32f

    .line 20
    .line 21
    .line 22
    const v2, 0x3ecccccd    # 0.4f

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Ll/nof;->b:Landroid/view/animation/PathInterpolator;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/uih0;->A0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    sget p0, Ll/vo0;->H:F

    .line 20
    .line 21
    return p0
.end method

.method public b()F
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/uih0;->A0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/high16 p0, 0x40000000    # 2.0f

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    sget p0, Ll/vo0;->N:F

    .line 21
    .line 22
    return p0
.end method

.method public c(F)Landroid/view/animation/PathInterpolator;
    .locals 2

    .line 1
    new-instance p0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const v1, 0x3f147ae1    # 0.58f

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0, v0, v1, p1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public d()Landroid/view/animation/Interpolator;
    .locals 3

    .line 1
    new-instance p0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v0, 0x3f147ae1    # 0.58f

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {p0, v2, v2, v0, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public e(F)Landroid/view/animation/PathInterpolator;
    .locals 3

    .line 1
    new-instance p0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const p1, 0x3f3ae148    # 0.73f

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const v1, 0x3f1eb852    # 0.62f

    .line 9
    .line 10
    .line 11
    const v2, 0x3e4ccccd    # 0.2f

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v1, v2, p1, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public f(Ll/nh4;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Ll/vr2;->f(Ll/nh4;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->Z2()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_4

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/nh4;->h()Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 15
    .line 16
    if-ne p0, v0, :cond_4

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/nh4;->g()Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 23
    .line 24
    if-ne p0, v0, :cond_4

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_4

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/nh4;->i()Ll/txl0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object v0, p0, Ll/txl0;->c:Ljava/lang/Object;

    .line 41
    .line 42
    instance-of v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 43
    .line 44
    if-eqz v1, :cond_4

    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    if-nez v2, :cond_1

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :cond_1
    invoke-virtual {p1}, Ll/nh4;->e()Ll/mo0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1}, Ll/nh4;->k()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const/high16 v3, 0x42f00000    # 120.0f

    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    sget-object v1, Ll/nof;->a:Landroid/view/animation/PathInterpolator;

    .line 83
    .line 84
    invoke-virtual {p1, v1}, Ll/nh4;->p(Landroid/view/animation/Interpolator;)V

    .line 85
    .line 86
    .line 87
    const/4 v1, 0x1

    .line 88
    invoke-virtual {p1, v1}, Ll/nh4;->q(Z)V

    .line 89
    .line 90
    .line 91
    const/high16 v1, -0x3f600000    # -5.0f

    .line 92
    .line 93
    iput v1, v0, Ll/mo0;->h:F

    .line 94
    .line 95
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    int-to-float v1, v1

    .line 100
    iput v1, v0, Ll/mo0;->d:F

    .line 101
    .line 102
    iget v1, v0, Ll/mo0;->a:F

    .line 103
    .line 104
    iput v1, v0, Ll/mo0;->b:F

    .line 105
    .line 106
    const-wide/16 v3, 0x1c2

    .line 107
    .line 108
    invoke-virtual {p1, v3, v4}, Ll/nh4;->o(J)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/txl0;->a:Landroid/view/View;

    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getPivotX()F

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-virtual {p0}, Landroid/view/View;->getPivotY()F

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    iget v7, v0, Ll/mo0;->d:F

    .line 130
    .line 131
    iget v8, v0, Ll/mo0;->b:F

    .line 132
    .line 133
    iget v9, v0, Ll/mo0;->h:F

    .line 134
    .line 135
    invoke-static/range {v2 .. v9}, Ll/quq;->R(Lcom/p1/mobile/putong/data/User;IIFFFFF)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_2
    sget-object v1, Ll/nof;->b:Landroid/view/animation/PathInterpolator;

    .line 140
    .line 141
    invoke-virtual {p1, v1}, Ll/nh4;->p(Landroid/view/animation/Interpolator;)V

    .line 142
    .line 143
    .line 144
    iget v1, v0, Ll/mo0;->d:F

    .line 145
    .line 146
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    int-to-float v4, v4

    .line 151
    cmpl-float v1, v1, v4

    .line 152
    .line 153
    if-ltz v1, :cond_3

    .line 154
    .line 155
    iget v1, v0, Ll/mo0;->a:F

    .line 156
    .line 157
    iput v1, v0, Ll/mo0;->b:F

    .line 158
    .line 159
    :cond_3
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    int-to-float v1, v1

    .line 164
    iget v3, v0, Ll/mo0;->c:F

    .line 165
    .line 166
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    iput v1, v0, Ll/mo0;->d:F

    .line 171
    .line 172
    iget v3, v0, Ll/mo0;->c:F

    .line 173
    .line 174
    sub-float/2addr v1, v3

    .line 175
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    const/high16 v3, 0x40200000    # 2.5f

    .line 180
    .line 181
    mul-float/2addr v1, v3

    .line 182
    float-to-long v3, v1

    .line 183
    const-wide/16 v5, 0x64

    .line 184
    .line 185
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 186
    .line 187
    .line 188
    move-result-wide v3

    .line 189
    const-wide/16 v5, 0x190

    .line 190
    .line 191
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 192
    .line 193
    .line 194
    move-result-wide v3

    .line 195
    invoke-virtual {p1, v3, v4}, Ll/nh4;->o(J)V

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Ll/txl0;->a:Landroid/view/View;

    .line 199
    .line 200
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    invoke-virtual {p0}, Landroid/view/View;->getPivotX()F

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    invoke-virtual {p0}, Landroid/view/View;->getPivotY()F

    .line 213
    .line 214
    .line 215
    move-result v6

    .line 216
    iget v7, v0, Ll/mo0;->d:F

    .line 217
    .line 218
    iget v8, v0, Ll/mo0;->b:F

    .line 219
    .line 220
    iget v9, v0, Ll/mo0;->h:F

    .line 221
    .line 222
    invoke-static/range {v2 .. v9}, Ll/quq;->R(Lcom/p1/mobile/putong/data/User;IIFFFFF)V

    .line 223
    .line 224
    .line 225
    :cond_4
    :goto_0
    return-void
.end method

.method public g()J
    .locals 2

    .line 1
    sget-wide v0, Ll/vo0;->K:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public h()Z
    .locals 0

    .line 1
    sget-boolean p0, Ll/vo0;->M:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    sget-boolean p0, Ll/vo0;->L:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    sget-boolean p0, Ll/vo0;->J:Z

    .line 2
    .line 3
    return p0
.end method
