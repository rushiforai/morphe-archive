.class public Lcom/p1/mobile/android/app/Dialog$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Dialog;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/graphics/drawable/Drawable;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog;ILandroid/graphics/drawable/Drawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/android/app/Dialog$c;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/android/app/Dialog$c;->b:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const v0, 0x3f333333    # 0.7f

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/Window;->setDimAmount(F)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    mul-int v1, p1, p1

    .line 30
    .line 31
    div-int/lit8 v1, v1, 0x4

    .line 32
    .line 33
    mul-int v2, v0, v0

    .line 34
    .line 35
    div-int/lit8 v2, v2, 0x4

    .line 36
    .line 37
    add-int/2addr v1, v2

    .line 38
    int-to-double v1, v1

    .line 39
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    double-to-float v1, v1

    .line 44
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    iget-object v3, v2, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 47
    .line 48
    const/4 v4, 0x2

    .line 49
    div-int/2addr p1, v4

    .line 50
    div-int/2addr v0, v4

    .line 51
    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    iget v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->o0:I

    .line 54
    .line 55
    int-to-float v2, v2

    .line 56
    invoke-static {v3, p1, v0, v2, v1}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$c$a;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$c$a;-><init>(Lcom/p1/mobile/android/app/Dialog$c;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    const/16 v0, 0xfa

    .line 77
    .line 78
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog;->G(I)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    int-to-long v2, v2

    .line 83
    invoke-virtual {p1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 84
    .line 85
    .line 86
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 87
    .line 88
    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 92
    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 95
    .line 96
    iget-object v3, v2, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 97
    .line 98
    iget-object v3, v3, Lcom/p1/mobile/android/app/Dialog$e;->n0:Landroid/graphics/Point;

    .line 99
    .line 100
    const/4 v5, 0x1

    .line 101
    if-nez v3, :cond_0

    .line 102
    .line 103
    filled-new-array {v1, v5}, [I

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    filled-new-array {v1, v5}, [I

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    goto :goto_0

    .line 120
    :cond_0
    new-array v6, v4, [I

    .line 121
    .line 122
    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 123
    .line 124
    invoke-virtual {v2, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 125
    .line 126
    .line 127
    aget v2, v6, v1

    .line 128
    .line 129
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 130
    .line 131
    iget-object v7, v7, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 132
    .line 133
    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    div-int/2addr v7, v4

    .line 138
    add-int/2addr v2, v7

    .line 139
    aget v6, v6, v5

    .line 140
    .line 141
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 142
    .line 143
    iget-object v7, v7, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 144
    .line 145
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 146
    .line 147
    .line 148
    move-result v7

    .line 149
    div-int/2addr v7, v4

    .line 150
    add-int/2addr v6, v7

    .line 151
    iget-object v7, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 152
    .line 153
    iget-object v7, v7, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 154
    .line 155
    iget v8, v3, Landroid/graphics/Point;->x:I

    .line 156
    .line 157
    sub-int/2addr v8, v2

    .line 158
    int-to-float v2, v8

    .line 159
    new-array v8, v4, [F

    .line 160
    .line 161
    aput v2, v8, v1

    .line 162
    .line 163
    const/4 v2, 0x0

    .line 164
    aput v2, v8, v5

    .line 165
    .line 166
    const-string v9, "translationX"

    .line 167
    .line 168
    invoke-static {v7, v9, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    iget-object v8, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 173
    .line 174
    iget-object v8, v8, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 175
    .line 176
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 177
    .line 178
    sub-int/2addr v3, v6

    .line 179
    int-to-float v3, v3

    .line 180
    new-array v6, v4, [F

    .line 181
    .line 182
    aput v3, v6, v1

    .line 183
    .line 184
    aput v2, v6, v5

    .line 185
    .line 186
    const-string v2, "translationY"

    .line 187
    .line 188
    invoke-static {v8, v2, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    move-object v2, v7

    .line 193
    :goto_0
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog;->G(I)I

    .line 194
    .line 195
    .line 196
    move-result v6

    .line 197
    int-to-long v6, v6

    .line 198
    invoke-virtual {v2, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 199
    .line 200
    .line 201
    new-instance v6, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 202
    .line 203
    invoke-direct {v6}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v2, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 207
    .line 208
    .line 209
    invoke-static {v0}, Lcom/p1/mobile/android/app/Dialog;->G(I)I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    int-to-long v6, v0

    .line 214
    invoke-virtual {v3, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 215
    .line 216
    .line 217
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 218
    .line 219
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 223
    .line 224
    .line 225
    const/16 v0, 0xff

    .line 226
    .line 227
    filled-new-array {v0, v1}, [I

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    new-instance v6, Lcom/p1/mobile/android/app/Dialog$c$b;

    .line 236
    .line 237
    invoke-direct {v6, p0}, Lcom/p1/mobile/android/app/Dialog$c$b;-><init>(Lcom/p1/mobile/android/app/Dialog$c;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v2, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 241
    .line 242
    .line 243
    const/16 v6, 0x96

    .line 244
    .line 245
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog;->G(I)I

    .line 246
    .line 247
    .line 248
    move-result v7

    .line 249
    int-to-long v7, v7

    .line 250
    invoke-virtual {v2, v7, v8}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 251
    .line 252
    .line 253
    const/16 v7, 0x64

    .line 254
    .line 255
    invoke-static {v7}, Lcom/p1/mobile/android/app/Dialog;->G(I)I

    .line 256
    .line 257
    .line 258
    move-result v8

    .line 259
    int-to-long v8, v8

    .line 260
    invoke-virtual {v2, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 261
    .line 262
    .line 263
    filled-new-array {v0, v1}, [I

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    new-instance v2, Lcom/p1/mobile/android/app/Dialog$c$c;

    .line 272
    .line 273
    invoke-direct {v2, p0}, Lcom/p1/mobile/android/app/Dialog$c$c;-><init>(Lcom/p1/mobile/android/app/Dialog$c;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 277
    .line 278
    .line 279
    invoke-static {v7}, Lcom/p1/mobile/android/app/Dialog;->G(I)I

    .line 280
    .line 281
    .line 282
    move-result p0

    .line 283
    int-to-long v7, p0

    .line 284
    invoke-virtual {v0, v7, v8}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 285
    .line 286
    .line 287
    invoke-static {v6}, Lcom/p1/mobile/android/app/Dialog;->G(I)I

    .line 288
    .line 289
    .line 290
    move-result p0

    .line 291
    int-to-long v6, p0

    .line 292
    invoke-virtual {v0, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 293
    .line 294
    .line 295
    sget-object p0, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 296
    .line 297
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 298
    .line 299
    .line 300
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 301
    .line 302
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 303
    .line 304
    .line 305
    const/4 v2, 0x3

    .line 306
    new-array v2, v2, [Landroid/animation/Animator;

    .line 307
    .line 308
    aput-object p1, v2, v1

    .line 309
    .line 310
    aput-object v3, v2, v5

    .line 311
    .line 312
    aput-object v0, v2, v4

    .line 313
    .line 314
    invoke-virtual {p0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 318
    .line 319
    .line 320
    return-void
.end method
