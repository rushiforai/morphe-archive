.class public Lcom/tantan/library/svga/drawer/SGVADrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0008\u0004\u0008\u0010\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J0\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00132\u0006\u0010\u0017\u001a\u00020\u0013H\u0016J\u001b\u0010\u0018\u001a\u00020\u000f2\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\u001aH\u0000\u00a2\u0006\u0002\u0008\u001bJ\u001b\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\u001a2\u0006\u0010\u0012\u001a\u00020\u0013H\u0000\u00a2\u0006\u0002\u0008\u001dR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0014\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/SGVADrawer;",
        "",
        "videoItem",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V",
        "scaleInfo",
        "Lcom/tantan/library/svga/utils/SVGAScaleInfo;",
        "getScaleInfo",
        "()Lcom/tantan/library/svga/utils/SVGAScaleInfo;",
        "spritePool",
        "Lcom/tantan/library/svga/utils/Pools$ObjectPool;",
        "Lcom/tantan/library/svga/utils/DrawerSprite;",
        "getVideoItem",
        "()Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "drawFrame",
        "",
        "canvas",
        "Landroid/graphics/Canvas;",
        "frameIndex",
        "",
        "scaleType",
        "Landroid/widget/ImageView$ScaleType;",
        "width",
        "height",
        "releaseFrameSprites",
        "sprites",
        "",
        "releaseFrameSprites$svga_lib_release",
        "requestFrameSprites",
        "requestFrameSprites$svga_lib_release",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final scaleInfo:Lcom/tantan/library/svga/utils/SVGAScaleInfo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final spritePool:Lcom/tantan/library/svga/utils/Pools$ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantan/library/svga/utils/Pools$ObjectPool<",
            "Lcom/tantan/library/svga/utils/DrawerSprite;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V
    .locals 2
    .param p1    # Lcom/tantan/library/svga/compose/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 8
    .line 9
    new-instance v0, Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->scaleInfo:Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 15
    .line 16
    new-instance v0, Lcom/tantan/library/svga/utils/Pools$ObjectPool;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getFrames()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-direct {v0, p1}, Lcom/tantan/library/svga/utils/Pools$ObjectPool;-><init>(I)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->spritePool:Lcom/tantan/library/svga/utils/Pools$ObjectPool;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;II)V
    .locals 1
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/widget/ImageView$ScaleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-object p1, p0

    .line 8
    iget-object p0, p1, Lcom/tantan/library/svga/drawer/SGVADrawer;->scaleInfo:Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 9
    .line 10
    int-to-float p2, p4

    .line 11
    int-to-float p4, p5

    .line 12
    iget-object p5, p1, Lcom/tantan/library/svga/drawer/SGVADrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 13
    .line 14
    invoke-virtual {p5}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getVideoSize()Landroid/graphics/Rect;

    .line 15
    .line 16
    .line 17
    move-result-object p5

    .line 18
    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    .line 19
    .line 20
    .line 21
    move-result p5

    .line 22
    int-to-float p5, p5

    .line 23
    iget-object p1, p1, Lcom/tantan/library/svga/drawer/SGVADrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getVideoSize()Landroid/graphics/Rect;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    int-to-float p1, p1

    .line 34
    move v0, p4

    .line 35
    move p4, p1

    .line 36
    move p1, p2

    .line 37
    move p2, v0

    .line 38
    move v0, p5

    .line 39
    move-object p5, p3

    .line 40
    move p3, v0

    .line 41
    invoke-virtual/range {p0 .. p5}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->performScaleType(FFFFLandroid/widget/ImageView$ScaleType;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final getScaleInfo()Lcom/tantan/library/svga/utils/SVGAScaleInfo;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->scaleInfo:Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getVideoItem()Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public final releaseFrameSprites$svga_lib_release(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/utils/DrawerSprite;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    check-cast p1, Ljava/lang/Iterable;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->spritePool:Lcom/tantan/library/svga/utils/Pools$ObjectPool;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/utils/Pools$ObjectPool;->release(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public final requestFrameSprites$svga_lib_release(I)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/utils/DrawerSprite;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getSpriteList$svga_lib_release()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Iterable;

    .line 8
    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_4

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/tantan/library/svga/compose/entities/SVGALayer;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    if-ltz p1, :cond_3

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getFrames()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ge p1, v4, :cond_3

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getImageKey()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    if-eqz v4, :cond_3

    .line 48
    .line 49
    const-string v5, ".matte"

    .line 50
    .line 51
    const/4 v6, 0x2

    .line 52
    const/4 v7, 0x0

    .line 53
    invoke-static {v4, v5, v7, v6, v3}, Lkotlin/text/d;->w(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-nez v4, :cond_1

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getFrames()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 68
    .line 69
    invoke-virtual {v4}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getAlpha()F

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    const/4 v5, 0x0

    .line 74
    cmpg-float v4, v4, v5

    .line 75
    .line 76
    if-gtz v4, :cond_1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    iget-object v3, p0, Lcom/tantan/library/svga/drawer/SGVADrawer;->spritePool:Lcom/tantan/library/svga/utils/Pools$ObjectPool;

    .line 80
    .line 81
    new-array v4, v7, [I

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Lcom/tantan/library/svga/utils/Pools$ObjectPool;->acquire([I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 88
    .line 89
    if-eqz v3, :cond_2

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getMatteKey()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {v3, v4}, Lcom/tantan/library/svga/utils/DrawerSprite;->setMatteKey(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getImageKey()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {v3, v4}, Lcom/tantan/library/svga/utils/DrawerSprite;->setImageKey(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getFrames()Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 114
    .line 115
    invoke-virtual {v3, v2}, Lcom/tantan/library/svga/utils/DrawerSprite;->setFrame(Lcom/tantan/library/svga/compose/entities/SVGAFrame;)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_2
    new-instance v3, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 120
    .line 121
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getMatteKey()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getImageKey()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGALayer;->getFrames()Ljava/util/List;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    check-cast v2, Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 138
    .line 139
    invoke-direct {v3, v4, v5, v2}, Lcom/tantan/library/svga/utils/DrawerSprite;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/tantan/library/svga/compose/entities/SVGAFrame;)V

    .line 140
    .line 141
    .line 142
    :cond_3
    :goto_1
    if-eqz v3, :cond_0

    .line 143
    .line 144
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_4
    return-object v1
.end method
