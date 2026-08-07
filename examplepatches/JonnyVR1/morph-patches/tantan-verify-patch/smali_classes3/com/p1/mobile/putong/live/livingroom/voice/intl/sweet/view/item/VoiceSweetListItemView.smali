.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

.field public final i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 9
    .line 10
    const/high16 v0, 0x424c0000    # 51.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sub-int/2addr p1, v0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->i:I

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 p2, 0x424c0000    # 51.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->i:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 p2, 0x424c0000    # 51.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->i:I

    return-void
.end method

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->otherUserId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p0p0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k0(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->g:Landroid/widget/TextView;

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    if-eq p1, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    sget v3, Ll/n9c0;->m0:I

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->f:Landroid/widget/TextView;

    .line 36
    .line 37
    sget v2, Ll/obc0;->ka:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->f:Landroid/widget/TextView;

    .line 43
    .line 44
    add-int/2addr p1, v0

    .line 45
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 53
    .line 54
    sget v0, Ll/obc0;->c8:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget v1, Ll/n9c0;->m0:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->d:Landroid/widget/ImageView;

    .line 79
    .line 80
    sget v0, Ll/obc0;->pa:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 83
    .line 84
    .line 85
    sget p1, Ll/obc0;->Y7:I

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    sget v0, Ll/n9c0;->u:I

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->f:Landroid/widget/TextView;

    .line 109
    .line 110
    sget v0, Ll/obc0;->ta:I

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 116
    .line 117
    sget v0, Ll/obc0;->b8:I

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    sget v1, Ll/n9c0;->u:I

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->d:Landroid/widget/ImageView;

    .line 142
    .line 143
    sget v0, Ll/obc0;->oa:I

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 146
    .line 147
    .line 148
    sget p1, Ll/obc0;->X7:I

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->g:Landroid/widget/TextView;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    sget v1, Ll/n9c0;->h:I

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->f:Landroid/widget/TextView;

    .line 174
    .line 175
    sget v0, Ll/obc0;->sa:I

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 181
    .line 182
    sget v0, Ll/obc0;->a8:I

    .line 183
    .line 184
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 188
    .line 189
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    sget v1, Ll/n9c0;->h:I

    .line 198
    .line 199
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 204
    .line 205
    .line 206
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->d:Landroid/widget/ImageView;

    .line 207
    .line 208
    sget v0, Ll/obc0;->na:I

    .line 209
    .line 210
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 211
    .line 212
    .line 213
    sget p1, Ll/obc0;->W7:I

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->g:Landroid/widget/TextView;

    .line 220
    .line 221
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    sget v1, Ll/n9c0;->q:I

    .line 230
    .line 231
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->f:Landroid/widget/TextView;

    .line 239
    .line 240
    sget v0, Ll/obc0;->ra:I

    .line 241
    .line 242
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 243
    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 246
    .line 247
    sget v0, Ll/obc0;->Z7:I

    .line 248
    .line 249
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    sget v1, Ll/n9c0;->q:I

    .line 263
    .line 264
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 269
    .line 270
    .line 271
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->d:Landroid/widget/ImageView;

    .line 272
    .line 273
    sget v0, Ll/obc0;->ma:I

    .line 274
    .line 275
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 276
    .line 277
    .line 278
    sget p1, Ll/obc0;->V7:I

    .line 279
    .line 280
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;ILl/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;",
            "I",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->houseRank:I

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->gg:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ":LV."

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->g:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->e:Landroid/widget/TextView;

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->kg:I

    .line 46
    .line 47
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v2, ":"

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    sget-object v2, Ll/mxo0;->Companion:Ll/mxo0$a;

    .line 60
    .line 61
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->cpLuxuryValue:D

    .line 62
    .line 63
    invoke-virtual {v2, v3, v4}, Ll/mxo0$a;->a(D)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v1, "LV."

    .line 80
    .line 81
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->houseRank:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->houseName:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 99
    .line 100
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->houseBackground:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->houseImage:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->meUserAvatar:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;->cpUserAvatar:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 112
    .line 113
    const/high16 v1, 0x428c0000    # 70.0f

    .line 114
    .line 115
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->c(II)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->e:Lv/VDraweeView;

    .line 129
    .line 130
    new-instance v1, Ll/n0p0;

    .line 131
    .line 132
    invoke-direct {v1, p3, p1}, Ll/n0p0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 139
    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->g:Lv/VDraweeView;

    .line 141
    .line 142
    new-instance v1, Ll/o0p0;

    .line 143
    .line 144
    invoke-direct {v1, p3, p1}, Ll/o0p0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->k0(I)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->i:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    new-array v2, v2, [Landroid/view/View;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    aput-object v1, v2, v3

    .line 16
    .line 17
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 21
    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->i:I

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    const/high16 v1, 0x3e800000    # 0.25f

    .line 26
    .line 27
    mul-float/2addr p0, v1

    .line 28
    float-to-int p0, p0

    .line 29
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
