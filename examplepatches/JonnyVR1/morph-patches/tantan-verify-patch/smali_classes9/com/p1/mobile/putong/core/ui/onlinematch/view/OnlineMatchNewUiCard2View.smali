.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;
.super Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

.field public b:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/android/ui/label/CommonLabelView;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public m:Lv/VFrame;

.field public n:Lv/VText;


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

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;[I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->k([I)V

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
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->c:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->d:Landroid/view/View;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sget v1, Ll/qa00;->f:I

    .line 21
    .line 22
    sub-int/2addr v0, v1

    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->d:Landroid/view/View;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    sub-int/2addr v0, v2

    .line 41
    add-int/2addr v0, v1

    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->c:Landroid/view/View;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/high16 v1, 0x42ce0000    # 103.0f

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    sub-int/2addr v0, v1

    .line 60
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 64
    .line 65
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
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
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

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
    const/4 v5, 0x1

    .line 22
    invoke-virtual {v2, v4, v5}, Lcom/p1/mobile/putong/core/ui/PictureView;->c0(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 26
    .line 27
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 28
    .line 29
    sget v6, Ll/dbc0;->Y3:I

    .line 30
    .line 31
    invoke-virtual {v4, v6}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 39
    .line 40
    const-string v4, "\u95ea\u804a\u5339\u914d"

    .line 41
    .line 42
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    sget v4, Ll/dbc0;->b4:I

    .line 50
    .line 51
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    invoke-virtual {v2, v3, v3, v4, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 64
    .line 65
    .line 66
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 67
    .line 68
    const/4 v6, 0x0

    .line 69
    invoke-virtual {v4, v2, v6, v6, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ll/gra;->z()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 79
    .line 80
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->g:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 84
    .line 85
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 89
    .line 90
    const-string v4, "male"

    .line 91
    .line 92
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_2

    .line 97
    .line 98
    const-string v2, "\u4ed6"

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    const-string v2, "\u5979"

    .line 102
    .line 103
    :goto_0
    const-string v4, "\u7acb\u5373\u95ea\u804a\u8ba4\u8bc6"

    .line 104
    .line 105
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->n:Lv/VText;

    .line 110
    .line 111
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 117
    .line 118
    invoke-static {v1}, Ll/wtd0;->d(Lcom/p1/mobile/putong/data/User;)J

    .line 119
    .line 120
    .line 121
    move-result-wide v6

    .line 122
    long-to-double v6, v6

    .line 123
    invoke-virtual {v2, v1, v6, v7}, Lcom/p1/mobile/putong/core/api/f;->i3(Lcom/p1/mobile/putong/data/User;D)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->i:Lv/VText;

    .line 128
    .line 129
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 133
    .line 134
    invoke-virtual {v2, v1, v3, v5, v5}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->q(Lcom/p1/mobile/putong/data/User;IZZ)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    instance-of v2, v2, Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    if-eqz v2, :cond_3

    .line 144
    .line 145
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 150
    .line 151
    new-instance v4, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;

    .line 152
    .line 153
    invoke-direct {v4, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;Lcom/p1/mobile/putong/data/User;)V

    .line 154
    .line 155
    .line 156
    invoke-static {v2, v1, v4}, Ll/nnm;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 157
    .line 158
    .line 159
    :cond_3
    invoke-static {}, Ll/gra;->C2()Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    const/4 v6, 0x6

    .line 164
    const/4 v7, 0x5

    .line 165
    const/4 v8, 0x4

    .line 166
    const/4 v9, 0x3

    .line 167
    const/4 v10, 0x2

    .line 168
    const/16 v11, 0x8

    .line 169
    .line 170
    const/4 v12, 0x0

    .line 171
    if-eqz v2, :cond_5

    .line 172
    .line 173
    sget v2, Ll/qa00;->o:I

    .line 174
    .line 175
    int-to-float v13, v2

    .line 176
    int-to-float v14, v2

    .line 177
    int-to-float v15, v2

    .line 178
    int-to-float v2, v2

    .line 179
    const/16 p1, 0x7

    .line 180
    .line 181
    new-array v4, v11, [F

    .line 182
    .line 183
    aput v12, v4, v3

    .line 184
    .line 185
    aput v12, v4, v5

    .line 186
    .line 187
    aput v12, v4, v10

    .line 188
    .line 189
    aput v12, v4, v9

    .line 190
    .line 191
    aput v13, v4, v8

    .line 192
    .line 193
    aput v14, v4, v7

    .line 194
    .line 195
    aput v15, v4, v6

    .line 196
    .line 197
    aput v2, v4, p1

    .line 198
    .line 199
    const v2, -0xfcfcfd

    .line 200
    .line 201
    .line 202
    invoke-static {v2, v4}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    if-eqz v5, :cond_4

    .line 211
    .line 212
    new-array v4, v11, [F

    .line 213
    .line 214
    fill-array-data v4, :array_0

    .line 215
    .line 216
    .line 217
    invoke-static {v2, v4}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    :cond_4
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->d:Landroid/view/View;

    .line 222
    .line 223
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 224
    .line 225
    .line 226
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->c:Landroid/view/View;

    .line 227
    .line 228
    const/high16 v4, 0x42ce0000    # 103.0f

    .line 229
    .line 230
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 231
    .line 232
    .line 233
    move-result v4

    .line 234
    invoke-static {v2, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 235
    .line 236
    .line 237
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->c:Landroid/view/View;

    .line 238
    .line 239
    sget v4, Ll/dbc0;->Y1:I

    .line 240
    .line 241
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 242
    .line 243
    .line 244
    goto :goto_1

    .line 245
    :cond_5
    const/16 p1, 0x7

    .line 246
    .line 247
    sget v2, Ll/qa00;->o:I

    .line 248
    .line 249
    int-to-float v4, v2

    .line 250
    int-to-float v13, v2

    .line 251
    int-to-float v14, v2

    .line 252
    int-to-float v2, v2

    .line 253
    new-array v11, v11, [F

    .line 254
    .line 255
    aput v12, v11, v3

    .line 256
    .line 257
    aput v12, v11, v5

    .line 258
    .line 259
    aput v12, v11, v10

    .line 260
    .line 261
    aput v12, v11, v9

    .line 262
    .line 263
    aput v4, v11, v8

    .line 264
    .line 265
    aput v13, v11, v7

    .line 266
    .line 267
    aput v14, v11, v6

    .line 268
    .line 269
    aput v2, v11, p1

    .line 270
    .line 271
    const v2, -0xd2d2d3

    .line 272
    .line 273
    .line 274
    invoke-static {v2, v11}, Ll/jde;->c(I[F)Landroid/graphics/drawable/Drawable;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->d:Landroid/view/View;

    .line 279
    .line 280
    invoke-virtual {v4, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 281
    .line 282
    .line 283
    :goto_1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    if-eqz v2, :cond_7

    .line 288
    .line 289
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    instance-of v2, v2, Lcom/p1/mobile/android/app/Act;

    .line 294
    .line 295
    if-eqz v2, :cond_7

    .line 296
    .line 297
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->h:Lv/VLinear;

    .line 298
    .line 299
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 300
    .line 301
    .line 302
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->h:Lv/VLinear;

    .line 303
    .line 304
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 305
    .line 306
    .line 307
    move-result v2

    .line 308
    if-lez v2, :cond_6

    .line 309
    .line 310
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->h:Lv/VLinear;

    .line 311
    .line 312
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 313
    .line 314
    .line 315
    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 320
    .line 321
    sget-object v3, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->CARD:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 322
    .line 323
    invoke-static {v2, v1, v3}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->h:Lv/VLinear;

    .line 328
    .line 329
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result v3

    .line 333
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 334
    .line 335
    .line 336
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    if-eqz v2, :cond_7

    .line 341
    .line 342
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->h:Lv/VLinear;

    .line 343
    .line 344
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 345
    .line 346
    .line 347
    :cond_7
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 348
    .line 349
    new-instance v2, Ll/nu50;

    .line 350
    .line 351
    invoke-direct {v2, v0}, Ll/nu50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;)V

    .line 352
    .line 353
    .line 354
    invoke-static {v1, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 355
    .line 356
    .line 357
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->m:Lv/VFrame;

    .line 358
    .line 359
    new-instance v2, Ll/ou50;

    .line 360
    .line 361
    move-object/from16 v3, p2

    .line 362
    .line 363
    invoke-direct {v2, v3}, Ll/ou50;-><init>(Ll/z20;)V

    .line 364
    .line 365
    .line 366
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 367
    .line 368
    .line 369
    invoke-static {}, Ll/gra;->L3()Z

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    if-eqz v1, :cond_8

    .line 374
    .line 375
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->m()V

    .line 376
    .line 377
    .line 378
    return-void

    .line 379
    :cond_8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->l()V

    .line 380
    .line 381
    .line 382
    return-void

    .line 383
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
    invoke-static {p0, p1}, Ll/pu50;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->m:Lv/VFrame;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->W0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->n:Lv/VText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 15
    .line 16
    sget v2, Ll/dbc0;->b4:I

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 30
    .line 31
    sget v1, Ll/dbc0;->Y3:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->m:Lv/VFrame;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->q1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->n:Lv/VText;

    .line 9
    .line 10
    invoke-static {}, Ll/gra;->z()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget v1, Ll/dbc0;->Sh:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget v1, Ll/dbc0;->b4:I

    .line 20
    .line 21
    :goto_0
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 26
    .line 27
    sget v1, Ll/dbc0;->a4:I

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 33
    .line 34
    const-string v1, "#E65B0A"

    .line 35
    .line 36
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 46
    .line 47
    sget v2, Ll/dbc0;->Z3:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f:Lv/VText;

    .line 57
    .line 58
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

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
