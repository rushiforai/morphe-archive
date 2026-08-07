.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;
    }
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:F

.field public E:I

.field public F:I

.field public G:I

.field public H:I

.field public I:Ljava/lang/String;

.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Z

.field public i:Landroid/graphics/drawable/Drawable;

.field public j:F

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:Landroid/graphics/drawable/ClipDrawable;

.field public q:Landroid/graphics/drawable/ClipDrawable;

.field public r:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;

.field public s:Landroid/graphics/drawable/Drawable;

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 252
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 253
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->f:I

    .line 254
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 255
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    const/high16 v0, 0x41800000    # 16.0f

    .line 256
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->D:F

    .line 257
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->E:I

    .line 258
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->f:I

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 12
    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 16
    .line 17
    const/high16 v1, 0x41800000    # 16.0f

    .line 18
    .line 19
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->D:F

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->E:I

    .line 22
    .line 23
    const-string v0, ""

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p2, :cond_4

    .line 28
    .line 29
    sget-object v0, Ll/shc0;->d0:[I

    .line 30
    .line 31
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget p2, Ll/shc0;->m0:I

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    sget p2, Ll/shc0;->m0:I

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->s:Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->s:Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 66
    .line 67
    :cond_0
    sget p2, Ll/shc0;->o0:I

    .line 68
    .line 69
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 70
    .line 71
    int-to-float v0, v0

    .line 72
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    float-to-int p2, p2

    .line 77
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 78
    .line 79
    sget p2, Ll/shc0;->n0:I

    .line 80
    .line 81
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 82
    .line 83
    int-to-float v0, v0

    .line 84
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    float-to-int p2, p2

    .line 89
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 90
    .line 91
    sget p2, Ll/shc0;->f0:I

    .line 92
    .line 93
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->j:F

    .line 94
    .line 95
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    float-to-int p2, p2

    .line 100
    int-to-float p2, p2

    .line 101
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->j:F

    .line 102
    .line 103
    sget p2, Ll/shc0;->e0:I

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-eqz p2, :cond_2

    .line 110
    .line 111
    sget p2, Ll/shc0;->e0:I

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    instance-of v0, p2, Landroid/graphics/drawable/LayerDrawable;

    .line 118
    .line 119
    if-eqz v0, :cond_2

    .line 120
    .line 121
    check-cast p2, Landroid/graphics/drawable/LayerDrawable;

    .line 122
    .line 123
    const/high16 v0, 0x1020000

    .line 124
    .line 125
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->i:Landroid/graphics/drawable/Drawable;

    .line 130
    .line 131
    const v0, 0x102000f

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    instance-of v2, v0, Landroid/graphics/drawable/ClipDrawable;

    .line 139
    .line 140
    if-eqz v2, :cond_1

    .line 141
    .line 142
    check-cast v0, Landroid/graphics/drawable/ClipDrawable;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->q:Landroid/graphics/drawable/ClipDrawable;

    .line 145
    .line 146
    :cond_1
    const v0, 0x102000d

    .line 147
    .line 148
    .line 149
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    instance-of v0, p2, Landroid/graphics/drawable/ClipDrawable;

    .line 154
    .line 155
    if-eqz v0, :cond_2

    .line 156
    .line 157
    check-cast p2, Landroid/graphics/drawable/ClipDrawable;

    .line 158
    .line 159
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->p:Landroid/graphics/drawable/ClipDrawable;

    .line 160
    .line 161
    :cond_2
    sget p2, Ll/shc0;->l0:I

    .line 162
    .line 163
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->D:F

    .line 168
    .line 169
    sget p2, Ll/shc0;->k0:I

    .line 170
    .line 171
    const/4 v0, 0x0

    .line 172
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    float-to-int p2, p2

    .line 177
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->H:I

    .line 178
    .line 179
    sget p2, Ll/shc0;->j0:I

    .line 180
    .line 181
    const/high16 v0, -0x1000000

    .line 182
    .line 183
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->C:I

    .line 188
    .line 189
    sget p2, Ll/shc0;->g0:I

    .line 190
    .line 191
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    if-eqz p2, :cond_3

    .line 196
    .line 197
    sget p2, Ll/shc0;->g0:I

    .line 198
    .line 199
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->z:Landroid/graphics/drawable/Drawable;

    .line 204
    .line 205
    if-eqz p2, :cond_3

    .line 206
    .line 207
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 208
    .line 209
    .line 210
    move-result p2

    .line 211
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 212
    .line 213
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->z:Landroid/graphics/drawable/Drawable;

    .line 214
    .line 215
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 220
    .line 221
    :cond_3
    sget p2, Ll/shc0;->i0:I

    .line 222
    .line 223
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 224
    .line 225
    int-to-float v0, v0

    .line 226
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    float-to-int p2, p2

    .line 231
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 232
    .line 233
    sget p2, Ll/shc0;->h0:I

    .line 234
    .line 235
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 236
    .line 237
    int-to-float v0, v0

    .line 238
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 239
    .line 240
    .line 241
    move-result p2

    .line 242
    float-to-int p2, p2

    .line 243
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 244
    .line 245
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 246
    .line 247
    .line 248
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l()V

    .line 249
    .line 250
    .line 251
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->t:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    sub-float v1, v0, v1

    .line 11
    .line 12
    cmpl-float v1, p1, v1

    .line 13
    .line 14
    if-ltz v1, :cond_0

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 17
    .line 18
    add-float/2addr v0, v1

    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->w:I

    .line 20
    .line 21
    int-to-float p0, p0

    .line 22
    add-float/2addr v0, p0

    .line 23
    cmpg-float p0, p1, v0

    .line 24
    .line 25
    if-gtz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->f:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->q:Landroid/graphics/drawable/ClipDrawable;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->i:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->p:Landroid/graphics/drawable/ClipDrawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const v2, 0x461c4000    # 10000.0f

    .line 12
    .line 13
    .line 14
    mul-float/2addr v1, v2

    .line 15
    float-to-int v1, v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->p:Landroid/graphics/drawable/ClipDrawable;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/ClipDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->q:Landroid/graphics/drawable/ClipDrawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->f:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const v2, 0x461c4000    # 10000.0f

    .line 12
    .line 13
    .line 14
    mul-float/2addr v1, v2

    .line 15
    float-to-int v1, v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->q:Landroid/graphics/drawable/ClipDrawable;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/ClipDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final e(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->z:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    float-to-int v1, v1

    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 22
    .line 23
    mul-float/2addr v2, v3

    .line 24
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 25
    .line 26
    int-to-float v3, v3

    .line 27
    add-float/2addr v2, v3

    .line 28
    float-to-int v2, v2

    .line 29
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->z:Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->E:I

    .line 55
    .line 56
    if-eq v0, v1, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->E:I

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->a:Landroid/graphics/Paint;

    .line 69
    .line 70
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->j(Ljava/lang/String;Landroid/graphics/Paint;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->F:I

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->a:Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->i(Ljava/lang/String;Landroid/graphics/Paint;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->G:I

    .line 85
    .line 86
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 89
    .line 90
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 95
    .line 96
    mul-float/2addr v1, v2

    .line 97
    float-to-int v1, v1

    .line 98
    int-to-float v1, v1

    .line 99
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 100
    .line 101
    add-float/2addr v1, v2

    .line 102
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->F:I

    .line 103
    .line 104
    div-int/lit8 v2, v2, 0x2

    .line 105
    .line 106
    int-to-float v2, v2

    .line 107
    sub-float/2addr v1, v2

    .line 108
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 109
    .line 110
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->G:I

    .line 111
    .line 112
    sub-int/2addr v2, v3

    .line 113
    div-int/lit8 v2, v2, 0x2

    .line 114
    .line 115
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->H:I

    .line 116
    .line 117
    add-int/2addr v2, v3

    .line 118
    int-to-float v2, v2

    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->a:Landroid/graphics/Paint;

    .line 120
    .line 121
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 122
    .line 123
    .line 124
    :cond_2
    return-void
.end method

.method public final f(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->s:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    float-to-int v1, v1

    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->t:I

    .line 16
    .line 17
    add-int/2addr v1, v2

    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->u:I

    .line 19
    .line 20
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 21
    .line 22
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 27
    .line 28
    mul-float/2addr v3, v4

    .line 29
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->w:I

    .line 30
    .line 31
    int-to-float v4, v4

    .line 32
    add-float/2addr v3, v4

    .line 33
    float-to-int v3, v3

    .line 34
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->v:I

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->s:Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final g(I)F
    .locals 4

    .line 1
    int-to-double v0, p1

    .line 2
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 3
    .line 4
    mul-double/2addr v0, v2

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g:I

    .line 6
    .line 7
    int-to-double p0, p0

    .line 8
    div-double/2addr v0, p0

    .line 9
    double-to-float p0, v0

    .line 10
    return p0
.end method

.method public getMax()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgress()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final h(Landroid/view/MotionEvent;)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 11
    .line 12
    sub-float/2addr v0, v1

    .line 13
    div-float/2addr v0, p1

    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->getMax()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    int-to-float p0, p0

    .line 30
    mul-float/2addr p1, p0

    .line 31
    float-to-int p0, p1

    .line 32
    return p0
.end method

.method public final i(Ljava/lang/String;Landroid/graphics/Paint;)I
    .locals 2

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p2, p1, v0, v1, p0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final j(Ljava/lang/String;Landroid/graphics/Paint;)I
    .locals 2

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p2, p1, v0, v1, p0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final k(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g(I)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 10
    .line 11
    mul-float/2addr v1, v2

    .line 12
    add-float/2addr v0, v1

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    float-to-double v1, p1

    .line 18
    float-to-double v3, v0

    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 20
    .line 21
    int-to-double v5, p0

    .line 22
    const-wide v7, 0x3fe3333333333333L    # 0.6

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    mul-double/2addr v5, v7

    .line 28
    sub-double v5, v3, v5

    .line 29
    .line 30
    cmpl-double p1, v1, v5

    .line 31
    .line 32
    if-ltz p1, :cond_0

    .line 33
    .line 34
    int-to-double p0, p0

    .line 35
    mul-double/2addr p0, v7

    .line 36
    add-double/2addr v3, p0

    .line 37
    cmpg-double p0, v1, v3

    .line 38
    .line 39
    if-gtz p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final l()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->C:I

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->a:Landroid/graphics/Paint;

    .line 20
    .line 21
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->D:F

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->b:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->b:Landroid/graphics/Paint;

    .line 37
    .line 38
    const/high16 v1, -0x1000000

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    .line 42
    .line 43
    const/16 v0, 0x64

    .line 44
    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g:I

    .line 46
    .line 47
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->r:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 6
    .line 7
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->h:Z

    .line 8
    .line 9
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;IZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->b(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->d(Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->c(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->f(Landroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 10
    .line 11
    add-int/2addr v0, v2

    .line 12
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 13
    .line 14
    add-int/2addr v3, v2

    .line 15
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 22
    .line 23
    add-int/2addr v1, v2

    .line 24
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v0, p1}, Landroid/view/View;->getDefaultSize(II)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v0, p2}, Landroid/view/View;->getDefaultSize(II)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->c:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->d:I

    .line 7
    .line 8
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 9
    .line 10
    sub-int p2, p1, p2

    .line 11
    .line 12
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 13
    .line 14
    sub-int/2addr p1, p3

    .line 15
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 21
    .line 22
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 23
    .line 24
    div-int/lit8 p1, p1, 0x2

    .line 25
    .line 26
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 27
    .line 28
    div-int/lit8 p2, p2, 0x2

    .line 29
    .line 30
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    int-to-float p1, p1

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 36
    .line 37
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k:F

    .line 38
    .line 39
    add-float/2addr p1, p2

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->n:F

    .line 41
    .line 42
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 43
    .line 44
    int-to-float p1, p1

    .line 45
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->j:F

    .line 46
    .line 47
    sub-float/2addr p1, p2

    .line 48
    const/high16 p3, 0x40000000    # 2.0f

    .line 49
    .line 50
    div-float/2addr p1, p3

    .line 51
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 52
    .line 53
    int-to-float p3, p3

    .line 54
    add-float/2addr p1, p3

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->m:F

    .line 56
    .line 57
    add-float/2addr p1, p2

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->o:F

    .line 59
    .line 60
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 61
    .line 62
    div-int/lit8 p1, p1, 0x2

    .line 63
    .line 64
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 65
    .line 66
    div-int/lit8 p2, p2, 0x2

    .line 67
    .line 68
    sub-int/2addr p1, p2

    .line 69
    const/4 p2, 0x0

    .line 70
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->t:I

    .line 75
    .line 76
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 77
    .line 78
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->u:I

    .line 79
    .line 80
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 81
    .line 82
    add-int/2addr p1, p3

    .line 83
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->w:I

    .line 84
    .line 85
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 86
    .line 87
    add-int/2addr p2, p1

    .line 88
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->v:I

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->i:Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    if-eqz p1, :cond_0

    .line 93
    .line 94
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 95
    .line 96
    float-to-int p2, p2

    .line 97
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->m:F

    .line 98
    .line 99
    float-to-int p3, p3

    .line 100
    iget p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->n:F

    .line 101
    .line 102
    float-to-int p4, p4

    .line 103
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->o:F

    .line 104
    .line 105
    float-to-int v0, v0

    .line 106
    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 107
    .line 108
    .line 109
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->p:Landroid/graphics/drawable/ClipDrawable;

    .line 110
    .line 111
    if-eqz p1, :cond_1

    .line 112
    .line 113
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 114
    .line 115
    float-to-int p2, p2

    .line 116
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->m:F

    .line 117
    .line 118
    float-to-int p3, p3

    .line 119
    iget p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->n:F

    .line 120
    .line 121
    float-to-int p4, p4

    .line 122
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->o:F

    .line 123
    .line 124
    float-to-int v0, v0

    .line 125
    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 126
    .line 127
    .line 128
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->q:Landroid/graphics/drawable/ClipDrawable;

    .line 129
    .line 130
    if-eqz p1, :cond_2

    .line 131
    .line 132
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->l:F

    .line 133
    .line 134
    float-to-int p2, p2

    .line 135
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->m:F

    .line 136
    .line 137
    float-to-int p3, p3

    .line 138
    iget p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->n:F

    .line 139
    .line 140
    float-to-int p4, p4

    .line 141
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->o:F

    .line 142
    .line 143
    float-to-int p0, p0

    .line 144
    invoke-virtual {p1, p2, p3, p4, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 145
    .line 146
    .line 147
    :cond_2
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-eq v0, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->h:Z

    .line 15
    .line 16
    if-eqz v0, :cond_5

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->a(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_5

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->h(Landroid/view/MotionEvent;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->setProgress(I)V

    .line 29
    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->r:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->h:Z

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;->c(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->h:Z

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->k(Landroid/view/MotionEvent;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_5

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->h:Z

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->r:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;

    .line 56
    .line 57
    if-eqz p1, :cond_4

    .line 58
    .line 59
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;->b(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;)V

    .line 60
    .line 61
    .line 62
    :cond_4
    return v1

    .line 63
    :cond_5
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0
.end method

.method public setMax(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnSeekBarChangeListener(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->r:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;

    .line 2
    .line 3
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->e:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->m()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setSecondaryProgress(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->f:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->f:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->I:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextBgDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->z:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method public setTextBgHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->B:I

    .line 2
    .line 3
    return-void
.end method

.method public setTextBgWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->A:I

    .line 2
    .line 3
    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->C:I

    .line 2
    .line 3
    return-void
.end method

.method public setTextPaddingTop(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->H:I

    .line 2
    .line 3
    return-void
.end method

.method public setTextSize(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->D:F

    .line 2
    .line 3
    return-void
.end method

.method public setThumbHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->y:I

    .line 2
    .line 3
    return-void
.end method

.method public setThumbImage(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->s:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method public setThumbWith(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->x:I

    .line 2
    .line 3
    return-void
.end method
