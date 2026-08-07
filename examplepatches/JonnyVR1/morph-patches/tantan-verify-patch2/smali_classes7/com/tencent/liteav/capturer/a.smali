.class public Lcom/tencent/liteav/capturer/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$AutoFocusCallback;
.implements Landroid/hardware/Camera$ErrorCallback;
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/capturer/a$a;
    }
.end annotation


# instance fields
.field private a:Landroid/graphics/Matrix;

.field private b:I

.field private c:Landroid/hardware/Camera;

.field private d:Z

.field private e:Lcom/tencent/liteav/capturer/b;

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:Landroid/graphics/SurfaceTexture;

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:I

.field private r:I

.field private s:Z

.field private t:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/capturer/a;->a:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/tencent/liteav/capturer/a;->b:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Lcom/tencent/liteav/capturer/a;->d:Z

    .line 16
    .line 17
    const/16 v2, 0xf

    .line 18
    .line 19
    iput v2, p0, Lcom/tencent/liteav/capturer/a;->f:I

    .line 20
    .line 21
    iput v1, p0, Lcom/tencent/liteav/capturer/a;->g:I

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/tencent/liteav/capturer/a;->p:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/tencent/liteav/capturer/a;->s:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/tencent/liteav/capturer/a;->t:Z

    .line 28
    .line 29
    return-void
.end method

.method private a(FFF)Landroid/graphics/Rect;
    .locals 3

    const/high16 v0, 0x43480000    # 200.0f

    mul-float/2addr p3, v0

    .line 281
    iget-boolean v0, p0, Lcom/tencent/liteav/capturer/a;->d:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float p1, v0, p1

    .line 282
    :cond_0
    iget p0, p0, Lcom/tencent/liteav/capturer/a;->j:I

    div-int/lit8 p0, p0, 0x5a

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_1

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float/2addr p1, v1

    sub-float/2addr p2, v1

    neg-float p2, p2

    neg-float p2, p2

    neg-float p1, p1

    add-float/2addr p2, v1

    add-float/2addr p1, v1

    add-int/lit8 v0, v0, 0x1

    move v2, p2

    move p2, p1

    move p1, v2

    goto :goto_0

    :cond_1
    const/high16 p0, 0x44fa0000    # 2000.0f

    mul-float/2addr p1, p0

    const/high16 v0, 0x447a0000    # 1000.0f

    sub-float/2addr p1, v0

    float-to-int p1, p1

    mul-float/2addr p2, p0

    sub-float/2addr p2, v0

    float-to-int p0, p2

    const/16 p2, -0x3e8

    if-ge p1, p2, :cond_2

    move p1, p2

    :cond_2
    if-ge p0, p2, :cond_3

    move p0, p2

    :cond_3
    float-to-int p2, p3

    add-int p3, p1, p2

    add-int/2addr p2, p0

    const/16 v0, 0x3e8

    if-le p3, v0, :cond_4

    move p3, v0

    :cond_4
    if-le p2, v0, :cond_5

    move p2, v0

    .line 283
    :cond_5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1, p0, p3, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v0
.end method

