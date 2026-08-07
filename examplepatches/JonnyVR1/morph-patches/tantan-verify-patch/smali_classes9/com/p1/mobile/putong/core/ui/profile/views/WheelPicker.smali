.class public Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$b;,
        Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;
    }
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:I

.field public E0:Z

.field public F:I

.field public F0:Z

.field public G:I

.field public G0:Z

.field public H:I

.field public H0:Z

.field public I:I

.field public I0:Z

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:I

.field public O:I

.field public P:I

.field public Q:I

.field public R:I

.field public S:I

.field public T:I

.field public U:I

.field public V:I

.field public W:Z

.field public final a:Landroid/os/Handler;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/widget/Scroller;

.field public d:Landroid/view/VelocityTracker;

.field public e:Z

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;

.field public g:Landroid/graphics/Rect;

.field public h:Landroid/graphics/Rect;

.field public i:Landroid/graphics/Rect;

.field public j:Landroid/graphics/Rect;

.field public k:Landroid/graphics/Rect;

.field public k0:Z

.field public l:Landroid/graphics/Camera;

.field public m:Landroid/graphics/Matrix;

.field public n:Landroid/graphics/Matrix;

.field public o:Ljava/util/List;

.field public p:Ljava/lang/String;

.field public p0:Z

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 251
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 252
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a:Landroid/os/Handler;

    .line 253
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    const/4 p1, 0x7

    .line 254
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    const/4 p1, 0x0

    .line 255
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->x:I

    .line 256
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->y:I

    const/16 p1, 0x32

    .line 257
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->L:I

    const/16 p1, 0x1f40

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->M:I

    const/16 p1, 0x8

    .line 258
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->V:I

    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->j()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 250
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-direct {p3}, Landroid/os/Handler;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance p3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 17
    .line 18
    const/4 p3, 0x7

    .line 19
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->x:I

    .line 23
    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->y:I

    .line 25
    .line 26
    const/16 v1, 0x32

    .line 27
    .line 28
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->L:I

    .line 29
    .line 30
    const/16 v1, 0x1f40

    .line 31
    .line 32
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->M:I

    .line 33
    .line 34
    const/16 v1, 0x8

    .line 35
    .line 36
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->V:I

    .line 37
    .line 38
    sget-object v1, Ll/rhc0;->Q:[I

    .line 39
    .line 40
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget p2, Ll/rhc0;->i0:I

    .line 45
    .line 46
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 51
    .line 52
    sget p2, Ll/rhc0;->g0:I

    .line 53
    .line 54
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 59
    .line 60
    sget p2, Ll/rhc0;->f0:I

    .line 61
    .line 62
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->W:Z

    .line 67
    .line 68
    sget p2, Ll/rhc0;->e0:I

    .line 69
    .line 70
    const/4 p3, -0x1

    .line 71
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->S:I

    .line 76
    .line 77
    sget p2, Ll/rhc0;->d0:I

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p:Ljava/lang/String;

    .line 84
    .line 85
    sget p2, Ll/rhc0;->a0:I

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    sget v1, Ll/fac0;->a:I

    .line 96
    .line 97
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->B:I

    .line 106
    .line 107
    sget p2, Ll/rhc0;->V:I

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    sget v1, Ll/fac0;->a:I

    .line 118
    .line 119
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->C:I

    .line 128
    .line 129
    sget p2, Ll/rhc0;->c0:I

    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    sget v1, Ll/fac0;->b:I

    .line 140
    .line 141
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->x:I

    .line 150
    .line 151
    sget p2, Ll/rhc0;->h0:I

    .line 152
    .line 153
    const p3, -0xdededf

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->w:I

    .line 161
    .line 162
    sget p2, Ll/rhc0;->b0:I

    .line 163
    .line 164
    const p3, -0x777778

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->v:I

    .line 172
    .line 173
    sget p2, Ll/rhc0;->X:I

    .line 174
    .line 175
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F0:Z

    .line 180
    .line 181
    sget p2, Ll/rhc0;->Y:I

    .line 182
    .line 183
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k0:Z

    .line 188
    .line 189
    sget p2, Ll/rhc0;->Z:I

    .line 190
    .line 191
    const p3, -0x11cccd

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->z:I

    .line 199
    .line 200
    sget p2, Ll/rhc0;->T:I

    .line 201
    .line 202
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 203
    .line 204
    .line 205
    move-result p2

    .line 206
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p0:Z

    .line 207
    .line 208
    sget p2, Ll/rhc0;->U:I

    .line 209
    .line 210
    const p3, -0x77000001

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 214
    .line 215
    .line 216
    move-result p2

    .line 217
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->A:I

    .line 218
    .line 219
    sget p2, Ll/rhc0;->S:I

    .line 220
    .line 221
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E0:Z

    .line 226
    .line 227
    sget p2, Ll/rhc0;->W:I

    .line 228
    .line 229
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 234
    .line 235
    sget p2, Ll/rhc0;->R:I

    .line 236
    .line 237
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->D:I

    .line 242
    .line 243
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->j()V

    .line 247
    .line 248
    .line 249
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->w:I

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->j:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 16
    .line 17
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->O:I

    .line 18
    .line 19
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F:I

    .line 20
    .line 21
    sub-int v5, v3, v4

    .line 22
    .line 23
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 24
    .line 25
    add-int/2addr v3, v4

    .line 26
    invoke-virtual {v0, v2, v5, v1, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k:Landroid/graphics/Rect;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 32
    .line 33
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 34
    .line 35
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->O:I

    .line 36
    .line 37
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->C:I

    .line 38
    .line 39
    div-int/lit8 v4, p0, 0x2

    .line 40
    .line 41
    sub-int v4, v3, v4

    .line 42
    .line 43
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    div-int/lit8 p0, p0, 0x2

    .line 46
    .line 47
    add-int/2addr v3, p0

    .line 48
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final b(I)I
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    int-to-double v2, p1

    .line 5
    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G:I

    .line 14
    .line 15
    int-to-double p0, p0

    .line 16
    mul-double/2addr v2, p0

    .line 17
    sub-double/2addr v0, v2

    .line 18
    double-to-int p0, v0

    .line 19
    return p0
.end method

.method public final c(I)I
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F:I

    .line 6
    .line 7
    if-le v0, v1, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    neg-int p0, p0

    .line 16
    sub-int/2addr p0, p1

    .line 17
    return p0

    .line 18
    :cond_0
    sub-int/2addr p0, p1

    .line 19
    return p0

    .line 20
    :cond_1
    neg-int p0, p1

    .line 21
    return p0
.end method

.method public final d()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->D:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->N:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->P:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->P:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->P:I

    .line 26
    .line 27
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->O:I

    .line 28
    .line 29
    int-to-float v0, v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/graphics/Paint;->descent()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    add-float/2addr v1, v2

    .line 43
    const/high16 v2, 0x40000000    # 2.0f

    .line 44
    .line 45
    div-float/2addr v1, v2

    .line 46
    sub-float/2addr v0, v1

    .line 47
    float-to-int v0, v0

    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->Q:I

    .line 49
    .line 50
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 4
    .line 5
    mul-int/2addr v0, v1

    .line 6
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F0:Z

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    const/high16 v1, -0x80000000

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    neg-int v1, v1

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    add-int/lit8 v2, v2, -0x1

    .line 21
    .line 22
    mul-int/2addr v1, v2

    .line 23
    add-int/2addr v1, v0

    .line 24
    :goto_0
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->J:I

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F0:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const v0, 0x7fffffff

    .line 31
    .line 32
    .line 33
    :cond_1
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->K:I

    .line 34
    .line 35
    return-void
.end method

.method public final f()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->y:I

    .line 7
    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->O:I

    .line 11
    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F:I

    .line 13
    .line 14
    add-int v3, v1, v2

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 20
    .line 21
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    sub-int v6, v3, v0

    .line 24
    .line 25
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 26
    .line 27
    add-int/2addr v3, v0

    .line 28
    invoke-virtual {v2, v5, v6, v4, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->i:Landroid/graphics/Rect;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 34
    .line 35
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    sub-int v4, v1, v0

    .line 38
    .line 39
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    add-int/2addr v1, v0

    .line 42
    invoke-virtual {v2, v3, v4, p0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final g(I)I
    .locals 2

    .line 1
    int-to-double v0, p1

    .line 2
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G:I

    .line 11
    .line 12
    int-to-double p0, p0

    .line 13
    mul-double/2addr v0, p0

    .line 14
    double-to-int p0, v0

    .line 15
    return p0
.end method

.method public getCurrentItemPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurtainColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIndicatorColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public getIndicatorSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemAlign()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemSpace()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaximumWidthText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaximumWidthTextPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->S:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectItem()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I:I

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSelectedItemPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectedItemTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getVisibleItemCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public h()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->u:I

    .line 3
    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->t:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->W:Z

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    float-to-int v0, v0

    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->t:I

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->S:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k(I)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 50
    .line 51
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->S:I

    .line 52
    .line 53
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    float-to-int v0, v0

    .line 66
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->t:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    float-to-int v0, v0

    .line 86
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->t:I

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_4

    .line 100
    .line 101
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    float-to-int v1, v1

    .line 116
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->t:I

    .line 117
    .line 118
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->t:I

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 132
    .line 133
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 134
    .line 135
    sub-float/2addr v1, v0

    .line 136
    float-to-int v0, v1

    .line 137
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->u:I

    .line 138
    .line 139
    return-void
.end method

.method public final i(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    int-to-float v1, v1

    .line 12
    cmpg-float v0, v1, v0

    .line 13
    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Landroid/text/TextPaint;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    int-to-float p0, p0

    .line 28
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 29
    .line 30
    invoke-static {p1, v0, p0, v1}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    return-object p1
.end method

.method public final j()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/16 v1, 0x45

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->x:I

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->n()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h()V

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/widget/Scroller;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->L:I

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->M:I

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->V:I

    .line 61
    .line 62
    new-instance v0, Landroid/graphics/Rect;

    .line 63
    .line 64
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 68
    .line 69
    new-instance v0, Landroid/graphics/Rect;

    .line 70
    .line 71
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h:Landroid/graphics/Rect;

    .line 75
    .line 76
    new-instance v0, Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->i:Landroid/graphics/Rect;

    .line 82
    .line 83
    new-instance v0, Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->j:Landroid/graphics/Rect;

    .line 89
    .line 90
    new-instance v0, Landroid/graphics/Rect;

    .line 91
    .line 92
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k:Landroid/graphics/Rect;

    .line 96
    .line 97
    new-instance v0, Landroid/graphics/Camera;

    .line 98
    .line 99
    invoke-direct {v0}, Landroid/graphics/Camera;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 103
    .line 104
    new-instance v0, Landroid/graphics/Matrix;

    .line 105
    .line 106
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 110
    .line 111
    new-instance v0, Landroid/graphics/Matrix;

    .line 112
    .line 113
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->n:Landroid/graphics/Matrix;

    .line 117
    .line 118
    return-void
.end method

.method public final k(I)Z
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ge p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final l(III)I
    .locals 0

    .line 1
    const/high16 p0, 0x40000000    # 2.0f

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    return p2

    .line 6
    :cond_0
    const/high16 p0, -0x80000000

    .line 7
    .line 8
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_1
    return p3
.end method

.method public m(IZ)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->e:Z

    .line 3
    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/widget/Scroller;->isFinished()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getData()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I:I

    .line 23
    .line 24
    sub-int/2addr p1, v1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F0:Z

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    div-int/lit8 v2, p2, 0x2

    .line 37
    .line 38
    if-le v1, v2, :cond_2

    .line 39
    .line 40
    if-lez p1, :cond_1

    .line 41
    .line 42
    neg-int p2, p2

    .line 43
    :cond_1
    add-int/2addr p1, p2

    .line 44
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 45
    .line 46
    invoke-virtual {p2}, Landroid/widget/Scroller;->getCurrY()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    neg-int p1, p1

    .line 51
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 52
    .line 53
    mul-int/2addr p1, v2

    .line 54
    invoke-virtual {p2, v0, v1, v0, p1}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a:Landroid/os/Handler;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 64
    .line 65
    invoke-virtual {p2}, Landroid/widget/Scroller;->isFinished()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_4

    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 72
    .line 73
    invoke-virtual {p2}, Landroid/widget/Scroller;->abortAnimation()V

    .line 74
    .line 75
    .line 76
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    add-int/lit8 p2, p2, -0x1

    .line 83
    .line 84
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 93
    .line 94
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I:I

    .line 95
    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->e()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->D:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 24
    .line 25
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-lt v0, v1, :cond_1

    .line 5
    .line 6
    rem-int/lit8 v2, v0, 0x2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 13
    .line 14
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 15
    .line 16
    add-int/2addr v0, v1

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->r:I

    .line 18
    .line 19
    div-int/2addr v0, v1

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->s:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string p0, "Wheel\'s visible item count can not be less than 2!"

    .line 24
    .line 25
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_8

    .line 14
    .line 15
    :cond_0
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p0:Z

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->A:I

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 27
    .line 28
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k:Landroid/graphics/Rect;

    .line 34
    .line 35
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 41
    .line 42
    neg-int v2, v2

    .line 43
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 44
    .line 45
    div-int/2addr v2, v3

    .line 46
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->s:I

    .line 47
    .line 48
    sub-int/2addr v2, v3

    .line 49
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 50
    .line 51
    add-int/2addr v4, v2

    .line 52
    neg-int v3, v3

    .line 53
    :goto_0
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 54
    .line 55
    add-int/2addr v5, v2

    .line 56
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->r:I

    .line 57
    .line 58
    add-int/2addr v5, v6

    .line 59
    if-ge v4, v5, :cond_14

    .line 60
    .line 61
    iget-boolean v5, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F0:Z

    .line 62
    .line 63
    if-eqz v5, :cond_3

    .line 64
    .line 65
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    rem-int v5, v4, v5

    .line 72
    .line 73
    if-gez v5, :cond_2

    .line 74
    .line 75
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    add-int/2addr v5, v6

    .line 82
    :cond_2
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    goto :goto_1

    .line 93
    :cond_3
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k(I)Z

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    if-eqz v5, :cond_4

    .line 98
    .line 99
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    goto :goto_1

    .line 110
    :cond_4
    const-string v5, ""

    .line 111
    .line 112
    :goto_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    invoke-virtual {v6}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->w()Z

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    const/4 v7, 0x1

    .line 125
    if-eqz v6, :cond_5

    .line 126
    .line 127
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 128
    .line 129
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 130
    .line 131
    .line 132
    :cond_5
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 133
    .line 134
    iget v8, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->v:I

    .line 135
    .line 136
    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 137
    .line 138
    .line 139
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 140
    .line 141
    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 142
    .line 143
    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 144
    .line 145
    .line 146
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->Q:I

    .line 147
    .line 148
    iget v8, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 149
    .line 150
    mul-int v9, v3, v8

    .line 151
    .line 152
    add-int/2addr v9, v6

    .line 153
    iget v10, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 154
    .line 155
    rem-int/2addr v10, v8

    .line 156
    add-int/2addr v9, v10

    .line 157
    iget-boolean v8, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 158
    .line 159
    const/4 v10, -0x1

    .line 160
    const/high16 v11, 0x3f800000    # 1.0f

    .line 161
    .line 162
    if-eqz v8, :cond_c

    .line 163
    .line 164
    sub-int v8, v6, v9

    .line 165
    .line 166
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 167
    .line 168
    .line 169
    move-result v8

    .line 170
    sub-int/2addr v6, v8

    .line 171
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 172
    .line 173
    iget v8, v8, Landroid/graphics/Rect;->top:I

    .line 174
    .line 175
    sub-int/2addr v6, v8

    .line 176
    int-to-float v6, v6

    .line 177
    mul-float/2addr v6, v11

    .line 178
    iget v13, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->Q:I

    .line 179
    .line 180
    sub-int v8, v13, v8

    .line 181
    .line 182
    int-to-float v8, v8

    .line 183
    div-float/2addr v6, v8

    .line 184
    if-le v9, v13, :cond_6

    .line 185
    .line 186
    move v8, v7

    .line 187
    goto :goto_2

    .line 188
    :cond_6
    if-ge v9, v13, :cond_7

    .line 189
    .line 190
    move v8, v10

    .line 191
    goto :goto_2

    .line 192
    :cond_7
    const/4 v8, 0x0

    .line 193
    :goto_2
    sub-float v6, v11, v6

    .line 194
    .line 195
    neg-float v6, v6

    .line 196
    const/high16 v13, 0x42b40000    # 90.0f

    .line 197
    .line 198
    mul-float/2addr v6, v13

    .line 199
    int-to-float v8, v8

    .line 200
    mul-float/2addr v6, v8

    .line 201
    const/high16 v8, -0x3d4c0000    # -90.0f

    .line 202
    .line 203
    cmpg-float v14, v6, v8

    .line 204
    .line 205
    if-gez v14, :cond_8

    .line 206
    .line 207
    move v6, v8

    .line 208
    :cond_8
    cmpl-float v8, v6, v13

    .line 209
    .line 210
    if-lez v8, :cond_9

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_9
    move v13, v6

    .line 214
    :goto_3
    float-to-int v6, v13

    .line 215
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g(I)I

    .line 216
    .line 217
    .line 218
    move-result v8

    .line 219
    iget v14, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->N:I

    .line 220
    .line 221
    iget v15, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->D:I

    .line 222
    .line 223
    if-eq v15, v7, :cond_b

    .line 224
    .line 225
    const/4 v7, 0x2

    .line 226
    if-eq v15, v7, :cond_a

    .line 227
    .line 228
    goto :goto_4

    .line 229
    :cond_a
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 230
    .line 231
    iget v14, v7, Landroid/graphics/Rect;->right:I

    .line 232
    .line 233
    goto :goto_4

    .line 234
    :cond_b
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 235
    .line 236
    iget v14, v7, Landroid/graphics/Rect;->left:I

    .line 237
    .line 238
    :goto_4
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->O:I

    .line 239
    .line 240
    sub-int/2addr v7, v8

    .line 241
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 242
    .line 243
    invoke-virtual {v15}, Landroid/graphics/Camera;->save()V

    .line 244
    .line 245
    .line 246
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 247
    .line 248
    invoke-virtual {v15, v13}, Landroid/graphics/Camera;->rotateX(F)V

    .line 249
    .line 250
    .line 251
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 252
    .line 253
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 254
    .line 255
    invoke-virtual {v13, v15}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 256
    .line 257
    .line 258
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 259
    .line 260
    invoke-virtual {v13}, Landroid/graphics/Camera;->restore()V

    .line 261
    .line 262
    .line 263
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 264
    .line 265
    neg-int v15, v14

    .line 266
    int-to-float v15, v15

    .line 267
    move/from16 v16, v11

    .line 268
    .line 269
    neg-int v11, v7

    .line 270
    int-to-float v11, v11

    .line 271
    invoke-virtual {v13, v15, v11}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 272
    .line 273
    .line 274
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 275
    .line 276
    int-to-float v14, v14

    .line 277
    int-to-float v7, v7

    .line 278
    invoke-virtual {v13, v14, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 279
    .line 280
    .line 281
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 282
    .line 283
    invoke-virtual {v13}, Landroid/graphics/Camera;->save()V

    .line 284
    .line 285
    .line 286
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 287
    .line 288
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b(I)I

    .line 289
    .line 290
    .line 291
    move-result v6

    .line 292
    int-to-float v6, v6

    .line 293
    const/4 v12, 0x0

    .line 294
    invoke-virtual {v13, v12, v12, v6}, Landroid/graphics/Camera;->translate(FFF)V

    .line 295
    .line 296
    .line 297
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 298
    .line 299
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->n:Landroid/graphics/Matrix;

    .line 300
    .line 301
    invoke-virtual {v6, v12}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 302
    .line 303
    .line 304
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l:Landroid/graphics/Camera;

    .line 305
    .line 306
    invoke-virtual {v6}, Landroid/graphics/Camera;->restore()V

    .line 307
    .line 308
    .line 309
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->n:Landroid/graphics/Matrix;

    .line 310
    .line 311
    invoke-virtual {v6, v15, v11}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 312
    .line 313
    .line 314
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->n:Landroid/graphics/Matrix;

    .line 315
    .line 316
    invoke-virtual {v6, v14, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 317
    .line 318
    .line 319
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 320
    .line 321
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->n:Landroid/graphics/Matrix;

    .line 322
    .line 323
    invoke-virtual {v6, v7}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 324
    .line 325
    .line 326
    goto :goto_5

    .line 327
    :cond_c
    move/from16 v16, v11

    .line 328
    .line 329
    const/4 v8, 0x0

    .line 330
    :goto_5
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E0:Z

    .line 331
    .line 332
    if-eqz v6, :cond_e

    .line 333
    .line 334
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->Q:I

    .line 335
    .line 336
    sub-int v7, v6, v9

    .line 337
    .line 338
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 339
    .line 340
    .line 341
    move-result v7

    .line 342
    sub-int/2addr v6, v7

    .line 343
    int-to-float v6, v6

    .line 344
    mul-float v6, v6, v16

    .line 345
    .line 346
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->Q:I

    .line 347
    .line 348
    int-to-float v7, v7

    .line 349
    div-float/2addr v6, v7

    .line 350
    const/high16 v7, 0x437f0000    # 255.0f

    .line 351
    .line 352
    mul-float/2addr v6, v7

    .line 353
    float-to-int v6, v6

    .line 354
    if-gez v6, :cond_d

    .line 355
    .line 356
    const/4 v12, 0x0

    .line 357
    goto :goto_6

    .line 358
    :cond_d
    move v12, v6

    .line 359
    :goto_6
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 360
    .line 361
    invoke-virtual {v6, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 362
    .line 363
    .line 364
    :cond_e
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 365
    .line 366
    if-eqz v6, :cond_f

    .line 367
    .line 368
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->Q:I

    .line 369
    .line 370
    sub-int v9, v6, v8

    .line 371
    .line 372
    :cond_f
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->w:I

    .line 373
    .line 374
    if-eq v6, v10, :cond_12

    .line 375
    .line 376
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 377
    .line 378
    .line 379
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 380
    .line 381
    if-eqz v6, :cond_10

    .line 382
    .line 383
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 384
    .line 385
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 386
    .line 387
    .line 388
    :cond_10
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->j:Landroid/graphics/Rect;

    .line 389
    .line 390
    sget-object v7, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 391
    .line 392
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 393
    .line 394
    .line 395
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v6

    .line 399
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->P:I

    .line 400
    .line 401
    int-to-float v7, v7

    .line 402
    int-to-float v8, v9

    .line 403
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 404
    .line 405
    invoke-virtual {v1, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 409
    .line 410
    .line 411
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 412
    .line 413
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->w:I

    .line 414
    .line 415
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 419
    .line 420
    .line 421
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 422
    .line 423
    if-eqz v6, :cond_11

    .line 424
    .line 425
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 426
    .line 427
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 428
    .line 429
    .line 430
    :cond_11
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->j:Landroid/graphics/Rect;

    .line 431
    .line 432
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 433
    .line 434
    .line 435
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v5

    .line 439
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->P:I

    .line 440
    .line 441
    int-to-float v6, v6

    .line 442
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 443
    .line 444
    invoke-virtual {v1, v5, v6, v8, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 445
    .line 446
    .line 447
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 448
    .line 449
    .line 450
    goto :goto_7

    .line 451
    :cond_12
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 452
    .line 453
    .line 454
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 455
    .line 456
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 457
    .line 458
    .line 459
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 460
    .line 461
    if-eqz v6, :cond_13

    .line 462
    .line 463
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m:Landroid/graphics/Matrix;

    .line 464
    .line 465
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 466
    .line 467
    .line 468
    :cond_13
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object v5

    .line 472
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->P:I

    .line 473
    .line 474
    int-to-float v6, v6

    .line 475
    int-to-float v7, v9

    .line 476
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 477
    .line 478
    invoke-virtual {v1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 479
    .line 480
    .line 481
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 482
    .line 483
    .line 484
    :goto_7
    add-int/lit8 v4, v4, 0x1

    .line 485
    .line 486
    add-int/lit8 v3, v3, 0x1

    .line 487
    .line 488
    goto/16 :goto_0

    .line 489
    .line 490
    :cond_14
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k0:Z

    .line 491
    .line 492
    if-eqz v2, :cond_15

    .line 493
    .line 494
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 495
    .line 496
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->z:I

    .line 497
    .line 498
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 499
    .line 500
    .line 501
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 502
    .line 503
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 504
    .line 505
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 506
    .line 507
    .line 508
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h:Landroid/graphics/Rect;

    .line 509
    .line 510
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 511
    .line 512
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 513
    .line 514
    .line 515
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->i:Landroid/graphics/Rect;

    .line 516
    .line 517
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 518
    .line 519
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 520
    .line 521
    .line 522
    :cond_15
    :goto_8
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->t:I

    .line 18
    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->u:I

    .line 20
    .line 21
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 22
    .line 23
    mul-int/2addr v3, v4

    .line 24
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->B:I

    .line 25
    .line 26
    add-int/lit8 v4, v4, -0x1

    .line 27
    .line 28
    mul-int/2addr v5, v4

    .line 29
    add-int/2addr v3, v5

    .line 30
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 31
    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    mul-int/lit8 v3, v3, 0x2

    .line 35
    .line 36
    int-to-double v3, v3

    .line 37
    const-wide v5, 0x400921fb54442d18L    # Math.PI

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    div-double/2addr v3, v5

    .line 43
    double-to-int v3, v3

    .line 44
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    add-int/2addr v4, v5

    .line 53
    add-int/2addr v2, v4

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    add-int/2addr v4, v5

    .line 63
    add-int/2addr v3, v4

    .line 64
    invoke-virtual {p0, v0, p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l(III)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {p0, v1, p2, v3}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->l(III)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sub-int/2addr p4, v0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v0, v1

    .line 29
    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->N:I

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->O:I

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    div-int/lit8 p1, p1, 0x2

    .line 58
    .line 59
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G:I

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->g:Landroid/graphics/Rect;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 68
    .line 69
    div-int/2addr p1, p2

    .line 70
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 71
    .line 72
    div-int/lit8 p1, p1, 0x2

    .line 73
    .line 74
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F:I

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->e()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->f()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_b

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eq v0, v1, :cond_5

    .line 11
    .line 12
    const/4 v4, 0x2

    .line 13
    if-eq v0, v4, :cond_2

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq v0, p1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 34
    .line 35
    if-eqz p1, :cond_f

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 41
    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->U:I

    .line 45
    .line 46
    int-to-float v0, v0

    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    sub-float/2addr v0, v2

    .line 52
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->V:I

    .line 57
    .line 58
    int-to-float v2, v2

    .line 59
    cmpg-float v0, v0, v2

    .line 60
    .line 61
    if-gez v0, :cond_3

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H0:Z

    .line 64
    .line 65
    goto/16 :goto_3

    .line 66
    .line 67
    :cond_3
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H0:Z

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->T:I

    .line 79
    .line 80
    int-to-float v2, v2

    .line 81
    sub-float/2addr v0, v2

    .line 82
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    const/high16 v3, 0x3f800000    # 1.0f

    .line 87
    .line 88
    cmpg-float v2, v2, v3

    .line 89
    .line 90
    if-gez v2, :cond_4

    .line 91
    .line 92
    goto/16 :goto_3

    .line 93
    .line 94
    :cond_4
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 95
    .line 96
    int-to-float v2, v2

    .line 97
    add-float/2addr v2, v0

    .line 98
    float-to-int v0, v2

    .line 99
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    float-to-int p1, p1

    .line 106
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->T:I

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 109
    .line 110
    .line 111
    goto/16 :goto_3

    .line 112
    .line 113
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 124
    .line 125
    .line 126
    :cond_6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H0:Z

    .line 127
    .line 128
    if-eqz v0, :cond_7

    .line 129
    .line 130
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I0:Z

    .line 131
    .line 132
    if-nez v0, :cond_7

    .line 133
    .line 134
    goto/16 :goto_3

    .line 135
    .line 136
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 142
    .line 143
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->M:I

    .line 144
    .line 145
    int-to-float v0, v0

    .line 146
    const/16 v4, 0x3e8

    .line 147
    .line 148
    invoke-virtual {p1, v4, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 149
    .line 150
    .line 151
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I0:Z

    .line 152
    .line 153
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 154
    .line 155
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    float-to-int v8, p1

    .line 160
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->L:I

    .line 165
    .line 166
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 167
    .line 168
    if-le p1, v0, :cond_8

    .line 169
    .line 170
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 171
    .line 172
    iget v11, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->J:I

    .line 173
    .line 174
    iget v12, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->K:I

    .line 175
    .line 176
    const/4 v5, 0x0

    .line 177
    const/4 v7, 0x0

    .line 178
    const/4 v9, 0x0

    .line 179
    const/4 v10, 0x0

    .line 180
    invoke-virtual/range {v4 .. v12}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 184
    .line 185
    invoke-virtual {p1}, Landroid/widget/Scroller;->getFinalY()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 190
    .line 191
    invoke-virtual {v3}, Landroid/widget/Scroller;->getFinalY()I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 196
    .line 197
    rem-int/2addr v3, v4

    .line 198
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c(I)I

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    add-int/2addr v0, v3

    .line 203
    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_8
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 208
    .line 209
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 210
    .line 211
    rem-int v0, p1, v0

    .line 212
    .line 213
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c(I)I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    invoke-virtual {v4, v3, p1, v3, v0}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 218
    .line 219
    .line 220
    :goto_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F0:Z

    .line 221
    .line 222
    if-nez p1, :cond_a

    .line 223
    .line 224
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 225
    .line 226
    invoke-virtual {p1}, Landroid/widget/Scroller;->getFinalY()I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->K:I

    .line 231
    .line 232
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 233
    .line 234
    if-le p1, v0, :cond_9

    .line 235
    .line 236
    invoke-virtual {v3, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 237
    .line 238
    .line 239
    goto :goto_1

    .line 240
    :cond_9
    invoke-virtual {v3}, Landroid/widget/Scroller;->getFinalY()I

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->J:I

    .line 245
    .line 246
    if-ge p1, v0, :cond_a

    .line 247
    .line 248
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 249
    .line 250
    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 251
    .line 252
    .line 253
    :cond_a
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a:Landroid/os/Handler;

    .line 254
    .line 255
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 259
    .line 260
    if-eqz p1, :cond_f

    .line 261
    .line 262
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 263
    .line 264
    .line 265
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_b
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->e:Z

    .line 269
    .line 270
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    if-eqz v0, :cond_c

    .line 275
    .line 276
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 281
    .line 282
    .line 283
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 284
    .line 285
    if-nez v0, :cond_d

    .line 286
    .line 287
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_d
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 295
    .line 296
    .line 297
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 298
    .line 299
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 303
    .line 304
    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-nez v0, :cond_e

    .line 309
    .line 310
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 311
    .line 312
    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 313
    .line 314
    .line 315
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I0:Z

    .line 316
    .line 317
    :cond_e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    float-to-int p1, p1

    .line 322
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->T:I

    .line 323
    .line 324
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->U:I

    .line 325
    .line 326
    :cond_f
    :goto_3
    return v1
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I0:Z

    .line 21
    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E:I

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 30
    .line 31
    neg-int v1, v1

    .line 32
    div-int/2addr v1, v0

    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 34
    .line 35
    add-int/2addr v1, v0

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    rem-int/2addr v1, v0

    .line 43
    if-gez v1, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr v1, v0

    .line 52
    :cond_2
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->e:Z

    .line 59
    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v0, p0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;->a(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    .line 69
    .line 70
    .line 71
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->c:Landroid/widget/Scroller;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a:Landroid/os/Handler;

    .line 91
    .line 92
    const-wide/16 v1, 0x10

    .line 93
    .line 94
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_0
    return-void
.end method

.method public setAtmospheric(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->E0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCurtain(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCurtainColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->A:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCurtainHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->C:I

    .line 2
    .line 3
    return-void
.end method

.method public setCurved(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->G0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCyclic(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->F0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->e()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->I:I

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->H:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->R:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->e()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "WheelPicker\'s data can not be null!"

    .line 30
    .line 31
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setIndicator(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->f()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->z:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIndicatorSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->y:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->f()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setItemAlign(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->D:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->n()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->d()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setItemSpace(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->B:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setItemTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->v:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setItemTextSize(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->x:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setMaximumWidthText(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "Maximum width text can not be null!"

    .line 16
    .line 17
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setMaximumWidthTextPosition(I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->k(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->S:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "Maximum width text Position must in [0, "

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, "), but current is "

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v0, p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw v0
.end method

.method public setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;

    .line 2
    .line 3
    return-void
.end method

.method public setOnWheelChangeListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$b;)V
    .locals 0

    return-void
.end method

.method public setSameWidth(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->W:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setSelectedItemPosition(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setSelectedItemTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->w:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->a()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->h()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setVisibleItemCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->q:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->o()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
