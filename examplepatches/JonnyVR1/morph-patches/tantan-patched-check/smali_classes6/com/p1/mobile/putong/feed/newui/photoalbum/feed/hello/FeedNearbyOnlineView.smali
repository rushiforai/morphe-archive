.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VLinear;

.field public g:Lv/VDraweeView;

.field public h:Lv/VLinear;

.field public i:Lv/VDraweeView;

.field public j:Lv/VLinear;

.field public k:Lv/VDraweeView;

.field public l:Lv/VImage;

.field public m:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->z(Landroid/view/View;)V

    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_nearby_online"

    .line 2
    .line 3
    const-string v0, "p_nearby"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Landroid/content/Intent;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-class v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedHelloNearbyOnlineAct;

    .line 19
    .line 20
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/feed/data/NearbyOnline;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->H(Lcom/p1/mobile/putong/feed/data/NearbyOnline;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->m:Lv/VText;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "\u9644\u8fd1 "

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userCount:I

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " \u4eba\u5728\u7ebf"

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 37
    .line 38
    new-instance v0, Ll/tjh;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/tjh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/feed/data/NearbyOnline;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userIds:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eq v0, v1, :cond_c

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userIds:Ljava/util/List;

    .line 21
    .line 22
    const/4 v4, 0x2

    .line 23
    if-eq v0, v4, :cond_7

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 26
    .line 27
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 38
    .line 39
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userIds:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    check-cast v5, Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v3, v5}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget-object v5, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userIds:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v5, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    if-nez v3, :cond_1

    .line 68
    .line 69
    if-nez p1, :cond_1

    .line 70
    .line 71
    goto/16 :goto_3

    .line 72
    .line 73
    :cond_1
    new-instance v5, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_2

    .line 83
    .line 84
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    :cond_2
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :cond_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_4
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-ne p1, v1, :cond_5

    .line 110
    .line 111
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->g:Lv/VDraweeView;

    .line 114
    .line 115
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {p1, v0, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->f:Lv/VLinear;

    .line 133
    .line 134
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->h:Lv/VLinear;

    .line 138
    .line 139
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->j:Lv/VLinear;

    .line 143
    .line 144
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    :cond_5
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-ne p1, v4, :cond_6

    .line 152
    .line 153
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->g:Lv/VDraweeView;

    .line 156
    .line 157
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 162
    .line 163
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {p1, v0, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 172
    .line 173
    .line 174
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->i:Lv/VDraweeView;

    .line 177
    .line 178
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 183
    .line 184
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {p1, v0, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->f:Lv/VLinear;

    .line 196
    .line 197
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->h:Lv/VLinear;

    .line 201
    .line 202
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->j:Lv/VLinear;

    .line 206
    .line 207
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    :cond_6
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    const/4 v0, 0x3

    .line 215
    if-ne p1, v0, :cond_d

    .line 216
    .line 217
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 218
    .line 219
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->g:Lv/VDraweeView;

    .line 220
    .line 221
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 226
    .line 227
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {p1, v0, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 236
    .line 237
    .line 238
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 239
    .line 240
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->i:Lv/VDraweeView;

    .line 241
    .line 242
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 247
    .line 248
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-virtual {p1, v0, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 257
    .line 258
    .line 259
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 260
    .line 261
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->k:Lv/VDraweeView;

    .line 262
    .line 263
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 268
    .line 269
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-virtual {p1, v0, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->f:Lv/VLinear;

    .line 281
    .line 282
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 283
    .line 284
    .line 285
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->h:Lv/VLinear;

    .line 286
    .line 287
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 288
    .line 289
    .line 290
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->j:Lv/VLinear;

    .line 291
    .line 292
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 297
    .line 298
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    check-cast v3, Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {v0, v3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 309
    .line 310
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userIds:Ljava/util/List;

    .line 311
    .line 312
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    check-cast p1, Ljava/lang/String;

    .line 317
    .line 318
    invoke-virtual {v3, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    if-nez v0, :cond_8

    .line 323
    .line 324
    if-nez p1, :cond_8

    .line 325
    .line 326
    goto :goto_3

    .line 327
    :cond_8
    if-eqz v0, :cond_a

    .line 328
    .line 329
    if-nez p1, :cond_9

    .line 330
    .line 331
    goto :goto_0

    .line 332
    :cond_9
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 333
    .line 334
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->g:Lv/VDraweeView;

    .line 335
    .line 336
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    invoke-virtual {v3, v4, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 345
    .line 346
    .line 347
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 348
    .line 349
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->i:Lv/VDraweeView;

    .line 350
    .line 351
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-virtual {p1, v3, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 360
    .line 361
    .line 362
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->f:Lv/VLinear;

    .line 363
    .line 364
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 365
    .line 366
    .line 367
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->h:Lv/VLinear;

    .line 368
    .line 369
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 370
    .line 371
    .line 372
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->j:Lv/VLinear;

    .line 373
    .line 374
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 375
    .line 376
    .line 377
    return-void

    .line 378
    :cond_a
    :goto_0
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 379
    .line 380
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->g:Lv/VDraweeView;

    .line 381
    .line 382
    if-nez v0, :cond_b

    .line 383
    .line 384
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    goto :goto_2

    .line 393
    :cond_b
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    goto :goto_1

    .line 398
    :goto_2
    invoke-virtual {v3, v4, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 399
    .line 400
    .line 401
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->f:Lv/VLinear;

    .line 402
    .line 403
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 404
    .line 405
    .line 406
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->h:Lv/VLinear;

    .line 407
    .line 408
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 409
    .line 410
    .line 411
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->j:Lv/VLinear;

    .line 412
    .line 413
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 414
    .line 415
    .line 416
    return-void

    .line 417
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 418
    .line 419
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userIds:Ljava/util/List;

    .line 420
    .line 421
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object p1

    .line 425
    check-cast p1, Ljava/lang/String;

    .line 426
    .line 427
    invoke-virtual {v0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 428
    .line 429
    .line 430
    move-result-object p1

    .line 431
    if-nez p1, :cond_e

    .line 432
    .line 433
    :cond_d
    :goto_3
    return-void

    .line 434
    :cond_e
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 435
    .line 436
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->g:Lv/VDraweeView;

    .line 437
    .line 438
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 439
    .line 440
    .line 441
    move-result-object p1

    .line 442
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 443
    .line 444
    .line 445
    move-result-object p1

    .line 446
    invoke-virtual {v0, v3, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 447
    .line 448
    .line 449
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->f:Lv/VLinear;

    .line 450
    .line 451
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 452
    .line 453
    .line 454
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->h:Lv/VLinear;

    .line 455
    .line 456
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 457
    .line 458
    .line 459
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->j:Lv/VLinear;

    .line 460
    .line 461
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 462
    .line 463
    .line 464
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->q(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ujh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