.method private static a(Landroid/hardware/Camera$Parameters;II)Lcom/tencent/liteav/basic/util/d;
    .locals 10

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "TXCCameraCapturer"

    .line 14
    .line 15
    const-string v2, "camera preview wanted: %d x %d"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    int-to-float v0, p1

    .line 25
    const/high16 v2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    mul-float/2addr v0, v2

    .line 28
    int-to-float v3, p2

    .line 29
    div-float/2addr v0, v3

    .line 30
    new-instance v3, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const v4, 0x7fffffff

    .line 40
    .line 41
    .line 42
    move v5, v4

    .line 43
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    if-eqz v6, :cond_4

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    check-cast v6, Landroid/hardware/Camera$Size;

    .line 54
    .line 55
    iget v7, v6, Landroid/hardware/Camera$Size;->width:I

    .line 56
    .line 57
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    iget v8, v6, Landroid/hardware/Camera$Size;->height:I

    .line 62
    .line 63
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    const-string v8, "camera support preview size: %dx%d"

    .line 72
    .line 73
    invoke-static {v1, v8, v7}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget v7, v6, Landroid/hardware/Camera$Size;->width:I

    .line 77
    .line 78
    const/16 v8, 0x280

    .line 79
    .line 80
    if-lt v7, v8, :cond_2

    .line 81
    .line 82
    iget v8, v6, Landroid/hardware/Camera$Size;->height:I

    .line 83
    .line 84
    const/16 v9, 0x1e0

    .line 85
    .line 86
    if-ge v8, v9, :cond_1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    int-to-float v7, v7

    .line 90
    mul-float/2addr v7, v2

    .line 91
    int-to-float v8, v8

    .line 92
    div-float/2addr v7, v8

    .line 93
    sub-float/2addr v7, v0

    .line 94
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    const/high16 v8, 0x41200000    # 10.0f

    .line 99
    .line 100
    mul-float/2addr v7, v8

    .line 101
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    goto :goto_2

    .line 106
    :cond_2
    :goto_1
    move v7, v4

    .line 107
    :goto_2
    if-ge v7, v5, :cond_3

    .line 108
    .line 109
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 110
    .line 111
    .line 112
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move v5, v7

    .line 116
    goto :goto_0

    .line 117
    :cond_3
    if-ne v7, v5, :cond_0

    .line 118
    .line 119
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    new-instance p0, Lcom/tencent/liteav/capturer/a$1;

    .line 124
    .line 125
    invoke-direct {p0}, Lcom/tencent/liteav/capturer/a$1;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-static {v3, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 129
    .line 130
    .line 131
    const/4 p0, 0x0

    .line 132
    invoke-interface {v3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    check-cast p0, Landroid/hardware/Camera$Size;

    .line 137
    .line 138
    mul-int/2addr p1, p2

    .line 139
    int-to-float p1, p1

    .line 140
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    const/high16 v0, 0x4f000000

    .line 145
    .line 146
    :cond_5
    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    if-eqz v2, :cond_6

    .line 151
    .line 152
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    check-cast v2, Landroid/hardware/Camera$Size;

    .line 157
    .line 158
    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    .line 159
    .line 160
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    iget v4, v2, Landroid/hardware/Camera$Size;->height:I

    .line 165
    .line 166
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    const-string v4, "size in same buck: %dx%d"

    .line 175
    .line 176
    invoke-static {v1, v4, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    .line 180
    .line 181
    iget v4, v2, Landroid/hardware/Camera$Size;->height:I

    .line 182
    .line 183
    mul-int/2addr v3, v4

    .line 184
    int-to-float v3, v3

    .line 185
    div-float v4, v3, p1

    .line 186
    .line 187
    float-to-double v4, v4

    .line 188
    const-wide v6, 0x3feccccccccccccdL    # 0.9

    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    cmpl-double v4, v4, v6

    .line 194
    .line 195
    if-ltz v4, :cond_5

    .line 196
    .line 197
    sub-float/2addr v3, p1

    .line 198
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    cmpg-float v4, v4, v0

    .line 203
    .line 204
    if-gez v4, :cond_5

    .line 205
    .line 206
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    move v0, p0

    .line 211
    move-object p0, v2

    .line 212
    goto :goto_3

    .line 213
    :cond_6
    iget p1, p0, Landroid/hardware/Camera$Size;->width:I

    .line 214
    .line 215
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iget p2, p0, Landroid/hardware/Camera$Size;->height:I

    .line 220
    .line 221
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    const-string p2, "best match preview size: %d x %d"

    .line 230
    .line 231
    invoke-static {v1, p2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    new-instance p1, Lcom/tencent/liteav/basic/util/d;

    .line 235
    .line 236
    iget p2, p0, Landroid/hardware/Camera$Size;->width:I

    .line 237
    .line 238
    iget p0, p0, Landroid/hardware/Camera$Size;->height:I

    .line 239
    .line 240
    invoke-direct {p1, p2, p0}, Lcom/tencent/liteav/basic/util/d;-><init>(II)V

    .line 241
    .line 242
    .line 243
    return-object p1
.end method

.method private static b(ZII)Lcom/tencent/liteav/basic/util/d;
    .locals 4

    if-eqz p0, :cond_0

    .line 92
    new-instance p0, Lcom/tencent/liteav/basic/util/d;

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/util/d;-><init>(II)V

    return-object p0

    .line 93
    :cond_0
    new-instance p0, Lcom/tencent/liteav/basic/util/d;

    const/16 v0, 0x438

    const/16 v1, 0x780

    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/util/d;-><init>(II)V

    filled-new-array {p0}, [Lcom/tencent/liteav/basic/util/d;

    move-result-object p0

    .line 94
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    .line 95
    aget-object p0, p0, v2

    .line 96
    iget v2, p0, Lcom/tencent/liteav/basic/util/d;->a:I

    int-to-float v3, v2

    cmpg-float v3, v0, v3

    if-gtz v3, :cond_1

    iget p0, p0, Lcom/tencent/liteav/basic/util/d;->b:I

    int-to-float v3, p0

    cmpg-float v3, v1, v3

    if-gtz v3, :cond_1

    int-to-float v2, v2

    div-float/2addr v2, v0

    int-to-float p0, p0

    div-float/2addr p0, v1

    .line 97
    invoke-static {v2, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    int-to-float p1, p1

    mul-float/2addr p1, p0

    float-to-int p1, p1

    int-to-float p2, p2

    mul-float/2addr p2, p0

    float-to-int p2, p2

    .line 98
    :cond_1
    new-instance p0, Lcom/tencent/liteav/basic/util/d;

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/util/d;-><init>(II)V

    return-object p0
.end method

.method private d(I)I
    .locals 6

    .line 445
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    return v0

    .line 446
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFrameRates()Ljava/util/List;

    move-result-object p0

    .line 447
    const-string v1, "TXCCameraCapturer"

    if-nez p0, :cond_1

    .line 448
    const-string p0, "getSupportedFPS error"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_1
    const/4 v0, 0x0

    .line 449
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 450
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 451
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int v4, v3, p1

    .line 452
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    sub-int v5, v2, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    sub-int/2addr v4, v5

    if-gez v4, :cond_2

    move v2, v3

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 453
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "choose fps="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method

.method private e(I)[I
    .locals 9

    .line 1
    mul-int/lit16 p1, p1, 0x3e8

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "camera supported preview fps range: wantFPS = "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\n"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v3, 0x0

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    return-object v3

    .line 30
    :cond_0
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_4

    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-lez v4, :cond_4

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, [I

    .line 48
    .line 49
    new-instance v5, Lcom/tencent/liteav/capturer/a$2;

    .line 50
    .line 51
    invoke-direct {v5, p0}, Lcom/tencent/liteav/capturer/a$2;-><init>(Lcom/tencent/liteav/capturer/a;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v2, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    const-string v6, " - "

    .line 66
    .line 67
    const/4 v7, 0x1

    .line 68
    if-eqz v5, :cond_1

    .line 69
    .line 70
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    check-cast v5, [I

    .line 75
    .line 76
    new-instance v8, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v0, "camera supported preview fps range: "

    .line 85
    .line 86
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    aget v0, v5, v3

    .line 90
    .line 91
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    aget v0, v5, v7

    .line 98
    .line 99
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    goto :goto_0

    .line 110
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_3

    .line 119
    .line 120
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, [I

    .line 125
    .line 126
    aget v2, v1, v3

    .line 127
    .line 128
    if-gt v2, p1, :cond_2

    .line 129
    .line 130
    aget v2, v1, v7

    .line 131
    .line 132
    if-gt p1, v2, :cond_2

    .line 133
    .line 134
    move-object v4, v1

    .line 135
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string p1, "choose preview fps range: "

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    aget p1, v4, v3

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    aget p1, v4, v7

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    const-string p1, "TXCCameraCapturer"

    .line 166
    .line 167
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-object v4

    .line 171
    :cond_4
    return-object v3
.end method

.method private f(I)I
    .locals 2

    .line 1
    new-instance p0, Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "vsize camera orientation "

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, ", front "

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget v0, p0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    move v0, v1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "TXCCameraCapturer"

    .line 42
    .line 43
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget p1, p0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const/16 v0, 0xb4

    .line 51
    .line 52
    if-ne p1, v0, :cond_2

    .line 53
    .line 54
    :cond_1
    add-int/lit8 p1, p1, 0x5a

    .line 55
    .line 56
    :cond_2
    iget p0, p0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 57
    .line 58
    if-ne p0, v1, :cond_3

    .line 59
    .line 60
    rsub-int p0, p1, 0x168

    .line 61
    .line 62
    rem-int/lit16 p0, p0, 0x168

    .line 63
    .line 64
    return p0

    .line 65
    :cond_3
    add-int/lit16 p1, p1, 0x168

    .line 66
    .line 67
    rem-int/lit16 p1, p1, 0x168

    .line 68
    .line 69
    return p1
.end method


# virtual methods
.method public a()Landroid/hardware/Camera$Parameters;
    .locals 3

    .line 245
    iget-object p0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 246
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 247
    const-string v1, "TXCCameraCapturer"

    const-string v2, "getCameraParameters error "

    invoke-static {v1, v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public a(FF)V
    .locals 5

    .line 266
    iget-boolean v0, p0, Lcom/tencent/liteav/capturer/a;->s:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 267
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 268
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    iget-boolean v1, p0, Lcom/tencent/liteav/capturer/a;->m:Z

    const/16 v2, 0x3e8

    if-eqz v1, :cond_1

    .line 270
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 271
    new-instance v3, Landroid/hardware/Camera$Area;

    const/high16 v4, 0x40000000    # 2.0f

    invoke-direct {p0, p1, p2, v4}, Lcom/tencent/liteav/capturer/a;->a(FFF)Landroid/graphics/Rect;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 273
    :cond_1
    iget-boolean v1, p0, Lcom/tencent/liteav/capturer/a;->n:Z

    if-eqz v1, :cond_2

    .line 274
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 275
    new-instance v3, Landroid/hardware/Camera$Area;

    const/high16 v4, 0x40400000    # 3.0f

    .line 276
    invoke-direct {p0, p1, p2, v4}, Lcom/tencent/liteav/capturer/a;->a(FFF)Landroid/graphics/Rect;

    move-result-object p1

    invoke-direct {v3, p1, v2}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    .line 277
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 279
    :cond_2
    :try_start_1
    iget-object p1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 280
    iget-object p1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :goto_0
    return-void
.end method

.method public a(I)V
    .locals 0

    .line 265
    iput p1, p0, Lcom/tencent/liteav/capturer/a;->f:I

    return-void
.end method

.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 244
    iput-object p1, p0, Lcom/tencent/liteav/capturer/a;->l:Landroid/graphics/SurfaceTexture;

    return-void
.end method

.method public a(Lcom/tencent/liteav/capturer/a$a;)V
    .locals 1

    .line 261
    sget-object v0, Lcom/tencent/liteav/capturer/a$a;->a:Lcom/tencent/liteav/capturer/a$a;

    if-eq p1, v0, :cond_0

    .line 262
    invoke-static {p1}, Lcom/tencent/liteav/capturer/a$a;->a(Lcom/tencent/liteav/capturer/a$a;)I

    move-result v0

    iput v0, p0, Lcom/tencent/liteav/capturer/a;->q:I

    .line 263
    invoke-static {p1}, Lcom/tencent/liteav/capturer/a$a;->b(Lcom/tencent/liteav/capturer/a$a;)I

    move-result v0

    iput v0, p0, Lcom/tencent/liteav/capturer/a;->r:I

    .line 264
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "set resolution "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TXCCameraCapturer"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/capturer/b;)V
    .locals 0

    .line 288
    iput-object p1, p0, Lcom/tencent/liteav/capturer/a;->e:Lcom/tencent/liteav/capturer/b;

    return-void
.end method

.method public a(ZII)V
    .locals 0

    .line 284
    iput-boolean p1, p0, Lcom/tencent/liteav/capturer/a;->p:Z

    .line 285
    iput p2, p0, Lcom/tencent/liteav/capturer/a;->q:I

    .line 286
    iput p3, p0, Lcom/tencent/liteav/capturer/a;->r:I

    .line 287
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "TXCCameraCapturer"

    const-string p2, "setCaptureBuffer %b, width: %d, height: %d"

    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public a(Z)Z
    .locals 4

    .line 248
    iput-boolean p1, p0, Lcom/tencent/liteav/capturer/a;->o:Z

    .line 249
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 250
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    if-nez v0, :cond_0

    return v1

    .line 251
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v2

    .line 252
    const-string v3, "TXCCameraCapturer"

    if-eqz p1, :cond_2

    if-eqz v2, :cond_1

    .line 253
    const-string p1, "torch"

    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 254
    const-string v2, "set FLASH_MODE_TORCH"

    invoke-static {v3, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move p1, v1

    goto :goto_1

    :cond_2
    if-eqz v2, :cond_1

    .line 256
    const-string p1, "off"

    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 257
    const-string v2, "set FLASH_MODE_OFF"

    invoke-static {v3, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x1

    .line 259
    :goto_1
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p0

    .line 260
    const-string p1, "setParameters failed."

    invoke-static {v3, p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    return v1
.end method

.method public b(Z)V
    .locals 1

    .line 87
    iput-boolean p1, p0, Lcom/tencent/liteav/capturer/a;->t:Z

    .line 88
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "set performance mode to "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TXCCameraCapturer"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public b()Z
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 91
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public b(I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v2, "TXCCameraCapturer"

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-lez v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    if-ltz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-gt p1, v3, :cond_0

    .line 33
    .line 34
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :catch_0
    move-exception p0

    .line 45
    const-string p1, "set zoom failed."

    .line 46
    .line 47
    invoke-static {v2, p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return v1

    .line 51
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v3, "invalid zoom value : "

    .line 54
    .line 55
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p1, ", while max zoom is "

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return v1

    .line 81
    :cond_1
    const-string p0, "camera not support zoom!"

    .line 82
    .line 83
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return v1
.end method

.method public c(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "vsize setHomeOrientation "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXCCameraCapturer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput p1, p0, Lcom/tencent/liteav/capturer/a;->g:I

    .line 21
    .line 22
    iget v0, p0, Lcom/tencent/liteav/capturer/a;->k:I

    .line 23
    .line 24
    add-int/lit8 v0, v0, -0x5a

    .line 25
    .line 26
    mul-int/lit8 p1, p1, 0x5a

    .line 27
    .line 28
    add-int/2addr v0, p1

    .line 29
    add-int/lit16 v0, v0, 0x168

    .line 30
    .line 31
    rem-int/lit16 v0, v0, 0x168

    .line 32
    .line 33
    iput v0, p0, Lcom/tencent/liteav/capturer/a;->j:I

    .line 34
    .line 35
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 36
    iput-boolean p1, p0, Lcom/tencent/liteav/capturer/a;->s:Z

    return-void
.end method

.method public c()Z
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 38
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 39
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 40
    const-string v0, "torch"

    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public d(Z)I
    .locals 13

    .line 1
    const-string v0, "open camera failed."

    .line 2
    .line 3
    const-string v1, "continuous-video"

    .line 4
    .line 5
    const-string v2, "auto"

    .line 6
    .line 7
    const-string v3, "TXCCameraCapturer"

    .line 8
    .line 9
    const/4 v4, -0x1

    .line 10
    :try_start_0
    const-string v5, "trtc_capture: start capture"

    .line 11
    .line 12
    invoke-static {v3, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v5, p0, Lcom/tencent/liteav/capturer/a;->l:Landroid/graphics/SurfaceTexture;

    .line 16
    .line 17
    if-nez v5, :cond_0

    .line 18
    .line 19
    const/4 p0, -0x2

    .line 20
    return p0

    .line 21
    :cond_0
    iget-object v5, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 22
    .line 23
    if-eqz v5, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->g()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception p0

    .line 30
    goto/16 :goto_6

    .line 31
    .line 32
    :catch_1
    move-exception p0

    .line 33
    goto/16 :goto_7

    .line 34
    .line 35
    :cond_1
    :goto_0
    new-instance v5, Landroid/hardware/Camera$CameraInfo;

    .line 36
    .line 37
    invoke-direct {v5}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 38
    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    move v8, v4

    .line 42
    move v9, v8

    .line 43
    move v7, v6

    .line 44
    :goto_1
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 45
    .line 46
    .line 47
    move-result v10

    .line 48
    const/4 v11, 0x1

    .line 49
    if-ge v7, v10, :cond_4

    .line 50
    .line 51
    invoke-static {v7, v5}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 52
    .line 53
    .line 54
    new-instance v10, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v12, "camera index "

    .line 60
    .line 61
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v12, ", facing = "

    .line 68
    .line 69
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget v12, v5, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 73
    .line 74
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v10

    .line 81
    invoke-static {v3, v10}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget v10, v5, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 85
    .line 86
    if-ne v10, v11, :cond_2

    .line 87
    .line 88
    if-ne v8, v4, :cond_2

    .line 89
    .line 90
    move v8, v7

    .line 91
    :cond_2
    if-nez v10, :cond_3

    .line 92
    .line 93
    if-ne v9, v4, :cond_3

    .line 94
    .line 95
    move v9, v7

    .line 96
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v7, "camera front, id = "

    .line 105
    .line 106
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-static {v3, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    new-instance v5, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string v7, "camera back , id = "

    .line 125
    .line 126
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-static {v3, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    if-ne v8, v4, :cond_5

    .line 140
    .line 141
    if-eq v9, v4, :cond_5

    .line 142
    .line 143
    move v8, v9

    .line 144
    :cond_5
    if-ne v9, v4, :cond_6

    .line 145
    .line 146
    if-eq v8, v4, :cond_6

    .line 147
    .line 148
    move v9, v8

    .line 149
    :cond_6
    iput-boolean p1, p0, Lcom/tencent/liteav/capturer/a;->d:Z

    .line 150
    .line 151
    if-eqz p1, :cond_7

    .line 152
    .line 153
    invoke-static {v8}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iput-object p1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_7
    invoke-static {v9}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 165
    .line 166
    :goto_2
    iget-object p1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 167
    .line 168
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    iget-boolean v7, p0, Lcom/tencent/liteav/capturer/a;->s:Z

    .line 177
    .line 178
    if-eqz v7, :cond_8

    .line 179
    .line 180
    if-eqz v5, :cond_8

    .line 181
    .line 182
    invoke-interface {v5, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v7

    .line 186
    if-eqz v7, :cond_8

    .line 187
    .line 188
    const-string v1, "support FOCUS_MODE_AUTO"

    .line 189
    .line 190
    invoke-static {v3, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1, v2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_8
    if-eqz v5, :cond_9

    .line 198
    .line 199
    invoke-interface {v5, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_9

    .line 204
    .line 205
    const-string v2, "support FOCUS_MODE_CONTINUOUS_VIDEO"

    .line 206
    .line 207
    invoke-static {v3, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :cond_9
    :goto_3
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getMaxNumFocusAreas()I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-lez v1, :cond_a

    .line 218
    .line 219
    iput-boolean v11, p0, Lcom/tencent/liteav/capturer/a;->m:Z

    .line 220
    .line 221
    :cond_a
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-lez v1, :cond_b

    .line 226
    .line 227
    iput-boolean v11, p0, Lcom/tencent/liteav/capturer/a;->n:Z

    .line 228
    .line 229
    :cond_b
    iget-boolean v1, p0, Lcom/tencent/liteav/capturer/a;->p:Z

    .line 230
    .line 231
    if-eqz v1, :cond_c

    .line 232
    .line 233
    const/16 v1, 0x11

    .line 234
    .line 235
    invoke-virtual {p1, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 236
    .line 237
    .line 238
    iget-object v1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 239
    .line 240
    invoke-virtual {v1, p0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 241
    .line 242
    .line 243
    :cond_c
    iget-boolean v1, p0, Lcom/tencent/liteav/capturer/a;->t:Z

    .line 244
    .line 245
    iget v2, p0, Lcom/tencent/liteav/capturer/a;->q:I

    .line 246
    .line 247
    iget v5, p0, Lcom/tencent/liteav/capturer/a;->r:I

    .line 248
    .line 249
    invoke-static {v1, v2, v5}, Lcom/tencent/liteav/capturer/a;->b(ZII)Lcom/tencent/liteav/basic/util/d;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    iget v2, v1, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 254
    .line 255
    iget v5, v1, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 256
    .line 257
    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    iget v5, v1, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 262
    .line 263
    iget v1, v1, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 264
    .line 265
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    invoke-static {p1, v2, v1}, Lcom/tencent/liteav/capturer/a;->a(Landroid/hardware/Camera$Parameters;II)Lcom/tencent/liteav/basic/util/d;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    iget v2, v1, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 274
    .line 275
    iput v2, p0, Lcom/tencent/liteav/capturer/a;->h:I

    .line 276
    .line 277
    iget v1, v1, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 278
    .line 279
    iput v1, p0, Lcom/tencent/liteav/capturer/a;->i:I

    .line 280
    .line 281
    invoke-virtual {p1, v2, v1}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 282
    .line 283
    .line 284
    iget v1, p0, Lcom/tencent/liteav/capturer/a;->f:I

    .line 285
    .line 286
    invoke-direct {p0, v1}, Lcom/tencent/liteav/capturer/a;->e(I)[I

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    if-eqz v1, :cond_d

    .line 291
    .line 292
    aget v2, v1, v6

    .line 293
    .line 294
    aget v1, v1, v11

    .line 295
    .line 296
    invoke-virtual {p1, v2, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 297
    .line 298
    .line 299
    goto :goto_4

    .line 300
    :cond_d
    iget v1, p0, Lcom/tencent/liteav/capturer/a;->f:I

    .line 301
    .line 302
    invoke-direct {p0, v1}, Lcom/tencent/liteav/capturer/a;->d(I)I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    invoke-virtual {p1, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 307
    .line 308
    .line 309
    :goto_4
    iget-boolean v1, p0, Lcom/tencent/liteav/capturer/a;->d:Z

    .line 310
    .line 311
    if-eqz v1, :cond_e

    .line 312
    .line 313
    goto :goto_5

    .line 314
    :cond_e
    move v8, v9

    .line 315
    :goto_5
    invoke-direct {p0, v8}, Lcom/tencent/liteav/capturer/a;->f(I)I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    iput v1, p0, Lcom/tencent/liteav/capturer/a;->k:I

    .line 320
    .line 321
    add-int/lit8 v1, v1, -0x5a

    .line 322
    .line 323
    iget v2, p0, Lcom/tencent/liteav/capturer/a;->g:I

    .line 324
    .line 325
    mul-int/lit8 v2, v2, 0x5a

    .line 326
    .line 327
    add-int/2addr v1, v2

    .line 328
    add-int/lit16 v1, v1, 0x168

    .line 329
    .line 330
    rem-int/lit16 v1, v1, 0x168

    .line 331
    .line 332
    iput v1, p0, Lcom/tencent/liteav/capturer/a;->j:I

    .line 333
    .line 334
    iget-object v1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 335
    .line 336
    invoke-virtual {v1, v6}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 337
    .line 338
    .line 339
    new-instance v1, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 342
    .line 343
    .line 344
    const-string v2, "vsize camera orientation "

    .line 345
    .line 346
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    iget v2, p0, Lcom/tencent/liteav/capturer/a;->k:I

    .line 350
    .line 351
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    const-string v2, ", preview "

    .line 355
    .line 356
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    iget v2, p0, Lcom/tencent/liteav/capturer/a;->j:I

    .line 360
    .line 361
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    const-string v2, ", home orientation "

    .line 365
    .line 366
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    iget v2, p0, Lcom/tencent/liteav/capturer/a;->g:I

    .line 370
    .line 371
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-static {v3, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    iget-object v1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 382
    .line 383
    iget-object v2, p0, Lcom/tencent/liteav/capturer/a;->l:Landroid/graphics/SurfaceTexture;

    .line 384
    .line 385
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 386
    .line 387
    .line 388
    iget-object v1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 389
    .line 390
    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 391
    .line 392
    .line 393
    iget-object p1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 394
    .line 395
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 396
    .line 397
    .line 398
    iget-object p0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 399
    .line 400
    invoke-virtual {p0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 401
    .line 402
    .line 403
    return v6

    .line 404
    :goto_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 405
    .line 406
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    return v4

    .line 424
    :goto_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 425
    .line 426
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 434
    .line 435
    .line 436
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    return v4
.end method

.method public d()Z
    .locals 0

    .line 444
    iget-boolean p0, p0, Lcom/tencent/liteav/capturer/a;->m:Z

    return p0
.end method

.method public e()Z
    .locals 2

    .line 172
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 173
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 174
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxNumDetectedFaces()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public f()I
    .locals 1

    .line 70
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->a()Landroid/hardware/Camera$Parameters;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 71
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    :goto_0
    iput-object v1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 25
    .line 26
    iput-object v1, p0, Lcom/tencent/liteav/capturer/a;->l:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :catch_0
    move-exception v0

    .line 32
    :try_start_1
    const-string v2, "TXCCameraCapturer"

    .line 33
    .line 34
    const-string v3, "stop capture failed."

    .line 35
    .line 36
    invoke-static {v2, v3, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iput-object v1, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/tencent/liteav/capturer/a;->l:Landroid/graphics/SurfaceTexture;

    .line 43
    .line 44
    throw v0

    .line 45
    :cond_0
    return-void
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/capturer/a;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/capturer/a;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/capturer/a;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/capturer/a;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public l()Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/capturer/a;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 0

    .line 1
    const-string p0, "TXCCameraCapturer"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "AUTO focus success"

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p1, "AUTO focus failed"

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onError(ILandroid/hardware/Camera;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "camera catch error "

    .line 4
    .line 5
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v0, "TXCCameraCapturer"

    .line 16
    .line 17
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x1

    .line 21
    if-eq p1, p2, :cond_0

    .line 22
    .line 23
    const/4 p2, 0x2

    .line 24
    if-eq p1, p2, :cond_0

    .line 25
    .line 26
    const/16 p2, 0x64

    .line 27
    .line 28
    if-ne p1, p2, :cond_1

    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/capturer/a;->e:Lcom/tencent/liteav/capturer/b;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0}, Lcom/tencent/liteav/capturer/b;->m()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/capturer/a;->e:Lcom/tencent/liteav/capturer/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/liteav/capturer/b;->a([B)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
