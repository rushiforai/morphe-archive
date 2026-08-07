.class public Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;,
        Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$a;
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

.field public f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;

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

    iput-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a:Landroid/os/Handler;

    .line 253
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    const/4 p1, 0x7

    .line 254
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    const/4 p1, 0x0

    .line 255
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->x:I

    .line 256
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->y:I

    const/16 p1, 0x32

    .line 257
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->L:I

    const/16 p1, 0x1f40

    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->M:I

    const/16 p1, 0x8

    .line 258
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->V:I

    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->j()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 250
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance p3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 17
    .line 18
    const/4 p3, 0x7

    .line 19
    iput p3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->x:I

    .line 23
    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->y:I

    .line 25
    .line 26
    const/16 v1, 0x32

    .line 27
    .line 28
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->L:I

    .line 29
    .line 30
    const/16 v1, 0x1f40

    .line 31
    .line 32
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->M:I

    .line 33
    .line 34
    const/16 v1, 0x8

    .line 35
    .line 36
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->V:I

    .line 37
    .line 38
    sget-object v1, Ll/ohc0;->x:[I

    .line 39
    .line 40
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget p2, Ll/ohc0;->P:I

    .line 45
    .line 46
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 51
    .line 52
    sget p2, Ll/ohc0;->N:I

    .line 53
    .line 54
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 59
    .line 60
    sget p2, Ll/ohc0;->M:I

    .line 61
    .line 62
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->W:Z

    .line 67
    .line 68
    sget p2, Ll/ohc0;->L:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->S:I

    .line 76
    .line 77
    sget p2, Ll/ohc0;->K:I

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iput-object p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p:Ljava/lang/String;

    .line 84
    .line 85
    sget p2, Ll/ohc0;->H:I

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
    sget v1, Ll/eac0;->g:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->B:I

    .line 106
    .line 107
    sget p2, Ll/ohc0;->C:I

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
    sget v1, Ll/eac0;->g:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->C:I

    .line 128
    .line 129
    sget p2, Ll/ohc0;->J:I

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
    sget v1, Ll/eac0;->h:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->x:I

    .line 150
    .line 151
    sget p2, Ll/ohc0;->O:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->w:I

    .line 161
    .line 162
    sget p2, Ll/ohc0;->I:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->v:I

    .line 172
    .line 173
    sget p2, Ll/ohc0;->E:I

    .line 174
    .line 175
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F0:Z

    .line 180
    .line 181
    sget p2, Ll/ohc0;->F:I

    .line 182
    .line 183
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k0:Z

    .line 188
    .line 189
    sget p2, Ll/ohc0;->G:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->z:I

    .line 199
    .line 200
    sget p2, Ll/ohc0;->A:I

    .line 201
    .line 202
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 203
    .line 204
    .line 205
    move-result p2

    .line 206
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p0:Z

    .line 207
    .line 208
    sget p2, Ll/ohc0;->B:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->A:I

    .line 218
    .line 219
    sget p2, Ll/ohc0;->z:I

    .line 220
    .line 221
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E0:Z

    .line 226
    .line 227
    sget p2, Ll/ohc0;->D:I

    .line 228
    .line 229
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

    .line 234
    .line 235
    sget p2, Ll/ohc0;->y:I

    .line 236
    .line 237
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    iput p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->D:I

    .line 242
    .line 243
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->j()V

    .line 247
    .line 248
    .line 249
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->w:I

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->j:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 16
    .line 17
    iget v3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->O:I

    .line 18
    .line 19
    iget v4, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F:I

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k:Landroid/graphics/Rect;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 32
    .line 33
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 34
    .line 35
    iget v3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->O:I

    .line 36
    .line 37
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->C:I

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
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G:I

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
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G:I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F:I

    .line 6
    .line 7
    if-le v0, v1, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

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
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->D:I

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
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->N:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->P:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->P:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->P:I

    .line 26
    .line 27
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->O:I

    .line 28
    .line 29
    int-to-float v0, v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->Q:I

    .line 49
    .line 50
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 4
    .line 5
    mul-int/2addr v0, v1

    .line 6
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F0:Z

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->J:I

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F0:Z

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
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->K:I

    .line 34
    .line 35
    return-void
.end method

.method public final f()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->y:I

    .line 7
    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->O:I

    .line 11
    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F:I

    .line 13
    .line 14
    add-int v3, v1, v2

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->i:Landroid/graphics/Rect;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

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
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G:I

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
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurtainColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIndicatorColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public getIndicatorSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemAlign()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemSpace()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaximumWidthText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaximumWidthTextPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->S:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectItem()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I:I

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
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectedItemTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    iget p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public h()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->u:I

    .line 3
    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->t:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->W:Z

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->t:I

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->S:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k(I)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 50
    .line 51
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->S:I

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
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->t:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p:Ljava/lang/String;

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
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->t:I

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->t:I

    .line 117
    .line 118
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->t:I

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->u:I

    .line 138
    .line 139
    return-void
.end method

.method public final i(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->x:I

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->n()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

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
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->L:I

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->M:I

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->V:I

    .line 61
    .line 62
    new-instance v0, Landroid/graphics/Rect;

    .line 63
    .line 64
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 68
    .line 69
    new-instance v0, Landroid/graphics/Rect;

    .line 70
    .line 71
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h:Landroid/graphics/Rect;

    .line 75
    .line 76
    new-instance v0, Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->i:Landroid/graphics/Rect;

    .line 82
    .line 83
    new-instance v0, Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->j:Landroid/graphics/Rect;

    .line 89
    .line 90
    new-instance v0, Landroid/graphics/Rect;

    .line 91
    .line 92
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k:Landroid/graphics/Rect;

    .line 96
    .line 97
    new-instance v0, Landroid/graphics/Camera;

    .line 98
    .line 99
    invoke-direct {v0}, Landroid/graphics/Camera;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 103
    .line 104
    new-instance v0, Landroid/graphics/Matrix;

    .line 105
    .line 106
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 110
    .line 111
    new-instance v0, Landroid/graphics/Matrix;

    .line 112
    .line 113
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->n:Landroid/graphics/Matrix;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->e:Z

    .line 3
    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->getData()Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I:I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F0:Z

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

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
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 52
    .line 53
    mul-int/2addr p1, v2

    .line 54
    invoke-virtual {p2, v0, v1, v0, p1}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a:Landroid/os/Handler;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 72
    .line 73
    invoke-virtual {p2}, Landroid/widget/Scroller;->abortAnimation()V

    .line 74
    .line 75
    .line 76
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 93
    .line 94
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I:I

    .line 95
    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->e()V

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
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->D:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

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
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 13
    .line 14
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 15
    .line 16
    add-int/2addr v0, v1

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->r:I

    .line 18
    .line 19
    div-int/2addr v0, v1

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->s:I

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
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget v3, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 10
    .line 11
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;->b(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    goto/16 :goto_8

    .line 23
    .line 24
    :cond_1
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p0:Z

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 29
    .line 30
    iget v3, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->A:I

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 36
    .line 37
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k:Landroid/graphics/Rect;

    .line 43
    .line 44
    iget-object v3, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 50
    .line 51
    neg-int v2, v2

    .line 52
    iget v3, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 53
    .line 54
    div-int/2addr v2, v3

    .line 55
    iget v3, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->s:I

    .line 56
    .line 57
    sub-int/2addr v2, v3

    .line 58
    iget v4, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 59
    .line 60
    add-int/2addr v4, v2

    .line 61
    neg-int v3, v3

    .line 62
    :goto_0
    iget v5, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 63
    .line 64
    add-int/2addr v5, v2

    .line 65
    iget v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->r:I

    .line 66
    .line 67
    add-int/2addr v5, v6

    .line 68
    if-ge v4, v5, :cond_14

    .line 69
    .line 70
    iget-boolean v5, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F0:Z

    .line 71
    .line 72
    if-eqz v5, :cond_4

    .line 73
    .line 74
    iget-object v5, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    rem-int v5, v4, v5

    .line 81
    .line 82
    if-gez v5, :cond_3

    .line 83
    .line 84
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    add-int/2addr v5, v6

    .line 91
    :cond_3
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    goto :goto_1

    .line 102
    :cond_4
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k(I)Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_5

    .line 107
    .line 108
    iget-object v5, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    goto :goto_1

    .line 119
    :cond_5
    const-string v5, ""

    .line 120
    .line 121
    :goto_1
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 122
    .line 123
    iget v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->v:I

    .line 124
    .line 125
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 126
    .line 127
    .line 128
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 129
    .line 130
    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 131
    .line 132
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 133
    .line 134
    .line 135
    iget v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->Q:I

    .line 136
    .line 137
    iget v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 138
    .line 139
    mul-int v8, v3, v7

    .line 140
    .line 141
    add-int/2addr v8, v6

    .line 142
    iget v9, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 143
    .line 144
    rem-int/2addr v9, v7

    .line 145
    add-int/2addr v8, v9

    .line 146
    iget-boolean v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

    .line 147
    .line 148
    const/4 v9, -0x1

    .line 149
    const/high16 v10, 0x3f800000    # 1.0f

    .line 150
    .line 151
    if-eqz v7, :cond_c

    .line 152
    .line 153
    sub-int v7, v6, v8

    .line 154
    .line 155
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    sub-int/2addr v6, v7

    .line 160
    iget-object v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 161
    .line 162
    iget v7, v7, Landroid/graphics/Rect;->top:I

    .line 163
    .line 164
    sub-int/2addr v6, v7

    .line 165
    int-to-float v6, v6

    .line 166
    mul-float/2addr v6, v10

    .line 167
    iget v12, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->Q:I

    .line 168
    .line 169
    sub-int v7, v12, v7

    .line 170
    .line 171
    int-to-float v7, v7

    .line 172
    div-float/2addr v6, v7

    .line 173
    const/4 v7, 0x1

    .line 174
    if-le v8, v12, :cond_6

    .line 175
    .line 176
    move v12, v7

    .line 177
    goto :goto_2

    .line 178
    :cond_6
    if-ge v8, v12, :cond_7

    .line 179
    .line 180
    move v12, v9

    .line 181
    goto :goto_2

    .line 182
    :cond_7
    const/4 v12, 0x0

    .line 183
    :goto_2
    sub-float v6, v10, v6

    .line 184
    .line 185
    neg-float v6, v6

    .line 186
    const/high16 v13, 0x42b40000    # 90.0f

    .line 187
    .line 188
    mul-float/2addr v6, v13

    .line 189
    int-to-float v12, v12

    .line 190
    mul-float/2addr v6, v12

    .line 191
    const/high16 v12, -0x3d4c0000    # -90.0f

    .line 192
    .line 193
    cmpg-float v14, v6, v12

    .line 194
    .line 195
    if-gez v14, :cond_8

    .line 196
    .line 197
    move v6, v12

    .line 198
    :cond_8
    cmpl-float v12, v6, v13

    .line 199
    .line 200
    if-lez v12, :cond_9

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_9
    move v13, v6

    .line 204
    :goto_3
    float-to-int v6, v13

    .line 205
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g(I)I

    .line 206
    .line 207
    .line 208
    move-result v12

    .line 209
    iget v14, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->N:I

    .line 210
    .line 211
    iget v15, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->D:I

    .line 212
    .line 213
    if-eq v15, v7, :cond_b

    .line 214
    .line 215
    const/4 v7, 0x2

    .line 216
    if-eq v15, v7, :cond_a

    .line 217
    .line 218
    goto :goto_4

    .line 219
    :cond_a
    iget-object v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 220
    .line 221
    iget v14, v7, Landroid/graphics/Rect;->right:I

    .line 222
    .line 223
    goto :goto_4

    .line 224
    :cond_b
    iget-object v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 225
    .line 226
    iget v14, v7, Landroid/graphics/Rect;->left:I

    .line 227
    .line 228
    :goto_4
    iget v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->O:I

    .line 229
    .line 230
    sub-int/2addr v7, v12

    .line 231
    iget-object v15, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 232
    .line 233
    invoke-virtual {v15}, Landroid/graphics/Camera;->save()V

    .line 234
    .line 235
    .line 236
    iget-object v15, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 237
    .line 238
    invoke-virtual {v15, v13}, Landroid/graphics/Camera;->rotateX(F)V

    .line 239
    .line 240
    .line 241
    iget-object v13, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 242
    .line 243
    iget-object v15, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 244
    .line 245
    invoke-virtual {v13, v15}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 246
    .line 247
    .line 248
    iget-object v13, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 249
    .line 250
    invoke-virtual {v13}, Landroid/graphics/Camera;->restore()V

    .line 251
    .line 252
    .line 253
    iget-object v13, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 254
    .line 255
    neg-int v15, v14

    .line 256
    int-to-float v15, v15

    .line 257
    move/from16 v16, v10

    .line 258
    .line 259
    neg-int v10, v7

    .line 260
    int-to-float v10, v10

    .line 261
    invoke-virtual {v13, v15, v10}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 262
    .line 263
    .line 264
    iget-object v13, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 265
    .line 266
    int-to-float v14, v14

    .line 267
    int-to-float v7, v7

    .line 268
    invoke-virtual {v13, v14, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 269
    .line 270
    .line 271
    iget-object v13, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 272
    .line 273
    invoke-virtual {v13}, Landroid/graphics/Camera;->save()V

    .line 274
    .line 275
    .line 276
    iget-object v13, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 277
    .line 278
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b(I)I

    .line 279
    .line 280
    .line 281
    move-result v6

    .line 282
    int-to-float v6, v6

    .line 283
    const/4 v11, 0x0

    .line 284
    invoke-virtual {v13, v11, v11, v6}, Landroid/graphics/Camera;->translate(FFF)V

    .line 285
    .line 286
    .line 287
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 288
    .line 289
    iget-object v11, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->n:Landroid/graphics/Matrix;

    .line 290
    .line 291
    invoke-virtual {v6, v11}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 292
    .line 293
    .line 294
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l:Landroid/graphics/Camera;

    .line 295
    .line 296
    invoke-virtual {v6}, Landroid/graphics/Camera;->restore()V

    .line 297
    .line 298
    .line 299
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->n:Landroid/graphics/Matrix;

    .line 300
    .line 301
    invoke-virtual {v6, v15, v10}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 302
    .line 303
    .line 304
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->n:Landroid/graphics/Matrix;

    .line 305
    .line 306
    invoke-virtual {v6, v14, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 307
    .line 308
    .line 309
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 310
    .line 311
    iget-object v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->n:Landroid/graphics/Matrix;

    .line 312
    .line 313
    invoke-virtual {v6, v7}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 314
    .line 315
    .line 316
    goto :goto_5

    .line 317
    :cond_c
    move/from16 v16, v10

    .line 318
    .line 319
    const/4 v12, 0x0

    .line 320
    :goto_5
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E0:Z

    .line 321
    .line 322
    if-eqz v6, :cond_e

    .line 323
    .line 324
    iget v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->Q:I

    .line 325
    .line 326
    sub-int v7, v6, v8

    .line 327
    .line 328
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 329
    .line 330
    .line 331
    move-result v7

    .line 332
    sub-int/2addr v6, v7

    .line 333
    int-to-float v6, v6

    .line 334
    mul-float v6, v6, v16

    .line 335
    .line 336
    iget v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->Q:I

    .line 337
    .line 338
    int-to-float v7, v7

    .line 339
    div-float/2addr v6, v7

    .line 340
    const/high16 v7, 0x437f0000    # 255.0f

    .line 341
    .line 342
    mul-float/2addr v6, v7

    .line 343
    float-to-int v6, v6

    .line 344
    if-gez v6, :cond_d

    .line 345
    .line 346
    const/4 v11, 0x0

    .line 347
    goto :goto_6

    .line 348
    :cond_d
    move v11, v6

    .line 349
    :goto_6
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 350
    .line 351
    invoke-virtual {v6, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 352
    .line 353
    .line 354
    :cond_e
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

    .line 355
    .line 356
    if-eqz v6, :cond_f

    .line 357
    .line 358
    iget v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->Q:I

    .line 359
    .line 360
    sub-int v8, v6, v12

    .line 361
    .line 362
    :cond_f
    iget v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->w:I

    .line 363
    .line 364
    if-eq v6, v9, :cond_12

    .line 365
    .line 366
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 367
    .line 368
    .line 369
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

    .line 370
    .line 371
    if-eqz v6, :cond_10

    .line 372
    .line 373
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 374
    .line 375
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 376
    .line 377
    .line 378
    :cond_10
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->j:Landroid/graphics/Rect;

    .line 379
    .line 380
    sget-object v7, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 381
    .line 382
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 383
    .line 384
    .line 385
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v6

    .line 389
    iget v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->P:I

    .line 390
    .line 391
    int-to-float v7, v7

    .line 392
    int-to-float v8, v8

    .line 393
    iget-object v9, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 394
    .line 395
    invoke-virtual {v1, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 399
    .line 400
    .line 401
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 402
    .line 403
    iget v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->w:I

    .line 404
    .line 405
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 409
    .line 410
    .line 411
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

    .line 412
    .line 413
    if-eqz v6, :cond_11

    .line 414
    .line 415
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 416
    .line 417
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 418
    .line 419
    .line 420
    :cond_11
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->j:Landroid/graphics/Rect;

    .line 421
    .line 422
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 423
    .line 424
    .line 425
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v5

    .line 429
    iget v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->P:I

    .line 430
    .line 431
    int-to-float v6, v6

    .line 432
    iget-object v7, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 433
    .line 434
    invoke-virtual {v1, v5, v6, v8, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 438
    .line 439
    .line 440
    goto :goto_7

    .line 441
    :cond_12
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 442
    .line 443
    .line 444
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 445
    .line 446
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 447
    .line 448
    .line 449
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

    .line 450
    .line 451
    if-eqz v6, :cond_13

    .line 452
    .line 453
    iget-object v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m:Landroid/graphics/Matrix;

    .line 454
    .line 455
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 456
    .line 457
    .line 458
    :cond_13
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v5

    .line 462
    iget v6, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->P:I

    .line 463
    .line 464
    int-to-float v6, v6

    .line 465
    int-to-float v7, v8

    .line 466
    iget-object v8, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 467
    .line 468
    invoke-virtual {v1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 472
    .line 473
    .line 474
    :goto_7
    add-int/lit8 v4, v4, 0x1

    .line 475
    .line 476
    add-int/lit8 v3, v3, 0x1

    .line 477
    .line 478
    goto/16 :goto_0

    .line 479
    .line 480
    :cond_14
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k0:Z

    .line 481
    .line 482
    if-eqz v2, :cond_15

    .line 483
    .line 484
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 485
    .line 486
    iget v3, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->z:I

    .line 487
    .line 488
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 489
    .line 490
    .line 491
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 492
    .line 493
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 494
    .line 495
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 496
    .line 497
    .line 498
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h:Landroid/graphics/Rect;

    .line 499
    .line 500
    iget-object v3, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 501
    .line 502
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 503
    .line 504
    .line 505
    iget-object v2, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->i:Landroid/graphics/Rect;

    .line 506
    .line 507
    iget-object v0, v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 508
    .line 509
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 510
    .line 511
    .line 512
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
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->t:I

    .line 18
    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->u:I

    .line 20
    .line 21
    iget v4, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 22
    .line 23
    mul-int/2addr v3, v4

    .line 24
    iget v5, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->B:I

    .line 25
    .line 26
    add-int/lit8 v4, v4, -0x1

    .line 27
    .line 28
    mul-int/2addr v5, v4

    .line 29
    add-int/2addr v3, v5

    .line 30
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

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
    invoke-virtual {p0, v0, p1, v2}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l(III)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {p0, v1, p2, v3}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->l(III)I

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->N:I

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->O:I

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G:I

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->g:Landroid/graphics/Rect;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget p2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 68
    .line 69
    div-int/2addr p1, p2

    .line 70
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 71
    .line 72
    div-int/lit8 p1, p1, 0x2

    .line 73
    .line 74
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F:I

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->e()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a()V

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
    if-eqz v0, :cond_c

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eq v0, v1, :cond_6

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 34
    .line 35
    if-eqz p1, :cond_10

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 41
    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->U:I

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
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->V:I

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
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H0:Z

    .line 64
    .line 65
    goto/16 :goto_3

    .line 66
    .line 67
    :cond_3
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H0:Z

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;

    .line 75
    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;->c(I)V

    .line 79
    .line 80
    .line 81
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->T:I

    .line 86
    .line 87
    int-to-float v2, v2

    .line 88
    sub-float/2addr v0, v2

    .line 89
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    const/high16 v3, 0x3f800000    # 1.0f

    .line 94
    .line 95
    cmpg-float v2, v2, v3

    .line 96
    .line 97
    if-gez v2, :cond_5

    .line 98
    .line 99
    goto/16 :goto_3

    .line 100
    .line 101
    :cond_5
    iget v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 102
    .line 103
    int-to-float v2, v2

    .line 104
    add-float/2addr v2, v0

    .line 105
    float-to-int v0, v2

    .line 106
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    float-to-int p1, p1

    .line 113
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->T:I

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 116
    .line 117
    .line 118
    goto/16 :goto_3

    .line 119
    .line 120
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-eqz v0, :cond_7

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 131
    .line 132
    .line 133
    :cond_7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H0:Z

    .line 134
    .line 135
    if-eqz v0, :cond_8

    .line 136
    .line 137
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I0:Z

    .line 138
    .line 139
    if-nez v0, :cond_8

    .line 140
    .line 141
    goto/16 :goto_3

    .line 142
    .line 143
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 144
    .line 145
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 149
    .line 150
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->M:I

    .line 151
    .line 152
    int-to-float v0, v0

    .line 153
    const/16 v4, 0x3e8

    .line 154
    .line 155
    invoke-virtual {p1, v4, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 156
    .line 157
    .line 158
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I0:Z

    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 161
    .line 162
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    float-to-int v8, p1

    .line 167
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->L:I

    .line 172
    .line 173
    iget-object v4, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 174
    .line 175
    if-le p1, v0, :cond_9

    .line 176
    .line 177
    iget v6, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 178
    .line 179
    iget v11, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->J:I

    .line 180
    .line 181
    iget v12, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->K:I

    .line 182
    .line 183
    const/4 v5, 0x0

    .line 184
    const/4 v7, 0x0

    .line 185
    const/4 v9, 0x0

    .line 186
    const/4 v10, 0x0

    .line 187
    invoke-virtual/range {v4 .. v12}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 191
    .line 192
    invoke-virtual {p1}, Landroid/widget/Scroller;->getFinalY()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iget-object v3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 197
    .line 198
    invoke-virtual {v3}, Landroid/widget/Scroller;->getFinalY()I

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    iget v4, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 203
    .line 204
    rem-int/2addr v3, v4

    .line 205
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c(I)I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    add-int/2addr v0, v3

    .line 210
    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 211
    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_9
    iget p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 215
    .line 216
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 217
    .line 218
    rem-int v0, p1, v0

    .line 219
    .line 220
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c(I)I

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    invoke-virtual {v4, v3, p1, v3, v0}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 225
    .line 226
    .line 227
    :goto_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F0:Z

    .line 228
    .line 229
    if-nez p1, :cond_b

    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 232
    .line 233
    invoke-virtual {p1}, Landroid/widget/Scroller;->getFinalY()I

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->K:I

    .line 238
    .line 239
    iget-object v3, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 240
    .line 241
    if-le p1, v0, :cond_a

    .line 242
    .line 243
    invoke-virtual {v3, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 244
    .line 245
    .line 246
    goto :goto_1

    .line 247
    :cond_a
    invoke-virtual {v3}, Landroid/widget/Scroller;->getFinalY()I

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->J:I

    .line 252
    .line 253
    if-ge p1, v0, :cond_b

    .line 254
    .line 255
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 256
    .line 257
    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 258
    .line 259
    .line 260
    :cond_b
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a:Landroid/os/Handler;

    .line 261
    .line 262
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 263
    .line 264
    .line 265
    iget-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 266
    .line 267
    if-eqz p1, :cond_10

    .line 268
    .line 269
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 270
    .line 271
    .line 272
    iput-object v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 273
    .line 274
    goto :goto_3

    .line 275
    :cond_c
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->e:Z

    .line 276
    .line 277
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    if-eqz v0, :cond_d

    .line 282
    .line 283
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 288
    .line 289
    .line 290
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 291
    .line 292
    if-nez v0, :cond_e

    .line 293
    .line 294
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    iput-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 299
    .line 300
    goto :goto_2

    .line 301
    :cond_e
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 302
    .line 303
    .line 304
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d:Landroid/view/VelocityTracker;

    .line 305
    .line 306
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 307
    .line 308
    .line 309
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 310
    .line 311
    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-nez v0, :cond_f

    .line 316
    .line 317
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 318
    .line 319
    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 320
    .line 321
    .line 322
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I0:Z

    .line 323
    .line 324
    :cond_f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 325
    .line 326
    .line 327
    move-result p1

    .line 328
    float-to-int p1, p1

    .line 329
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->T:I

    .line 330
    .line 331
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->U:I

    .line 332
    .line 333
    :cond_10
    :goto_3
    return v1
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_5

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I0:Z

    .line 21
    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E:I

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 30
    .line 31
    neg-int v1, v1

    .line 32
    div-int/2addr v1, v0

    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 34
    .line 35
    add-int/2addr v1, v0

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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
    iput v1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->e:Z

    .line 59
    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;->a(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;

    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;->c(I)V

    .line 69
    .line 70
    .line 71
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;

    .line 80
    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    const/4 v1, 0x2

    .line 84
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;->c(I)V

    .line 85
    .line 86
    .line 87
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->c:Landroid/widget/Scroller;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a:Landroid/os/Handler;

    .line 99
    .line 100
    const-wide/16 v1, 0x10

    .line 101
    .line 102
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 103
    .line 104
    .line 105
    :cond_5
    :goto_0
    return-void
.end method

.method public setAtmospheric(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->E0:Z

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a()V

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->A:I

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->C:I

    .line 2
    .line 3
    return-void
.end method

.method public setCurved(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->G0:Z

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->F0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->e()V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->I:I

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->H:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->R:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->e()V

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k0:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f()V

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->z:I

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->y:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f()V

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->D:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->n()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->d()V

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->B:I

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->v:I

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->x:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h()V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h()V

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->k(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->S:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h()V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o:Ljava/util/List;

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

.method public setOnItemSelectedListener(Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$a;)V
    .locals 0

    return-void
.end method

.method public setOnWheelChangeListener(Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;

    .line 2
    .line 3
    return-void
.end method

.method public setSameWidth(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->W:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h()V

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
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->m(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setSelectedItemTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->w:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->a()V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->b:Landroid/graphics/Paint;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->h()V

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
    iput p1, p0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->q:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->o()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
