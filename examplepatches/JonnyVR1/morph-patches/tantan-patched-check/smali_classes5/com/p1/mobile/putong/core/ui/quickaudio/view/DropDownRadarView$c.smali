.class public final Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0004\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J5\u0010\u0011\u001a\u00020\u00102\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015R\"\u0010\u0005\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0016\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001bR\u0017\u0010\u0006\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001c\u0010\u0017\u001a\u0004\u0008\u001d\u0010\u0019R\u0014\u0010\u001f\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u0017R\u0014\u0010#\u001a\u00020 8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"R\u0016\u0010%\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010\u0017\u00a8\u0006&"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;",
        "",
        "Landroid/graphics/Paint;",
        "mPaint",
        "",
        "mInitAngle",
        "initProgress",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;Landroid/graphics/Paint;FF)V",
        "Landroid/graphics/Canvas;",
        "canvas",
        "progress",
        "radius",
        "rotateSpeed",
        "Landroid/graphics/Bitmap;",
        "bitmap",
        "",
        "a",
        "(Landroid/graphics/Canvas;FFFLandroid/graphics/Bitmap;)V",
        "Landroid/graphics/Paint;",
        "getMPaint",
        "()Landroid/graphics/Paint;",
        "b",
        "F",
        "getMInitAngle",
        "()F",
        "setMInitAngle",
        "(F)V",
        "c",
        "getInitProgress",
        "d",
        "initScale",
        "Landroid/graphics/RectF;",
        "e",
        "Landroid/graphics/RectF;",
        "rectF",
        "f",
        "mAngle",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Landroid/graphics/Paint;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:F

.field public final c:F

.field public final d:F

.field public final e:Landroid/graphics/RectF;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public f:F

