.class public Ll/qop0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/widget/RelativeLayout;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

.field public c:Ll/h64;

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/qop0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/qop0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/qop0;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    iput-object p2, p0, Ll/qop0;->c:Ll/h64;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic H(Ll/qop0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qop0;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/qop0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qop0;->L(Landroid/view/View;)V

    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-static {p1}, Ll/u54;->r(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/u54;->q(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/qop0;->d:Ll/y20;

    .line 18
    .line 19
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {v0}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 30
    .line 31
    invoke-static {p1}, Ll/u54;->i(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void

    .line 39
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/qop0;->e:Ll/y20;

    .line 40
    .line 41
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qop0;->f:Ll/y20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public J()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public K()Ll/h64;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qop0;->c:Ll/h64;

    .line 2
    .line 3
    return-object p0
.end method

.method public O(Landroid/widget/RelativeLayout;)V
    .locals 13

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->S2:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    sget v1, Ll/mdc0;->p7:I

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/TextView;

    .line 19
    .line 20
    sget v2, Ll/mdc0;->l7:I

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/widget/TextView;

    .line 27
    .line 28
    sget v3, Ll/mdc0;->r7:I

    .line 29
    .line 30
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/widget/TextView;

    .line 35
    .line 36
    sget v4, Ll/mdc0;->R2:I

    .line 37
    .line 38
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    move-object v5, v4

    .line 43
    check-cast v5, Landroid/widget/ImageView;

    .line 44
    .line 45
    sget v4, Ll/mdc0;->H1:I

    .line 46
    .line 47
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Landroid/widget/FrameLayout;

    .line 52
    .line 53
    iget-object v6, p0, Ll/qop0;->c:Ll/h64;

    .line 54
    .line 55
    iget-object v6, v6, Ll/h64;->c:Ljava/lang/String;

    .line 56
    .line 57
    const-string v7, "context_single_room"

    .line 58
    .line 59
    invoke-static {v7, v0, v6}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v6, p0, Ll/qop0;->c:Ll/h64;

    .line 63
    .line 64
    iget-object v6, v6, Ll/h64;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5}, Landroid/view/View;->clearAnimation()V

    .line 70
    .line 71
    .line 72
    const/4 v1, 0x0

    .line 73
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    iget-object v6, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 85
    .line 86
    iget-wide v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 87
    .line 88
    long-to-double v6, v6

    .line 89
    invoke-static {v6, v7}, Ll/yau;->c(D)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->V5:I

    .line 101
    .line 102
    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 117
    .line 118
    invoke-static {p1}, Ll/u54;->r(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    const/4 v1, 0x1

    .line 123
    if-eqz p1, :cond_1

    .line 124
    .line 125
    sget p1, Ll/obc0;->z0:I

    .line 126
    .line 127
    invoke-virtual {v4, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 131
    .line 132
    invoke-static {p1}, Ll/u54;->p(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    const/4 v2, -0x1

    .line 137
    if-eqz p1, :cond_0

    .line 138
    .line 139
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->B:I

    .line 143
    .line 144
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_0
    iget-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 152
    .line 153
    invoke-static {p1}, Ll/u54;->q(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_3

    .line 158
    .line 159
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    new-instance v11, Landroid/view/animation/LinearInterpolator;

    .line 163
    .line 164
    invoke-direct {v11}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 165
    .line 166
    .line 167
    const/4 p1, 0x2

    .line 168
    new-array v12, p1, [F

    .line 169
    .line 170
    fill-array-data v12, :array_0

    .line 171
    .line 172
    .line 173
    const-string v6, "rotation"

    .line 174
    .line 175
    const-wide/16 v7, 0x0

    .line 176
    .line 177
    const-wide/16 v9, 0x258

    .line 178
    .line 179
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    check-cast p1, Landroid/animation/ObjectAnimator;

    .line 184
    .line 185
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 189
    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_1
    iget-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 193
    .line 194
    invoke-static {p1}, Ll/u54;->i(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-nez p1, :cond_2

    .line 199
    .line 200
    iget-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 201
    .line 202
    invoke-static {p1}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    if-eqz p1, :cond_3

    .line 207
    .line 208
    :cond_2
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 209
    .line 210
    .line 211
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z4:I

    .line 212
    .line 213
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 214
    .line 215
    .line 216
    sget p1, Ll/obc0;->E7:I

    .line 217
    .line 218
    invoke-virtual {v4, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 219
    .line 220
    .line 221
    const p1, -0xdededf

    .line 222
    .line 223
    .line 224
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 225
    .line 226
    .line 227
    :cond_3
    :goto_0
    new-instance p1, Ll/oop0;

    .line 228
    .line 229
    invoke-direct {p1, p0}, Ll/oop0;-><init>(Ll/qop0;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    .line 234
    .line 235
    new-instance p1, Ll/pop0;

    .line 236
    .line 237
    invoke-direct {p1, p0}, Ll/pop0;-><init>(Ll/qop0;)V

    .line 238
    .line 239
    .line 240
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 241
    .line 242
    .line 243
    return-void

    .line 244
    nop

    .line 245
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method public P(Ll/y20;)Ll/qop0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/qop0;",
            ">;)",
            "Ll/qop0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qop0;->d:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q(Ll/y20;)Ll/qop0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/qop0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qop0;->f:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public R(Ll/y20;)Ll/qop0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/qop0;",
            ">;)",
            "Ll/qop0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qop0;->e:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public S(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qop0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qop0;->O(Landroid/widget/RelativeLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
