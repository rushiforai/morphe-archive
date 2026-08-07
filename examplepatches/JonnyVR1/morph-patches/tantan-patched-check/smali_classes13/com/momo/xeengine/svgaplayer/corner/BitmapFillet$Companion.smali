.class public final Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J0\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nH\u0002J0\u0010\r\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nH\u0002J0\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nH\u0002J0\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nH\u0002J\u001e\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0014\u001a\u00020\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Companion;",
        "",
        "()V",
        "clipBottomLeft",
        "",
        "canvas",
        "Landroid/graphics/Canvas;",
        "paint",
        "Landroid/graphics/Paint;",
        "offset",
        "",
        "width",
        "height",
        "clipBottomRight",
        "clipTopLeft",
        "clipTopRight",
        "fillet",
        "Landroid/graphics/Bitmap;",
        "bitmap",
        "roundPx",
        "corners",
        "Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Companion;-><init>()V

    return-void
.end method

.method private final clipBottomLeft(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/4 p4, 0x0

    .line 4
    sub-int v0, p5, p3

    .line 5
    .line 6
    invoke-direct {p0, p4, v0, p3, p5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private final clipBottomRight(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    sub-int v0, p4, p3

    .line 4
    .line 5
    sub-int p3, p5, p3

    .line 6
    .line 7
    invoke-direct {p0, v0, p3, p4, p5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final clipTopLeft(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V
    .locals 0

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/4 p4, 0x0

    .line 4
    invoke-direct {p0, p4, p4, p3, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final clipTopRight(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    sub-int p5, p4, p3

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p5, v0, p4, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final fillet(Landroid/graphics/Bitmap;ILcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;)Landroid/graphics/Bitmap;
    .locals 10
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v4

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 16
    .line 17
    invoke-static {v4, v5, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    new-instance v1, Landroid/graphics/Canvas;

    .line 22
    .line 23
    invoke-direct {v1, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 24
    .line 25
    .line 26
    const/4 v7, 0x0

    .line 27
    invoke-virtual {v1, v7, v7, v7, v7}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 37
    .line 38
    .line 39
    const/high16 v0, -0x1000000

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Landroid/graphics/RectF;

    .line 45
    .line 46
    int-to-float v3, v4

    .line 47
    int-to-float v8, v5

    .line 48
    const/4 v9, 0x0

    .line 49
    invoke-direct {v0, v9, v9, v3, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 50
    .line 51
    .line 52
    int-to-float v3, p2

    .line 53
    invoke-virtual {v1, v0, v3, v3, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p3}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->getBitmapFilletCorner()I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    sget-object v0, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->CORNER_ALL:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->getBitmapFilletCorner()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    xor-int/2addr p3, v0

    .line 67
    sget-object v0, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->CORNER_TOP_LEFT:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->getBitmapFilletCorner()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    and-int/2addr v0, p3

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    move-object v0, p0

    .line 77
    move v3, p2

    .line 78
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Companion;->clipTopLeft(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    move-object v0, p0

    .line 83
    move v3, p2

    .line 84
    :goto_0
    sget-object p0, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->CORNER_TOP_RIGHT:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->getBitmapFilletCorner()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    and-int/2addr p0, p3

    .line 91
    if-eqz p0, :cond_1

    .line 92
    .line 93
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Companion;->clipTopRight(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V

    .line 94
    .line 95
    .line 96
    :cond_1
    sget-object p0, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->CORNER_BOTTOM_LEFT:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->getBitmapFilletCorner()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    and-int/2addr p0, p3

    .line 103
    if-eqz p0, :cond_2

    .line 104
    .line 105
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Companion;->clipBottomLeft(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V

    .line 106
    .line 107
    .line 108
    :cond_2
    sget-object p0, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->CORNER_BOTTOM_RIGHT:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->getBitmapFilletCorner()I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    and-int/2addr p0, p3

    .line 115
    if-eqz p0, :cond_3

    .line 116
    .line 117
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Companion;->clipBottomRight(Landroid/graphics/Canvas;Landroid/graphics/Paint;III)V

    .line 118
    .line 119
    .line 120
    :cond_3
    new-instance p0, Landroid/graphics/PorterDuffXfermode;

    .line 121
    .line 122
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 123
    .line 124
    invoke-direct {p0, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, p0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 128
    .line 129
    .line 130
    new-instance p0, Landroid/graphics/Rect;

    .line 131
    .line 132
    invoke-direct {p0, v7, v7, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, p1, p0, p0, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .line 140
    .line 141
    return-object v6

    .line 142
    :catch_0
    return-object p1
.end method
