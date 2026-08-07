.class public Ltech/sud/runtime/component/a/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static a:I = 0x40

.field static b:F = 20.0f


# instance fields
.field private c:Z

.field private d:Landroid/widget/TextView;

.field private e:Landroid/widget/TextView;

.field private f:Ltech/sud/runtime/component/a/b;

.field private g:Landroid/widget/FrameLayout;

.field private h:I

.field private i:I

.field private j:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V
    .locals 2

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 297
    iput-boolean v0, p0, Ltech/sud/runtime/component/a/a;->c:Z

    const/4 v1, 0x0

    .line 298
    iput-object v1, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 299
    iput v0, p0, Ltech/sud/runtime/component/a/a;->h:I

    .line 300
    iput v0, p0, Ltech/sud/runtime/component/a/a;->i:I

    .line 301
    const-string v0, ""

    iput-object v0, p0, Ltech/sud/runtime/component/a/a;->j:Ljava/lang/String;

    .line 302
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 303
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 304
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 305
    iget-object p0, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;ILjava/lang/String;Z)V
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2}, Ltech/sud/runtime/component/a/a;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p5, p0, Ltech/sud/runtime/component/a/a;->c:Z

    .line 5
    .line 6
    if-nez p5, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p5, Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    invoke-direct {p5}, Landroid/util/DisplayMetrics;-><init>()V

    .line 12
    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Landroid/app/Activity;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p5}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 26
    .line 27
    .line 28
    iget p5, p5, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 29
    .line 30
    const/16 v0, 0x2ee

    .line 31
    .line 32
    if-le v0, p5, :cond_1

    .line 33
    .line 34
    div-int/lit8 p5, p5, 0x1e

    .line 35
    .line 36
    mul-int/lit8 v0, p5, 0xa

    .line 37
    .line 38
    int-to-float v1, p5

    .line 39
    const v2, 0x3f4ccccd    # 0.8f

    .line 40
    .line 41
    .line 42
    mul-float/2addr v1, v2

    .line 43
    sput v1, Ltech/sud/runtime/component/a/a;->b:F

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/16 v0, 0xfa

    .line 47
    .line 48
    const/16 p5, 0x19

    .line 49
    .line 50
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v2, "[ "

    .line 53
    .line 54
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-static {v3}, Ltech/sud/runtime/core/JNIShell;->version(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v4, "."

    .line 66
    .line 67
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const/4 v4, 0x1

    .line 71
    invoke-static {v4}, Ltech/sud/runtime/core/JNIShell;->version(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v4, " ]"

    .line 79
    .line 80
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-lez v5, :cond_2

    .line 92
    .line 93
    new-instance v5, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    :cond_2
    new-instance p4, Landroid/widget/FrameLayout$LayoutParams;

    .line 115
    .line 116
    mul-int/lit8 v2, p5, 0x2

    .line 117
    .line 118
    invoke-direct {p4, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 119
    .line 120
    .line 121
    iget-object v4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 122
    .line 123
    invoke-virtual {v4, p4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    .line 125
    .line 126
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 127
    .line 128
    const/high16 v4, -0x10000

    .line 129
    .line 130
    invoke-virtual {p4, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 134
    .line 135
    invoke-virtual {p4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 136
    .line 137
    .line 138
    move-result-object p4

    .line 139
    sget v5, Ltech/sud/runtime/component/a/a;->a:I

    .line 140
    .line 141
    invoke-virtual {p4, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 142
    .line 143
    .line 144
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 145
    .line 146
    const-string v5, "FPS: 0\nDraw: 0"

    .line 147
    .line 148
    invoke-virtual {p4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 152
    .line 153
    sget v5, Ltech/sud/runtime/component/a/a;->b:F

    .line 154
    .line 155
    invoke-virtual {p4, v3, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 156
    .line 157
    .line 158
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 159
    .line 160
    const/16 v5, 0x10

    .line 161
    .line 162
    invoke-virtual {p4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 163
    .line 164
    .line 165
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 166
    .line 167
    const/4 v6, 0x5

    .line 168
    invoke-virtual {p4, v6, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 169
    .line 170
    .line 171
    new-instance p4, Landroid/widget/FrameLayout$LayoutParams;

    .line 172
    .line 173
    invoke-direct {p4, v0, p5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 177
    .line 178
    invoke-virtual {v0, p4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 179
    .line 180
    .line 181
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 182
    .line 183
    int-to-float v0, v2

    .line 184
    invoke-virtual {p4, v0}, Landroid/view/View;->setY(F)V

    .line 185
    .line 186
    .line 187
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 188
    .line 189
    invoke-virtual {p4, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 190
    .line 191
    .line 192
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 193
    .line 194
    invoke-virtual {p4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 195
    .line 196
    .line 197
    move-result-object p4

    .line 198
    sget v0, Ltech/sud/runtime/component/a/a;->a:I

    .line 199
    .line 200
    invoke-virtual {p4, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 201
    .line 202
    .line 203
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 204
    .line 205
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 209
    .line 210
    sget v0, Ltech/sud/runtime/component/a/a;->b:F

    .line 211
    .line 212
    invoke-virtual {p4, v3, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 213
    .line 214
    .line 215
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 216
    .line 217
    invoke-virtual {p4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 218
    .line 219
    .line 220
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 221
    .line 222
    invoke-virtual {p4, v6, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 223
    .line 224
    .line 225
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 226
    .line 227
    const/4 v0, -0x1

    .line 228
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 229
    .line 230
    .line 231
    iget-object p4, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 232
    .line 233
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 234
    .line 235
    .line 236
    new-instance p4, Ltech/sud/runtime/component/a/b;

    .line 237
    .line 238
    invoke-direct {p4, p1, p3}, Ltech/sud/runtime/component/a/b;-><init>(Landroid/content/Context;I)V

    .line 239
    .line 240
    .line 241
    iput-object p4, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 242
    .line 243
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 244
    .line 245
    const/4 p3, -0x2

    .line 246
    invoke-direct {p1, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 247
    .line 248
    .line 249
    iget-object p3, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 250
    .line 251
    invoke-virtual {p3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 252
    .line 253
    .line 254
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 255
    .line 256
    mul-int/lit8 p5, p5, 0x3

    .line 257
    .line 258
    int-to-float p3, p5

    .line 259
    invoke-virtual {p1, p3}, Landroid/view/View;->setY(F)V

    .line 260
    .line 261
    .line 262
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 263
    .line 264
    invoke-virtual {p1, v6, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 265
    .line 266
    .line 267
    iput-object p2, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 268
    .line 269
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 270
    .line 271
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 272
    .line 273
    .line 274
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 275
    .line 276
    iget-object p2, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 277
    .line 278
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 279
    .line 280
    .line 281
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 282
    .line 283
    iget-object p2, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 284
    .line 285
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 286
    .line 287
    .line 288
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 289
    .line 290
    iget-object p0, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 291
    .line 292
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 293
    .line 294
    .line 295
    return-void
.end method

.method private a(I)V
    .locals 1

    .line 115
    iget-object v0, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 116
    iget-object v0, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 117
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    sget v0, Ltech/sud/runtime/component/a/a;->a:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 118
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    sget v0, Ltech/sud/runtime/component/a/a;->a:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 119
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 120
    iget-object p0, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method private b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    iget-object v1, p0, Ltech/sud/runtime/component/a/a;->e:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ltech/sud/runtime/component/a/a;->g:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    iget-object p0, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 114
    invoke-direct {p0}, Ltech/sud/runtime/component/a/a;->b()V

    return-void
.end method

.method public a(IILjava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltech/sud/runtime/component/a/a;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/a/a;->j:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget v0, p0, Ltech/sud/runtime/component/a/a;->h:I

    .line 15
    .line 16
    if-ne v0, p1, :cond_1

    .line 17
    .line 18
    iget v0, p0, Ltech/sud/runtime/component/a/a;->i:I

    .line 19
    .line 20
    if-eq v0, p2, :cond_5

    .line 21
    .line 22
    :cond_1
    iput p1, p0, Ltech/sud/runtime/component/a/a;->h:I

    .line 23
    .line 24
    iput p2, p0, Ltech/sud/runtime/component/a/a;->i:I

    .line 25
    .line 26
    iput-object p3, p0, Ltech/sud/runtime/component/a/a;->j:Ljava/lang/String;

    .line 27
    .line 28
    const-string p2, "FPS: "

    .line 29
    .line 30
    if-ltz p1, :cond_2

    .line 31
    .line 32
    new-instance p1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget p2, p0, Ltech/sud/runtime/component/a/a;->h:I

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p2, " / "

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget p2, p0, Ltech/sud/runtime/component/a/a;->i:I

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p2, "\nDraw: "

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget p2, p0, Ltech/sud/runtime/component/a/a;->h:I

    .line 77
    .line 78
    const/16 p3, 0x3a

    .line 79
    .line 80
    if-lt p2, p3, :cond_3

    .line 81
    .line 82
    const/4 p2, -0x1

    .line 83
    goto :goto_0

    .line 84
    :cond_3
    iget p3, p0, Ltech/sud/runtime/component/a/a;->i:I

    .line 85
    .line 86
    if-le p2, p3, :cond_4

    .line 87
    .line 88
    const/16 p2, -0x100

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    const/16 p2, -0x7800

    .line 92
    .line 93
    :goto_0
    iget-object p3, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 94
    .line 95
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    :cond_5
    iget-object p1, p0, Ltech/sud/runtime/component/a/a;->d:Landroid/widget/TextView;

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    .line 109
    .line 110
    invoke-virtual {p0}, Ltech/sud/runtime/component/a/b;->a()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public a(ILjava/lang/String;)V
    .locals 1

    .line 124
    iget-boolean v0, p0, Ltech/sud/runtime/component/a/a;->c:Z

    if-eqz v0, :cond_0

    .line 125
    iget-object p0, p0, Ltech/sud/runtime/component/a/a;->f:Ltech/sud/runtime/component/a/b;

    invoke-virtual {p0, p1, p2}, Ltech/sud/runtime/component/a/b;->a(ILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public a(Z)V
    .locals 1

    .line 121
    iget-boolean v0, p0, Ltech/sud/runtime/component/a/a;->c:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const p1, -0xff0100

    .line 122
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/a/a;->a(I)V

    return-void

    :cond_0
    const/high16 p1, -0x10000

    .line 123
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/a/a;->a(I)V

    :cond_1
    return-void
.end method
