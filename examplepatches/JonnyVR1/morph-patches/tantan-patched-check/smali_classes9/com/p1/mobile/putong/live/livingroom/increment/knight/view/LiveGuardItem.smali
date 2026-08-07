.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VDraweeView;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Landroidx/constraintlayout/widget/Group;

.field public p:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic h0(Ll/y20;Ll/g2t;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/g2t;->b:Ll/nsv;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hts;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Ll/g2t;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/g2t;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Ll/g2t;->b:Ll/nsv;

    .line 4
    .line 5
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "context_livingAct"

    .line 16
    .line 17
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->i:Lv/VText;

    .line 21
    .line 22
    iget-object v1, p1, Ll/g2t;->b:Ll/nsv;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Ll/g2t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->m:Lv/VText;

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->pe:I

    .line 48
    .line 49
    invoke-static {v3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->n:Lv/VText;

    .line 64
    .line 65
    invoke-static {}, Ll/u8n;->a()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_0

    .line 70
    .line 71
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ed:I

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Dd:I

    .line 75
    .line 76
    :goto_0
    iget-object v3, p1, Ll/g2t;->d:Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 77
    .line 78
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->knightCoins:I

    .line 79
    .line 80
    iget v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 81
    .line 82
    sub-int/2addr v3, v4

    .line 83
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-static {v2, v3}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p1, Ll/g2t;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 95
    .line 96
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    .line 97
    .line 98
    .line 99
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 100
    .line 101
    const/4 v2, 0x1

    .line 102
    const/4 v3, 0x0

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->o:Landroidx/constraintlayout/widget/Group;

    .line 106
    .line 107
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->p:Lv/VText;

    .line 111
    .line 112
    iget-boolean v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 113
    .line 114
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->f:Landroid/widget/RelativeLayout;

    .line 118
    .line 119
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->h:Lv/VText;

    .line 123
    .line 124
    new-instance v2, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 130
    .line 131
    long-to-double v3, v3

    .line 132
    invoke-static {v3, v4}, Ll/fvk;->p(D)I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->h:I

    .line 140
    .line 141
    invoke-static {v3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 156
    .line 157
    invoke-static {v0}, Ll/lsw$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->f:Landroid/widget/RelativeLayout;

    .line 162
    .line 163
    if-eqz v0, :cond_1

    .line 164
    .line 165
    sget v0, Ll/obc0;->d0:I

    .line 166
    .line 167
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->e:Lv/VImage;

    .line 171
    .line 172
    sget v1, Ll/obc0;->h:I

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->g:Lv/VImage;

    .line 178
    .line 179
    sget v1, Ll/obc0;->I2:I

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->h:Lv/VText;

    .line 185
    .line 186
    const-string v1, "#3253e1"

    .line 187
    .line 188
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_1
    sget v0, Ll/obc0;->f0:I

    .line 197
    .line 198
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->e:Lv/VImage;

    .line 202
    .line 203
    sget v1, Ll/obc0;->g:I

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->g:Lv/VImage;

    .line 209
    .line 210
    sget v1, Ll/obc0;->D2:I

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->h:Lv/VText;

    .line 216
    .line 217
    const-string v1, "#9f00d1"

    .line 218
    .line 219
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 224
    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->e:Lv/VImage;

    .line 228
    .line 229
    const/4 v1, 0x0

    .line 230
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->f:Landroid/widget/RelativeLayout;

    .line 234
    .line 235
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->o:Landroidx/constraintlayout/widget/Group;

    .line 239
    .line 240
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->p:Lv/VText;

    .line 244
    .line 245
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    :goto_1
    new-instance v0, Ll/gts;

    .line 249
    .line 250
    invoke-direct {v0, p2, p1}, Ll/gts;-><init>(Ll/y20;Ll/g2t;)V

    .line 251
    .line 252
    .line 253
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method public final k0(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->k:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 18
    .line 19
    const-wide/16 v2, 0x2b

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-ltz v0, :cond_0

    .line 24
    .line 25
    sget v0, Ll/i0k;->b:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget v0, Ll/i0k;->a:I

    .line 29
    .line 30
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->k:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->k:Lv/VDraweeView;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
