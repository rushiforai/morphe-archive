.class public Lcom/immomo/svgaplayer/SGVADrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/SGVADrawer$SVGADrawerSprite;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0016\u0018\u00002\u00020\u0001:\u0001\u0018B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J \u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u0018\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u001f\u0010\u0014\u001a\u000c\u0012\u0008\u0012\u00060\u0016R\u00020\u00000\u00152\u0006\u0010\u000f\u001a\u00020\u0010H\u0000\u00a2\u0006\u0002\u0008\u0017R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SGVADrawer;",
        "",
        "videoItem",
        "Lcom/immomo/svgaplayer/SVGAVideoEntity;",
        "(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V",
        "scaleEntity",
        "Lcom/immomo/svgaplayer/ScaleEntity;",
        "getScaleEntity",
        "()Lcom/immomo/svgaplayer/ScaleEntity;",
        "getVideoItem",
        "()Lcom/immomo/svgaplayer/SVGAVideoEntity;",
        "drawFrame",
        "",
        "canvas",
        "Landroid/graphics/Canvas;",
        "frameIndex",
        "",
        "scaleType",
        "Landroid/widget/ImageView$ScaleType;",
        "performScaleType",
        "requestFrameSprites",
        "",
        "Lcom/immomo/svgaplayer/SGVADrawer$SVGADrawerSprite;",
        "requestFrameSprites$svgalibrary_release",
        "SVGADrawerSprite",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private final scaleEntity:Lcom/immomo/svgaplayer/ScaleEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
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
    iput-object p1, p0, Lcom/immomo/svgaplayer/SGVADrawer;->videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 8
    .line 9
    new-instance p1, Lcom/immomo/svgaplayer/ScaleEntity;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/immomo/svgaplayer/ScaleEntity;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/immomo/svgaplayer/SGVADrawer;->scaleEntity:Lcom/immomo/svgaplayer/ScaleEntity;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;)V
    .locals 0
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
    invoke-virtual {p0, p1, p3}, Lcom/immomo/svgaplayer/SGVADrawer;->performScaleType(Landroid/graphics/Canvas;Landroid/widget/ImageView$ScaleType;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final getScaleEntity()Lcom/immomo/svgaplayer/ScaleEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SGVADrawer;->scaleEntity:Lcom/immomo/svgaplayer/ScaleEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SGVADrawer;->videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public performScaleType(Landroid/graphics/Canvas;Landroid/widget/ImageView$ScaleType;)V
    .locals 6
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/widget/ImageView$ScaleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/svgaplayer/SGVADrawer;->scaleEntity:Lcom/immomo/svgaplayer/ScaleEntity;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float v2, p1

    .line 19
    iget-object p1, p0, Lcom/immomo/svgaplayer/SGVADrawer;->videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getVideoSize()Lcom/immomo/svgaplayer/SVGARect;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGARect;->getWidth()D

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    double-to-float v3, v3

    .line 30
    iget-object p0, p0, Lcom/immomo/svgaplayer/SGVADrawer;->videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getVideoSize()Lcom/immomo/svgaplayer/SVGARect;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGARect;->getHeight()D

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    double-to-float v4, p0

    .line 41
    move-object v5, p2

    .line 42
    invoke-virtual/range {v0 .. v5}, Lcom/immomo/svgaplayer/ScaleEntity;->performScaleType(FFFFLandroid/widget/ImageView$ScaleType;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final requestFrameSprites$svgalibrary_release(I)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/immomo/svgaplayer/SGVADrawer$SVGADrawerSprite;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/svgaplayer/SGVADrawer;->videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getSprites()Ljava/util/List;

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
    if-eqz v2, :cond_3

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    if-ltz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->getFrames()Ljava/util/List;

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
    if-ge p1, v4, :cond_2

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->getFrames()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 52
    .line 53
    invoke-virtual {v4}, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;->getAlpha()D

    .line 54
    .line 55
    .line 56
    move-result-wide v4

    .line 57
    const-wide/16 v6, 0x0

    .line 58
    .line 59
    cmpg-double v4, v4, v6

    .line 60
    .line 61
    if-gtz v4, :cond_1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    new-instance v3, Lcom/immomo/svgaplayer/SGVADrawer$SVGADrawerSprite;

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->getImageKey()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v2}, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->getFrames()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 79
    .line 80
    invoke-direct {v3, p0, v4, v2}, Lcom/immomo/svgaplayer/SGVADrawer$SVGADrawerSprite;-><init>(Lcom/immomo/svgaplayer/SGVADrawer;Ljava/lang/String;Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_1
    if-eqz v3, :cond_0

    .line 84
    .line 85
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    return-object v1
.end method
