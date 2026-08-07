.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;
.super Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;

.field public b:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public j:Lv/VText;

.field public k:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;[I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->k([I)V

    return-void
.end method

.method public static synthetic i(Ll/z20;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic k([I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->c:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->d:Landroid/view/View;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->d:Landroid/view/View;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sub-int/2addr v0, v1

    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->c:Landroid/view/View;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/high16 v1, 0x42cc0000    # 102.0f

    .line 50
    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    sub-int/2addr v0, v1

    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;

    .line 60
    .line 61
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v2, v4, v3}, Lcom/p1/mobile/putong/core/ui/PictureView;->c0(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->f:Lv/VText;

    .line 25
    .line 26
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 27
    .line 28
    sget v5, Ll/dbc0;->c4:I

    .line 29
    .line 30
    invoke-virtual {v4, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->f:Lv/VText;

    .line 38
    .line 39
    const-string v4, "\u9650\u5b9a\u514d\u8d39"

    .line 40
    .line 41
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sget v4, Ll/dbc0;->d4:I

    .line 49
    .line 50
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-virtual {v2, v3, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 63
    .line 64
    .line 65
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->f:Lv/VText;

    .line 66
    .line 67
    const/4 v5, 0x0

    .line 68
    invoke-virtual {v4, v2, v5, v5, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v4, "\u7acb\u5373\u514d\u8d39\u548c"

    .line 74
    .line 75
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v4, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 79
    .line 80
    const-string v5, "male"

    .line 81
    .line 82
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_1

    .line 87
    .line 88
    const-string v4, "\u4ed6"

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    const-string v4, "\u5979"

    .line 92
    .line 93
    :goto_0
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v4, "\u804a"

    .line 97
    .line 98
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->k:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->i:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 111
    .line 112
    const/4 v4, 0x1

    .line 113
    invoke-virtual {v2, v1, v3, v4, v4}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->q(Lcom/p1/mobile/putong/data/User;IZZ)V

    .line 114
    .line 115
    .line 116
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->j:Lv/VText;

    .line 117
    .line 118
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->j:Lv/VText;

    .line 126
    .line 127
    if-eqz v2, :cond_2

    .line 128
    .line 129
    const-string v2, "\u5979\u5728\u7b49\u4f60\u804a\u5929..."

    .line 130
    .line 131
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    const-string v2, "\u4ed6\u5728\u7b49\u4f60\u804a\u5929..."

    .line 136
    .line 137
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    :goto_1
    invoke-static {}, Ll/gra;->C2()Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    const/4 v5, 0x7

    .line 145
    const/4 v6, 0x6

    .line 146
    const/4 v7, 0x5

    .line 147
    const/4 v8, 0x4

    .line 148
    const/4 v9, 0x3

    .line 149
    const/4 v10, 0x2

    .line 150
    const/16 v11, 0x8

    .line 151
    .line 152
    const/4 v12, 0x0

    .line 153
    if-eqz v2, :cond_4

    .line 154
    .line 155
    sget v2, Ll/qa00;->o:I

    .line 156
    .line 157
    int-to-float v13, v2

    .line 158
    int-to-float v14, v2

    .line 159
    int-to-float v15, v2

    .line 160
    int-to-float v2, v2

    .line 161
    move/from16 p1, v4

    .line 162
    .line 163
    new-array v4, v11, [F

    .line 164
    .line 165
    aput v12, v4, v3

    .line 166
    .line 167
    aput v12, v4, p1

    .line 168
    .line 169
    aput v12, v4, v10

    .line 170
    .line 171
    aput v12, v4, v9

    .line 172
    .line 173
    aput v13, v4, v8

    .line 174
    .line 175
    aput v14, v4, v7

    .line 176
    .line 177
    aput v15, v4, v6

    .line 178
    .line 179
    aput v2, v4, v5

    .line 180
    .line 181
    const v2, -0xfcfcfd

    .line 182
    .line 183
    .line 184
    invoke-static {v2, v4}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    if-eqz v5, :cond_3

    .line 193
    .line 194
    new-array v4, v11, [F

    .line 195
    .line 196
    fill-array-data v4, :array_0

    .line 197
    .line 198
    .line 199
    invoke-static {v2, v4}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->d:Landroid/view/View;

    .line 204
    .line 205
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 206
    .line 207
    .line 208
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->c:Landroid/view/View;

    .line 209
    .line 210
    const/high16 v4, 0x42ce0000    # 103.0f

    .line 211
    .line 212
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    invoke-static {v2, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 217
    .line 218
    .line 219
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->c:Landroid/view/View;

    .line 220
    .line 221
    sget v4, Ll/dbc0;->Y1:I

    .line 222
    .line 223
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 224
    .line 225
    .line 226
    goto :goto_2

    .line 227
    :cond_4
    move/from16 p1, v4

    .line 228
    .line 229
    sget v2, Ll/qa00;->o:I

    .line 230
    .line 231
    int-to-float v4, v2

    .line 232
    int-to-float v13, v2

    .line 233
    int-to-float v14, v2

    .line 234
    int-to-float v2, v2

    .line 235
    new-array v11, v11, [F

    .line 236
    .line 237
    aput v12, v11, v3

    .line 238
    .line 239
    aput v12, v11, p1

    .line 240
    .line 241
    aput v12, v11, v10

    .line 242
    .line 243
    aput v12, v11, v9

    .line 244
    .line 245
    aput v4, v11, v8

    .line 246
    .line 247
    aput v13, v11, v7

    .line 248
    .line 249
    aput v14, v11, v6

    .line 250
    .line 251
    aput v2, v11, v5

    .line 252
    .line 253
    const v2, -0xd2d2d3

    .line 254
    .line 255
    .line 256
    invoke-static {v2, v11}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->d:Landroid/view/View;

    .line 261
    .line 262
    invoke-virtual {v4, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 263
    .line 264
    .line 265
    :goto_2
    invoke-static {}, Ll/nrb0;->b()Z

    .line 266
    .line 267
    .line 268
    move-result v2

    .line 269
    if-eqz v2, :cond_6

    .line 270
    .line 271
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    instance-of v2, v2, Lcom/p1/mobile/android/app/Act;

    .line 276
    .line 277
    if-eqz v2, :cond_6

    .line 278
    .line 279
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->g:Lv/VLinear;

    .line 280
    .line 281
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 282
    .line 283
    .line 284
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->g:Lv/VLinear;

    .line 285
    .line 286
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    if-lez v2, :cond_5

    .line 291
    .line 292
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->g:Lv/VLinear;

    .line 293
    .line 294
    sget v3, Ll/adc0;->X0:I

    .line 295
    .line 296
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v3

    .line 304
    if-eqz v3, :cond_5

    .line 305
    .line 306
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->g:Lv/VLinear;

    .line 307
    .line 308
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 309
    .line 310
    .line 311
    :cond_5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 316
    .line 317
    sget-object v3, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->CARD:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 318
    .line 319
    invoke-static {v2, v1, v3}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->g:Lv/VLinear;

    .line 324
    .line 325
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v3

    .line 329
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 330
    .line 331
    .line 332
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 333
    .line 334
    .line 335
    move-result v2

    .line 336
    if-eqz v2, :cond_6

    .line 337
    .line 338
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->g:Lv/VLinear;

    .line 339
    .line 340
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 341
    .line 342
    .line 343
    :cond_6
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 344
    .line 345
    new-instance v2, Ll/ku50;

    .line 346
    .line 347
    invoke-direct {v2, v0}, Ll/ku50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;)V

    .line 348
    .line 349
    .line 350
    invoke-static {v1, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 351
    .line 352
    .line 353
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->k:Lv/VText;

    .line 354
    .line 355
    new-instance v1, Ll/lu50;

    .line 356
    .line 357
    move-object/from16 v2, p2

    .line 358
    .line 359
    invoke-direct {v1, v2}, Ll/lu50;-><init>(Ll/z20;)V

    .line 360
    .line 361
    .line 362
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    nop

    .line 367
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mu50;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1, v0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->L(ZZZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
