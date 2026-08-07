.class public Ll/o4n0;
.super Ll/l4n0;
.source "SourceFile"


# instance fields
.field public p:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/l4n0;-><init>(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/o4n0;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o4n0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/o4n0;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o4n0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public c()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/l4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 2
    .line 3
    const-string v1, "context_livingAct"

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->businessInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceBusinessInfo;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceBusinessInfo;->logUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object v3, p0, Ll/l4n0;->e:Lv/VDraweeView;

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    sget v2, Ll/nbc0;->k1:I

    .line 22
    .line 23
    invoke-virtual {v3, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceBusinessInfo;->logUrl:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v3, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object v2, p0, Ll/l4n0;->f:Landroid/widget/TextView;

    .line 33
    .line 34
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceBusinessInfo;->title:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Ll/l4n0;->g:Lv/VText;

    .line 40
    .line 41
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceBusinessInfo;->subTitle:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Ll/l4n0;->m:Lv/VText;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceBusinessInfo;->userAreaSubTitle:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Ll/l4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 54
    .line 55
    if-eqz v0, :cond_8

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;

    .line 58
    .line 59
    if-eqz v0, :cond_8

    .line 60
    .line 61
    iget-object v2, p0, Ll/l4n0;->h:Lv/VDraweeView;

    .line 62
    .line 63
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->profilePicture:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/l4n0;->i:Landroid/widget/TextView;

    .line 69
    .line 70
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->name:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/l4n0;->l:Lv/VText;

    .line 76
    .line 77
    iget-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->onCall:Z

    .line 78
    .line 79
    const/4 v3, 0x4

    .line 80
    const/4 v4, 0x0

    .line 81
    if-eqz v2, :cond_2

    .line 82
    .line 83
    move v2, v4

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    move v2, v3

    .line 86
    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->verificationStatus:Z

    .line 90
    .line 91
    if-eqz v1, :cond_3

    .line 92
    .line 93
    iget-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->verificationStatusPicture:Z

    .line 94
    .line 95
    if-eqz v2, :cond_3

    .line 96
    .line 97
    iget-object v1, p0, Ll/l4n0;->j:Lv/VImage;

    .line 98
    .line 99
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Ll/l4n0;->j:Lv/VImage;

    .line 103
    .line 104
    sget v2, Ll/nbc0;->l1:I

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_3
    if-eqz v1, :cond_4

    .line 111
    .line 112
    iget-object v1, p0, Ll/l4n0;->j:Lv/VImage;

    .line 113
    .line 114
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Ll/l4n0;->j:Lv/VImage;

    .line 118
    .line 119
    sget v2, Ll/nbc0;->l1:I

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_4
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->verificationStatusPicture:Z

    .line 126
    .line 127
    iget-object v2, p0, Ll/l4n0;->j:Lv/VImage;

    .line 128
    .line 129
    if-eqz v1, :cond_5

    .line 130
    .line 131
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Ll/l4n0;->j:Lv/VImage;

    .line 135
    .line 136
    sget v2, Ll/nbc0;->j1:I

    .line 137
    .line 138
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_5
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    :goto_2
    iget-object v1, p0, Ll/l4n0;->k:Lv/VText;

    .line 146
    .line 147
    sget-object v2, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 148
    .line 149
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->city:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->distance:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    const-string v5, ""

    .line 158
    .line 159
    if-eqz v4, :cond_6

    .line 160
    .line 161
    move-object v4, v5

    .line 162
    goto :goto_3

    .line 163
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string v6, "(\u8ddd\u79bb"

    .line 166
    .line 167
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->distance:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v6, ")"

    .line 176
    .line 177
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    :goto_3
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->constellation:Ljava/lang/String;

    .line 185
    .line 186
    iget v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->age:I

    .line 187
    .line 188
    if-lez v7, :cond_7

    .line 189
    .line 190
    new-instance v5, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v7, "\u00b7"

    .line 193
    .line 194
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->age:I

    .line 198
    .line 199
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v0, "\u5c81"

    .line 203
    .line 204
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    :cond_7
    filled-new-array {v3, v4, v6, v5}, [Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    const-string v3, "%s%s\u00b7%s%s"

    .line 216
    .line 217
    invoke-static {v2, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    .line 223
    .line 224
    :cond_8
    iget-object v0, p0, Ll/l4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 225
    .line 226
    if-eqz v0, :cond_9

    .line 227
    .line 228
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->actionButton:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;

    .line 229
    .line 230
    if-eqz v0, :cond_9

    .line 231
    .line 232
    iget-object v1, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 233
    .line 234
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;->title:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    .line 238
    .line 239
    iget-object v1, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 240
    .line 241
    new-instance v2, Ll/m4n0;

    .line 242
    .line 243
    invoke-direct {v2, p0, v0}, Ll/m4n0;-><init>(Ll/o4n0;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;)V

    .line 244
    .line 245
    .line 246
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 247
    .line 248
    .line 249
    iget-object v1, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 250
    .line 251
    new-instance v2, Ll/n4n0;

    .line 252
    .line 253
    invoke-direct {v2, p0, v0}, Ll/n4n0;-><init>(Ll/o4n0;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;)V

    .line 254
    .line 255
    .line 256
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 257
    .line 258
    .line 259
    :cond_9
    invoke-virtual {p0}, Ll/o4n0;->g()Z

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Ll/l4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 263
    .line 264
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->liveId:Ljava/lang/String;

    .line 265
    .line 266
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 267
    .line 268
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->voiceTemplate:Ljava/lang/String;

    .line 271
    .line 272
    iget-boolean v4, p0, Ll/o4n0;->p:Z

    .line 273
    .line 274
    const/4 v5, 0x0

    .line 275
    const-string v6, "NA"

    .line 276
    .line 277
    invoke-static/range {v1 .. v6}, Ll/s4n0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    .line 278
    .line 279
    .line 280
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;->jump:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/s4n0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/l4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->liveId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->voiceTemplate:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean v3, p0, Ll/o4n0;->p:Z

    .line 23
    .line 24
    iget v5, p0, Ll/l4n0;->a:I

    .line 25
    .line 26
    const-string v6, "NA"

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-static/range {v0 .. v6}, Ll/s4n0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final g()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceUser;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Ll/o4n0;->p:Z

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Ll/o4n0;->p:Z

    .line 25
    .line 26
    :goto_1
    iget-boolean p0, p0, Ll/o4n0;->p:Z

    .line 27
    .line 28
    return p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o4n0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o4n0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
