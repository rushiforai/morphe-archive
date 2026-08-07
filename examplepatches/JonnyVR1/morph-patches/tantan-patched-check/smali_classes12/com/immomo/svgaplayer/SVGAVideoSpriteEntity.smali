.class public final Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0017\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;",
        "",
        "obj",
        "Lcom/immomo/svgaplayer/proto/SpriteEntity;",
        "(Lcom/immomo/svgaplayer/proto/SpriteEntity;)V",
        "frames",
        "",
        "Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;",
        "getFrames",
        "()Ljava/util/List;",
        "imageKey",
        "",
        "getImageKey",
        "()Ljava/lang/String;",
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
.field private final frames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final imageKey:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/proto/SpriteEntity;)V
    .locals 3
    .param p1    # Lcom/immomo/svgaplayer/proto/SpriteEntity;
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
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->frames:Ljava/util/List;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/immomo/svgaplayer/proto/SpriteEntity;->imageKey:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->imageKey:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/immomo/svgaplayer/proto/SpriteEntity;->frames:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x0

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/immomo/svgaplayer/proto/FrameEntity;

    .line 36
    .line 37
    new-instance v2, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    invoke-direct {v2, v1}, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;-><init>(Lcom/immomo/svgaplayer/proto/FrameEntity;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;->getShapes()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ljava/util/Collection;

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_0

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;->getShapes()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity;->isKeep()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_0

    .line 72
    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;->getShapes()Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v2, v0}, Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;->setShapes(Ljava/util/List;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->frames:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-object v0, v2

    .line 88
    goto :goto_0

    .line 89
    :cond_1
    return-void
.end method


# virtual methods
.method public final getFrames()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/svgaplayer/SVGAVideoSpriteFrameEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->frames:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getImageKey()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAVideoSpriteEntity;->imageKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