.field public final synthetic g:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;Landroid/graphics/Paint;FF)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Paint;",
            "FF)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->g:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->b:F

    .line 12
    .line 13
    iput p4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->c:F

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    double-to-float p1, p1

    .line 20
    const p2, 0x3e99999a    # 0.3f

    .line 21
    .line 22
    .line 23
    mul-float/2addr p1, p2

    .line 24
    const p2, 0x3f19999a    # 0.6f

    .line 25
    .line 26
    .line 27
    add-float/2addr p1, p2

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->d:F

    .line 29
    .line 30
    new-instance p1, Landroid/graphics/RectF;

    .line 31
    .line 32
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->e:Landroid/graphics/RectF;

    .line 36
    .line 37
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->b:F

    .line 38
    .line 39
    const/high16 p2, 0x41a00000    # 20.0f

    .line 40
    .line 41
    sub-float/2addr p1, p2

    .line 42
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 43
    .line 44
    .line 45
    move-result-wide p2

    .line 46
    double-to-float p2, p2

    .line 47
    const/high16 p3, 0x42200000    # 40.0f

    .line 48
    .line 49
    mul-float/2addr p3, p2

    .line 50
    add-float/2addr p1, p3

    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->f:F

    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;FFFLandroid/graphics/Bitmap;)V
    .locals 7
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->g:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->g(Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, 0x43340000    # 180.0f

    .line 14
    .line 15
    const v2, 0x40490fdb    # (float)Math.PI

    .line 16
    .line 17
    .line 18
    const/16 v3, 0xff

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    cmpg-float v0, p2, v0

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->b:F

    .line 28
    .line 29
    const/high16 v4, 0x41a00000    # 20.0f

    .line 30
    .line 31
    sub-float/2addr v0, v4

    .line 32
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    double-to-float v4, v4

    .line 37
    const/high16 v5, 0x42200000    # 40.0f

    .line 38
    .line 39
    mul-float/2addr v5, v4

    .line 40
    add-float/2addr v0, v5

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->f:F

    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->a:Landroid/graphics/Paint;

    .line 44
    .line 45
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->g:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;

    .line 46
    .line 47
    invoke-virtual {v4, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->h(F)I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-virtual {v0, v4, v3, v3, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p5}, Landroid/graphics/Bitmap;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    div-int/lit8 v0, v0, 0x3

    .line 59
    .line 60
    int-to-float v0, v0

    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->g:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;

    .line 62
    .line 63
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->i(F)F

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    mul-float/2addr v0, v3

    .line 68
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->f:F

    .line 69
    .line 70
    const/high16 v4, 0x42700000    # 60.0f

    .line 71
    .line 72
    mul-float/2addr p4, v4

    .line 73
    const/high16 v4, 0x42b40000    # 90.0f

    .line 74
    .line 75
    add-float/2addr p4, v4

    .line 76
    mul-float/2addr p4, p2

    .line 77
    add-float/2addr v3, p4

    .line 78
    mul-float/2addr v3, v2

    .line 79
    div-float/2addr v3, v1

    .line 80
    goto :goto_0

    .line 81
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->a:Landroid/graphics/Paint;

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->g:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;

    .line 84
    .line 85
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->c:F

    .line 86
    .line 87
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->h(F)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-virtual {p4, v0, v3, v3, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p5}, Landroid/graphics/Bitmap;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result p4

    .line 98
    div-int/lit8 p4, p4, 0x3

    .line 99
    .line 100
    int-to-float p4, p4

    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->g:Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;

    .line 102
    .line 103
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->c:F

    .line 104
    .line 105
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView;->i(F)F

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    mul-float/2addr p4, v0

    .line 110
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->d:F

    .line 111
    .line 112
    mul-float/2addr v0, p4

    .line 113
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->f:F

    .line 114
    .line 115
    const/high16 v3, 0x43b40000    # 360.0f

    .line 116
    .line 117
    mul-float/2addr p2, v3

    .line 118
    add-float/2addr p4, p2

    .line 119
    mul-float/2addr p4, v2

    .line 120
    div-float v3, p4, v1

    .line 121
    .line 122
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->e:Landroid/graphics/RectF;

    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 125
    .line 126
    .line 127
    move-result p4

    .line 128
    div-int/lit8 p4, p4, 0x2

    .line 129
    .line 130
    int-to-float p4, p4

    .line 131
    float-to-double v1, v3

    .line 132
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    .line 133
    .line 134
    .line 135
    move-result-wide v3

    .line 136
    double-to-float v3, v3

    .line 137
    mul-float/2addr v3, p3

    .line 138
    add-float/2addr p4, v3

    .line 139
    sub-float/2addr p4, v0

    .line 140
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    div-int/lit8 v3, v3, 0x2

    .line 145
    .line 146
    int-to-float v3, v3

    .line 147
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    .line 148
    .line 149
    .line 150
    move-result-wide v4

    .line 151
    double-to-float v4, v4

    .line 152
    mul-float/2addr v4, p3

    .line 153
    add-float/2addr v3, v4

    .line 154
    sub-float/2addr v3, v0

    .line 155
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    div-int/lit8 v4, v4, 0x2

    .line 160
    .line 161
    int-to-float v4, v4

    .line 162
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    .line 163
    .line 164
    .line 165
    move-result-wide v5

    .line 166
    double-to-float v5, v5

    .line 167
    mul-float/2addr v5, p3

    .line 168
    add-float/2addr v4, v5

    .line 169
    add-float/2addr v4, v0

    .line 170
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    div-int/lit8 v5, v5, 0x2

    .line 175
    .line 176
    int-to-float v5, v5

    .line 177
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    .line 178
    .line 179
    .line 180
    move-result-wide v1

    .line 181
    double-to-float v1, v1

    .line 182
    mul-float/2addr p3, v1

    .line 183
    add-float/2addr v5, p3

    .line 184
    add-float/2addr v5, v0

    .line 185
    invoke-virtual {p2, p4, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 186
    .line 187
    .line 188
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->e:Landroid/graphics/RectF;

    .line 189
    .line 190
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/DropDownRadarView$c;->a:Landroid/graphics/Paint;

    .line 191
    .line 192
    const/4 p3, 0x0

    .line 193
    invoke-virtual {p1, p5, p3, p2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method
