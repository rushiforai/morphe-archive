.class public Lcom/clevertap/android/sdk/inbox/d;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field a:Landroid/content/Context;

.field b:Landroid/widget/LinearLayout;

.field c:Landroid/widget/LinearLayout;

.field d:Landroid/widget/FrameLayout;

.field e:Landroid/widget/ImageView;

.field f:Landroid/widget/ImageView;

.field g:Landroid/widget/ImageView;

.field h:Landroid/widget/RelativeLayout;

.field i:Landroid/widget/FrameLayout;

.field j:Landroid/widget/RelativeLayout;

.field k:Landroid/widget/RelativeLayout;

.field private l:Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

.field private m:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

.field private n:Landroid/widget/ImageView;

.field private o:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;",
            ">;"
        }
    .end annotation
.end field

.field private p:Z

.field protected final q:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/icc0;->H0:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/widget/ImageView;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->q:Landroid/widget/ImageView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/clevertap/android/sdk/inbox/d;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Lcom/clevertap/android/sdk/inbox/d;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/clevertap/android/sdk/inbox/d;Lkotlin/jvm/functions/Function0;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ljava/lang/Float;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-direct {p0, p2, v0, p1}, Lcom/clevertap/android/sdk/inbox/d;->r(Landroid/widget/ImageView;Landroid/content/Context;F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private h()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->d:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method private r(Landroid/widget/ImageView;Landroid/content/Context;F)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpg-float p0, p3, p0

    .line 3
    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    if-eqz p0, :cond_1

    .line 10
    .line 11
    sget p3, Ll/wbc0;->o:I

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    sget p3, Ll/wbc0;->p:I

    .line 15
    .line 16
    :goto_1
    if-eqz p0, :cond_2

    .line 17
    .line 18
    sget p0, Lcom/clevertap/android/sdk/R$string;->f:I

    .line 19
    .line 20
    goto :goto_2

    .line 21
    :cond_2
    sget p0, Lcom/clevertap/android/sdk/R$string;->l:I

    .line 22
    .line 23
    :goto_2
    invoke-virtual {p2, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-static {p0, p3, p2}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public d(FLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function3;Landroid/view/View;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Float;",
            ">;",
            "Lkotlin/jvm/functions/Function3<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Void;",
            ">;",
            "Landroid/view/View;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/inbox/d;->p:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inbox/d;->h()Landroid/widget/FrameLayout;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    sget v5, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I

    .line 33
    .line 34
    const-string v6, "p"

    .line 35
    .line 36
    const-string v7, "l"

    .line 37
    .line 38
    const/4 v8, 0x2

    .line 39
    const/high16 v9, 0x3f100000    # 0.5625f

    .line 40
    .line 41
    if-ne v5, v8, :cond_7

    .line 42
    .line 43
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->m:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 44
    .line 45
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v5, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-eqz v5, :cond_2

    .line 54
    .line 55
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    int-to-float v3, v3

    .line 62
    const v5, 0x3fe147ae    # 1.76f

    .line 63
    .line 64
    .line 65
    mul-float/2addr v3, v5

    .line 66
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 71
    .line 72
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    goto/16 :goto_4

    .line 77
    .line 78
    :cond_2
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->m:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 79
    .line 80
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-eqz v5, :cond_3

    .line 89
    .line 90
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 91
    .line 92
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    :goto_0
    move v5, v3

    .line 97
    goto/16 :goto_4

    .line 98
    .line 99
    :cond_3
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 100
    .line 101
    if-eqz v5, :cond_4

    .line 102
    .line 103
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    iget-object v6, p0, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 108
    .line 109
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    goto :goto_1

    .line 114
    :cond_4
    move v5, v1

    .line 115
    move v6, v5

    .line 116
    :goto_1
    iget-object v7, p0, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 117
    .line 118
    if-eqz v7, :cond_6

    .line 119
    .line 120
    if-eqz v5, :cond_6

    .line 121
    .line 122
    if-nez v6, :cond_5

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_5
    move v3, v5

    .line 126
    move v5, v6

    .line 127
    goto :goto_4

    .line 128
    :cond_6
    :goto_2
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 133
    .line 134
    div-int/2addr v3, v8

    .line 135
    int-to-float v5, v3

    .line 136
    mul-float/2addr v5, v9

    .line 137
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    goto :goto_4

    .line 142
    :cond_7
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 147
    .line 148
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->m:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 149
    .line 150
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-virtual {v5, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    if-eqz v5, :cond_8

    .line 159
    .line 160
    int-to-float v5, v3

    .line 161
    mul-float/2addr v5, v9

    .line 162
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    goto :goto_4

    .line 167
    :cond_8
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->m:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 168
    .line 169
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v5

    .line 177
    if-eqz v5, :cond_9

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_9
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 181
    .line 182
    if-eqz v5, :cond_a

    .line 183
    .line 184
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    goto :goto_3

    .line 189
    :cond_a
    move v5, v1

    .line 190
    :goto_3
    iget-object v6, p0, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 191
    .line 192
    if-eqz v6, :cond_b

    .line 193
    .line 194
    if-nez v5, :cond_c

    .line 195
    .line 196
    :cond_b
    int-to-float v5, v3

    .line 197
    mul-float/2addr v5, v9

    .line 198
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    :cond_c
    :goto_4
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 203
    .line 204
    invoke-direct {v6, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p4, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 211
    .line 212
    .line 213
    iget-object p4, p0, Lcom/clevertap/android/sdk/inbox/d;->m:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 214
    .line 215
    invoke-virtual {p4}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p4

    .line 219
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    move-result p4

    .line 223
    invoke-virtual {v0, p4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 224
    .line 225
    .line 226
    iget-object p4, p0, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 227
    .line 228
    if-eqz p4, :cond_d

    .line 229
    .line 230
    invoke-virtual {p4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 231
    .line 232
    .line 233
    :cond_d
    iget-object p4, p0, Lcom/clevertap/android/sdk/inbox/d;->l:Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 234
    .line 235
    invoke-virtual {p4}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 236
    .line 237
    .line 238
    move-result p4

    .line 239
    const/4 v3, 0x1

    .line 240
    if-eqz p4, :cond_e

    .line 241
    .line 242
    new-instance p4, Landroid/widget/ImageView;

    .line 243
    .line 244
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 245
    .line 246
    invoke-direct {p4, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 247
    .line 248
    .line 249
    iput-object p4, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 250
    .line 251
    invoke-virtual {p4, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 252
    .line 253
    .line 254
    iget-object p4, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 255
    .line 256
    iget-object v2, p0, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 257
    .line 258
    invoke-direct {p0, p4, v2, p1}, Lcom/clevertap/android/sdk/inbox/d;->r(Landroid/widget/ImageView;Landroid/content/Context;F)V

    .line 259
    .line 260
    .line 261
    const/high16 p1, 0x41f00000    # 30.0f

    .line 262
    .line 263
    invoke-static {v3, p1, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 264
    .line 265
    .line 266
    move-result p4

    .line 267
    float-to-int p4, p4

    .line 268
    invoke-static {v3, p1, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    float-to-int p1, p1

    .line 273
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 274
    .line 275
    invoke-direct {v2, p4, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 276
    .line 277
    .line 278
    const/high16 p1, 0x40800000    # 4.0f

    .line 279
    .line 280
    invoke-static {v3, p1, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    float-to-int p1, p1

    .line 285
    const/high16 p4, 0x40000000    # 2.0f

    .line 286
    .line 287
    invoke-static {v3, p4, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 288
    .line 289
    .line 290
    move-result p4

    .line 291
    float-to-int p4, p4

    .line 292
    invoke-virtual {v2, v1, p1, p4, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 293
    .line 294
    .line 295
    const p1, 0x800005

    .line 296
    .line 297
    .line 298
    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 299
    .line 300
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 301
    .line 302
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 303
    .line 304
    .line 305
    new-instance p1, Ll/bw3;

    .line 306
    .line 307
    invoke-direct {p1, p0, p2}, Ll/bw3;-><init>(Lcom/clevertap/android/sdk/inbox/d;Lkotlin/jvm/functions/Function0;)V

    .line 308
    .line 309
    .line 310
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 311
    .line 312
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    .line 314
    .line 315
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 316
    .line 317
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 318
    .line 319
    .line 320
    :cond_e
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->l:Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 321
    .line 322
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/d;->l:Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 327
    .line 328
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->x()Z

    .line 329
    .line 330
    .line 331
    move-result p2

    .line 332
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 333
    .line 334
    .line 335
    move-result-object p2

    .line 336
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->l:Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 337
    .line 338
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 339
    .line 340
    .line 341
    move-result p0

    .line 342
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    invoke-interface {p3, p1, p2, p0}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    return v3
.end method

.method public e(J)Ljava/lang/String;
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    sub-long/2addr v0, p1

    .line 9
    const-wide/16 v4, 0x3c

    .line 10
    .line 11
    cmp-long p0, v0, v4

    .line 12
    .line 13
    if-gez p0, :cond_0

    .line 14
    .line 15
    const-string p0, "Just Now"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-wide/16 v6, 0xdd4

    .line 19
    .line 20
    if-lez p0, :cond_1

    .line 21
    .line 22
    cmp-long p0, v0, v6

    .line 23
    .line 24
    if-gez p0, :cond_1

    .line 25
    .line 26
    new-instance p0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    div-long/2addr v0, v4

    .line 32
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, " mins ago"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_1
    cmp-long p0, v0, v6

    .line 46
    .line 47
    if-lez p0, :cond_3

    .line 48
    .line 49
    const-wide/32 v4, 0x13e0c

    .line 50
    .line 51
    .line 52
    cmp-long p0, v0, v4

    .line 53
    .line 54
    if-gez p0, :cond_3

    .line 55
    .line 56
    const-wide/16 p0, 0xe10

    .line 57
    .line 58
    div-long/2addr v0, p0

    .line 59
    const-wide/16 p0, 0x1

    .line 60
    .line 61
    cmp-long p0, v0, p0

    .line 62
    .line 63
    if-lez p0, :cond_2

    .line 64
    .line 65
    new-instance p0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p1, " hours ago"

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p1, " hour ago"

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :cond_3
    const-wide/32 v4, 0x15180

    .line 102
    .line 103
    .line 104
    cmp-long p0, v0, v4

    .line 105
    .line 106
    if-lez p0, :cond_4

    .line 107
    .line 108
    const-wide/32 v4, 0x2a300

    .line 109
    .line 110
    .line 111
    cmp-long p0, v0, v4

    .line 112
    .line 113
    if-gez p0, :cond_4

    .line 114
    .line 115
    const-string p0, "Yesterday"

    .line 116
    .line 117
    return-object p0

    .line 118
    :cond_4
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 119
    .line 120
    const-string v0, "dd MMM"

    .line 121
    .line 122
    invoke-direct {p0, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Ljava/util/Date;

    .line 126
    .line 127
    mul-long/2addr p1, v2

    .line 128
    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0
.end method

.method public f(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;I)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 6
    .line 7
    new-instance p3, Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-direct {p3, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/d;->o:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->m:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->l:Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->A()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput-boolean p1, p0, Lcom/clevertap/android/sdk/inbox/d;->p:Z

    .line 34
    .line 35
    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public i()Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->o:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 8
    .line 9
    return-object p0
.end method

.method public j(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 3

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, -0x1

    .line 10
    const/high16 v2, 0x40400000    # 3.0f

    .line 11
    .line 12
    invoke-direct {p0, v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 19
    .line 20
    invoke-direct {p0, v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-direct {p0, v0, v1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p3, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public k(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 3

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 10
    .line 11
    const/high16 v0, 0x40c00000    # 6.0f

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, -0x1

    .line 15
    invoke-direct {p0, v1, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-direct {p0, v1, v2, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 31
    .line 32
    invoke-direct {p0, v1, v2, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public l(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inbox/d$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/clevertap/android/sdk/inbox/d$a;-><init>(Lcom/clevertap/android/sdk/inbox/d;ILcom/clevertap/android/sdk/inbox/CTInboxMessage;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/os/Handler;

    .line 7
    .line 8
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 9
    .line 10
    .line 11
    const-wide/16 p1, 0x7d0

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inbox/d;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inbox/d;->h()Landroid/widget/FrameLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/zv3;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/zv3;-><init>(Lcom/clevertap/android/sdk/inbox/d;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->n:Landroid/widget/ImageView;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    new-instance v1, Ll/aw3;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/aw3;-><init>(Lcom/clevertap/android/sdk/inbox/d;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inbox/d;->h()Landroid/widget/FrameLayout;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public q([Landroid/widget/ImageView;ILandroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    if-ge v0, p2, :cond_1

    .line 4
    .line 5
    new-instance v1, Landroid/widget/ImageView;

    .line 6
    .line 7
    invoke-direct {v1, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    aput-object v1, p1, v0

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    aget-object v1, p1, v0

    .line 16
    .line 17
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    sget v3, Ll/wbc0;->n:I

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-static {v2, v3, v4}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 32
    .line 33
    const/4 v2, -0x2

    .line 34
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    const/16 v2, 0x8

    .line 38
    .line 39
    const/4 v3, 0x4

    .line 40
    const/4 v4, 0x6

    .line 41
    invoke-virtual {v1, v2, v4, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 42
    .line 43
    .line 44
    const/16 v2, 0x11

    .line 45
    .line 46
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 47
    .line 48
    invoke-virtual {p4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-ge v2, p2, :cond_0

    .line 53
    .line 54
    aget-object v2, p1, v0

    .line 55
    .line 56
    invoke-virtual {p4, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-void
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/d;->l:Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
