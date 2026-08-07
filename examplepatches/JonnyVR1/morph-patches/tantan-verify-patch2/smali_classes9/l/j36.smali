.class public Ll/j36;
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
.field public a:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Ll/d36$b;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/d36$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j36;->a:Ll/nsv;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H(Ll/d36$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d36$b;->d:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->imageUrl:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic I(Ll/j36;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/j36;->J(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic J(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j36;->b:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K(Landroid/widget/RelativeLayout;)V
    .locals 16
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, v0, Ll/j36;->a:Ll/nsv;

    .line 9
    .line 10
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 11
    .line 12
    move-object v3, v2

    .line 13
    check-cast v3, Ll/d36$b;

    .line 14
    .line 15
    iget-object v3, v3, Ll/d36$b;->d:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 16
    .line 17
    move-object v4, v2

    .line 18
    check-cast v4, Ll/d36$b;

    .line 19
    .line 20
    iget-object v4, v4, Ll/d36$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 21
    .line 22
    check-cast v2, Ll/d36$b;

    .line 23
    .line 24
    iget-object v2, v2, Ll/d36$b;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;

    .line 25
    .line 26
    sget v5, Ll/mdc0;->S2:I

    .line 27
    .line 28
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    check-cast v5, Lv/VDraweeView;

    .line 33
    .line 34
    sget v6, Ll/mdc0;->p7:I

    .line 35
    .line 36
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    check-cast v6, Landroid/widget/TextView;

    .line 41
    .line 42
    sget v7, Ll/mdc0;->b7:I

    .line 43
    .line 44
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    check-cast v7, Landroid/widget/TextView;

    .line 49
    .line 50
    sget v8, Ll/mdc0;->Q7:I

    .line 51
    .line 52
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    check-cast v8, Lv/VDraweeView;

    .line 57
    .line 58
    sget v9, Ll/mdc0;->k7:I

    .line 59
    .line 60
    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v9

    .line 64
    check-cast v9, Landroid/widget/TextView;

    .line 65
    .line 66
    sget v10, Ll/mdc0;->u7:I

    .line 67
    .line 68
    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v10

    .line 72
    check-cast v10, Lv/VText;

    .line 73
    .line 74
    sget v11, Ll/mdc0;->I3:I

    .line 75
    .line 76
    invoke-virtual {v1, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v11

    .line 80
    check-cast v11, Landroid/widget/LinearLayout;

    .line 81
    .line 82
    sget v12, Ll/mdc0;->d4:I

    .line 83
    .line 84
    invoke-virtual {v1, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v12

    .line 88
    check-cast v12, Lv/VImage;

    .line 89
    .line 90
    sget v13, Ll/mdc0;->o6:I

    .line 91
    .line 92
    invoke-virtual {v1, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v13

    .line 96
    check-cast v13, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 97
    .line 98
    iget-object v14, v0, Ll/j36;->a:Ll/nsv;

    .line 99
    .line 100
    invoke-static {v14}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 101
    .line 102
    .line 103
    move-result-object v14

    .line 104
    invoke-virtual {v14}, Ll/e3t;->d()Z

    .line 105
    .line 106
    .line 107
    move-result v14

    .line 108
    const/4 v15, 0x0

    .line 109
    if-eqz v14, :cond_0

    .line 110
    .line 111
    invoke-static {v11, v15}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    const/4 v14, 0x1

    .line 115
    invoke-static {v12, v14}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_0
    const/4 v14, 0x1

    .line 120
    invoke-static {v11, v14}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    invoke-static {v12, v15}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v8, v2}, Ll/j36;->O(Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v0, v2, v7, v3}, Ll/j36;->L(Landroid/content/Context;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;)V

    .line 134
    .line 135
    .line 136
    :goto_0
    iget-object v2, v0, Ll/j36;->a:Ll/nsv;

    .line 137
    .line 138
    new-instance v7, Ll/h36;

    .line 139
    .line 140
    invoke-direct {v7}, Ll/h36;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-static {v5, v2, v7}, Ll/ql3;->c(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/nsv;Ll/qcj;)V

    .line 144
    .line 145
    .line 146
    iget-object v2, v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->name:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    iget v2, v4, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->rank:I

    .line 152
    .line 153
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v13, v10, v2, v1}, Ll/j36;->N(Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;ILandroid/content/Context;)V

    .line 158
    .line 159
    .line 160
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1}, Ll/p6s;->s0()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_1

    .line 169
    .line 170
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->C7:I

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_1
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V5:I

    .line 174
    .line 175
    :goto_1
    invoke-static {v1}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    sget-object v2, Ll/htd0;->f:Ll/htd0;

    .line 180
    .line 181
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    check-cast v2, Ll/civ;

    .line 186
    .line 187
    invoke-virtual {v2}, Ll/civ;->n()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-eqz v2, :cond_2

    .line 192
    .line 193
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Td:I

    .line 194
    .line 195
    invoke-static {v1}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .line 203
    .line 204
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->amount:Ljava/lang/String;

    .line 205
    .line 206
    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 211
    .line 212
    .line 213
    move-result-wide v6

    .line 214
    long-to-double v6, v6

    .line 215
    invoke-static {v6, v7}, Ll/yau;->c(D)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    .line 231
    .line 232
    new-instance v1, Ll/i36;

    .line 233
    .line 234
    invoke-direct {v1, v0, v3}, Ll/i36;-><init>(Ll/j36;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;)V

    .line 235
    .line 236
    .line 237
    invoke-static {v5, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public final L(Landroid/content/Context;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->gender:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "female"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget v0, Ll/obc0;->V5:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v0, Ll/obc0;->T5:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p2, p1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    const p0, -0xa18f02

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const p0, -0x7c767

    .line 31
    .line 32
    .line 33
    :goto_1
    const/high16 p1, 0x40a00000    # 5.0f

    .line 34
    .line 35
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    int-to-float p1, p1

    .line 40
    invoke-static {p0, p1}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    iget p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->age:I

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, ""

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;ILandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p4, p1, p2, p3}, Ll/okc0;->e(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final O(Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;)V
    .locals 2

    .line 1
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hiv;

    .line 8
    .line 9
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;->grade:I

    .line 10
    .line 11
    int-to-long v0, v0

    .line 12
    invoke-virtual {p0, v0, v1}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;->grade:I

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const-string p2, "context_livingAct"

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2, p1, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public P(Ll/y20;)Ll/j36;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/j36;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/j36;->b:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j36;->K(Landroid/widget/RelativeLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
